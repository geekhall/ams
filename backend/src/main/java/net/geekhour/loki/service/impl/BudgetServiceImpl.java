package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.StringUtil;
import net.geekhour.loki.entity.Budget;
import net.geekhour.loki.entity.BudgetCategory;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.mapper.BudgetCategoryMapper;
import net.geekhour.loki.mapper.BudgetMapper;
import net.geekhour.loki.mapper.BudgetTypeMapper;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.service.IBudgetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Service
public class BudgetServiceImpl extends ServiceImpl<BudgetMapper, Budget> implements IBudgetService {

    @Autowired
    BudgetMapper budgetMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    BudgetTypeMapper budgetTypeMapper;

    @Autowired
    BudgetCategoryMapper budgetCategoryMapper;

    @Override
    public List<Budget> all() {
        return budgetMapper.selectList(null);
    }

    @Override
    public List<BudgetDTO> getBudgetList(Integer year, Integer offset, Integer pageSize, String name) {
        return budgetMapper.getBudgetList(year, offset, pageSize, name);
    }

    @Override
    public Long countBudgets(Integer year, String name) {
        return budgetMapper.countBudgets(year, name);
    }

    @Override
    @Transactional
    public boolean createBudget(BudgetDTO budgetDTO) {
        if (budgetDTO.getName() == null || budgetDTO.getName().isEmpty()) {
            return false;
        }
        return false;
    }

    @Override
    public boolean updateBudget(BudgetDTO budgetDTO) {
        return false;
    }
}
