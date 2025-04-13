package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.AssetType;
import net.geekhour.loki.service.IAssetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-05
 */
@RestController
@RequestMapping("/api/at")
public class AssetTypeController {

    @Autowired
    IAssetTypeService assetTypeService;

    @RequestMapping("/names")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:asset:all')")
    public ResponseEntity<?> names() {
        List<String> assetTypes = assetTypeService.list().stream()
                .map(AssetType::getName)
                .toList();

        return ResponseUtil.success(assetTypes);
    }

    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> list() {
        return ResponseUtil.success(assetTypeService.list());
    }

    // Create a new AssetType
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:create')")
    public ResponseEntity<?> create(@RequestBody AssetType assetType) {
        if (assetType.getName() == null || assetType.getName().isEmpty()) {
            return ResponseUtil.error(400, "资产类型名不能为空");
        }
        try {
            return assetTypeService.save(assetType)
                    ? ResponseUtil.success(assetType)
                    : ResponseUtil.error(500, "创建资产类型失败");
        }catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Update an existing AssetType
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:update')")
    public ResponseEntity<?> update(@RequestBody AssetType assetType) {
        if (assetType.getId() == null) {
            return ResponseUtil.error(400, "资产类型ID不能为空");
        }
        try {
            return assetTypeService.updateById(assetType)
                    ? ResponseUtil.success(assetType)
                    : ResponseUtil.error(404, "资产类型未找到");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Delete an AssetType by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        return assetTypeService.deleteAssetType(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "资产类型未找到");
    }
    // check if AssetType is exists
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:asset:exists')")
    public ResponseEntity<?> existsByName(@RequestBody AssetType assetType) {
        if (assetType.getName() == null || assetType.getName().isEmpty()) {
            return ResponseUtil.error(400, "资产类型名不能为空");
        }
        try {
            return assetTypeService.existsByName(assetType.getName())
                    ? ResponseUtil.success(assetType)
                    : ResponseUtil.error(404, "资产类型未找到");
        }catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
