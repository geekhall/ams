package net.geekhour.loki.controller;

import net.geekhour.loki.common.RedisCache;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.mapper.UserRoleMapper;
import net.geekhour.loki.payload.MessageResponse;
import net.geekhour.loki.payload.RegisterRequest;
import net.geekhour.loki.security.SecurityConstants;
import net.geekhour.loki.security.UserDetailsImpl;
import net.geekhour.loki.security.jwt.JwtUtil;
import net.geekhour.loki.service.IAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Jasper Yang
 * @create 2024/11/03 22:58
 */
@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IAuthService authService;

    /**
     * 用户注册接口
     * @param registerRequest 注册请求
     * @return 注册结果
     */
    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest registerRequest) {
        if (userMapper.existsByUsername(registerRequest.getUsername())) {
            return ResponseUtil.error(400, "用户名已被使用");
        }

        if (userMapper.existsByEmail(registerRequest.getEmail())) {
            return ResponseUtil.error(400, "邮箱已被使用");
        }

        User user = authService.register(registerRequest);

        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "User registered successfully!",
                "user", user));
    }
    /**
     * 用户登录处理
     * @param loginUser 登录用户信息
     * @return 登录结果
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody User loginUser) {
        String username = loginUser.getUsername();
        String password = loginUser.getPassword();
        Authentication authentication;
        System.out.println("username: " + username);
        System.out.println("password: " + password);

        try {
            // 调用SpringSecurity的认证方法，这里会调用UserDetailsServiceImpl.loadUserByUsername()方法
            // ProviderManager.authenticate() -> AbstractUserDetailsAuthenticationProvider.authenticate()
            authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (Exception e) {
            System.out.println("username or password is incorrect");
            return ResponseUtil.error(401, e.getMessage());
        }
        if (authentication == null) {
            return ResponseUtil.error(401, "用户名或密码错误");
        }

        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        // 获取用户信息
        User savedUser = userMapper.selectByUsername(username);
        // 获取用户权限
        Collection<GrantedAuthority> authorities = user.getAuthorities();
        List<String> permissions = authorities.stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());
        // 保存用户信息到Redis
        redisCache.setCacheObject(SecurityConstants.REDIS_KEY_PREFIX + savedUser.getId(), new UserDetailsImpl(savedUser, permissions));

        // 生成JWT Token
        String token = JwtUtil.generateToken(String.valueOf(savedUser.getId()), username);
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "token", token,
                "message", "Login successfully!",
                "user", savedUser));

    }
    // Logout
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {

        // 获取当前登录用户
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        Long userid = userDetails.getUser().getId();

        // 清除Redis中的token
        redisCache.deleteObject(SecurityConstants.REDIS_KEY_PREFIX + userid);

        // 清除SecurityContextHolder中的用户信息
        SecurityContextHolder.getContext().setAuthentication(null);
        SecurityContextHolder.clearContext();

        return ResponseUtil.success("成功登出");
    }

    // GitHub OAuth2 Login
    @PostMapping("/github")
    public String index(Model model, @RegisteredOAuth2AuthorizedClient OAuth2AuthorizedClient authorizedClient,
                        @AuthenticationPrincipal OAuth2User oauth2User) {
        // TODO: 添加GitHub的OAuth2处理。这里可以获取到用户信息，然后可以根据用户信息进行登录或注册
//        System.out.println("oauth2User: " + oauth2User);
        model.addAttribute("userName", oauth2User.getName());
        model.addAttribute("clientName", authorizedClient.getClientRegistration().getClientName());
        model.addAttribute("userAttributes", oauth2User.getAttributes());
        return "index";
    }
}
