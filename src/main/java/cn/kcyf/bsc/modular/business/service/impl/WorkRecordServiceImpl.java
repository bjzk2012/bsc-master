package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.bsc.modular.business.dao.ProjectDao;
import cn.kcyf.bsc.modular.business.dao.WorkAuditDao;
import cn.kcyf.bsc.modular.business.dao.WorkDao;
import cn.kcyf.bsc.modular.business.dao.WorkRecordDao;
import cn.kcyf.bsc.modular.business.entity.Project;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.entity.WorkAudit;
import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.bsc.modular.business.service.WorkRecordService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import cn.kcyf.security.domain.ShiroUser;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class WorkRecordServiceImpl extends AbstractBasicService<WorkRecord, Long> implements WorkRecordService {
    @Autowired
    private WorkDao workDao;
    @Autowired
    private WorkRecordDao workRecordDao;
    @Autowired
    private WorkAuditDao workAuditDao;
    @Autowired
    private ProjectDao projectDao;

    public BasicDao<WorkRecord, Long> getRepository() {
        return workRecordDao;
    }

    @Transactional
    public void audit(Long workRecordId, boolean flag, String suggestions) {
        WorkStatus status = flag ? WorkStatus.FINISH : WorkStatus.REFUSE;
        WorkRecord dbWorkRecord = workRecordDao.getOne(workRecordId);
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject();
        dbWorkRecord.setLastUpdateTime(new Date());
        dbWorkRecord.setLastUpdateUserId(shiroUser.getId());
        dbWorkRecord.setLastUpdateUserName(shiroUser.getUsername());
        dbWorkRecord.setLastAuditTime(new Date());
        dbWorkRecord.setLastAuditUserId(shiroUser.getId());
        dbWorkRecord.setLastAuditUserName(shiroUser.getUsername());
        dbWorkRecord.setStatus(status);
        update(dbWorkRecord);
        Work dbwork = workDao.getOne(dbWorkRecord.getWorkId());
        WorkAudit audit = new WorkAudit();
        audit.setId(null);
        audit.setCreateTime(new Date());
        audit.setCreateUserId(shiroUser.getId());
        audit.setCreateUserName(shiroUser.getUsername());
        audit.setStatus(status);
        audit.setWorkRecordId(dbWorkRecord.getId());
        audit.setRemark(String.format("用户【%s】%s用户【%s】的【%s】日工作日志【%s】审核", shiroUser.getUsername(), status.getAction(), dbwork.getCreateUserName(), dbwork.getTodayRemark(), dbWorkRecord.getContent()));
        audit.setSuggestions(suggestions);
        workAuditDao.save(audit);
        Project dbproject = projectDao.getOne(dbWorkRecord.getProjectId());
        dbproject.setTime(dbproject.getTime() + dbWorkRecord.getTime());
        dbproject.setLastUpdateTime(new Date());
        dbproject.setLastUpdateUserId(shiroUser.getId());
        dbproject.setLastUpdateUserName(shiroUser.getUsername());
        projectDao.save(dbproject);

    }
}
