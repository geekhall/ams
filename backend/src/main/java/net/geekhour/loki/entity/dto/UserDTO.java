package net.geekhour.loki.entity.dto;

import lombok.Data;

import java.util.List;

/**
 * @author Jasper Yang
 * @create 2025/04/20 10:08
 */
@Data
public class UserDTO {
    private String id; // 这里不能使用Long类型，否则前端会发生精度丢失
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
