package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {
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
    public String deptAdd() {
        return PREFIX + "dept_add.html";
    }

    /**
     * 跳转到修改部门
     */
    @RequestMapping("/dept_update")
    public String deptUpdate(@RequestParam("deptId") Long deptId) {
        return PREFIX + "dept_edit.html";
    }

    /**
     * 获取部门的tree列表，ztree格式
     */
    @RequestMapping(value = "/tree")
    @ResponseBody
    public List<Dept> tree() {
        return null;
    }

    /**
     * 获取部门的tree列表，treeview格式
     */
    @RequestMapping(value = "/treeview")
    @ResponseBody
    public List<Dept> treeview() {
        return null;
    }

    /**
     * 新增部门
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseData add(Dept dept) {
        return SUCCESS_TIP;
    }

    /**
     * 获取所有部门列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(value = "condition", required = false) String condition,
                       @RequestParam(value = "deptId", required = false) String deptId) {
        return null;
    }

    /**
     * 部门详情
     */
    @RequestMapping(value = "/detail/{deptId}")
    @ResponseBody
    public Object detail(@PathVariable("deptId") Long deptId) {
        return null;
    }

    /**
     * 修改部门
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public ResponseData update(Dept dept) {
        return SUCCESS_TIP;
    }

    /**
     * 删除部门
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResponseData delete(@RequestParam Long deptId) {
        return SUCCESS_TIP;
    }

}
