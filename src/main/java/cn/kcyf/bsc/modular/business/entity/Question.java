package cn.kcyf.bsc.modular.business.entity;

import cn.kcyf.bsc.core.enumerate.QuestionCategory;
import cn.kcyf.bsc.core.enumerate.QuestionStatus;
import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Data
@ToString
@NoArgsConstructor
@Entity
@Table(name = "sys_question")
@ApiModel("问题")
public class Question extends TableDomain {
    /**
     * 编码
     */
    private String code;
    /**
     * 问题标题
     */
    private String title;
    /**
     * 项目
     */
    private Project project;
    /**
     * 描述
     */
    private String description;
    /**
     * 发生时间
     */
    private Date time;
    /**
     * 联系手机号
     */
    private String phone;
    /**
     * 问题状态
     */
    private QuestionStatus status;
    /**
     * 问题类型
     */
    private QuestionCategory category;
    /**
     * 发起人
     */
    private String sponsor;
    /**
     * IP地址
     */
    private String ip;
    /**
     * 浏览器版本
     */
    private String browse;
}
