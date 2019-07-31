
package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.core.enumerate.Status;
import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.business.entity.Project;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.bsc.modular.business.service.ProjectService;
import cn.kcyf.bsc.modular.business.service.WorkRecordService;
import cn.kcyf.bsc.modular.business.service.WorkService;
import cn.kcyf.bsc.modular.system.controller.BasicController;
import cn.kcyf.commons.utils.DateUtils;
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
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 工作日志控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/work")
@Api(tags = "工作日志管理", description = "工作日志管理")
public class WorkController extends BasicController {

    private static String PREFIX = "/modular/business/work";

    @Autowired
    private ProjectService projectService;
    @Autowired
    private WorkService workService;
    @Autowired
    private WorkRecordService workRecordService;

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("projects", projectService.findAll());
        return PREFIX + "/work.html";
    }

    @GetMapping(value = "/workRecord_add")
    public String workRecordAdd(Model model) {
        model.addAttribute("projects", projectService.findAll());
        return PREFIX + "/workRecord_add.html";
    }

    @GetMapping(value = "/workRecord_edit")
    public String projectEdit(Long workId, Model model) {
        model.addAttribute("projects", projectService.findAll());
        model.addAttribute("workId", workId);
        return PREFIX + "/workRecord_edit.html";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String timeLimit, WorkStatus status, int page, int limit) {
        Criteria<Work> criteria = new Criteria<Work>();
        if (!StringUtils.isEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("today", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("today", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        if (status != null) {
            criteria.add(Restrictions.eq("records.status", status));
        }
        return ResponseData.list(workService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @GetMapping(value = "/records")
    @ResponseBody
    public ResponseData records(Long workId, int page, int limit) {
        Criteria<WorkRecord> criteria = new Criteria<WorkRecord>();
        if (workId != null) {
            criteria.add(Restrictions.isNull("workId"));
        }
        return ResponseData.list(workRecordService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/workRecord/add")
    @ResponseBody
    @BussinessLog(value = "新增工作日志")
    public ResponseData add(@Valid WorkRecord workRecord, @NotBlank(message = "未选择项目") Long projectId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(workRecord);
        workRecord.setProject(projectService.getOne(projectId));
        workRecord.setStatus(WorkStatus.DRAFT);
        workRecordService.create(workRecord);
        return SUCCESS_TIP;
    }
//
//    @PostMapping(value = "/edit")
//    @ResponseBody
//    @BussinessLog(value = "修改工作日志")
//    public ResponseData edit(@Valid Project project, BindingResult bindingResult) {
//        if (bindingResult.hasErrors()) {
//            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
//        }
//        Project dbproject = projectService.getOne(project.getId());
//        update(dbproject);
//        dbproject.setName(project.getName());
//        dbproject.setTime(project.getTime());
//        dbproject.setDescription(project.getDescription());
//        projectService.update(dbproject);
//        return SUCCESS_TIP;
//    }
//
//    @PostMapping(value = "/delete/{projectId}")
//    @ResponseBody
//    @BussinessLog(value = "删除工作日志")
//    public ResponseData delete(@PathVariable Long projectId) {
//        projectService.delete(projectId);
//        return SUCCESS_TIP;
//    }
//
//    @PostMapping("/freeze/{projectId}")
//    @ResponseBody
//    @BussinessLog(value = "禁用工作日志")
//    public ResponseData freeze(@PathVariable Long projectId) {
//        Project project = projectService.getOne(projectId);
//        project.setStatus(Status.DISABLE);
//        projectService.update(project);
//        return SUCCESS_TIP;
//    }
//
//    @PostMapping("/unfreeze/{projectId}")
//    @ResponseBody
//    @BussinessLog(value = "启用工作日志")
//    public ResponseData unfreeze(@PathVariable Long projectId) {
//        Project project = projectService.getOne(projectId);
//        project.setStatus(Status.ENABLE);
//        projectService.update(project);
//        return SUCCESS_TIP;
//    }
//
//    @GetMapping(value = "/detail/{projectId}")
//    @ResponseBody
//    public ResponseData detail(@PathVariable Long projectId) {
//        return ResponseData.success(projectService.getOne(projectId));
//    }

}
