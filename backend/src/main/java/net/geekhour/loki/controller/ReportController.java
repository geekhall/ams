package net.geekhour.loki.controller;

import net.geekhour.loki.payload.ReportRequest;
import net.geekhour.loki.service.IReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/report")
public class ReportController {

    @Autowired
    private IReportService reportService;

    @PostMapping("/export")
    public ResponseEntity<InputStreamResource> exportReport(@RequestBody ReportRequest req) {
        // service 返回一个包装了 Excel 流的 InputStreamResource
        InputStreamResource resource = reportService.generateReport(req);

        String fileName = "预算执行报告_" + req.getYear() + "_" + req.getType() + ".xlsx";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                .contentType(MediaType.parseMediaType(
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(resource);
    }
}
