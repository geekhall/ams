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
    private String department;
    private Boolean isActive;
    private Boolean isLocked;
    private Long lastLoginTime;
    private String lastLoginIp;
    private Long createTime;
    private Long updateTime;
    private List<String> roles;
    private List<String> permissions;
}
