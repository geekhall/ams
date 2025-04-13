package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-13
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_budget")
@ApiModel(value = "Budget对象", description = "")
public class Budget extends Model<Budget> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("预算年度")
    @TableField("year")
    private Integer year;

    @ApiModelProperty("项目名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("项目描述")
    @TableField("description")
    private String description;

    @ApiModelProperty("项目类型(外键关联h_budget_type)")
    @TableField("type")
    private Long type;

    @ApiModelProperty("项目性质(外键关联h_budget_category)")
    @TableField("category")
    private Long category;

    @ApiModelProperty("是否信创 0-是 1-否")
    @TableField("is_inno")
    private Boolean inno;

    @ApiModelProperty("预算金额")
    @TableField("amount")
    private BigDecimal amount;

    @ApiModelProperty("所属部门（外键关联h_department)")
    @TableField("department_id")
    private Long departmentId;

    @ApiModelProperty("所属团队（外键关联h_team)")
    @TableField("team_id")
    private Long teamId;

    @ApiModelProperty("优先级 1-高 2-中 3-低")
    @TableField("priority")
    private String priority;

    @ApiModelProperty("业务优先级")
    @TableField("business_priority")
    private String businessPriority;

    @ApiModelProperty("业务优先级情况说明")
    @TableField("business_description")
    private String businessDescription;

    @ApiModelProperty("计划开始日期")
    @TableField("planned_start_date")
    private Long plannedStartDate;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("状态 0-待审批 1-审批中 2-已审批 3-已拒绝")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("申请人ID")
    @TableField("applicant_id")
    private Long applicantId;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Long createTime;

    @ApiModelProperty("修改时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Long updateTime;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Byte deleted;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
