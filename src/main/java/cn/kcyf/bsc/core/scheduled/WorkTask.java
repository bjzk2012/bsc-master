package cn.kcyf.bsc.core.scheduled;

import cn.kcyf.bsc.core.enumerate.DayType;
import cn.kcyf.bsc.core.util.WorkDayUtil;
import cn.kcyf.bsc.modular.business.entity.Work;
import cn.kcyf.bsc.modular.business.service.WorkRecordService;
import cn.kcyf.bsc.modular.business.service.WorkService;
import cn.kcyf.bsc.modular.system.entity.User;
import cn.kcyf.bsc.modular.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class WorkTask {
    @Autowired
    private WorkService workService;
    @Autowired
    private UserService userService;

    @Scheduled(cron = "0 0 0 * * ? ")
//    @Scheduled(cron = "0/60 * * * * *")
    private void init(){
        Date today = new Date();
        if (DayType.WORKDAY.equals(WorkDayUtil.request(today))){
            List<User> users = userService.findAll();
            for (User user : users){
                Work work = new Work();
                work.setToday(today);
                work.setCreateTime(today);
                work.setCreateUserId(user.getId());
                work.setCreateUserName(user.getName());
                workService.create(work);
            }
        }
    }
}
