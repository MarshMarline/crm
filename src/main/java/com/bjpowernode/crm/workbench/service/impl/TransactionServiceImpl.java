package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.settings.dao.UserDao;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.workbench.dao.CustomerDao;
import com.bjpowernode.crm.workbench.dao.TranDao;
import com.bjpowernode.crm.workbench.dao.TranHistoryDao;
import com.bjpowernode.crm.workbench.domain.Customer;
import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.domain.TranHistory;
import com.bjpowernode.crm.workbench.service.TransactionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Resource
    TranDao tranDao;
    @Resource
    UserDao userDao;
    @Resource
    CustomerDao customerDao;
    @Resource
    TranHistoryDao tranHistoryDao;



    @Override
    public List<User> getUsers() {
        return userDao.getUsers();
    }

    //新建交易
    @Override
    public boolean saveTran(Tran tran) {
        boolean flag = true;
        String id = customerDao.getCustomerIdByName(tran.getCustomerId());
        tran.setId(UUIDUtil.getUUID());
        tran.setCreateTime(DateTimeUtil.getSysTime());

        if(id == null){
            id = UUIDUtil.getUUID();
            Customer customer = new Customer();
            customer.setId(id);
            customer.setName(tran.getCustomerId());
            customer.setOwner(tran.getOwner());
            customer.setCreateBy(tran.getCreateBy());
            customer.setCreateTime(tran.getCreateTime());
            customer.setContactSummary(tran.getContactSummary());
            customer.setNextContactTime(tran.getNextContactTime());
            customer.setDescription(tran.getDescription());
            if(customerDao.addCustomer(customer)!=1){
                return false;
            }
        }

        tran.setCustomerId(id);
        if(tranDao.addTran(tran)!=1) flag = false;

        tran.setContactsId(tran.getId());
        tran.setId(UUIDUtil.getUUID());
        if(tranHistoryDao.addTranHistoryByTran(tran)!=1) flag = false;

        return flag;
    }

    @Override
    public List<Tran> getTranList() {
        return tranDao.getTranList();
    }

    @Override
    public Tran getTran(String id) {
        return tranDao.getTran(id);
    }

    //获取交易历史
    @Override
    public List<TranHistory> getTranHistoryByTranId(String id) {
        return tranHistoryDao.getTranHistoryByTranId(id);
    }

    @Override
    public boolean changeStage(TranHistory tranHistory) {
        boolean flag = true;
        //变更阶段
        if(tranDao.changeStage(tranHistory) != 1) flag = false;
        //新增一条交易历史
        if(tranHistoryDao.addTranHistoryByMap(tranHistory) != 1) flag = false;

        return flag;
    }

    @Override
    public List<Map<String, Integer>> getChar() {
        return tranDao.getChar();
    }

    @Override
    public int delete(String[] id) throws DeleteException {
        int hcount = tranHistoryDao.deleteHistoryByTranId(id);
        if(hcount == 0) throw new DeleteException("删除交易历史失败！");
        int count = tranDao.delete(id);
        if(count == 0) throw new DeleteException("删除交易记录失败！");
        return count;
    }


}
