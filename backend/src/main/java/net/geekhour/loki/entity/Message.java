package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 消息表
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_message")
@ApiModel(value = "Message对象", description = "消息表")
public class Message extends Model<Message> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    @TableId(type = IdType.AUTO)
    private Long id;

    @ApiModelProperty("消息标题")
    @TableField("title")
    private String title;

    @ApiModelProperty("消息内容")
    @TableField("content")
    private String content;

    @ApiModelProperty("发送者")
    @TableField("sender")
    private String sender;

    @ApiModelProperty("发送时间")
    @TableField("send_time")
    private Long sendTime;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建日期")
    @TableField("create_date")
    private Long createDate;

    @ApiModelProperty("更新日期")
    @TableField("update_date")
    private Long updateDate;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Byte deleted;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
