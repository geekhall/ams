package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.BudgetCategory;
import net.geekhour.loki.service.IBudgetCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
@RequestMapping("/api/bc")
public class BudgetCategoryController {

    @Autowired
    private IBudgetCategoryService budgetCategoryService;

    // List all budget categories
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> list() {
        try {
            List<BudgetCategory> categories = budgetCategoryService.list();
            return ResponseUtil.success(categories);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Create a new budget category
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> create(@RequestBody BudgetCategory budgetCategory) {
        if (budgetCategory.getName() == null || budgetCategory.getName().isEmpty()) {
            return ResponseUtil.error(400, "预算分类名称不能为空");
        }
        try {
            return budgetCategoryService.save(budgetCategory)
                    ? ResponseUtil.success(budgetCategory)
                    : ResponseUtil.error(500, "创建预算分类失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Update an existing budget category
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> update(@RequestBody BudgetCategory budgetCategory) {
        if (budgetCategory.getId() == null) {
            return ResponseUtil.error(400, "预算分类ID不能为空");
        }
        try {
            return budgetCategoryService.updateById(budgetCategory)
                    ? ResponseUtil.success(budgetCategory)
                    : ResponseUtil.error(500, "预算分类更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Delete a budget category by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('budget:manage')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (id == null || id <= 0) {
            return ResponseUtil.error(400, "预算分类ID不能为空");
        }
        try {
            return budgetCategoryService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(500, "预算分类删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Check if a budget category exists by name
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> existsByName(@RequestBody BudgetCategory budgetCategory) {
        if (budgetCategory.getName() == null || budgetCategory.getName().isEmpty()) {
            return ResponseUtil.error(400, "预算分类名称不能为空");
        }
        try {
            return budgetCategoryService.existsByName(budgetCategory.getName())
                    ? ResponseUtil.success("预算分类已存在")
                    : ResponseUtil.error(500, "预算分类不存在");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
