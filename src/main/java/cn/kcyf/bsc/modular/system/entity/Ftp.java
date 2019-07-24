package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * <p>
 * FTP配置
 * </p>
 *
 * @author Tom
 * @since 2019-06-27
 */
//@Data
//@ToString
//@EqualsAndHashCode(of = "id")
//@NoArgsConstructor
//@Entity
//@Table(name = "sys_ftp")
//@ApiModel(value="Ftp对象", description="FTP配置")
public class Ftp extends TableDomain {
    @ApiModelProperty(value = "名称")
    @Column(name = "FTP_NAME")
    private String ftpName;

    @ApiModelProperty(value = "IP")
    @Column(name = "IP")
    private String ip;

    @ApiModelProperty(value = "端口号")
    @Column(name = "PORT")
    private Integer port;

    @ApiModelProperty(value = "登录名")
    @Column(name = "USERNAME")
    private String username;

    @ApiModelProperty(value = "登陆密码")
    @Column(name = "PASSWORD")
    private String password;

    @ApiModelProperty(value = "编码")
    @Column(name = "ENCODING")
    private String encoding;

    @ApiModelProperty(value = "超时时间")
    @Column(name = "TIMEOUT")
    private Integer timeout;

    @ApiModelProperty(value = "路径")
    @Column(name = "FTP_PATH")
    private String ftpPath;

    @ApiModelProperty(value = "访问URL")
    @Column(name = "URL")
    private String url;


}
