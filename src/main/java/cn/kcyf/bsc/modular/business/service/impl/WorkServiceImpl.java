package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.bsc.modular.business.dao.WorkAuditDao;
import cn.kcyf.bsc.modular.business.dao.WorkDao;
import cn.kcyf.bsc.modular.business.dao.WorkRecordDao;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.entity.WorkAudit;
import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.bsc.modular.business.service.WorkService;
import cn.kcyf.bsc.modular.system.dao.UserDao;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import cn.kcyf.security.domain.ShiroUser;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Set;

@Service
public class WorkServiceImpl extends AbstractBasicService<Work, Long> implements WorkService {
    @Autowired
    private WorkDao workDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private WorkRecordDao workRecordDao;
    @Autowired
    private WorkAuditDao workAuditDao;
    public BasicDao<Work, Long> getRepository() {
        return workDao;
    }

    @Transactional
    public void submit(Long workId) {
        Work dbwork = workDao.getOne(workId);
        Set<WorkRecord> records = dbwork.getRecords();
        if (records == null || records.isEmpty()) {
            throw new RuntimeException("工单未填写，无法提交！");
        }
        int time = 0;
        for (WorkRecord record : records) {
            time += record.getTime();
        }
        if (time != 7){
            throw new RuntimeException("工单总工时必须为7小时，无法提交！");
        }
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        for (WorkRecord record : records) {
            if (record.getStatus().equals(WorkStatus.SUBMIT) || record.getStatus().equals(WorkStatus.FINISH)){
                continue;
            }
            if (record.getStatus().equals(WorkStatus.REFUSE)){
                throw new RuntimeException("本次提交存在已拒绝的工单，请修改工单后再提交！");
            }
            record.setLastUpdateTime(new Date());
            record.setLastUpdateUserId(shiroUser.getId());
            record.setLastUpdateUserName(shiroUser.getUsername());
            record.setSubmitUserName(userDao.getOne(shiroUser.getId()).getName());
            record.setSubmitTime(new Date());
            record.setStatus(WorkStatus.SUBMIT);
            workRecordDao.save(record);
            WorkAudit audit = new WorkAudit();
            audit.setId(null);
            audit.setCreateTime(new Date());
            audit.setCreateUserId(shiroUser.getId());
            audit.setCreateUserName(shiroUser.getUsername());
            audit.setStatus(WorkStatus.SUBMIT);
            audit.setWorkRecordId(record.getId());
            audit.setRemark(String.format("用户【%s】提交【%s】日工作日志【%s】", shiroUser.getUsername(), dbwork.getTodayRemark(), record.getContent()));
            workAuditDao.save(audit);
        }
    }
}
