package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.RuleTreeNodeLine;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IRuleTreeNodeLineDao 规则树结点连线表Dao
 *
 * @author yezhenxiong
 * @version 2024/07/09 16:05
 **/
@Mapper
public interface IRuleTreeNodeLineDao {
    List<RuleTreeNodeLine> queryRuleTreeNodeLineListByTreeId(String treeId);

}
