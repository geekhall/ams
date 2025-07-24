package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.geekhour.loki.entity.Environment;
import net.geekhour.loki.mapper.EnvironmentMapper;
import net.geekhour.loki.service.IEnvironmentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 测试环境 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Service
public class EnvironmentServiceImpl extends ServiceImpl<EnvironmentMapper, Environment> implements IEnvironmentService {

}
