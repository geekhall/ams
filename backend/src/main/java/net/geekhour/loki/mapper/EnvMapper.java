package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.Env;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 测试环境 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Mapper
public interface EnvMapper extends BaseMapper<Env> {

}
