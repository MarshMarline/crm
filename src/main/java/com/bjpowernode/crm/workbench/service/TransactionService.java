package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TransactionService {

    List<User> getUsers();

    boolean saveTran(Tran tran);

    List<Tran> getTranList();

    Tran getTran(String id);

    List<TranHistory> getTranHistoryByTranId(String id);

    boolean changeStage(TranHistory tranHistory);
}
