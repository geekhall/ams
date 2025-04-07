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

import java.util.ArrayList;
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
     * @param requestBody {name: "资产名称", pageIndex: 1, pageSize: 10}
     * @return AssetDTO
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
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
        return assetService.getAssetList(offset, pageSize, name);
    }

}
