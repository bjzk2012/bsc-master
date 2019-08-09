package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.core.enumerate.*;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.business.entity.Project;
import cn.kcyf.bsc.modular.business.entity.Question;
import cn.kcyf.bsc.modular.business.entity.QuestionRecord;
import cn.kcyf.bsc.modular.business.service.ProjectService;
import cn.kcyf.bsc.modular.business.service.QuestionRecordService;
import cn.kcyf.bsc.modular.business.service.QuestionService;
import cn.kcyf.bsc.core.controller.BasicController;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.commons.utils.RandomUtils;
import cn.kcyf.commons.web.RequestUtils;
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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/question")
@Api(tags = "问题管理", description = "问题管理")
public class QuestionController extends BasicController {
    private static String PREFIX = "/modular/business/question";

    @Autowired
    private QuestionService questionService;
    @Autowired
    private QuestionRecordService questionRecordService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProjectService projectService;

    private void setProjects(Model model) {
        Criteria<Project> criteria = new Criteria<Project>();
        criteria.add(Restrictions.eq("status", Status.ENABLE));
        model.addAttribute("projects", projectService.findList(criteria));
    }

    private void setUsers(Model model) {
        Criteria<User> criteria = new Criteria<User>();
        criteria.add(Restrictions.eq("status", LockStatus.UNLOCK));
        model.addAttribute("users", userService.findList(criteria));
    }

    private void setCategorys(Model model) {
        Map<String, String> categorys = new HashMap<String, String>();
        for (QuestionCategory category : QuestionCategory.values()) {
            categorys.put(category.name(), category.getMessage());
        }
        model.addAttribute("categorys", categorys);
    }

    private void setCauses(Model model) {
        Map<String, String> causes = new HashMap<String, String>();
        for (QuestionCause cause : QuestionCause.values()) {
            causes.put(cause.name(), cause.getMessage());
        }
        model.addAttribute("causes", causes);
    }

    private void setModel(Model model){
        setProjects(model);
        setUsers(model);
        setCategorys(model);
        setCauses(model);
    }

    @GetMapping("")
    public String index(Model model) {
        setModel(model);
        return PREFIX + "/question.html";
    }

    @GetMapping(value = "/question_add")
    public String questionAdd(Model model) {
        setModel(model);
        return PREFIX + "/question_add.html";
    }

    @GetMapping(value = "/question_edit")
    public String questionEdit(Long questionId, Model model) {
        model.addAttribute("questionId", questionId);
        model.addAttribute("title", questionService.getOne(questionId).getTitle());
        setModel(model);
        return PREFIX + "/question_edit.html";
    }

    @GetMapping(value = "/question_appoint")
    public String questionAppoint(Long questionId, Model model) {
        model.addAttribute("questionId", questionId);
        model.addAttribute("title", questionService.getOne(questionId).getTitle());
        setModel(model);
        return PREFIX + "/question_appoint.html";
    }

    @GetMapping(value = "/question_solve")
    public String questionSolve(Long questionId, Model model) {
        model.addAttribute("questionId", questionId);
        model.addAttribute("title", questionService.getOne(questionId).getTitle());
        setModel(model);
        return PREFIX + "/question_appoint.html";
    }

    @GetMapping(value = "/question_active")
    public String questionActive(Long questionId, Model model) {
        model.addAttribute("questionId", questionId);
        model.addAttribute("title", questionService.getOne(questionId).getTitle());
        setModel(model);
        return PREFIX + "/question_solve.html";
    }


    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String condition, int page, int limit) {
        Criteria<Question> criteria = new Criteria<Question>();
        if (!StringUtils.isEmpty(condition)) {
            criteria.add(Restrictions.or(Restrictions.like("code", condition), Restrictions.like("title", condition)));
        }
        return ResponseData.list(questionService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog("新增问题")
    public ResponseData add(HttpServletRequest request, @Valid Question question, Long projectId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(question);
        question.setCode("Q" + System.currentTimeMillis() + RandomUtils.generateNumString(4));
        question.setStatus(QuestionStatus.DRAFT);
        question.setIp(RequestUtils.getIpAddr(request));
        question.setBrowse(request.getHeader("user-agent"));
        if (StringUtils.isEmpty(question.getDescription())){
            question.setDescription("");
        }
        if (projectId != null) {
            question.setProject(projectService.getOne(projectId));
        }
        if (isAuthenticated()) {
            question.setSponsor(getUser().getUsername());
        }
        questionService.create(question);
        questionRecordService.create(question.getId(), QuestionRecordType.INITIATE, null);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/confirm/{questionId}")
    @ResponseBody
    @BussinessLog("确认问题")
    public ResponseData confirm(@PathVariable Long questionId) {
        Question dbquestion = questionService.getOne(questionId);
        QuestionRecordType type = QuestionRecordType.CONFIRM;
        dbquestion.setStatus(type.getStatus());
        questionService.update(dbquestion);
        questionRecordService.create(questionId, type, null);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/appoint/{questionId}")
    @ResponseBody
    @BussinessLog("指派问题")
    public ResponseData appoint(@PathVariable Long questionId, @NotBlank(message = "责任人未选择") Long liableId, String description) {
        Question dbquestion = questionService.getOne(questionId);
        QuestionRecordType type = QuestionRecordType.APPOINT;
        dbquestion.setStatus(type.getStatus());
        dbquestion.setLiable(userService.getOne(liableId));
        dbquestion.setDescription(dbquestion.getDescription() + description);
        questionService.update(dbquestion);
        questionRecordService.create(questionId, type, description);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/solve/{questionId}")
    @ResponseBody
    @BussinessLog("解决问题")
    public ResponseData solve(@PathVariable Long questionId, @NotBlank(message = "解决方案未选择") QuestionQuomodo quomodo, String description) {
        Question dbquestion = questionService.getOne(questionId);
        QuestionRecordType type = QuestionRecordType.SOLVE;
        dbquestion.setStatus(type.getStatus());
        dbquestion.setQuomodo(quomodo);
        dbquestion.setDescription(dbquestion.getDescription() + description);
        questionService.update(dbquestion);
        questionRecordService.create(questionId, type, description);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/close/{questionId}")
    @ResponseBody
    @BussinessLog("关闭问题")
    public ResponseData close(@PathVariable Long questionId) {
        Question dbquestion = questionService.getOne(questionId);
        QuestionRecordType type = QuestionRecordType.SOLVE;
        dbquestion.setStatus(type.getStatus());
        questionService.update(dbquestion);
        questionRecordService.create(questionId, type, null);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/active/{questionId}")
    @ResponseBody
    @BussinessLog("激活问题")
    public ResponseData active(@PathVariable Long questionId, String description) {
        Question dbquestion = questionService.getOne(questionId);
        QuestionRecordType type = QuestionRecordType.ACTIVE;
        dbquestion.setStatus(type.getStatus());
        dbquestion.setDescription(dbquestion.getDescription() + description);
        questionService.update(dbquestion);
        questionRecordService.create(questionId, type, description);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    @BussinessLog("编辑问题")
    public ResponseData edit(@Valid Question question, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Question dbquestion = questionService.getOne(question.getId());
        update(dbquestion);
        dbquestion.setTime(question.getTime());
        dbquestion.setDescription(question.getDescription());
        questionService.update(dbquestion);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{questionId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long questionId) {
        return ResponseData.success(questionService.getOne(questionId));
    }
}
