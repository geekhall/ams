package net.geekhour.loki.controller;

import net.geekhour.loki.common.ResponseUtil;
import net.geekhour.loki.entity.Team;
import net.geekhour.loki.service.ITeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Jasper Yang
 * @since 2025-04-13
 */
@RestController
@RequestMapping("/api/team")
public class TeamController {

    @Autowired
    private ITeamService teamService;

    // List all team names
    @RequestMapping("/names")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:team:all')")
    public ResponseEntity<?> names() {
        List<String> teamNames = teamService.list().stream()
                .map(Team::getName)
                .toList();
        return ResponseUtil.success(Map.of(
                "items", teamNames,
                "total", teamNames.size()
        ));
    }

    // List all teams
    @RequestMapping("/list")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:team:list')")
    public ResponseEntity<?> list() {
        try {
            return ResponseUtil.success(teamService.list());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Create a new team
    @PostMapping("/create")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:team:create')")
    public ResponseEntity<?> create(@RequestBody Team team) {
        if (team.getName() == null || team.getName().isEmpty()) {
            return ResponseUtil.error(400, "团队名称不能为空");
        }
        try {
            return teamService.save(team)
                    ? ResponseUtil.success(team)
                    : ResponseUtil.error(500, "创建团队失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Update an existing team
    @PostMapping("/update")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:team:update')")
    public ResponseEntity<?> update(@RequestBody Team team) {
        if (team.getId() == null) {
            return ResponseUtil.error(400, "团队ID不能为空");
        }
        try {
            return teamService.updateById(team)
                    ? ResponseUtil.success(team)
                    : ResponseUtil.error(500, "更新团队失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Delete a team by ID
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN') || hasAuthority('system:team:delete')")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (id == null || id <= 0) {
            return ResponseUtil.error(400, "团队ID不能为空");
        }
        try {
            return teamService.removeById(id)
                    ? ResponseUtil.success(id)
                    : ResponseUtil.error(500, "删除团队失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }

    // Check if a team exists by name
    @PostMapping("/exists")
    @PreAuthorize("hasRole('USER') || hasAuthority('system:team:exists')")
    public ResponseEntity<?> existsByName(@RequestBody Team team) {
        if (team.getName() == null || team.getName().isEmpty()) {
            return ResponseUtil.error(400, "团队名称不能为空");
        }
        try {
            return teamService.existsByName(team.getName())
                    ? ResponseUtil.success(true)
                    : ResponseUtil.error(500, "查询团队失败");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseUtil.error(500, e.getMessage());
        }
    }
}
