
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录控制器
 *
 * @author Tom
 */
@Controller
@Api(value = "登录相关", description = "登录相关")
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到主页
     *
     * @author Tom
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ApiOperation("跳转到主页")
    public String index(Model model) {
        //获取当前用户角色列表

        List<Menu> menus = userService.getUserMenus();
        model.addAttribute("menus", menus);

        return "/index.html";
    }

    /**
     * 跳转到登录页面
     *
     * @author Tom
     */
    @ApiOperation("跳转到登录页面")
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        if (SecurityUtils.getSubject().isAuthenticated() || SecurityUtils.getSubject().getPrincipals() != null) {
            return "redirect:/";
        } else {
            return "/login.html";
        }
    }

    /**
     * 点击登录执行的动作
     *
     * @author Tom
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ApiOperation("点击登录执行的动作")
    @ApiImplicitParams({
            @ApiImplicitParam(value = "用户名", name = "username", required = true, paramType = "query", type = "string"),
            @ApiImplicitParam(value = "密码", name = "password", required = true, paramType = "query", type = "string"),
            @ApiImplicitParam(value = "是否记住密码", name = "remember", paramType = "query", type = "boolean"),
            @ApiImplicitParam(value = "验证码", name = "kaptcha", paramType = "query", type = "string")
    })
    public String loginVali(HttpSession session, String username, String password, String remember, String kaptcha, Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());

        //如果开启了记住我功能
//        if ("on".equals(remember)) {
//            token.setRememberMe(true);
//        } else {
//            token.setRememberMe(false);
//        }

//        // 验证码校验
//        if (StringUtils.isEmpty(kaptcha)){
//            model.addAttribute("tips", "未输入验证码，无法登陆");
//            return "/login.html";
//        } else if(!kaptcha.equals(session.getAttribute(Constants.KAPTCHA_SESSION_KEY))){
//            model.addAttribute("tips", "验证码输入错误，无法登陆");
//            return "/login.html";
//        }

        //执行shiro登录操作
//        currentUser.login(token);

        return "redirect:/";
    }

    /**
     * 退出登录
     *
     * @author Tom
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ApiOperation("退出登录")
    public String logOut() {
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }
}
