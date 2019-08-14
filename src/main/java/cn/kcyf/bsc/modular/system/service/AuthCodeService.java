package cn.kcyf.bsc.modular.system.service;

import cn.kcyf.bsc.core.enumerate.AuthType;
import cn.kcyf.bsc.modular.system.entity.AuthCode;
import cn.kcyf.orm.jpa.service.BasicService;

public interface AuthCodeService extends BasicService<AuthCode, Long> {
    AuthCode send(String mobile, AuthType type, String memberName, String content);
    Boolean check(String mobile, AuthType type, String content);
}
