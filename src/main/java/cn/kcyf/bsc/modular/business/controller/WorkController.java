
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
import cn.kcyf.bsc.core.controller.BasicController;
import cn.kcyf.commons.utils.DateUtils;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;

/**
 * 工单控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/work")
@Api(tags = "工单管理", description = "工单管理")
public class WorkController extends BasicController {

    private static String PREFIX = "/modular/business/work";

    @Autowired
    private ProjectService projectService;
    @Autowired
    private WorkService workService;
    @Autowired
    private WorkRecordService workRecordService;

    private void setProjects(Model model) {
        Criteria<Project> criteria = new Criteria<Project>();
        criteria.add(Restrictions.eq("status", Status.ENABLE));
        model.addAttribute("projects", projectService.findList(criteria));
    }

    /**
     * 工单申请
     *
     * @param model
     * @return
     */
    @GetMapping("/apply")
    public String apply(Model model) {
        setProjects(model);
        return PREFIX + "/apply.html";
    }

    /**
     * 工单审核
     *
     * @param model
     * @return
     */
    @GetMapping("/audit")
    public String audit(Model model) {
        Map<String, String> statuses = new HashMap<String, String>();
        for (WorkStatus status : WorkStatus.values()) {
            if (!status.equals(WorkStatus.DRAFT)) {
                statuses.put(status.name(), status.getMessage());
            }
        }
        model.addAttribute("statuses", statuses);
        return PREFIX + "/audit.html";
    }

    @GetMapping(value = "/workRecord_add")
    public String workRecordAdd(Long workId, Model model) {
        model.addAttribute("workId", workId);
        setProjects(model);
        return PREFIX + "/workRecord_add.html";
    }

    @GetMapping(value = "/workRecord_edit")
    public String workRecordEdit(Long workRecordId, Model model) {
        setProjects(model);
        model.addAttribute("workRecordId", workRecordId);
        return PREFIX + "/workRecord_edit.html";
    }
    @GetMapping(value = "/workRecord_help")
    public String workRecordHelp() {
        return PREFIX + "/workRecord_help.html";
    }

    @GetMapping(value = "/workRecord_detail/{workRecordId}")
    public String workRecordDetail(@PathVariable Long workRecordId, Model model) {
        model.addAttribute("workRecordId", workRecordId);
        model.addAttribute("entity", workRecordService.getOne(workRecordId));
        setProjects(model);
        return PREFIX + "/workRecord_detail.html";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String timeLimit, int page, int limit) {
        Criteria<Work> criteria = new Criteria<Work>();
        if (!StringUtils.isEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("today", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("today", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        criteria.add(Restrictions.eq("createUserId", getUser().getId()));
        return ResponseData.list(workService.findList(criteria, PageRequest.of(page - 1, limit, new Sort(Sort.Direction.DESC, "createTime"))));
    }

    @GetMapping(value = "/records")
    @ResponseBody
    public ResponseData records(Long workId, int page, int limit) {
        Criteria<WorkRecord> criteria = new Criteria<WorkRecord>();
        if (workId == null || workId.equals(0L)) {
            criteria.add(Restrictions.isNull("workId"));
        } else {
            criteria.add(Restrictions.eq("workId", workId));
        }
        criteria.add(Restrictions.eq("createUserId", getUser().getId()));
        return ResponseData.list(workRecordService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @GetMapping(value = "/audits")
    @ResponseBody
    public ResponseData audits(String condition, String timeLimit, String submitTimeLimit, String auditTimeLimit, WorkStatus status, int page, int limit) {
        Criteria<WorkRecord> criteria = new Criteria<WorkRecord>();
        if (!StringUtils.isEmpty(condition)){
            criteria.add(Restrictions.or(Restrictions.like("project.name", condition), Restrictions.like("submitUserName", condition), Restrictions.like("content", condition)));
        }
        if (status != null) {
            criteria.add(Restrictions.eq("status", status));
        } else {
            criteria.add(Restrictions.ne("status", WorkStatus.DRAFT));
        }
        if (!StringUtils.isEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("today", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("today", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        if (!StringUtils.isEmpty(submitTimeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("submitTime", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("submitTime", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        if (!StringUtils.isEmpty(auditTimeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("lastAuditTime", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("lastAuditTime", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        return ResponseData.list(workRecordService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/workRecord/add")
    @ResponseBody
    @BussinessLog("新增工单")
    public ResponseData add(@Valid WorkRecord workRecord, @NotBlank(message = "未选择项目") Long projectId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(workRecord);
        workRecord.setToday(workService.getOne(workRecord.getWorkId()).getToday());
        workRecord.setProject(projectService.getOne(projectId));
        workRecord.setStatus(WorkStatus.DRAFT);
        workRecordService.create(workRecord);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/workRecord/edit")
    @ResponseBody
    @BussinessLog("修改工单")
    public ResponseData edit(@Valid WorkRecord workRecord, @NotBlank(message = "未选择项目") Long projectId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        WorkRecord dbWorkRecord = workRecordService.getOne(workRecord.getId());
        if (dbWorkRecord.getStatus().equals(WorkStatus.FINISH)) {
            return ResponseData.error("工单已审核通过，无法修改！");
        }
        update(dbWorkRecord);
        dbWorkRecord.setStatus(WorkStatus.DRAFT);
        dbWorkRecord.setTime(workRecord.getTime());
        dbWorkRecord.setContent(workRecord.getContent());
        dbWorkRecord.setProject(projectService.getOne(projectId));
        workRecordService.update(dbWorkRecord);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/workRecord/audits/{workRecordId}")
    @ResponseBody
    public ResponseData audits(@PathVariable Long workRecordId) {
        WorkRecord record = workRecordService.getOne(workRecordId);
        return ResponseData.list(record.getAudits());
    }

    @PostMapping(value = "/workRecord/delete/{workRecordId}")
    @ResponseBody
    @BussinessLog("删除工单")
    public ResponseData delete(@PathVariable Long workRecordId) {
        WorkRecord dbWorkRecord = workRecordService.getOne(workRecordId);
        if (dbWorkRecord.getStatus().equals(WorkStatus.FINISH)) {
            return ResponseData.error("工单已审核通过，无法删除！");
        }
        workRecordService.delete(workRecordId);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/workRecord/submit/{workId}")
    @ResponseBody
    @BussinessLog("提交工单")
    public ResponseData submit(@PathVariable Long workId) {
        try {
            workService.submit(workId);
        } catch (RuntimeException e) {
            return ResponseData.error(e.getMessage());
        }
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/workRecord/audit")
    @ResponseBody
    @BussinessLog("审核工单")
    public ResponseData audit(String ids, boolean flag, String suggestions) {
        workRecordService.audit(ids, flag, suggestions);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/workRecord/detail/{workRecordId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long workRecordId) {
        return ResponseData.success(workRecordService.getOne(workRecordId));
    }

}
