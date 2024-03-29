package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.controller.BasicController;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.DeptNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/dept")
@Api(tags = "部门管理", description = "部门管理")
@RequiresRoles(value = "administrator")
public class DeptController extends BasicController {
    protected static SuccessResponseData SUCCESS_TIP = new SuccessResponseData();
    @Autowired
    private DeptService deptService;

    private String PREFIX = "/modular/system/dept/";


    @GetMapping("")
    @RequiresPermissions(value = "dept")
    public String index() {
        return PREFIX + "dept.html";
    }

    @GetMapping("/dept_add")
    @RequiresPermissions(value = "dept_add")
    public String deptAdd(Long parentId, Model model) {
        if (parentId != null && parentId.equals(0L)){
            parentId = null;
        }
        model.addAttribute("parentId", parentId);
        return PREFIX + "dept_add.html";
    }

    @GetMapping("/dept_edit")
    @RequiresPermissions(value = "dept_edit")
    public String deptUpdate(Long deptId, Model model) {
        model.addAttribute("deptId", deptId);
        String parentName = deptService.getParentName(deptId);
        model.addAttribute("parentName", parentName);
        return PREFIX + "dept_edit.html";
    }

    @GetMapping(value = "/treeSelect")
    @ResponseBody
    @ApiOperation("查询部门树形下拉列表")
    @RequiresPermissions(value = {"dept_add", "dept_edit", "mgr_add", "mgr_edit"}, logical = Logical.OR)
    public List<DeptNode> treeSelect() {
        return deptService.tree();
    }

    @GetMapping(value = "/list")
    @ResponseBody
    @ApiOperation("查询部门树形结构")
    @RequiresPermissions(value = "dept_list")
    public ResponseData list(String name) {
        Criteria<Dept> criteria = new Criteria<Dept>();
        if (!StringUtils.isEmpty(name)) {
            criteria.add(Restrictions.like("fullName", name));
        }
        return ResponseData.list(deptService.findList(criteria));
    }

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog("新增部门")
    @ApiOperation("新增部门")
    @RequiresPermissions(value = "dept_add")
    public ResponseData add(@Valid Dept dept, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        create(dept);
        deptService.create(dept);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/edit")
    @ResponseBody
    @BussinessLog("修改部门")
    @ApiOperation("修改部门")
    @RequiresPermissions(value = "dept_edit")
    public ResponseData edit(@Valid Dept dept, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return ResponseData.error(bindingResult.getAllErrors().get(0).getDefaultMessage());
        }
        Dept dbdept = deptService.getOne(dept.getId());
        update(dbdept);
        dbdept.setFullName(dept.getFullName());
        dbdept.setSimpleName(dept.getSimpleName());
        dbdept.setDescription(dept.getDescription());
        dbdept.setSort(dept.getSort());
        dbdept.setParentId(dept.getParentId());
        deptService.update(dbdept);
        return SUCCESS_TIP;
    }

    @PostMapping(value = "/delete/{deptId}")
    @ResponseBody
    @BussinessLog("删除部门")
    @ApiOperation("删除部门")
    @RequiresPermissions(value = "dept_delete")
    public ResponseData delete(@PathVariable("deptId") Long deptId) {
        deptService.delete(deptId);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{deptId}")
    @ResponseBody
    @ApiOperation("查看部门详情")
    @RequiresPermissions(value = {"dept_detail", "dept_edit"}, logical = Logical.OR)
    public Dept detail(@PathVariable("deptId") Long deptId) {
        return deptService.getOne(deptId);
    }

}
