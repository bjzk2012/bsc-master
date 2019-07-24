package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.security.domain.ShiroUser;
import org.apache.shiro.SecurityUtils;

/**
 * Created by Administrator on 2017/8/5 0005.
 */
public abstract class BasicController {
    protected final String REDIRECT = "redirect:";
    protected final String FORWARD = "forward:";
    protected static SuccessResponseData SUCCESS_TIP = new SuccessResponseData();
    protected ShiroUser getUser(){
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }
}
