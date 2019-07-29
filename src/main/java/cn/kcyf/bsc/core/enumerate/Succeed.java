package cn.kcyf.bsc.core.enumerate;

/**
 * 业务是否成功
 *
 * @author Tom
 */
public enum Succeed {

    SUCCESS("成功"),
    FAIL("失败");

    String message;

    Succeed(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
