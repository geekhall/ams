package net.geekhour.loki.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * MybatisPlus 配置类
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:56
 */
@Configuration
@MapperScan("net.geekhour.loki.mapper")
public class MybatisPlusConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 版本存在问题，PaginationInnerInterceptor已经被替代？待更正
//         阻止恶意或误操作的全表更新删除
//        interceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());
        // 添加乐观锁插件
//        interceptor.addInnerInterceptor(new OptimisticLockerInnerInterceptor());
//
//        // 创建并配置分页插件
//        PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor(DbType.MYSQL);
//        paginationInnerInterceptor.setDbType(DbType.MYSQL);
//        paginationInnerInterceptor.setOverflow(true);
//
//        // 添加分页插件
//        interceptor.addInnerInterceptor(paginationInnerInterceptor);
        return interceptor;
    }
}