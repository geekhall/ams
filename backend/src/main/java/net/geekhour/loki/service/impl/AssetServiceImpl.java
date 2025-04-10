package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.StringUtil;
import net.geekhour.loki.entity.Asset;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.entity.dto.AssetDTO;
import net.geekhour.loki.mapper.AssetMapper;
import net.geekhour.loki.mapper.AssetTypeMapper;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.service.IAssetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    @Autowired
    AssetMapper assetMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    AssetTypeMapper assetTypeMapper;

    @Override
    public List<Asset> all() {
        return assetMapper.selectList(null);
    }

    @Override
    public List<AssetDTO> getAssetList(Integer offset, Integer size, String name) {
        return assetMapper.getAssetList(offset, size, name);
    }

    @Override
    public Long countAssets(String name) {
        return assetMapper.countAssets(name);
    }

    @Override
    @Transactional
    public boolean deleteAsset(Long id) {
        return assetMapper.deleteById(id) > 0;
    }

    @Override
    @Transactional
    public boolean createAsset(AssetDTO assetDTO) {
        if (StringUtil.isNotEmpty(assetDTO.getAssetName()) && StringUtil.isNotEmpty(assetDTO.getAssetCode())) {
            Long assetTypeId = assetTypeMapper.selectIdByName(assetDTO.getAssetType());
            if (assetTypeId == null) {
                return false;
            }
            Long departmentId = departmentMapper.selectIdByName(assetDTO.getDepartmentName());
            if (departmentId == null) {
                return false;
            }
            Asset asset = new Asset();
            asset.setAssetName(assetDTO.getAssetName());
            asset.setAssetCode(assetDTO.getAssetCode());
            asset.setAssetType(assetTypeId);
            asset.setDepartmentId(departmentId);
            asset.setLocation(assetDTO.getLocation());
            asset.setStatus(assetDTO.getStatus());
            Long purchaseDateTimestamp = LocalDate.parse(assetDTO.getPurchaseDate())
                    .atStartOfDay(ZoneId.systemDefault())
                    .toInstant()
                    .toEpochMilli();
            asset.setPurchaseDate(purchaseDateTimestamp);
            asset.setPurchasePrice(assetDTO.getPurchasePrice());
            asset.setCount(assetDTO.getCount());
            return assetMapper.insert(asset) > 0;
        }
        return false;
    }

    @Override
    public boolean checkAssetCodeExists(String assetCode) {
        return assetMapper.checkAssetCodeExists(assetCode);
    }

    @Override
    public boolean checkAssetNameExists(String assetName) {
        return assetMapper.checkAssetNameExists(assetName);
    }
}
