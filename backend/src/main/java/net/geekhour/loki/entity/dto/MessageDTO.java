package net.geekhour.loki.entity.dto;

import lombok.Data;

/**
 * MessageDTO
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:48
 */
@Data
public class MessageDTO {
  private Long id;
  private String title;
  private String content;
  private String sender;
  private Long sendTime;
  private String status;
}
