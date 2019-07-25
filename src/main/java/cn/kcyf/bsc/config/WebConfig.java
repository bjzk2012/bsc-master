package cn.kcyf.bsc.config;

import cn.kcyf.bsc.core.converter.StringToDateConverter;
import cn.kcyf.bsc.core.view.ErrorView;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.servlet.KaptchaServlet;
import com.google.code.kaptcha.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Configuration
public class WebConfig {

    @Bean
    public ServletRegistrationBean kaptcha(){
        ServletRegistrationBean registrationBean = new ServletRegistrationBean(new KaptchaServlet(),"/kaptcha");
        Map<String, String> params = new HashMap<String, String>();
        params.put("kaptcha.border", "no");
        params.put("kaptcha.border.color", "105,179,90");
        params.put("kaptcha.textproducer.font.color", "blue");
        params.put("kaptcha.image.width", "200");
        params.put("kaptcha.image.height", "75");
        params.put("kaptcha.textproducer.font.size", "60");
        params.put("kaptcha.session.key", "code");
        params.put("kaptcha.textproducer.char.length", "4");
        params.put("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");
        params.put("kaptcha.session.key", "KAPTCHA_SESSION_KEY");
        registrationBean.setInitParameters(params);
        return registrationBean;
    }

    /**
     * 默认错误页面，返回json
     */
    @Bean("error")
    public ErrorView error() {
        return new ErrorView();
    }

    @Autowired
    private RequestMappingHandlerAdapter handlerAdapter;

    /**
     * 增加字符串转日期的功能
     */

    @PostConstruct
    public void initEditableAvlidation() {

        ConfigurableWebBindingInitializer initializer = (ConfigurableWebBindingInitializer)handlerAdapter.getWebBindingInitializer();
        if(initializer.getConversionService()!=null) {
            GenericConversionService genericConversionService = (GenericConversionService)initializer.getConversionService();
            genericConversionService.addConverter(new StringToDateConverter());

        }

    }
}
