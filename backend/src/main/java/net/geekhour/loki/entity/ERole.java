package net.geekhour.loki.entity;

/**
 * ERole
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:50
 */
public enum ERole {
    ROLE_ADMIN(1L),
    ROLE_MANAGER(2L),
    ROLE_VIP(4L),
    ROLE_USER(8L),
    ROLE_DEV(16L),
    ROLE_TEST(32L),
    ROLE_GUEST(64L);

    private final Long value;

    private ERole(Long value) {
        this.value = value;
    }

    public Long getValue() {
        return value;
    }
}
