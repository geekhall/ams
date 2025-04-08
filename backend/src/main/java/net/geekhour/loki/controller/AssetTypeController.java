package net.geekhour.loki.controller;

import net.geekhour.loki.entity.AssetType;
import net.geekhour.loki.service.IAssetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> list() {

        List<AssetType> assetTypes = assetTypeService.list();
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", assetTypes
        ));
    }

    // Create a new AssetType
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:create')")
    public ResponseEntity<?> create(@RequestBody AssetType assetType) {
        boolean saved = assetTypeService.save(assetType);
        if (saved) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "AssetType created successfully",
                    "data", assetType
            ));
        } else {
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create AssetType",
                    "data", ""
            ));
        }
    }

    // Update an existing AssetType
    @PutMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:update')")
    public ResponseEntity<?> update(@RequestBody AssetType assetType) {
        boolean updated = assetTypeService.updateById(assetType);
        if (updated) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "AssetType updated successfully",
                    "data", assetType
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "AssetType not found",
                    "data", ""
            ));
        }
    }

    // Delete an AssetType by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        boolean deleted = assetTypeService.deleteAssetType(id);
        if (deleted) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "AssetType deleted successfully",
                    "data", ""
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "AssetType not found",
                    "data", ""
            ));
        }
    }
}
