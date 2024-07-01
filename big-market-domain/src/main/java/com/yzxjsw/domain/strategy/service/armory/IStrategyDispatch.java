package com.yzxjsw.domain.strategy.service.armory;

/**
 * IStrategyDispatch 处理抽奖调度
 *
 * @author yezhenxiong
 * @version 2024/06/30 17:29
 **/
public interface IStrategyDispatch {

    /**
     * 获取到已经装配的抽奖策略的随机结果
     * @param strategyId
     * @return 奖品ID
     */
    Integer getRandomAwardId(Long strategyId);

    Integer getRandomAwardId(Long strategyId, String ruleWeightValue);
}
