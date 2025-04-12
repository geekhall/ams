package net.geekhour.loki.controller;

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
@RestController
@RequestMapping("/api/environment")
public class EnvironmentController {

    @Autowired
    private EnvironmentMapper environmentMapper;

    @Autowired
    private EnvironmentServiceImpl environmentService;

    @GetMapping("/greeting")
    public ResponseEntity<?> greeting() {
        System.out.println("Greetings");
        return ResponseEntity.ok("Greetings");
    }

    @ResponseBody
    @RequestMapping("/all")
    public List<Environment> all() {
        System.out.println("EnvironmentController.all called ");
        return environmentService.list();
    }

    @ResponseBody
    @RequestMapping("/{id}")
    public Environment getEnvironment(@PathVariable("id") Long id) {
        System.out.println("getEnvironment called , id = " + id);
        Environment environment = environmentMapper.selectById(id);
        System.out.println(environment);
        return environment;
    }

    @ResponseBody
    @RequestMapping("/update")
    public String updateEnvironment(@RequestParam("id") Long id, @RequestParam("name") String name) {
        System.out.println("updateEnvironment called , id = " + id + ", name = " + name);
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
