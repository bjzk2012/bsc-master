package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.modular.business.dao.WorkRecordDao;
import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.bsc.modular.business.service.WorkRecordService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkRecordServiceImpl extends AbstractBasicService<WorkRecord, Long> implements WorkRecordService {
    @Autowired
    private WorkRecordDao workRecordDao;
    public BasicDao<WorkRecord, Long> getRepository() {
        return workRecordDao;
    }
}
