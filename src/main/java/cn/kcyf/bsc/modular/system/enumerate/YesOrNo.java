package cn.kcyf.bsc.modular.system.enumerate;

public enum YesOrNo {
    YES(true, "是", 1),
    NO(false, "否", 0);

    private Boolean flag;
    private String desc;
    private Integer code;

    YesOrNo(Boolean flag, String desc, Integer code) {
        this.flag = flag;
        this.desc = desc;
        this.code = code;
    }

    public static String valueOf(Integer status) {
        if (status == null) {
            return "";
        } else {
            YesOrNo[] values = values();

            for (YesOrNo value : values) {
                if (value.getCode().equals(status)) {
                    return value.getDesc();
                }
            }

            return "";
        }
    }

    public Boolean getFlag() {
        return this.flag;
    }

    public String getDesc() {
        return this.desc;
    }

    public Integer getCode() {
        return this.code;
    }
}