layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;

    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    //获取数据源信息
    var ajax = new $ax(Feng.ctxPath + "/datasource/view/" + Feng.getUrlParam("id"));
    ajax.type = 'get';
    var result = ajax.start();
    console.log(result)
    form.val('datasourceForm', result);


    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/datasource/edit", function (data) {
            Feng.success("修改成功！");

            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);

            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("修改成功！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();
    });
});