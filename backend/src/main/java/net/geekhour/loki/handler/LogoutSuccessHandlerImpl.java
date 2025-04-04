package net.geekhour.loki.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import java.io.IOException;

/**
 * 登出成功处理器
 * 作用：在用户登出成功后，返回 JSON 格式的成功信息
 * @author Jasper Yang
 * @create 2025/02/01 14:54
 */
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"code\":200,\"message\":\"Logout Success\"}");
    }
}
