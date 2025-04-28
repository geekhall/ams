package net.geekhour.loki.payload;
import lombok.Data;
@Data
public class ReportRequest {

    private Integer year; // 年份
    private String type;  // 类型 (按年/按季度)
    private Integer quarter; // 季度（如果按季度）

    // Getter 和 Setter 方法
    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getQuarter() {
        return quarter;
    }

    public void setQuarter(Integer quarter) {
        this.quarter = quarter;
    }


}

