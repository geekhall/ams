package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.service.IBudgetService;
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
            String name = (String) requestMap.get("name");
            Integer year = (Integer) requestMap.get("year");
            Integer pageIndex = requestMap.get("pageIndex") == null ? 1 :
                    Integer.parseInt(requestMap.get("pageIndex").toString());
            Integer pageSize = requestMap.get("pageSize") == null ? 10 :
                    Integer.parseInt(requestMap.get("pageSize").toString());
            Integer offset = (pageIndex - 1) * pageSize;
            List<BudgetDTO> budgetList = budgetService.getBudgetList(year, offset, pageSize, name);
            Long total = budgetService.countBudgets(year, name);
            return ResponseUtil.success(Map.of(
                    "items", budgetList,
                    "total", total
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * Create a new budget
     * @param budgetDTO Budget details
     * @return ResponseEntity
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:budget:create')")
    public ResponseEntity<?> createBudget(@RequestBody BudgetDTO budgetDTO) {
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
     * @param budgetDTO Updated budget details
     * @return ResponseEntity
     */
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
}
