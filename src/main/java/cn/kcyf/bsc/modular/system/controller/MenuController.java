
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.MenuNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.service.MenuService;
import cn.kcyf.bsc.modular.system.service.UserService;
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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 菜单控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BasicController {

    private static String PREFIX = "/modular/system/menu/";

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    /**
     * 跳转到菜单列表列表页面
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "menu.html";
    }

    /**
     * 跳转到菜单列表列表页面
     */
    @RequestMapping(value = "/menu_add")
    public String menuAdd() {
        return PREFIX + "menu_add.html";
    }

    /**
     * 跳转到菜单详情列表页面
     */
    @RequestMapping(value = "/menu_edit")
    public String menuEdit(Long menuId, Model model) {
        model.addAttribute("menuId", menuId);
        return PREFIX + "menu_edit.html";
    }

    /**
     * 获取菜单列表（树形）
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String menuName, String level) {
        Criteria<Menu> criteria = new Criteria<Menu>();
        if (!StringUtils.isEmpty(menuName)){
            criteria.add(Restrictions.like("name", menuName));
        }
        if (!StringUtils.isEmpty(level)){
            criteria.add(Restrictions.eq("levels", level));
        }
        return ResponseData.list(menuService.findList(criteria));
    }

    @RequestMapping(value = "/treeSelect")
    @ResponseBody
    public List<MenuNode> treeSelect() {
        MenuNode root = new MenuNode();
        root.setId(0L);
        root.setName("顶级菜单");
        List<MenuNode> list = menuService.tree();
        root.setChildren(list);
        List<MenuNode> result = new ArrayList<MenuNode>();
        result.add(root);
        return result;
    }

    /**
     * 新增菜单
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Menu menu, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        ShiroUser shiroUser = getUser();
        menu.setId(null);
        menu.setCreateTime(new Date());
        menu.setCreateUserId(shiroUser.getId());
        menu.setCreateUserName(shiroUser.getUsername());
        menu.setStatus(Status.ENABLE);
        if (menu.getParentId() != null && !menu.getParentId().equals(0L)){
            menu.setLevels(menuService.getOne(menu.getParentId()).getLevels() + 1);
        } else {
            menu.setParentId(null);
            menu.setLevels(1);
        }
        menuService.create(menu);
        return SUCCESS_TIP;
    }

    /**
     * 修该菜单
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ResponseData edit(@Valid Menu menu, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Menu dbmenu = menuService.getOne(menu.getId());
        ShiroUser shiroUser = getUser();
        menu.setLastUpdateTime(new Date());
        menu.setLastUpdateUserId(shiroUser.getId());
        menu.setLastUpdateUserName(shiroUser.getUsername());
        menu.setStatus(Status.ENABLE);
        dbmenu.setCode(menu.getCode());
        dbmenu.setName(menu.getName());
        dbmenu.setIcon(menu.getIcon());
        dbmenu.setUrl(menu.getUrl());
        dbmenu.setMenuFlag(menu.getMenuFlag());
        dbmenu.setDescription(menu.getDescription());
        dbmenu.setSort(menu.getSort());
        dbmenu.setParentId(menu.getParentId());
        if (dbmenu.getParentId() != null && !menu.getParentId().equals(0L)){
            dbmenu.setLevels(menuService.getOne(dbmenu.getParentId()).getLevels() + 1);
        } else {
            menu.setParentId(null);
            menu.setLevels(1);
        }
        menuService.update(dbmenu);
        return SUCCESS_TIP;
    }

    /**
     * 删除菜单
     */
    @RequestMapping(value = "/delete/{menuId}")
    @ResponseBody
    public ResponseData delete(@PathVariable Long menuId) {
        menuService.delete(menuId);
        return SUCCESS_TIP;
    }

    /**
     * 查看菜单
     */
    @RequestMapping(value = "/detail/{menuId}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long menuId) {
        Menu menu = menuService.getOne(menuId);
        return ResponseData.success(menu);
    }

    /**
     * 禁用菜单
     */
    @RequestMapping("/freeze/{menuId}")
    @ResponseBody
    public ResponseData freeze(@PathVariable Long menuId) {
        menuService.freeze(menuId);
        return SUCCESS_TIP;
    }

    /**
     * 启用菜单
     */
    @RequestMapping("/unfreeze/{menuId}")
    @ResponseBody
    public ResponseData unfreeze(@PathVariable Long menuId) {
        menuService.unfreeze(menuId);
        return SUCCESS_TIP;
    }

}
