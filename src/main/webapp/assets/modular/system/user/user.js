layui.use(['layer', 'form', 'table', 'laydate', 'admin', 'ax', 'jquery'], function () {
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var $ = layui.jquery;
    var laydate = layui.laydate;
    var admin = layui.admin;

    /**
     * 系统管理--用户管理
     */
    var MgrUser = {
        tableId: "userTable",    //表格id
        condition: {
            name: "",
            deptId: "",
            timeLimit: ""
        }
    };

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
     * 点击查询按钮
     */
    MgrUser.search = function () {
        var queryData = {};
        // queryData['deptId'] = MgrUser.condition.deptId;
        queryData['name'] = $("#name").val();
        queryData['timeLimit'] = $("#timeLimit").val();
        table.reload(MgrUser.tableId, {where: queryData});
    };

    /**
     * 弹出添加用户对话框
     */
    MgrUser.openAddUser = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加用户',
            content: Feng.ctxPath + '/mgr/user_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(MgrUser.tableId);
            }
        });
    };

    /**
     * 导出excel按钮
     */
    MgrUser.exportExcel = function () {
        var checkRows = table.checkStatus(MgrUser.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 点击编辑用户按钮时
     *
     * @param data 点击按钮时候的行数据
     */
    MgrUser.onEditUser = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '编辑用户',
            content: Feng.ctxPath + '/mgr/user_edit?userId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(MgrUser.tableId);
            }
        });
    };

    // 冻结，解锁，删除等的动作执行
    MgrUser.doAction = function (userId, action, title, confirm) {
        var func = function (userId, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/mgr/" + action + "/" + userId, function (data) {
                Feng.success(title + "成功!");
                MgrUser.search();
            }, function (data) {
                Feng.error(title + "失败!" + data.responseJSON.message + "!");
                table.reload(MgrUser.tableId);
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                func(userId, action, title)
            });
        } else {
            func(menuId, action, title)
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + MgrUser.tableId,
        url: Feng.ctxPath + '/mgr/list',
        page: true,
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

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        MgrUser.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        MgrUser.openAddUser();
    });

    // 导出excel
    $('#btnExp').click(function () {
        MgrUser.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + MgrUser.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            MgrUser.onEditUser(data);
        } else if (layEvent === 'delete') {
            MgrUser.doAction(data.id, "delete", "删除用户", true);
        } else if (layEvent === 'reset') {
            MgrUser.doAction(data.id, "reset", "重置用户密码", true);
        }
    });

    // 修改状态
    form.on('switch(status)', function (obj) {
        MgrUser.doAction(obj.elem.value, obj.elem.checked ? "unfreeze" : "freeze", obj.elem.checked ? "解除冻结" : "冻结", false);
    });

});
