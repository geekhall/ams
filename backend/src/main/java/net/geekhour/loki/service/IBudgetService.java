package net.geekhour.loki.service;

import net.geekhour.loki.entity.Budget;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.BudgetDTO;

import java.util.List;

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

    List<BudgetDTO> getBudgetList(Integer year, Integer offset, Integer pageSize, String name);

    Long countBudgets(Integer year, String name);

    boolean createBudget(BudgetDTO budgetDTO);

    boolean updateBudget(BudgetDTO budgetDTO);
}
