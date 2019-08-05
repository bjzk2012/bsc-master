package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BasicDao<User, Long> {
    User findFirstByAccount(@Param("account") String account);
}
