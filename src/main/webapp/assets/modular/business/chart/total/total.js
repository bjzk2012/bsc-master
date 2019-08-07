layui.use(['table', 'laydate', 'jquery'], function () {
    var table = layui.table;
    var $ = layui.jquery;
    var laydate = layui.laydate;
    /**
     * 创建对象
     */
    var ChartTotal = {};
    /**
     * 渲染时间选择框
     */
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });
    ChartTotal.table = table.init('totalTable', {
        toolbar: "#toolbar",
        page: false,
        done: function(){
            $(".action_detail").click(function(){
                ChartTotal.openDetail(JSON.parse($(this).attr("lay-data")));
            })
        }
    });
    ChartTotal.openDetail = function(data){
        top.layui.admin.open({
            type: 2,
            area: ['1100px', '480px'],
            title: '查看详情',
            content: Feng.ctxPath + '/chart/total/detail?userId=' + data.userId + "&time="+data.time
        });
    };
});
