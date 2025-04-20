package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.User;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-20
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
