layui.use(['table', 'jquery', 'ax'], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var $ax = layui.ax;
    /**
     * 创建对象
     */
    var ChartTotal = {};
    /**
     * 加载用户
     */
    var ajax = new $ax(Feng.ctxPath + "/chart/total/users");
    ajax.type = "get";
    var result = ajax.start();
    /**
     * 初始化表格的列
     */
    ChartTotal.initColumn = function () {
        var columns = $.map(result, function (n, i) {
            return {field: "user_" + n.id, title: n.name, align: 'center'};
        });
        columns.unshift({field: "time", title: "时间", align: 'center'});
        return [columns];
    };
    /**
     * 渲染表格
     */
    ChartTotal.table = table.render({
        elem: '#totalTable',
        url: Feng.ctxPath + '/chart/total/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: ChartTotal.initColumn()
    });
    /**
     * 行工具栏事件
     */
    table.on('tool(userTable)', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'detaol') {
            ChartTotal.openDetail(data);
        }
    });
});
