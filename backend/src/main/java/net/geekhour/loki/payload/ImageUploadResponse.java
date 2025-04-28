package net.geekhour.loki.payload;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * ImageUploadResponse
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:49
 */
@Getter
@Setter
@AllArgsConstructor
public class ImageUploadResponse {
    private String name;
    private String type;
    private String url;

    private String message;

    public ImageUploadResponse(String message) {
        this.message = message;
    }
}
