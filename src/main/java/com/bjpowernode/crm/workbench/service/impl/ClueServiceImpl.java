package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.workbench.dao.ClueActivityRelationDao;
import com.bjpowernode.crm.workbench.dao.ClueDao;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.ClueActivityRelation;
import com.bjpowernode.crm.workbench.service.ClueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {
    @Resource
    ClueDao clueDao;
    @Resource
    ClueActivityRelationDao clueActivityRelationDao;

    @Override
    public boolean addClue(Clue clue) {
        boolean flag = true;
        clue.setId(UUIDUtil.getUUID());
        clue.setCreateTime(DateTimeUtil.getSysTime());
        if(1!=clueDao.addClue(clue)){
            flag = false;
        }
        return flag;
    }

    @Override
    public Clue detail(String id) {
        Clue clue = clueDao.getClueById(id);
        return clue;
    }

    @Override
    public List<Activity> getRelativeActivityByClueId(String id) {
        return clueActivityRelationDao.getRelativeActivityByClueId(id);
    }

    @Override
    public boolean removeRelationByReId(String id) {
        boolean flag = true;
        if(clueActivityRelationDao.removeRelationByReId(id) != 1){
            flag = false;
        }
        return flag;
    }

    @Override
    public List<Activity> searchActivityByName(String name, String id) {
        List<Activity> activities = clueActivityRelationDao.searchActivityByName(name,id);
        return activities;
    }

    //添加关联
    @Override
    public int bundRelativeActivity(List<ClueActivityRelation> car) {
        //Lambda表达式，遍历每个car对象set新生成的id
        car.forEach( c -> c.setId(UUIDUtil.getUUID()));
        //插入多条关联记录
        int count = clueActivityRelationDao.bundRelativeActivity(car);
        return count;
    }


}
