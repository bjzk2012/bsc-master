package cn.kcyf.bsc.modular.business.dao;

import cn.kcyf.bsc.modular.business.entity.QuestionRecord;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRecordDao extends BasicDao<QuestionRecord, Long> {
}
