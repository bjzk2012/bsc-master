
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 通用控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/system")
@Slf4j
@Api("后台首页相关")
public class SystemController extends BasicController {

    @Autowired
    private UserService userService;

    /**
     * 主页面
     *
     * @author Tom
     */
    @GetMapping("/welcome")
    public String console() {
        return "/modular/frame/welcome.html";
    }

    /**
     * 主题页面
     *
     * @author Tom
     */
    @GetMapping("/theme")
    public String theme() {
        return "/modular/frame/theme.html";
    }

    /**
     * 跳转到修改密码界面
     *
     * @author Tom
     */
    @GetMapping("/password")
    public String password() {
        return "/modular/frame/password.html";
    }

    /**
     * 个人消息列表
     *
     * @author Tom
     */
    @GetMapping("/message")
    public String message() {
        return "/modular/frame/message.html";
    }

    /**
     * 跳转到查看用户详情页面
     *
     * @author Tom
     */
    @GetMapping("/user_info")
    public String userInfo(Model model) {
        User user = this.userService.getOne(getUser().getId());
        model.addAttribute("entity", user);
        return "/modular/frame/user_info.html";
    }

//    /**
//     * 按照时间统计PV
//     * @return
//     */
//    @RequestMapping(value = "/pv", method = RequestMethod.GET)
//    @ResponseBody
//    @ApiOperation("按照时间统计PV")
//    public ResponseData pv(){
//        Date time = new Date();
//        JSONObject result = new JSONObject();
//        // 总PV
//        List<PvDto> all = visitService.pv(null, null, null);
//        if (all != null && !all.isEmpty()){
//            result.put("all", all.get(0).getCount());
//        }
//        // 日PV
//        Date startTime = DateUtil.getStartTime(time);
//        Date endTime = DateUtil.getEndTime(time);
//        List<PvDto> day = visitService.pv("substring(send_time, 1, 10)", startTime, endTime);
//        if (day != null && !day.isEmpty()){
//            result.put("day", day.get(0).getCount());
//        }
//        // 月PV
//        startTime = DateUtil.setTime(time, Calendar.DAY_OF_MONTH, 1);
//        endTime = DateUtil.setTime(time, Calendar.DAY_OF_MONTH, DateUtil.getTimeIndex(time, Calendar.DAY_OF_MONTH));
//        List<PvDto> month = visitService.pv("substring(send_time, 1, 7)", startTime, endTime);
//        if (month != null && !month.isEmpty()){
//            result.put("month", month.get(0).getCount());
//        }
//        startTime = DateUtil.setTime(time, Calendar.DAY_OF_YEAR, 1);
//        endTime = DateUtil.setTime(time, Calendar.DAY_OF_YEAR, DateUtil.getTimeIndex(time, Calendar.DAY_OF_YEAR));
//        // 年度PV
//        List<PvDto> year = visitService.pv("substring(send_time, 1, 4)", startTime, endTime);
//        if (year != null && !year.isEmpty()){
//            result.put("year", year.get(0).getCount());
//        }
//        return ResponseData.success(result);
//    }
//
//    /**
//     * 按照地区统计Pv
//     * @return
//     */
//    @RequestMapping(value = "/regionpv", method = RequestMethod.GET)
//    @ResponseBody
//    @ApiOperation("按照地区统计Pv")
//    public ResponseData regionpv(){
//        List<PvDto> data = visitService.pv("city", null, null);
//        return ResponseData.success(data);
//    }
//
//    /**
//     * 按照地区统计Pv
//     * @return
//     */
//    @RequestMapping(value = "/hourpv", method = RequestMethod.GET)
//    @ResponseBody
//    @ApiOperation("按照小时统计Pv")
//    public ResponseData hourpv(){
//        Date time = new Date();
//        Date startTime = DateUtil.addTime(time, Calendar.HOUR, -12);
//        Date endTime = time;
//        List<PvDto> data = visitService.pv("substring(send_time, 12, 2)", startTime, endTime);
//        return ResponseData.success(data);
//    }
//
//    /**
//     * 1年内按照月统计Pv
//     * @return
//     */
//    @RequestMapping(value = "/monthpv", method = RequestMethod.GET)
//    @ResponseBody
//    @ApiOperation("1年内按照月统计Pv")
//    public ResponseData monthpv(){
//        Date time = new Date();
//        Date startTime = DateUtil.addTime(time, Calendar.YEAR, -1);
//        Date endTime = time;
//        List<PvDto> data = visitService.pv("substring(send_time, 6, 2)", startTime, endTime);
//        return ResponseData.success(data);
//    }
//
//    /**
//     * 按照登录人统计Pv
//     * @return
//     */
//    @RequestMapping(value = "/userpv", method = RequestMethod.GET)
//    @ResponseBody
//    @ApiOperation("按照登录人统计Pv")
//    public ResponseData userpv(){
//        List<PvDto> data = visitService.pv("login_name", null, null);
//        return ResponseData.success(data);
//    }

}
