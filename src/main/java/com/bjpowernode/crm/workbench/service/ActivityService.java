package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.domain.Activity;

import java.util.HashMap;
import java.util.List;

public interface ActivityService {

    int saveActivity(Activity activity);

    PaginationVO<Activity> getPageList(HashMap<String, Object> map);
}
