package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 权限
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-02-04
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_permission")
@ApiModel(value = "Permission对象", description = "权限")
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("权限名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("权限路径")
    @TableField("path")
    private String path;

    @ApiModelProperty("权限组件")
    @TableField("component")
    private String component;

    @ApiModelProperty("是否可见(0:可见,1:不可见)")
    @TableField("visible")
    private Byte visible;

    @ApiModelProperty("权限状态(0:启动,1:禁用)")
    @TableField("status")
    private Byte status;

    @ApiModelProperty("权限标识")
    @TableField("perms")
    private String perms;

    @ApiModelProperty("权限类型(1:目录,2:菜单,3:按钮)")
    @TableField("type")
    private Byte type;

    @ApiModelProperty("权限图标")
    @TableField("icon")
    private String icon;

    @ApiModelProperty("权限描述")
    @TableField("description")
    private String description;

    @ApiModelProperty("权限编码")
    @TableField("code")
    private String code;

    @ApiModelProperty("显示排序")
    @TableField("sort")
    private Integer sort;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty("修改时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Byte deleted;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
