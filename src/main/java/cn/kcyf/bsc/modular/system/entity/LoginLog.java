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
 * 登录记录
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
//@Table(name = "sys_login_log")
public class LoginLog extends TableDomain {
    /**
     * 日志名称
     */
    @Column(name = "LOG_NAME")
    private String logName;
    /**
     * 管理员id
     */
    @Column(name = "USER_ID")
    private Long userId;
    /**
     * 是否执行成功
     */
    @Column(name = "SUCCEED")
    private String succeed;
    /**
     * 具体消息
     */
    @Column(name = "MESSAGE")
    private String message;
    /**
     * 登录ip
     */
    @Column(name = "IP_ADDRESS")
    private String ipAddress;

}
