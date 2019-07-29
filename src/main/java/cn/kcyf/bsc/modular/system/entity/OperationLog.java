package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.core.enumerate.LogType;
import cn.kcyf.bsc.core.enumerate.Succeed;
import cn.kcyf.orm.jpa.entity.IdDomain;
import cn.kcyf.orm.jpa.entity.TableDomain;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;

/**
 * 操作日志
 *
 * @author Tom
 */
@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_operation_log")
public class OperationLog extends IdDomain {
    /**
     * 日志类型(字典)
     */
    @Column(name = "log_type")
    @Enumerated
    private LogType logType;
    public String getLogTypeRemark(){
        if (logType != null){
            return logType.getMessage();
        }
        return "";
    }
    /**
     * 日志名称
     */
    @Column(name = "log_name")
    private String logName;
    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Long userId;
    /**
     * 用户id
     */
    @Column(name = "user_name")
    private String userName;
    /**
     * 类名称
     */
    @Column(name = "class_name")
    private String className;
    /**
     * 方法名称
     */
    @Column(name = "method")
    private String method;
    /**
     * 是否成功(字典)
     */
    @Column(name = "succeed")
    @Enumerated
    private Succeed succeed;
    public String getSucceedRemark(){
        if (succeed != null){
            return succeed.getMessage();
        }
        return "";
    }
    /**
     * 备注
     */
    @Column(name = "message")
    private String message;

    @Column(name = "create_time")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date createTime;

}
