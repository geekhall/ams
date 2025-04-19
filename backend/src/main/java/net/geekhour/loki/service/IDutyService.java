package net.geekhour.loki.service;

import net.geekhour.loki.entity.Duty;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.dto.DutyDTO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-19
 */
public interface IDutyService extends IService<Duty> {
    List<DutyDTO> all();

    List<DutyDTO> getDutyList(String name, Integer offset, Integer pageSize);

    Long countDuties(String name);

    boolean createDuty(DutyDTO dutyDTO);

    boolean updateDuty(DutyDTO dutyDTO);

    boolean removeById(Long id);
}
