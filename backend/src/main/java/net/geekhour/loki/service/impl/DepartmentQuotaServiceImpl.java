package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.StringUtil;
import net.geekhour.loki.entity.Asset;
import net.geekhour.loki.entity.DepartmentQuota;
import net.geekhour.loki.entity.dto.DepartmentQuotaDTO;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.mapper.DepartmentQuotaMapper;
import net.geekhour.loki.service.IDepartmentQuotaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Service
public class DepartmentQuotaServiceImpl extends ServiceImpl<DepartmentQuotaMapper, DepartmentQuota> implements IDepartmentQuotaService {
    @Autowired
    private DepartmentQuotaMapper departmentQuotaMapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<DepartmentQuota> all() {
        return departmentQuotaMapper.selectList(null);
    }

    @Override
    public List<DepartmentQuotaDTO> getQuotaList(int year, int offset, int pageSize, String name) {
        return departmentQuotaMapper.getQuotaList(year, offset, pageSize, name);
    }

    @Override
    public long countQuotas(int year, String name) {
        return departmentQuotaMapper.countQuotas(year, name);
    }

    @Override
    public boolean createQuota(DepartmentQuotaDTO quotaDTO) {
        if (StringUtil.isEmpty(quotaDTO.getDepartmentName() )) {
            return false;
        }
        if (departmentQuotaMapper.checkQuotaExists(quotaDTO.getDepartmentName(),quotaDTO.getYear())) {
            return false;
        }

        DepartmentQuota quota = mapToQuota(quotaDTO);
        if (quota == null) {
            return false;
        }
        return departmentQuotaMapper.insert(quota) > 0;
    }

    private DepartmentQuota mapToQuota(DepartmentQuotaDTO quotaDTO) {
        if (quotaDTO == null) {
            return null;
        }
        Long departmentId = departmentMapper.getDepartmentIdByName(quotaDTO.getDepartmentName());
        if ( departmentId == null) {
            return null;
        }
        DepartmentQuota quota = new DepartmentQuota();
        if (quotaDTO.getId() != null && !quotaDTO.getId().isEmpty()){
            quota.setId(Long.valueOf(quotaDTO.getId()));
        }
        quota.setDepartmentId(departmentId);
        quota.setBudgetYear(quotaDTO.getYear());
        quota.setQuota(quotaDTO.getQuota());

        return quota;
    }

    @Override
    public boolean updateQuota(DepartmentQuotaDTO quotaDTO) {
        System.out.println("quotaDTO.getId : " + quotaDTO.getId());
        System.out.println("quotaDTO.getDepartmentName() : " + quotaDTO.getDepartmentName());
        System.out.println("quotaDTO.getYear() : " + quotaDTO.getYear());
        System.out.println("quotaDTO.getQuota() : " + quotaDTO.getQuota());
        DepartmentQuota existingQuota = departmentQuotaMapper.selectById(quotaDTO.getId());
        if (existingQuota == null) {
            return false; // DepartmentQuota must exist for update
        }
        System.out.println("updateQuota ###### step 001");

        // 不能跨年修改
        if (!Objects.equals(existingQuota.getBudgetYear(), quotaDTO.getYear())) {
            log.error("updateQuota ###### 不能跨年修改");
            System.out.println("updateQuota ###### 不能跨年修改");
            return false;
        }
        System.out.println("updateQuota ###### step 002");
        // 不能修改部门
        if (existingQuota.getDepartmentId() != departmentMapper.getDepartmentIdByName(quotaDTO.getDepartmentName())) {
            log.error("updateQuota ###### 不能修改部门");
            System.out.println("updateQuota ###### 不能修改部门");
            return false;
        }
        System.out.println("updateQuota ###### step 003");
        DepartmentQuota quota = mapToQuota(quotaDTO);
        if (quota == null) {
            return false;
        }
        System.out.println("updateQuota ###### step 004");
        return departmentQuotaMapper.updateById(quota) > 0;
    }

    @Override
    public boolean deleteQuota(Long id) {
        return departmentQuotaMapper.deleteById(id) > 0;
    }

    @Override
    public BigDecimal totalQuotas(Integer year, String name) {
        return departmentQuotaMapper.totalQuotas(year, name);
    }

}
