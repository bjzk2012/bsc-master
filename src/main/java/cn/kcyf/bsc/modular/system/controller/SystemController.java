
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.constant.Constant;
import cn.kcyf.bsc.core.controller.BasicController;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.bsc.modular.system.service.VisitService;
import cn.kcyf.commons.utils.DateUtils;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

/**
 * 通用控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/system")
public class SystemController extends BasicController {

    @Autowired
    private UserService userService;

    @Autowired
    private VisitService visitService;

    @GetMapping("/welcome")
    public String console() {
        return "/modular/frame/welcome.html";
    }

    @GetMapping("/theme")
    public String theme() {
        return "/modular/frame/theme.html";
    }

    @GetMapping("/password")
    public String password() {
        return "/modular/frame/password.html";
    }

    @GetMapping("/message")
    public String message() {
        return "/modular/frame/message.html";
    }

    @GetMapping("/user_info")
    public String userInfo(Model model) {
        User user = this.userService.getOne(getUser().getId());
        model.addAttribute("entity", user);
        return "/modular/frame/user_info.html";
    }

    /**
     * 按照时间统计PV
     * @return
     */
    @GetMapping(value = "/pv")
    @ResponseBody
    public ResponseData pv(){
        Date time = new Date();
        JSONObject result = new JSONObject();
        // 总PV
        result.put("all", visitService.count());
        // 日PV
        Date startTime = DateUtils.getStartTime(time);
        Date endTime = DateUtils.getEndTime(time);
        List<Map<String, String>> day = visitService.day(startTime, endTime);
        if (day != null && !day.isEmpty()){
            result.put("day", day.get(0).get("count"));
        }
        // 月PV
        startTime = DateUtils.setTime(time, Calendar.DAY_OF_MONTH, 1);
        endTime = DateUtils.setTime(time, Calendar.DAY_OF_MONTH, DateUtils.getTimeIndex(time, Calendar.DAY_OF_MONTH));
        List<Map<String, String>> month = visitService.month(startTime, endTime);
        if (month != null && !month.isEmpty()){
            result.put("month", month.get(0).get("count"));
        }
        startTime = DateUtils.setTime(time, Calendar.DAY_OF_YEAR, 1);
        endTime = DateUtils.setTime(time, Calendar.DAY_OF_YEAR, DateUtils.getTimeIndex(time, Calendar.DAY_OF_YEAR));
        // 年度PV
        List<Map<String, String>> year = visitService.year(startTime, endTime);
        if (year != null && !year.isEmpty()){
            result.put("year", year.get(0).get("count"));
        }
        return ResponseData.success(result);
    }

    /**
     * 按照地区统计Pv
     * @return
     */
    @GetMapping(value = "/regionpv")
    @ResponseBody
    public ResponseData regionpv(){
        List<Map<String, String>> data = visitService.city();
        return ResponseData.success(data);
    }

    /**
     * 按照地区统计Pv
     * @return
     */
    @GetMapping(value = "/hourpv")
    @ResponseBody
    public ResponseData hourpv(){
        Date time = new Date();
        Date startTime = DateUtils.addTime(time, Calendar.HOUR, -12);
        Date endTime = time;
        List<Map<String, String>> data = visitService.hour(startTime, endTime);
        return ResponseData.success(data);
    }

    /**
     * 1年内按照月统计Pv
     * @return
     */
    @GetMapping(value = "/monthpv")
    @ResponseBody
    public ResponseData monthpv(){
        Date time = new Date();
        Date startTime = DateUtils.addTime(time, Calendar.YEAR, -1);
        Date endTime = time;
        List<Map<String, String>> data = visitService.month2year(startTime, endTime);
        return ResponseData.success(data);
    }

    /**
     * 按照登录人统计Pv
     * @return
     */
    @GetMapping(value = "/userpv")
    @ResponseBody
    public ResponseData userpv(){
        List<Map<String, String>> data = visitService.uv();
        return ResponseData.success(data);
    }

    @PostMapping("/upload")
    @ResponseBody
    @ApiOperation("文件上传")
    public ResponseData upload(@RequestPart("file") MultipartFile picture) {
        Map<String, String> result = new HashMap<String, String>();
        result.put("src", Constant.DEFAULT_HEAD);
        return new SuccessResponseData(result);
    }

}
