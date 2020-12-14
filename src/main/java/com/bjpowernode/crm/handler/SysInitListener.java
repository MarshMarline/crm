package com.bjpowernode.crm.handler;

import com.bjpowernode.crm.settings.domain.DicValue;
import com.bjpowernode.crm.settings.service.DicService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class SysInitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //数据字典
        ServletContext context = sce.getServletContext();
        System.out.println("全局作用域创建");
        //通过spring自带的工具类获取全局作用域里的容器对象
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
        //通过容器获取service对象
        DicService dicService = (DicService) applicationContext.getBean("dicServiceImpl");

        //调用service的方法得到数据字典的map
        Map<String, List<DicValue>> map = dicService.getAll();
        Set<String> types = map.keySet();
        //遍历把分类把字典List放进全局作用域里
        for(String type:types){
            //map.get(type).forEach(n -> System.out.println(n));
            context.setAttribute(type,map.get(type));
        }

        //匹配阶段和可能性
        ResourceBundle bundle = ResourceBundle.getBundle("conf/Stage2Possibility");
        Map<String,String> possibilityMap = new HashMap<>();
        Enumeration<String> keys = bundle.getKeys();
        String key = "";
        while(keys.hasMoreElements()){
            key = keys.nextElement();
            possibilityMap.put(key,bundle.getString(key));
        }
        context.setAttribute("possibilityMap",possibilityMap);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {


    }
}
