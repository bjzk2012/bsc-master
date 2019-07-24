layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    /**
     * 项目管理初始化
     */
    var Project = {
        tableId: "projectTable",	//表格id
        condition: {
            condition: ""
        },
        layerIndex: -1
    };

    /**
     * 初始化表格的列
     */
    Project.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {title: '主键ID', field: 'id', align: 'center'},
            {title: '编码', field: 'code', align: 'center'},
            {title: '名称', field: 'name', align: 'center'},
            {title: '时间', field: 'time', align: 'center'},
            {title: '状态', field: 'isActive', align: 'center'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
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
     * 检查是否选中
     */
    Project.check = function () {
        var selected = table.checkStatus(Project.tableId);
        if(selected.length == 0){
            Feng.info("请先选中表格中的某一记录！");
            return false;
        }else{
            Project.seItem = selected[0];
            return true;
        }
    };

    /**
     * 弹出添加项目
     */
    Project.openAddProject = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            area: '600px',
            title: '添加项目',
            content: Feng.ctxPath + '/project/project_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Project.tableId);
            }
        });
    };

    /**
     * 弹出修改项目
     */
    Project.openEditProject = function (data) {
        if (this.check()) {
            var index = top.layui.admin.open({
                type: 2,
                area: '600px',
                title: '修改项目',
                content: Feng.ctxPath + '/project/project_edit/' + data.id,
                end: function () {
                    admin.getTempData('formOk') && table.reload(Project.tableId);
                }
            });
            this.layerIndex = index;
        }
    };

    /**
     * 删除项目
     */
    Project.delete = function (data) {
        if (this.check()) {
            var ajax = new $ax(Feng.ctxPath + "/project/delete", function (data) {
                Feng.success("删除成功!");
                table.reload(Project.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("projectId",data.id);
            ajax.start();
        }
    };
    var tableResult = table.render({
        elem: '#' + Project.tableId,
        url: Feng.ctxPath + '/project/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Project.initColumn()
    });
    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Project.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Project.openAddProject();
    });

    // 工具条点击事件
    table.on('tool(' + Project.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Project.openEditProject(data);
        }else if (layEvent === 'delete') {
            Project.delete(data);
        }
    });
});