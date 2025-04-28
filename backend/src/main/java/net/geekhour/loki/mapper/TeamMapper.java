package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.Team;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-13
 */
@Mapper
public interface TeamMapper extends BaseMapper<Team> {

    @Select("SELECT id FROM h_team WHERE name = #{name} and deleted=0")
    Long selectIdByName(@Param("name") String name);
}
