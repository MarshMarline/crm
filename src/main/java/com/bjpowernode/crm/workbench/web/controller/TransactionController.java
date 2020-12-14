package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.service.CustomerService;
import com.bjpowernode.crm.workbench.service.TransactionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/workbench/transaction")
public class TransactionController {

    @Resource
    TransactionService transactionService;
    @Resource
    CustomerService customerService;

    @RequestMapping("/addTran.do")
    String getUsers(HttpServletRequest request){
        request.setAttribute("users",transactionService.getUsers());
        return "transaction/save";
    }

    @RequestMapping("/getCustomerName.do")
    @ResponseBody
    List<String> getCustomerName(String name){
        List<String> customerNames = customerService.getCustomerName(name);
        return customerNames;
    }

    @RequestMapping("/saveTran.do")
    String saveTran(Tran tran,HttpServletRequest request){
        System.out.println(tran);
        String msg = "保存成功！";
        if(!transactionService.saveTran(tran)){
            msg = "保存失败！";
        }
        request.setAttribute("msg",msg);
        return "/transaction/index";
    }

    @RequestMapping("/getTranList.do")
    @ResponseBody
    List<Tran> getTranList(){
        return transactionService.getTranList();
    }


}
