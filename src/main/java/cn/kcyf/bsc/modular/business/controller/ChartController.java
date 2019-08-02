package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.modular.system.controller.BasicController;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/chart")
@Api(tags = "统计管理", description = "统计管理")
public class ChartController extends BasicController {
    private static String PREFIX = "/modular/business/chart";
    @Autowired
    private UserService userService;

    @GetMapping("/total")
    public String total(Model model) {
        return PREFIX + "/total.html";
    }
    @GetMapping("/total/users")
    @ResponseBody
    public List<User> total_users() {
        User user = userService.getOne(getUser().getId());
        boolean isAdmin = false;
        for (Role role : user.getRoles()){
            if (role.getDescription().equals("administrator")){
                isAdmin = true;
                continue;
            }
        }
        Criteria<User> criteria = new Criteria<User>();
        if (!isAdmin){
            criteria.add(Restrictions.eq("dept.id", user.getDept().getId()));
        }
        criteria.add(Restrictions.ne("roles.description", "administrator"));
        return userService.findList(criteria);
    }

    @GetMapping("/project")
    public String project(Model model) {
        return PREFIX + "/project.html";
    }

    @GetMapping("/user")
    public String user(Model model) {
        return PREFIX + "/user.html";
    }


}
