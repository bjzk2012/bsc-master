package cn.kcyf.bsc.modular.business.service.impl;

import cn.kcyf.bsc.modular.business.dao.QuestionDao;
import cn.kcyf.bsc.modular.business.entity.Question;
import cn.kcyf.bsc.modular.business.service.QuestionService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl extends AbstractBasicService<Question, Long> implements QuestionService {
    @Autowired
    private QuestionDao questionDao;
    public BasicDao<Question, Long> getRepository() {
        return questionDao;
    }
}
