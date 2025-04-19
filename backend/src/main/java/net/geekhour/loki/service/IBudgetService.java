package net.geekhour.loki.service;

import net.geekhour.loki.entity.Budget;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.BudgetDTO;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
public interface IBudgetService extends IService<Budget> {

    List<Budget>  all();

    List<BudgetDTO> getBudgetList(Integer year, String budgetType, String budgetCategory, Integer innovation, String name, Integer tech, Integer offset, Integer pageSize);

    Long countBudgets(Integer year, String budgetType, String budgetCategory, Integer innovation, String name, Integer tech);

    boolean createBudget(BudgetDTO budgetDTO);

    boolean updateBudget(BudgetDTO budgetDTO);

    void exportToExcel(Map<String, Object> requestMap, HttpServletResponse response);
}
