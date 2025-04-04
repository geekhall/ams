package net.geekhour.loki.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

/**
 * @author Jasper Yang
 * @create 2024/11/03 22:38
 */
public class MD5Util {

    /**
     * MD5 encryption.
     */
    public static String encode(String str) throws NoSuchAlgorithmException {
        MessageDigest.getInstance("MD5").update(str.getBytes());
        return Base64.getEncoder().encodeToString(MessageDigest.getInstance("MD5").digest());
    }
}
