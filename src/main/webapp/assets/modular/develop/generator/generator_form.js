var MenuInfoDlg = {
    data: {
        pid: "",
        pcodeName: ""
    }
};
layui.use(['layer', 'jquery', 'form', 'admin'], function () {
    var layer = layui.layer;
    var $ = layui.jquery;
    var form = layui.form;
    var admin = layui.admin;

    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    // 点击父级菜单
    $('#pcodeName').click(function () {
        var formName = encodeURIComponent("parent.MenuInfoDlg.data.pcodeName");
        var formId = encodeURIComponent("parent.MenuInfoDlg.data.pid");
        var treeUrl = encodeURIComponent(Feng.ctxPath + "/menu/selectMenuTreeList");

        admin.open({
            type: 2,
            title: '父级菜单',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                $("#menuId").val(MenuInfoDlg.data.pid);
                $("#pcodeName").val(MenuInfoDlg.data.pcodeName);
            }
        });
    });

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        $("#generatorForm").submit();
        Feng.info("代码已生成，请点击下载文件！")
    });

    $("#moduleName").on("input", function(e){
        //获取input输入的值
        console.log(e.delegateTarget.value);
        $("input").each(function(i, n){
            if ($(n).attr('lay-data'))  {
                $(n).val($(n).attr('lay-data').replace("%s", e.delegateTarget.value));
            }
        });
    });
});