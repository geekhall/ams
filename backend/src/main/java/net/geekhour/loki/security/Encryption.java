package net.geekhour.loki.security;

import org.apache.commons.codec.binary.Hex;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

/**
 * 枚举式单例，线程安全，防止反序列化。Effective Java作者Josh Bloch提倡的方式。
 *
 * @author Jasper Yang
 * @create 2024/11/03 22:37
 */
public class Encryption {

    private static final String SALT_STRING="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    private static SecretKeySpec generateMySQLAESKey(final String key, final String encoding) {
        try {
            final byte[] finalKey = new byte[16];
            int i = 0;
            for (byte b : key.getBytes(encoding)) {
                finalKey[i++ % 16] ^= b;
            }
            return new SecretKeySpec(finalKey, "AES");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String encryptMysql(String str, String aesKey) {
        try {
            final Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            // 一定要用上第三个参数，设置一个随机数种子，否则在linux下某些情况加密的密文不一致
            SecureRandom secureRandom = new SecureRandom();
            secureRandom.setSeed(1L);
            cipher.init(Cipher.ENCRYPT_MODE, generateMySQLAESKey(aesKey, "UTF-8"), secureRandom);
            return Hex.encodeHexString(cipher.doFinal(str.getBytes("UTF-8"))).toUpperCase();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * MD5 encryption.
     */
    public static String encrypt_md5(String password, String salt, int times) throws NoSuchAlgorithmException {
        String result = password + salt;
        for (int i = 0; i < times; i++) {
            result = MD5Util.encode(result);
        }
        return result;
    }

    /**
     *
     */
    public static String encrypt_sha(String password, String salt, int times) throws NoSuchAlgorithmException {
        String result = password + salt;
        for (int i = 0; i < times; i++) {
            result = SHAUtil.encode(result);
        }
        return result;
    }


    /**
     * generate random salt string.
     *
     * @return salt string.
     *
     */
    public static String generateSalt( int length) {
        if (length < 1) {
            throw new IllegalArgumentException("length < 1: " + length);
        }
        String saltChars = SALT_STRING;
        StringBuilder salt = new StringBuilder();
        java.util.Random rnd = new java.util.Random();
        while (salt.length() < length) { // length of the random string.
            int index = (int) (rnd.nextFloat() * saltChars.length());
            salt.append(saltChars.charAt(index));
        }
        return salt.toString();
    }
}
