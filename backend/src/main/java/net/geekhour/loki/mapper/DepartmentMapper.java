package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.Department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 部门 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Mapper
public interface DepartmentMapper extends BaseMapper<Department> {

    @Select("SELECT name FROM h_department WHERE id = #{departmentId} AND deleted = 0")
    String getDepartmentNameById(@Param("departmentId") Long departmentId);

    @Select("SELECT id FROM h_department WHERE name = #{name} AND deleted = 0")
    Long getDepartmentIdByName(@Param("name") String name);
}
