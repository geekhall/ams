package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.geekhour.loki.entity.Team;
import net.geekhour.loki.mapper.TeamMapper;
import net.geekhour.loki.service.ITeamService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-13
 */
@Service
public class TeamServiceImpl extends ServiceImpl<TeamMapper, Team> implements ITeamService {

    @Autowired
    TeamMapper teamMapper;

    @Override
    public boolean existsByName(String name) {
        return teamMapper.selectCount(new QueryWrapper<Team>().eq("name", name)) > 0;
    }
}
