package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.Duty;
import net.geekhour.loki.entity.dto.DutyDTO;
import net.geekhour.loki.mapper.DutyMapper;
import net.geekhour.loki.service.IDutyService;
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
 * @since 2025-04-19
 */
@Service
public class DutyServiceImpl extends ServiceImpl<DutyMapper, Duty> implements IDutyService {

    @Autowired
    private DutyMapper dutyMapper;

    @Override
    public List<DutyDTO> all() {
        return dutyMapper.all();
    }

    @Override
    public List<DutyDTO> getDutyList(String name, Integer offset, Integer pageSize) {
        return dutyMapper.getDutyList(name, offset, pageSize);
    }

    @Override
    public Long countDuties(String name) {
        return dutyMapper.countDuties(name);
    }

    @Override
    public boolean createDuty(DutyDTO dutyDTO) {
        return dutyMapper.insertDuty(dutyDTO) > 0;
    }

    @Override
    public boolean updateDuty(DutyDTO dutyDTO) {
        return dutyMapper.updateDuty(dutyDTO) > 0;
    }

    @Override
    public boolean removeById(Long id) {
        return dutyMapper.deleteDutyById(id) > 0;
    }
}
