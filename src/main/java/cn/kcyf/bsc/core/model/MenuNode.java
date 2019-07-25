package cn.kcyf.bsc.core.model;

import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.bsc.modular.system.enumerate.YesOrNo;
import lombok.Data;

import java.util.List;

@Data
public class MenuNode {
    /**
     * 编号
     */
    private Long id;
    /**
     * 菜单编号
     */
    private String code;
    /**
     * 菜单父编号
     */
    private Long parentId;
    /**
     * 菜单父编号
     */
    private String pcode;
    /**
     * 当前菜单的所有父菜单编号
     */
    private String pcodes;
    /**
     * 菜单名称
     */
    private String name;
    /**
     * 菜单图标
     */
    private String icon;
    /**
     * url地址
     */
    private String url;
    /**
     * 菜单排序号
     */
    private Integer sort;
    /**
     * 菜单层级
     */
    private Integer levels;
    /**
     * 是否是菜单
     */
    private YesOrNo menuFlag;
    /**
     * 备注
     */
    private String description;
    /**
     * 菜单状态
     */
    private Status status;
    /**
     * 是否打开新页面的标识
     */
    private YesOrNo newPageFlag;
    /**
     * 是否打开
     */
    private YesOrNo openFlag;
    /**
     * 子节点
     */
    private List<MenuNode> children;
}
