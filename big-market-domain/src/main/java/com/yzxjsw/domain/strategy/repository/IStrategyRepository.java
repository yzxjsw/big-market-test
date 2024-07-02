package com.yzxjsw.domain.strategy.repository;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.model.StrategyEntity;
import com.yzxjsw.domain.strategy.model.StrategyRuleEntity;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * IStrategyRepository 策略仓储接口
 *
 * @author yezhenxiong
 * @version 2024/06/28 15:12
 **/
public interface IStrategyRepository {


    /**
     * 查询策略配置
     * @param strategyId
     * @return
     */
    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    /**
     * 将策略的概率映射表存入Redis
     * @param key
     * @param rateRange
     * @param shuffleStrategyAwardSearchRateTables
     */
    void storeStrategyAwardSearchRateTables(String key, int rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTables);

    int getRateRange(Long strategyId);
    int getRateRange(String key);

    Integer getStrategyAwardAssemble(String key, Integer rateKey);

    StrategyEntity queryStrategyEntityByStrategyId(Long strategyId);

    StrategyRuleEntity queryStrategyRule(Long strategyId, String ruleModel);

    String queryStrategyRuleValue(Long strategyId, Integer awardId, String ruleModel);
}
