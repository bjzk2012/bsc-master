package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.core.enumerate.LockStatus;
import cn.kcyf.bsc.core.enumerate.Sex;
import cn.kcyf.orm.jpa.entity.TableDomain;
import com.alibaba.fastjson.annotation.JSONField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.apache.commons.lang.StringUtils;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;


/**
 * 管理员表
 *
 * @author Tom
 */
@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_user")
@ApiModel("管理员")
public class User extends TableDomain {
    /**
     * 头像
     */
    @Column(name = "avatar")
    @ApiModelProperty(name = "avatar", value = "头像")
    private String avatar;
    /**
     * 账号
     */
    @Column(name = "account", unique = true, nullable = false)
    @NotBlank(message = "用户账号不能为空")
    @Size(min = 5, max = 36, message = "用户账号必须5到36位")
    @Pattern(regexp = "\\w+", message = "用户账号只能是单词字符（字母，数字，下划线，中横线）")
    private String account;
    /**
     * 密码
     */
    @Column(name = "password")
    @JSONField(serialize = false)
    private String password;
    /**
     * md5密码盐
     */
    @Column(name = "salt")
    @JSONField(serialize = false, deserialize = false)
    private String salt;
    /**
     * 名字
     */
    @Column(name = "name")
    private String name;
    /**
     * 生日
     */
    @Column(name = "birthday")
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date birthday;
    /**
     * 性别
     */
    @Column(name = "sex")
    @Enumerated
    private Sex sex;
    public String getSexName(){
        if (this.sex != null){
            return this.sex.getRemark();
        }
        return "--";
    }
    /**
     * 电子邮件
     */
    @Column(name = "email")
    @Email(message = "电子邮件格式不正确")
    private String email;
    /**
     * 电话
     */
    @Column(name = "phone")
    @Pattern(regexp = "(^\\.{0}$)|(^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$)|(^0?[1][358][0-9]{9}$)", message = "电话必须是固定电话或手机号码")
    private String phone;
    /**
     *
     */
    @Column(name = "address")
    private String address;
    /**
     * 角色
     */
    @ManyToMany(targetEntity = Role.class)
    @JoinTable(name="sys_user_roles",
            joinColumns={@JoinColumn(name="user_id",referencedColumnName="id")},
            inverseJoinColumns={@JoinColumn(name="roles_id",referencedColumnName="id")}
    )
    @JSONField(serialize = false, deserialize = false)
    private Set<Role> roles;
    public String getRoleId(){
        if (this.roles != null){
            List<Long> roleIds = new ArrayList<Long>();
            for (Role role : this.roles){
                roleIds.add(role.getId());
            }
            return StringUtils.join(roleIds, ",");
        }
        return "";
    }
    public String getRoleName(){
        if (this.roles != null){
            List<String> roleNames = new ArrayList<String>();
            for (Role role : this.roles){
                roleNames.add(role.getName());
            }
            return StringUtils.join(roleNames, ",");
        }
        return "";
    }
    /**
     * 部门
     */
    @ManyToOne
    @JoinColumn(name = "dept_id")
    @JSONField(serialize = false, deserialize = false)
    private Dept dept;
    public Long getDeptId(){
        if (this.dept != null){
            return this.dept.getId();
        }
        return null;
    }
    public String getDeptName(){
        if (this.dept != null){
            return this.dept.getFullName();
        }
        return "";
    }
    /**
     * 状态
     */
    @Column(name = "status")
    private LockStatus status;
    public String getStatusMessage(){
        if (this.status != null){
            return this.status.getMessage();
        }
        return "";
    }

}
