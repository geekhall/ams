package net.geekhour.loki.service.impl;

import net.geekhour.loki.entity.Budget;
import net.geekhour.loki.entity.dto.BudgetCategorySummaryDTO;
import net.geekhour.loki.entity.dto.BudgetDTO;
import net.geekhour.loki.entity.dto.BudgetDepartmentSummaryDTO;
import net.geekhour.loki.entity.dto.BudgetTypeSummaryDTO;
import net.geekhour.loki.mapper.*;
import net.geekhour.loki.service.IBudgetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-12
 */
@Service
public class BudgetServiceImpl extends ServiceImpl<BudgetMapper, Budget> implements IBudgetService {

    @Autowired
    BudgetMapper budgetMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    TeamMapper teamMapper;

    @Autowired
    BudgetTypeMapper budgetTypeMapper;

    @Autowired
    BudgetCategoryMapper budgetCategoryMapper;

    @Override
    public List<Budget> all() {
        return budgetMapper.selectList(null);
    }

    @Override
    public List<BudgetDTO> getBudgetList(Integer year,
                                         String budgetType,
                                         String budgetCategory,
                                         Integer innovation,
                                         String name,
                                         Integer tech,
                                         String departmentName,
                                         Integer offset,
                                         Integer pageSize) { // 新增的季度参数
        return budgetMapper.getBudgetList(year, budgetType, budgetCategory, innovation, name, tech, departmentName,offset, pageSize);
    }

    @Override
    public Long countBudgets(Integer year,
                             String budgetType,
                             String budgetCategory,
                             Integer innovation,
                             String name,
                             Integer tech,
                             String departmentName) {
        return budgetMapper.countBudgets(year, budgetType, budgetCategory, innovation, name, tech,  departmentName);
    }

    @Override
    @Transactional
    public boolean createBudget(BudgetDTO budgetDTO) {
        if (budgetDTO.getName() == null || budgetDTO.getName().isEmpty()) {
            return false;
        }
        if (budgetDTO.getDepartmentName() == null || budgetDTO.getDepartmentName().isEmpty()) {
            return false;
        }
        if (budgetDTO.getBudgetType() == null || budgetDTO.getBudgetType().isEmpty()) {
            return false;
        }
        if (budgetDTO.getBudgetCategory() == null || budgetDTO.getBudgetCategory().isEmpty()) {
            return false;
        }
        Budget budget = mapToBudget(budgetDTO);
        if (budget == null) {
            return false;
        }
        return budgetMapper.insert(budget) > 0;
    }


    @Override
    @Transactional
    public boolean updateBudget(BudgetDTO budgetDTO) {
        Budget existingBudget = budgetMapper.selectById(budgetDTO.getId());
        if (existingBudget == null) {
            return false;
        }
        if (!existingBudget.getName().equals(budgetDTO.getName()) &&
                budgetMapper.checkBudgetNameExists(budgetDTO.getName())) {
            return false; // Budget name must be unique
        }
        Budget budget = mapToBudget(budgetDTO);
        if (budget == null) {
            return false;
        }
        return budgetMapper.updateById(budget) > 0;
    }

    @Override
    public void exportToExcel(Map<String, Object> requestMap, HttpServletResponse response) {
        try {
            // 1. 解析通用查询条件
            String budgetType    = (String) requestMap.get("budgetType");
            String budgetCategory= (String) requestMap.get("budgetCategory");
            Integer innovation   = requestMap.get("innovation") != null
                    ? Integer.valueOf(requestMap.get("innovation").toString())
                    : null;
            String name          = (String) requestMap.get("name");
            Integer year         = (Integer) requestMap.get("year");
            Integer tech         = requestMap.get("tech") != null
                    ? Integer.valueOf(requestMap.get("tech").toString())
                    : null;

            // 2. **解析 quarter**（从 requestMap 中获取）
            Integer quarter      = requestMap.get("quarter") != null
                    ? Integer.valueOf(requestMap.get("quarter").toString())
                    : null;

            // 3. 查询数据，注意传入 8 个参数（不再传递 quarter 给 Mapper）
            List<BudgetDTO> budgetList = budgetMapper.getBudgetList(
                    year,
                    budgetType,
                    budgetCategory,
                    innovation,
                    name,
                    tech,
                    null,    // departmentName：导出时不分页，可传 null
                    null,    // offset：导出时不分页，可传 null
                    null     // pageSize：同上
            );

            // 4. 如果需要按季度筛选数据（按月进行过滤）
            if (quarter != null) {
                // 按季度过滤：根据计划启动时间来判断属于哪个季度
                budgetList = budgetList.stream()
                        .filter(budget -> {
                            int month = Integer.parseInt(budget.getPlannedStartDate().substring(5, 7));
                            return isInQuarter(month, quarter);
                        })
                        .collect(Collectors.toList());
            }

            // 5. 创建 Excel 并写入
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Budgets");
            Row headerRow = sheet.createRow(0);
            String[] headers = {"ID", "Year", "Budget Type", "Budget Category", "Innovation", "Name", "Amount", "Department Name", "Team Name"};
            for (int i = 0; i < headers.length; i++) {
                headerRow.createCell(i).setCellValue(headers[i]);
            }

            // 填充数据
            for (int i = 0; i < budgetList.size(); i++) {
                BudgetDTO b = budgetList.get(i);
                Row row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(b.getId());
                row.createCell(1).setCellValue(b.getYear());
                row.createCell(2).setCellValue(b.getBudgetType());
                row.createCell(3).setCellValue(b.getBudgetCategory());
                row.createCell(4).setCellValue(b.getInnovation());
                row.createCell(5).setCellValue(b.getName());
                row.createCell(6).setCellValue(b.getAmount().doubleValue());
                row.createCell(7).setCellValue(b.getDepartmentName());
                row.createCell(8).setCellValue(b.getTeamName());
            }

            // 6. 设置响应头并写出
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=budgets.xlsx");

            // 输出 Excel 文件
            try (OutputStream os = response.getOutputStream()) {
                workbook.write(os);
            }
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("导出 Excel 失败: " + e.getMessage());
        }
    }

    @Override
    public List<BudgetDepartmentSummaryDTO> getBudgetDepartmentSummary() {
        return budgetMapper.getBudgetDepartmentSummary();
    }

    @Override
    public List<BudgetTypeSummaryDTO> getBudgetTypeSummary() {
        return budgetMapper.getBudgetTypeSummary();
    }

    @Override
    public List<BudgetCategorySummaryDTO> getBudgetCategorySummary() {
        return budgetMapper.getBudgetCategorySummary();
    }

    /**
     * 根据月份判断是否属于指定的季度
     */
    private boolean isInQuarter(int month, int quarter) {
        switch (quarter) {
            case 1: return month >= 1 && month <= 3; // 第一季度
            case 2: return month >= 4 && month <= 6; // 第二季度
            case 3: return month >= 7 && month <= 9; // 第三季度
            case 4: return month >= 10 && month <= 12; // 第四季度
            default: return false;
        }
    }



    private Budget mapToBudget(BudgetDTO budgetDTO) {
        Long budgetTypeId = budgetTypeMapper.selectIdByName(budgetDTO.getBudgetType());
        if (budgetTypeId == null) {
            return null;
        }
        Long budgetCategoryId = budgetCategoryMapper.selectIdByName(budgetDTO.getBudgetCategory());
        if (budgetCategoryId == null) {
            return null;
        }
        Long departmentId = departmentMapper.getDepartmentIdByName(budgetDTO.getDepartmentName());
        if (departmentId == null) {
            return null;
        }
        Long teamId;
        if (budgetDTO.getTeamName() != null && budgetDTO.getTeamName().isEmpty()) {
            teamId = teamMapper.selectIdByName(budgetDTO.getTeamName());
            if (teamId == null) {
                return null;
            }
        } else {
            teamId = 0L;
        }
        Budget budget = new Budget();
        if (budgetDTO.getId() != null && !budgetDTO.getId().isEmpty()) {
            budget.setId(Long.valueOf(budgetDTO.getId()));
        }
        budget.setYear(budgetDTO.getYear());
        budget.setName(budgetDTO.getName());
        budget.setDescription(budgetDTO.getDescription());
        budget.setType(budgetTypeId);
        budget.setCategory(budgetCategoryId);
        budget.setInnovation(budgetDTO.getInnovation().equals("是") ? true : false);
        budget.setAmount(budgetDTO.getAmount());
        budget.setDepartmentId(departmentId);
        budget.setTeamId(teamId);
        budget.setPriority(budgetDTO.getPriority());
        budget.setBusinessPriority(budgetDTO.getBusinessPriority());
        budget.setBusinessDescription(budgetDTO.getBusinessDescription());
        Long startDateTimestamp = LocalDate.parse(budgetDTO.getPlannedStartDate())
                .atStartOfDay(ZoneId.systemDefault())
                .toInstant()
                .toEpochMilli();
        budget.setPlannedStartDate(startDateTimestamp);
        budget.setRemark(budgetDTO.getRemark());
        return budget;
    }

}
