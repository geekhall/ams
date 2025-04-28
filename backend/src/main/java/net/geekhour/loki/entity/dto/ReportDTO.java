package net.geekhour.loki.entity.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;  // ← 导入这一行

import java.math.BigDecimal;

@Getter
@Setter
@Accessors(chain = true)              // ← 打开链式调用
public class ReportDTO {
    @ExcelProperty("ID")
    private String id;

    @ExcelProperty("年度")
    private Integer year;

    @ExcelProperty("项目名称")
    private String name;

    @ExcelProperty("项目描述")
    private String description;

    @ExcelProperty("预算类型")
    private String budgetType;

    @ExcelProperty("预算类别")
    private String budgetCategory;

    @ExcelProperty("是否信创")
    private String innovation;

    @ExcelProperty("预算金额")
    private BigDecimal amount;

    @ExcelProperty("部门名称")
    private String departmentName;

    @ExcelProperty("团队名称")
    private String teamName;

    @ExcelProperty("优先级")
    private String priority;

    @ExcelProperty("业务优先级")
    private String businessPriority;

    @ExcelProperty("业务描述")
    private String businessDescription;

    @ExcelProperty("计划开始日期")
    private String plannedStartDate;

    @ExcelProperty("备注")
    private String remark;

    @ExcelProperty("状态")
    private String status;
}
