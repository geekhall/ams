package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.MessageReceiver;
import net.geekhour.loki.entity.dto.MessageReceiverDTO;
import net.geekhour.loki.mapper.MessageMapper;
import net.geekhour.loki.mapper.MessageReceiverMapper;
import net.geekhour.loki.service.IMessageReceiverService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MessageReceiverMapper messageReceiverMapper;

    public MessageReceiverServiceImpl(MessageReceiverMapper messageReceiverMapper) {
        this.messageReceiverMapper = messageReceiverMapper;
    }

    @Override
    public Page<Message> getMessageReceiverList(Map<String, Object> params) {
        Integer page = (Integer) params.get("page");
        Integer pageSize = (Integer) params.get("pageSize");
        Integer isRead = (Integer) params.get("isRead");
        Integer status = (Integer) params.get("status");
        String userId = (String) params.get("userId");
        String search = (String) params.get("search");

        Page<Message> pageParam = new Page<>(page, pageSize);
        LambdaQueryWrapper<MessageReceiver> queryReceiverWrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<Message> queryMessageWrapper = new LambdaQueryWrapper<>();

        if (isRead != null && status != null && userId != null && !userId.isEmpty()) {
            queryReceiverWrapper.eq(MessageReceiver::getIsRead, isRead)
                    .eq(MessageReceiver::getStatus, status)
                    .eq(MessageReceiver::getUserId, userId);
        }
        List<MessageReceiver> messageReceivers = messageReceiverMapper.selectList(queryReceiverWrapper);
        //获取当前用户可见消息ID集合
        if (!messageReceivers.isEmpty() && messageReceivers.size() > 0) {
            List<Long> messageIdList = messageReceivers.stream()
                    .map(MessageReceiver::getMessageId)
                    .collect(Collectors.toList());

            if (search != null && !search.isEmpty()) {
                queryMessageWrapper.like(Message::getTitle, search)
                        .or()
                        .like(Message::getContent, search);
            }
            queryMessageWrapper.in(Message::getId, messageIdList);
            queryMessageWrapper.orderByDesc(Message::getCreateDate);
            return messageMapper.selectPage(pageParam, queryMessageWrapper);
        }
        pageParam.setRecords(null);
        return pageParam;
    }

    @Override
    @Transactional
    public boolean updateMessageReceiver(MessageReceiverDTO messageReceiverDTO) {

        MessageReceiver messageReceiver = new MessageReceiver();
        BeanUtils.copyProperties(messageReceiverDTO, messageReceiver);

        LambdaUpdateWrapper<MessageReceiver> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(MessageReceiver::getUserId, messageReceiverDTO.getUserId());
        wrapper.eq(MessageReceiver::getMessageId, messageReceiverDTO.getMessageId());
        if (messageReceiverDTO.getIsRead()) {
            messageReceiver.setReadTime(System.currentTimeMillis());
        }

        return messageReceiverMapper.update(messageReceiver, wrapper) > 0;
    }

    @Override
    public boolean deleteMessageReceiver(MessageReceiverDTO messageReceiverDTO) {
        LambdaQueryWrapper<MessageReceiver> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(MessageReceiver::getUserId, messageReceiverDTO.getUserId());
        wrapper.eq(MessageReceiver::getMessageId, messageReceiverDTO.getMessageId());
        return messageReceiverMapper.delete(wrapper) > 0;
    }
}
