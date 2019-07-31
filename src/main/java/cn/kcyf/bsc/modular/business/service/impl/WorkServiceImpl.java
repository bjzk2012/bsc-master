package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.modular.business.dao.WorkDao;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.service.WorkService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkServiceImpl extends AbstractBasicService<Work, Long> implements WorkService {
    @Autowired
    private WorkDao workDao;
    public BasicDao<Work, Long> getRepository() {
        return workDao;
    }
}
