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
 * 消息接收记录表
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_message_receiver")
@ApiModel(value = "MessageReceiver对象", description = "消息接收记录表")
public class MessageReceiver extends Model<MessageReceiver> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("消息ID")
    @TableField("message_id")
    private Long messageId;

    @ApiModelProperty("接收用户ID")
    @TableField("user_id")
    private Long userId;

    @ApiModelProperty("是否已读：0-未读，1-已读")
    @TableField("is_read")
    private Boolean isRead;

    @ApiModelProperty("状态：0-正常，1-已删除")
    @TableField("status")
    private Boolean status;

    @ApiModelProperty("阅读时间")
    @TableField("read_time")
    private Long readTime;

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
        return null;
    }
}
