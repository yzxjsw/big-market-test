package com.yzxjsw.domain.strategy.service.rule.chain.impl;

import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import com.yzxjsw.domain.strategy.service.rule.chain.AbstractLogicChain;
import com.yzxjsw.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * DefaultLogicChain 兜底责任链节点
 *
 * @author yezhenxiong
 * @version 2024/07/08 15:14
 **/
@Slf4j
@Component("default")
public class DefaultLogicChain extends AbstractLogicChain {

    @Resource
    protected IStrategyDispatch strategyDispatch;

    @Override
    public DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId) {
        Integer awardId = strategyDispatch.getRandomAwardId(strategyId); // 执行全量抽奖
        log.info("抽奖责任链-默认处理【兜底】：userId:{}, strategyId:{}, ruleModel:{}, awardId:{}",
                userId, strategyId, ruleModel(), awardId);
        return DefaultChainFactory.StrategyAwardVO.builder()
                .awardId(awardId)
                .logicModel(ruleModel())
                .build();
    }

    @Override
    protected String ruleModel() {
        return DefaultChainFactory.LogicModel.RULE_DEFAULT.getCode();
    }
}
