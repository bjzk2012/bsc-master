package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.core.enumerate.LockStatus;
import cn.kcyf.bsc.core.enumerate.Status;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.business.entity.Key;
import cn.kcyf.bsc.modular.business.entity.Project;
import cn.kcyf.bsc.modular.business.service.KeyService;
import cn.kcyf.bsc.modular.business.service.ProjectService;
import cn.kcyf.bsc.core.controller.BasicController;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import cn.kcyf.security.domain.ShiroUser;
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

/**
 * 口令控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/key")
@Api(tags = "口令管理", description = "口令管理")
public class KeyController extends BasicController {
    private static String PREFIX = "/modular/business/key";

    @Autowired
    private KeyService keyService;
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

    @GetMapping("")
    public String index() {
        return PREFIX + "/key.html";
    }

    @GetMapping(value = "/key_add")
    public String keyAdd(Model model) {
        setProjects(model);
        setUsers(model);
        return PREFIX + "/key_add.html";
    }

    @GetMapping(value = "/key_edit")
    public String keyEdit(Long keyId, Model model) {
        model.addAttribute("keyId", keyId);
        setProjects(model);
        setUsers(model);
        return PREFIX + "/key_edit.html";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String condition, int page, int limit) {
        Criteria<Key> criteria = new Criteria<Key>();
        if (!StringUtils.isEmpty(condition)) {
            criteria.add(Restrictions.or(Restrictions.like("name", condition),
                    Restrictions.like("useway", condition),
                    Restrictions.like("project.name", condition),
                    Restrictions.like("account", condition),
                    Restrictions.like("manager.name", condition),
                    Restrictions.like("backupManager.name", condition)));
        }
        return ResponseData.list(keyService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog("新增口令")
    public ResponseData add(@Valid Key key,
                            @NotBlank(message = "口令密码不能为空") String password,
                            @NotBlank(message = "请选择项目") Long projectId,
                            @NotBlank(message = "请选择管理人") Long managerId,
                            Long backupManagerId,
                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(key);
        key.setProject(projectService.getOne(projectId));
        key.setManager(userService.getOne(managerId));
        if (backupManagerId != null) {
            key.setBackupManager(userService.getOne(backupManagerId));
        }
        keyService.create(key);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    @BussinessLog("修改口令")
    public ResponseData edit(@Valid Key key,
                             @NotBlank(message = "请选择项目") Long projectId,
                             @NotBlank(message = "请选择管理人") Long managerId,
                             Long backupManagerId,
                             BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Key dbkey = keyService.getOne(key.getId());
        update(dbkey);
        dbkey.setProject(projectService.getOne(projectId));
        dbkey.setName(key.getName());
        dbkey.setUseway(key.getUseway());
        dbkey.setAccount(key.getAccount());
        if (!StringUtils.isEmpty(key.getPassword())) {
            dbkey.setPassword(key.getPassword());
        }
        dbkey.setDescription(key.getDescription());
        dbkey.setManager(userService.getOne(managerId));
        if (backupManagerId != null) {
            dbkey.setBackupManager(userService.getOne(backupManagerId));
        }
        keyService.update(dbkey);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/delete/{keyId}")
    @ResponseBody
    @BussinessLog("删除口令")
    public ResponseData delete(@PathVariable Long keyId) {
        keyService.delete(keyId);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{keyId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long keyId) {
        return ResponseData.success(keyService.getOne(keyId));
    }

    @PostMapping(value = "/password/{keyId}")
    @ResponseBody
    @BussinessLog("查看口令")
    public ResponseData password(@PathVariable Long keyId, String password) {
        Key key = keyService.getOne(keyId);
        User manager = key.getManager();
        User backupManager = key.getBackupManager();
        ShiroUser shiroUser = getUser();
        if (shiroUser.getId().equals(manager.getId())) {
            if (userService.md5(password, manager.getSalt()).equals(manager.getPassword())) {
                return ResponseData.success(key.getPassword());
            } else {
                return ResponseData.error("密码输入错误");
            }
        } else if (backupManager != null && shiroUser.getId().equals(backupManager.getId())) {
            if (userService.md5(password, backupManager.getSalt()).equals(backupManager.getPassword())) {
                return ResponseData.success(key.getPassword());
            } else {
                return ResponseData.error("密码输入错误");
            }
        } else {
            return ResponseData.error("您无权限查看该口令");
        }
    }
}
