package net.geekhour.loki.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 未认证处理类（自定义401-页面未认证处理）
 * 在SpringSecurity中，如果认证或者授权的过程中出现异常，将会被ExceptionTranslationFilter捕获到，
 *  - 如果是认证过程中出现异常，将会被封装成AuthenticationException,
 *    然后调用AuthenticationEntryPoint对象的commence方法处理这个异常。
 *  - 如果是授权过程中出现异常，将会被封装成AccessDeniedException,
 *    然后调用AccessDeniedHandler对象的handle方法处理这个异常。
 *  所以如果我们想要自定义异常处理，就需要实现AuthenticationEntryPoint接口和AccessDeniedHandler接口。
 *  然后配置给SpringSecurity，让SpringSecurity在出现异常的时候调用我们自定义的异常处理类。
 *
 * @author Jasper Yang
 * @create 2025/02/01 14:57
 */
@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException)
            throws IOException, ServletException {
        String localizedMessage = "AuthenticationEntryPointImpl.commence 001 未认证，请先登录";
        ResponseEntity responseEntity = ResponseEntity.status(HttpStatus.UNAUTHORIZED.value()).body(
                Map.of("code", HttpStatus.UNAUTHORIZED.value(), "message", localizedMessage,
                        "data", Map.of("path", request.getRequestURI()))
        );
        System.out.println("########## 401  responseEntity: " + responseEntity);
        response.getWriter().write(responseEntity.toString());
    }
}
