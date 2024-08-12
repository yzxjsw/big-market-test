package com.yzxjsw.domain.strategy.service.rule.filter;

import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;

/**
 * IFilterNode 抽奖后过滤结点
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:43
 **/
public interface IFilterNode {

    DefaultFilterFactory.ActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleModel);
}
