package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

import com.alibaba.excel.annotation.ExcelProperty;


/**
 * @author Jasper Yang
 * @create 2025/04/13 16:32
 */
@Getter
@Setter
@Accessors(chain = true)
public class BudgetDTO extends Model<BudgetDTO> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("预算ID")
    private String id;

    @ApiModelProperty("预算年份")
    private Integer year;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("预算类型")
    private String budgetType;

    @ApiModelProperty("预算分类")
    private String budgetCategory;

    @ApiModelProperty("是否信创")
    private String innovation;

    @ApiModelProperty("金额")
    private BigDecimal amount;

    @ApiModelProperty("部门名称")
    private String departmentName;

    @ApiModelProperty("团队名称")
    private String teamName;

    @ApiModelProperty("优先级")
    private String priority;

    @ApiModelProperty("业务优先级")
    private String businessPriority;

    @ApiModelProperty("业务优先级说明")
    private String businessDescription;

    @ApiModelProperty("计划开始日期")
    private String plannedStartDate;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("状态")
    private String status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }

    public String toString() {
        return "BudgetDTO{" +
                "id='" + id + '\'' +
                ", year=" + year +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", budgetType='" + budgetType + '\'' +
                ", budgetCategory='" + budgetCategory + '\'' +
                ", innovation='" + innovation + '\'' +
                ", amount=" + amount +
                ", departmentName='" + departmentName + '\'' +
                ", teamName='" + teamName + '\'' +
                ", priority='" + priority + '\'' +
                ", businessPriority='" + businessPriority + '\'' +
                ", businessDescription='" + businessDescription + '\'' +
                ", plannedStartDate='" + plannedStartDate + '\'' +
                ", remark='" + remark + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
