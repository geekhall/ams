package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-20
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_user")
@ApiModel(value = "User对象", description = "用户")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("姓名")
    @TableField("name")
    private String name;

    @ApiModelProperty("用户名")
    @TableField("username")
    private String username;

    @ApiModelProperty("密码")
    @TableField("password")
    private String password;

    @ApiModelProperty("盐")
    @TableField("salt")
    private String salt;

    @ApiModelProperty("性别 1-男 2-女")
    @TableField("sex")
    private Boolean sex;

    @ApiModelProperty("token")
    @TableField("token")
    private String token;

    @ApiModelProperty("token过期时间")
    @TableField("token_expire_time")
    private Date tokenExpireTime;

    @ApiModelProperty("身份证号")
    @TableField("id_card")
    private String idCard;

    @ApiModelProperty("手机号")
    @TableField("phone")
    private String phone;

    @ApiModelProperty("头像")
    @TableField("avatar")
    private String avatar;

    @ApiModelProperty("年龄")
    @TableField("age")
    private Integer age;

    @ApiModelProperty("邮箱")
    @TableField("email")
    private String email;

    @ApiModelProperty("部门ID")
    @TableField("department_id")
    private Long departmentId;

    @ApiModelProperty("角色ID")
    @TableField("role_id")
    private Long roleId;

    @ApiModelProperty("状态 0-正常 1-禁用")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("是否锁定 0-否 1-是")
    @TableField("is_lock")
    private Integer isLock;

    @ApiModelProperty("是否激活 0-否 1-是")
    @TableField("is_active")
    private Integer isActive;

    @ApiModelProperty("最后登录时间")
    @TableField("last_login_time")
    private Long lastLoginTime;

    @ApiModelProperty("最后登录IP")
    @TableField("last_login_ip")
    private String lastLoginIp;

    @ApiModelProperty("地址")
    @TableField("address")
    private String address;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Long createTime;

    @ApiModelProperty("修改时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Long updateTime;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Integer deleted;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
