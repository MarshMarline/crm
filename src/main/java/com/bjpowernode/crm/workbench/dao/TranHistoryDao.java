package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TranHistoryDao {

    int addTranHistoryByTran(Tran tran);

    List<TranHistory> getTranHistoryByTranId(String id);

    int addTranHistoryByMap(TranHistory tranHistory);
}
