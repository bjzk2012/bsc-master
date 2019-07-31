package cn.kcyf.bsc.core.enumerate;

public enum WorkStatus {
    DRAFT("草稿"),
    SUBMIT("已提交"),
    FINISH("已完成"),
    REFUSE("已退回");
    WorkStatus(String message){
        this.message = message;
    }
    private String message;

    public String getMessage() {
        return message;
    }
}
