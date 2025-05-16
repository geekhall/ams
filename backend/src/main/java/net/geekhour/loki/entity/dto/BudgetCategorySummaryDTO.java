package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * BudgetTypeSummaryDTO
 *
 * @author yiny
 * @date 2025/5/16 11:47
 */
@Getter
@Setter
@Accessors(chain = true)
public class BudgetCategorySummaryDTO {

    @ApiModelProperty("ID")
    private String id;

    @ApiModelProperty("分类名称")
    private String name;

    @ApiModelProperty("分类预算总额")
    private BigDecimal budgetAmount;
}