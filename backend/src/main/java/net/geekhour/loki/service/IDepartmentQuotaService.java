package net.geekhour.loki.service;

import net.geekhour.loki.entity.DepartmentQuota;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.AssetDepartmentQuotaDTO;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
public interface IDepartmentQuotaService extends IService<DepartmentQuota> {
    List<DepartmentQuota> all();
    List<AssetDepartmentQuotaDTO> getQuotaList(int year, int offset, int pageSize, String name);
    long countQuotas(int year, String name);
    
    boolean createQuota(AssetDepartmentQuotaDTO quotaDTO);

    boolean updateQuota(AssetDepartmentQuotaDTO quotaDTO);

    boolean deleteQuota(Long id);

    BigDecimal totalQuotas(Integer year, String name);

    // 新增：根据部门名称和年份查询额度
    BigDecimal getQuotaByDepartmentAndYear(String departmentName, Integer year);
}
