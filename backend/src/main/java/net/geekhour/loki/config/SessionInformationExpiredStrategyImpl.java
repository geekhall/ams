package net.geekhour.loki.config;

import jakarta.servlet.ServletException;
import net.geekhour.loki.common.Result;
import org.springframework.security.web.session.SessionInformationExpiredEvent;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;

import java.io.IOException;

/**
 * Session 过期处理器
 *
 * @author Jasper Yang
 * @create 2025/02/01 17:18
 */
public class SessionInformationExpiredStrategyImpl implements SessionInformationExpiredStrategy {
    @Override
    public void onExpiredSessionDetected(SessionInformationExpiredEvent event) throws IOException, ServletException {
        Result result = new Result();
        result.setCode(-1);
        result.setMessage("Session Expired");
        event.getResponse().setContentType("application/json;charset=UTF-8");
        event.getResponse().getWriter().write(result.toJson());
    }
}
