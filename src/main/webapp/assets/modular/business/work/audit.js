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
    var WorkAudit = {
        workAuditTableId: "workAuditTable",
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

    //渲染时间选择框
    laydate.render({
        elem: '#submitTimeLimit',
        range: true,
        max: Feng.currentDate()
    });

    //渲染时间选择框
    laydate.render({
        elem: '#auditTimeLimit',
        range: true,
        max: Feng.currentDate()
    });

    /**
     * 初始化表格的列
     */
    WorkAudit.initWorkRecordColumn = function () {
        return [[
            {title: '序号', type: 'numbers'},
            {field: 'todayRemark', title: '工作时间'},
            {field: 'submitUserName', title: '姓名'},
            {field: 'projectName', title: '项目'},
            {field: 'content', title: '工作内容'},
            {field: 'time', title: '工时(h)'},
            {field: 'submitTime', title: '提交时间'},
            {field: 'lastAuditTime', title: '终审时间'},
            {field: 'statusMessage', title: '状态', templet: '#statusTpl'},
            {align: 'center', toolbar: '#workAuditTableBar', title: '操作', minWidth: 200}
        ]];
    };
    WorkAudit.workRecordTable = table.render({
        elem: '#' + WorkAudit.workAuditTableId,
        url: Feng.ctxPath + '/work/audits',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: WorkAudit.initWorkRecordColumn()
    });
    $("#btnSearch").click(function(){
        table.reload(WorkAudit.workAuditTableId, {where: {timeLimit: $("#timeLimit").val(),submitTimeLimit: $("#submitTimeLimit").val(),auditTimeLimit: $("#auditTimeLimit").val(),status: $("#status").val(),}});
    });

    WorkAudit.openDetail = function(id){
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '查看工作日志',
            content: Feng.ctxPath + '/work/workRecord_detail/' + id,
        });
    };

    WorkAudit.doAction = function (id, action, title, confirm, data) {
        var func = function (id, action, title, data) {
            var ajax = new $ax(Feng.ctxPath + "/work/workRecord/" + action + "/" + id, function (data) {
                Feng.success(title + "成功!");
                table.reload(WorkAudit.workAuditTableId);
            }, function (data) {
                Feng.error(title + "失败!" + data.message + "!");
            });
            ajax.set(data);
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                admin.closeThisDialog()
                func(id, action, title, data);
            });
        } else {
            func(id, action, title, data);
        }
    };

    table.on('tool(' + WorkAudit.workAuditTableId + ')', function (obj) {
        if (obj.event === 'adopt') {
            WorkAudit.doAction(obj.data.id, "audit", "审核通过", true, {flag : true});
        }
        if (obj.event === 'refuse') {
            WorkAudit.doAction(obj.data.id, "audit", "审核拒绝", true, {flag : false});
        }
        if (obj.event === 'detail') {
            WorkAudit.openDetail(obj.data.id);
        }
    });
});
