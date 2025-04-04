package net.geekhour.loki.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundSetOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @author Jasper Yang
 * @create 2025/02/16 18:29
 */
@SuppressWarnings(value = {"unchecked", "rawtypes"})
@Component
public class RedisCache {

    @Autowired
    public RedisTemplate redisTemplate;

    /**
     * 获取缓存
     * @param key
     * @param value
     * @param <T>
     */
    public <T> void setCacheObject(final String key, T value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 获取缓存
     * @param key
     * @param value
     * @param timeout
     * @param unit
     * @param <T>
     */
    public <T> void setCacheObject(final String key, final T value, final Long timeout, final TimeUnit unit) {
        redisTemplate.opsForValue().set(key, value, timeout, unit);
    }

    /**
     * 设置缓存失效时间
     * @param key
     * @param timeout
     * @param unit
     * @return
     */
    public boolean expire(final String key, final Long timeout, final TimeUnit unit) {
        return redisTemplate.expire(key, timeout, unit);
    }

    /**
     * 获取缓存
     * @param key
     * @return
     * @param <T>
     */
    public <T> T getCacheObject(final String key) {
        ValueOperations<String, T> operations = redisTemplate.opsForValue();
        return operations.get(key);
    }

    /**
     * 删除缓存(单个对象)
     * @param key
     */
    public boolean deleteObject(final String key) {
        return redisTemplate.delete(key);
    }

    /**
     * 删除缓存(集合对象)
     * @param keys
     */
    public void deleteObject(final Collection keys) {
        redisTemplate.delete(keys);
    }

    /**
     * 缓存List数据
     * @param key
     * @param dataList
     * @return
     * @param <T>
     */
    public <T> long setCacheList(final String key, final List<T> dataList) {
        Long count = redisTemplate.opsForList().rightPushAll(key, dataList);
        return count == null ? 0 : count;
    }

    /**
     * 获取缓存List数据
     * @param key
     * @return
     * @param <T>
     */
    public <T> List<T> getCacheList(final String key) {
        return redisTemplate.opsForList().range(key, 0, -1);
    }

    /**
     * 缓存Set数据
     * @param key
     * @param dataSet
     * @return
     * @param <T>
     */
    public <T>BoundSetOperations<String, T> setCacheSet(final String key, final Set<T> dataSet) {
        BoundSetOperations<String, T> set = redisTemplate.boundSetOps(key);
        for (T data : dataSet) {
            set.add(data);
        }
        return set;
    }

    /**
     * 获取缓存Set数据
     * @param key
     * @return
     * @param <T>
     */
    public <T> Set<T> getCacheSet(final String key) {
        return redisTemplate.opsForSet().members(key);
    }

    /**
     * 缓存Map数据
     * @param key
     * @param dataMap
     * @param <T>
     */
    public <T> void setCacheMap(final String key, final Map<String, T> dataMap) {
        if (dataMap != null) {
            redisTemplate.opsForHash().putAll(key, dataMap);
        }
    }

    /**
     * 获取缓存Map数据
     * @param key
     * @return
     * @param <T>
     */
    public <T> Map<String, T> getCacheMap(final String key) {
        return redisTemplate.opsForHash().entries(key);
    }

    /**
     * 往Hash中存入数据
     * @param key
     * @param hashKey
     * @param value
     * @param <T>
     */
    public <T> void setCacheMapValue(final String key, final String hashKey, final T value) {
        redisTemplate.opsForHash().put(key, hashKey, value);
    }

    /**
     * 获取Hash中的数据
     * @param key
     * @param hashKey
     * @return
     * @param <T>
     */
    public <T> T getCacheMapValue(final String key, final String hashKey) {
        return (T) redisTemplate.opsForHash().get(key, hashKey);
    }

    /**
     * 删除Hash中的数据
     * @param key
     * @param hashKey
     */
    public void deleteCacheMapValue(final String key, final String hashKey) {
        redisTemplate.opsForHash().delete(key, hashKey);
    }

    /**
     * 获取多个Hash中的数据
     * @param key
     * @param hashKeys
     * @return
     * @param <T>
     */
    public <T> List<T> getMultiCacheMapValue(final String key, final Collection<Object> hashKeys) {
        return redisTemplate.opsForHash().multiGet(key, hashKeys);
    }

    /**
     * 获得缓存的基本对象列表
     * @param pattern
     * @return
     */
    public Collection<String> keys(final String pattern) {
        return redisTemplate.keys(pattern);
    }

}
