package cn.kcyf.bsc.modular.system.service.impl;

import cn.kcyf.bsc.modular.system.dao.DeptDao;
import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.bsc.modular.system.service.DeptService;
import cn.kcyf.orm.jpa.dao.BasicDao;
import cn.kcyf.orm.jpa.service.AbstractBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Service
public class DeptServiceImpl extends AbstractBasicService<Dept, Long> implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public BasicDao<Dept, Long> getRepository() {
        return deptDao;
    }

    @Override
    @Transactional
    public void delete(Long id) {
        List<Long> childIds = new ArrayList<Long>();
        getChildId(id, childIds);
        deletes(childIds);
    }

    private void getChildId(Long id, List<Long> childIds){
        childIds.add(id);
        List<BigInteger> temp = deptDao.getChildIdById(id);
        if (temp != null) {
            for (BigInteger childId : temp){
                getChildId(Long.valueOf(childId.toString()), childIds);
            }
        }
    }

    @Transactional(readOnly = true)
    public String getParentName(Long id) {
        return deptDao.getParentName(id);
    }
}
