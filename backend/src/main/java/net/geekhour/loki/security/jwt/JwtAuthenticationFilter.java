package net.geekhour.loki.security.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.geekhour.loki.common.RedisCache;
import net.geekhour.loki.security.SecurityConstants;
import net.geekhour.loki.security.UserDetailsImpl;
import net.geekhour.loki.security.UserDetailsServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.util.Objects;


/**
 * 作用：OncePerRequestFilter 是 Spring Security 提供的一个抽象类，确保在每个请求中只执行一次特定的过滤逻辑。
 *      它是实现自定义过滤器的基础，通常用于对请求进行预处理或后处理。（实现 JWT 会用到这个接口）
 * 功能：提供了一种机制，以确保过滤器的逻辑在每个请求中只执行一次，非常适合需要对每个请求进行处理的场景。
 *      通过继承该类，可以轻松实现自定义过滤器适合用于记录日志、身份验证、权限检查等场景。
 *      通过 JWT 对用户进行身份验证，确保请求中携带的 JWT 是有效的，并根据 JWT 提供的用户信息设置认证状态。
 * 应用场景： 通常用于保护需要身份验证的 API 接口，确保只有经过认证的用户才能访问资源。
 *          该过滤器通常放置在 Spring Security 过滤链的合适位置，以确保在处理请求之前进行身份验证。
 * 实现：继承 OncePerRequestFilter 类，并重写 doFilterInternal 方法。
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:09
 */
@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private static final Logger logger = LoggerFactory.getLogger(JwtAuthenticationFilter.class);

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    private SecurityContextHolderStrategy securityContextHolderStrategy;

    @Autowired
    private RedisCache redisCache;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    @NotNull HttpServletResponse response,
                                    @NotNull FilterChain filterChain) throws ServletException, IOException {

        logger.info("JwtAuthenticationFilter.doFilterInternal:000  " );
        System.out.println("########## JwtAuthenticationFilter.doFilterInternal:000  " );
        System.out.println("Request URI: " + request.getRequestURI());
        String authHeader = request.getHeader(SecurityConstants.AUTHORIZATION_HEADER);
        System.out.println("Authorization Header: " + authHeader);
        if (!StringUtils.hasText(authHeader) || !authHeader.startsWith(SecurityConstants.TOKEN_PREFIX)) {
            // 如果没有 JWT 或格式不正确，继续执行下一个过滤器，返回。
            System.out.println("########## JwtAuthenticationFilter.doFilterInternal:001" );
            filterChain.doFilter(request, response);
            return;
        }

        // 解析JWT，获取用户信息
        String token = authHeader.substring(7);
        Claims claims = null;
        try {
            claims = JwtUtil.parseToken(token);
        } catch (ExpiredJwtException e) {
            // 返回401状态码，表示token过期，强制前端页面重新登录
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("token过期");
            return;
        }
        Long userid = Long.parseLong(claims.getSubject());
        String username = claims.get("username", String.class);
        // 从Redis中获取用户信息
        UserDetailsImpl userDetails = redisCache.getCacheObject(SecurityConstants.REDIS_KEY_PREFIX + userid);

        if (Objects.isNull(userDetails)) {
            throw new RuntimeException("用户未登录");
        }
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        usernamePasswordAuthenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));


        // 设置SecurityContextHolderStrategy
        // SpringSecurity的bug？？？
        // 在WebSecurityConfig中设置了SecurityContextHolder.setStrategyName(SecurityContextHolder.MODE_THREADLOCAL);
        // 但是如果这里不配置的话，获取到的SecurityContextHolderStrategy依然是MODE_GLOBAL;
        // 导致即使在这里设置了SpringSecurityContext，也会设置到全局的SecurityContextHolder中
        // 而在AuthorizationFilter中获取的时候却从ThreadLocal中获取不到，只能得到一个匿名的Authorization，导致授权失败。
        SecurityContextHolder.setStrategyName(SecurityContextHolder.MODE_THREADLOCAL);
//        SecurityContextHolder.getContextHolderStrategy().getContext().setAuthentication(usernamePasswordAuthenticationToken);
        SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);

        filterChain.doFilter(request, response);
    }
}
