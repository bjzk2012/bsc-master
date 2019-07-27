
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.service.MenuService;
import cn.kcyf.bsc.modular.system.service.RoleService;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.commons.utils.ArrayUtils;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import cn.kcyf.security.domain.ShiroUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Date;

/**
 * 角色控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BasicController {

    private static String PREFIX = "/modular/system/role";

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    /**
     * 跳转到角色列表页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/role.html";
    }

    /**
     * 跳转到添加角色
     */
    @RequestMapping(value = "/role_add")
    public String roleAdd() {
        return PREFIX + "/role_add.html";
    }

    /**
     * 跳转到修改角色
     */
    @RequestMapping(value = "/role_edit")
    public String roleEdit(Long roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return PREFIX + "/role_edit.html";
    }

    /**
     * 跳转到权限分配
     */
    @RequestMapping(value = "/role_assign/{roleId}")
    public String roleAssign(@PathVariable("roleId") Long roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return PREFIX + "/role_assign.html";
    }

    /**
     * 获取角色列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String roleName, int page, int limit) {
        Criteria<Role> criteria = new Criteria<Role>();
        if (!StringUtils.isEmpty(roleName)) {
            criteria.add(Restrictions.like("name", roleName));
        }
        return ResponseData.list(roleService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    /**
     * 角色新增
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Role role, @NotBlank(message = "菜单未选择") String menuId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        ShiroUser shiroUser = getUser();
        role.setId(null);
        role.setStatus(Status.ENABLE);
        role.setCreateTime(new Date());
        role.setCreateUserId(shiroUser.getId());
        role.setCreateUserName(shiroUser.getUsername());
        role.setMenus(menuService.findByIdIn(ArrayUtils.convertStrArrayToLong(menuId.split(","))));
        roleService.create(role);
        return SUCCESS_TIP;
    }

    /**
     * 角色修改
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ResponseData edit(@Valid Role role, @NotBlank(message = "菜单未选择") String menuId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Role dbrole = roleService.getOne(role.getId());
        ShiroUser shiroUser = getUser();
        dbrole.setLastUpdateTime(new Date());
        dbrole.setLastUpdateUserId(shiroUser.getId());
        dbrole.setLastUpdateUserName(shiroUser.getUsername());
        dbrole.setName(role.getName());
        dbrole.setDescription(role.getDescription());
        dbrole.setSort(role.getSort());
        dbrole.setMenus(menuService.findByIdIn(ArrayUtils.convertStrArrayToLong(menuId.split(","))));
        roleService.update(dbrole);
        return SUCCESS_TIP;
    }

    /**
     * 删除角色
     */
    @RequestMapping(value = "/delete/{roleId}")
    @ResponseBody
    public ResponseData delete(@PathVariable Long roleId) {
        roleService.delete(roleId);
        return SUCCESS_TIP;
    }

    /**
     * 禁用角色
     */
    @RequestMapping("/freeze/{roleId}")
    @ResponseBody
    public ResponseData freeze(@PathVariable Long roleId) {
        Role role = roleService.getOne(roleId);
        role.setStatus(Status.DISABLE);
        roleService.update(role);
        return SUCCESS_TIP;
    }

    /**
     * 启用角色
     */
    @RequestMapping("/unfreeze/{roleId}")
    @ResponseBody
    public ResponseData unfreeze(@PathVariable Long roleId) {
        Role role = roleService.getOne(roleId);
        role.setStatus(Status.ENABLE);
        roleService.update(role);
        return SUCCESS_TIP;
    }

    /**
     * 查看角色
     */
    @RequestMapping(value = "/detail/{roleId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long roleId) {
        return ResponseData.success(roleService.getOne(roleId));
    }

    /**
     * 配置权限
     */
    @RequestMapping("/authority/{roleId}")
    @ResponseBody
    public ResponseData setAuthority(@PathVariable Long roleId, @RequestParam("ids") String ids) {
//        roleService.setAuthority(roleId, ids);
        return SUCCESS_TIP;
    }

}
