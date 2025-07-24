package net.geekhour.loki.handler;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.geekhour.loki.common.Result;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

/**
 * 认证成功处理器
 * 作用：在用户认证成功后，返回 JSON 格式的成功信息
 * @author Jasper Yang
 * @create 2025/02/01 11:30
 */
@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        Object principal = authentication.getPrincipal(); // 获取当前用户的身份信息
        Object credentials = authentication.getCredentials(); // 获取当前用户的凭证信息
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();// 获取当前用户的权限信息

        Result result = new Result();
        result.setCode(200);
        result.setMessage("Login Success");
        HashMap<String, Object> data = new HashMap<>();
        data.put("principal", principal);
        data.put("credentials", credentials);
        data.put("authorities", authorities);
        result.setData(data);
        // 将 result 对象转换为 JSON 字符串
        String json = result.toJson();

        // 返回 JSON 字符串到前端
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
        // 调用父类的方法，继续执行后续操作
        AuthenticationSuccessHandler.super.onAuthenticationSuccess(request, response, chain, authentication);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        onAuthenticationSuccess(request, response, null, authentication);
    }
}
