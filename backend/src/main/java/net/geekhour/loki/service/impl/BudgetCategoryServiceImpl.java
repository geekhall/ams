package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.BudgetCategory;
import net.geekhour.loki.mapper.BudgetCategoryMapper;
import net.geekhour.loki.service.IBudgetCategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Service
public class BudgetCategoryServiceImpl extends ServiceImpl<BudgetCategoryMapper, BudgetCategory> implements IBudgetCategoryService {

    @Autowired
    BudgetCategoryMapper budgetCategoryMapper;

    @Override
    public boolean existsByName(String name) {
        return budgetCategoryMapper.countByName(name) > 0;
    }
}
