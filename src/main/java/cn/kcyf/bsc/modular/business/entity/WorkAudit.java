package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_work_audit")
@ApiModel("日工作记录流程信息")
public class WorkAudit extends TableDomain {
    @Column(name = "work_record_id")
    private Long workRecordId;
    @Column(name = "suggestions")
    private String suggestions;
}
