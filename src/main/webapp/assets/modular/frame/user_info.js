layui.use(['form', 'upload', 'element', 'ax', 'laydate'], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var upload = layui.upload;
    var element = layui.element;
    var $ax = layui.ax;
    var laydate = layui.laydate;

    //渲染时间选择框
    laydate.render({
        elem: '#birthday'
    });

    //表单提交事件
    form.on('submit(userInfoSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/center/user_info", function (data) {
            Feng.success("更新基本信息成功!");
            window.location.reload();
        }, function (data) {
            Feng.error("更新基本信息失败!" + data.responseJSON.message + "!");
        });
        ajax.set(data.field);
        ajax.start();
        return false;
    });

    upload.render({
        elem: '#imgHead',
        url: Feng.ctxPath + '/center/upload', // 上传接口
        done: function (res) {
            $("#imgHead img").attr("src", res.data.src);
            $("#avatar").val(res.data.src);
        },
        error: function () {
            Feng.error("上传失败!");
        }
    });
});