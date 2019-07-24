package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author Tom
 */
@Data
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@Entity
@Table(name = "sys_dept")
public class Dept extends TableDomain {
    /**
     * 父部门
     */
    @ManyToOne
    @JoinColumn(name = "p_id")
    private Dept parent;
    /**
     * 父级ids
     */
    @Column(name = "p_ids")
    private String pids;
    /**
     * 简称
     */
    @Column(name = "simple_name")
    private String simpleName;
    /**
     * 全称
     */
    @Column(name = "full_name")
    private String fullName;
    /**
     * 描述
     */
    @Column(name = "description")
    private String description;
    /**
     * 排序
     */
    @Column(name = "sort")
    private Integer sort;
}
