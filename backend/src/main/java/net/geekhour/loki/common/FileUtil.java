package net.geekhour.loki.common;

import lombok.extern.slf4j.Slf4j;
import net.geekhour.loki.controller.FileUploadController;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.zip.ZipOutputStream;

/**
 * FileUtil
 *
 * @author Jasper Yang
 * @create 2024/11/03 23:23
 */
@Slf4j
public class FileUtil {
    private static  final File uploadDirectory = new File(getRealPath());

    public static boolean saveFile(byte[] data, String filePath) throws Exception{
        if (!uploadDirectory.exists()){
            uploadDirectory.mkdirs();
        }
        File file = new File(getRealPath() + filePath);
        if (!file.exists()){
            file.createNewFile();
        }
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        fileOutputStream.write(data);
        fileOutputStream.close();
        return true;
    }

    public static boolean deleteFile(String filePath){
        File file = new File(getRealPath() + filePath);
        if (file.exists()){
            return file.delete();
        }
        return false;
    }

    public static boolean deleteFiles(List<String> filePaths){
        for (String filePath : filePaths){
            deleteFile(filePath);
        }
        return true;
    }

    public static boolean saveFile( @NotNull final String savePath,
                                    @NotNull final String fileName,
                                    @NotNull final MultipartFile file) throws Exception{
        byte[] data = readInputStream(file.getInputStream());
        File uploadFile = new File(getRealPath() + savePath + fileName);
        File uploadDirectory = new File(getRealPath() + savePath);

        synchronized (uploadDirectory) {
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdirs();
            }
            if (!uploadFile.exists()) {
                uploadFile.createNewFile();
            }
            FileOutputStream fileOutputStream = new FileOutputStream(uploadFile);
            fileOutputStream.write(data);
            fileOutputStream.close();
        }
        if (!uploadDirectory.exists()){
            uploadDirectory.mkdirs();
        }
        File saveFile = new File(getRealPath() + savePath);
        if (!saveFile.exists()){
            saveFile.mkdirs();
        }
        File saveFile1 = new File(getRealPath() + savePath + fileName);
        if (!saveFile1.exists()){
            saveFile1.createNewFile();
        }
        FileOutputStream fileOutputStream = new FileOutputStream(saveFile1);
        fileOutputStream.write(file.getBytes());
        fileOutputStream.close();
        return true;
    }

    public static byte[] readInputStream(InputStream inputStream) throws Exception {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while((len = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, len);
        }
        inputStream.close();
        return outputStream.toByteArray();
    }
    /**
     * get real path of file.
     *
     * @return real path of file without file name.
     */
    public static String getRealPath(){
        String realPath;
        String path = FileUploadController.class.getResource("/").getFile();
        int index = path.indexOf("target");
        if (index > 0){
            realPath = path.substring(0, index) + "src/main/resources/static/upload/";
        }else {
            realPath = path + "static/upload/";
        }
        return realPath;
    }

    public static File getFileByPath(String filePath){
        Path path = Paths.get(getRealPath() + filePath);
        if (Files.exists(path)){
            return path.toFile();
        }
        return null;
    }

    public static void compressFiles(List<File> sourceFiles, File targetFile) throws Exception{
        byte[] buffer = new byte[1024];
        ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(targetFile));
        for (File file : sourceFiles){

            FileInputStream in = new FileInputStream(file);
            zipOutputStream.putNextEntry(new java.util.zip.ZipEntry(file.getName()));
            int length;
            while ((length = in.read(buffer)) > 0){
                zipOutputStream.write(buffer, 0, length);
            }
            zipOutputStream.closeEntry();
            in.close();
        }
        zipOutputStream.close();
    }

    /**
     * Create directory if not exists.
     * @param writePath
     * @return
     */
    public static boolean createDirIfNotExists(String writePath) {
        if (writePath == null || writePath.isEmpty()) {
            return false;
        }
        boolean result = false;
        File directory = new File(writePath);
        if (!directory.exists()) {
            log.info("Directory {} not exists, create it.", writePath);
            result =  directory.mkdirs();
            if (result) {
                log.info("Directory {} created.", writePath);
            } else {
                log.error("Directory {} created failed.", writePath);
            }
        } else {
            log.info("Directory {} exists.", writePath);
        }
        return result;
    }
}
