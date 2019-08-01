package cn.kcyf.bsc.modular.business.service;


import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.orm.jpa.service.BasicService;

public interface WorkRecordService extends BasicService<WorkRecord, Long> {
    void audit(Long workRecordId, boolean flag, String suggestions);
}
