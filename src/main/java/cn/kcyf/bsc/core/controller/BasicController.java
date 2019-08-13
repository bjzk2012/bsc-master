package cn.kcyf.bsc.core.controller;

import cn.kcyf.bsc.core.model.SuccessResponseData;
import cn.kcyf.orm.jpa.entity.TableDomain;
import cn.kcyf.security.domain.ShiroUser;
import org.apache.shiro.SecurityUtils;

import java.util.Date;

/**
 * 所有Controller的父类
 *
 * @author Tom
 */
public abstract class BasicController {
    protected final String REDIRECT = "redirect:";
    protected final String FORWARD = "forward:";
    protected final static SuccessResponseData SUCCESS_TIP = new SuccessResponseData();

    protected ShiroUser getUser() {
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }

    protected Boolean isAuthenticated(){
        return SecurityUtils.getSubject().isAuthenticated();
    }

    protected void create(TableDomain domain) {
        ShiroUser shiroUser = getUser();
        domain.setId(null);
        domain.setCreateUserId(shiroUser.getId());
        domain.setCreateUserName(shiroUser.getAccount());
    }

    protected void update(TableDomain domain) {
        ShiroUser shiroUser = getUser();
        domain.setLastUpdateUserId(shiroUser.getId());
        domain.setLastUpdateUserName(shiroUser.getAccount());
    }
}
