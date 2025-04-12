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
 * @since 2025-04-12
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("h_budget_adjustment")
@ApiModel(value = "BudgetAdjustment对象", description = "")
public class BudgetAdjustment extends Model<BudgetAdjustment> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("预算ID")
    @TableField("budget_id")
    private Long budgetId;

    @ApiModelProperty("申请人ID")
    @TableField("user_id")
    private Long userId;

    @ApiModelProperty("调整金额")
    @TableField("adjustment_amount")
    private BigDecimal adjustmentAmount;

    @ApiModelProperty("调整原因")
    @TableField("adjustment_reason")
    private String adjustmentReason;

    @ApiModelProperty("调整日期")
    @TableField("adjustment_date")
    private Long adjustmentDate;

    @ApiModelProperty("状态 0-待审批 1-审批中 2-已审批 3-已拒绝")
    @TableField("status")
    private Integer status;

    @ApiModelProperty("审批人ID")
    @TableField("approver_id")
    private Long approverId;

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
