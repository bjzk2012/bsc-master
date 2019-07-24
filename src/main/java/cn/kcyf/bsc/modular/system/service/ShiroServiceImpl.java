package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.security.domain.ShiroUser;
import cn.kcyf.security.service.ShiroService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class ShiroServiceImpl implements ShiroService {
    public ShiroUser getUser(String account) {
        return null;
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
