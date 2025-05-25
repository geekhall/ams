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
 * @since 2025-05-25
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_budget_execution")
@ApiModel(value = "BudgetExecution对象", description = "")
public class BudgetExecution extends Model<BudgetExecution> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("预算ID")
    @TableField("budget_id")
    private Long budgetId;

    @ApiModelProperty("执行金额")
    @TableField("execution_amount")
    private BigDecimal executionAmount;

    @ApiModelProperty("执行原因")
    @TableField("execution_reason")
    private String executionReason;

    @ApiModelProperty("执行日期")
    @TableField("execution_date")
    private Long executionDate;

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
