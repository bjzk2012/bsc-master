
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.core.enumerate.Status;
import cn.kcyf.bsc.modular.system.service.MenuService;
import cn.kcyf.bsc.modular.system.service.RoleService;
import cn.kcyf.commons.utils.ArrayUtils;
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

/**
 * 角色控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/role")
@Api(tags = "角色管理", description = "角色管理")
public class RoleController extends BasicController {

    private static String PREFIX = "/modular/system/role";

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    @GetMapping("")
    public String index() {
        return PREFIX + "/role.html";
    }

    @GetMapping(value = "/role_add")
    public String roleAdd() {
        return PREFIX + "/role_add.html";
    }

    @GetMapping(value = "/role_edit")
    public String roleEdit(Long roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return PREFIX + "/role_edit.html";
    }

    @GetMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String roleName, int page, int limit) {
        Criteria<Role> criteria = new Criteria<Role>();
        if (!StringUtils.isEmpty(roleName)) {
            criteria.add(Restrictions.like("name", roleName));
        }
        return ResponseData.list(roleService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "新增角色")
    public ResponseData add(@Valid Role role, @NotBlank(message = "菜单未选择") String menuId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(role);
        role.setStatus(Status.ENABLE);
        role.setMenus(menuService.findByIdIn(ArrayUtils.convertStrArrayToLong(menuId.split(","))));
        roleService.create(role);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    @BussinessLog(value = "修改角色")
    public ResponseData edit(@Valid Role role, @NotBlank(message = "菜单未选择") String menuId, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Role dbrole = roleService.getOne(role.getId());
        update(dbrole);
        dbrole.setName(role.getName());
        dbrole.setDescription(role.getDescription());
        dbrole.setSort(role.getSort());
        dbrole.setMenus(menuService.findByIdIn(ArrayUtils.convertStrArrayToLong(menuId.split(","))));
        roleService.update(dbrole);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/delete/{roleId}")
    @ResponseBody
    @BussinessLog(value = "删除角色")
    public ResponseData delete(@PathVariable Long roleId) {
        roleService.delete(roleId);
        return SUCCESS_TIP;
    }

    @PostMapping("/freeze/{roleId}")
    @ResponseBody
    @BussinessLog(value = "禁用角色")
    public ResponseData freeze(@PathVariable Long roleId) {
        Role role = roleService.getOne(roleId);
        role.setStatus(Status.DISABLE);
        roleService.update(role);
        return SUCCESS_TIP;
    }

    @PostMapping("/unfreeze/{roleId}")
    @ResponseBody
    @BussinessLog(value = "启用角色")
    public ResponseData unfreeze(@PathVariable Long roleId) {
        Role role = roleService.getOne(roleId);
        role.setStatus(Status.ENABLE);
        roleService.update(role);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{roleId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long roleId) {
        return ResponseData.success(roleService.getOne(roleId));
    }

}
