package net.geekhour.loki.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_product")
@ApiModel(value = "Product对象", description = "")
public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("商品名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("商品描述")
    @TableField("description")
    private String description;

    @ApiModelProperty("品牌")
    @TableField("brand")
    private String brand;

    @ApiModelProperty("价格")
    @TableField("price")
    private BigDecimal price;

    @TableField("is_deleted")
    private Boolean deleted;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
