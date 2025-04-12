package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Jasper Yang
 * @create 2025/04/12 17:38
 */
@Getter
@Setter
@Accessors(chain = true)
public class DepartmentQuotaDTO extends Model<DepartmentQuotaDTO> {
    private static final long serialVersionUID = 1L;

    private String id;
    private Integer year;
    private String departmentName;
    private BigDecimal quota;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
