package com.yzxjsw.domain.strategy.service;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;

import java.util.List;

/**
 * IRaffleAward
 *
 * @author yezhenxiong
 * @version 2024/07/15 14:58
 **/
public interface IRaffleAward {
    /**
     * 根据策略ID查询抽奖奖品列表配置
     *
     * @param strategyId 策略ID
     * @return 奖品列表
     */
    List<StrategyAwardEntity> queryRaffleStrategyAwardList(Long strategyId);
}
