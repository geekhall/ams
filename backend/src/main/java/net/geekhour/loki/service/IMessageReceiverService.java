package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.MessageReceiver;
import net.geekhour.loki.entity.dto.MessageReceiverDTO;

import java.util.Map;

/**
 * <p>
 * 消息接收记录表 服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
public interface IMessageReceiverService extends IService<MessageReceiver> {

    /**
     * 获取用户接收消息列表
     *
     * @param params 查询参数
     * @return 分页消息列表
     */
    Page<Message> getMessageReceiverList(Map<String, Object> params);

    /**
     * 更新消息
     *
     * @param messageReceiverDTO 用户接收消息DTO
     * @return 是否成功
     */
    boolean updateMessageReceiver(MessageReceiverDTO messageReceiverDTO);

    /**
     * 删除用户接收消息
     *
     * @param messageReceiverDTO 消息ID、用户ID
     * @return 是否成功
     */
    boolean deleteMessageReceiver(MessageReceiverDTO messageReceiverDTO);
}
