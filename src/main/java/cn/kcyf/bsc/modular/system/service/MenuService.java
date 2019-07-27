package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.core.model.MenuNode;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.orm.jpa.service.BasicService;

import java.util.List;
import java.util.Set;

public interface MenuService extends BasicService<Menu, Long> {
    List<MenuNode> tree();

    void freeze(Long menuId);

    void unfreeze(Long menuId);

    Set<Menu> findByIdIn(List<Long> ids);
}
