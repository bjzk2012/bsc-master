package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.OperationLogDao;
import cn.kcyf.bsc.modular.system.entity.OperationLog;
import cn.kcyf.bsc.modular.system.service.OperationLogService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OperationLogServiceImpl extends AbstractBasicService<OperationLog, Long> implements OperationLogService {
    @Autowired
    private OperationLogDao operationLogDao;
    public BasicDao<OperationLog, Long> getRepository() {
        return operationLogDao;
    }
}
