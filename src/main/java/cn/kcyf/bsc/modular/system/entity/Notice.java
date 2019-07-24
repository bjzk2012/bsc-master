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
 * 通知表
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
//@Table(name = "sys_notice")
public class Notice extends TableDomain {
    /**
     * 标题
     */
    @Column(name = "TITLE")
    private String title;
    /**
     * 内容
     */
    @Column(name = "CONTENT")
    private String content;

}
