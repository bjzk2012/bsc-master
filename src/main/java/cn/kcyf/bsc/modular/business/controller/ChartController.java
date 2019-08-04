package cn.kcyf.bsc.modular.business.controller;

import cn.kcyf.bsc.core.model.ChartTotalTimeComparator;
import cn.kcyf.bsc.core.model.MenuNode;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.service.WorkService;
import cn.kcyf.bsc.modular.system.controller.BasicController;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.commons.utils.DateUtils;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import cn.kcyf.security.service.ShiroService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.*;
import java.util.*;

@Controller
@RequestMapping("/chart")
@Api(tags = "统计管理", description = "统计管理")
public class ChartController extends BasicController {
    private static String PREFIX = "/modular/business/chart";
    @Autowired
    private UserService userService;
    @Autowired
    private ShiroService shiroService;
    @Autowired
    private WorkService workService;

    @GetMapping("/total")
    public String total(Model model) {
        return PREFIX + "/total.html";
    }
    @GetMapping("/total/users")
    @ResponseBody
    public List<User> total_users() {
        Set<String> roles = shiroService.getRoles(getUser().getUsername());
        User user = userService.getOne(getUser().getId());
        boolean isAdmin = roles.contains("administrator");
        Criteria<User> criteria = new Criteria<User>();
        if (!isAdmin){
            criteria.add(Restrictions.eq("dept.id", user.getDept().getId()));
        }
        criteria.add(Restrictions.ne("roles.description",  "administrator"));
        return userService.findList(criteria);
    }
    @GetMapping("/total/list")
    @ResponseBody
    public ResponseData total_list() {
        List<Work> list = workService.findAll();
        JSONArray result = new JSONArray();
        Map<String, List<Work>> timelist = new HashMap<String, List<Work>>();
        Date today = DateUtils.getStartTime(new Date());
        for (int i = 0; i < 7; i++){
            Date time = DateUtils.addTime(today, Calendar.DAY_OF_YEAR, 0-i);
            timelist.put(DateUtils.format(time, "yyyy-MM-dd"), new ArrayList<Work>());
        }
        if (list != null && !list.isEmpty()){
            for (Work work : list){
                String time = DateUtils.format(work.getToday(), "yyyy-MM-dd");
                timelist.get(time).add(work);
            }
        }
        List<User> users = total_users();
        List<Long> userIds = new ArrayList<Long>();
        if (users != null && !users.isEmpty()){
            for (User user : users){
                userIds.add(user.getId());
            }
        }
        for(String key : timelist.keySet()){
            JSONObject object = new JSONObject();
            object.put("time", key);
            for (Work work : timelist.get(key)){
                if (userIds.contains(work.getCreateUserId())) {
                    object.put("user_" + work.getCreateUserId(), work.getStatus());
                }
            }
            result.add(object);
        }
        List<JSONObject> objects = result.toJavaList(JSONObject.class);
        Collections.sort(objects, new ChartTotalTimeComparator());
        return ResponseData.list(objects);
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
