layui.use(['layer', 'table', 'ax', 'laydate'], function () {
    var $ = layui.$;
    var $ax = layui.ax;
    var layer = layui.layer;
    var table = layui.table;
    var laydate = layui.laydate;

    /**
     * 系统管理--操作日志
     */
    var Log = {
        tableId: "logTable"   //表格id
    };

    /**
     * 初始化表格的列
     */
    Log.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, sort: true, title: 'id'},
            {field: 'logTypeRemark', sort: true, title: '日志类型'},
            {field: 'logName', sort: true, title: '日志名称'},
            {field: 'userName', title: '用户名称'},
            {field: 'className', title: '类名'},
            {field: 'method', title: '方法名'},
            {field: 'succeedRemark', title: '状态'},
            {field: 'createTime', sort: true, title: '时间'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 100}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Log.search = function () {
        var queryData = {};
        queryData['timeLimit'] = $("#timeLimit").val();
        queryData['logName'] = $("#logName").val();
        queryData['logType'] = $("#logType").val();
        table.reload(Log.tableId, {where: queryData});
    };

    /**
     * 导出excel按钮
     */
    Log.exportExcel = function () {
        var checkRows = table.checkStatus(Log.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 日志详情
     */
    Log.logDetail = function (param) {
        var ajax = new $ax(Feng.ctxPath + "/log/detail/" + param.id, function (data) {
            Feng.infoDetail("日志详情", data.data.message);
        }, function (data) {
            Feng.error("获取详情失败!");
        });
        ajax.type = "get";
        ajax.start();
    };

    /**
     * 清空日志
     */
    Log.cleanLog = function () {
        Feng.confirm("是否清空所有日志?", function () {
            var ajax = new $ax(Feng.ctxPath + "/log/delete", function (data) {
                Feng.success("清空日志成功!");
                Log.search();
            }, function (data) {
                Feng.error("清空日志失败!");
            });
            ajax.start();
        });
    };

    //渲染时间选择框
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Log.tableId,
        url: Feng.ctxPath + '/log/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Log.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Log.search();
    });

    // 搜索按钮点击事件
    $('#btnClean').click(function () {
        Log.cleanLog();
    });

    // 工具条点击事件
    table.on('tool(' + Log.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'detail') {
            Log.logDetail(data);
        }
    });
});
