package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.DeptDao;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class DeptServiceImpl extends AbstractBasicService<Dept, Long> implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public JpaRepository<Dept, Long> getRepository() {
        return deptDao;
    }

}
