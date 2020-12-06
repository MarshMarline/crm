package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.vo.PaginationVO;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.ActivityRemark;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if(activityService.saveActivity(activity)){
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

    @RequestMapping("/delete.do")
    @ResponseBody
    Map<String,Object> delete(String id[]){
        Map<String, Object> map = new HashMap<>();
        //String[] id = ids.split(",");
        int count = 0;
        try {
            count = activityService.delete(id);
            map.put("flag",true);
            map.put("count",count);
        } catch (DeleteException e) {
            map.put("flag",false);
            map.put("msg",e.getMessage());
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/edit.do")
    @ResponseBody
    Map<String,Object> edit(String id){
        Map<String, Object> map = new HashMap<>();
        List<User> users = userService.getUsers();
        Activity activity = activityService.getActivityById(id);
        map.put("activity",activity);
        map.put("users",users);
        return map;
    }

    @RequestMapping("/updateActivity.do")
    @ResponseBody
    Map<String,Object> updateActivity(@RequestParam HashMap<String,Object> map){
        Map<String, Object> resmap = new HashMap<>();
        if(activityService.updateActivity(map)){
            resmap.put("flag",true);
        }else{
            resmap.put("flag",false);
        }
        return resmap;
    }

    @RequestMapping("/detail.do")
    ModelAndView detail(String id){
        ModelAndView mv = new ModelAndView();
        Activity activity = activityService.getActivityById(id);
        mv.addObject("activity",activity);
        mv.setViewName("activity/detail");
        return mv;
    }

    @RequestMapping("/getRemarks.do")
    @ResponseBody
    List<ActivityRemark> getRemarks(String id){
        List<ActivityRemark> remarks = activityService.getRemarks(id);
        return remarks;
    }

    @RequestMapping("/deleteRemarkById")
    @ResponseBody
    Map<String,Object> deleteRemarkById(String id){
        Map<String, Object> resmap = new HashMap<>();
        if(activityService.deleteRemarkById(id)) {
            resmap.put("flag", true);
        }else{
            resmap.put("flag", false);
        }
        return resmap;
    }

    @RequestMapping("/addRemark.do")
    @ResponseBody
    Map<String,Object> addRemark(ActivityRemark activityRemark){
        Map<String, Object> resmap = new HashMap<>();
        if(activityService.addRemark(activityRemark)){
            resmap.put("flag",true);
        }else{
            resmap.put("flag",false);
        }
        return resmap;
    }

    @RequestMapping("/updateRemark.do")
    @ResponseBody
    Map<String,Object> updateRemark(ActivityRemark activityRemark){
        Map<String, Object> resmap = new HashMap<>();
        if(activityService.updateRemark(activityRemark)){
            resmap.put("flag",true);
        }else{
            resmap.put("flag",false);
        }
        return resmap;
    }
}
