package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.entity.dto.DepartmentQuotaDTO;
import net.geekhour.loki.service.IDepartmentQuotaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@RestController
@RequestMapping("/api/quota")
public class DepartmentQuotaController {

    @Autowired
    private IDepartmentQuotaService departmentQuotaService;

    /**
     * List all department quotas
     * @return ResponseEntity
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:quota:list')")
    public ResponseEntity<?> all() {
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", departmentQuotaService.all()));
    }

    /**
     * List department quotas with pagination
     * @param requestBody {name: "Department Name", pageIndex: 1, pageSize: 10}
     * @return ResponseEntity
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:quota:list')")
    public ResponseEntity<?> getQuotaList(@RequestBody(required = false) String requestBody) {
        String name = null;
        // 获取当前年份
        Integer year = LocalDate.now().getYear();
        Integer pageIndex = 1;
        Integer pageSize = 15;
        System.out.println(" ##########  year: " + year);
        if (requestBody != null && !requestBody.isEmpty()) {
            try {
                Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
                name = (String) requestMap.get("name");
                year = requestMap.get("year") == null ? year :
                        Integer.parseInt(requestMap.get("year").toString());
                pageIndex = requestMap.get("pageIndex") == null ? 1 :
                        Integer.parseInt(requestMap.get("pageIndex").toString());
                pageSize = requestMap.get("pageSize") == null ? 15 :
                        Integer.parseInt(requestMap.get("pageSize").toString());
                System.out.println(" ##########  year: " + year);
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
        List<DepartmentQuotaDTO> quotaList = departmentQuotaService.getQuotaList(year, offset, pageSize, name);
        Long count = departmentQuotaService.countQuotas(year, name);
        BigDecimal total = departmentQuotaService.totalQuotas(year, name);
        return ResponseEntity.ok(Map.of(
                "code", 200,
                "message", "success!",
                "data", Map.of(
                        "items", quotaList,
                        "count", count,
                        "total", total
                )));
    }

    /**
     * Create a new department quota
     * @param quotaDTO DepartmentQuotaDTO
     * @return ResponseEntity
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:quota:create')")
    public ResponseEntity<?> createQuota(@RequestBody DepartmentQuotaDTO quotaDTO) {
        if (quotaDTO.getDepartmentName() == null || quotaDTO.getDepartmentName().isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "部门名称不能为空",
                    "data", ""
            ));
        }
        Long currentYear = System.currentTimeMillis() / 1000 / 60 / 60 / 24 / 365 + 1970;
        System.out.println("currentYear: " + currentYear);
        System.out.println("quotaDTO.getYear(): " + quotaDTO.getYear());
        if (quotaDTO.getYear() == null || quotaDTO.getYear() < currentYear) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "预算年度不能为空或小于当前年份",
                    "data", ""
            ));
        }
        boolean created = false;
        try {
            created = departmentQuotaService.createQuota(quotaDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create quota",
                    "data", ""
            ));
        }

        if (created) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Quota created successfully",
                    "data", quotaDTO
            ));
        } else {
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to create quota",
                    "data", ""
            ));
        }
    }

    /**
     * Update an existing department quota
     * @param quotaDTO DepartmentQuotaDTO
     * @return ResponseEntity
     */
    @PostMapping("/update")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:quota:update')")
    public ResponseEntity<?> updateQuota(@RequestBody DepartmentQuotaDTO quotaDTO) {
        if (quotaDTO.getId() == null) {
            return ResponseEntity.badRequest().body(Map.of(
                    "code", 400,
                    "message", "Quota ID cannot be null",
                    "data", ""
            ));
        }
        boolean updated = false;
        try {
            updated = departmentQuotaService.updateQuota(quotaDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of(
                    "code", 500,
                    "message", "Failed to update quota",
                    "data", ""
            ));
        }

        if (updated) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Quota updated successfully",
                    "data", quotaDTO
            ));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Quota not found",
                    "data", ""
            ));
        }
    }

    /**
     * Delete a department quota by ID
     * @param id Quota ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:quota:delete')")
    public ResponseEntity<?> deleteQuota(@PathVariable Long id) {
        boolean deleted = departmentQuotaService.deleteQuota(id);
        if (deleted) {
            return ResponseEntity.ok(Map.of(
                    "code", 200,
                    "message", "Quota deleted successfully",
                    "data", ""));
        } else {
            return ResponseEntity.status(404).body(Map.of(
                    "code", 404,
                    "message", "Quota not found",
                    "data", ""));
        }
    }

}
