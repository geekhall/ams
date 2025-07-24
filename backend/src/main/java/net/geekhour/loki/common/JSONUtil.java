package net.geekhour.loki.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.util.Map;

/**
 * @author Jasper Yang
 * @create 2025/02/01 11:38
 * JSON 工具类
 */
public class JSONUtil {

    public static final ObjectMapper OBJECT_MAPPER = createObjectMapper();

    /**
     * 创建 ObjectMapper 对象
     * @return
     */
    private static ObjectMapper createObjectMapper() {
        final ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.ALWAYS);
        // 忽略json字符串中不识别的属性
        objectMapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
        objectMapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        // add java 8 time support
        objectMapper.registerModule(new JavaTimeModule());
        return objectMapper;
    }

    /**
     * 将对象序列化为json字节数组
     * @param obj
     * @return
     */
    public static byte[] toJsonBytes(Object obj) {
        try {
            return OBJECT_MAPPER.writeValueAsBytes(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将对象序列化为json字符串
     * @param obj
     * @return
     */
    public static String toJson(Object obj) {
        try {
            return OBJECT_MAPPER.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将对象序列化为json，并写入输出流
     * @param out
     * @param obj
     */
    public static void toJson(OutputStream out, Object obj) {
        try {
            OBJECT_MAPPER.writeValue(out, obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将对象序列化为json字符串，并格式化输出
     * @param obj
     * @return
     */
    public static String toJsonWithPrettyPrint(Object obj) {
        try {
            return OBJECT_MAPPER.writerWithDefaultPrettyPrinter().writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串反序列化为对象
     * @param json
     * @param clazz
     * @return
     * @param <T>
     */
    public static <T> T toObject(String json, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.readValue(json, clazz);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串反序列化为对象
     * @param reader
     * @param typeReference
     * @return
     * @param <T>
     */
    public static <T> T toObject(Reader reader, TypeReference<T> typeReference) {
        try {
            return OBJECT_MAPPER.readValue(reader, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串输入流反序列化为对象
     * @param in
     * @param clazz
     * @return
     * @param <T>
     */
    public static <T> T toObject(InputStream in, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.readValue(in, clazz);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串输入流反序列化为对象
     * @param in
     * @param typeReference
     * @return
     * @param <T>
     */
    public static <T> T toObject(InputStream in, TypeReference<T> typeReference) {
        try {
            return OBJECT_MAPPER.readValue(in, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串反序列化为对象
     * @param json
     * @param typeReference
     * @return
     * @param <T>
     */
    public static <T> T toObject(String json, TypeReference<T> typeReference) {
        try {
            return OBJECT_MAPPER.readValue(json, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字节数组反序列化为对象
     * @param bytes
     * @param clazz
     * @return
     * @param <T>
     */
    public static <T> T toObject(byte[] bytes, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.readValue(bytes, clazz);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字节数组反序列化为对象
     * @param bytes
     * @param typeReference
     * @return
     * @param <T>
     */
    public static <T> T toObject(byte[] bytes, TypeReference<T> typeReference) {
        try {
            return OBJECT_MAPPER.readValue(bytes, typeReference);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字符串反序列化为Map
     * @param json
     * @return
     */
    public static Map<String, Object> toMap(String json) {
        try {
            return OBJECT_MAPPER.readValue(json, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json字节数组反序列化为Map
     * @param bytes
     * @return
     */
    public static Map<String, Object> toMap(byte[] bytes) {
        try {
            return OBJECT_MAPPER.readValue(bytes, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json输入流反序列化为Map
     * @param in
     * @return
     */
    public static Map<String, Object> toMap(InputStream in) {
        try {
            return OBJECT_MAPPER.readValue(in, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 将json输入流反序列化为Map
     * @param reader
     * @return
     */
    public static Map<String, Object> toMap(Reader reader) {
        try {
            return OBJECT_MAPPER.readValue(reader, new TypeReference<Map<String, Object>>() {});
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static final TypeReference<Map<String, Object>> MAP_TYPE_REFERENCE = new TypeReference<Map<String, Object>>() {};
    public static final TypeReference<Map<String, String>> STRING_MAP_TYPE_REFERENCE = new TypeReference<Map<String, String>>() {};
    public static final TypeReference<Map<String, Integer>> INTEGER_MAP_TYPE_REFERENCE = new TypeReference<Map<String, Integer>>() {};
    public static final TypeReference<Map<String, Long>> LONG_MAP_TYPE_REFERENCE = new TypeReference<Map<String, Long>>() {};
    public static final TypeReference<Map<String, Double>> DOUBLE_MAP_TYPE_REFERENCE = new TypeReference<Map<String, Double>>() {};
    public static final TypeReference<Map<String, Float>> FLOAT_MAP_TYPE_REFERENCE = new TypeReference<Map<String, Float>>() {};
    public static final TypeReference<Map<String, Boolean>> BOOLEAN_MAP_TYPE_REFERENCE = new TypeReference<Map<String, Boolean>>() {};

}
