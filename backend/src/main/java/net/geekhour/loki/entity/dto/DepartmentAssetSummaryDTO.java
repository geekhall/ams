package net.geekhour.loki.entity.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel("部门资产汇总")
public class DepartmentAssetSummaryDTO {
    @ApiModelProperty("部门ID")
    private String id;

    @ApiModelProperty("部门名称")
    private String name;

    @ApiModelProperty("资产数量")
    private Long assetCount;
}
