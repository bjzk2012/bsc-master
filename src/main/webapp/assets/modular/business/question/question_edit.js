layui.use(['form', 'admin', 'laydate', 'layedit', 'ax'], function () {
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var laydate = layui.laydate;
    var layedit = layui.layedit;
    laydate.render({
        elem:'#time',
        type: 'datetime'
    });
    var layeditIndex = layedit.build('remark',{
        uploadImage: {
            url: '/system/upload'
        }
    });
    admin.iframeAuto();
    var ajax = new $ax(Feng.ctxPath + "/question/detail/" + Feng.getUrlParam("questionId"));
    ajax.type = "get";
    var result = ajax.start();
    form.val('questionForm',result.data);

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        data.field.remark = layedit.getContent(layeditIndex);
        var ajax = new $ax(Feng.ctxPath + "/question/edit", function (data) {
            Feng.success("编辑成功！");
            admin.putTempData('formOk', true);
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("编辑失败！" + data.message)
        });
        ajax.set(data.field);
        ajax.start();
        return false;
    });
});