package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.Budget;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.BudgetDTO;
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
public interface BudgetMapper extends BaseMapper<Budget> {

    @Select("<script>" +
            "select a.id, a.year, c.`name` as type, d.`name` as category, " +
            "case when a.is_inno=1 THEN '是' ELSE '否' END AS inno, " +
            "a.`name`, a.description, " +
            "a.amount, b.name as departmentName, e.name as teamName, " +
            "a.priority, a.business_priority, a.business_description, " +
            "FROM_UNIXTIME(a.planned_start_date/1000, '%Y-%m-%d') as planned_start_date, " +
            "a.remark, a.status " +
            "from h_budget a " +
            "left join h_department b on a.department_id = b.id " +
            "left join h_budget_type c on a.type = c.id " +
            "left join h_budget_category d on a.category = d.id " +
            "left join h_team e on a.team_id = e.id " +
            "where a.deleted=0 and b.deleted=0 and c.deleted=0 " +
            "and d.deleted = 0 and e.deleted = 0 " +
            "<if test='year != null and year != \"\"'> " +
            "and a.year = #{year} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "order by a.id " +
            "limit #{offset}, #{pageSize}" +
            "</script>")
    List<BudgetDTO> getBudgetList(@Param("year") Integer year,
                                  @Param("offset") Integer offset,
                                  @Param("pageSize") Integer pageSize,
                                  @Param("name") String name);


    @Select("<script>" +
            "select count(*) from h_budget a " +
            "left join h_department b on a.department_id = b.id " +
            "left join h_budget_type c on a.type = c.id " +
            "left join h_budget_category d on a.category = d.id " +
            "left join h_team e on a.team_id = e.id " +
            "where a.deleted=0 and b.deleted=0 and c.deleted=0 " +
            "and d.deleted = 0 and e.deleted = 0 " +
            "<if test='year != null and year != \"\"'> " +
            "and a.year = #{year} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "</script>")
    Long countBudgets(@Param("year") Integer year, @Param("name") String name);
}
