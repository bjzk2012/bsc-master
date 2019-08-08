package cn.kcyf.bsc.modular.business.dao;

import cn.kcyf.bsc.modular.business.entity.Key;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyDao extends BasicDao<Key, Long> {
}
