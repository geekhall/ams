package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.UserDTO;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.security.UserDetailsServiceImpl;
import net.geekhour.loki.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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


    @Override
    public void saveUserDetails(User user) {
        user.setCreateTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(System.currentTimeMillis()), ZoneId.systemDefault()));
        userDetailsService.save(user);
    }

    @Override
    public Object all() {
        return null;
    }

    @Override
    public List<UserDTO> getUserList(String name, Integer offset, Integer pageSize) {
        List<Map<String, Object>> rawData = userMapper.getUserList(name, offset, pageSize);
        List<UserDTO> userList = new ArrayList<>();
        for (Map<String, Object> data : rawData) {
            System.out.println(data);
            UserDTO userDTO = new UserDTO();
            userDTO.setId((Long) data.get("id"));
            userDTO.setName((String) data.get("name"));
            userDTO.setUsername((String) data.get("username"));
            userDTO.setPhone((String) data.get("phone"));
            userDTO.setEmail((String) data.get("email"));
            userDTO.setAge((Integer) data.get("age"));
            userDTO.setStatus((Integer) data.get("status"));
            userDTO.setGender((String) data.get("gender"));
            userDTO.setAddress( (String) data.get("address"));
            userDTO.setAvatar((String) data.get("avatar"));
            Long departmentId = (Long) data.get("department_id");
            if (departmentId != null) {
                String departmentName = departmentMapper.getDepartmentNameById(departmentId);
                userDTO.setDepartment(departmentName);
            }
            userDTO.setIsActive(data.get("is_active") != null ? ((Integer)data.get("is_active") == 1) : false);
            userDTO.setIsLocked(data.get("is_lock") != null ? ((Integer)data.get("is_active") == 1) : false);
            userDTO.setLastLoginTime(data.get("last_login_time") != null ? LocalDateTime.parse((String) data.get("last_login_time")) : null);
            userDTO.setLastLoginIp((String) data.get("last_login_ip"));
            userDTO.setCreateTime(data.get("create_time") != null ? LocalDateTime.parse((String) data.get("create_time")) : null);
            userDTO.setUpdateTime(data.get("update_time") != null ? LocalDateTime.parse((String) data.get("update_time")) : null);
            userDTO.setRoles(data.get("roles") != null ? List.of(((String) data.get("roles")).split(",")) : null);
            userDTO.setPermissions(data.get("permissions") != null ? List.of(((String) data.get("permissions")).split(",")) : null);
            userList.add(userDTO);
        }
        return userList;
    }

    @Override
    public Long countUser(String name, Integer offset, Integer pageSize) {
        return userMapper.countUser(name, offset, pageSize);
    }
}
