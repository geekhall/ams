package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Jasper Yang
 * @create 2025/04/06 20:03
 */
@Data
@Accessors(chain = true)
@ApiModel(value = "AssetDTO", description = "资产数据传输对象")
public class AssetDTO extends Model<AssetDTO> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private String id;

    @ApiModelProperty("资产名称")
    private String assetName;

    @ApiModelProperty("资产编号")
    private String assetCode;

    @ApiModelProperty("资产类型")
    private String assetType;

    @ApiModelProperty("所属部门")
    private String departmentName;

    @ApiModelProperty("存放地点")
    private String location;

    @ApiModelProperty("状态")
    private String status;

    @ApiModelProperty("购入日期 (YYYY-MM-DD格式)")
    private String purchaseDate;

    @ApiModelProperty("购买价格")
    private BigDecimal purchasePrice;

    @ApiModelProperty("数量")
    private Integer count;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
