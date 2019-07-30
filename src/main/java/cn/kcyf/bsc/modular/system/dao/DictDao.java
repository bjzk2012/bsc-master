package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.Dict;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

@Repository
public interface DictDao extends BasicDao<Dict, Long> {
    @Query(value = "select id from sys_dict where parent_id = :id", nativeQuery = true)
    List<BigInteger> getChildIdById(@Param(value = "id") Long id);
}
