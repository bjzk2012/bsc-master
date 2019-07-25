package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.DeptDao;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptServiceImpl extends AbstractBasicService<Dept, Long> implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public BasicDao<Dept, Long> getRepository() {
        return deptDao;
    }

}
