package net.geekhour.loki.service;

import net.geekhour.loki.entity.BudgetCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
public interface IBudgetCategoryService extends IService<BudgetCategory> {

    boolean existsByName(String name);
}
