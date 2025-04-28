package net.geekhour.loki.payload;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

/**
 * UserInfoResponse
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:49
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class UserInfoResponse {
    private Long id;
    private String username;
    private String email;
    private String avatar;
    private String token;
    private Collection<? extends GrantedAuthority> authorities;
}
