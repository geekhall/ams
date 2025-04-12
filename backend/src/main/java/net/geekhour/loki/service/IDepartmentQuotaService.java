package net.geekhour.loki.service;

import net.geekhour.loki.entity.DepartmentQuota;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.DepartmentQuotaDTO;
import org.springframework.stereotype.Service;

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
    List<DepartmentQuotaDTO> getQuotaList(int year, int offset, int pageSize, String name);
    long countQuotas(int year, String name);
    
    boolean createQuota(DepartmentQuotaDTO quotaDTO);

    boolean updateQuota(DepartmentQuotaDTO quotaDTO);

    boolean deleteQuota(Long id);

    BigDecimal totalQuotas(Integer year, String name);
}
