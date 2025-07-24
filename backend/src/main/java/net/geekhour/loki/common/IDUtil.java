package net.geekhour.loki.common;

import java.util.UUID;

/**
 * @author Jasper Yang
 * @create 2025/02/02 13:51
 */
public class IDUtil {
    /**
     * 生成一个唯一的 UUID，去掉了其中的连字符。
     * 通常用作 JWT 的 ID（jti），确保每个 JWT 都是唯一的。
     * @return 一个去掉了连字符的 UUID 字符串
     */
    public static String getUUID() {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        return uuid;
    }

    /**
     * 生成一个随机的 Long类型的正数ID
     * @return
     */
    public static Long getRandomId() {
        return Math.abs(UUID.randomUUID().getLeastSignificantBits());
    }
}
