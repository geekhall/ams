package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.geekhour.loki.entity.AssetType;
import net.geekhour.loki.mapper.AssetTypeMapper;
import net.geekhour.loki.service.IAssetTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@Service
public class AssetTypeServiceImpl extends ServiceImpl<AssetTypeMapper, AssetType> implements IAssetTypeService {

    @Autowired
    AssetTypeMapper assetTypeMapper;

    @Override
    public List<AssetType> list() {
        return assetTypeMapper.selectList(null);
    }

    @Override
    @Transactional
    public boolean deleteAssetType(Long id) {
        return assetTypeMapper.deleteById(id) > 0;
    }

    @Override
    public boolean existsByName(String name) {
        QueryWrapper<AssetType> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name);
        return assetTypeMapper.selectCount(queryWrapper) > 0;
    }

}
