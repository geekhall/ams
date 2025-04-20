package net.geekhour.loki.entity.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Jasper Yang
 * @create 2025/04/20 10:08
 */
@Data
public class UserDTO {
    private Long id;
    private String name;
    private String username;
    private String phone;
    private String email;
    private Integer age;
    private Integer status;
    private String gender;
    private String address;
    private String avatar;
    private String role;
    private String department;
    private Boolean isActive;
    private Boolean isLocked;
    private LocalDateTime lastLoginTime;
    private String lastLoginIp;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private List<String> roles;
    private List<String> permissions;
}
