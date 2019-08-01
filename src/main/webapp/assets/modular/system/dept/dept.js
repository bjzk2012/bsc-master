layui.use(['table', 'admin', 'ax', 'ztree'], function () {
    var $ = layui.$;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var $ZTree = layui.ztree;

    /**
     * 系统管理--部门管理
     */
    var Dept = {
        tableId: "deptTable",
        condition: {
            deptId: ""
        }
    };

    Dept.initTree = function(){
        Dept.condition.deptId = '';
        $("#name").val('');
        var ztree = new $ZTree("deptTree", "/dept/tree");
        ztree.bindOnClick(function (e, treeId, treeNode) {
            Dept.condition.deptId = treeNode.id;
            Dept.search();
        });
        ztree.init();
    };

    Dept.initTree();

    /**
     * 初始化表格的列
     */
    Dept.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: 'id'},
            {field: 'simpleName', sort: true, title: '部门简称'},
            {field: 'fullName', sort: true, title: '部门全称'},
            {field: 'sort', sort: true, title: '排序'},
            {field: 'description', title: '备注'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Dept.search = function () {
        var queryData = {};
        queryData['condition'] = $("#name").val();
        queryData['deptId'] = Dept.condition.deptId;
        table.reload(Dept.tableId, {where: queryData});
    };

    /**
     * 导出excel按钮
     */
    Dept.exportExcel = function () {
        var checkRows = table.checkStatus(Dept.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 弹出添加
     */
    Dept.openAddDept = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加部门',
            content: Feng.ctxPath + '/dept/dept_add?parentId=' + Dept.condition.deptId,
            end: function () {
                admin.getTempData('formOk') && Dept.initTree();
                admin.getTempData('formOk') && Dept.search();
            }
        });
    };

    /**
     * 点击编辑部门
     *
     * @param data 点击按钮时候的行数据
     */
    Dept.onEditDept = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '修改部门',
            content: Feng.ctxPath + '/dept/dept_edit?deptId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && Dept.initTree();
                admin.getTempData('formOk') && Dept.search();
            }
        });
    };

    /**
     * 点击删除部门
     *
     * @param data 点击按钮时候的行数据
     */
    Dept.onDeleteDept = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/dept/delete/" + data.id, function () {
                Feng.success("删除成功!");
                Dept.initTree();
                Dept.search();
            }, function (data) {
                Feng.error("删除失败!" + data.message + "!");
            });
            ajax.start();
        };
        Feng.confirm("是否删除部门 " + data.simpleName + "?", operation);
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Dept.tableId,
        url: Feng.ctxPath + '/dept/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Dept.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Dept.search();
    });

    // 刷新按钮点击事件
    $('#refreshSearch').click(function () {
        Dept.initTree();
        Dept.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Dept.openAddDept();
    });

    // 导出excel
    $('#btnExp').click(function () {
        Dept.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + Dept.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Dept.onEditDept(data);
        } else if (layEvent === 'delete') {
            Dept.onDeleteDept(data);
        }
    });
});
