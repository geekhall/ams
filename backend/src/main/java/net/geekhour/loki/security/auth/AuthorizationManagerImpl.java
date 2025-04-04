package net.geekhour.loki.security.auth;

import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.AuthorizationManager;
import org.springframework.security.authorization.AuthorizationResult;
import org.springframework.stereotype.Component;

import java.util.function.Supplier;

/**
 * @author Jasper Yang
 * @create 2025/02/20 00:22
 */
@Component
public class AuthorizationManagerImpl implements AuthorizationManager {


    @Override
    public AuthorizationResult authorize(Supplier authentication, Object object) {
        return AuthorizationManager.super.authorize(authentication, object);
    }

    @Override
    public void verify(Supplier authentication, Object object) {
        AuthorizationManager.super.verify(authentication, object);
    }

    @Override
    @Deprecated
    public AuthorizationDecision check(Supplier authentication, Object object) {
        return null;
    }
}
