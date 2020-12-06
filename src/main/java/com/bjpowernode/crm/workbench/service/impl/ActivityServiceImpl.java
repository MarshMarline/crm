package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.settings.dao.UserDao;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.dao.ActivityDao;
import com.bjpowernode.crm.workbench.dao.ActivityRemarkDao;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.ActivityRemark;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Resource
    UserDao userDao;
    @Resource
    ActivityDao activityDao;
    @Resource
    ActivityRemarkDao activityRemarkDao;


    @Override
    public int saveActivity(Activity activity) {
        return activityDao.saveActivity(activity);
    }

    @Override
    public PaginationVO<Activity> getPageList(HashMap<String, Object> map) {
        List<Activity> activities = activityDao.getPageList(map);
        int total = activityDao.getTotal(map);
        PaginationVO<Activity> vo = new PaginationVO<>(total,activities);
        return vo;
    }

    @Override
    public int delete(String[] id) throws DeleteException {
        int count = activityRemarkDao.getNums(id);
        if (count == activityRemarkDao.deleteRemark(id) && activityDao.delete(id) == id.length) {
            return id.length;
        }else{
            throw new DeleteException("删除失败！");
        }
    }

    @Override
    public Activity getActivityById(String id) {
        return activityDao.getActivityById(id);
    }

    @Override
    public int updateActivity(HashMap<String, Object> map) {
        map.put("editTime", DateTimeUtil.getSysTime());
        return activityDao.updateActivity(map);
    }

    @Override
    public List<ActivityRemark> getRemarks(String id) {
        return activityRemarkDao.getRemarks(id);
    }

}
