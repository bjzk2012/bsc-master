package cn.kcyf.bsc.modular.business.dao;

import cn.kcyf.bsc.modular.business.entity.WorkAudit;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkAuditDao extends BasicDao<WorkAudit, Long> {
}
