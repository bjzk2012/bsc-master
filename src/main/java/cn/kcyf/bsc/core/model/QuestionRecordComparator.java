package cn.kcyf.bsc.core.model;

import cn.kcyf.bsc.modular.business.entity.QuestionRecord;
import com.alibaba.fastjson.JSONObject;

import java.util.Comparator;

public class QuestionRecordComparator implements Comparator<QuestionRecord> {
    public int compare(QuestionRecord o1, QuestionRecord o2) {
        return o2.getCreateTime().compareTo(o1.getCreateTime());
    }
}
