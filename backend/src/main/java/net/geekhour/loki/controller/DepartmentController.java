package net.geekhour.loki.controller;

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

        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", Map.of(
                        "items" , departmentNames,
                        "total" , departmentNames.size()
                )
        ));
    }

    // List all departments
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:department:list')")
    public ResponseEntity<?> list() {
        List<Department> departments = departmentService.list();
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", departments
        ));
    }

    // Create a new department
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:department:create')")
    public ResponseEntity<?> create(@RequestBody Department department) {
        if (department.getName() == null || department.getName().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Department name cannot be empty",
                    "data", ""
            ));
        }
        boolean saved = departmentService.save(department);
        if (saved) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Department created successfully",
                    "data", department
            ));
        } else {
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create department",
                    "data", ""
            ));
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
        boolean updated = departmentService.updateById(department);
        if (updated) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Department updated successfully",
                    "data", department
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Department not found",
                    "data", ""
            ));
        }
    }

    // Delete a department by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:department:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        boolean deleted = departmentService.removeById(id);
        if (deleted) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Department deleted successfully",
                    "data", ""
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Department not found",
                    "data", ""
            ));
        }
    }

    // Check if a department exists by name
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:department:exists')")
    public ResponseEntity<?> existsByName(@RequestBody Department department) {
        if (department.getName() == null || department.getName().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Department name cannot be empty",
                    "data", ""
            ));
        }
        boolean exists = departmentService.existsByName(department.getName());
        if (exists) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Department exists",
                    "data", ""
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Department not found",
                    "data", ""
            ));
        }
    }
}
