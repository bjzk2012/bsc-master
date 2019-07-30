package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.DeptNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController extends BasicController{
    protected static SuccessResponseData SUCCESS_TIP = new SuccessResponseData();
    @Autowired
    private DeptService deptService;

    private String PREFIX = "/modular/system/dept/";


    @GetMapping("")
    public String index() {
        return PREFIX + "dept.html";
    }

    @GetMapping("/dept_add")
    public String deptAdd(Long parentId, Model model) {
        if (parentId != null && parentId.equals(0L)){
            parentId = null;
        }
        model.addAttribute("parentId", parentId);
        return PREFIX + "dept_add.html";
    }

    @GetMapping("/dept_edit")
    public String deptUpdate(Long deptId, Model model) {
        model.addAttribute("deptId", deptId);
        String parentName = deptService.getParentName(deptId);
        model.addAttribute("parentName", parentName);
        return PREFIX + "dept_edit.html";
    }

    @GetMapping(value = "/tree")
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

    @GetMapping(value = "/treeSelect")
    @ResponseBody
    public List<DeptNode> treeSelect() {
        return deptService.tree();
    }

    @GetMapping(value = "/list")
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

    @PostMapping(value = "/add")
    @ResponseBody
    @BussinessLog(value = "新增部门")
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
    @BussinessLog(value = "修改部门")
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
    @BussinessLog(value = "删除部门")
    public ResponseData delete(@PathVariable("deptId") Long deptId) {
        deptService.delete(deptId);
        return SUCCESS_TIP;
    }

    @GetMapping(value = "/detail/{deptId}")
    @ResponseBody
    public Dept detail(@PathVariable("deptId") Long deptId) {
        return deptService.getOne(deptId);
    }

}
