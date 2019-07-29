package cn.kcyf.bsc.modular.system.controller;

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

    protected void create(TableDomain domain) {
        ShiroUser shiroUser = getUser();
        domain.setId(null);
        domain.setCreateTime(new Date());
        domain.setCreateUserId(shiroUser.getId());
        domain.setCreateUserName(shiroUser.getUsername());
    }

    protected void update(TableDomain domain) {
        ShiroUser shiroUser = getUser();
        domain.setLastUpdateTime(new Date());
        domain.setLastUpdateUserId(shiroUser.getId());
        domain.setLastUpdateUserName(shiroUser.getUsername());
    }
}
