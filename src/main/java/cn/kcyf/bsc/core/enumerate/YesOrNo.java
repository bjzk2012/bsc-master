package cn.kcyf.bsc.core.enumerate;

public enum YesOrNo {
    YES("是"),
    NO("否");

    private String message;

    YesOrNo(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}