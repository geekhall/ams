package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Role;
import net.geekhour.loki.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 角色 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@CrossOrigin()
@RestController
@RequestMapping("/api/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    // 获取所有角色
    @PostMapping("/list")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:role:list')")
    public ResponseEntity<?> list() {
        List<Role> roles = roleService.list();
        return ResponseUtil.success(roles);
    }

    // 创建新角色
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:role:create')")
    public ResponseEntity<?> create(@RequestBody Role role) {
        if (role.getName() == null || role.getName().isEmpty()) {
            return ResponseUtil.error(400, "角色名称不能为空");
        }
        try {
            return roleService.save(role)
                    ? ResponseUtil.success(role)
                    : ResponseUtil.error(500, "创建角色失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // 更新角色
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:role:update')")
    public ResponseEntity<?> update(@RequestBody Role role) {
        if (role.getId() == null) {
            return ResponseUtil.error(400, "角色ID不能为空");
        }
        try {
            return roleService.updateById(role)
                    ? ResponseUtil.success(role)
                    : ResponseUtil.error(404, "角色未找到");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // 删除角色
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:role:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (id == null || id <= 0) {
            return ResponseUtil.error(400, "角色ID不能为空");
        }
        try {
            return roleService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(404, "角色未找到");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // 检查角色是否存在
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:role:exists')")
    public ResponseEntity<?> existsByName(@RequestBody Role role) {
        if (role.getName() == null || role.getName().isEmpty()) {
            return ResponseUtil.error(400, "角色名称不能为空");
        }
        try {
            return roleService.existsByName(role.getName())
                    ? ResponseUtil.success("角色已存在")
                    : ResponseUtil.error(404, "角色不存在");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
