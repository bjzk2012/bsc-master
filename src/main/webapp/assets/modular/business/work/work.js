layui.use(['layer', 'form', 'table', 'admin', 'ax', 'element', 'laydate'], function () {
    var $ = layui.$;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var element = layui.element;
    var laydate = layui.laydate;

    /**
     * 系统管理--项目管理
     */
    var Work = {
        workTableId: "workTable",
        workRecordTableId: "workRecordTable",
        condition: {
            timeLimit: ""
        }
    };

    //渲染时间选择框
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });

    /**
     * 初始化表格的列
     */
    Work.initWorkColumn = function () {
        return [[
            {field: 'todayRemark', title: '时间'},
            {field: 'status', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 初始化表格的列
     */
    Work.initWorkRecordColumn = function () {
        return [[
            {field: 'projectName', title: '项目'},
            {field: 'content', title: '工作内容'},
            {field: 'time', title: '工时'},
            {field: 'status', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    // 渲染表格
    Work.workTable = table.render({
        elem: '#' + Work.workTableId,
        url: Feng.ctxPath + '/work/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Work.initWorkColumn(),
        done: function(){
            Work.workRecordTable.reload()
            table.reload(Work.workRecordTableId, {where: {workId: null}});
        }
    });
    Work.workRecordTable = table.render({
        elem: '#' + Work.workRecordTableId,
        url: Feng.ctxPath + '/work/records',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Work.initWorkRecordColumn(),
        done: function(){
            element.render();
        }
    });

    $("#btnAdd").click(function(){
        console.log(table.checkStatus(Work.workTableId))
    });

    table.on('row(' + Work.workTableId + ')', function(obj){
        console.log(obj)
        var data = obj.data;
        var layEvent = obj.event;
        console.log("row:"+layEvent)
        table.reload(Work.workRecordTableId, {where: {workId: data.id}});
        obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
    });

    // 工具条点击事件
    table.on('tool(' + Work.workTableId + ')', function (obj) {
        console.log(obj)
        var data = obj.data;
        var layEvent = obj.event;
        console.log("tool:"+layEvent)
        if (layEvent === 'edit') {
            alert("edit");
        } else if (layEvent === 'delete') {
            alert("delete");
        }
    });
});
