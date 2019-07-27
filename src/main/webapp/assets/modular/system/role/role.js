layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;

    /**
     * 系统管理--角色管理
     */
    var Role = {
        tableId: "roleTable",    //表格id
        condition: {
            roleName: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Role.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'roleId', hide: true, sort: true, title: '角色id'},
            {field: 'name', sort: true, title: '名称'},
            {field: 'description', sort: true, title: '别名'},
            {field: 'status', sort: true, templet: '#statusTpl', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Role.search = function () {
        var queryData = {};
        queryData['roleName'] = $("#roleName").val();
        table.reload(Role.tableId, {where: queryData});
    };

    /**
     * 导出excel按钮
     */
    Role.exportExcel = function () {
        var checkRows = table.checkStatus(Role.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 弹出添加角色
     */
    Role.openAddRole = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加角色',
            content: Feng.ctxPath + '/role/role_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Role.tableId);
            }
        });
    };

    /**
     * 点击编辑角色
     *
     * @param data 点击按钮时候的行数据
     */
    Role.onEditRole = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '修改角色',
            content: Feng.ctxPath + '/role/role_edit?roleId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(Role.tableId);
            }
        });
    };

    /**
     * 冻结，解锁，删除等的动作执行
     * @param menuId 点击按钮时候的行数据
     * @param action 执行动作
     * @param title 动作描述
     * @param confirm 是否再次确认
     */
    Role.doAction = function (roleId, action, title, confirm) {
        var func = function (roleId, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/role/" + action + "/" + roleId, function (data) {
                Feng.success(title + "成功!");
                Role.initTable(Role.tableId);
            }, function (data) {
                Feng.error(title + "失败!" + data.responseJSON.message + "!");
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                func(roleId, action, title)
            });
        } else {
            func(roleId, action, title)
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Role.tableId,
        url: Feng.ctxPath + '/role/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Role.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Role.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Role.openAddRole();
    });

    // 导出excel
    $('#btnExp').click(function () {
        Role.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + Role.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Role.onEditRole(data);
        } else if (layEvent === 'delete') {
            Role.onDeleteRole(data);
        }
    });

    // 修改状态
    form.on('switch(status)', function (obj) {
        Role.doAction(obj.elem.value, obj.elem.checked ? "unfreeze" : "freeze", obj.elem.checked ? "启用" : "禁用", false);
    });
});
