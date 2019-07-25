package cn.kcyf.bsc.core.beetl;

import org.beetl.ext.spring.BeetlGroupUtilConfiguration;

import java.util.HashMap;
import java.util.Map;

/**
 * beetl拓展配置,绑定一些工具类,方便在模板中直接调用
 *
 * @author Tom
 */
public class BeetlSupport extends BeetlGroupUtilConfiguration {

    @Override
    public void initOther() {

        //全局共享变量
        Map<String, Object> shared = new HashMap<String, Object>();
        shared.put("systemName", "后台管理系统");
        shared.put("welcomeTip", "欢迎使用后台管理系统!");
        groupTemplate.setSharedVars(shared);

        //全局共享方法
        groupTemplate.registerFunctionPackage("shiro", new ShiroSupport());
        groupTemplate.registerFunctionPackage("tool", new ToolsSupport());
    }
}
