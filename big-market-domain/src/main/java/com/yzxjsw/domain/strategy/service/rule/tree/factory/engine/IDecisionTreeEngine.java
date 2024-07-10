package com.yzxjsw.domain.strategy.service.rule.tree.factory.engine;

import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;

/**
 * IDecisionTreeEngine 决策树执行引擎接口
 *
 * @author yezhenxiong
 * @version 2024/07/09 14:52
 **/
public interface IDecisionTreeEngine {

    DefaultTreeFactory.StrategyAwardVO process(String userId, Long strategyId, Integer awardId);
}
