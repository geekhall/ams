package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 部门 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@CrossOrigin
@RestController
@RequestMapping("/api/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    // List all department names
    @RequestMapping("/names")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:department:all')")
    public ResponseEntity<?> names() {
        List<String> departmentNames = departmentService.list().stream()
                .map(Department::getName)
                .toList();

        return ResponseUtil.success( Map.of(
                        "items" , departmentNames,
                        "total" , departmentNames.size()
                ));
    }

    // List all departments
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:department:list')")
    public ResponseEntity<?> list(@RequestBody(required = false) String requestBody) {
        return ResponseUtil.success(departmentService.list());
    }

    // Create a new department
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:department:create')")
    public ResponseEntity<?> create(@RequestBody Department department) {
        if (department.getName() == null || department.getName().isEmpty()) {
            return ResponseUtil.error(400, "部门名称不能为空");
        }
        try {

            return departmentService.save(department)
                    ? ResponseUtil.success(department)
                    : ResponseUtil.error(500, "部门创建失败");
        } catch (Exception e) {
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Update an existing department
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:department:update')")
    public ResponseEntity<?> update(@RequestBody Department department) {
        if (department.getId() == null) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Department ID cannot be null",
                    "data", ""
            ));
        }
        try {
            return departmentService.updateById(department)
                    ? ResponseUtil.success(department)
                    : ResponseUtil.error(500, "部门更新失败");
        } catch (Exception e) {
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Delete a department by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:department:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        try {
            return departmentService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(500, "部门删除失败");
        } catch (Exception e) {
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Check if a department exists by name
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:department:exists')")
    public ResponseEntity<?> existsByName(@RequestBody Department department) {
        if (department.getName() == null || department.getName().isEmpty()) {
            return ResponseUtil.error(400, "部门名称不能为空");
        }
        try {
            return departmentService.existsByName(department.getName())
                    ? ResponseUtil.success(Map.of("exists", true))
                    : ResponseUtil.error(404, "部门不存在");
        } catch (Exception e) {
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
