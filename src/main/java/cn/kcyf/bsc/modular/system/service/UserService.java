package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.orm.jpa.service.BasicService;

import java.util.List;

public interface UserService extends BasicService<User, Long> {
    List<Menu> getUserMenus();
}
