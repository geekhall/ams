package net.geekhour.loki.common;

/**
 * @author Jasper Yang
 * @create 2025/02/02 11:36
 */
public class StringUtil {
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
}
