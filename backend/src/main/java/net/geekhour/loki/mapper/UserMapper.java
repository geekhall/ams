package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import jakarta.validation.constraints.NotBlank;
import net.geekhour.loki.entity.User;
import net.geekhour.loki.entity.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

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
            "SELECT a.*, " +
            "GROUP_CONCAT(DISTINCT c.name) AS roles, " +
            "GROUP_CONCAT(DISTINCT e.permission) AS permissions " +
            "FROM h_user a " +
            "LEFT JOIN h_user_role b ON a.id = b.user_id " +
            "LEFT JOIN h_role c ON b.role_id = c.id " +
            "LEFT JOIN h_role_permission d ON c.id = d.role_id " +
            "LEFT JOIN h_permission e ON d.permission_id = e.id " +
            "WHERE a.deleted = 0 and b.deleted = 0 and c.deleted=0 and d.deleted=0 and e.deleted=0 " +
            "<if test='name != null and name != \"\"'> " +
            "AND a.username LIKE CONCAT('%', #{name}, '%') " +
            "</if> " +
            "GROUP BY a.id " +
            "LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<Map<String, Object>> getUserList(@Param("name") String name,
                                          @Param("offset") Integer offset,
                                          @Param("pageSize") Integer pageSize);

    @Select("<script>" +
            "SELECT COUNT(*) " +
            "FROM h_user a " +
            "WHERE a.deleted = 0 " +
            "<if test='name != null and name != \"\"'> " +
            "AND a.username LIKE CONCAT('%', #{name}, '%') " +
            "</if> " +
            "</script>")
    Long countUser(String name, Integer offset, Integer pageSize);



//    int updateUser(UserDTO userDTO);

    @Select("SELECT EXISTS (SELECT 1 FROM h_user WHERE username = #{username} AND deleted = 0)")
    boolean checkUsernameExists(String username);

    @Select("SELECT EXISTS (SELECT 1 FROM h_user WHERE phone = #{phone} AND deleted = 0)")
    boolean checkPhoneExists(String phone);

    @Select("SELECT EXISTS (SELECT 1 FROM h_user WHERE email = #{email} AND deleted = 0)")
    boolean checkEmailExists(String email);
}
