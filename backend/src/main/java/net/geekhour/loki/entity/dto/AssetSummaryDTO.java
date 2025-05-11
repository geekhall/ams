package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * @author Jasper Yang
 * @create 2025/05/11 01:03
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "AssetSummaryDTO", description = "资产看板数据对象")
public class AssetSummaryDTO {

    @ApiModelProperty("资产总数")
    private Long totalCount;

    @ApiModelProperty("资产总值")
    private BigDecimal totalValue;

    @ApiModelProperty("较上月总数增长率")
    private BigDecimal monthlyCountGrowth;

    @ApiModelProperty("较上月总值增长率")
    private BigDecimal monthlyValueGrowth;
}
