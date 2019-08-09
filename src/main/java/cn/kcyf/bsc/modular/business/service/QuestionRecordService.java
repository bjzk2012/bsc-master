package cn.kcyf.bsc.modular.business.service;

import cn.kcyf.bsc.core.enumerate.QuestionRecordType;
import cn.kcyf.bsc.modular.business.entity.QuestionRecord;
import cn.kcyf.orm.jpa.service.BasicService;

public interface QuestionRecordService extends BasicService<QuestionRecord, Long> {
    void create(Long questionId, QuestionRecordType type, String description);
}
