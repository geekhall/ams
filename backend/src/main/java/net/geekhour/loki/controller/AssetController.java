package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.mapper.AssetMapper;
import net.geekhour.loki.service.IAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> all() {
        return assetService.all();
    }

    /**
     * list all assets (列出所有资产)
     * @return AssetDTO
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> getAssetList(@RequestBody(required = false) String requestBody) {
        String name = null;
        if (requestBody != null && !requestBody.isEmpty()) {
            try {
                Map<String, String> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
                name = requestMap.get("name");
            } catch (Exception e) {
                return ResponseEntity.badRequest().body(Map.of(
                        "code", 400,
                        "message", "Invalid request body",
                        "data", null));
            }
        }
        System.out.println("#### AssetController name " + name);
        return assetService.getAssetList(name);
    }

}
