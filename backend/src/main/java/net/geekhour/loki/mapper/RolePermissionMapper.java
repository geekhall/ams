package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.RolePermission;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色权限关联 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-03-08
 */
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

}
