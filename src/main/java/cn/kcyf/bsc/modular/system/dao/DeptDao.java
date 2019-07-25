package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.Dept;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface DeptDao extends BasicDao<Dept, Long> {

}
