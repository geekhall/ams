package net.geekhour.loki.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.dto.DutyDTO;
import net.geekhour.loki.service.IDutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-19
 */
@RestController
@RequestMapping("/api/duty")
public class DutyController {
    @Autowired
    private IDutyService dutyService;

    /**
     * 列出所有 Duty 数据
     *
     * @return Duty 列表
     */
    @RequestMapping("/all")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:duty:list')")
    public ResponseEntity<?> all() {
        return ResponseUtil.success(dutyService.all());
    }

    /**
     * 分页查询 Duty 数据
     *
     * @param requestBody {name: "Duty Name", pageIndex: 1, pageSize: 10}
     * @return 分页后的 Duty 列表
     */
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:duty:list')")
    public ResponseEntity<?> getDutyList(@RequestBody(required = false) String requestBody) {
        if (requestBody == null || requestBody.isEmpty()) {
            return ResponseUtil.error(400, "参数不能为空");
        }
        try {
            Map<String, Object> requestMap = new ObjectMapper().readValue(requestBody, Map.class);
            String name = (String) requestMap.get("name");
            Integer pageIndex = requestMap.get("pageIndex") == null ? 1
                    : Integer.parseInt(requestMap.get("pageIndex").toString());
            Integer pageSize = requestMap.get("pageSize") == null ? 10
                    : Integer.parseInt(requestMap.get("pageSize").toString());
            Integer offset = (pageIndex - 1) * pageSize;
            List<DutyDTO> dutyList = dutyService.getDutyList(name, offset, pageSize);
            Long total = dutyService.countDuties(name);
            return ResponseUtil.success(Map.of(
                    "items", dutyList,
                    "total", total));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }


    /**
     * 更新现有的 Duty 数据
     *
     * @param dutyDTO 更新后的 Duty 数据
     * @return ResponseEntity
     */
    @PostMapping("/update")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:duty:update')")
    public ResponseEntity<?> updateDuty(@RequestBody DutyDTO dutyDTO) {
        if (dutyDTO.getId() == null) {
            return ResponseUtil.error(400, "Duty ID 不能为空");
        }
        try {
            return dutyService.updateDuty(dutyDTO)
                    ? ResponseUtil.success(dutyDTO)
                    : ResponseUtil.error(500, "更新 Duty 失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    /**
     * 根据 ID 删除 Duty 数据
     *
     * @param id Duty ID
     * @return ResponseEntity
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') || hasAuthority('user:duty:delete')")
    public ResponseEntity<?> deleteDuty(@PathVariable Long id) {
        return dutyService.removeById(id)
                ? ResponseUtil.success(id)
                : ResponseUtil.error(404, "Duty 不存在");
    }
}
