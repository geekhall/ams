package net.geekhour.loki.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.dto.MessageDTO;
import net.geekhour.loki.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 消息表 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@RestController
@RequestMapping("/api/message")
@Api(tags = "消息管理接口")
public class MessageController {

  @Autowired
  private IMessageService messageService;

  @PostMapping("/list")
  @ApiOperation("获取消息列表")
  @PreAuthorize("hasRole('USER') || hasAuthority('message:view')")
  public ResponseEntity<?> getMessageList(@RequestBody Map<String, Object> params) {
    if (params == null || params.isEmpty()) {
      return ResponseUtil.error(400, "参数不能为空");
    }
    try {
      List<MessageDTO> messageList = messageService.getMessageList(params);
      Long total = messageService.countMessage(params);
      System.out.println("result: " + messageList);

      return ResponseUtil.success(Map.of(
              "items", messageList,
              "total", total));
    } catch (Exception e) {
      return ResponseUtil.error(500, "获取消息列表失败: " + e.getMessage());
    }
  }

  @PostMapping("/send")
  @ApiOperation("发送消息")
  @PreAuthorize("hasRole('ADMIN') || hasAuthority('message:manage')")
  public ResponseEntity<?> sendMessage(@RequestBody MessageDTO messageDTO) {
    try {
      boolean success = messageService.sendMessage(messageDTO);
      return success ? ResponseUtil.success(messageDTO) : ResponseUtil.error(500, "消息发送失败");
    } catch (Exception e) {
      return ResponseUtil.error(500, "消息发送失败: " + e.getMessage());
    }
  }

  @PostMapping("/update")
  @ApiOperation("更新消息")
  @PreAuthorize("hasRole('USER') || hasAuthority('message:manage')")
  public ResponseEntity<?> updateMessage(@RequestBody MessageDTO messageDTO) {
    try {
      System.out.println("updateMessage: " + messageDTO);
      boolean success = messageService.updateMessage(messageDTO);
      return success ? ResponseUtil.success(messageDTO) : ResponseUtil.error(500, "消息更新失败");
    } catch (Exception e) {
      return ResponseUtil.error(500, "消息更新失败: " + e.getMessage());
    }
  }

  @DeleteMapping("/delete/{id}")
  @ApiOperation("删除消息")
  @PreAuthorize("hasRole('USER') || hasAuthority('message:manage')")
  @Transactional
  public ResponseEntity<?> deleteMessage(@PathVariable Long id) {
    try {
      boolean success = messageService.deleteMessage(id);
      return success ? ResponseUtil.success(id) : ResponseUtil.error(500, "消息删除失败");
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("MessageController deleteMessage error: " + e.getMessage());
      return ResponseUtil.error(500, "消息删除失败: " + e.getMessage());
    }
  }
}
