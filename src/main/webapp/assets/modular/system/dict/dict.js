layui.use(['admin', 'ax', 'table', 'treetable', 'jquery'], function () {
    var $ax = layui.ax;
    var $ = layui.jquery;
    var admin = layui.admin;
    var table = layui.table;
    var treetable = layui.treetable;

    /**
     * 系统管理--菜单管理
     */
    var Dict = {
        tableId: "dictTable",    //表格id
        condition: {
            condition: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Dict.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'id', hide: true, title: 'id'},
            {field: 'name', title: '名称'},
            {field: 'code', title: '字典编码'},
            {field: 'detail', title: '详情'},
            {field: 'description', title: '备注'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Dict.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        Dict.initTable(Dict.tableId, queryData);
    };

    /**
     * 弹出添加菜单对话框
     */
    Dict.openAddDict = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加字典',
            content: Feng.ctxPath + '/dict/dict_add',
            end: function () {
                admin.getTempData('formOk') && Dict.initTable(Dict.tableId);
            }
        });
    };

    /**
     * 点击编辑菜单按钮时
     *
     * @param data 点击按钮时候的行数据
     */
    Dict.onEditDict = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '编辑字典',
            content: Feng.ctxPath + '/dict/dict_edit?dictId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && Dict.search();
            }
        });
    };

    /**
     * 冻结，解锁，删除等的动作执行
     * @param dictId 点击按钮时候的行数据
     * @param action 执行动作
     * @param title 动作描述
     * @param confirm 是否再次确认
     */
    Dict.doAction = function (dictId, action, title, confirm) {
        var func = function (dictId, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/dict/" + action + "/" + dictId, function (data) {
                Feng.success(title + "成功!");
                Dict.search();
            }, function (data) {
                Feng.error(title + "失败!" + data.message + "!");
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                func(dictId, action, title)
            });
        } else {
            func(dictId, action, title)
        }
    };

    /**
     * 初始化表格
     */
    Dict.initTable = function (tableId, data) {
        return treetable.render({
            elem: '#' + tableId,
            url: Feng.ctxPath + '/dict/list',
            where: data,
            page: false,
            height: "full-125",
            cellMinWidth: 100,
            cols: Dict.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'id',
            treePidName: 'pId',
            treeDefaultClose: false,
            treeLinkage: true
        });
    };

    // 渲染表格
    var tableResult = Dict.initTable(Dict.tableId);
    $('#expandAll').click(function () {
        treetable.expandAll('#' + Dict.tableId);
    });
    $('#foldAll').click(function () {
        treetable.foldAll('#' + Dict.tableId);
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Dict.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Dict.openAddDict();
    });

    // 工具条点击事件
    table.on('tool(' + Dict.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Dict.onEditDict(data);
        } else if (layEvent === 'delete') {
            Dict.doAction(data.id, "delete", "删除", true);
        }
    });
});
