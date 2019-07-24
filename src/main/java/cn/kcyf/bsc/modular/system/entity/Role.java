package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;


/**
 * <p>
 * 角色表
 * </p>
 *
 * @author Tom
 * @since 2018-12-07
 */
@Data
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@Entity
@Table(name = "sys_role")
public class Role extends TableDomain {
    /**
     * 父角色id
     */
    @Column(name = "pid")
    private Long pid;
    /**
     * 角色名称
     */
    @Column(name = "name")
    private String name;
    /**
     * 提示
     */
    @Column(name = "description")
    private String description;
    /**
     * 序号
     */
    @Column(name = "sort")
    private Integer sort;
    /**
     * 状态
     */
    @Column(name = "status")
    private Status status;
    /**
     * 角色权限关联表
     */
    @JoinTable(name = "sys_role_menu_relation",
            joinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "menu_id", referencedColumnName = "id")}
    )
    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private Set<Menu> menus;

}
