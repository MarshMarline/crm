package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.ClueActivityRelation;
import com.bjpowernode.crm.workbench.domain.Tran;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueService {
    boolean addClue(Clue clue);

    Clue detail(String id);

    List<Activity> getRelativeActivityByClueId(String id);

    boolean removeRelationByReId(String id);

    List<Activity> searchActivityByName(String name, String id);

    int bundRelativeActivity(List<ClueActivityRelation> car);

    List<Activity> searchActivityName(String name);

    public boolean convert(String clueId, Tran tran, String flag);

    List<Clue> getClueList();
}
