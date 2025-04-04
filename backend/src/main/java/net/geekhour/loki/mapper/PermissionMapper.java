package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 权限 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {
    @Select("select perms from h_permission where id in (select permission_id from h_role_permission where role_id in (select role_id from h_user_role where user_id = #{userId}))")
    List<String> selectPermissionByUserId(Long userId);
}
