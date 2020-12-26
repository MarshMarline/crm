package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.exception.DeleteException;
import com.bjpowernode.crm.utils.DateTimeUtil;
import com.bjpowernode.crm.utils.UUIDUtil;
import com.bjpowernode.crm.workbench.dao.*;
import com.bjpowernode.crm.workbench.domain.*;
import com.bjpowernode.crm.workbench.service.ClueService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueService {
    @Resource
    ClueDao clueDao;
    @Resource
    ClueActivityRelationDao clueActivityRelationDao;
    @Resource
    ActivityDao activityDao;
    @Resource
    TranDao tranDao;
    @Resource
    CustomerDao customerDao;
    @Resource
    ContactsDao contactsDao;
    @Resource
    ClueRemarkDao clueRemarkDao;
    @Resource
    CustomerRemarkDao customerRemarkDao;
    @Resource
    ContactsRemarkDao contactsRemarkDao;
    @Resource
    ContactsActivityRelationDao contactsActivityRelationDao;
    @Resource
    TranHistoryDao tranHistoryDao;

    @Override
    public boolean addClue(Clue clue) {
        boolean flag = true;
        clue.setId(UUIDUtil.getUUID());
        clue.setCreateTime(DateTimeUtil.getSysTime());
        if(1!=clueDao.addClue(clue)){
            flag = false;
        }
        return flag;
    }

    @Override
    public List<Clue> getClueList() {
        return clueDao.getClueList();
    }

    @Override
    public int delete(String[] id) throws DeleteException {
        int count = clueDao.delete(id);
        if(count == 0) throw new DeleteException("删除失败");
        return count;
    }

    @Override
    public List<Contacts> getContactsList() {
        return contactsDao.getContactsList();
    }

    @Override
    public List<Customer> getCustomerList() {
        return customerDao.getCustomerList();
    }

    @Override
    public Clue detail(String id) {
        Clue clue = clueDao.getClueById(id);
        return clue;
    }

    @Override
    public List<Activity> getRelativeActivityByClueId(String id) {
        return clueActivityRelationDao.getRelativeActivityByClueId(id);
    }

    @Override
    public boolean removeRelationByReId(String id) {
        boolean flag = true;
        if(clueActivityRelationDao.removeRelationByReId(id) != 1){
            flag = false;
        }
        return flag;
    }

    @Override
    public List<Activity> searchActivityByName(String name, String id) {
        List<Activity> activities = clueActivityRelationDao.searchActivityByName(name,id);
        return activities;
    }

    //添加关联
    @Override
    public int bundRelativeActivity(List<ClueActivityRelation> car) {
        //Lambda表达式，遍历每个car对象set新生成的id
        car.forEach( c -> c.setId(UUIDUtil.getUUID()));
        //插入多条关联记录
        int count = clueActivityRelationDao.bundRelativeActivity(car);
        return count;
    }

    @Override
    public List<Activity> searchActivityName(String name) {
        return activityDao.searchActivityName(name);
    }

    @Override
    public boolean convert(String clueId, Tran tran, String f){
        boolean flag = true;
        String createTime = DateTimeUtil.getSysTime();
        String customerId = "";
        String contactsId = "";

        //(1) 获取到线索id，通过线索id获取线索对象（线索对象当中封装了线索的信息）
        Clue clue = clueDao.getClueById(clueId);
        clue.setCreateTime(createTime);

        //(2) 通过线索对象提取客户信息，当该客户不存在的时候，新建客户（根据公司的名称精确匹配，判断该客户是否存在！）
        Customer customer = customerDao.getCustomerByName(clue.getCompany());
        if(customer==null){
            customerId = UUIDUtil.getUUID();
            clue.setCreateBy(tran.getCreateBy());
            clue.setId(customerId);
            if (customerDao.addCustomerByClue(clue)!=1)  flag = false;
        }else{
            customerId = customer.getId();
        }

        //(3) 通过线索对象提取联系人信息，保存联系人
        clue.setEditBy(customerId);
        contactsId = UUIDUtil.getUUID();
        clue.setId(contactsId);
        if (contactsDao.addContactsByClue(clue)!=1)  flag = false;

        //(4) 线索备注转换到客户备注以及联系人备注
        List<ClueRemark> remarks = clueRemarkDao.getRemarksByClueId(clueId);
        if(remarks.size()!=0) {

            //客户备注
            for (ClueRemark r : remarks) {
                r.setId(UUIDUtil.getUUID());
                r.setClueId(customerId);
            }
            if (remarks.size() != customerRemarkDao.convertRemarks(remarks)) flag = false;

            //联系人备注
            for (ClueRemark r : remarks) {
                r.setId(UUIDUtil.getUUID());
            }
            if (remarks.size() != contactsRemarkDao.convertRemarks(remarks)) flag = false;
        }

        //(5) “线索和市场活动”的关系转换到“联系人和市场活动”的关系
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationDao.selectRelationByClueId(clueId);
        if(clueActivityRelations.size() != 0) {
            for(ClueActivityRelation c:clueActivityRelations){
                c.setId(UUIDUtil.getUUID());
                c.setClueId(contactsId);
            }
            if(clueActivityRelations.size()!=contactsActivityRelationDao.addRelation(clueActivityRelations)) flag = false;
        }

        //(6) 如果有创建交易需求，创建一条交易
        if("true".equals(f)){

            tran.setId(UUIDUtil.getUUID());
            tran.setCustomerId(customerId);
            tran.setContactsId(contactsId);
            tran.setCreateTime(createTime);
            if(tranDao.addTran(tran)!=1) flag = false;

            //(7) 如果创建了交易，则创建一条该交易下的交易历史
            tran.setContactsId(tran.getId());
            tran.setId(UUIDUtil.getUUID());
            if(tranHistoryDao.addTranHistoryByTran(tran)!=1) flag = false;

        }

        //(8) 删除线索备注
        clueRemarkDao.deleteRemarksByClueId(clueId);
        //(9) 删除线索和市场活动的关系
        clueActivityRelationDao.deleteRelationByClueId(clueId);
        //(10) 删除线索
        if(clueDao.deleteClueById(clueId)!=1) flag = false;



        return flag;
    }




}
