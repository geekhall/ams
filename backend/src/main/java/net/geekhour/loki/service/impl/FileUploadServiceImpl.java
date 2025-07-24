package net.geekhour.loki.service.impl;

import lombok.extern.slf4j.Slf4j;
import net.geekhour.loki.common.FileUtil;
import net.geekhour.loki.service.IFileUploadService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * FileUploadServiceImpl
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:25
 */
@Slf4j
@Service
public class FileUploadServiceImpl implements IFileUploadService {
    @Value("${loki.app.baseDirectory}")
    private String fileBaseUrl;

    @Override
    public Map<String, Object> singleFileUpload(MultipartFile file, String path) throws IOException {
        return this.writeFile(file, path);
    }

    private Map<String, Object> writeFile(MultipartFile file, String path) throws IOException {
        String fileType = file.getContentType();
        long fileSize = file.getSize();
        String fileName = file.getOriginalFilename();
//        log.info("[文件类型] - [{}]", fileType);
//        log.info("[文件名称] - [{}]", fileName);
//        log.info("[文件大小] - [{}]", fileSize);

        // generate random filename
        String newFileName = UUID.randomUUID().toString().replace("-", "") + fileName.substring(fileName.lastIndexOf("."));
//        log.info("[新文件名] - [{}]", newFileName);

        // push the file information to the client
        Map<String, Object> result = new HashMap<>(16);
        if (path.length() > 0) {
            // get current time
            String currentTime = String.valueOf(System.currentTimeMillis());
            String writePath = fileBaseUrl + path + "/" + currentTime;
            // create the path if not exist
            Boolean createResult = FileUtil.createDirIfNotExists(writePath);
            if (!createResult) {
                result.put("code", 500);
                result.put("msg", "文件上传失败");
//                log.error("文件上传失败" + writePath);
                return result;
            }
            file.transferTo(new File(writePath + "/" + newFileName));
            String url = fileBaseUrl + path + "/" + currentTime + "/" + newFileName;
            result.put("url", url);

        } else {
            result.put("url", fileBaseUrl + newFileName);
        }
        result.put("code", 200);
        result.put("msg", "文件上传成功");
        result.put("contentType", file.getContentType());
        result.put("fileSize", fileSize);
        result.put("fileName", fileName);
        return result;
    }
}
