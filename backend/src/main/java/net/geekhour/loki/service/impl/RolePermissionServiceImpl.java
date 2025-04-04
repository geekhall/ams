package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.geekhour.loki.entity.RolePermission;
import net.geekhour.loki.mapper.RolePermissionMapper;
import net.geekhour.loki.service.IRolePermissionService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色权限关联 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-03-08
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements IRolePermissionService {

}
