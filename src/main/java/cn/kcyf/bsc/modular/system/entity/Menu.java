package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.enumerate.YesOrNo;
import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Enumerated;
import javax.persistence.Table;

/**
 * <p>
 * 菜单表
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
@Table(name = "sys_menu")
public class Menu extends TableDomain {
    /**
     * 菜单编号
     */
    @Column(name = "code")
    private String code;
    /**
     * 菜单父编号
     */
    @Column(name = "pcode")
    private String pcode;
    /**
     * 当前菜单的所有父菜单编号
     */
    @Column(name = "pcodes")
    private String pcodes;
    /**
     * 菜单名称
     */
    @Column(name = "name")
    private String name;
    /**
     * 菜单图标
     */
    @Column(name = "icon")
    private String icon;
    /**
     * url地址
     */
    @Column(name = "url")
    private String url;
    /**
     * 菜单排序号
     */
    @Column(name = "sort")
    private Integer sort;
    /**
     * 菜单层级
     */
    @Column(name = "levels")
    private Integer levels;
    /**
     * 是否是菜单
     */
    @Column(name = "menu_flag")
    @Enumerated
    private YesOrNo menuFlag;
    /**
     * 备注
     */
    @Column(name = "description")
    private String description;
    /**
     * 菜单状态
     */
    @Column(name = "status")
    @Enumerated
    private Status status;
    /**
     * 是否打开新页面的标识
     */
    @Column(name = "new_page_flag")
    @Enumerated
    private YesOrNo newPageFlag;
    /**
     * 是否打开
     */
    @Column(name = "open_flag")
    @Enumerated
    private YesOrNo openFlag;

}
