layui.use(['layer', 'table', 'util', 'ax', 'form', 'admin'], function () {
    var layer = layui.layer;
    var $ = layui.$;
    var $ax = layui.ax;
    var table = layui.table;
    var util = layui.util;
    var form = layui.form;
    var admin = layui.admin;

    /**
     * 开发工具--代码生成
     */
    var Generator = {
        tableId: "generatorTable",
        tableName: ""
    };

    /**
     * 初始化表格的列
     */
    Generator.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {type: 'numbers'},
            {field: 'engine', sort: true, title: '数据库引擎'},
            {field: 'tableName', sort: true, title: '表名'},
            {field: 'tableComment', sort: true, title: '表备注'},
            {
                sort: true, templet: function (d) {
                    return util.toDateString(d.createTime);
                }, title: '创建时间'
            },
            {align: 'center', width: 80, toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Generator.search = function () {
        var queryData = {};
        queryData['tableName'] = $("#tableName").val();
        queryData['dataSourceId'] = $("#dataSourceId").val();
        table.reload(Generator.tableId, {where: queryData});
    };

    var dataSourceAjax = new $ax(Feng.ctxPath + "/generator/datasourcees", function (data) {
        var id = null;
        $.each(data, function (i, n) {
            if (i == 0){
                id = n.id;
            }
            $('#dataSourceId').append("<option value='" + n.id + "'>" + n.title + "</option>");
        });
        form.render('select');
    });
    dataSourceAjax.type = 'get';
    dataSourceAjax.start();

    // 渲染表格
    table.render({
        elem: '#' + Generator.tableId,
        url: Feng.ctxPath + '/generator/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Generator.initColumn()
    });
    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Generator.search();
    });
    // 批量生成
    $("#btnGenerator").click(function () {
        var checkRows = table.checkStatus(Generator.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要生成的数据表");
        } else {
            Generator.onGenerator($.map(checkRows.data, function(n){return n.tableName;}).join(","))
        }
    });
    Generator.onGenerator = function(tables){
        var dataSourceId = $('#dataSourceId').val();
        if (!dataSourceId){
            Feng.error("请选择数据源");
            return;
        }
        if (!tables){
            Feng.error("请选择表明");
            return;
        }
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type:2,
            area: ['600px', '300px'],
            title: '代码生成',
            content: Feng.ctxPath + '/generator/generator_form?dataSourceId=' + dataSourceId + '&tables=' + tables,
            end: function () {
                admin.getTempData('formOk') && table.reload(DataSource.tableId);
            }
        });
    }

    // 工具条点击事件
    table.on('tool(' + Generator.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'generator') {
            Generator.onGenerator(data.tableName);
        }
    });
});
