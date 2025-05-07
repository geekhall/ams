package net.geekhour.loki.payload;

import lombok.Data;

/**
 * MessageResponse
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:48
 */
@Data
public class MessageResponse {
    private String message;
    private Integer code;
    private Object data;
}
