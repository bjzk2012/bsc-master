package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.MenuDao;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.service.MenuService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl extends AbstractBasicService<Menu, Long> implements MenuService {
    @Autowired
    private MenuDao menuDao;

    public BasicDao<Menu, Long> getRepository() {
        return menuDao;
    }
}
