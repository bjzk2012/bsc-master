layui.use(['admin', 'ax', 'table', 'treetable', 'jquery', 'form'], function () {
    var $ax = layui.ax;
    var $ = layui.jquery;
    var admin = layui.admin;
    var table = layui.table;
    var treetable = layui.treetable;
    var form = layui.form;

    /**
     * 系统管理--菜单管理
     */
    var Menu = {
        tableId: "menuTable",    //表格id
        condition: {
            menuId: "",
            menuName: "",
            level: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Menu.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'id', hide: true, title: 'id'},
            {field: 'name', title: '菜单名称'},
            {field: 'code', title: '菜单编码'},
            {field: 'icon', title: '图标', templet: '#iconTpl', align : 'center'},
            {field: 'url', title: '请求地址'},
            {field: 'sort', sort: true, title: '排序'},
            {field: 'levels', sort: true, title: '层级'},
            {field: 'menuFlagRemark', title: '是否是菜单'},
            {field: 'status', sort: true, templet: '#statusTpl', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Menu.search = function () {
        var queryData = {};
        queryData['menuName'] = $("#menuName").val();
        queryData['level'] = $("#level").val();
        Menu.initTable(Menu.tableId, queryData);
    };

    /**
     * 弹出添加菜单对话框
     */
    Menu.openAddMenu = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加菜单',
            content: Feng.ctxPath + '/menu/menu_add',
            end: function () {
                admin.getTempData('formOk') && Menu.initTable(Menu.tableId);
            }
        });
    };

    /**
     * 点击编辑菜单按钮时
     *
     * @param data 点击按钮时候的行数据
     */
    Menu.onEditMenu = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '编辑菜单',
            content: Feng.ctxPath + '/menu/menu_edit?menuId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && Menu.search();
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
    Menu.doAction = function (menuId, action, title, confirm) {
        var func = function (menuId, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/menu/" + action + "/" + menuId, function (data) {
                Feng.success(title + "成功!");
                Menu.initTable(Menu.tableId);
            }, function (data) {
                Feng.error(title + "失败!" + data.responseJSON.message + "!");
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                func(menuId, action, title)
            });
        } else {
            func(menuId, action, title)
        }
    };

    /**
     * 初始化表格
     */
    Menu.initTable = function (tableId, data) {
        return treetable.render({
            elem: '#' + tableId,
            url: Feng.ctxPath + '/menu/list',
            where: data,
            page: false,
            height: "full-125",
            cellMinWidth: 100,
            cols: Menu.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'id',
            treePidName: 'pId',
            treeDefaultClose: false,
            treeLinkage: true
        });
    };

    // 渲染表格
    var tableResult = Menu.initTable(Menu.tableId);
    $('#expandAll').click(function () {
        treetable.expandAll('#' + Menu.tableId);
    });
    $('#foldAll').click(function () {
        treetable.foldAll('#' + Menu.tableId);
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Menu.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Menu.openAddMenu();
    });

    // 工具条点击事件
    table.on('tool(' + Menu.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Menu.onEditMenu(data);
        } else if (layEvent === 'delete') {
            Menu.doAction(data.id, "delete", "删除", true);
        }
    });

    // 修改状态
    form.on('switch(status)', function (obj) {
        Menu.doAction(obj.elem.value, obj.elem.checked ? "unfreeze" : "freeze", obj.elem.checked ? "启用" : "禁用", false);
    });
});
