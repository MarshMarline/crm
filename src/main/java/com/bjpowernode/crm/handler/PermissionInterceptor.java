package com.bjpowernode.crm.handler;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PermissionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getRequestURI().contains("login")) return true;
        if(request.getSession().getAttribute("user") != null) return true;
        request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request,response);
        return false;
    }
}
