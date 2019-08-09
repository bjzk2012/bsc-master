layui.use(['form', 'admin', 'ax'], function () {
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    admin.iframeAuto();

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/question/solve", function (data) {
            Feng.success("解决成功！");
            admin.putTempData('formOk', true);
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("解决失败！" + data.message)
        });
        ajax.set(data.field);
        ajax.start();
        return false;
    });
});