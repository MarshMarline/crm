package com.bjpowernode.crm.settings.dao;

import com.bjpowernode.crm.settings.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User login(@Param("username") String username, @Param("password") String password);
}
