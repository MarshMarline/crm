package com.bjpowernode.crm.workbench.dao;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.ClueActivityRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ClueActivityRelationDao {

    List<Activity> getRelativeActivityByClueId(String id);

    int removeRelationByReId(String id);

    List<Activity> searchActivityByName(@Param("name") String name, @Param("id") String id);

    int bundRelativeActivity(List<ClueActivityRelation> car);

    List<ClueActivityRelation> selectRelationByClueId(String clueId);

    int deleteRelationByClueId(String clueId);
}
