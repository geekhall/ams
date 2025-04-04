package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.User;

/**
 * <p>
 * 用户 服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
public interface IUserService extends IService<User> {

    void saveUserDetails(User user);

}
