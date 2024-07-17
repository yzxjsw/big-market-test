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
     * @param strategyId 策略ID
     * @return 奖品ID
     */
    Integer getRandomAwardId(Long strategyId);

    /**
     * 获取已经装配的抽奖策略的随机结果
     * @param strategyId 策略ID
     * @param ruleWeightValue 权重范围值， 与策略ID拼装获取权重装配
     * @return 奖品ID
     */
    Integer getRandomAwardId(Long strategyId, String ruleWeightValue);

    /**
     * 根据策略ID和奖品ID，扣减奖品缓存的库存
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     * @return 扣减结果
     */
    Boolean subtractionAwardStock(Long strategyId, Integer awardId);
}
