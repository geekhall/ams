package net.geekhour.loki.mapper;

import net.geekhour.loki.entity.Budget;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.geekhour.loki.entity.dto.BudgetCategorySummaryDTO;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.entity.dto.BudgetDepartmentSummaryDTO;
import net.geekhour.loki.entity.dto.BudgetTypeSummaryDTO;
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
    @Select("<script>" +
            "select a.id, a.year, c.`name` as budgetType, d.`name` as budgetCategory, " +
            "case when a.is_inno=1 THEN '是' ELSE '否' END AS innovation, " +
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
//            "and d.deleted = 0 and e.deleted = 0 " +
            "and d.deleted = 0 " +
            // 关键修改：与 getBudgetList 保持一致
            "and (e.deleted = 0 or e.id is null) " +
            "<if test='year != null and year != \"\"'> " +
            "and a.year = #{year} " +
            "</if>" +
            "<if test='budgetType != null and budgetType != \"\"'> " +
            "and c.name = #{budgetType} " +
            "</if>" +
            "<if test='budgetCategory != null and budgetCategory != \"\"'> " +
            "and d.name = #{budgetCategory} " +
            "</if>" +
            "<if test='innovation != null and innovation != \"\"'> " +
            "and a.is_inno = #{innovation} " +
            "</if>" +
            "<if test='name != null and name != \"\"'> " +
            "and a.name like CONCAT('%', #{name}, '%') " +
            "</if>" +
            "<if test='departmentName != null and departmentName != \"\"'> " +
            "and b.name = #{departmentName} " +
            "</if>"+
            "<if test='tech != null'> " +
            "and <choose> " +
            "  <when test='tech == 1'>b.name = '信息科技部' </when> " +
            "  <when test='tech == 0'>b.name != '信息科技部' </when> " +
            "</choose> " +
            "</if>" +
            "order by a.id " +
            "limit #{offset}, #{pageSize}" +
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
//            "and d.deleted = 0 and e.deleted = 0 " +
            "and d.deleted = 0 " +
            // 关键修改：允许 e 表无匹配（team_id 为 null）的情况
            "and (e.deleted = 0 or e.id is null) " +
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

//    @Select("select b.id, b.name, sum(amount) from h_budget a " +
//            " left join h_department b " +
//            " on a.department_id = b.id " +
//            " where a.deleted = b.deleted " +
//            " group by b.id, b.name " +
//            " order by b.id, b.name ")
//    List<BudgetDepartmentSummaryDTO> getBudgetDepartmentSummary();

    // 原方法：无部门筛选，无参数
// 改为：支持 departmentName 参数，添加部门筛选条件
    @Select("<script>" +
            "select b.id, b.name, sum(a.amount) as totalAmount " +  // 建议加别名，与DTO字段对应
            "from h_budget a " +
            "left join h_department b on a.department_id = b.id " +
            "where a.deleted = 0 and b.deleted = 0 " +  // 修正删除状态判断（原条件 a.deleted = b.deleted 不准确）
            // 新增：部门筛选条件（参数存在时生效）
            "<if test='departmentName != null and departmentName != \"\"'> " +
            "and b.name = #{departmentName} " +
            "</if>" +
            "group by b.id, b.name " +
            "order by b.id " +
            "</script>")
    List<BudgetDepartmentSummaryDTO> getBudgetDepartmentSummary(@Param("departmentName") String departmentName);


//    @Select("select b.id, b.name, sum(amount) from h_budget a " +
//            " left join h_budget_type b " +
//            " on a.type = b.id " +
//            " where a.deleted = 0 and b.deleted=0 " +
//            " group by b.id, b.name " +
//            " order by b.id, b.name ")
//    List<BudgetTypeSummaryDTO> getBudgetTypeSummary();

    // 原方法：无部门筛选，无参数
// 改为：支持 departmentName 参数，关联部门表并筛选
    @Select("<script>" +
            "select b.id, b.name, sum(a.amount) as totalAmount " +
            "from h_budget a " +
            "left join h_budget_type b on a.type = b.id " +
            "left join h_department d on a.department_id = d.id " +  // 新增：关联部门表（用于筛选）
            "where a.deleted = 0 and b.deleted = 0 and d.deleted = 0 " +  // 新增部门表删除状态判断
            // 新增：部门筛选条件
            "<if test='departmentName != null and departmentName != \"\"'> " +
            "and d.name = #{departmentName} " +  // 通过部门表名称筛选
            "</if>" +
            "group by b.id, b.name " +
            "order by b.id " +
            "</script>")
    List<BudgetTypeSummaryDTO> getBudgetTypeSummary(@Param("departmentName") String departmentName);


//    @Select("select b.id, b.name, sum(amount) from h_budget a " +
//            " left join h_budget_category b " +
//            " on a.type = b.id " +
//            " where a.deleted = 0 and b.deleted=0 " +
//            " group by b.id, b.name " +
//            " order by b.id, b.name ")
//    List<BudgetCategorySummaryDTO> getBudgetCategorySummary();

    // 原方法：关联条件错误，无部门筛选
// 改为：修正关联条件，支持 departmentName 参数
    @Select("<script>" +
            "select b.id, b.name, sum(a.amount) as totalAmount " +
            "from h_budget a " +
            "left join h_budget_category b on a.category = b.id " +  // 修正：a.category 关联类别表
            "left join h_department d on a.department_id = d.id " +  // 新增：关联部门表
            "where a.deleted = 0 and b.deleted = 0 and d.deleted = 0 " +  // 新增部门表删除状态判断
            // 新增：部门筛选条件
            "<if test='departmentName != null and departmentName != \"\"'> " +
            "and d.name = #{departmentName} " +
            "</if>" +
            "group by b.id, b.name " +
            "order by b.id " +
            "</script>")
    List<BudgetCategorySummaryDTO> getBudgetCategorySummary(@Param("departmentName") String departmentName);

}
