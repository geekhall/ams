package net.geekhour.loki.security;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.geekhour.loki.entity.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * UserDetailsImpl
 *
 * @author Jasper Yang
 * {@code @create} 2024/11/03 23:14
 */
@Data
@NoArgsConstructor
public class UserDetailsImpl implements UserDetails {

    private User user;

    @JsonIgnore // 忽略序列化
    private Collection<SimpleGrantedAuthority> authorities;

    private List<String> permissions ;

    public UserDetailsImpl(User user, List<String> permissions) {
        this.user = user;
        this.permissions = permissions;
    }

    public Long getId() {
        return user.getId();
    }

    public User getUser() {
        return user;
    }

    /**
     * 获取用户权限
     * @return
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if ( authorities != null ) {
            return authorities;
        }
        authorities = permissions.stream().map(SimpleGrantedAuthority::new).collect(Collectors.toList());
        return authorities;

    }

    /**
     * 获取密码
     * @return 密码
     */
    @Override
    public String getPassword() {
        return user.getPassword();
    }

    /**
     * 获取用户名
     * @return
     */
    @Override
    public String getUsername() {
        return user.getUsername();
    }

    /**
     * 账户是否未过期
     * @return true: 未过期
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 账户是否未锁定
     * @return true: 未锁定
     */
    @Override
    public boolean isAccountNonLocked() {

        return user.getIsLock() == 0;

    }

    /**
     * 凭证是否未过期
     * @return true: 未过期
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 账户是否可用
     * @return true: 可用
     */
    @Override
    public boolean isEnabled() {
        return true;
    }

    /**
     * 重写 equals 方法
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDetailsImpl that = (UserDetailsImpl) o;
        return Objects.equals(user, that.user);
    }

}
