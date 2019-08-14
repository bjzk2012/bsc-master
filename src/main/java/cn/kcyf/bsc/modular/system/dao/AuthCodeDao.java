package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.AuthCode;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthCodeDao extends BasicDao<AuthCode, Long> {
}
