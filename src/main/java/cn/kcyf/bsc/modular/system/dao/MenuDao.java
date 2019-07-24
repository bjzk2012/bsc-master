package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao extends JpaRepository<Menu, Long> {
}
