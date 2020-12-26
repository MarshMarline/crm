package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Tran;
import com.bjpowernode.crm.workbench.domain.TranHistory;

import java.util.List;
import java.util.Map;

public interface TranDao {

    int addTran(Tran tran);

    List<Tran> getTranList();

    Tran getTran(String id);

    int changeStage(TranHistory tranHistory);

    List<Map<String, Integer>> getChar();
}
