package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Clue;

import java.util.List;

public interface ClueDao {


    int addClue(Clue clue);

    Clue getClueById(String id);

    int deleteClueById(String clueId);

    List<Clue> getClueList();

    int delete(String[] id);
}
