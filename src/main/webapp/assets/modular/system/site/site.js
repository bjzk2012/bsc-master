layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    /**
     * 站点管理初始化
     */
    var Site = {
        tableId: "siteTable",	//表格id
        condition: {
            condition: ""
        },
        layerIndex: -1
    };

    /**
     * 初始化表格的列
     */
    Site.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {title: '域名', field: 'domain', align: 'center'},
            {title: '路径', field: 'sitePath', align: 'center'},
            {title: '网站名称', field: 'siteName', align: 'center'},
            {title: '协议', field: 'protocol', align: 'center'},
            {title: '静态页后缀', field: 'staticSuffix', align: 'center'},
            {title: '模板方案', field: 'tplSolution', align: 'center'},
            {title: '首页模板', field: 'tplIndex', align: 'center'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };

    /**
     * 点击查询按钮
     */
        Site.search = function () {
        var queryData = {};
        queryData['condition'] = $("#condition").val();
        table.reload(Site.tableId, {where: queryData});
    };

    /**
     * 检查是否选中
     */
    Site.check = function () {
        var selected = table.checkStatus(Site.tableId);
        if(selected.length == 0){
            Feng.info("请先选中表格中的某一记录！");
            return false;
        }else{
            Site.seItem = selected[0];
            return true;
        }
    };

    /**
     * 弹出添加站点
     */
    Site.openAddSite = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加站点',
            content: Feng.ctxPath + '/site/site_add',
            area:['600px', 'auto'],
            end: function () {
                admin.getTempData('formOk') && table.reload(Site.tableId);
            }
        });
    };

    /**
     * 弹出修改站点
     */
    Site.openEditSite = function (data) {
        if (this.check()) {
            var index = layer.open({
                type: 2,
                title: '修改站点',
                content: Feng.ctxPath + '/site/site_edit/' + data.id,
                area:['600px', '300px'],
                end: function () {
                    admin.getTempData('formOk') && table.reload(Site.tableId);
                }
            });
            this.layerIndex = index;
        }
    };

    /**
     * 删除站点
     */
    Site.delete = function (data) {
        if (this.check()) {
            var ajax = new $ax(Feng.ctxPath + "/site/delete", function (data) {
                Feng.success("删除成功!");
                table.reload(site.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("siteId",data.id);
            ajax.start();
        }
    };
    var tableResult = table.render({
        elem: '#' + Site.tableId,
        url: Feng.ctxPath + '/site/list',
        page: true,
        height: "full-125",
        cellMinWidth: 100,
        cols: Site.initColumn()
    });
    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Site.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Site.openAddSite();
    });

    // 工具条点击事件
    table.on('tool(' + Site.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Site.openEditSite(data);
        }else if (layEvent === 'delete') {
            Site.delete(data);
        }
    });
});