package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.orm.jpa.entity.TableDomain;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.apache.commons.lang.StringUtils;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


/**
 * <p>
 * 角色表
 * </p>
 *
 * @author Tom
 */
@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_role")
public class Role extends TableDomain {
    /**
     * 角色名称
     */
    @NotBlank(message = "角色名称不能为空")
    @Column(name = "name")
    private String name;
    /**
     * 提示
     */
    @Column(name = "description")
    private String description;
    /**
     * 序号
     */
    @Column(name = "sort")
    private Integer sort;
    /**
     * 状态
     */
    @Column(name = "status")
    private Status status;
    /**
     * 角色权限关联表
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JSONField(serialize = false, deserialize = false)
    private Set<Menu> menus;
    public String getMenuId(){
        if (menus != null && !menus.isEmpty()){
            List<Long> menuIds = new ArrayList<Long>();
            for (Menu menu : this.menus){
                menuIds.add(menu.getId());
            }
            return StringUtils.join(menuIds, ",");
        }
        return "";
    }

}
