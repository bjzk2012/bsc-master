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
    var WorkApply = {
        workTableId: "workTable",
        workRecordTableId: "workRecordTable",
        condition: {
            workId: null,
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
    WorkApply.initWorkColumn = function () {
        return [[
            {title: '序号', type: 'numbers'},
            {field: 'todayRemark', title: '时间'},
            {field: 'statusMessage', title: '状态', templet: '#workStatusTpl'}
        ]];
    };

    /**
     * 初始化表格的列
     */
    WorkApply.initWorkRecordColumn = function () {
        return [[
            {title: '序号', type: 'numbers'},
            {field: 'projectName', title: '项目'},
            {field: 'content', title: '工作内容'},
            {field: 'time', title: '工时'},
            {field: 'statusMessage', title: '状态', templet: '#workRecordstatusTpl'},
            {align: 'center', toolbar: '#workRecordTableBar', title: '操作', minWidth: 200}
        ]];
    };

    // 渲染表格
    WorkApply.workTable = table.render({
        elem: '#' + WorkApply.workTableId,
        url: Feng.ctxPath + '/work/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: WorkApply.initWorkColumn(),
        done: function () {
            WorkApply.workRecordTable.reload()
            table.reload(WorkApply.workRecordTableId, {where: {workId: null}});
            WorkApply.condition.workId = null;
        }
    });
    WorkApply.workRecordTable = table.render({
        elem: '#' + WorkApply.workRecordTableId,
        url: Feng.ctxPath + '/work/records',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: WorkApply.initWorkRecordColumn()
    });
    WorkApply.openAddWorkRecord = function(workId){
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加工作日志',
            content: Feng.ctxPath + '/work/workRecord_add?workId=' + workId,
            end: function () {
                admin.getTempData('formOk') && table.reload(WorkApply.workRecordTableId);
            }
        });
    };
    WorkApply.openEditWorkRecord = function(workRecordId){
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '修改工作日志',
            content: Feng.ctxPath + '/work/workRecord_edit?workRecordId=' + workRecordId,
            end: function () {
                admin.getTempData('formOk') && table.reload(WorkApply.workRecordTableId);
            }
        });
    };
    $("#btnSearch").click(function(){
        table.reload(WorkApply.workTableId, {where: {timeLimit: $("#timeLimit").val()}});
    });
    $("#btnAdd").click(function(){
        if(!WorkApply.condition.workId){
            Feng.error("请选择日期!");
            return;
        }
        WorkApply.openAddWorkRecord(WorkApply.condition.workId);
    });
    $("#btnSubmitWork").click(function(){
        if(!WorkApply.condition.workId){
            Feng.error("请选择日期!");
            return;
        }
        WorkApply.submitWork(WorkApply.condition.workId);
    });
    WorkApply.submitWork = function(workId){
        WorkApply.doAction(workId, "submit", "提交", true)
    };

    WorkApply.doAction = function (id, action, title, confirm) {
        var func = function (id, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/work/workRecord/" + action + "/" + id, function (data) {
                Feng.success(title + "成功!");
                table.reload(WorkApply.workRecordTableId);
            }, function (data) {
                console.log(data)
                Feng.error(title + "失败!" + data.message + "!");
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                admin.closeThisDialog()
                func(id, action, title)
            });
        } else {
            func(id, action, title)
        }
    };

    table.on('tool(' + WorkApply.workRecordTableId + ')', function (obj) {
        if (obj.event === 'edit') {
            WorkApply.openEditWorkRecord(obj.data.id);
        }
        if (obj.event === 'delete') {
            WorkApply.openEditWorkRecord();
        }
    });

    table.on('row(' + WorkApply.workTableId + ')', function (obj) {
        var data = obj.data;
        table.reload(WorkApply.workRecordTableId, {where: {workId: data.id}});
        WorkApply.condition.workId = data.id;
        obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
    });
});
