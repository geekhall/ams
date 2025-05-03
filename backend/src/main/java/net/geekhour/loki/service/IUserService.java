package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.UserDTO;

import java.util.List;

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

    Object all();

    List<UserDTO> getUserList(String username, Integer offset, Integer pageSize);

    Long countUser(String username, Integer offset, Integer pageSize);

    boolean updateUser(UserDTO userDTO);

    boolean addUser(UserDTO userDTO);
}
