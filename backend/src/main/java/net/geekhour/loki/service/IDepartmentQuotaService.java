package net.geekhour.loki.service;

import net.geekhour.loki.entity.DepartmentQuota;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.DepartmentQuotaDTO;

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
    List<DepartmentQuotaDTO> getQuotaList(int offset, int pageSize, String name);
    long countQuotas(String name);

    boolean createQuota(DepartmentQuotaDTO quotaDTO);
}
