package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色权限关联 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-04
 */
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

}
