package net.geekhour.loki.payload;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Jasper Yang
 * @create 2024/11/03 23:06
 */
@Setter
@Getter
public class LoginRequest {
    @NotBlank
    private String username;

    @NotBlank
    private String password;
}
