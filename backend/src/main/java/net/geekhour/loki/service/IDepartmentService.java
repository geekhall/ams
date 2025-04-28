package net.geekhour.loki.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.geekhour.loki.entity.Department;

import java.util.List;

/**
 * <p>
 * 部门 服务类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
public interface IDepartmentService extends IService<Department> {

    List<Department> list();

    boolean deleteDepartment(Long id);

    boolean existsByName(String name);

    Long countDepartment();
}
