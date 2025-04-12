package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.DepartmentQuota;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.DepartmentQuotaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Mapper
public interface DepartmentQuotaMapper extends BaseMapper<DepartmentQuota> {
//
//    <select id="selectAll" resultType="net.geekhour.loki.entity.dto.DepartmentQuota">
//    SELECT * FROM h_department_quota WHERE deleted = 0
//            </select>
//
//            <select id="selectQuotaList" resultType="net.geekhour.loki.entity.dto.DepartmentQuotaDTO">
//    SELECT a.id, b.name, a.budget_year, a.quota
//    FROM h_department_quota a
//    LEFT JOIN h_department b
//    on a.department_id = b.id
//    WHERE a.deleted = 0 and b.deleted=0
//        <if test="name != null and name != ''">
//    AND b.name LIKE CONCAT('%', #{name}, '%')
//        </if>
//    ORDER BY a.id
//    LIMIT #{offset}, #{pageSize}
//    </select>
//
//    <select id="countQuotas" resultType="long">
//    SELECT COUNT(*)
//    FROM h_department_quota a
//    LEFT JOIN h_department b
//    on a.department_id = b.id
//    WHERE a.deleted = 0 and b.deleted=0
//        <if test="name != null and name != ''">
//    AND b.name LIKE CONCAT('%', #{name}, '%')
//        </if>
//    </select>
//
//    <insert id="insertQuota" parameterType="net.geekhour.loki.entity.dto.DepartmentQuotaDTO">
//    INSERT INTO h_department_quota (budget_year, department_id, quota, created_time, updated_time)
//    VALUES (#{departmentName}, #{quota}, NOW(), NOW())
//    </insert>
//
//    <update id="updateQuota" parameterType="net.geekhour.loki.entity.dto.DepartmentQuotaDTO">
//    UPDATE h_department_quota
//    SET department_name = #{departmentName},
//    quota = #{quota},
//    updated_at = NOW()
//    WHERE id = #{id}
//    </update>
//
//    <delete id="deleteQuotaById">
//    UPDATE h_department_quota
//    SET deleted = 1
//    WHERE id = #{id}
//    </delete>
//

//    SELECT a.id, b.name, a.budget_year, a.quota
//    FROM h_department_quota a
//    LEFT JOIN h_department b
//    on a.department_id = b.id
//    WHERE a.deleted = 0 and b.deleted=0
//        <if test="name != null and name != ''">
//    AND b.name LIKE CONCAT('%', #{name}, '%')
//        </if>
//    ORDER BY a.id
//    LIMIT #{offset}, #{pageSize}
    @Select("<script>" +
            "SELECT a.id, a.budget_year as year, b.name as departmentName, a.quota" +
            " FROM h_department_quota a" +
            " LEFT JOIN h_department b" +
            " on a.department_id = b.id" +
            " WHERE a.deleted = 0 and b.deleted=0 and a.quota>0" +
            "<if test='name != null and name != \"\"'> " +
            "AND b.name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            " ORDER BY b.id" +
            " LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<DepartmentQuotaDTO> getQuotaList(@Param("offset") int offset, @Param("pageSize") int pageSize, @Param("name") String name);

    @Select("<script>" +
            "SELECT COUNT(*)" +
            " FROM h_department_quota a" +
            " LEFT JOIN h_department b" +
            " on a.department_id = b.id" +
            " WHERE a.deleted = 0 and b.deleted=0" +
            "<if test='name != null and name != \"\"'> " +
            "AND b.name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    long countQuotas(@Param("name") String name);

    @Select("SELECT COUNT(*) FROM h_department_quota " +
            "WHERE department_id = " +
            "(SELECT id FROM h_department WHERE name = #{departmentName} and deleted = 0) " +
            "AND budget_year = #{year} AND deleted = 0")
    boolean checkQuotaExists(String departmentName, Integer year);
}
