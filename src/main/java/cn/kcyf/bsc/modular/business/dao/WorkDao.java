package cn.kcyf.bsc.modular.business.dao;

import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkDao extends BasicDao<Work, Long> {
}
