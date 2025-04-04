package net.geekhour.loki.exception;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * LokiException
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:21
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LokiException extends RuntimeException {

    @ApiModelProperty("状态码")
    private Integer code;

    @ApiModelProperty("消息")
    private String message;
}
