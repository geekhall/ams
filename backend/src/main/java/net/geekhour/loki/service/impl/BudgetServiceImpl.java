package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.StringUtil;
import net.geekhour.loki.entity.Budget;
import net.geekhour.loki.entity.BudgetCategory;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.mapper.*;
import net.geekhour.loki.service.IBudgetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
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
    TeamMapper teamMapper;

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
        if (budgetDTO.getDepartmentName() == null || budgetDTO.getDepartmentName().isEmpty()) {
            return false;
        }
        if (budgetDTO.getBudgetType() == null || budgetDTO.getBudgetType().isEmpty()) {
            return false;
        }
        if (budgetDTO.getBudgetCategory() == null || budgetDTO.getBudgetCategory().isEmpty()) {
            return false;
        }
        Budget budget = mapToBudget(budgetDTO);
        if (budget == null) {
            return false;
        }
        return budgetMapper.insert(budget) > 0;
    }


    @Override
    @Transactional
    public boolean updateBudget(BudgetDTO budgetDTO) {
        Budget existingBudget = budgetMapper.selectById(budgetDTO.getId());
        if (existingBudget == null) {
            return false;
        }
        if (!existingBudget.getName().equals(budgetDTO.getName()) &&
                budgetMapper.checkBudgetNameExists(budgetDTO.getName())) {
            return false; // Budget name must be unique
        }
        Budget budget = mapToBudget(budgetDTO);
        if (budget == null) {
            return false;
        }
        return budgetMapper.updateById(budget) > 0;
    }

    private Budget mapToBudget(BudgetDTO budgetDTO) {
        Long budgetTypeId = budgetTypeMapper.selectIdByName(budgetDTO.getBudgetType());
        if (budgetTypeId == null) {
            return null;
        }
        Long budgetCategoryId = budgetCategoryMapper.selectIdByName(budgetDTO.getBudgetCategory());
        if (budgetCategoryId == null) {
            return null;
        }
        Long departmentId = departmentMapper.selectIdByName(budgetDTO.getDepartmentName());
        if (departmentId == null) {
            return null;
        }
        Long teamId;
        if (budgetDTO.getTeamName() != null && budgetDTO.getTeamName().isEmpty()) {
            teamId = teamMapper.selectIdByName(budgetDTO.getTeamName());
            if (teamId == null) {
                return null;
            }
        } else {
            teamId = 0L;
        }
        Budget budget = new Budget();
        if (budgetDTO.getId() != null && !budgetDTO.getId().isEmpty()) {
            budget.setId(Long.valueOf(budgetDTO.getId()));
        }
        budget.setYear(budgetDTO.getYear());
        budget.setName(budgetDTO.getName());
        budget.setDescription(budgetDTO.getDescription());
        budget.setType(budgetTypeId);
        budget.setCategory(budgetCategoryId);
        budget.setInno(budgetDTO.getInno().equals("是") ? true : false);
        budget.setAmount(budgetDTO.getAmount());
        budget.setDepartmentId(departmentId);
        budget.setTeamId(teamId);
        budget.setPriority(budgetDTO.getPriority());
        budget.setBusinessPriority(budgetDTO.getBusinessPriority());
        budget.setBusinessDescription(budgetDTO.getBusinessDescription());
        Long startDateTimestamp = LocalDate.parse(budgetDTO.getPlannedStartDate())
                .atStartOfDay(ZoneId.systemDefault())
                .toInstant()
                .toEpochMilli();
        budget.setPlannedStartDate(startDateTimestamp);
        budget.setRemark(budgetDTO.getRemark());
        return budget;
    }

}
