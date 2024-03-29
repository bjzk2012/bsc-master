package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.core.model.DeptNode;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.orm.jpa.service.BasicService;

import java.util.List;

public interface DeptService extends BasicService<Dept, Long> {
    String getParentName(Long id);
    List<DeptNode> tree();
}
