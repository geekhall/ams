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

    /*
    select a.id, a.year, c.`name` as budgetType, d.`name` as budgetCategory,
        case when a.is_inno=1 THEN '是' ELSE '否' END AS innovation,
        a.`name`, a.description,
        a.amount, b.name as departmentName, e.name as teamName,
        a.priority, a.business_priority, a.business_description,
        FROM_UNIXTIME(a.planned_start_date/1000, '%Y-%m-%d') as planned_start_date,
        a.remark, a.status
        from h_budget a
        left join h_department b on a.department_id = b.id
        left join h_budget_type c on a.type = c.id
        left join h_budget_category d on a.category = d.id
        left join h_team e on a.team_id = e.id
        where a.deleted=0 and b.deleted=0 and c.deleted=0
        and d.deleted = 0 and e.deleted = 0
        and a.year = '2025'
        and a.name like CONCAT('%', #{name}, '%')
        order by a.id
        limit #{offset}, #{pageSize}
     */
//    @Select("<script>" +
//            "select a.id, a.year, c.`name` as budgetType, d.`name` as budgetCategory, " +
//            "case when a.is_inno=1 THEN '是' ELSE '否' END AS innovation, " +
//            "a.`name`, a.description, " +
//            "a.amount, b.name as departmentName, e.name as teamName, " +
//            "a.priority, a.business_priority, a.business_description, " +
//            "FROM_UNIXTIME(a.planned_start_date/1000, '%Y-%m-%d') as planned_start_date, " +
//            "a.remark, a.status " +
//            "from h_budget a " +
//            "left join h_department b on a.department_id = b.id " +
//            "left join h_budget_type c on a.type = c.id " +
//            "left join h_budget_category d on a.category = d.id " +
//            "left join h_team e on a.team_id = e.id " +
//            "where a.deleted=0 and b.deleted=0 and c.deleted=0 " +
//            "and d.deleted = 0 and e.deleted = 0 " +
//            "<if test='year != null and year != \"\"'> " +
//            "and a.year = #{year} " +
//            "</if>" +
//            "<if test='budgetType != null and budgetType != \"\"'> " +
//            "and c.name = #{budgetType} " +
//            "</if>" +
//            "<if test='budgetCategory != null and budgetCategory != \"\"'> " +
//            "and d.name = #{budgetCategory} " +
//            "</if>" +
//            "<if test='innovation != null'> " +
//            "and a.is_inno = #{innovation} " +
//            "</if>" +
//            "<if test='name != null and name != \"\"'> " +
//            "and a.name like CONCAT('%', #{name}, '%') " +
//            "</if>" +
//            "<if test='departmentName != null'> " +
//            "and d.name = #{departmentName} " +
//            "</if>"+
//            "<if test='tech != null'> " +
//            "and <choose> " +
//            "  <when test='tech == 1'>b.name = '信息科技部' </when> " +
//            "  <when test='tech == 0'>b.name != '信息科技部' </when> " +
//            "</choose> " +
//            "</if>" +
//            "order by a.id " +
//            "limit #{offset}, #{pageSize}" +
//            "</script>")
    @Select("<script>" +
            "SELECT a.id, a.year, c.`name` AS budgetType, d.`name` AS budgetCategory, " +
            "CASE WHEN a.is_inno=1 THEN '是' ELSE '否' END AS innovation, " +
            "a.`name`, a.description, " +
            "a.amount, b.name AS departmentName, e.name AS teamName, " +
            "a.priority, a.business_priority, a.business_description, " +
            "FROM_UNIXTIME(a.planned_start_date/1000, '%Y-%m-%d') AS planned_start_date, " +
            "a.remark, a.status " +
            "FROM h_budget a " +
            "LEFT JOIN h_department b ON a.department_id = b.id " +
            "LEFT JOIN h_budget_type c ON a.type = c.id " +
            "LEFT JOIN h_budget_category d ON a.category = d.id " +
            "LEFT JOIN h_team e ON a.team_id = e.id " +
            "<where>" +
            "   a.deleted=0 AND b.deleted=0 AND c.deleted=0 " +
            "   AND d.deleted = 0 AND e.deleted = 0 " +
            "   <if test='year != null and year != \"\"'> " +
            "       AND a.year = #{year} " +
            "   </if>" +
            "   <if test='budgetType != null and budgetType != \"\"'> " +
            "       AND c.name = #{budgetType} " +
            "   </if>" +
            "   <if test='budgetCategory != null and budgetCategory != \"\"'> " +
            "       AND d.name = #{budgetCategory} " +
            "   </if>" +
            "   <if test='innovation != null'> " +
            "       AND a.is_inno = #{innovation} " +
            "   </if>" +
            "   <if test='name != null and name != \"\"'> " +
            "       AND a.name LIKE CONCAT('%', #{name}, '%') " +
            "   </if>" +
            "   <if test='departmentName != null and departmentName != \"\"'> " +  // 修复单引号问题
            "       AND b.name = #{departmentName} " +
            "   </if>" +
            "   <if test='tech != null'> " +
            "       <choose>" +
            "           <when test='tech == 1'>AND b.name = '信息科技部'</when>" +
            "           <when test='tech == 0'>AND b.name != '信息科技部'</when>" +
            "       </choose>" +
            "   </if>" +
            "</where>" +
            "ORDER BY a.id " +
            "LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<BudgetDTO> getBudgetList(@Param("year") Integer year,
                                  @Param("budgetType") String budgetType,
                                  @Param("budgetCategory") String budgetCategory,
                                  @Param("innovation") Integer innovation,
                                  @Param("name") String name,
                                  @Param("tech") Integer tech,
                                  @Param("departmentName") String departmentName,
                                  @Param("offset") Integer offset,
                                  @Param("pageSize") Integer pageSize); // 新增


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
            "<if test='budgetType != null and budgetType != \"\"'> " +
            "and c.name = #{budgetType} " +
            "</if>" +
            "<if test='budgetCategory != null and budgetCategory != \"\"'> " +
            "and d.name = #{budgetCategory} " +
            "</if>" +
            "<if test='innovation != null'> " +
            "and a.is_inno = #{innovation} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "<if test='departmentName != null and departmentName != \"\"'> " +  // 修复单引号问题
            "AND b.name = #{departmentName} " +
            "</if>" +
            "<if test='tech != null'> " +
            "and <choose> " +
            "  <when test='tech == 1'>b.name = '信息科技部' </when> " +
            "  <when test='tech == 0'>b.name != '信息科技部' </when> " +
            "</choose> " +
            "</if>" +
            "</script>")
    Long countBudgets(@Param("year") Integer year,
                      @Param("budgetType") String budgetType,
                      @Param("budgetCategory") String budgetCategory,
                      @Param("innovation") Integer innovation,
                      @Param("name") String name,
                      @Param("tech") Integer tech,
                      @Param("departmentName") String departmentName); // 新增

    @Select("select count(*) from h_budget where name = #{name} and deleted = 0")
    boolean checkBudgetNameExists(@Param("name")  String name);
}
