package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.Asset;
import net.geekhour.loki.mapper.AssetMapper;
import net.geekhour.loki.service.IAssetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@Service
public class AssetServiceImpl extends ServiceImpl<AssetMapper, Asset> implements IAssetService {

}
