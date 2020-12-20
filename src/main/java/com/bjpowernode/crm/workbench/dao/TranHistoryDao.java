package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.domain.TranHistory;

import java.util.List;

public interface TranHistoryDao {

    int addTranHistoryByTran(Tran tran);

    List<TranHistory> getTranHistoryByTranId(String id);
}
