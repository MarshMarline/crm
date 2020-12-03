package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/workbench/activity")
public class ActivityController {

    @Resource
    ActivityService activityService;
    @Resource
    UserService userService;

    @RequestMapping("/getUsers.do")
    @ResponseBody
    Object getUsers(){
        List<User> users = userService.getUsers();
        return users;
    }

    @RequestMapping("/saveActivity.do")
    @ResponseBody
    Map<String, Object> saveActivity(Activity activity){
        Map<String,Object> map = new HashMap<>();
        activity.setId(UUIDUtil.getUUID());
        activity.setCreateTime(DateTimeUtil.getSysTime());
        int i = activityService.saveActivity(activity);
        if(i == 1){
            map.put("flag",true);
        }else{
            map.put("flag",false);
        }
        return map;
    }

    @RequestMapping("/pageList.do")
    @ResponseBody
    PaginationVO<Activity> getPageList(@RequestParam HashMap<String,Object> map){
        Integer pageSize = Integer.parseInt((String) map.get("pageSize"));
        Integer pageNo = Integer.parseInt((String) map.get("pageNo"));
        Integer skipPage = (pageNo - 1)*pageSize;
        //把String类型数据替换成Integer类型，mybatis才能正确替换
        map.put("skipPage", skipPage);
        map.put("pageSize", pageSize);
        PaginationVO<Activity> vo = activityService.getPageList(map);
        return vo;
    }
}
