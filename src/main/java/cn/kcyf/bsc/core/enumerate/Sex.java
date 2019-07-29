package cn.kcyf.bsc.core.enumerate;

public enum Sex {
    MAN("男"),
    WOMAN("女");

    Sex(String remark) {
        this.remark = remark;
    }

    private String remark;

    public String getRemark() {
        return remark;
    }
}