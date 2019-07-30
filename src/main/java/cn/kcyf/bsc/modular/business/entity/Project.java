package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.bsc.core.enumerate.Status;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.Column;

public class Project {
    /**
     * 项目编码
     */
    @Column(name = "code")
    private String code;
    /**
     * 项目名称
     */
    @Column(name = "name")
    private String name;
    /**
     * 时间
     */
    @Column(name = "time")
    private Integer time;
    /**
     * 项目描述
     */
    @Column(name = "description")
    private String description;
    /**
     * 项目状态
     */
    @Column(name = "status")
    private Status status;
}
