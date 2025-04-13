package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.BudgetType;
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
public interface BudgetTypeMapper extends BaseMapper<BudgetType> {

    @Select("SELECT COUNT(*) FROM h_budget_type WHERE name = #{name} and deleted=0")
    int existsByName(String name);
}
