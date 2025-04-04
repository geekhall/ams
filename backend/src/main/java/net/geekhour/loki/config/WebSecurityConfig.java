package net.geekhour.loki.config;

import jakarta.annotation.PostConstruct;
import net.geekhour.loki.handler.AccessDeniedHandlerImpl;
import net.geekhour.loki.handler.AuthenticationEntryPointImpl;
import net.geekhour.loki.security.jwt.JwtAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;

import java.util.List;

/**
 * Spring Security 配置类
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:11
 */
@Configuration
@EnableWebSecurity // 启用 Spring Security 的自定义配置
@EnableMethodSecurity(prePostEnabled = true) // 启用方法级别的权限控制
public class WebSecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Autowired
    private AuthenticationEntryPointImpl authenticationEntryPoint;

    @Autowired
    private AccessDeniedHandlerImpl accessDeniedHandler;

    public WebSecurityConfig(JwtAuthenticationFilter jwtAuthenticationFilter) {
        this.jwtAuthenticationFilter = jwtAuthenticationFilter;
    }

    @PostConstruct
    public void commonSecurityConfig(){
        SecurityContextHolder.setStrategyName(SecurityContextHolder.MODE_THREADLOCAL);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();// 使用 BCrypt 进行密码加密
    }

    @Bean
    public AuthenticationManager authenticationManager(
            AuthenticationConfiguration authenticationConfiguration
    ) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // 配置 HttpSecurity
        http.csrf(csrf -> csrf.disable()); // 关闭 CSRF 保护，前后端分离不需要
        // 基于Token，不需要Session，无状态的服务，不需要记录用户状态
        http.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        // 开启授权保护
        http.authorizeHttpRequests(auth -> auth
            // 开放登录、注册、公共页面，不需要认证
            .requestMatchers("/api/auth/**").permitAll()
            .requestMatchers("/swagger-ui/**").permitAll()
            // 其他请求都需要认证，任何端点都需要至少经过 security context 的验证才能允许。
            .anyRequest().authenticated()
        );
        // 添加自定义的 JWT过滤器，用于解析请求中的 Token 并进行认证
        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        // 配置异常处理器
        http.exceptionHandling(exceptionHandling -> exceptionHandling
            // 未认证处理类
            .authenticationEntryPoint(authenticationEntryPoint)
            // 授权失败处理类
            .accessDeniedHandler(accessDeniedHandler)
        );

        // 允许跨域访问
//        http.cors(); // Deprecated from Spring Security 6.1
        http.cors( cors -> {
            CorsConfiguration config = new CorsConfiguration();
            // When allowCredentials is true, allowedOrigins cannot contain the special value "*"
            // since that cannot be set on the "Access-Control-Allow-Origin" response header.
//            config.setAllowedOrigins(List.of("*")); // 允许所有域名访问 Error,替换为下面的方法
            config.setAllowedOriginPatterns(List.of("*")); // 允许所有域名访问
//            config.setAllowedOriginPatterns(List.of("http://localhost:4000")); // 允许指定域名访问
            config.setAllowedMethods(List.of("*")); // 允许所有方法
            config.setAllowedHeaders(List.of("POST", "GET", "PUT", "DELETE", "OPTIONS")); // 允许所有请求头
            config.setAllowCredentials(true); // 允许携带凭证
            cors.configurationSource(request -> config); // 设置跨域配置
        });

        return http.build();
    }
}
