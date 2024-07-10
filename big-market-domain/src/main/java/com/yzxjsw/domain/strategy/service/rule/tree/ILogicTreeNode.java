package com.yzxjsw.domain.strategy.service.rule.tree;

import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;

/**
 * ILogicTreeNode 规则树接口
 *
 * @author yezhenxiong
 * @version 2024/07/09 14:41
 **/
public interface ILogicTreeNode {

    DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Integer awardId);
}
