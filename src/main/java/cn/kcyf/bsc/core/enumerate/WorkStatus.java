package cn.kcyf.bsc.core.enumerate;

public enum WorkStatus {
    DRAFT("草稿", "保存"),
    SUBMIT("已提交", "提交"),
    FINISH("已完成", "通过"),
    REFUSE("已退回", "拒绝");
    WorkStatus(String message, String action){
        this.message = message;
        this.action = action;
    }
    private String message;
    private String action;

    public String getMessage() {
        return message;
    }

    public String getAction() {
        return action;
    }
}
