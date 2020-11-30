package com.bjpowernode.crm.settings.web.controller;

import com.bjpowernode.crm.exception.LoginException;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.utils.MD5Util;
import com.bjpowernode.crm.utils.PrintJson;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/settings/user")
public class UserController {

    //自动注入
    @Resource
    UserService userService;

    @RequestMapping("/login.do")
    //@ResponseBody
    public void login(HttpServletRequest request, HttpServletResponse response, String loginAct, String loginPwd){
            String ip = request.getRemoteAddr();
            loginPwd = MD5Util.getMD5(loginPwd);

        try {
            //将密码转化为MD5的密文形式
            //获取浏览器的ip地址
            User user = userService.login(loginAct, loginPwd, ip);
            request.getSession().setAttribute("user",user);
            /*
              程序执行到此处说明没有抛异常，表示登录成功
            * {"success":true}
            * */
            PrintJson.printJsonFlag(response,true);
        } catch (LoginException e) {
            e.printStackTrace();

            /*
            * 执行到catch表示登陆失败
            *   {"success":true,"msg":?}
            * */
            Map<String,Object> map = new HashMap<>();
            map.put("success",false);
            map.put("msg",e.getMessage());
            PrintJson.printJsonObj(response,map);
        }
    }

    @RequestMapping("/uri.do")
    public String urlhandler(String uri){
        return uri;
    }
}
