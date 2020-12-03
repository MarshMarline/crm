package com.bjpowernode.crm.settings.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UriController {

    @RequestMapping("/uri.do")
    public String urlhandler(String uri){
        return uri;
    }
}
