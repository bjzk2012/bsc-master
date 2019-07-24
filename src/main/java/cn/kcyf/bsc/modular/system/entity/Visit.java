package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;


/**
 * <p>
 * 访问记录表
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
//@Table(name = "sys_visit")
public class Visit extends TableDomain {
    /**
     * ip地址
     */
    @Column(name = "IP")
    private String ip;
    /**
     * 访问的资源
     */
    @Column(name = "URI")
    private String uri;
    /**
     * 国家
     */
    @Column(name = "COUNTRY")
    private String country;
    /**
     * 省
     */
    @Column(name = "REGION")
    private String region;
    /**
     * 市
     */
    @Column(name = "CITY")
    private String city;
    /**
     * 运营商
     */
    @Column(name = "ISP")
    private String isp;
    /**
     * 访问时间
     */
    @Column(name = "SEND_TIME")
    private Date sendTime;
    /**
     * 当前用户
     */
    @Column(name = "LOGIN_ID")
    private Long loginId;
    /**
     * 当前用户名
     */
    @Column(name = "LOGIN_NAME")
    private String loginName;
}
