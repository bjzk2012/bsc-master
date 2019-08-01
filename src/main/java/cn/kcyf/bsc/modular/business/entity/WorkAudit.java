package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.Table;

@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_work_audit")
@ApiModel("日工作记录流程信息")
public class WorkAudit extends TableDomain {
    /**
     * 记录编号
     */
    @Column(name = "work_record_id")
    private Long workRecordId;
    /**
     * 状态
     */
    @Column(name = "status")
    @Enumerated
    private WorkStatus status;
    /**
     * 备注
     */
    @Column(name = "remark")
    private String remark;
    /**
     * 审核意见
     */
    @Column(name = "suggestions")
    private String suggestions;
}
