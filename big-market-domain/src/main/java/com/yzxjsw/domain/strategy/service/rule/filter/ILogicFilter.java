package com.yzxjsw.domain.strategy.service.rule.filter;

import com.yzxjsw.domain.strategy.model.RuleActionEntity;
import com.yzxjsw.domain.strategy.model.RuleMatterEntity;

/**
 * ILogicFilter 抽奖过滤接口
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:15
 **/
public interface ILogicFilter<T extends RuleActionEntity.RaffleEntity> {

    RuleActionEntity<T> filter(RuleMatterEntity ruleMatterEntity);
}
