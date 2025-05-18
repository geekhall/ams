package net.geekhour.loki.exception;

import io.swagger.annotations.ApiModelProperty;

/**
 * LokiException
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:21
 */
public class LokiException extends RuntimeException {

    @ApiModelProperty("状态码")
    private final Integer code;

    @ApiModelProperty("消息")
    private final String message;

    public LokiException(Integer code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
