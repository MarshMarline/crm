package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.settings.dao.UserDao;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.workbench.dao.CustomerDao;
import com.bjpowernode.crm.workbench.dao.TranDao;
import com.bjpowernode.crm.workbench.domain.Customer;
import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.service.TransactionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Resource
    TranDao tranDao;
    @Resource
    UserDao userDao;
    @Resource
    CustomerDao customerDao;



    @Override
    public List<User> getUsers() {
        return userDao.getUsers();
    }

    @Override
    public boolean saveTran(Tran tran) {
        boolean flag = true;
        String id = customerDao.getCustomerIdByName(tran.getCustomerId());
        if(id == null){
            id = UUIDUtil.getUUID();
            Customer customer = new Customer();
            customer.setId(id);
            customer.setName(tran.getCustomerId());
            if(customerDao.addCustomer(customer)!=1){
                return false;
            }
        }
        tran.setCustomerId(id);
        if(tranDao.addTran(tran)!=1){
            flag = false;
        }
        return flag;
    }

    @Override
    public List<Tran> getTranList() {
        return tranDao.getTranList();
    }
}
