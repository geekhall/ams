package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.service.IBudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@RestController
@RequestMapping("/api/budget")
public class BudgetController {
    @Autowired
    private IBudgetService budgetService;

    /**
     * List all budgets
     *
     * @return List of budgets
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:list')")
    public ResponseEntity<?> all() {
        return ResponseUtil.success(budgetService.all());
    }

    /**
     * List budgets with pagination
     *
     * @param requestBody {name: "Budget Name", pageIndex: 1, pageSize: 10}
     * @return Paginated list of budgets
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:list')")
    public ResponseEntity<?> getBudgetList(@RequestBody(required = false) String requestBody) {
        if (requestBody == null || requestBody.isEmpty()) {
            return ResponseUtil.error(400, "参数不能为空");
        }
        try {
            Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
            String budgetType = (String) requestMap.get("budgetType");
            String budgetCategory = (String) requestMap.get("budgetCategory");
            Integer innovation = null;
            if (requestMap.get("innovation") != null && !requestMap.get("innovation").toString().isEmpty()) {
                innovation = Integer.valueOf(requestMap.get("innovation").toString());
            }
            String name = (String) requestMap.get("name");
            Integer year = (Integer) requestMap.get("year");
            Integer tech = null;
            if (requestMap.get("tech") != null && !requestMap.get("tech").toString().isEmpty()) {
                tech = Integer.valueOf(requestMap.get("tech").toString());
            }
            // ← 新增：从请求中取 departmentName
            String departmentName = (String) requestMap.get("departmentName");
            Integer pageIndex = requestMap.get("pageIndex") == null ? 1
                    : Integer.parseInt(requestMap.get("pageIndex").toString());
            Integer pageSize = requestMap.get("pageSize") == null ? 10
                    : Integer.parseInt(requestMap.get("pageSize").toString());
            Integer offset = (pageIndex - 1) * pageSize;
            List<BudgetDTO> budgetList = budgetService.getBudgetList(year, budgetType, budgetCategory, innovation, name, tech, departmentName, offset, pageSize);
            Long total = budgetService.countBudgets(year,budgetType, budgetCategory, innovation, name, tech, departmentName);
            return ResponseUtil.success(Map.of(
                    "items", budgetList,
                    "total", total));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * Create a new budget
     * 
     * @param budgetDTO Budget details
     * @return ResponseEntity
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:create')")
    public ResponseEntity<?> createBudget(@RequestBody BudgetDTO budgetDTO) {
        System.out.println("BudgetController createBudget: " + budgetDTO);
        if (budgetDTO.getName() == null || budgetDTO.getName().isEmpty()) {
            return ResponseUtil.error(400, "Budget name cannot be empty");
        }
        if (budgetDTO.getDepartmentName() == null) {
            return ResponseUtil.error(400, "Department ID cannot be null");
        }
        try {
            return budgetService.createBudget(budgetDTO)
                    ? ResponseUtil.success(budgetDTO)
                    : ResponseUtil.error(500, "Failed to create budget");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * Update an existing budget
     * 
     * @param budgetDTO Updated budget details
     * @return ResponseEntity
     */
    @CrossOrigin
    @PostMapping("/update")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:update')")
    public ResponseEntity<?> updateBudget(@RequestBody BudgetDTO budgetDTO) {
        if (budgetDTO.getId() == null) {
            return ResponseUtil.error(400, "Budget ID cannot be null");
        }
        try {
            return budgetService.updateBudget(budgetDTO)
                    ? ResponseUtil.success(budgetDTO)
                    : ResponseUtil.error(500, "Failed to update budget");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * Delete a budget by ID
     * 
     * @param id Budget ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:delete')")
    public ResponseEntity<?> deleteBudget(@PathVariable Long id) {
        return budgetService.removeById(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "Budget not found");
    }

    @RequestMapping("/export")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:export')")
    public void exportToExcel(@RequestBody(required = false) String requestBody, HttpServletResponse response) {
        try {
            // 解析查询条件
            Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
            // 调用服务层生成并导出 Excel
            budgetService.exportToExcel(requestMap, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("导出 Excel 失败: " + e.getMessage());
        }
    }
}
