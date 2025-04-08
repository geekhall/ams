package net.geekhour.loki.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.Instant;

/**
 * @author Jasper Yang
 * @create 2025/04/08 22:51
 */
@Component
public class LokiMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        // 自动填充 create_date 字段
        this.strictInsertFill(metaObject, "createDate", Long.class, Instant.now().toEpochMilli());
        // 自动填充 create_time 字段
        this.strictInsertFill(metaObject, "createTime", Long.class, Instant.now().toEpochMilli());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 自动填充 update_date 字段
        this.strictUpdateFill(metaObject, "updateDate", Long.class, Instant.now().toEpochMilli());
        // 自动填充 update_time 字段
        this.strictUpdateFill(metaObject, "updateTime", Long.class, Instant.now().toEpochMilli());
    }
}
