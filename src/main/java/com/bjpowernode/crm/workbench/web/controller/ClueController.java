package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.*;
import com.bjpowernode.crm.workbench.service.ClueService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @RequestMapping("/getClueList.do")
    @ResponseBody
    List<Clue> getClueList(){
        return clueService.getClueList();
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

    //模糊查询市场活动
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

    //跳转到转换页面
    @RequestMapping("gotoConvert.do")
    String gotoConvert(Clue clue, HttpServletRequest request){
        //clue.setOwner(userService.getUserNameById(clue.getOwner()));
        request.setAttribute("clue",clue);
        return "clue/convert";
    }

    @RequestMapping(value="selectUserName.do",produces = "text/plain;charset=utf-8")
    @ResponseBody
    String selectUserName(String owner){
        return userService.getUserNameById(owner);
    }

    //模糊查询活动名，不用排除关联项
    @RequestMapping("searchActivityName.do")
    @ResponseBody
    Object searchActivityName(String name){
        List<Activity> activities = clueService.searchActivityName(name);
        return activities;
    }

    //线索转换
    @RequestMapping("convert.do")
    String convert(String clueId, Tran tran,String flag){
        System.out.println(clueId);
        System.out.println("========");
        System.out.println(tran);
        boolean f = clueService.convert(clueId, tran, flag);
        return "customer/index";
    }

    @RequestMapping("delete.do")
    @ResponseBody
    Map<String,Object> delete(String id[]){
        Map<String, Object> map = new HashMap<>();
        int count = 0;
        try {
            count = clueService.delete(id);
            map.put("flag",true);
            map.put("count",count);
        } catch (DeleteException e) {
            map.put("flag",false);
            map.put("msg",e.getMessage());
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("getContactsList.do")
    @ResponseBody
    List<Contacts> getContactsList(){
        List<Contacts> contacts = clueService.getContactsList();
        return contacts;
    }

    @RequestMapping("getCustomerList.do")
    @ResponseBody
    List<Customer> getCustomerList(){
        return clueService.getCustomerList();
    }

}
