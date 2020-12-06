package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {

    List<ActivityRemark> getRemarks(String id);

    int deleteRemark(String[] id);

    int getNums(String[] id);
}
