
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.MenuService;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
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
     * 修该菜单
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ResponseData edit(Menu menu) {

        //如果修改了编号，则该菜单的子菜单也要修改对应编号
        menuService.update(menu);
        return SUCCESS_TIP;
    }

    /**
     * 获取菜单列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String menuName, String level, Long menuId, int page, int limit) {
        Criteria<Menu> criteria = new Criteria<Menu>();
        if (!StringUtils.isEmpty(menuName)){
            criteria.add(Restrictions.like("name", menuName));
        }
        if (!StringUtils.isEmpty(level)){
            criteria.add(Restrictions.eq("levels", level));
        }
        if (menuId != null){
            criteria.add(Restrictions.eq("parentId", menuId));
        }
        return ResponseData.list(menuService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    /**
     * 获取菜单列表（树形）
     */
    @RequestMapping(value = "/listTree")
    @ResponseBody
    public ResponseData listTree(String menuName, String level) {
        Criteria<Menu> criteria = new Criteria<Menu>();
        if (!StringUtils.isEmpty(menuName)){
            criteria.add(Restrictions.like("name", menuName));
        }
        if (!StringUtils.isEmpty(level)){
            criteria.add(Restrictions.eq("levels", level));
        }
        return ResponseData.list(menuService.findList(criteria, PageRequest.of(0, Integer.MAX_VALUE)));
    }

    /**
     * 新增菜单
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Menu menu, Long parentId) {
        return SUCCESS_TIP;
    }

    /**
     * 删除菜单
     */
    @RequestMapping(value = "/delete/{menuId}")
    @ResponseBody
    public ResponseData delete(@PathVariable Long menuId) {
        return SUCCESS_TIP;
    }

    /**
     * 查看菜单
     */
    @RequestMapping(value = "/detail/{menuId}")
    @ResponseBody
    public ResponseData view(@PathVariable Long menuId) {
        Menu menu = menuService.getOne(menuId);
        return ResponseData.success(menu);
    }

    /**
     * 获取菜单列表(首页用)
     */
    @RequestMapping(value = "/menuTreeList")
    @ResponseBody
    public List<Menu> menuTreeList() {
        return null;
    }

    /**
     * 获取菜单列表(选择父级菜单用)
     */
    @RequestMapping(value = "/selectMenuTreeList")
    @ResponseBody
    public List<Menu> selectMenuTreeList() {
        return null;
    }

}
