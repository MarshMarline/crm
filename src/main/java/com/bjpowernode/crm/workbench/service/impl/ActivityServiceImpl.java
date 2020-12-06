package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.settings.dao.UserDao;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
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
    public boolean saveActivity(Activity activity) {
        Boolean flag = false;
        if(activityDao.saveActivity(activity)==1){
            flag = true;
        }
        return flag;
    }

    @Override
    public PaginationVO<Activity> getPageList(HashMap<String, Object> map) {
        List<Activity> activities = activityDao.getPageList(map);
        int total = activityDao.getTotal(map);
        PaginationVO<Activity> vo = new PaginationVO<>(total, activities);
        return vo;
    }

    @Override
    public int delete(String[] id) throws DeleteException {
        int count = activityRemarkDao.getNums(id);
        if (count == activityRemarkDao.deleteRemark(id) && activityDao.delete(id) == id.length) {
            return id.length;
        } else {
            throw new DeleteException("删除失败！");
        }
    }

    @Override
    public Activity getActivityById(String id) {
        return activityDao.getActivityById(id);
    }

    @Override
    public boolean updateActivity(HashMap<String, Object> map) {
        boolean flag = false;
        map.put("editTime", DateTimeUtil.getSysTime());
        if(activityDao.updateActivity(map) == 1){
            flag = true;
        }
        return flag;
    }

    @Override
    public List<ActivityRemark> getRemarks(String id) {
        return activityRemarkDao.getRemarks(id);
    }

    @Override
    public boolean deleteRemarkById(String id) {
        boolean flag = false;
        if(activityRemarkDao.deleteRemarkById(id)==1){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean addRemark(ActivityRemark activityRemark) {
        boolean flag = false;
        activityRemark.setId(UUIDUtil.getUUID());
        activityRemark.setCreateTime(DateTimeUtil.getSysTime());
        activityRemark.setEditFlag("0");
        if(activityRemarkDao.addRemark(activityRemark) == 1){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean updateRemark(ActivityRemark activityRemark) {
        Boolean flag = false;
        activityRemark.setEditFlag("1");
        activityRemark.setEditTime(DateTimeUtil.getSysTime());
        System.out.println(activityRemark);
        if(activityRemarkDao.updateRemark(activityRemark)==1){
            flag = true;
        }
        return flag;
    }

}
