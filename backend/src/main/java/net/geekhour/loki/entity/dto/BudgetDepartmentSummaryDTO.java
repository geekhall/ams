package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * BudgetSummaryDTO
 *
 * @author yiny
 * @date 2025/5/16 11:46
 */
@Getter
@Setter
@Accessors(chain = true)
public class BudgetDepartmentSummaryDTO {

    @ApiModelProperty("ID")
    private String id;

    @ApiModelProperty("部门名称")
    private String name;

    @ApiModelProperty("部门预算总额")
    private String budgetAmount;

}
