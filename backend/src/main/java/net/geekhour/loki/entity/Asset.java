package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.*;
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
 * @since 2025-04-05
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_asset")
@ApiModel(value = "Asset对象", description = "")
public class Asset extends Model<Asset> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("资产名称")
    @TableField("asset_name")
    private String assetName;

    @ApiModelProperty("资产编号")
    @TableField("asset_code")
    private String assetCode;

    @ApiModelProperty("资产类型(外键关联h_asset_type)")
    @TableField("asset_type")
    private Long assetType;

    @ApiModelProperty("所属部门（外键关联h_department)")
    @TableField("department_id")
    private Long departmentId;

    @ApiModelProperty("存放地点")
    @TableField("location")
    private String location;

    @ApiModelProperty("状态 0-正常 1-报废 2-维修")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("购入日期")
    @TableField("purchase_date")
    private Long purchaseDate;

    @ApiModelProperty("购买价格")
    @TableField("purchase_price")
    private BigDecimal purchasePrice;

    @ApiModelProperty("数量")
    @TableField("count")
    private Integer count;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Long createTime;

    @ApiModelProperty("更新时间")
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
