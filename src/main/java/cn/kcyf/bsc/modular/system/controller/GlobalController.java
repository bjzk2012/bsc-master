
package cn.kcyf.bsc.modular.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 全局的控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/global")
public class GlobalController extends BasicController{

    @RequestMapping(path = "/error")
    public String error() {
        return "/404.html";
    }

    @RequestMapping(path = "/sessionError")
    public String sessionError(Model model) {
        model.addAttribute("tips", "session超时");
        return "/login.html";
    }
}
