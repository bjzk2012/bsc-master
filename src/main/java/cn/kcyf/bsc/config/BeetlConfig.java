
package cn.kcyf.bsc.config;

import cn.kcyf.bsc.config.properties.BeetlProperties;
import cn.kcyf.bsc.core.beetl.BeetlSupport;
import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * web 配置类
 *
 * @author Tom
 */
@Configuration
public class BeetlConfig {

    @Autowired
    BeetlProperties beetlProperties;
    @Autowired
    BeetlSupport beetlSupport;

    /**
     * beetl的配置
     */
    @Bean(initMethod = "init")
    public BeetlSupport beetlConfiguration() {
        beetlSupport.setResourceLoader(new ClasspathResourceLoader(BeetlConfig.class.getClassLoader(), beetlProperties.getPrefix()));
        beetlSupport.setConfigProperties(beetlProperties.getProperties());
        return beetlSupport;
    }

    /**
     * beetl的视图解析器
     */
    @Bean
    public BeetlSpringViewResolver beetlViewResolver() {
        BeetlSpringViewResolver beetlSpringViewResolver = new BeetlSpringViewResolver();
        beetlSpringViewResolver.setConfig(beetlConfiguration());
        beetlSpringViewResolver.setContentType("text/html;charset=UTF-8");
        beetlSpringViewResolver.setOrder(0);
        return beetlSpringViewResolver;
    }
}
