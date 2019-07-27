package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.DeptNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController extends BasicController{
    protected static SuccessResponseData SUCCESS_TIP = new SuccessResponseData();
    @Autowired
    private DeptService deptService;

    private String PREFIX = "/modular/system/dept/";


    /**
     * 跳转到部门管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "dept.html";
    }

    /**
     * 跳转到添加部门
     */
    @RequestMapping("/dept_add")
    public String deptAdd(Long parentId, Model model) {
        if (parentId != null && parentId.equals(0L)){
            parentId = null;
        }
        model.addAttribute("parentId", parentId);
        return PREFIX + "dept_add.html";
    }

    /**
     * 跳转到修改部门
     */
    @RequestMapping("/dept_edit")
    public String deptUpdate(Long deptId, Model model) {
        model.addAttribute("deptId", deptId);
        String parentName = deptService.getParentName(deptId);
        model.addAttribute("parentName", parentName);
        return PREFIX + "dept_edit.html";
    }

    /**
     * 获取部门的tree列表
     */
    @RequestMapping(value = "/tree")
    @ResponseBody
    public ResponseData tree() {
        List<Dept> list = deptService.findAll();
        if (list == null || list.isEmpty()){
            list = new ArrayList<Dept>();
            Dept empty = new Dept();
            empty.setId(0L);
            empty.setSimpleName("暂无部门信息");
            list.add(empty);
        }
        return ResponseData.success(list);
    }

    /**
     * 获取部门的tree列表
     */
    @RequestMapping(value = "/treeSelect")
    @ResponseBody
    public List<DeptNode> treeSelect() {
        return deptService.tree();
    }

    /**
     * 获取所有部门列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseData list(String condition, Long deptId, int page, int limit) {
        Criteria<Dept> criteria = new Criteria<Dept>();
        if (!StringUtils.isEmpty(condition)) {
            criteria.add(Restrictions.like("fullName", condition));
        }
        if (deptId != null) {
            criteria.add(Restrictions.eq("parentId", deptId));
        } else {
            criteria.add(Restrictions.isNull("parentId"));
        }
        return ResponseData.list(deptService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    /**
     * 新增部门
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseData add(@Valid Dept dept, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        ShiroUser shiroUser = getUser();
        dept.setId(null);
        dept.setCreateTime(new Date());
        dept.setCreateUserId(shiroUser.getId());
        dept.setCreateUserName(shiroUser.getUsername());
        deptService.create(dept);
        return SUCCESS_TIP;
    }

    /**
     * 修改部门
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public ResponseData edit(@Valid Dept dept, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Dept dbdept = deptService.getOne(dept.getId());
        ShiroUser shiroUser = getUser();
        dbdept.setLastUpdateTime(new Date());
        dbdept.setLastUpdateUserId(shiroUser.getId());
        dbdept.setLastUpdateUserName(shiroUser.getUsername());
        dbdept.setFullName(dept.getFullName());
        dbdept.setSimpleName(dept.getSimpleName());
        dbdept.setDescription(dept.getDescription());
        dbdept.setSort(dept.getSort());
        dbdept.setParentId(dept.getParentId());
        deptService.update(dbdept);
        return SUCCESS_TIP;
    }

    /**
     * 删除部门
     */
    @RequestMapping(value = "/delete/{deptId}")
    @ResponseBody
    public ResponseData delete(@PathVariable("deptId") Long deptId) {
        deptService.delete(deptId);
        return SUCCESS_TIP;
    }

    /**
     * 部门详情
     */
    @RequestMapping(value = "/detail/{deptId}")
    @ResponseBody
    public Dept detail(@PathVariable("deptId") Long deptId) {
        return deptService.getOne(deptId);
    }

}
