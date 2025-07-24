package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.BudgetType;
import net.geekhour.loki.service.IBudgetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@CrossOrigin
@RestController
@RequestMapping("/api/bt")
public class BudgetTypeController {

    @Autowired
    private IBudgetTypeService budgetTypeService;

    // List all budget type names
    @RequestMapping("/names")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> names() {
        List<String> budgetTypeNames = budgetTypeService.list().stream()
                .map(BudgetType::getName)
                .toList();
        return ResponseUtil.success(Map.of(
                "items", budgetTypeNames,
                "total", budgetTypeNames.size()
        ));
    }

    // List all budget types
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> list() {
        try {
            return ResponseUtil.success(budgetTypeService.list());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Create a new budget type
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> create(@RequestBody BudgetType budgetType) {
        if (budgetType.getName() == null || budgetType.getName().isEmpty()) {
            return ResponseUtil.error(400, "项目类型不能为空");
        }
        try {
            return budgetTypeService.save(budgetType)
                    ? ResponseUtil.success(budgetType)
                    : ResponseUtil.error(500, "创建项目类型失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Update an existing budget type
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> update(@RequestBody BudgetType budgetType) {
        if (budgetType.getId() == null) {
            return ResponseUtil.error(400, "项目类型ID不能为空");
        }
        try {
            return budgetTypeService.updateById(budgetType)
                    ? ResponseUtil.success(budgetType)
                    : ResponseUtil.error(500, "项目类型更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Delete a budget type by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (id == null || id <= 0) {
            return ResponseUtil.error(400, "项目类型ID不能为空");
        }

        try {
            return budgetTypeService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(500, "项目类型删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Check if a budget type exists by name
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> existsByName(@RequestBody BudgetType budgetType) {
        if (budgetType.getName() == null || budgetType.getName().isEmpty()) {
            return ResponseUtil.error(400, "项目类型不能为空");
        }
        try {
            return budgetTypeService.existsByName(budgetType.getName())
                    ? ResponseUtil.success(budgetType)
                    : ResponseUtil.error(500, "项目类型不存在");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
