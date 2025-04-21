package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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
        String name = null;
        Integer pageIndex = 1;
        Integer pageSize = 10;
        if (requestBody != null && !requestBody.isEmpty()) {
            try {
                Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
                name = (String) requestMap.get("name");
                pageIndex = requestMap.get("pageIndex") == null ? 1 :
                        Integer.parseInt(requestMap.get("pageIndex").toString());
                pageSize = requestMap.get("pageSize") == null ? 10 :
                        Integer.parseInt(requestMap.get("pageSize").toString());
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseUtil.error(500, e.getMessage());
            }
        }
        Integer offset = (pageIndex - 1) * pageSize;
        return ResponseUtil.success(userService.getUserList(name, offset, pageSize));
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
