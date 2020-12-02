package com.bjpowernode.crm.settings.web.controller;

import com.bjpowernode.crm.exception.LoginException;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.utils.MD5Util;
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
    @ResponseBody
    public Object login(HttpServletRequest request, HttpServletResponse response, String loginAct, String loginPwd){
        Map<String,Object> map = new HashMap<>();
        //获取浏览器的ip地址
        String ip = request.getRemoteAddr();
        //将密码转化为MD5的密文形式
        loginPwd = MD5Util.getMD5(loginPwd);

        try {
            User user = userService.login(loginAct, loginPwd, ip);
            request.getSession().setAttribute("user",user);
            /*
              程序执行到此处说明没有抛异常，表示登录成功
            * {"success":true}
            * 老师这里使用了自己写的json工具类，但是我们已经在使用springmvc框架了
            * 框架可以在返回的时候自动把对象转换成json传送回去，
            * 所以我在这里就不调用老师的工具类了
            * */
            map.put("success",true);
        } catch (LoginException e) {
            e.printStackTrace();

            /*
            * 执行到catch表示登陆失败
            *   {"success":true,"msg":?}
            * */
            map.put("success",false);
            map.put("msg",e.getMessage());
        }

        return map;

    }

    @RequestMapping("/uri.do")
    public String urlhandler(String uri){
        return uri;
    }
}
