package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.dto.MessageDTO;
import net.geekhour.loki.mapper.MessageMapper;
import net.geekhour.loki.service.IMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * <p>
 * 消息表 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Service
@RequiredArgsConstructor
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {

  private final MessageMapper messageMapper;

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

    return messageMapper.insert(message) > 0;
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
