package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.Duty;
import net.geekhour.loki.entity.dto.DutyDTO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-19
 */
@Mapper
public interface DutyMapper extends BaseMapper<Duty> {

    @Select("SELECT * FROM h_duty WHERE deleted = 0")
    List<DutyDTO> all();

    @Select("<script>" +
            "SELECT * FROM h_duty " +
            "WHERE deleted = 0 " +
            "<if test='name != null and name != \"\"'> " +
            "AND name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            "ORDER BY id " +
            "LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<DutyDTO> getDutyList(@Param("name") String name,
                              @Param("offset") Integer offset,
                              @Param("pageSize") Integer pageSize);

    @Select("<script>" +
            "SELECT COUNT(*) FROM h_duty " +
            "WHERE deleted = 0 " +
            "<if test='name != null and name != \"\"'> " +
            "AND name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    Long countDuties(@Param("name") String name);

    @Insert("INSERT INTO h_duty (date, day, night, adjust, core, core_phone, create_time, update_time, deleted) " +
            "VALUES (#{date}, #{day}, #{night}, #{adjust}, #{core}, #{corePhone}, #{createTime}, #{updateTime}, 0)")
    int insertDuty(DutyDTO dutyDTO);

    @Update("UPDATE h_duty SET date = #{date}, day = #{day}, night = #{night}, adjust = #{adjust}, " +
            "core = #{core}, core_phone = #{corePhone}, update_time = #{updateTime} " +
            "WHERE id = #{id} AND deleted = 0")
    int updateDuty(DutyDTO dutyDTO);

    @Delete("UPDATE h_duty SET deleted = 1 WHERE id = #{id}")
    int deleteDutyById(@Param("id") Long id);
}
