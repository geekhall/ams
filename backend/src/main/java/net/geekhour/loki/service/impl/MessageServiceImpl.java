package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
    public Page<Message> getMessageList(Map<String, Object> params) {
        Integer page = (Integer) params.get("page");
        Integer pageSize = (Integer) params.get("pageSize");
        String search = (String) params.get("search");

        Page<Message> pageParam = new Page<>(page, pageSize);
        LambdaQueryWrapper<Message> queryWrapper = new LambdaQueryWrapper<>();

        if (search != null && !search.isEmpty()) {
          queryWrapper.like(Message::getTitle, search)
              .or()
              .like(Message::getContent, search);
        }

        queryWrapper.orderByDesc(Message::getSendTime);

        return messageMapper.selectPage(pageParam, queryWrapper);
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
                            .setIsRead(false)
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
        Message message = new Message();
        BeanUtils.copyProperties(messageDTO, message);

        message.setUpdateDate(System.currentTimeMillis());

        return messageMapper.updateById(message) > 0;
    }

    @Override
    @Transactional
    public boolean deleteMessage(Long id) {
    return messageMapper.deleteById(id) > 0;
    }
}
