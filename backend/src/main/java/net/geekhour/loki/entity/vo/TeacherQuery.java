package net.geekhour.loki.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * TeacherQuery
 *
 * @author Jasper Yang
 * @create 2024/11/03 22:31
 */
@Data
public class TeacherQuery {
    @ApiModelProperty(value = "教师名称，模糊查询")
    private String name;

    @ApiModelProperty(value = "头衔，1-高级 2-资深 3-专家")
    private Integer level;

    @ApiModelProperty(value = "查询开始时间", example = "2022-02-22 02:22:22")
    private String begin;

    @ApiModelProperty(value = "查询结束时间", example = "2022-02-22 22:22:22")
    private String end;
}
