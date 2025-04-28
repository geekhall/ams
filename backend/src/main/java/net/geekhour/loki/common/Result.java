package net.geekhour.loki.common;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * Result
 *
 * @author Jasper Yang
 * @create 2024/11/03 22:29
 */
@Data
public class Result implements Serializable {

    @ApiModelProperty(value = "是否成功")
    private Boolean success;

    @ApiModelProperty(value = "返回码")
    private Integer code;

    @ApiModelProperty(value = "返回消息")
    private String message;

    @ApiModelProperty(value = "返回数据")
    private Map<String, Object> data = new HashMap<String, Object>();

    public Result(){}

    public static Result ok(){
        Result result = new Result();
        result.setSuccess(true);
        result.setCode(IResultCode.SUCCESS);
        result.setMessage("成功");
        return result;
    }

    public static Result error(){
        Result result = new Result();
        result.setSuccess(false);
        result.setCode(IResultCode.ERROR);
        result.setMessage("失败");
        return result;
    }

    /**
     * 设置是否成功
     * @param success
     * @return 调用对象
     */
    public Result success(Boolean success) {
        this.setSuccess(success);
        return this;
    }

    /**
     * 设置返回消息
     * @param message 消息内容
     * @return 调用对象
     */
    public Result message(String message){
        this.setMessage(message);
        return this;
    }

    public Result code(Integer code) {
        this.setCode(code);
        return this;
    }

    public Result data(String key, Object value) {
        this.data.put(key, value);
        return this;
    }
    public Result data(Map<String, Object> data) {
        this.data = data;
        return this;
    }

    /**
     *
     * @return
     */
    public String toJson() {
        return JSONUtil.toJson(this);
    }
}
