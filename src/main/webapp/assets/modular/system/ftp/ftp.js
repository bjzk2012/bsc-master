layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    /**
     * FTP配置管理初始化
     */
    var Ftp = {
        tableId: "ftpTable",	//表格id
        condition: {
            condition: ""
        },
        layerIndex: -1
    };

    /**
     * 初始化表格的列
     */
    Ftp.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {title: '名称', field: 'ftpName', align: 'center'},
            {title: 'IP', field: 'ip', align: 'center'},
            {title: '端口号', field: 'port', align: 'center'},
            {title: '编码', field: 'encoding', align: 'center'},
            {title: '路径', field: 'ftpPath', align: 'center'},
            {title: '访问URL', field: 'url', align: 'center'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };
    /**
     * 点击查询按钮
     */
    Ftp.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(Ftp.tableId, {where: queryData});
    };

    /**
     * 检查是否选中
     */
    Ftp.check = function () {
        var selected = table.checkStatus(Ftp.tableId);;
        if(selected.length == 0){
            Feng.info("请先选中表格中的某一记录！");
            return false;
        }else{
            Ftp.seItem = selected[0];
            return true;
        }
    };

    /**
     * 弹出添加FTP配置
     */
    Ftp.openAddFtp = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加FTP配置',
            content: Feng.ctxPath + '/ftp/ftp_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Ftp.tableId);
            }
        });
    };

    /**
     * 弹出修改FTP配置
     */
    Ftp.openEditFtp = function (data) {
        if (this.check()) {
            var index = layer.open({
                type: 2,
                title: '修改FTP配置',
                content: Feng.ctxPath + '/ftp/ftp_edit/' + data.ftpId,
                end: function () {
                    admin.getTempData('formOk') && table.reload(Ftp.tableId);
                }
            });
            this.layerIndex = index;
        }
    };

    /**
     * 删除FTP配置
     */
    Ftp.delete = function (data) {
        if (this.check()) {
            var ajax = new $ax(Feng.ctxPath + "/ftp/delete", function (data) {
                Feng.success("删除成功!");
                table.reload(Ftp.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("ftpId",data.ftpId);
            ajax.start();
        }
    };
    var tableResult = table.render({
        elem: '#' + Ftp.tableId,
        url: Feng.ctxPath + '/ftp/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Ftp.initColumn()
    });
    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Ftp.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Ftp.openAddFtp();
    });

    // 工具条点击事件
    table.on('tool(' + Ftp.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Ftp.openEditFtp(data);
        }else if (layEvent === 'delete') {
            Ftp.delete(data);
        }
    });
});