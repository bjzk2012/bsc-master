layui.use(['form', 'admin', 'ax', 'jquery'], function () {
    var form = layui.form;
    var admin = layui.admin;
    var $ax = layui.ax;
    var $ = layui.jquery;
    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    // 添加表单验证方法
    form.verify({
        simpleName: [/^.{2,20}$/, '简称长度必须为2到20位'],
        fullName: [/^.{2,255}$/, '全称长度必须为2到255位']
    });

    // 排序选择框只能输入数字
    $('#sort').keyup(function(){
        var v = $(this).val();
        if (/^\\d+$/.test(v)) {
            v = '';
        }
        $(this).val('');
        $(this).val(v);
    }).change(function(){
        var v = $(this).val();
        $(this).val('');
        $(this).val(v);
    });

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/dept/add", function (data) {
            Feng.success("添加成功！");

            //传给上个页面，刷新table用
            admin.putTempData('formOk', true);

            //关掉对话框
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("添加失败！" + data.responseJSON.message)
        });
        ajax.set(data.field);
        ajax.start();
        return false;
    });
});