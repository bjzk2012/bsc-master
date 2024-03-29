package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.modular.business.dao.WorkAuditDao;
import cn.kcyf.bsc.modular.business.entity.WorkAudit;
import cn.kcyf.bsc.modular.business.service.WorkAuditService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkAuditServiceImpl extends AbstractBasicService<WorkAudit, Long> implements WorkAuditService {
    @Autowired
    private WorkAuditDao workAuditDao;
    public BasicDao<WorkAudit, Long> getRepository() {
        return workAuditDao;
    }
}
