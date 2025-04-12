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

import java.util.List;

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
    public List<DepartmentQuotaDTO> getQuotaList(int offset, int pageSize, String name) {
        return departmentQuotaMapper.getQuotaList(offset, pageSize, name);
    }

    @Override
    public long countQuotas(String name) {
        return departmentQuotaMapper.countQuotas(name);
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
        Long departmentId = departmentMapper.selectIdByName(quotaDTO.getDepartmentName());
        if ( departmentId == null) {
            return null;
        }
        DepartmentQuota quota = new DepartmentQuota();
        quota.setDepartmentId(departmentId);
        quota.setBudgetYear(quotaDTO.getYear());
        quota.setQuota(quotaDTO.getQuota());
        quota.setVersion(1);
        quota.setCreateTime(System.currentTimeMillis());
        quota.setUpdateTime(System.currentTimeMillis());
        quota.setDeleted((byte) 0);
        return quota;
    }

}
