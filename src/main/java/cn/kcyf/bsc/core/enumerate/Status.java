package cn.kcyf.bsc.core.enumerate;

public enum Status {
    ENABLE("ENABLE", "启用"),
    DISABLE("DISABLE", "禁用");

    private String code;
    private String message;

    Status(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
