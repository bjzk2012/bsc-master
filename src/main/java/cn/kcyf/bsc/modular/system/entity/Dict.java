package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 字典表
 *
 * @author Tom
 */
@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_dict")
public class Dict extends TableDomain {
    /**
     * 字典名称
     */
    @Column(name = "name")
    @NotBlank(message = "字典名称不能为空")
    private String name;
    /**
     * 字典的编码
     */
    @NotBlank(message = "字典编码不能为空")
    @Column(name = "code")
    private String code;
    /**
     * 字典描述
     */
    @Column(name = "description")
    private String description;
    /**
     * 排序
     */
    @Column(name = "sort")
    private Integer sort;

    /**
     * 父ID
     */
    public Long getPId() {
        if (null != parent) {
            return parent.getId();
        }
        return null;
    }

    /**
     * 子集
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    @JSONField(serialize = false, deserialize = false)
    private Dict parent;

    @OneToMany(mappedBy = "parent", fetch = FetchType.LAZY)
    @JSONField(serialize = false, deserialize = false)
    private Set<Dict> dicts;

    public String getDetail() {
        if (dicts != null && !dicts.isEmpty()) {
            JSONArray childs = new JSONArray();
            for (Dict dict : dicts) {
                JSONObject object = new JSONObject();
                object.put("code", dict.getCode());
                object.put("name", dict.getName());
//                object.put("description", dict.getDescription());
                childs.add(object);
            }
            return childs.toJSONString();
        }
        return "";
    }

    public Boolean getOpen() {
        return true;
    }
}
