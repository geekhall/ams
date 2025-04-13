package net.geekhour.loki.entity.dto;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Jasper Yang
 * @create 2025/04/13 16:32
 */
@Getter
@Setter
@Accessors(chain = true)
public class BudgetDTO extends Model<AssetDTO> {

    private static final long serialVersionUID = 1L;
    private String id;
    private Integer year;
    private String name;
    private String description;
    private String type;
    private String category;
    private String inno;
    private BigDecimal amount;
    private String departmentName;
    private String teamName;
    private Integer priority;
    private String businessPriority;
    private String businessDescription;
    private String plannedStartDate;
    private String remark;
    private String status;
//    private String applicantName;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
