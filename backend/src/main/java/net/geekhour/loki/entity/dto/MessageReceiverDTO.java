package net.geekhour.loki.entity.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * MessageReceiverDTO
 *
 * @author lht
 * @create 2025/5/15 13:48
 */
@Data
public class MessageReceiverDTO {
    private Long id;
    @NotBlank(message = "消息ID不能为空")
    private Long messageId;
    @NotBlank(message = "用户ID不能为空")
    private Long userId;
    private Boolean isRead;
    private Boolean status;
    private Long readTime;
    private Integer version;
    private Long updateDate;
    private Byte deleted;
}
