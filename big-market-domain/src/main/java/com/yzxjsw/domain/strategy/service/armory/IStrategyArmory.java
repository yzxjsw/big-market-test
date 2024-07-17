package com.yzxjsw.domain.strategy.service.armory;

/**
 * IStrategyArmory 装配工厂：负责初始化策略计算
 * Armory 军械库
 * Lottery 彩票/抽奖
 * @author yezhenxiong
 * @version 2024/06/28 15:06
 **/
public interface IStrategyArmory {

    /**
     * 装配抽奖策略接口
     * @param strategyId 策略ID
     */
    boolean assembleLotteryStrategy(Long strategyId);


}
