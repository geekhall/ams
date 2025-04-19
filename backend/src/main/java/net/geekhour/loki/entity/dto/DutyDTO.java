package net.geekhour.loki.entity.dto;

import lombok.Data;

/**
 * @author Jasper Yang
 * @create 2025/04/19 21:31
 */
@Data
public class DutyDTO {
    private Long id;
    private Long date;
    private String day;
    private String night;
    private String adjust;
    private String core;
    private String corePhone;
    private Long createTime;
    private Long updateTime;
}
