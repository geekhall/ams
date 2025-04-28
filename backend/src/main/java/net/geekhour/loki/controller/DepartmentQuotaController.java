package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
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
@CrossOrigin
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
        return ResponseUtil.success(departmentQuotaService.all());
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
                return ResponseUtil.error(500, e.getMessage());
            }
        }
        Integer offset = (pageIndex - 1) * pageSize;
        List<DepartmentQuotaDTO> quotaList = departmentQuotaService.getQuotaList(year, offset, pageSize, name);
        Long count = departmentQuotaService.countQuotas(year, name);
        BigDecimal total = departmentQuotaService.totalQuotas(year, name) == null ?
                BigDecimal.ZERO : departmentQuotaService.totalQuotas(year, name);
        return ResponseUtil.success(Map.of(
                        "items", quotaList,
                        "count", count,
                        "total", total
                ));
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
            return ResponseUtil.error(400, "部门名称不能为空");
        }
        Long currentYear = System.currentTimeMillis() / 1000 / 60 / 60 / 24 / 365 + 1970;
        System.out.println("currentYear: " + currentYear);
        System.out.println("quotaDTO.getYear(): " + quotaDTO.getYear());
        if (quotaDTO.getYear() == null || quotaDTO.getYear() < currentYear) {
            return ResponseUtil.error(400,"预算年度不能为空或小于当前年份");
        }
        try {
            boolean created = departmentQuotaService.createQuota(quotaDTO);
            return created ? ResponseUtil.success(quotaDTO)
                           : ResponseUtil.error(500, "部门预算创建失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
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
            return ResponseUtil.error(400,"部门预算ID不能为空");
        }
        try {
            boolean updated = departmentQuotaService.updateQuota(quotaDTO);
            return updated ? ResponseUtil.success(quotaDTO)
                           : ResponseUtil.error(500, "部门预算更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
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
        try {
            return departmentQuotaService.deleteQuota(id) ?
                    ResponseUtil.success(id) :
                    ResponseUtil.error(500, "部门预算删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

}
