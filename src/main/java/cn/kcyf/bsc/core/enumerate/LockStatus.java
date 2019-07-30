package cn.kcyf.bsc.core.enumerate;

public enum LockStatus {
    UNLOCK("解锁"),
    LOCK("冻结");

    private String message;

    LockStatus(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
