package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.ClueActivityRelation;
import com.bjpowernode.crm.workbench.service.ClueService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/workbench/clue")
public class ClueController {
    @Resource
    ClueService clueService;
    @Resource
    UserService userService;

    //查询所有者列表
    @RequestMapping("/getUserList.do")
    @ResponseBody
    List<User> getUserList(){
        return userService.getUsers();
    }

    //添加线索
    @RequestMapping("/addClue.do")
    @ResponseBody
    Map<String,Object> addClue(Clue clue){
        Map<String,Object> map = new HashMap<>();
        if(clueService.addClue(clue)){
            map.put("flag",true);
        }else{
            map.put("flag",false);
        }
        return map;
    }

    //查询单个线索的详细信息
    @RequestMapping("/detail.do")
    String detail(String id, HttpServletRequest request){
        Clue clue = clueService.detail(id);
        request.setAttribute("clue",clue);
        return "clue/detail";
    }

    //查询单个线索关联的所有市场活动列表
    @RequestMapping("/getRelativeActivity.do")
    @ResponseBody
    List<Activity> getRelativeActivity(String id){
        List<Activity> activities = clueService.getRelativeActivityByClueId(id);
        return activities;
    }

    //接触市场活动和线索的关联
    @RequestMapping("/removeRelationByReId.do")
    @ResponseBody
    Map<String, Object> removeRelationByReId(String id){
        Map<String,Object> map = new HashMap<>();
        if(clueService.removeRelationByReId(id)){
            map.put("flag",true);
        }else{
            map.put("flag",false);
        }
        return map;
    }

    @RequestMapping("/searchActivityByName.do")
    @ResponseBody
    List<Activity> searchActivityByName(String name, String id){
        List<Activity> activities = clueService.searchActivityByName(name, id);
        return activities;
    }

    //**添加关联**(重要)
    @RequestMapping("/bundRelativeActivity.do")
    @ResponseBody
    Map<String,Object> bundRelativeActivity(@RequestBody List<ClueActivityRelation> car){
        Map<String,Object> map = new HashMap<>();
        int count = clueService.bundRelativeActivity(car);
        if(count > 0){
            map.put("flag",true);
            map.put("count",count);
        }else{
            map.put("flag",false);
        }
        return map;
    }
}
