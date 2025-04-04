package net.geekhour.loki.handler;

import net.geekhour.loki.common.Result;
import net.geekhour.loki.exception.LokiException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * GlobalExceptionHandler
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:20
 */
//@RestControllerAdvice // 暂时注释掉，因为会拦截SpringSecurity的ResponseEntity返回
public class GlobalExceptionHandler {

    Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 全局异常处理
     * @param e Exception
     * @return 返回信息
     */
    @ExceptionHandler(Exception.class) // 指定出现什么异常执行该方法
    @ResponseBody
    public Result error(Exception e){
        logger.error(e.getMessage());
        e.printStackTrace();
        return Result.error().message("全局异常");
    }


    /**
     * 特定异常处理
     * @param e Exception
     * @return 返回信息
     */
    @ExceptionHandler(ArithmeticException.class) // 指定出现什么异常执行该方法
    @ResponseBody
    public Result error(ArithmeticException e){
        logger.error(e.getMessage());
        e.printStackTrace();
        return Result.error().message("算术异常");
    }

    /**
     * 自定义异常处理
     * @param e Exception
     * @return 返回信息
     */
    @ExceptionHandler(LokiException.class) // 指定出现什么异常执行该方法
    @ResponseBody
    public Result error(LokiException e){
        logger.error(e.getMessage());
        e.printStackTrace();
        return Result.error().code(e.getCode()).message(e.getMessage());
    }
}
