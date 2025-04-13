package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.BudgetCategory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Mapper
public interface BudgetCategoryMapper extends BaseMapper<BudgetCategory> {

    @Select("SELECT COUNT(*) FROM budget_category WHERE name = #{name} and deleted=0")
    int countByName(String name);
}
