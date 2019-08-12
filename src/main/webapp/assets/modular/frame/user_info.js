layui.use(['form', 'upload', 'element', 'ax', 'laydate', 'cropper', 'croppers'], function () {
    var $ = layui.jquery;
    var form = layui.form;
    var upload = layui.upload;
    var element = layui.element;
    var $ax = layui.ax;
    var laydate = layui.laydate;
    var croppers = layui.croppers;

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
            Feng.error("更新基本信息失败!" + data.message + "!");
        });
        ajax.set(data.field);
        ajax.start();
        return false;
    });

    // upload.render({
    //     elem: '#imgHead',
    //     url: Feng.ctxPath + '/system/upload', // 上传接口
    //     done: function (res) {
    //         $("#imgHead img").attr("src", res.data.src);
    //         $("#avatar").val(res.data.src);
    //         var ajax = new $ax(Feng.ctxPath + "/center/user_avatar", function (d) {
    //             Feng.success("修改图像成功!");
    //             window.location.reload();
    //         }, function (data) {
    //             Feng.error("修改图像失败!" + data.message + "!");
    //         });
    //         ajax.set({avatar:res.data.src});
    //         ajax.start();
    //     },
    //     error: function () {
    //         Feng.error("上传失败!");
    //     }
    // });
    croppers.render({
        elem: '#imgHead',
        saveW: 150,
        saveH: 150,
        mark: 1 / 1,
        area: '900px',
        url: Feng.ctxPath + '/system/upload',
        done: function (url) {
            $("#imgHead img").attr("src", url);
            $("#avatar").val(url);
            var ajax = new $ax(Feng.ctxPath + "/center/user_avatar", function (d) {
                Feng.success("修改图像成功!");
                top.location.reload();
            }, function (data) {
                Feng.error("修改图像失败!" + data.message + "!");
            });
            ajax.set({avatar: url});
            ajax.start();
        }
    });
});