package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
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
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", assetService.all()));
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
                return ResponseEntity.badRequest().body(Map.of(
                        "code", 400,
                        "message", "Invalid request body",
                        "data", Map.of(
                                "items", new ArrayList<>(),
                                "total", 0
                        )));
            }
        }
        Integer offset = (pageIndex - 1) * pageSize;
        List<AssetDTO> assetList = assetService.getAssetList(offset, pageSize, name);
        Long total = assetService.countAssets(name);
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", Map.of(
                        "items", assetList,
                        "total", total
                )));
    }

    /**
     * Delete an asset by ID
     * @param id Asset ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:asset:delete')")
    public ResponseEntity<?> deleteAsset(@PathVariable Long id) {
        boolean deleted = assetService.deleteAsset(id);
        if (deleted) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Asset deleted successfully",
                    "data", ""));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Asset not found",
                    "data", ""));
        }
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
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset name cannot be empty",
                    "data", ""
            ));
        }
        if (assetDTO.getAssetCode() == null || assetDTO.getAssetCode().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset code cannot be empty",
                    "data", ""
            ));
        }
        // TODO: 检查AssetCode和AssetName重复
        if (assetService.checkAssetCodeExists(assetDTO.getAssetCode())) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset code already exists",
                    "data", ""
            ));
        }
        if (assetService.checkAssetNameExists(assetDTO.getAssetName())) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset name already exists",
                    "data", ""
            ));
        }

        boolean created = false;
        try {
            created = assetService.createAsset(assetDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create asset",
                    "data", ""
            ));
        }

        if (created) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Asset created successfully",
                    "data", assetDTO
            ));
        } else {
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create asset",
                    "data", ""
            ));
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
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset ID cannot be null",
                    "data", ""
            ));
        }
        System.out.println("【Asset】 controller 【update】 method called ... 001");
        if (assetDTO.getAssetName() == null || assetDTO.getAssetName().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset name cannot be empty",
                    "data", ""
            ));
        }
        System.out.println("【Asset】 controller 【update】 method called ... 002");
        if (assetDTO.getAssetCode() == null || assetDTO.getAssetCode().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Asset code cannot be empty",
                    "data", ""
            ));
        }
        System.out.println("【Asset】 controller 【update】 method called ... 003");
        boolean updated = false;
        try {
            updated = assetService.updateAsset(assetDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to update asset",
                    "data", ""
            ));
        }
        System.out.println("【Asset】 controller 【update】 method called ... 004");
        if (updated) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Asset updated successfully",
                    "data", assetDTO
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Asset not found",
                    "data", ""
            ));
        }
    }
}
