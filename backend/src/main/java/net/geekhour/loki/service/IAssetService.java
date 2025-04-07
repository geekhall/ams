package net.geekhour.loki.service;

import net.geekhour.loki.entity.Asset;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.http.ResponseEntity;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
public interface IAssetService extends IService<Asset> {

    ResponseEntity<?> all();

    ResponseEntity<?> getAssetList(Integer pageIndex, Integer pageSize, String name);
}
