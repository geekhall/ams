package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * MessageDTO
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:48
 */
@Getter
@Setter
@Accessors(chain = true)
public class MessageDTO {

  @ApiModelProperty("ID")
  private String id;

  @ApiModelProperty("标题")
  private String title;

  @ApiModelProperty("内容")
  private String content;

  @ApiModelProperty("发送人")
  private String sender;

  @ApiModelProperty("类型")
  private Long type;

  @ApiModelProperty("发送时间")
  private Long sendTime;

  @ApiModelProperty("状态")
  private String status;
}
