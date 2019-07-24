package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * <p>
 * 字典表
 * </p>
 *
 * @author Tom
 * @since 2018-12-07
 */
//@Data
//@ToString
//@EqualsAndHashCode(of = "id")
//@NoArgsConstructor
//@Entity
//@Table(name = "sys_dict")
public class Dict extends TableDomain {
    /**
     * 父级字典id
     */
    @Column(name = "PID")
    private Long pid;
    /**
     * 字典名称
     */
    @Column(name = "NAME")
    private String name;
    /**
     * 字典的编码
     */
    @Column(name = "CODE")
    private String code;
    /**
     * 字典描述
     */
    @Column(name = "DESCRIPTION")
    private String description;
    /**
     * 排序
     */
    @Column(name = "SORT")
    private Integer sort;
}
