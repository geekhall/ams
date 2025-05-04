package net.geekhour.loki.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.UserRole;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-03-08
 */
@Mapper
public interface UserRoleMapper extends BaseMapper<UserRole> {

    @Insert("INSERT INTO h_user_role (user_id, role_id) VALUES (#{userId}, #{roleId})")
    void insertUserRole(@Param("userId") Long userId, @Param("roleId") Long roleId);
}
