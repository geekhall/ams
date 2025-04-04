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
@TableName("h_image")
@ApiModel(value = "Image对象", description = "")
public class Image extends Model<Image> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("名称")
    @TableField("name")
    private String name;

    @ApiModelProperty("类型")
    @TableField("type")
    private String type;

    @ApiModelProperty("路径")
    @TableField("path")
    private String path;

    @ApiModelProperty("数据")
    @TableField("data")
    private byte[] data;

    @Override
    public Serializable pkVal() {
        return null;
    }
}
