package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.AssetDTO;
import net.geekhour.loki.entity.dto.AssetSummaryDTO;
import net.geekhour.loki.service.IAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@CrossOrigin
@RestController
@RequestMapping("/api/asset")
public class AssetController {

    @Autowired
    IAssetService assetService;

    /**
     * list all assets (列出所有资产)
     *
     * @return Asset
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:view')")
    public ResponseEntity<?> all() {
        return ResponseUtil.success(assetService.all());
    }

    /**
     * Get the total count of assets (获取资产总数)
     *
     * @return ResponseEntity
     */
    @PostMapping("/count")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:view')")
    public ResponseEntity<?> getAssetCount() {
        try {
            Long total = assetService.countAssets(null);
            return ResponseUtil.success(Map.of("total", total));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, "获取资产数量失败: " + e.getMessage());
        }
    }

    /**
     * 获取资产总数量和总金额
     *
     * @return ResponseEntity
     */
    @PostMapping("/summary")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:view')")
    public ResponseEntity<?> getAssetSummary() {
        try {
            AssetSummaryDTO assetSummaryDTO = assetService.getSummary();
            return ResponseUtil.success(assetSummaryDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, "获取资产汇总信息失败: " + e.getMessage());
        }
    }

    /**
     * list all assets (列出所有资产)
     *
     * @param requestBody {name: "资产名称", pageIndex: 1, pageSize: 10}
     * @return AssetDTO
     */
    @CrossOrigin
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:view')")
    public ResponseEntity<?> getAssetList(@RequestBody(required = false) String requestBody) {
        String name = null;
        int pageIndex = 1;
        int pageSize = 10;
        if (requestBody != null && !requestBody.isEmpty()) {
            try {
                Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody,
                        new com.fasterxml.jackson.core.type.TypeReference<Map<String, Object>>() {
                        });
                name = (String) requestMap.get("name");
                Object pageIndexObj = requestMap.get("pageIndex");
                Object pageSizeObj = requestMap.get("pageSize");
                pageIndex = pageIndexObj == null ? 1 : ((Number) pageIndexObj).intValue();
                pageSize = pageSizeObj == null ? 10 : ((Number) pageSizeObj).intValue();
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
                "total", total));
    }

    /**
     * Delete an asset by ID
     *
     * @param id Asset ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:manage')")
    public ResponseEntity<?> deleteAsset(@PathVariable Long id) {
        return assetService.deleteAsset(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "资产不存在");
    }

    /**
     * Create a new asset
     *
     * @param assetDTO Asset details
     * @return ResponseEntity
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:manage')")
    public ResponseEntity<?> createAsset(@RequestBody AssetDTO assetDTO) {
        if (assetDTO.getName() == null || assetDTO.getName().isEmpty()) {
            return ResponseUtil.error(400, "资产名称不能为空");
        }
        if (assetDTO.getCode() == null || assetDTO.getCode().isEmpty()) {
            return ResponseUtil.error(400, "资产编码不能为空");
        }
        if (assetService.checkAssetCodeExists(assetDTO.getCode())) {
            return ResponseUtil.error(400, "资产编码已存在");
        }
        if (assetService.checkAssetSnExists(assetDTO.getSn())) {
            return ResponseUtil.error(400, "资产序列号已存在");
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
     *
     * @param assetDTO Updated asset details
     * @return ResponseEntity
     */
    @PostMapping("/update")
    @PreAuthorize("hasRole('USER') || hasAuthority('asset:manage')")
    public ResponseEntity<?> updateAsset(@RequestBody AssetDTO assetDTO) {
        System.out.println("【Asset】 controller 【update】 method called ...");
        if (assetDTO.getId() == null) {
            return ResponseUtil.error(400, "资产ID不能为空");
        }
        if (assetDTO.getName() == null || assetDTO.getName().isEmpty()) {
            return ResponseUtil.error(400, "资产名称不能为空");
        }
        if (assetDTO.getCode() == null || assetDTO.getCode().isEmpty()) {
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
