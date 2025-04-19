package net.geekhour.loki.service.impl;

import net.geekhour.loki.common.StringUtil;
import net.geekhour.loki.entity.Budget;
import net.geekhour.loki.entity.BudgetCategory;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.entity.dto.BudgetDTO;
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
                                         Integer offset,
                                         Integer pageSize) {
        return budgetMapper.getBudgetList(year, budgetType, budgetCategory, innovation, name, tech, offset, pageSize);
    }

    @Override
    public Long countBudgets(Integer year,
                             String budgetType,
                             String budgetCategory,
                             Integer innovation,
                             String name,
                             Integer tech) {
        return budgetMapper.countBudgets(year, budgetType, budgetCategory, innovation, name, tech);
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
            // 获取查询条件
            String budgetType = (String) requestMap.get("budgetType");
            String budgetCategory = (String) requestMap.get("budgetCategory");
            Integer innovation = requestMap.get("innovation") != null ? Integer.valueOf(requestMap.get("innovation").toString()) : null;
            String name = (String) requestMap.get("name");
            Integer year = (Integer) requestMap.get("year");
            Integer tech = requestMap.get("tech") != null ? Integer.valueOf(requestMap.get("tech").toString()) : null;

            // 查询数据
            List<BudgetDTO> budgetList = budgetMapper.getBudgetList(year, budgetType, budgetCategory, innovation, name, tech, null, null);

            // 创建 Excel 文件
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Budgets");
            Row headerRow = sheet.createRow(0);

            // 设置表头
            String[] headers = {"ID", "Year", "Budget Type", "Budget Category", "Innovation", "Name", "Amount", "Department Name"};
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            // 填充数据
            for (int i = 0; i < budgetList.size(); i++) {
                BudgetDTO budget = budgetList.get(i);
                Row row = sheet.createRow(i + 1);
                row.createCell(0).setCellValue(budget.getId());
                row.createCell(1).setCellValue(budget.getYear());
                row.createCell(2).setCellValue(budget.getBudgetType());
                row.createCell(3).setCellValue(budget.getBudgetCategory());
                row.createCell(4).setCellValue(budget.getInnovation());
                row.createCell(5).setCellValue(budget.getName());
                row.createCell(6).setCellValue((RichTextString) budget.getAmount());
                row.createCell(7).setCellValue(budget.getDepartmentName());
            }

            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=budgets.xlsx");

            // 写入到输出流
            OutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            workbook.close();
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("导出 Excel 失败: " + e.getMessage());
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
        Long departmentId = departmentMapper.selectIdByName(budgetDTO.getDepartmentName());
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
