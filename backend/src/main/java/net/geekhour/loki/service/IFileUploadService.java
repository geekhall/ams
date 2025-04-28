package net.geekhour.loki.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

/**
 * IFileUploadService
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:24
 */
public interface IFileUploadService {
    Map<String, Object> singleFileUpload(MultipartFile file, String path) throws IOException;
}
