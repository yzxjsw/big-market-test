package com.yzxjsw.domain.strategy.service.rule.chain;

/**
 * ILogicChainArmory 责任链装配接口
 *
 * @author yezhenxiong
 * @version 2024/07/08 17:08
 **/
public interface ILogicChainArmory {
    ILogicChain appendNext(ILogicChain next);

    ILogicChain next();
}
