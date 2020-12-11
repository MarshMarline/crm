package com.bjpowernode.crm.settings.service.impl;

import com.bjpowernode.crm.exception.LoginException;
import com.bjpowernode.crm.settings.dao.UserDao;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.utils.DateTimeUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserDao userDao;


    @Override
    public User login(String loginAct, String loginPwd, String ip) throws LoginException {
        User user = userDao.login(loginAct, loginPwd);
        //验证用户是否存在
        if (user == null){
            throw new LoginException("用户名或密码错误！");
        }
        //验证ip
        if (!user.getAllowIps().contains(ip)){
            throw new LoginException("未授权的ip");
        }
        //判断锁定状态
        if ("0".equals(user.getLockState())){
            throw new LoginException("用户已被锁定");
        }
        //验证失效时间
        String sysTime = DateTimeUtil.getSysTime();
        if (user.getExpireTime().compareTo(sysTime) < 0){
            throw new LoginException("账户已过期");
        }

        //程序执行到这里表明以上验证全部通过未抛出异常
        return user;
    }

    @Override
    public List<User> getUsers() {
        List<User> users = userDao.getUsers();
        return users;
    }

    @Override
    public String getUserNameById(String owner) {
        String name = userDao.getUserNameById(owner);
        return name;
    }
}
