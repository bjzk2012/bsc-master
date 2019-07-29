package cn.kcyf.bsc.core.model;

import cn.kcyf.bsc.modular.system.entity.Dict;
import lombok.Data;

import java.util.List;

@Data
public class DictNode {
    private Long id;
    /**
     * 父部门
     */
    private Long parentId;
    public Long getPId(){
        return parentId;
    }
    public Boolean getOpen(){
        return true;
    }
    /**
     * 名称
     */
    private String name;
    /**
     * 子节点
     */
    private List<Dict> children;
}
