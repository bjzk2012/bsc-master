package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.constant.Constant;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/center")
public class CenterController extends BasicController {

    @Autowired
    private UserService userService;

    @PostMapping("/user_info")
    @ResponseBody
    public ResponseData user_info(User user) {
        User dbuser = userService.getOne(getUser().getId());
        dbuser.setName(user.getName());
        dbuser.setSex(user.getSex());
        dbuser.setEmail(user.getEmail());
        dbuser.setBirthday(user.getBirthday());
        dbuser.setPhone(user.getPhone());
        dbuser.setAddress(user.getAddress());
        userService.update(dbuser);
        return SUCCESS_TIP;
    }

    /**
     * 修改当前用户的密码
     */
    @PostMapping("/password")
    @ResponseBody
    @BussinessLog(value = "设置新密码")
    public ResponseData password(
            @NotBlank(message = "旧密码不能为空")
            @Size(min = 6, max = 12, message = "旧密码必须6到12位")
            @Pattern(regexp = "[\\S]+", message = "旧密码不能出现空格") String oldPassword,
            @NotBlank(message = "新密码不能为空")
            @Size(min = 6, max = 12, message = "新密码必须6到12位")
            @Pattern(regexp = "[\\S]+", message = "新密码不能出现空格")
                    String newPassword,
            @NotBlank(message = "确认密码不能为空")
            @Size(min = 6, max = 12, message = "确认密码必须6到12位")
            @Pattern(regexp = "[\\S]+", message = "确认密码不能出现空格")
                    String rePassword) {
        User dbuser = userService.getOne(getUser().getId());
        if (!userService.md5(oldPassword, dbuser.getSalt()).equals(dbuser.getPassword())) {
            return ResponseData.error("旧密码输入错误");
        }
        if (!newPassword.equals(rePassword)) {
            return ResponseData.error("新密码和确认密码不一致");
        }
        dbuser.setPassword(userService.md5(newPassword, dbuser.getSalt()));
        userService.update(dbuser);
        return SUCCESS_TIP;
    }

    /**
     * 上传图片
     */
    @PostMapping("/upload")
    @ResponseBody
    public ResponseData upload(@RequestPart("file") MultipartFile picture) {
        Map<String, String> result = new HashMap<String, String>();
        result.put("src", Constant.DEFAULT_HEAD);
        return new SuccessResponseData(result);
    }
}
