package com.yzxjsw.domain.strategy.service;

import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

/**
 * IRaffleStock 抽奖库存的相关服务接口
 *
 * @author yezhenxiong
 * @version 2024/07/10 16:15
 **/
public interface IRaffleStock {
    /**
     * 获取奖品库存消耗队列
     *
     * @return 奖品库存Key信息
     * @throws InterruptedException 异常
     */
    StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 更新奖品库存消耗记录
     *
     * @param strategyId 策略ID
     * @param awardId    奖品ID
     */
    void updateStrategyAwardStock(Long strategyId, Integer awardId);
}
