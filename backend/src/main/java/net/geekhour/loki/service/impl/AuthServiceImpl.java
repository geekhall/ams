package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.IDUtil;
import net.geekhour.loki.entity.ERole;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.UserRole;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.mapper.UserRoleMapper;
import net.geekhour.loki.payload.RegisterRequest;
import net.geekhour.loki.service.IAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Random;

/**
 * @author Jasper Yang
 * @create 2025/03/08 12:05
 */
// TODO: Implement the IAuthService interface , refactor controller and handler classes to use this service
@Service
public class AuthServiceImpl implements IAuthService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void logout() {

    }

    @Override
    public void login(String username, String password) {

    }

    @Override
    @Transactional
    public User register(RegisterRequest registerRequest) {
        // 创建用户对象
        User user = new User(registerRequest.getUsername(),
                registerRequest.getEmail(),
                passwordEncoder.encode(registerRequest.getPassword()) // 保存加密后的密码
        );

        // 生成随机盐
        Random random = new Random();
        String salt = String.valueOf(random.nextInt(1000000));
        user.setSalt(salt);
        user.setStatus(0);

        // 保存用户信息
        userMapper.insert(user);
        // 设置用户角色
        String user_id = user.getId().toString();
        UserRole userRole = new UserRole();
        userRole.setUserId(Long.parseLong(user_id));
        userRole.setRoleId(ERole.ROLE_USER.getValue());
        // 生成随机的Long类型的ID
        userRole.setId(IDUtil.getRandomId());
        userRoleMapper.insert(userRole);

        return user;
    }


}
