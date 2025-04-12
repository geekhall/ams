package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.Budget;
import net.geekhour.loki.mapper.BudgetMapper;
import net.geekhour.loki.service.IBudgetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class BudgetServiceImpl extends ServiceImpl<BudgetMapper, Budget> implements IBudgetService {

}
