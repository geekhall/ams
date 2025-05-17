package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.MessageReceiver;
import net.geekhour.loki.mapper.MessageReceiverMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 消息接收记录表 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Service
public class MessageReceiverServiceImpl extends ServiceImpl<MessageReceiverMapper, MessageReceiver> implements IMessageReceiverService {

}
