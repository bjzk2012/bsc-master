package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.bsc.modular.system.enumerate.OssType;
import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.Column;

/**
 * <p>
 * oss云存储配置
 * </p>
 *
 * @author Tom
 * @since 2019-06-26
 */
//@Data
//@ToString
//@EqualsAndHashCode(of = "id")
//@NoArgsConstructor
//@Entity
//@Table(name = "sys_oss")
//@ApiModel(value="Oss对象", description="oss云存储配置")
public class Oss extends TableDomain {
    @ApiModelProperty(value = "appId")
    @Column(name = "APP_ID")
    private String appId;

    @ApiModelProperty(value = "secretId")
    @Column(name = "SECRET_ID")
    private String secretId;

    @ApiModelProperty(value = "secretKey")
    @Column(name = "APP_KEY")
    private String appKey;

    @ApiModelProperty(value = "bucket名")
    @Column(name = "BUCKET_NAME")
    private String bucketName;

    @ApiModelProperty(value = "地区码")
    @Column(name = "BUCKET_AREA")
    private String bucketArea;

    @ApiModelProperty(value = "存储类型")
    @Column(name = "OSS_TYPE")
    private String ossType;

    @ApiModelProperty(value = "end_point")
    @Column(name = "END_POINT")
    private String endPoint;

    @ApiModelProperty(value = "访问域名")
    @Column(name = "ACCESS_DOMAIN")
    private String accessDomain;

    @ApiModelProperty(value = "名称")
    @Column(name = "OSS_NAME")
    private String ossName;

    public String getOssTypeName(){
        OssType type = OssType.valueOf(this.ossType);
        if (type == null){
            return "--";
        }
        return type.getName();
    }

}
