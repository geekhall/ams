package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
@Data
@Accessors(chain = true)
@ApiModel(value = "AssetTypeSummaryDTO", description = "资产类型数据对象")
public class AssetTypeSummaryDTO {

    @ApiModelProperty("类型ID")
    private String id;

    @ApiModelProperty("类型名称")
    private String name;

    @ApiModelProperty("资产总数")
    private Long assetCount;

    @ApiModelProperty("状态")
    private Integer status;

}
