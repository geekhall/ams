package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import jakarta.validation.constraints.NotBlank;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 用户 Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from h_user where id = #{id}")
    User selectById(Long id);

    @Select("select * from h_user where username = #{username}")
    User selectByUsername(String username);

    @Select("select EXISTS (SELECT 1 FROM h_user where username = #{role_name})")
    boolean existsByUsername(String username);

    // TODO: remove password from select
    @Select("select * from h_user where email = #{email}")
    User selectByEmail(String email);

    @Select("select EXISTS (SELECT 1 FROM h_user where email = #{email})")
    boolean existsByEmail(String email);

    @Select("select * from h_user where username = #{username}")
    Long getIdByUsername(String username);

    @Select("select password from h_user where username = #{username}")
    String getEncryptedPasswordByUsername(@NotBlank String username);

    @Select("select distinct c.name from h_user a " +
            "left join h_user_role b on a.id = b.user_id " +
            "left join h_role c on b.role_id = c.id " +
            "where a.username=#{username} " +
            "and a.status=0 and a.deleted=0 and b.deleted = 0 and c.deleted=0")
    List<String> getRolesByUsername(@NotBlank String username);

    @Select("select distinct e.permission from h_user a " +
            "left join h_user_role b on a.id = b.user_id " +
            "left join h_role c on b.role_id = c.id " +
            "left join h_role_permission d on c.id = d.role_id " +
            "left join h_permission e on d.permission_id = e.id " +
            "where a.username=#{username} and e.permission is not NULL " +
            "and a.status=0 and a.deleted=0 and b.deleted = 0 and c.deleted=0 and d.deleted=0 and e.deleted=0")
    List<String> getPermissionsByUsername(@NotBlank String username);

    @Select("<script>" +
            "SELECT * FROM h_user " +
            "WHERE deleted = 0 " +
            "<if test='name != null and name != \"\"'> " +
            "AND username LIKE CONCAT('%', #{name}, '%') " +
            "</if> " +
            "LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<UserDTO> getUserList(@Param("name") String name,
                              @Param("offset") Integer offset,
                              @Param("pageSize") Integer pageSize);
}
