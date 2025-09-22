package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.BudgetCategorySummaryDTO;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.entity.dto.BudgetDepartmentSummaryDTO;
import net.geekhour.loki.entity.dto.BudgetTypeSummaryDTO;
import net.geekhour.loki.service.IBudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import net.geekhour.loki.service.IUserService; // 导入用户服务
import org.springframework.security.core.userdetails.UserDetails; // 导入Security相关类
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

    // 新增：注入用户服务
    @Autowired
    private IUserService userService;

    /**
     * List all budgets
     *
     * @return List of budgets
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
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
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> getBudgetList(@RequestBody(required = false) String requestBody) {
        if (requestBody == null || requestBody.isEmpty()) {
            return ResponseUtil.error(400, "参数不能为空");
        }
        try {
            // ========== 新增：1. 获取当前登录用户信息（部门+角色） ==========
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String username = null;
            // 从Spring Security上下文获取登录用户名
            if (auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) auth.getPrincipal();
                username = userDetails.getUsername();
            }
            // 调用用户服务，获取用户完整信息（含 department 部门、roles 角色列表）
            net.geekhour.loki.entity.dto.UserDTO currentUser = userService.getUserinfo(username);
            // 判断是否为管理员（假设管理员角色标识为 "ADMIN"，需与你系统角色一致）
            boolean isAdmin = currentUser != null
                    && currentUser.getRoles() != null
                    && currentUser.getRoles().contains("ROLE_ADMIN"); // 原来是ADMIN
            // ========== 原有逻辑：解析请求参数 ==========
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

//            // ← 新增：从请求中取 departmentName
//            String departmentName = (String) requestMap.get("departmentName");
            // ========== 新增：2. 非管理员强制覆盖部门参数 ==========
            String departmentName = null;
            if (!isAdmin && currentUser != null) {
                // 普通用户：强制用自己的部门筛选（覆盖请求中的部门参数）
                departmentName = currentUser.getDepartment();
            } else {
                // 管理员：用请求中传递的部门参数（可查全部）
                departmentName = (String) requestMap.get("departmentName");
            }
            // ========== 原有逻辑：分页参数解析 + 调用服务 ==========
            int pageIndex = requestMap.get("pageIndex") == null ? 1
                    : Integer.parseInt(requestMap.get("pageIndex").toString());
            int pageSize = requestMap.get("pageSize") == null ? 10
                    : Integer.parseInt(requestMap.get("pageSize").toString());
            Integer offset = (pageIndex - 1) * pageSize;

            // 调用服务时，传递处理后的 departmentName（普通用户已被强制填充）
            List<BudgetDTO> budgetList = budgetService.getBudgetList(year, budgetType, budgetCategory, innovation, name, tech, departmentName, offset, pageSize);
            Long total = budgetService.countBudgets(year,budgetType, budgetCategory, innovation, name, tech, departmentName);
            for (BudgetDTO budget : budgetList) {
                // 打印调试信息
                System.out.println("BudgetController getBudgetList: " + budget);
            }
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
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:manage')")
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
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:manage')")
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
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:manage')")
    public ResponseEntity<?> deleteBudget(@PathVariable Long id) {
        return budgetService.removeById(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "Budget not found");
    }

    @RequestMapping("/export")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
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

    @RequestMapping("/summary")
    @PreAuthorize("hasRole('USER') || hasAuthority('budget:view')")
    public ResponseEntity<?> getBudgetSummary() {
        try {
            // ========== 新增：1. 获取当前登录用户信息 ==========
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String username = null;
            if (auth != null && auth.isAuthenticated() && auth.getPrincipal() instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) auth.getPrincipal();
                username = userDetails.getUsername();
            }
            net.geekhour.loki.entity.dto.UserDTO currentUser = userService.getUserinfo(username);
            boolean isAdmin = currentUser != null
                    && currentUser.getRoles() != null
                    && currentUser.getRoles().contains("ROLE_ADMIN"); // 原先是ADMIN

            // ========== 新增：2. 非管理员强制筛选部门 ==========
            String departmentName = isAdmin ? null : currentUser.getDepartment();

            // ========== 修改：3. 调用带部门参数的概览查询方法 ==========
            // 注意：需在 IBudgetService 中新增带 departmentName 参数的重载方法
//            List<BudgetDepartmentSummaryDTO> budgetDepartmentSummary = budgetService.getBudgetDepartmentSummary();
//            List<BudgetTypeSummaryDTO> budgetTypeSummary = budgetService.getBudgetTypeSummary();
//            List<BudgetCategorySummaryDTO> budgetCategorySummary = budgetService.getBudgetCategorySummary();

              List<BudgetDepartmentSummaryDTO> budgetDepartmentSummary = budgetService.getBudgetDepartmentSummary(departmentName);
              List<BudgetTypeSummaryDTO> budgetTypeSummary = budgetService.getBudgetTypeSummary(departmentName);
              List<BudgetCategorySummaryDTO> budgetCategorySummary = budgetService.getBudgetCategorySummary(departmentName);

            return ResponseUtil.success(Map.of(
                    "budgetDepartmentSummary", budgetDepartmentSummary,
                    "budgetTypeSummary", budgetTypeSummary,
                    "budgetCategorySummary", budgetCategorySummary
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
