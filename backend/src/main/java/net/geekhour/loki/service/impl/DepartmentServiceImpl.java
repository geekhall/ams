package net.geekhour.loki.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.geekhour.loki.entity.AssetType;
import net.geekhour.loki.entity.Department;
import net.geekhour.loki.mapper.AssetTypeMapper;
import net.geekhour.loki.mapper.DepartmentMapper;
import net.geekhour.loki.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 部门 服务实现类
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> list() {
        return departmentMapper.selectList(null);
    }

    @Override
    @Transactional
    public boolean deleteDepartment(Long id) {
        return departmentMapper.deleteById(id) > 0;
    }

    @Override
    public boolean existsByName(String name) {
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name);
        return departmentMapper.selectCount(queryWrapper) > 0;
    }

    @Override
    public Long countDepartment() {
        return departmentMapper.selectCount(null);
    }

}
