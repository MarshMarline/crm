package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.ClueActivityRelation;

import java.util.List;

public interface ContactsActivityRelationDao {

    int addRelation(List<ClueActivityRelation> clueActivityRelations);
}
