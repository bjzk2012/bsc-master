package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.modular.system.dao.UserDao;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.security.domain.ShiroUser;
import cn.kcyf.security.service.ShiroService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.nio.cs.US_ASCII;

import java.util.Set;

@Service
public class ShiroServiceImpl implements ShiroService {
    @Autowired
    private UserDao userDao;
    public ShiroUser getUser(String account) {
        User user = userDao.findFirstByAccount(account);
        if (user == null){
            return null;
        }
        ShiroUser shiroUser = new ShiroUser(user.getId(), user.getAccount(), user.getPassword(), user.getSalt(), Status.DISABLE.equals(user.getStatus()), "/");
        return shiroUser;
    }

    public Object getUserInfo(String account) {
        return null;
    }

    public JSONObject getDetail(String s) {
        return null;
    }

    public Set<String> getRoles(String s) {
        return null;
    }

    public Set<String> getPermissions(String s) {
        return null;
    }

    public ShiroUser loginLogger(Long aLong, String s, String s1, int i, boolean b) {
        return null;
    }

    public ShiroUser checkUser(JSONObject jsonObject) {
        return null;
    }
}
