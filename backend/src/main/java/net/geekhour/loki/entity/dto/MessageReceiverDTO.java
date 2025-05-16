package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * MessageReceiverDTO
 *
 * @author lht
 * @create 2025/5/15 13:48
 */
@Getter
@Setter
@Accessors(chain = true)
public class MessageReceiverDTO {

    @ApiModelProperty("ID")
    private String id;

    @NotBlank(message = "消息ID不能为空")
    @ApiModelProperty("消息ID")
    private Long messageId;

    @NotBlank(message = "用户ID不能为空")
    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty("是否已读")
    private Boolean isRead;

    @ApiModelProperty("状态")
    private Boolean status;

    @ApiModelProperty("已读时间")
    private Long readTime;

    @ApiModelProperty("版本")
    private Integer version;

    @ApiModelProperty("更新日期")
    private Long updateDate;

    @ApiModelProperty("是否删除")
    private Byte deleted;
}
