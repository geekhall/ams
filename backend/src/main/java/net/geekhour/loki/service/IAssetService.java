package net.geekhour.loki.service;

import net.geekhour.loki.entity.Asset;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.AssetDTO;
import net.geekhour.loki.entity.dto.AssetSummaryDTO;
import net.geekhour.loki.entity.dto.DepartmentAssetSummaryDTO;
import org.springframework.http.ResponseEntity;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
public interface IAssetService extends IService<Asset> {

    List<Asset> all();

    List<AssetDTO> getAssetList(Integer offset, Integer size, String name);

    Long countAssets(String name);

    boolean deleteAsset(Long id);

    boolean createAsset(AssetDTO assetDTO);

    boolean checkAssetCodeExists(String assetCode);

    boolean checkAssetNameExists(String assetName);

    boolean updateAsset(AssetDTO assetDTO);

    boolean checkAssetSnExists(String sn);

    BigDecimal calculateTotalAmount();

    AssetSummaryDTO getSummary();

    List<DepartmentAssetSummaryDTO> getDepartmentSummary();

}
