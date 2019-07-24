
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.security.util.KaptchaException;
import com.google.code.kaptcha.servlet.KaptchaServlet;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录控制器
 *
 * @author Tom
 */
@Controller
@Api(value = "登录相关", description = "登录相关")
public class LoginController extends BasicController{

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

    @RequestMapping(value = "login")
    public String login(HttpServletRequest request, Model modelMap) {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null && subject.isAuthenticated()){
            return "redirect:/";
        }
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        String error = null;
        if (KaptchaException.class.getName().equals(exceptionClassName)) {
            error = "验证码不正确";
        } else if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "用户不存在或密码错误";
        } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "用户不存在或密码错误";
        } else if (ExcessiveAttemptsException.class.getName().equals(exceptionClassName)){
            error = "密码错误次数已达上限，请10分钟后再试";
        } else if (exceptionClassName != null) {
            error = "未知错误：" + exceptionClassName;
        }
        modelMap.addAttribute("tips", error);
        return "/login.html";
    }
}
