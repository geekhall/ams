package net.geekhour.loki.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiOperation;
import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Message;
import net.geekhour.loki.entity.dto.MessageReceiverDTO;
import net.geekhour.loki.service.IMessageReceiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 消息接收记录表 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@CrossOrigin
@RestController
@RequestMapping("/api/mr")
public class MessageReceiverController {

    @Autowired
    private IMessageReceiverService messageReceiverService;

    @PostMapping("/list")
    @ApiOperation("获取接收消息列表")
    @PreAuthorize("hasRole('USER') || hasAuthority('messageReceiver:view')")
    public ResponseEntity<?> getMessageReceiverList(@RequestBody Map<String, Object> params) {
        if (params == null || params.isEmpty()) {
            return ResponseUtil.error(400, "参数不能为空");
        }
        try {
            Page<Message> result = messageReceiverService.getMessageReceiverList(params);

            Map<String, Object> data = new HashMap<>();
            data.put("total", result.getTotal());
            data.put("list", result.getRecords());

            return ResponseUtil.success(data);
        } catch (Exception e) {
            return ResponseUtil.error(500, "获取消息列表失败: " + e.getMessage());
        }
    }

    @PostMapping("/update")
    @ApiOperation("修改消息读取及状态")
    @PreAuthorize("hasRole('USER') || hasAuthority('messageReceiver:manage')")
    public ResponseEntity<?> updateMessage(@RequestBody MessageReceiverDTO messageReceiverDTO) {
        try {
            boolean success = messageReceiverService.updateMessageReceiver(messageReceiverDTO);
            return success ? ResponseUtil.success(messageReceiverDTO) : ResponseUtil.error(500, "消息更新失败");
        } catch (Exception e) {
            return ResponseUtil.error(500, "消息更新失败: " + e.getMessage());
        }
    }

    @DeleteMapping("/delete")
    @ApiOperation("删除消息")
    @PreAuthorize("hasRole('USER') || hasAuthority('messageReceiver:manage')")
    @Transactional
    public ResponseEntity<?> deleteMessage(@RequestBody MessageReceiverDTO messageReceiverDTO) {
        try {
            boolean success = messageReceiverService.deleteMessageReceiver(messageReceiverDTO);
            return success ? ResponseUtil.success(messageReceiverDTO) : ResponseUtil.error(500, "消息删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MessageReceiverController deleteMessageReceiver error: " + e.getMessage());
            return ResponseUtil.error(500, "消息删除失败: " + e.getMessage());
        }
    }
}