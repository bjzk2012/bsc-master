layui.use(['layer', 'form', 'admin', 'ax', 'select'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var select = layui.select;

    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    //监听指定开关
    form.on('switch(switchTest)', function(data){
        $("#isStaticIndex").val(this.checked);
    });

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/site/update", function (data) {
            Feng.success("修改成功！");

            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);

            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("修改失败！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();
    });
});