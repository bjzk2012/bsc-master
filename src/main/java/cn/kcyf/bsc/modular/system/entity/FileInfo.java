package cn.kcyf.bsc.modular.system.entity;

import cn.kcyf.orm.jpa.entity.TableDomain;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 文件信息表
 *
 * @author Tom
 * @since 2019-06-27
 */
//@Data
//@ToString
//@NoArgsConstructor
//@Entity
//@Table(name = "sys_file_info")
//@ApiModel(value="FileInfo对象", description="文件信息表")
public class FileInfo extends TableDomain {
    @ApiModelProperty(value = "主键id")
    @Column(name = "FILE_ID")
    private String fileId;

    @ApiModelProperty(value = "base64编码的文件")
    @Column(name = "FILE_DATA")
    private String fileData;


}
