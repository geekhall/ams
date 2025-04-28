package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Environment;
import net.geekhour.loki.mapper.EnvironmentMapper;
import net.geekhour.loki.service.impl.EnvironmentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 测试环境 前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2024-11-03
 */
@CrossOrigin
@RestController
@RequestMapping("/api/environment")
public class EnvironmentController {

    @Autowired
    private EnvironmentMapper environmentMapper;

    @Autowired
    private EnvironmentServiceImpl environmentService;

    @ResponseBody
    @RequestMapping("/all")
    public List<Environment> all() {
        return environmentService.list();
    }

    @ResponseBody
    @RequestMapping("/{id}")
    public ResponseEntity<?> getEnvironment(@PathVariable("id") Long id) {
        return ResponseUtil.success(environmentMapper.selectById(id));
    }

    @ResponseBody
    @RequestMapping("/update")
    public String updateEnvironment(@RequestParam("id") Long id, @RequestParam("name") String name) {
        Environment environment = new Environment();
        environment.setId(id);
        environment.setName(name);
        environmentMapper.updateById(environment);
        // ToDo: update Environment
        return "updateEnvironment success";
    }

    @RequestMapping("/delete/{id}")
    public void deleteEnvironment(@PathVariable("id") Long id) {
        environmentMapper.deleteById(id);
    }
}
