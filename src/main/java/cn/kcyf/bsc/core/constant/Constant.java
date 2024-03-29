package cn.kcyf.bsc.core.constant;

public class Constant {
    /**
     * 默认密码
     */
    public final static String DEFAULT_PWD = "111111";

    /**
     * 默认图像
     */
    public final static String DEFAULT_HEAD= "/assets/common/images/head.png";

    /**
     * 默认验证码SESSION_KEY
     */
    public final static String KAPTCHA_SESSION_KEY = "KAPTCHA_SESSION_KEY";

    /**
     * 注册验证码SESSION_KEY
     */
    public final static String KAPTCHA_REGISTER_SESSION_KEY = "KAPTCHA_SESSION_KEY";

    /**
     * 问题反馈验证码SESSION_KEY
     */
    public final static String KAPTCHA_QUESTION_SESSION_KEY = "KAPTCHA_SESSION_KEY";

    public final static String SMS_QUESTION_FORMAT = "您本次操作验证码为：{0}，有效期为{1}分钟，请尽快验证。";
}
