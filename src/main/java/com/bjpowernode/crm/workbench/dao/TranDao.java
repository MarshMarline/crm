package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Tran;

import java.util.List;

public interface TranDao {

    int addTran(Tran tran);

    List<Tran> getTranList();
}
