package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.ClueRemark;

import java.util.List;

public interface ContactsRemarkDao {

    int convertRemarks(List<ClueRemark> remarks);
}
