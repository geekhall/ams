package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * @author Jasper Yang
 * @create 2025/04/12 17:38
 */
@Getter
@Setter
@Accessors(chain = true)
public class AssetDepartmentQuotaDTO extends Model<AssetDepartmentQuotaDTO> {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("部门ID")
    private String id;

    @ApiModelProperty("年度")
    private Integer year;

    @ApiModelProperty("部门名称")
    private String departmentName;

    @ApiModelProperty("部门额度")
    private BigDecimal quota;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
