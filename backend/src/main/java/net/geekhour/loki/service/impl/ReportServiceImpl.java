package net.geekhour.loki.service.impl;

import com.alibaba.excel.EasyExcel;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.entity.dto.ReportDTO;
import net.geekhour.loki.mapper.BudgetMapper;
import net.geekhour.loki.payload.ReportRequest;
import net.geekhour.loki.service.IReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReportServiceImpl implements IReportService {
    @Autowired
    private BudgetMapper budgetMapper;

    @Override
    public InputStreamResource generateReport(ReportRequest req) {
        // 1. 拉全年数据
        List<BudgetDTO> all = budgetMapper.getBudgetList(
                req.getYear(), null, null, null, null, null, null,0, Integer.MAX_VALUE
        );

        // 2. 如果 type=quarter，再做 Java 端的过滤
        if ("quarter".equals(req.getType()) && req.getQuarter() != null) {
            int q = req.getQuarter();
            all = all.stream()
                    .filter(dto -> {
                        // 假设 plannedStartDate 格式 "YYYY-MM-DD"
                        int month = Integer.parseInt(dto.getPlannedStartDate().substring(5,7));
                        int start = (q-1)*3 + 1, end = q*3;
                        return month >= start && month <= end;
                    })
                    .collect(Collectors.toList());
        }

        // 3. 写 Excel
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        EasyExcel.write(os, ReportDTO.class)
                .sheet("报告")
                .doWrite(all);
        return new InputStreamResource(
                new ByteArrayInputStream(os.toByteArray())
        );
    }
}
