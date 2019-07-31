
package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.core.enumerate.Status;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.business.entity.Project;
import cn.kcyf.bsc.modular.business.service.ProjectService;
import cn.kcyf.bsc.modular.system.controller.BasicController;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 项目控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/project")
@Api(tags = "项目管理", description = "项目管理")
public class ProjectController extends BasicController {

    private static String PREFIX = "/modular/business/project";

    @Autowired
    private ProjectService projectService;

    @GetMapping("")
    public String index() {
        return PREFIX + "/project.html";
    }

    @GetMapping(value = "/project_add")
    public String projectAdd() {
        return PREFIX + "/project_add.html";
    }

    @GetMapping(value = "/project_edit")
    public String projectEdit(Long projectId, Model model) {
        model.addAttribute("projectId", projectId);
        model.addAttribute("code", projectService.getOne(projectId).getCode());
        return PREFIX + "/project_edit.html";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String condition, int page, int limit) {
        Criteria<Project> criteria = new Criteria<Project>();
        if (!StringUtils.isEmpty(condition)) {
            criteria.add(Restrictions.or(Restrictions.like("code", condition), Restrictions.like("name", condition)));
        }
        return ResponseData.list(projectService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "新增项目")
    public ResponseData add(@Valid Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(project);
        project.setUsed(0);
        project.setStatus(Status.ENABLE);
        projectService.create(project);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    @BussinessLog(value = "修改项目")
    public ResponseData edit(@Valid Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Project dbproject = projectService.getOne(project.getId());
        update(dbproject);
        dbproject.setName(project.getName());
        dbproject.setTime(project.getTime());
        dbproject.setDescription(project.getDescription());
        projectService.update(dbproject);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/delete/{projectId}")
    @ResponseBody
    @BussinessLog(value = "删除项目")
    public ResponseData delete(@PathVariable Long projectId) {
        projectService.delete(projectId);
        return SUCCESS_TIP;
    }

    @PostMapping("/freeze/{projectId}")
    @ResponseBody
    @BussinessLog(value = "禁用项目")
    public ResponseData freeze(@PathVariable Long projectId) {
        Project project = projectService.getOne(projectId);
        project.setStatus(Status.DISABLE);
        projectService.update(project);
        return SUCCESS_TIP;
    }

    @PostMapping("/unfreeze/{projectId}")
    @ResponseBody
    @BussinessLog(value = "启用项目")
    public ResponseData unfreeze(@PathVariable Long projectId) {
        Project project = projectService.getOne(projectId);
        project.setStatus(Status.ENABLE);
        projectService.update(project);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{projectId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long projectId) {
        return ResponseData.success(projectService.getOne(projectId));
    }

}
