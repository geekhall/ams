package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.DepartmentQuota;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.AssetDepartmentQuotaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.math.BigDecimal;
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

    @Select("<script>" +
            "SELECT a.id, b.name as departmentName, a.quota" +
            " FROM h_department_quota a" +
            " LEFT JOIN h_department b" +
            " on a.department_id = b.id" +
            " WHERE a.deleted = 0 and b.deleted=0 and a.quota>0" +
            "<if test='year != null and year != \"\"'> " +
            "AND a.budget_year = #{year} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "AND b.name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            " ORDER BY b.id" +
            " LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<AssetDepartmentQuotaDTO> getQuotaList(@Param("year") int year,
                                               @Param("offset") int offset,
                                               @Param("pageSize") int pageSize,
                                               @Param("name") String name);

    @Select("<script>" +
            "SELECT COUNT(*)" +
            " FROM h_department_quota a" +
            " LEFT JOIN h_department b" +
            " on a.department_id = b.id" +
            " WHERE a.deleted = 0 and b.deleted=0 and a.quota>0" +
            "<if test='year != null and year != \"\"'> " +
            "AND a.budget_year = #{year} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "AND b.name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    long countQuotas(@Param("year") int year, @Param("name") String name);

    @Select("<script>" +
            "SELECT SUM(a.quota)" +
            " FROM h_department_quota a" +
            " LEFT JOIN h_department b" +
            " on a.department_id = b.id" +
            " WHERE a.deleted = 0 and b.deleted=0 and a.quota>0" +
            "<if test='year != null and year != \"\"'> " +
            "AND a.budget_year = #{year} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "AND b.name LIKE CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    BigDecimal totalQuotas(@Param("year") int year, @Param("name") String name);

    @Select("SELECT COUNT(*) FROM h_department_quota " +
            "WHERE department_id = " +
            "(SELECT id FROM h_department WHERE name = #{name} and deleted = 0) " +
            "AND budget_year = #{year} AND deleted = 0")
    boolean checkQuotaExists(@Param("name") String name, Integer year);
}
