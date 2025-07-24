package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.Role;

/**
 * <p>
 * 角色 服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
public interface IRoleService extends IService<Role> {

    boolean existsByName(String name);
}
