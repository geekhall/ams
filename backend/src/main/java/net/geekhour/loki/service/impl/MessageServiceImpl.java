package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.MessageReceiver;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.MessageDTO;
import net.geekhour.loki.mapper.MessageMapper;
import net.geekhour.loki.mapper.MessageReceiverMapper;
import net.geekhour.loki.mapper.UserMapper;
import net.geekhour.loki.service.IMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 消息表 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MessageReceiverMapper messageReceiverMapper;

    @Override
    public List<MessageDTO> getMessageList(Map<String, Object> params) {
        String userId = (String) params.get("userId");
        String search = (String) params.get("search");
        int pageIndex = params.get("pageIndex") == null ? 1 : ((Number) params.get("pageIndex")).intValue();
        int pageSize = params.get("pageSize") == null ? 10 : ((Number) params.get("pageSize")).intValue();
        Integer offset = (pageIndex - 1) * pageSize;

        return messageMapper.getMessageList(userId, search, offset, pageSize);
    }

    @Override
    public Long countMessage(Map<String, Object> params) {
        String userId = (String) params.get("userId");
        String search = (String) params.get("search");
        Long count = messageMapper.countMessage(userId, search);

        return count;
    }

    @Override
    public boolean updateMessageStatusById(Map<String, Object> params) {
        Object userIdObj = params.get("user_id");
        Object messageIdObj = params.get("message_id");
        Object statusObj = params.get("status");

        if (userIdObj == null || messageIdObj == null || statusObj == null) {
            return false;
        }

        Long userId = userIdObj instanceof Long ? (Long) userIdObj : Long.valueOf(userIdObj.toString());
        Long messageId = messageIdObj instanceof Long ? (Long) messageIdObj : Long.valueOf(messageIdObj.toString());
        Integer status = statusObj instanceof Integer ? (Integer) statusObj : Integer.valueOf(statusObj.toString());

        int result = messageReceiverMapper.updateStatusById(userId, messageId, status);
        return result > 0;
    }

    @Override
    @Transactional
    public boolean sendMessage(MessageDTO messageDTO) {
        Message message = new Message();
        BeanUtils.copyProperties(messageDTO, message);

        message.setSendTime(System.currentTimeMillis())
            .setCreateDate(System.currentTimeMillis())
            .setUpdateDate(System.currentTimeMillis())
            .setDeleted((byte) 0);

        // 插入消息记录
        boolean messageInserted = messageMapper.insert(message) > 0;
        if (!messageInserted) {
            return false;
        }

        // 获取所有用户ID（这里需要注入UserMapper或UserService）
        List<Long> userIds = userMapper.selectList(null).stream()
                .map(User::getId)
                .collect(Collectors.toList());

        // 如果没有用户，则不需要插入消息接收记录
        if (userIds.isEmpty()) {
            return true;
        }

        // 批量插入消息接收记录
        List<MessageReceiver> receivers = userIds.stream()
                .map(userId -> {
                    MessageReceiver receiver = new MessageReceiver();
                    receiver.setMessageId(message.getId())
                            .setUserId(userId)
                            .setStatus(0L)
                            .setCreateDate(System.currentTimeMillis())
                            .setUpdateDate(System.currentTimeMillis())
                            .setDeleted((byte) 0);
                    return receiver;
                })
                .collect(Collectors.toList());

        messageReceiverMapper.insert(receivers);

        return true;
    }

    @Override
    @Transactional
    public boolean updateMessage(MessageDTO messageDTO) {
        // 先查询消息是否存在
        Message existingMessage = messageMapper.selectById(messageDTO.getId());
        if (existingMessage == null) {
            return false; // 消息不存在
        }
        // 更新消息
        Message message = mapToMessage(messageDTO);
        if (message == null) {
            return false; // 映射失败
        }
        message.setUpdateDate(System.currentTimeMillis());
        message.setDeleted((byte) 0);

        return messageMapper.updateById(message) > 0;
    }

    private Message mapToMessage(MessageDTO messageDTO) {
        Message message = new Message();
        if (messageDTO.getId() != null && !messageDTO.getId().isEmpty()) {
            message.setId(Long.valueOf(messageDTO.getId()));
        } else {
            return null; // ID不能为空
        }
        message.setTitle(messageDTO.getTitle());
        message.setContent(messageDTO.getContent());
        message.setType(messageDTO.getType());
        message.setSender(messageDTO.getSender());
        return message;
    }

    @Override
    @Transactional
    public boolean deleteMessage(Long id) {
    return messageMapper.deleteById(id) > 0;
    }


}
