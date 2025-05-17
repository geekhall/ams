package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.Message;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 消息表 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-05-07
 */
@Mapper
public interface MessageMapper extends BaseMapper<Message> {

    /**
     * 获取消息列表
     *
     * @param userId   用户ID
     * @param search   搜索关键字
     * @param page     页码
     * @param pageSize 每页大小
     * @return 消息列表
     */
    @Select("<script>" +
            "SELECT b.id, b.title, b.content, b.sender, b.type, b.send_time, a.status " +
            "FROM h_message_receiver a " +
            "LEFT JOIN h_message b ON a.message_id = b.id " +
            "WHERE a.deleted = 0 and a.deleted = 0 " +
            "<if test='userId != null and userId != \"\"'> AND a.user_id = #{userId} </if> " +
            "<if test='search != null and search != \"\"'> AND b.title LIKE CONCAT('%', #{search}, '%') </if> " +
            "ORDER BY b.send_time DESC " +
            "<if test='page != null and pageSize != null'> LIMIT #{pageSize} OFFSET #{page} </if>" +
            "</script>")
    List<MessageDTO> getMessageList(@Param("userId") String userId,
                                    @Param("search") String search,
                                    @Param("page") Integer page,
                                    @Param("pageSize") Integer pageSize);

    @Select("<script>" +
            "SELECT count(*) " +
            "FROM h_message_receiver a " +
            "LEFT JOIN h_message b ON a.message_id = b.id " +
            "WHERE a.deleted = 0 and a.deleted = 0 " +
            "<if test='userId != null and userId != \"\"'> AND a.user_id = #{userId} </if> " +
            "<if test='search != null and search != \"\"'> AND b.title LIKE CONCAT('%', #{search}, '%') </if> " +
            "</script>")
    Long countMessage(@Param("userId") String userId, @Param("search") String search);
}
