package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.DictDao;
import cn.kcyf.bsc.modular.system.entity.Dict;
import cn.kcyf.bsc.modular.system.service.DictService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictServiceImpl extends AbstractBasicService<Dict, Long> implements DictService {
    @Autowired
    private DictDao dictDao;
    public BasicDao<Dict, Long> getRepository() {
        return dictDao;
    }
}
