
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.service.RoleService;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.hibernate.QueryException;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.bind.validation.ValidationErrors;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/**
 * 系统管理员控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/mgr")
public class UserMgrController extends BasicController {

    private final static String PREFIX = "/modular/system/user/";
    private final static String DEFAULT_PWD = "111111";
    private final static String DEFAULT_HEAD= "/assets/common/images/head.png";

    /**
     * 加密方式
     */
    @Value("${shiro.password.algorithmName}")
    public String algorithmName;

    /**
     * 循环次数
     */
    @Value("${shiro.password.hashIterations}")
    public int hashIterations;

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    /**
     * 跳转到查看管理员列表的页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "user.html";
    }

    /**
     * 跳转到查看管理员列表的页面
     */
    @RequestMapping("/user_add")
    public String addView() {
        return PREFIX + "user_add.html";
    }

    /**
     * 跳转到角色分配页面
     */
    @RequestMapping("/role_assign")
    public String roleAssign(Long userId, Model model) {
        model.addAttribute("userId", userId);
        return PREFIX + "user_roleassign.html";
    }

    /**
     * 跳转到编辑管理员页面
     */
    @RequestMapping("/user_edit")
    public String userEdit(Long userId) {
        return PREFIX + "user_edit.html";
    }

    /**
     * 获取用户详情
     */
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public Object getUserInfo(Long userId) {
        return ResponseData.success(userService.getOne(userId));
    }

    /**
     * 修改当前用户的密码
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public Object changePwd(
            @NotBlank(message = "确认密码不能为空")
            @Size(min = 6, max = 12, message = "确认密码必须6到12位")
            @Pattern(regexp = "[\\S]+", message = "确认密码不能出现空格") String oldPassword, 
            String newPassword) {
        if (StringUtils.isEmpty(oldPassword) || StringUtils.isEmpty(newPassword)) {
            throw new RuntimeException("新旧密码都不能为空");
        }
        User user = userService.getOne(getUser().getId());
        user.setPassword(md5(newPassword, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 查询管理员列表
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object list(String name, String timeLimit, int page, int limit) {
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
                            @NotBlank(message = "确认密码不能为空")String rePassword,
                            BindingResult bindingResult) {
        if (!password.equals(rePassword)){
            return ResponseData.error("两次密码输入不一致");
        }
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        user.setAvatar(DEFAULT_HEAD);
        user.setCreateTime(new Date());
        user.setCreateUserId(getUser().getId());
        user.setCreateUserName(getUser().getUsername());
        user.setStatus(Status.ENABLE);
        user.setSalt(RandomStringUtils.randomAlphabetic(5));
        user.setPassword(md5(password, user.getSalt()));
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
    public ResponseData edit(@Valid User user, Long deptId, String roleId) {
        User dbuser = userService.getOne(user.getId());
        if (!StringUtils.isEmpty(user.getPassword())){
            dbuser.setPassword(md5(user.getPassword(), dbuser.getSalt()));
        }
        dbuser.setBirthday(user.getBirthday());
        dbuser.setEmail(user.getEmail());
        dbuser.setSex(user.getSex());
        // TODO 设置部门
        if (!StringUtils.isEmpty(roleId)){
            dbuser.setRoles(new HashSet<Role>());
            dbuser.getRoles().addAll(roleService.findByIdIn(roleId.split(",")));
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
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(Long userId) {
        userService.delete(userId);
        return SUCCESS_TIP;
    }

    /**
     * 查看管理员详情
     */
    @RequestMapping("/view/{userId}")
    @ResponseBody
    public User view(@PathVariable Long userId) {
        return userService.getOne(userId);
    }

    /**
     * 重置管理员的密码
     */
    @RequestMapping("/reset")
    @ResponseBody
    public ResponseData reset(Long userId) {
        User user = userService.getOne(userId);
        user.setPassword(md5(DEFAULT_PWD, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 冻结用户
     */
    @RequestMapping("/freeze")
    @ResponseBody
    public ResponseData freeze(Long userId) {
        User user = userService.getOne(userId);
        user.setStatus(Status.DISABLE);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 解除冻结用户
     */
    @RequestMapping("/unfreeze")
    @ResponseBody
    public ResponseData unfreeze(Long userId) {
        User user = userService.getOne(userId);
        user.setStatus(Status.ENABLE);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 分配角色
     */
    @RequestMapping("/setRole")
    @ResponseBody
    public ResponseData setRole(@RequestParam("userId") Long userId, @RequestParam("roleIds") String roleIds) {
        String[] roleIdArray = roleIds.split(",");
        Set<Role> roles = roleService.findByIdIn(roleIdArray);
        User user = userService.getOne(userId);
        user.setRoles(roles);
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 上传图片
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public ResponseData upload(@RequestPart("file") MultipartFile picture) {
        Map<String, String> result = new HashMap<String, String>();
        result.put("src", DEFAULT_HEAD);
        return new SuccessResponseData(result);
    }

    private String md5(String credentials, String saltSource) {
        return new SimpleHash(algorithmName, credentials, ByteSource.Util.bytes(saltSource), hashIterations).toHex();
    }
}
