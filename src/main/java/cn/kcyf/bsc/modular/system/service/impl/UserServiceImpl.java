package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.core.model.MenuNode;
import cn.kcyf.bsc.modular.system.dao.MenuDao;
import cn.kcyf.bsc.modular.system.dao.UserDao;
import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl extends AbstractBasicService<User, Long> implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private MenuDao menuDao;

    @Override
    public BasicDao<User, Long> getRepository() {
        return userDao;
    }

    @Transactional(readOnly = true)
    public List<MenuNode> getUserMenus(Long userId) {
        User user = userDao.getOne(userId);
        Set<Role> roles = user.getRoles();
        if (roles == null || roles.isEmpty()){
            return new ArrayList<MenuNode>();
        }
        List<Long> roleIds = new ArrayList<Long>();
        for (Role role : roles){
            roleIds.add(role.getId());
        }
        return buildMenus(menuDao.findByRoleIds(Arrays.asList(new Integer[]{0}), roleIds));
    }

    List<MenuNode> buildMenus(List<Menu> menus){
        List<MenuNode> result = new ArrayList<MenuNode>();
        if (menus != null && !menus.isEmpty()){
            for (Menu menu : menus){
                if (menu.getParentId() == null && menu.getLevels() == 1){
                    MenuNode node = new MenuNode();
                    BeanUtils.copyProperties(menu, node);
                    buildChild(node, menus);
                    result.add(node);
                }
            }
        }
        return result;
    }

    void buildChild(MenuNode node, List<Menu> menus){
        if (menus != null && !menus.isEmpty()){
            if (node.getChildren() == null){
                node.setChildren(new ArrayList<MenuNode>());
            }
            for(Menu menu : menus){
                if (node.getId().equals(menu.getParentId())) {
                    MenuNode child = new MenuNode();
                    BeanUtils.copyProperties(menu, child);
                    node.getChildren().add(child);
                    buildChild(child, menus);
                }
            }
        }
    }
}
