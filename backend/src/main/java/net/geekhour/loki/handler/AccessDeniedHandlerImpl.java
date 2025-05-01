package net.geekhour.loki.handler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 授权失败自定义处理类（403页面权限不足处理）
 * @author Jasper Yang
 * @create 2025/02/01 17:23
 */
@Component
public class AccessDeniedHandlerImpl implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException {
        try {
            ResponseEntity responseEntity = ResponseEntity.status(HttpStatus.FORBIDDEN).body(
                    Map.of("code", HttpStatus.FORBIDDEN.value(),
                            "message", "无权限访问",
                            "data", Map.of("path", request.getRequestURI()))
            );
            System.out.println("########## 403  responseEntity: " + responseEntity);
            response.getWriter().write(responseEntity.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
        }

    }
}
