layui.use(['layer', 'form', 'table', 'util', 'admin', 'ax'], function () {
    var layer = layui.layer;
    var $ = layui.$;
    var $ax = layui.ax;
    var table = layui.table;
    var util = layui.util;
    var admin = layui.admin;

    /**
     * 开发工具--代码生成
     */
    var DataSource = {
        tableId: "datasourceTable",
        title: ""
    };

    /**
     * 初始化表格的列
     */
    DataSource.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'title', sort: true, title: '别名'},
            {field: 'dbDriver', sort: true, title: '驱动名'},
            {field: 'dbUrl', sort: true, title: '数据库地址'},
            {field: 'dbType', sort: true, title: '数据库类型'},
            {
                sort: true, templet: function (d) {
                    return util.toDateString(d.createTime);
                }, title: '创建时间'
            },
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };

    /**
     * 点击查询按钮
     */
    DataSource.search = function () {
        var queryData = {};
        queryData['title'] = $("#title").val();
        table.reload(DataSource.tableId, {where: queryData});
    };

    /**
     * 弹出添加数据源对话框
     */
    DataSource.onAddDataSource = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加数据源',
            content: Feng.ctxPath + '/datasource/datasource_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(DataSource.tableId);
            }
        });
    };

    /**
     * 点击删除数据源按钮
     *
     * @param data 点击按钮时候的行数据
     */
    DataSource.onRemoveDataSource = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/datasource/remove", function () {
                table.reload(DataSource.tableId);
                Feng.success("删除成功!");
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除数据源" + data.title + "?", operation);
    };

    /**
     * 弹出修改数据源对话框
     */
    DataSource.onEditDataSource = function (data) {
        admin.putTempData('formOk', false);
        top.layer.open({
            type: 2,
            title: '编辑数据源',
            content: Feng.ctxPath + '/datasource/datasource_edit?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(DataSource.tableId);
            }
        });
    };


    // 渲染表格
    table.render({
        elem: '#' + DataSource.tableId,
        url: Feng.ctxPath + '/datasource/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: DataSource.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        DataSource.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        DataSource.onAddDataSource();
    });

    // 工具条点击事件
    table.on('tool(' + DataSource.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;
        if (layEvent === 'edit') {
            DataSource.onEditDataSource(data);
        } else if (layEvent === 'remove') {
            DataSource.onRemoveDataSource(data);
        }
    });
});
