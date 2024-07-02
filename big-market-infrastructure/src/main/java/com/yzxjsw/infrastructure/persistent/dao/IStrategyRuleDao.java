package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.StrategyRule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IStrategyRuleDao 策略规则DAO
 *
 * @author yezhenxiong
 * @version 2024/06/27 22:03
 **/
@Mapper
public interface IStrategyRuleDao {

    List<StrategyRule> queryStrategyRuleList();

    StrategyRule queryStrategyRule(StrategyRule strategyRuleReq);

    String queryStrategyRuleValue(StrategyRule strategyRule);
}
