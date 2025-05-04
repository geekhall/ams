package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import net.geekhour.loki.common.IDUtil;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.UserDTO;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.mapper.RoleMapper;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.mapper.UserRoleMapper;
import net.geekhour.loki.security.Encryption;
import net.geekhour.loki.security.UserDetailsServiceImpl;
import net.geekhour.loki.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

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

    @Autowired
    UserMapper userMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Resource
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${loki.user.default-password}")
    private String defaultPassword;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void saveUserDetails(User user) {
        userDetailsService.save(user);
    }

    @Override
    public Object all() {
        return null;
    }

    @Override
    public List<UserDTO> getUserList(String username, Integer offset, Integer pageSize) {
        List<Map<String, Object>> rawData = userMapper.getUserList(username, offset, pageSize);
        List<UserDTO> userList = new ArrayList<>();
        rawData.forEach(data -> userList.add(mapToUserDTO(data)));
        return userList;
    }

    @Override
    public Long countUser(String username, Integer offset, Integer pageSize) {
        return userMapper.countUser(username, offset, pageSize);
    }

    @Override
    @Transactional
    public boolean updateUser(UserDTO userDTO) {
        System.out.println("### UserServiceImpl.updateUser: " + userDTO);
        User selectedUser = userMapper.selectById(userDTO.getId());
        System.out.println("### UserServiceImpl.updateUser userDTO.getId(): " + userDTO.getId());
        System.out.println("### UserServiceImpl.updateUser selectedUser: " + selectedUser);
        if (selectedUser == null) {
            System.out.println("### UserServiceImpl.updateUser: User not found");
            return false;
        }
        if (!selectedUser.getUsername().equals(userDTO.getUsername()) &&
                userMapper.checkUsernameExists(userDTO.getUsername())) {
            System.out.println("### UserServiceImpl.updateUser: Username already exists");
            return false; // Username already exists
        }
        if (selectedUser.getPhone() != null) {
            if (!selectedUser.getPhone().equals(userDTO.getPhone()) &&
                    userMapper.checkPhoneExists(userDTO.getPhone())) {
                System.out.println("### UserServiceImpl.updateUser: Phone number already exists");
                return false; // Phone number already exists
            }
        }
        if (selectedUser.getEmail() != null) {
            if (!selectedUser.getEmail().equals(userDTO.getEmail()) &&
                    userMapper.checkEmailExists(userDTO.getEmail())) {
                System.out.println("### UserServiceImpl.updateUser: Email already exists");
                return false; // Email already exists
            }
        }
        User user = mapToUser(userDTO);
        // user.setUpdateTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(System.currentTimeMillis()),
        // ZoneId.systemDefault()));
        if (user == null) {
            System.out.println("### UserServiceImpl.updateUser: Mapping failed");
            return false; // Mapping failed
        }

        int rowsAffected = userMapper.updateById(user);
        return rowsAffected > 0;
    }

    @Override
    @Transactional
    public boolean addUser(UserDTO userDTO) {
        if (userMapper.checkUsernameExists(userDTO.getUsername())) {
            System.out.println("### UserServiceImpl.addUser: Username already exists");
            return false; // 用户名已存在
        }
        if (userDTO.getPhone() != null && userMapper.checkPhoneExists(userDTO.getPhone())) {
            System.out.println("### UserServiceImpl.addUser: Phone number already exists");
            return false; // 手机号已存在
        }
        if (userDTO.getEmail() != null && userMapper.checkEmailExists(userDTO.getEmail())) {
            System.out.println("### UserServiceImpl.addUser: Email already exists");
            return false; // 邮箱已存在
        }
        User user = mapToUser(userDTO);
        if (user == null) {
            System.out.println("### UserServiceImpl.addUser: Mapping failed");
            return false; // 映射失败
        }
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(defaultPassword)); // 设置默认密码
        }
        if (user.getSalt() == null || user.getSalt().isEmpty()) {
            user.setSalt(Encryption.generateSalt(6)); // 设置默认盐
        }
        Long id = IDUtil.getRandomId();
        System.out.println("### UserServiceImpl.addUser: Generated ID: " + id);
        user.setId(id);
        userDTO.getRoles().forEach(role -> {
            System.out.println("### UserServiceImpl.addUser: Role: " + role);
            Long roleId = roleMapper.getIdByName(role);
            if (roleId != null) {
                userRoleMapper.insertUserRole(id, roleId);
            }
        });
        int rowsAffected = userMapper.insert(user);
        return rowsAffected > 0;
    }

    private User mapToUser(UserDTO userDTO) {
        User user = new User();
        if (userDTO.getId() != null && !userDTO.getId().isEmpty()){
            user.setId(Long.valueOf(userDTO.getId()));
        }
        user.setName(userDTO.getName());
        user.setUsername(userDTO.getUsername());
        user.setPhone(userDTO.getPhone());
        user.setEmail(userDTO.getEmail());
        user.setAge(userDTO.getAge());
        user.setStatus(userDTO.getStatus());
        String gender = userDTO.getGender();
        if (gender != null) {
            user.setGender(gender.equals("男"));
        }
        user.setAddress(userDTO.getAddress());
        user.setAvatar(userDTO.getAvatar());
        Long departmentId = departmentMapper.getDepartmentIdByName(userDTO.getDepartment());
        if (departmentId != null) {
            user.setDepartmentId(departmentId);
        }
        user.setIsLock(userDTO.getIsLocked() ? 1 : 0);
        user.setIsActive(userDTO.getIsActive() ? 1 : 0);
        user.setLastLoginTime(userDTO.getLastLoginTime());
        user.setLastLoginIp(userDTO.getLastLoginIp());
        return user;
    }

    private UserDTO mapToUserDTO(Map<String, Object> data) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(String.valueOf(data.get("id")));
        userDTO.setName((String) data.get("name"));
        userDTO.setUsername((String) data.get("username"));
        userDTO.setPhone((String) data.get("phone"));
        userDTO.setEmail((String) data.get("email"));
        userDTO.setAge((Integer) data.get("age"));
        userDTO.setStatus((Integer) data.get("status"));
        userDTO.setGender((Boolean.TRUE.equals(data.get("gender"))) ? "男" : "女");
        userDTO.setAddress((String) data.get("address"));
        userDTO.setAvatar((String) data.get("avatar"));
        userDTO.setDepartment(Optional.ofNullable(data.get("department_id"))
                .map(id -> departmentMapper.getDepartmentNameById((Long) id))
                .orElse(null));
        userDTO.setIsActive(data.get("is_active") != null && ((Integer) data.get("is_active") == 1));
        userDTO.setIsLocked(data.get("is_lock") != null && ((Integer) data.get("is_lock") == 1));
        userDTO.setLastLoginTime((Long) data.get("last_login_time"));
        userDTO.setLastLoginIp((String) data.get("last_login_ip"));
        userDTO.setCreateTime((Long) data.get("create_time"));
        userDTO.setUpdateTime((Long) data.get("update_time"));
        userDTO.setRoles(data.get("roles") != null ? List.of(((String) data.get("roles")).split(",")) : null);
        userDTO.setPermissions(data.get("permissions") != null ? List.of(((String) data.get("permissions")).split(",")) : null);
        return userDTO;
    }


}
