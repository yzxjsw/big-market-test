package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.RuleTree;
import org.apache.ibatis.annotations.Mapper;

/**
 * IRuleTreeDao 规则树表DAO
 *
 * @author yezhenxiong
 * @version 2024/07/09 16:03
 **/
@Mapper
public interface IRuleTreeDao {
    RuleTree queryRuleTreeByTreeId(String treeId);
}
