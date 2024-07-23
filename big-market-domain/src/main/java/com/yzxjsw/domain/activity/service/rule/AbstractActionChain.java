package com.yzxjsw.domain.activity.service.rule;

/**
 * AbstractActionChain 下单规则责任链抽象类
 *
 * @author yezhenxiong
 * @version 2024/07/22 16:23
 **/
public abstract class AbstractActionChain implements IActionChain{
    private IActionChain next;

    @Override
    public IActionChain next() {
        return next;
    }

    @Override
    public IActionChain appendNext(IActionChain next) {
        this.next = next;
        return next;
    }
}
