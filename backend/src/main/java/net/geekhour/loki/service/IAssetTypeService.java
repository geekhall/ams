package net.geekhour.loki.service;

import net.geekhour.loki.entity.Asset;
import net.geekhour.loki.entity.AssetType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
public interface IAssetTypeService extends IService<AssetType> {
    List<AssetType> list();

    boolean deleteAssetType(Long id);

    boolean existsByName(String name);

    Long countAssetType();
}
