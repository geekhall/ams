package net.geekhour.loki.service.impl;

import net.geekhour.loki.service.IMessageService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

/**
 * @author Jasper Yang
 * @create 2025/02/25 12:43
 */
@Service
public class MessageServiceImpl implements IMessageService {
    @Override
    @PreAuthorize("hasAuthority('test')")
    public String getMessage() {
        return "normal message";
    }

    @Override
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String getAdminMeessage() {
        return "admin message";
    }
}
