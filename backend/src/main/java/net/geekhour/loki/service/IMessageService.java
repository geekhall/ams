package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.dto.MessageDTO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 消息表 服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
public interface IMessageService extends IService<Message> {

  /**
   * 获取消息列表
   *
   * @param params 查询参数
   * @return 分页消息列表
   */
  Page<Message> getMessageList(Map<String, Object> params);

  /**
   * 发送消息
   *
   * @param messageDTO 消息DTO
   * @return 是否成功
   */
  boolean sendMessage(MessageDTO messageDTO);

  /**
   * 更新消息
   *
   * @param messageDTO 消息DTO
   * @return 是否成功
   */
  boolean updateMessage(MessageDTO messageDTO);

  /**
   * 删除消息
   *
   * @param id 消息ID
   * @return 是否成功
   */
  boolean deleteMessage(Long id);
}
