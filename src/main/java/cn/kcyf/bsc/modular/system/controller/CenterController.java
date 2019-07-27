package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.constant.Constant;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/center")
public class CenterController extends BasicController{

    @Autowired
    private UserService userService;
    /**
     * 修改当前用户的密码
     */
    @PostMapping("/password")
    @ResponseBody
    public ResponseData password(
            @NotBlank(message = "确认密码不能为空")
            @Size(min = 6, max = 12, message = "确认密码必须6到12位")
            @Pattern(regexp = "[\\S]+", message = "确认密码不能出现空格") String oldPassword,
            String newPassword) {
        if (StringUtils.isEmpty(oldPassword) || StringUtils.isEmpty(newPassword)) {
            throw new RuntimeException("新旧密码都不能为空");
        }
        User user = userService.getOne(getUser().getId());
        user.setPassword(userService.md5(newPassword, user.getSalt()));
        userService.update(user);
        return SUCCESS_TIP;
    }

    /**
     * 上传图片
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public ResponseData upload(@RequestPart("file") MultipartFile picture) {
        Map<String, String> result = new HashMap<String, String>();
        result.put("src", Constant.DEFAULT_HEAD);
        return new SuccessResponseData(result);
    }
}
