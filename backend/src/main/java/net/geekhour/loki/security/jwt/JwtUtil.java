package net.geekhour.loki.security.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import jakarta.annotation.PostConstruct;
import net.geekhour.loki.security.UserDetailsImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.security.Key;
import java.util.Date;

/**
 * @author Jasper Yang
 * @create 2024/11/03 23:04
 */
@Component
public class JwtUtil {
    private static final Logger logger = LoggerFactory.getLogger(JwtUtil.class);

    // Secret key of JWT token
    @Value("${loki.app.jwtSecret}")
    private String jwtSecretValue;

    // Expiration time of JWT token in milliseconds (1000 * 60 * 60 * 24 = 24 hours)
    @Value("${loki.app.jwtExpirationMs}")
    private Long jwtExpirationMsValue;

    @Value("${loki.app.jwtCookieName}")
    private String jwtCookieValue;

    private static Long EXPIRATION_TIME;
    private static String SECRET_KEY;
    private static String jwtCookie;

    @PostConstruct
    public void init(){
        SECRET_KEY = jwtSecretValue;
        EXPIRATION_TIME = jwtExpirationMsValue;
        jwtCookie = jwtCookieValue;
    }

    // 生成 JWT Token
    public static String  generateToken(UserDetailsImpl userDetails) {
        Key key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET_KEY));

        return Jwts.builder()
                .subject(String.valueOf(userDetails.getId()))  // 主题（ID)
                .claim("username", userDetails.getUsername()) // 自定义属性(用户名)
                .issuedAt(new Date())  // 签发时间
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))  // 过期时间
                .signWith(key)  // 签名算法和密钥
                .compact();
    }

    // 生成 JWT Token
    public static String  generateToken(String userId, String username) {
        Key key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET_KEY));

        return Jwts.builder()
                .subject(userId)  // 主题（ID)
                .claim("username", username) // 自定义属性(用户名)
                .issuedAt(new Date())  // 签发时间
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))  // 过期时间
                .signWith(key)  // 签名算法和密钥
                .compact();
    }


    /**
     * 解析 JWT
     * @param token   JWT 字符串
     * @return  如果JWT有效，返回 JWT 的 Claims 对象，其中包含了JWT的主题、签发者、签发时间、过期时间等信息。
     *          如果JWT无效，抛出异常。
     * @throws Exception
     */
    public static Claims parseToken(String token){
        SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(SECRET_KEY));

        return Jwts.parser() // 0.12.6 及以上使用 `Jwts.parser()`
                .verifyWith(key)  // 使用密钥进行验证
                .build()
                .parseSignedClaims(token)  // 解析 Token
                .getPayload();  // 获取 JWT 负载
    }

    // 验证 Token 是否有效
    public static boolean isValidToken(String token) {
        try {
            Claims claims = parseToken(token);
            System.out.println("Token 解析成功，用户ID：" + claims.getSubject());
            return true;
        } catch (ExpiredJwtException e) {
            System.out.println("Token 已过期！");
        } catch (JwtException e) {
            System.out.println("Token 无效！");
        }
        return false;
    }
    // 验证 Token 是否有效
    public static boolean validateTokenByUsername(String token, String username) {
        return username.equals(getUsernameFromToken(token)) && !isTokenExpired(token);
    }
    // 验证 Token 是否有效
    public static boolean validateTokenByUserId(String token,Long userId) {
        return userId.equals(getUserIdFromToken(token)) && !isTokenExpired(token);
    }

    private static Long getUserIdFromToken(String token) {
        return Long.parseLong(parseToken(token).getSubject());
    }

    public static String getUsernameFromToken(String token) {
        return parseToken(token).get("username", String.class);
    }

    public static boolean isTokenExpired(String token) {
        return parseToken(token).getExpiration().before(new Date());
    }

}
