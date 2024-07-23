package com.yzxjsw.domain.activity.service.rule;

/**
 * IActionChainArmory 责任链装配
 *
 * @author yezhenxiong
 * @version 2024/07/22 16:21
 **/
public interface IActionChainArmory {

    IActionChain next();

    IActionChain appendNext(IActionChain next);
}
