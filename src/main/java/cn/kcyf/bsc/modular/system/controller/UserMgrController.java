
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

/**
 * 系统管理员控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/mgr")
public class UserMgrController extends BasicController {

    private static String PREFIX = "/modular/system/user/";

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
    public String roleAssign(@RequestParam Long userId, Model model) {
        model.addAttribute("userId", userId);
        return PREFIX + "user_roleassign.html";
    }

    /**
     * 跳转到编辑管理员页面
     */
    @RequestMapping("/user_edit")
    public String userEdit(@RequestParam Long userId) {
        User user = userService.getOne(userId);
        return PREFIX + "user_edit.html";
    }

    /**
     * 获取用户详情
     */
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public Object getUserInfo(@RequestParam Long userId) {
        return ResponseData.success(userService.getOne(userId));
    }

    /**
     * 修改当前用户的密码
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public Object changePwd(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword) {
        if (StringUtils.isEmpty(oldPassword) || StringUtils.isEmpty(newPassword)) {
            throw new RuntimeException("新旧密码都不能为空");
        }
//        userService.changePwd(oldPassword, newPassword);
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
    public ResponseData add(@Valid User user) {
        userService.create(user);
        return SUCCESS_TIP;
    }

    /**
     * 修改管理员
     */
    @RequestMapping("/edit")
    @ResponseBody
    public ResponseData edit(@Valid User user) {
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 删除管理员（逻辑删除）
     */
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseData delete(@RequestParam Long userId) {
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
    public ResponseData reset(@RequestParam Long userId) {
        User user = userService.getOne(userId);
//        user.setSalt(ShiroKit.getRandomSalt(5));
//        user.setPassword(ShiroKit.md5(Const.DEFAULT_PWD, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 冻结用户
     */
    @RequestMapping("/freeze")
    @ResponseBody
    public ResponseData freeze(@RequestParam Long userId) {
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
    public ResponseData unfreeze(@RequestParam Long userId) {
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

//        String pictureName = UUID.randomUUID().toString() + "." + ToolUtil.getFileSuffix(picture.getOriginalFilename());
//        String fileSavePath = gunsProperties.getFileUploadPath();
//        try {
//            picture.transferTo(new File(fileSavePath + pictureName));
//        } catch (Exception e) {
//            throw new ServiceException(BizExceptionEnum.UPLOAD_ERROR);
//        }
        Map<String, String> result = new HashMap<String, String>();
//        result.put("src", fileSavePath + pictureName);
        return new SuccessResponseData(result);
    }
}
