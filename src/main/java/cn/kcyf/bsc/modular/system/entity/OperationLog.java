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
 * 操作日志
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
//@Table(name = "sys_operation_log")
public class OperationLog extends TableDomain {
    /**
     * 日志类型(字典)
     */
    @Column(name = "LOG_TYPE")
    private String logType;
    /**
     * 日志名称
     */
    @Column(name = "LOG_NAME")
    private String logName;
    /**
     * 用户id
     */
    @Column(name = "USER_ID")
    private Long userId;
    /**
     * 类名称
     */
    @Column(name = "CLASS_NAME")
    private String className;
    /**
     * 方法名称
     */
    @Column(name = "METHOD")
    private String method;
    /**
     * 是否成功(字典)
     */
    @Column(name = "SUCCEED")
    private String succeed;
    /**
     * 备注
     */
    @Column(name = "MESSAGE")
    private String message;

}
