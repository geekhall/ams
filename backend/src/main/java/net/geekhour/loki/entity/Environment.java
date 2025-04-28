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
 * 测试环境
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_environment")
@ApiModel(value = "Environment对象", description = "测试环境")
public class Environment extends Model<Environment> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("描述")
    @TableField("description")
    private String description;

    @ApiModelProperty("数据库类型")
    @TableField("db_type")
    private String dbType;

    @ApiModelProperty("数据库主机")
    @TableField("db_host")
    private String dbHost;

    @ApiModelProperty("数据库端口")
    @TableField("db_port")
    private String dbPort;

    @ApiModelProperty("数据库连接类型(0-SID,1-SERVICE)")
    @TableField("db_serv_type")
    private String dbServType;

    @ApiModelProperty("数据库连接名称")
    @TableField("db_serv_name")
    private String dbServName;

    @ApiModelProperty("数据库名称")
    @TableField("db_name")
    private String dbName;

    @ApiModelProperty("数据库用户名")
    @TableField("db_user")
    private String dbUser;

    @ApiModelProperty("数据库密码")
    @TableField("db_password")
    private String dbPassword;

    @ApiModelProperty("用户ID")
    @TableField("user_id")
    private Long userId;

    @ApiModelProperty("使用开始时间")
    @TableField("use_from")
    private Date useFrom;

    @ApiModelProperty("使用结束时间")
    @TableField("use_to")
    private Date useTo;

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
