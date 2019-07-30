
package cn.kcyf.bsc.modular.system.controller;

import cn.kcyf.bsc.core.enumerate.LogType;
import cn.kcyf.bsc.core.log.BussinessLog;
import cn.kcyf.bsc.core.model.ResponseData;
import cn.kcyf.bsc.modular.system.entity.OperationLog;
import cn.kcyf.bsc.modular.system.service.OperationLogService;
import cn.kcyf.commons.utils.DateUtils;
import cn.kcyf.orm.jpa.criteria.Criteria;
import cn.kcyf.orm.jpa.criteria.Restrictions;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 日志管理的控制器
 *
 * @author Tom
 */
@Controller
@RequestMapping("/log")
@Api(tags = "日志管理", description = "日志管理")
public class LogController extends BasicController {

    private static String PREFIX = "/modular/system/log/";

    @Autowired
    private OperationLogService operationLogService;

    @GetMapping("")
    public String index(Model model) {
        Map<String, String> types = new HashMap<String, String>();
        for (LogType type : LogType.values()){
            types.put(type.name(), type.getMessage());
        }
        model.addAttribute("types", types);
        return PREFIX + "log.html";
    }

    @GetMapping("/list")
    @ResponseBody
    public ResponseData list(String timeLimit, String logName, LogType logType, int page, int limit) {
        Criteria<OperationLog> criteria = new Criteria<OperationLog>();
        if (!StringUtils.isEmpty(timeLimit)) {
            String[] split = timeLimit.split(" - ");
            criteria.add(Restrictions.gte("createTime", DateUtils.parse(split[0] + " 00:00:00", "yyyy-MM-dd HH:mm:ss")));
            criteria.add(Restrictions.lte("createTime", DateUtils.parse(split[1] + " 23:59:59", "yyyy-MM-dd HH:mm:ss")));
        }
        if (!StringUtils.isEmpty(logName)) {
            criteria.add(Restrictions.like("logName", logName));
        }
        if (logType != null) {
            criteria.add(Restrictions.eq("logType", logType));
        }
        return ResponseData.list(operationLogService.findList(criteria, PageRequest.of(page - 1, limit)));
    }

    @GetMapping("/detail/{id}")
    @ResponseBody
    public ResponseData detail(@PathVariable Long id) {
        return ResponseData.success(operationLogService.getOne(id));
    }

    @PostMapping("/delete")
    @ResponseBody
    @BussinessLog(value = "清空业务日志")
    public ResponseData delete() {
        List<OperationLog> list = operationLogService.findAll();
        if (list != null && !list.isEmpty()){
            List<Long> ids = new ArrayList<Long>();
            for (OperationLog log : list){
                ids.add(log.getId());
            }
            operationLogService.deletes(ids);
        }
        return SUCCESS_TIP;
    }
}
