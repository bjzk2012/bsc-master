package cn.kcyf.bsc.modular.system.dao;

import cn.kcyf.bsc.modular.system.entity.Menu;
import cn.kcyf.orm.jpa.dao.BasicDao;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao extends BasicDao<Menu, Long> {
    @Query(value = "select m.* from sys_menu m left join sys_role_menus rm on rm.menus_id = m.id where m.menu_flag in (:menuFlag) and rm.role_id in (:roleIds)", nativeQuery = true)
    List<Menu> findByRoleIds( @Param("menuFlag") List<Integer> menuFlag, @Param("roleIds") List<Long> roleIds);
}
