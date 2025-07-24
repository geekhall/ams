package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.BudgetType;
import net.geekhour.loki.mapper.BudgetTypeMapper;
import net.geekhour.loki.service.IBudgetTypeService;
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
public class BudgetTypeServiceImpl extends ServiceImpl<BudgetTypeMapper, BudgetType> implements IBudgetTypeService {

    @Autowired
    BudgetTypeMapper budgetTypeMapper;

    @Override
    public boolean existsByName(String name) {
        return budgetTypeMapper.existsByName(name) > 0;
    }
}
