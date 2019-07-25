package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface RoleDao extends BasicDao<Role, Long> {
    Set<Role> findByIdIn(String[] ids);
}
