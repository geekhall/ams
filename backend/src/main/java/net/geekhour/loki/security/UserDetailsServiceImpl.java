package net.geekhour.loki.security;

import net.geekhour.loki.entity.User;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsPasswordService;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 用户详情服务实现类
 * 注意SpringSecurity中实现UserDetailsService的类在容器中只能有一个，
 * 否则会因为死循环而导致StackOverflowError
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:14
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService , UserDetailsPasswordService {

    @Autowired
    UserMapper userMapper;

    /**
     * 根据用户名查询用户的信息以及对应的权限信息，并封装成UserDetails对象返回。
     * 如果用户不存在，则抛出UsernameNotFoundException异常。
     * @param username the username identifying the user whose data is required.
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        // 查询用户信息
        User user = userMapper.selectByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not exists!");
        }
        // 查询用户角色和权限信息
        List<String> roles = userMapper.getRolesByUsername(username);
        List<String> permissions = userMapper.getPermissionsByUsername(username);
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }

        for (String permission : permissions) {
            authorities.add(new SimpleGrantedAuthority(permission));
        }
        boolean isNonLocked = !userMapper.isLocked(user.getId());
        boolean isEnabled = !userMapper.isEnabled(user.getId());


        return new org.springframework.security.core.userdetails.User(user.getUsername(),
                user.getPassword(),
                isEnabled,
                true,
                true,
                isNonLocked,
                authorities);
    }

    @Override
    public UserDetails updatePassword(UserDetails user, String newPassword) {
        return null;
    }

    public void createUser(UserDetails userDetails) {
        User user = new User();
        user.setUsername(userDetails.getUsername());
        user.setPassword(userDetails.getPassword());
        userMapper.insert(user);
    }

    public void save(User user) {
        userMapper.updateById(user);
    }

    public void deleteUser(String username) {
    }

    public void changePassword(String oldPassword, String newPassword) {
    }

}
