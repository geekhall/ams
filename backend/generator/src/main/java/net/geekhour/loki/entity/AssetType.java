package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
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
 * @since 2025-04-07
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_asset_type")
@ApiModel(value = "AssetType对象", description = "")
public class AssetType extends Model<AssetType> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("资产类型名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("父类型（支持多级分类，跟类型为NULL）")
    @TableField("parent_id")
    private Long parentId;

    @ApiModelProperty("版本号")
    @TableField("version")
    @Version
    private Integer version;

    @ApiModelProperty("创建日期")
    @TableField("create_date")
    private Long createDate;

    @ApiModelProperty("更新日期")
    @TableField("update_date")
    private Long updateDate;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Byte deleted;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
