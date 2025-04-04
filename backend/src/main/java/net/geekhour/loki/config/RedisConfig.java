package net.geekhour.loki.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cache.CacheManager;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.time.Duration;

/**
 * Redis 配置类
 * @author Jasper Yang
 * @create 2025/02/02 00:34
 */
public class RedisConfig {

     @Bean
     public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
         RedisTemplate<String, Object> template = new RedisTemplate<>();
         template.setConnectionFactory(redisConnectionFactory);
         Jackson2JsonRedisSerializer<Object> serializer = new Jackson2JsonRedisSerializer<>(Object.class);
         ObjectMapper objectMapper = new ObjectMapper();
         objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
         objectMapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
//         serializer.setObjectMapper(objectMapper);
         template.setValueSerializer(serializer);
         template.setKeySerializer(new StringRedisSerializer());
         template.afterPropertiesSet();
         return template;
     }

     @Bean
     public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
         RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig()
                 .entryTtl(Duration.ofDays(1))
                 .disableCachingNullValues()
                 .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(new GenericJackson2JsonRedisSerializer()));
         return RedisCacheManager.builder(RedisCacheWriter.nonLockingRedisCacheWriter(redisConnectionFactory))
                 .cacheDefaults(redisCacheConfiguration).build();
     }

     @Bean
     public KeyGenerator keyGenerator() {
         return (target, method, params) -> {
             StringBuilder sb = new StringBuilder();
             sb.append(target.getClass().getName());
             sb.append(method.getName());
             for (Object obj : params) {
                 sb.append(obj.toString());
             }
             return sb.toString();
         };
     }

}
