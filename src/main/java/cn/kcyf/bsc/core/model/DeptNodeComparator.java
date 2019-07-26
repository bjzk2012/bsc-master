package cn.kcyf.bsc.core.model;

import java.util.Comparator;

public class DeptNodeComparator implements Comparator<DeptNode> {

    public int compare(DeptNode o1, DeptNode o2) {
        return o1.getSort().compareTo(o2.getSort());
    }
}
