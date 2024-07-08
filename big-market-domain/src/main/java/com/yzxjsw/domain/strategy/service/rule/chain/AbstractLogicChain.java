package com.yzxjsw.domain.strategy.service.rule.chain;

/**
 * AbstractLogicChain 抽象
 *
 * @author yezhenxiong
 * @version 2024/07/08 15:10
 **/
public abstract class AbstractLogicChain implements ILogicChain{

    private ILogicChain next;

    @Override
    public ILogicChain appendNext(ILogicChain next) {
        this.next = next;
        return next;
    }

    @Override
    public ILogicChain next() {
        return next;
    }

    protected abstract String ruleModel();
}
