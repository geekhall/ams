package net.geekhour.loki.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * SpringBoot 跨域配置类
 *
 * @author Jasper Yang
 * @create 2025/02/04 23:27
 */
@Configuration
public class CORSConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // 设置允许跨域的路径
        registry.addMapping("/**")
                .allowedOriginPatterns("*") // 允许所有域名
                .allowedHeaders("*") // 允许所有请求头
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS") // 允许所有方法
//                .allowCredentials(true) // 允许携带凭证
                .maxAge(3600); // 1小时内不需要再预检（发OPTIONS请求）
    }
}
