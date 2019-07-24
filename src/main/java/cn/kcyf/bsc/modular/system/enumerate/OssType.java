package cn.kcyf.bsc.modular.system.enumerate;

public enum OssType {
    ALIYUN("阿里云" ), TENCENT("腾讯云" ), QINIU("七牛云" );

    private String name;

    OssType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
