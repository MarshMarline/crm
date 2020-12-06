package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.ActivityRemark;

import java.util.HashMap;
import java.util.List;

public interface ActivityService {

    int saveActivity(Activity activity);

    PaginationVO<Activity> getPageList(HashMap<String, Object> map);

    int delete(String[] id) throws DeleteException;

    Activity getActivityById(String id);

    int updateActivity(HashMap<String, Object> map);

    List<ActivityRemark> getRemarks(String id);

    int deleteRemarkById(String id);

    boolean addRemark(ActivityRemark activityRemark);

    boolean updateRemark(ActivityRemark activityRemark);
}
