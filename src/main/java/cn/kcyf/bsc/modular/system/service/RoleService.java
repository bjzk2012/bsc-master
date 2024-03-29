package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.modular.system.entity.Role;
import cn.kcyf.orm.jpa.service.BasicService;

import java.util.List;
import java.util.Set;

public interface RoleService extends BasicService<Role, Long> {
    Set<Role> findByIdIn(List<Long> ids);
}
