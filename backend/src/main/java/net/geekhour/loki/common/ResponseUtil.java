package net.geekhour.loki.common;

import org.springframework.http.ResponseEntity;

import java.util.Map;

/**
 * @author Jasper Yang
 * @create 2025/04/13 11:08
 */
public class ResponseUtil {

    public static ResponseEntity<?> success(Object data) {
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", data
        ));
    }

    public static ResponseEntity<?> error(int code, String message) {
        return ResponseEntity.status(code).body(Map.of(
                "code", code,
                "message", message,
                "data", ""
        ));
    }
}
