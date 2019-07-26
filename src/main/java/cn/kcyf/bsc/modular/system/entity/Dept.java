package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author Tom
 */
@Data
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@Entity
@Table(name = "sys_dept")
public class Dept extends TableDomain {
    /**
     * 父部门
     */
    @Column(name = "parent_id")
    private Long parentId;

    @JSONField(name = "pId")
    public Long getPId() {
        if (parentId == null) {
            return 0L;
        }
        return parentId;
    }

    /**
     * 简称
     */
    @Column(name = "simple_name")
    @NotBlank(message = "简称不能为空")
    @Size(min = 2, max = 20, message = "简称长度必须为6到20位")
    private String simpleName;
    @JSONField(name = "name")
    public String getName() {
        return simpleName;
    }
    @JSONField(name = "open")
    public Boolean getOpen(){
        return true;
    }

    /**
     * 全称
     */
    @Column(name = "full_name")
    @NotBlank(message = "全称不能为空")
    @Size(min = 2, max = 255, message = "全称长度必须为6到20位")
    private String fullName;
    /**
     * 描述
     */
    @Column(name = "description")
    private String description;
    /**
     * 排序
     */
    @Column(name = "sort")
    private Integer sort;
}
