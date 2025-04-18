package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Jasper Yang
 * @create 2025/04/06 20:03
 */
@Getter
@Setter
@Accessors(chain = true)
public class AssetDTO extends Model<AssetDTO> {

    private static final long serialVersionUID = 1L;
    private String id;
    private String assetName;
    private String assetCode;
    private String assetType;
    private String departmentName;
    private String location;
    private String status;
    private String purchaseDate;
    private BigDecimal purchasePrice;
    private Integer count;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
