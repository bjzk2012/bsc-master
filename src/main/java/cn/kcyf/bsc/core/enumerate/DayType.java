package cn.kcyf.bsc.core.enumerate;

public enum DayType {
    WORKDAY("工作日"),
    HOLIDAY("节假日"),
    ADJUSTDAY("调休日"),
    PLAYDAY("休息日");

    DayType(String message) {
        this.message = message;
    }

    private String message;

    public String getMessage() {
        return message;
    }

    public static DayType valueOfOrdinal(int ordinal) {
        if (ordinal < 0 || ordinal > values().length) {
            return null;
        }
        return values()[ordinal];
    }
}
