package net.geekhour.loki.controller;

import net.geekhour.loki.service.IFileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * FileUploadController
 *
 * @author Jasper Yang
 * @create 2024/11/04 00:07
 */
@CrossOrigin()
@RestController
@RequestMapping("/api/upload")
public class FileUploadController {
    @Autowired
    IFileUploadService fileUploadService;

    @RequestMapping("/file")
    public Map<String, Object> singleFileUploadToPath(@RequestParam("file") MultipartFile file,
                                                      @RequestParam("path") String path)
            throws IOException {
        Map<String, Object> result = new HashMap<>(16);
        return fileUploadService.singleFileUpload(file, path);
    }
}
