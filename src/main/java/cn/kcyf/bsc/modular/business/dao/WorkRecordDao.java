package cn.kcyf.bsc.modular.business.dao;

import cn.kcyf.bsc.modular.business.entity.WorkRecord;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkRecordDao extends BasicDao<WorkRecord, Long> {
}
