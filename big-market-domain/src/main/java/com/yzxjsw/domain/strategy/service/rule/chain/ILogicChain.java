package com.yzxjsw.domain.strategy.service.rule.chain;

/**
 * ILogicChain 责任链接口
 *
 * @author yezhenxiong
 * @version 2024/07/08 15:08
 **/
public interface ILogicChain extends ILogicChainArmory{

    /**
     *
     * @param userId 用户ID
     * @param strategyId 策略ID
     * @return 奖品ID
     */
    Integer logic(String userId, Long strategyId);
}
