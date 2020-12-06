package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.domain.Activity;

import java.util.HashMap;
import java.util.List;

public interface ActivityDao {

    int saveActivity(Activity activity);

    List<Activity> getPageList(HashMap<String, Object> map);

    int getTotal(HashMap<String,Object> map);

    int delete(String[] id);

    Activity getActivityById(String id);

    int updateActivity(HashMap<String, Object> map);

}
