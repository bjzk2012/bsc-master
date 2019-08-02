layui.use(['form', 'table', 'laydate', 'admin', 'jquery'], function () {
    var form = layui.form;
    var table = layui.table;
    var $ = layui.jquery;
    var laydate = layui.laydate;
    var admin = layui.admin;

    /**
     * 创建对象
     */
    var MgrUser = {};

    /**
     * 初始化表格的列
     */
    MgrUser.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: '用户id'},
            {field: 'account', sort: true, title: '账号'},
            {field: 'name', sort: true, title: '姓名'},
            {field: 'sexMessage', title: '性别'},
            {field: 'roleName', title: '角色'},
            {field: 'deptName', title: '部门'},
            {field: 'email', title: '邮箱'},
            {field: 'phone', title: '电话'},
            {field: 'createTime', sort: true, title: '创建时间'},
            {field: 'status', templet: '#statusTpl', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };

    /**
     * 检索
     */
    MgrUser.search = function () {
        var queryData = {};
        queryData['name'] = $("#name").val();
        queryData['timeLimit'] = $("#timeLimit").val();
        table.reload('#userTable', {where: queryData});
    };

    /**
     * 弹出添加对话框
     */
    MgrUser.openAdd = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加用户',
            content: Feng.ctxPath + '/mgr/user_add',
            end: function () {
                admin.getTempData('formOk') && MgrUser.search();
            }
        });
    };

    /**
     * 弹出编辑对话框
     *
     */
    MgrUser.onEdit = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '编辑用户',
            content: Feng.ctxPath + '/mgr/user_edit?userId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && MgrUser.search();
            }
        });
    };

    /**
     * 导出excel按钮
     */
    MgrUser.exportExcel = function () {
        var checkRows = table.checkStatus('#userTable');
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(MgrUser.tableResult.config.id, checkRows.data, 'xls');
        }
    };

    // 渲染表格
    MgrUser.tableResult = table.render({
        elem: '#userTable',
        url: Feng.ctxPath + '/mgr/list',
        page: true,
        toolbar: "#toolBar",
        height: "full-125",
        cellMinWidth: 100,
        cols: MgrUser.initColumn()
    });

    // 渲染时间选择框
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });

    $("[lay-click]").click(function(){
        MgrUser[$(this).attr("lay-click")].call(this);
    });

    // 工具条点击事件
    table.on('tool(userTable)', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            MgrUser.onEditUser(data);
        } else if (layEvent === 'delete') {
            Feng.doAction({
                id : data.id,
                module : "mgr",
                action : "delete",
                title : "删除用户",
                confirm : true,
                finish : function(d){
                    MgrUser.search();
                }
            });
        } else if (layEvent === 'reset') {
            Feng.doAction({
                id : data.id,
                module : "mgr",
                action : "reset",
                title : "重置用户密码",
                confirm : true,
                finish : function(d){
                    MgrUser.search();
                }
            });
        }
    });

    // 修改状态
    form.on('switch(status)', function (obj) {
        Feng.doAction({
            id : obj.elem.value,
            module : "mgr",
            action : obj.elem.checked ? "unfreeze" : "freeze",
            title : obj.elem.checked ? "解冻" : "冻结",
            finish : function(d){
                MgrUser.search();
            }
        });
    });

});
