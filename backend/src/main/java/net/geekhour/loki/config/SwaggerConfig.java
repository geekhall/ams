package net.geekhour.loki.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Swagger 配置类
 *
 * @author Jasper Yang
 * @create 2024/11/03 21:15
 */
@Configuration
public class SwaggerConfig{

    @Bean
    public OpenAPI springShopOpenAPI() {
        return new OpenAPI().info(
            new Info()
                .title("Loki后台系统").contact(new Contact())
                .description("Loki backend API Reference for Developers")
                .version("1.0.0")
                .license(new License().name("Apache 2.0").url("http://springdoc.org")))
                .externalDocs(new ExternalDocumentation()
                    .description("SpringShop Wiki Documentation")
                    .url("https://springshop.wiki.github.org/docs"));
    }
}
