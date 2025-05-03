package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.UserDTO;
import net.geekhour.loki.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@CrossOrigin()
@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * get all users (获取所有用户)
     * @return
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:all')")
    public ResponseEntity<?> all() {
        return ResponseUtil.success(userService.all());
    }

    /**
     * 分页查询用户
     * @param requestBody {name: "用户名", pageIndex: 1, pageSize: 10}
     * @return 分页后的用户列表
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:list')")
    public ResponseEntity<?> getUserList(@RequestBody(required = false) String requestBody) {
        if (requestBody == null || requestBody.isEmpty()) {
            return ResponseUtil.error(400, "参数不能为空");
        }
        try {
            Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
            String name = (String) requestMap.get("name");
            Integer pageIndex = requestMap.get("pageIndex") == null ? 1 :
                    Integer.parseInt(requestMap.get("pageIndex").toString());
            Integer pageSize = requestMap.get("pageSize") == null ? 10 :
                    Integer.parseInt(requestMap.get("pageSize").toString());
            Integer offset = (pageIndex - 1) * pageSize;
            List<UserDTO> userList = userService.getUserList(name, offset, pageSize);
            Long total = userService.countUser(name, offset, pageSize);
            return ResponseUtil.success(Map.of(
                    "items", userList,
                    "total", total
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:update')")
    public ResponseEntity<?> updateUser(@RequestBody UserDTO userDTO) {
        System.out.println("updateUser: " + userDTO);
        if (userDTO.getId() == null) {
            System.out.println("用户ID不能为空");
            return ResponseUtil.error(400, "用户ID不能为空");
        }
        try {
            System.out.println("updateUser: " + userDTO);
            return userService.updateUser(userDTO)
                    ? ResponseUtil.success(userDTO)
                    : ResponseUtil.error(500, "更新用户失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    @PostMapping("/add")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:add')")
    public ResponseEntity<?> addUser(@RequestBody UserDTO userDTO) {
        System.out.println("addUser: " + userDTO);
        try {
            return userService.addUser(userDTO)
                    ? ResponseUtil.success(userDTO)
                    : ResponseUtil.error(500, "添加用户失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * 删除用户
     * @param id 用户ID
     * @return 删除结果
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:delete')")
    public ResponseEntity<?> deleteUser(@PathVariable Long id) {
        try {
            return userService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(404, "用户不存在");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
