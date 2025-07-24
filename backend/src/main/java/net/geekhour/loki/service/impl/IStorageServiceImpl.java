package net.geekhour.loki.service.impl;

import io.github.classgraph.Resource;
import net.geekhour.loki.service.IStorageService;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

/**
 * @author Jasper Yang
 * @create 2024/11/03 22:41
 */
public class IStorageServiceImpl implements IStorageService {
    @Override
    public void init() {

    }

    @Override
    public void store(MultipartFile file) {

    }

    @Override
    public Stream<Path> loadAll() {
        return Stream.empty();
    }

    @Override
    public Path load(String filename) {
        return null;
    }

    @Override
    public Resource loadAsResource(String filename) {
        return null;
    }

    @Override
    public void deleteAll() {

    }
}
