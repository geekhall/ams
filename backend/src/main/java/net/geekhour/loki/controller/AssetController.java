package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.AssetDTO;
import net.geekhour.loki.mapper.AssetMapper;
import net.geekhour.loki.service.IAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@RestController
@RequestMapping("/api/asset")
public class AssetController {

    @Autowired
    IAssetService assetService;

    /**
     * list all assets (列出所有资产)
     * @return Asset
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:list')")
    public ResponseEntity<?> all() {
        return ResponseUtil.success(assetService.all());
    }

    /**
     * list all assets (列出所有资产)
     * @param requestBody {name: "资产名称", pageIndex: 1, pageSize: 10}
     * @return AssetDTO
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:list')")
    public ResponseEntity<?> getAssetList(@RequestBody(required = false) String requestBody) {
        String name = null;
        Integer pageIndex = 1;
        Integer pageSize = 10;
        if (requestBody != null && !requestBody.isEmpty()) {
            try {
                Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
                name = (String) requestMap.get("name");
                pageIndex = requestMap.get("pageIndex") == null ? 1 :
                        Integer.parseInt(requestMap.get("pageIndex").toString());
                pageSize = requestMap.get("pageSize") == null ? 10 :
                        Integer.parseInt(requestMap.get("pageSize").toString());
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseUtil.error(400, e.getMessage());
            }
        }
        Integer offset = (pageIndex - 1) * pageSize;
        List<AssetDTO> assetList = assetService.getAssetList(offset, pageSize, name);
        Long total = assetService.countAssets(name);
        return ResponseUtil.success(Map.of(
                "items", assetList,
                "total", total
        ));
    }

    /**
     * Delete an asset by ID
     * @param id Asset ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:delete')")
    public ResponseEntity<?> deleteAsset(@PathVariable Long id) {
        return assetService.deleteAsset(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "资产不存在");
    }

    /**
     * Create a new asset
     * @param assetDTO Asset details
     * @return ResponseEntity
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:create')")
    public ResponseEntity<?> createAsset(@RequestBody AssetDTO assetDTO) {
        if (assetDTO.getAssetName() == null || assetDTO.getAssetName().isEmpty()) {
            return ResponseUtil.error(400, "资产名称不能为空");
        }
        if (assetDTO.getAssetCode() == null || assetDTO.getAssetCode().isEmpty()) {
            return ResponseUtil.error(400, "资产编码不能为空");
        }
        if (assetService.checkAssetNameExists(assetDTO.getAssetName())) {
            return ResponseUtil.error(400, "资产名称已存在");
        }
        if (assetService.checkAssetCodeExists(assetDTO.getAssetCode())) {
            return ResponseUtil.error(400, "资产编码已存在");
        }

        try {
            return assetService.createAsset(assetDTO)
                    ? ResponseUtil.success(assetDTO)
                    : ResponseUtil.error(500, "资产创建失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * Update an existing asset
     * @param assetDTO Updated asset details
     * @return ResponseEntity
     */
    @PostMapping("/update")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:update')")
    public ResponseEntity<?> updateAsset(@RequestBody AssetDTO assetDTO) {
        System.out.println("【Asset】 controller 【update】 method called ...");
        if (assetDTO.getId() == null) {
            return ResponseUtil.error(400, "资产ID不能为空");
        }
        if (assetDTO.getAssetName() == null || assetDTO.getAssetName().isEmpty()) {
            return ResponseUtil.error(400, "资产名称不能为空");
        }
        if (assetDTO.getAssetCode() == null || assetDTO.getAssetCode().isEmpty()) {
            return ResponseUtil.error(400, "资产编码不能为空");
        }
        try {
            return assetService.updateAsset(assetDTO)
                    ? ResponseUtil.success(assetDTO)
                    : ResponseUtil.error(500, "更新资产失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
