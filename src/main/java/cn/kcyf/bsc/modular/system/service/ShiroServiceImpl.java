package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.core.enumerate.LogType;
import cn.kcyf.bsc.core.enumerate.Succeed;
import cn.kcyf.bsc.core.log.LogFactory;
import cn.kcyf.bsc.modular.system.dao.MenuDao;
import cn.kcyf.bsc.modular.system.dao.UserDao;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.core.enumerate.Status;
import cn.kcyf.security.domain.ShiroUser;
import cn.kcyf.security.service.ShiroService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ShiroServiceImpl implements ShiroService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private LogFactory logFactory;

    public ShiroUser getUser(String account) {
        User user = userDao.findFirstByAccount(account);
        if (user == null) {
            return null;
        }
        ShiroUser shiroUser = new ShiroUser(user.getId(), user.getAccount(), user.getPassword(), user.getSalt(), Status.DISABLE.equals(user.getStatus()), "/");
        return shiroUser;
    }

    public Object getUserInfo(String account) {
        return userDao.findFirstByAccount(account);
    }

    public JSONObject getDetail(String account) {
        return JSON.parseObject(JSON.toJSONString(userDao.findFirstByAccount(account)));
    }

    public Set<String> getRoles(String account) {
        User user = userDao.findFirstByAccount(account);
        Set<String> roles = new HashSet<String>();
        if (user.getRoles() != null && !user.getRoles().isEmpty()) {
            for (Role role : user.getRoles()) {
                roles.add(role.getDescription());
            }
        }
        return roles;
    }

    public Set<String> getPermissions(String account) {
        User user = userDao.findFirstByAccount(account);
        List<Long> roleIds = new ArrayList<Long>();
        if (user.getRoles() != null && !user.getRoles().isEmpty()) {
            for (Role role : user.getRoles()) {
                roleIds.add(role.getId());
            }
        }
        Set<String> menus = new HashSet<String>();
        List<Menu> menuAll = menuDao.findByRoleIds(Arrays.asList(new Integer[]{0, 1}), roleIds);
        if (menuAll != null && !menuAll.isEmpty()) {
            for (Menu menu : menuAll) {
                menus.add(menu.getCode());
            }
        }
        return menus;
    }

    public ShiroUser loginLogger(Long loginId, String loginName, String loginIp, int loginType, boolean success) {
        if (success) {
            logFactory.log(LogType.LOGIN, LogType.LOGIN.getMessage(), this.getClass().getName(), "post", Succeed.SUCCESS, String.format("用户【%s】登录成功", loginName));
        } else {
            logFactory.log(LogType.LOGIN_FAIL, LogType.LOGIN_FAIL.getMessage(), this.getClass().getName(), "post", Succeed.SUCCESS, String.format("用户【%s】登录失败", loginName));
        }
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }

    public ShiroUser checkUser(JSONObject jsonObject) {
        return null;
    }
}
