
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.constant.Constant;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.bsc.modular.system.service.RoleService;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.commons.utils.ArrayUtils;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import cn.kcyf.security.domain.ShiroUser;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 系统管理员控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/mgr")
public class UserMgrController extends BasicController {

    private final static String PREFIX = "/modular/system/user/";

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private DeptService deptService;

    /**
     * 跳转到查看管理员列表的页面
     */
    @GetMapping("")
    public String index() {
        return PREFIX + "user.html";
    }

    /**
     * 跳转到查看管理员列表的页面
     */
    @GetMapping("/user_add")
    public String add(Model model) {
        model.addAttribute("roles", roleService.findAll());
        return PREFIX + "user_add.html";
    }

    /**
     * 跳转到编辑管理员页面
     */
    @GetMapping("/user_edit")
    public String edit(Long userId, Model model) {
        model.addAttribute("userId", userId);
        model.addAttribute("roles", roleService.findAll());
        return PREFIX + "user_edit.html";
    }

    /**
     * 跳转到角色分配页面
     */
    @GetMapping("/role")
    public String role(Long userId, Model model) {
        model.addAttribute("userId", userId);
        return PREFIX + "user_roleassign.html";
    }

    /**
     * 查询管理员列表
     */
    @RequestMapping("/list")
    @ResponseBody
    public ResponseData list(String name, String timeLimit, int page, int limit) {
        Criteria<User> criteria = new Criteria<User>();
        if (!StringUtils.isEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("createTime", split[0] + " 00:00:00"));
            criteria.add(Restrictions.lte("createTime", split[0] + " 23:59:59"));
        }
        if (!StringUtils.isEmpty(name)) {
            criteria.add(Restrictions.or(Restrictions.like("name", name), Restrictions.like("email", name), Restrictions.like("phone", name)));
        }

        return ResponseData.list(userService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    /**
     * 添加管理员
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResponseData add(@Valid User user,
                            @NotBlank(message = "确认密码不能为空")
                            @Size(min = 6, max = 12, message = "确认密码必须6到12位")
                            @Pattern(regexp = "[\\S]+", message = "确认密码不能出现空格") String password,
                            @NotBlank(message = "确认密码不能为空") String rePassword,
                            @NotBlank(message = "部门未选择") Long deptId,
                            @NotBlank(message = "角色未选择") String roleId,
                            BindingResult bindingResult) {
        if (!password.equals(rePassword)){
            return ResponseData.error("两次密码输入不一致");
        }
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        ShiroUser shiroUser = getUser();
        user.setId(null);
        user.setCreateTime(new Date());
        user.setCreateUserId(shiroUser.getId());
        user.setCreateUserName(shiroUser.getUsername());
        user.setStatus(Status.ENABLE);
        user.setAvatar(Constant.DEFAULT_HEAD);
        user.setSalt(RandomStringUtils.randomAlphabetic(5));
        user.setPassword(userService.md5(password, user.getSalt()));
        user.setDept(deptService.getOne(deptId));
        if (!StringUtils.isEmpty(roleId)){
            user.setRoles(roleService.findByIdIn(ArrayUtils.convertStrArrayToLong(roleId.split(","))));
        }
        try {
            userService.create(user);
        } catch (DataIntegrityViolationException e) {
            return ResponseData.error("用户名重复");
        }
        return SUCCESS_TIP;
    }

    /**
     * 修改管理员
     */
    @RequestMapping("/edit")
    @ResponseBody
    public ResponseData edit(@Valid User user, @NotBlank(message = "部门未选择") Long deptId, @NotBlank(message = "角色未选择") String roleId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        User dbuser = userService.getOne(user.getId());
        ShiroUser shiroUser = getUser();
        dbuser.setLastUpdateTime(new Date());
        dbuser.setLastUpdateUserId(shiroUser.getId());
        dbuser.setLastUpdateUserName(shiroUser.getUsername());
        if (!StringUtils.isEmpty(user.getPassword())){
            dbuser.setPassword(userService.md5(user.getPassword(), dbuser.getSalt()));
        }
        dbuser.setBirthday(user.getBirthday());
        dbuser.setEmail(user.getEmail());
        dbuser.setSex(user.getSex());
        dbuser.setDept(deptService.getOne(deptId));
        if (!StringUtils.isEmpty(roleId)){
            dbuser.setRoles(roleService.findByIdIn(ArrayUtils.convertStrArrayToLong(roleId.split(","))));
        } else {
            dbuser.setRoles(null);
        }
        dbuser.setPhone(user.getPhone());
        dbuser.setAddress(user.getAddress());
        dbuser.setAvatar(user.getAvatar());
        userService.update(dbuser);
        return SUCCESS_TIP;
    }

    /**
     * 删除管理员（逻辑删除）
     */
    @RequestMapping("/delete/{userId}")
    @ResponseBody
    public ResponseData delete(@PathVariable Long userId) {
        userService.delete(userId);
        return SUCCESS_TIP;
    }

    /**
     * 查看管理员详情
     */
    @RequestMapping("/detail/{userId}")
    @ResponseBody
    public User detail(@PathVariable Long userId) {
        return userService.getOne(userId);
    }

    /**
     * 重置管理员的密码
     */
    @RequestMapping("/reset/{userId}")
    @ResponseBody
    public ResponseData reset(@PathVariable Long userId) {
        User user = userService.getOne(userId);
        user.setPassword(userService.md5(Constant.DEFAULT_PWD, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 冻结用户
     */
    @RequestMapping("/freeze/{userId}")
    @ResponseBody
    public ResponseData freeze(@PathVariable Long userId) {
        User user = userService.getOne(userId);
        user.setStatus(Status.DISABLE);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 解除冻结用户
     */
    @RequestMapping("/unfreeze/{userId}")
    @ResponseBody
    public ResponseData unfreeze(@PathVariable Long userId) {
        User user = userService.getOne(userId);
        user.setStatus(Status.ENABLE);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 分配角色
     */
    @RequestMapping("/role")
    @ResponseBody
    public ResponseData role(Long userId, String roleIds) {
        Set<Role> roles = roleService.findByIdIn(ArrayUtils.convertStrArrayToLong(roleIds.split(",")));
        User user = userService.getOne(userId);
        user.setRoles(roles);
        userService.update(user);
        return SUCCESS_TIP;
    }
}
