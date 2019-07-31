package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;

@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_work_record")
@ApiModel("日工作记录")
public class WorkRecord extends TableDomain {
    @Column(name = "work_id")
    private Long workId;
    /**
     * 项目
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id")
    private Project project;
    /**
     * 工作时间
     */
    @Column(name = "time")
    private Integer time;
    /**
     * 工作内容
     */
    @Column(name = "content")
    private String content;
    /**
     * 工作日志审核流程信息
     */
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "work_record_id")
    private Set<WorkAudit> audits;
    /**
     * 状态
     */
    @Column(name = "status")
    @Enumerated
    private WorkStatus status;
}
