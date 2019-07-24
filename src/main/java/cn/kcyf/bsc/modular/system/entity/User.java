package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.modular.system.enumerate.Sex;
import cn.kcyf.bsc.modular.system.enumerate.Status;
import cn.kcyf.orm.jpa.entity.TableDomain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.Set;

/**
 * <p>
 * 管理员表
 * </p>
 *
 * @author Tom
 * @since 2018-12-07
 */
@Data
@ToString
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@Entity
@Table(name = "sys_user")
public class User extends TableDomain {
    /**
     * 头像
     */
    @Column(name = "avatar")
    private String avatar;
    /**
     * 账号
     */
    @Column(name = "account", unique = true, nullable = false)
    @NotBlank(message = "用户账号不能为空")
    @Size(min = 8, max = 36, message = "用户账号长度不正确")
    @Pattern(regexp = "\\w+", message = "用户账号只能是单词字符（字母，数字，下划线，中横线）")
    private String account;
    /**
     * 密码
     */
    @Column(name = "password")
    private String password;
    /**
     * md5密码盐
     */
    @Column(name = "salt")
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
    @Pattern(regexp = "/^[1][3,4,5,6,7,8,9][0-9]{9}$/", message = "手机号码格式不正确")
    private String phone;
    /**
     *
     */
    @Column(name = "address")
    private String address;
    /**
     * 角色
     */
    @JoinTable(name = "sys_user_role_relation",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id")}
    )
    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private Set<Role> roles;
    /**
     * 部门
     */
    @ManyToOne
    @JoinColumn(name = "dept_id")
    private Dept dept;
    /**
     * 状态
     */
    @Column(name = "status")
    private Status status;

}