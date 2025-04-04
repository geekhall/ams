package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.geekhour.loki.entity.Permission;
import net.geekhour.loki.mapper.PermissionMapper;
import net.geekhour.loki.service.IPermissionService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

}
