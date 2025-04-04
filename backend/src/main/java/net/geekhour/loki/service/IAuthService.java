package net.geekhour.loki.service;

import net.geekhour.loki.entity.User;
import net.geekhour.loki.payload.RegisterRequest;

/**
 * @author Jasper Yang
 * @create 2025/03/08 12:01
 */
public interface IAuthService {
    /**
     * 登出
     */
    void logout();

    /**
     * 登录
     */
    void login(String username, String password);


    /**
     * 注册
     */
    User register(RegisterRequest registerRequest);

}
