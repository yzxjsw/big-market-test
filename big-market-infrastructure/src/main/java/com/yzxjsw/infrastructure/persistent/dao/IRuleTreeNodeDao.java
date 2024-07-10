package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.RuleTreeNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IRuleTreeNodeDao 规则树结点表DAO
 *
 * @author yezhenxiong
 * @version 2024/07/09 16:04
 **/
@Mapper
public interface IRuleTreeNodeDao {
    List<RuleTreeNode> queryRuleTreeNodeListByTreeId(String treeId);
}
