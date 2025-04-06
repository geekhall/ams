package net.geekhour.loki.controller;

import net.geekhour.loki.mapper.AssetMapper;
import net.geekhour.loki.service.IAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
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
     * list all users (列出所有用户)
     * @return
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> all() {
        return assetService.all();
    }
    /**
     * list all users (列出所有用户)
     * @return
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:user:list')")
    public ResponseEntity<?> getAssetList() {
        return assetService.getAssetList();
    }

}
