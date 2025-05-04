package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 角色 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    @Select("select * from h_role where id = #{role_id} and deleted = 0")
    Role findByRoleId(Long role_id);

    Integer addRole(Long userId, Long roleId);
    List<Role> getRolesByUserId(Long userId);

    @Select("select count(*) > 0 from h_role where name = #{name} and deleted = 0")
    boolean existsByName(String name);

    @Select("select id from h_role where name = #{name} and deleted = 0")
    Long getIdByName(@Param("name") String name);
}
