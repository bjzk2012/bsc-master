layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;

    /**
     * 系统管理--OSS管理
     */
    var Oss = {
        tableId: "ossTable",    //表格id
        condition: {
            condition: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Oss.initColumn = function () {
        return [[
            {title: '名称', field: 'ossName', align: 'center', valign: 'middle'},
            {title: '存储类型', field: 'ossTypeName', align: 'center', valign: 'middle'},
            {title: 'bucket名', field: 'bucketName', align: 'center', valign: 'middle'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Oss.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(Oss.tableId, {where: queryData});
    };

    /**
     * 弹出添加云存储
     */
    Oss.openAddOss = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加云存储',
            content: Feng.ctxPath + '/oss/oss_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Oss.tableId);
            }
        });
    };

    /**
     * 弹出修改云存储
     */
    Oss.openEditOss = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '修改云存储',
            content: Feng.ctxPath + '/oss/oss_edit/' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(Oss.tableId);
            }
        });
    };

    /**
     * 弹出添加子条目
     */
    Oss.openDetailOss = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '查看云存储',
            content: Feng.ctxPath + '/oss/oss_detail/' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(Oss.tableId);
            }
        });
    };

    /**
     * 点击删除字典
     *
     * @param data 点击按钮时候的行数据
     */
    Oss.onDelete = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/oss/delete", function (data) {
                Feng.success("删除成功!");
                table.reload(Oss.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("ossId", data.id);
            ajax.start();
        };
        Feng.confirm("是否刪除云存储 " + data.ossName + "?", operation);
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Oss.tableId,
        url: Feng.ctxPath + '/oss/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Oss.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Oss.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Oss.openAddOss();
    });

    // 工具条点击事件
    table.on('tool(' + Oss.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Oss.openEditOss(data);
        } else if (layEvent === 'detail') {
            Oss.openDetailOss(data);
        } else if (layEvent === 'delete') {
            Oss.onDelete(data);
        }
    });
});