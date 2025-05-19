package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.MessageReceiver;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

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

    @Update("<script>" +
            "UPDATE h_message_receiver " +
            "SET status = #{status} " +
            "WHERE user_id = #{user_id} AND message_id = #{message_id} AND deleted = 0" +
            "</script>")
    int updateStatusById(@Param("user_id") Long user_id, @Param("message_id") Long message_id, @Param("status") Integer status);
}
