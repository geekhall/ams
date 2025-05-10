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
    private String name;

    @ApiModelProperty("编号")
    private String code;

    @ApiModelProperty("序列号")
    private String sn;

    @ApiModelProperty("类型")
    private String type;

    @ApiModelProperty("型号")
    private String model;

    @ApiModelProperty("配置")
    private String config;

    @ApiModelProperty("IP")
    private String ip;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("供应商")
    private String provider;

    @ApiModelProperty("所属部门")
    private String departmentName;

    @ApiModelProperty("存放地点")
    private String location;

    @ApiModelProperty("状态")
    private String status;

    @ApiModelProperty("使用状态")
    private String useStatus;

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
