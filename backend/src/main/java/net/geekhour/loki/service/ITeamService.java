package net.geekhour.loki.service;

import net.geekhour.loki.entity.Team;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-13
 */
public interface ITeamService extends IService<Team> {

    boolean existsByName(String name);
}
