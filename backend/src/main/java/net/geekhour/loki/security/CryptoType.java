package net.geekhour.loki.security;

/**
 * @author Jasper Yang
 * @create 2024/11/03 22:39
 */
public enum CryptoType {
    MD5("MD5"),
    SHA1("SHA-1"),
    SHA256("SHA-256"),
    SHA512("SHA-512");

    private String value;

    CryptoType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
