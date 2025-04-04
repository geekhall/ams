package net.geekhour.loki.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.geekhour.loki.common.Result;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.HashMap;

/**
 * 认证失败处理器
 * @author Jasper Yang
 * @create 2025/02/01 13:53
 */
@Component
public class AuthenticationFailureHandlerImpl implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String localizedMessage = exception.getLocalizedMessage();

        Result result = new Result();
        result.setCode(-1);
        result.setMessage("Login Failed: " + localizedMessage);
        HashMap<String, Object> data = new HashMap<>();
        result.setData(data);
        // 将 result 对象转换为 JSON 字符串
        String json = result.toJson();

        // 返回 JSON 字符串到前端
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(json);
        // 调用父类的方法，继续执行后续操作


        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"code\":401,\"message\":\"Login Failure\"}");
    }
}
