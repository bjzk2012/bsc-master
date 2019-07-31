layui.use(['layer', 'form', 'table', 'admin', 'ax', 'element'], function () {
    var $ = layui.$;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var element = layui.element;

    /**
     * 系统管理--项目管理
     */
    var Project = {
        tableId: "projectTable",    //表格id
        condition: {
            ProjectName: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Project.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, title: 'id'},
            {field: 'code', title: '编码'},
            {field: 'name', title: '名称'},
            {field: 'used', title: '已用工时'},
            {field: 'time', title: '总工时'},
            {field: 'rate', title: '总进度', templet: '#rateTpl'},
            {field: 'status', title: '状态', templet: '#statusTpl'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Project.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(Project.tableId, {where: queryData});
    };

    /**
     * 导出excel按钮
     */
    Project.exportExcel = function () {
        var checkRows = table.checkStatus(Project.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 弹出添加项目
     */
    Project.openAddProject = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '添加项目',
            content: Feng.ctxPath + '/project/project_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Project.tableId);
            }
        });
    };

    /**
     * 点击编辑项目
     *
     * @param data 点击按钮时候的行数据
     */
    Project.onEditProject = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: ['600px', '800px'],
            title: '修改项目',
            content: Feng.ctxPath + '/project/project_edit?projectId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(Project.tableId);
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
    Project.doAction = function (projectId, action, title, confirm) {
        var func = function (projectId, action, title) {
            var ajax = new $ax(Feng.ctxPath + "/project/" + action + "/" + projectId, function (data) {
                Feng.success(title + "成功!");
                Project.search();
            }, function (data) {
                Feng.error(title + "失败!" + data.responseJSON.message + "!");
            });
            ajax.start();
        };
        if (confirm) {
            Feng.confirm("是否" + title + "?", function () {
                func(projectId, action, title)
            });
        } else {
            func(projectId, action, title)
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Project.tableId,
        url: Feng.ctxPath + '/project/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Project.initColumn(),
        done: function(){
            element.render();
        }
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Project.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Project.openAddProject();
    });

    // 导出excel
    $('#btnExp').click(function () {
        Project.exportExcel();
    });

    // 工具条点击事件
    table.on('tool(' + Project.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Project.onEditProject(data);
        } else if (layEvent === 'delete') {
            Project.doAction(data.id, "delete", "删除", true);
        }
    });

    // 修改状态
    form.on('switch(status)', function (obj) {
        Project.doAction(obj.elem.value, obj.elem.checked ? "unfreeze" : "freeze", obj.elem.checked ? "启用" : "禁用", false);
    });
});
