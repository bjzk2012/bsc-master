package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.bsc.core.enumerate.WorkStatus;
import cn.kcyf.commons.utils.DateUtils;
import cn.kcyf.orm.jpa.entity.TableDomain;
import com.alibaba.fastjson.annotation.JSONField;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_work")
@ApiModel("日工作记录")
public class Work extends TableDomain {
    /**
     * 工作日期
     */
    @Column(name = "today")
    @Temporal(value = TemporalType.DATE)
    private Date today;
    public String getTodayRemark(){
        return DateUtils.format(today, "yyyy-MM-dd");
    }
    /**
     * 工作日志
     */
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "work_id")
    @JSONField(serialize = false, deserialize = false)
    private Set<WorkRecord> records;
    public String getStatus(){
        if (records == null || records.isEmpty()){
            return WorkStatus.DRAFT.getMessage();
        }
        for (WorkRecord record : records){
            if (record.getStatus().equals(WorkStatus.REFUSE)){
                return WorkStatus.REFUSE.getMessage();
            }
        }
        return records.iterator().next().getStatus().getMessage();
    }
}
