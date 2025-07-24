package net.geekhour.loki.service;

import net.geekhour.loki.payload.ReportRequest;
import org.springframework.core.io.InputStreamResource;

public interface IReportService {
    InputStreamResource generateReport(ReportRequest req);
}

