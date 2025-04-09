package net.geekhour.loki.controller;

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
        System.out.println("【AssetType】 controller 【names】 method called ...");
        List<String> assetTypes = assetTypeService.list().stream()
                .map(AssetType::getName)
                .toList();

        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", assetTypes
        ));
    }

    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> list() {
        System.out.println("【AssetType】 controller 【list】 method called ...");
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
        boolean saved = false;
        try {
            if (assetType.getName() == null || assetType.getName().isEmpty()) {
                return ResponseEntity.badRequest().body(Map.of(
                        "code", 400,
                        "message", "AssetType name cannot be empty",
                        "data", ""
                ));
            }
            saved = assetTypeService.save(assetType);
        }catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create AssetType",
                    "data", ""
            ));
        }
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
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:asset:update')")
    public ResponseEntity<?> update(@RequestBody AssetType assetType) {
        if (assetType.getId() == null) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "AssetType ID cannot be null",
                    "data", ""
            ));
        }
        boolean updated = false;
        try {
            updated = assetTypeService.updateById(assetType);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to update AssetType",
                    "data", ""
            ));
        }

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
    // check if AssetType is exists
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:asset:exists')")
    public ResponseEntity<?> existsByName(@RequestBody AssetType assetType) {
        if (assetType.getName() == null || assetType.getName().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "AssetType name cannot be empty",
                    "data", ""
            ));
        }
        boolean exists = false;
        try {
            exists = assetTypeService.existsByName(assetType.getName());
        }catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to check AssetType",
                    "data", ""
            ));
        }
        if (exists) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "AssetType exists",
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
