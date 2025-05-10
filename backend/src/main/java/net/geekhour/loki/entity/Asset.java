package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
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
 * @since 2025-05-10
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_asset")
@ApiModel(value = "Asset对象", description = "资产对象")
public class Asset extends Model<Asset> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    @TableField("id")
    private Long id;

    @ApiModelProperty("资产名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("资产编号")
    @TableField("code")
    private String code;

    @ApiModelProperty("资产序列号")
    @TableField("sn")
    private String sn;

    @ApiModelProperty("资产类型")
    @TableField("type")
    private Long type;

    @ApiModelProperty("设备型号")
    @TableField("model")
    private String model;

    @ApiModelProperty("配置")
    @TableField("config")
    private String config;

    @ApiModelProperty("设备IP")
    @TableField("ip")
    private String ip;

    @ApiModelProperty("描述")
    @TableField("description")
    private String description;

    @ApiModelProperty("供应商")
    @TableField("provider")
    private String provider;

    @ApiModelProperty("所属部门")
    @TableField("department_id")
    private Long departmentId;

    @ApiModelProperty("存放地点")
    @TableField("location")
    private String location;

    @ApiModelProperty("状态 正常 报废 维修")
    @TableField("status")
    private String status;

    @ApiModelProperty("使用状态")
    @TableField("use_status")
    private String useStatus;

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

    @ApiModelProperty("修改时间")
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
