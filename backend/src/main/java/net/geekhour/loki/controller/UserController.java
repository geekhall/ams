package net.geekhour.loki.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.geekhour.loki.common.Result;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.security.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    /**
     * list all users (列出所有用户)
     * @return
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:list')")
    public ResponseEntity<?> list() {
        return ResponseEntity.ok(userMapper.selectList(null));
    }

    @RequestMapping("/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> admin() {
        return ResponseEntity.ok(userMapper.selectList(null));
    }

    @RequestMapping("/user")
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> user() {
        return ResponseEntity.ok(userMapper.selectList(null));
    }

    @RequestMapping("/syslist")
    @PreAuthorize("hasAuthority('system:user:list')")
    public ResponseEntity<?> syslist() {
        return ResponseEntity.ok(userMapper.selectList(null));
    }

    /**
     * check if user exists (检查用户是否存在)
     */
    @GetMapping("/exists")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:user:exists')")
    public Result exists(@RequestParam String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        if (userMapper.exists(queryWrapper)) {
            return Result.ok().data("exists", true);
        }
        return Result.ok().data("exists", false);
    }

    @PostMapping("/logout")
    public Result logout(){
        return Result.ok();
    }

    @GetMapping("/info")
    public Result info(){
        return Result.ok().data("roles", "[admin]").data("avatar", "https://gitee.com/geekhall/pic/raw/main/img/20220410130517.png");
    }

}
