package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @author Jasper Yang
 * @create 2025/04/20 10:08
 */
@Data
@Accessors(chain = true)
public class UserDTO {

    @ApiModelProperty("ID")
    private String id; // 这里不能使用Long类型，否则前端会发生精度丢失

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("用户名")
    private String username;

    @ApiModelProperty("电话")
    private String phone;

    @ApiModelProperty("邮件")
    private String email;

    @ApiModelProperty("年龄")
    private Integer age;

    @ApiModelProperty("状态")
    private Integer status;

    @ApiModelProperty("性别")
    private String gender;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("头像")
    private String avatar;

    @ApiModelProperty("部门")
    private String department;

    @ApiModelProperty("是否启用")
    private Boolean isActive;

    @ApiModelProperty("是否锁定")
    private Boolean isLocked;

    @ApiModelProperty("上次登录时间")
    private Long lastLoginTime;

    @ApiModelProperty("上次登录IP")
    private String lastLoginIp;

    @ApiModelProperty("创建时间")
    private Long createTime;

    @ApiModelProperty("更新时间")
    private Long updateTime;

    @ApiModelProperty("角色列表")
    private List<String> roles;

    @ApiModelProperty("权限列表")
    private List<String> permissions;
}
