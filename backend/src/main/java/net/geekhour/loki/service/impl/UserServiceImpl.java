package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.security.UserDetailsServiceImpl;
import net.geekhour.loki.service.IUserService;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Resource
    private UserDetailsServiceImpl userDetailsService;


    @Override
    public void saveUserDetails(User user) {
        user.setCreateTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(System.currentTimeMillis()), ZoneId.systemDefault()));
        userDetailsService.save(user);
    }
}
