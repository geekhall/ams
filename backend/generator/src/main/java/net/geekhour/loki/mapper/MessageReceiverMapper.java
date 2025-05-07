package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.MessageReceiver;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 消息接收记录表 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Mapper
public interface MessageReceiverMapper extends BaseMapper<MessageReceiver> {

}
