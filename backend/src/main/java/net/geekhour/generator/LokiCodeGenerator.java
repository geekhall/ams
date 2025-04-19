package net.geekhour.generator;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.fill.Column;
import com.baomidou.mybatisplus.generator.fill.Property;
import com.baomidou.mybatisplus.annotation.FieldFill;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/**
 * @author Jasper Yang
 * @create 2025/04/04 21:50
 */

public class LokiCodeGenerator {
    public static void main(String[] args) {
        System.out.println("Loki Code Generator is running...");
        String username = System.getenv("LOKI_USERNAME");
        String password = System.getenv("LOKI_PASSWORD");
        String url = "jdbc:mysql://localhost:3326/loki?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai";

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("URL: " + url);
        List<String> includes = new ArrayList<String>();
        includes.add("h_duty");

        StrategyConfig strategyConfig = new StrategyConfig.Builder()
                .entityBuilder()
                .disableSerialVersionUID()
                .enableChainModel()
                .enableRemoveIsPrefix()
                .enableTableFieldAnnotation()
                .enableActiveRecord()
                .versionColumnName("version")
                .versionPropertyName("version")
                .logicDeleteColumnName("deleted")
                .logicDeletePropertyName("deleteFlag")
                .naming(NamingStrategy.no_change)
                .columnNaming(NamingStrategy.underline_to_camel)
                .addSuperEntityColumns("id", "created_by", "created_time", "updated_by", "updated_time")
                .addTableFills(new Column("create_time", FieldFill.INSERT))
                .addTableFills(new Property("update_time", FieldFill.INSERT_UPDATE))
                .idType(IdType.AUTO)
                .build();

        FastAutoGenerator.create(url, username, password)
                // 全局配置
                .globalConfig(builder -> {
                    builder.author("Jasper Yang")           // 设置作者
                            .enableSwagger()                // 开启 swagger 模式
                            .dateType(DateType.ONLY_DATE)   // 设置日期类型
                            .outputDir(System.getProperty("user.dir") + "/generator/src/main/java"); // 指定输出目录
                })
                // 数据源配置
                .dataSourceConfig(builder ->
                        builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                            // 这里需要引入mybatis-plus-boot-starter，否则无法获取到TYPE_CODE类型；
                            int typeCode = metaInfo.getJdbcType().TYPE_CODE;
                            if (typeCode == Types.SMALLINT) {
                                // 自定义类型转换
                                return DbColumnType.INTEGER;
                            }
                            return typeRegistry.getColumnType(metaInfo);
                        })
                )
                // 包配置
                .packageConfig(builder ->
                        builder.parent("net.geekhour")          // 设置父包名
                                .moduleName("loki")             // 设置父包模块名
                                .entity("entity")               // Entity包名
                                .service("service")             // Service包名
                                .serviceImpl("service.impl")    // ServiceImpl包名
                                .controller("controller")       // Controller包名
                                .mapper("mapper")               // Mapper包名
                                .xml("mapper")                  // Mapper XML包名
                                .pathInfo(Collections.singletonMap(OutputFile.xml,
                                        System.getProperty("user.dir") + "/generator/src/main/resources/mapper")) // 设置mapperXml生成路径
                )
                // 策略配置
                .strategyConfig(builder ->
                                builder.addInclude(includes) // 设置需要生成的表名
                                        .addTablePrefix("h_") // 设置过滤表前缀
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        // 以下为Entity配置
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        .entityBuilder()                            // Entity配置
                                        .enableFileOverride()                       // 开启文件覆盖
                                        .enableLombok()                             // 开启Lombok支持
                                        .logicDeletePropertyName("deleted")         // 逻辑删除字段名
                                        .enableChainModel()                         // 开启链式模型
                                        .enableRemoveIsPrefix()                     // 开启去除is前缀
                                        .enableTableFieldAnnotation()               // 开启字段注解
                                        .enableActiveRecord()                       // 开启ActiveRecord模式
                                        .versionColumnName("version")               // 版本号字段名
                                        .versionPropertyName("version")             // 版本号属性名
                                        .logicDeleteColumnName("deleted")                   // 逻辑删除字段名
                                        .logicDeletePropertyName("1")                       // 逻辑删除属性值
                                        .naming(NamingStrategy.underline_to_camel)          // 数据库表映射到实体的命名策略，下划线转驼峰
                                        .columnNaming(NamingStrategy.underline_to_camel)    // 数据库表中字段映射到实体的命名策略，下划线转驼峰
                                        .addSuperEntityColumns("id", "created_by", "created_time", "updated_by", "updated_time")    // 设置父类公共字段
                                        .addTableFills(new Column("create_time", FieldFill.INSERT)) // 设置填充字段
                                        .addTableFills(new Property("updateTime", FieldFill.INSERT_UPDATE)) // 设置填充字段
                                        .formatFileName("%s")                       // 设置Entity实体类文件名格式（保持与表名相同）
                                        // 设置ID类型，如果设置成IdType.ASSIGN_UUID，数据库中对应的ID字段需要设置成varchar(32)
                                        .idType(IdType.AUTO)                        // ID为自增，需数据库中对应的ID字段设置成自增
                                        .naming(NamingStrategy.underline_to_camel)  // 数据库表映射到实体的命名策略，下划线转驼峰
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        // 以下为Controller配置
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        .controllerBuilder()                // Controller配置
                                        .formatFileName("%sController")     // 设置Controller文件名格式
                                        .enableRestStyle()                  // 开启RestController风格
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        // 以下为Mapper配置
                                        //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
                                        .mapperBuilder()                    // Mapper配置
                                        .enableBaseColumnList()             // 会在Mapper XML中生成通用查询结果列，建议开启
                                        .enableBaseResultMap()              // 会在Mapper XML中生成所有的字段映射，建议开启
                                        .enableMapperAnnotation()           // 开启Mapper注解
                                        .formatMapperFileName("%sMapper")   // 设置Mapper文件名格式
                                        .formatXmlFileName("%sMapper")      // 设置Mapper XML文件名格式
                )

                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();

    }
}
