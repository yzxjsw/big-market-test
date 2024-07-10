package com.yzxjsw.domain.strategy.service.rule.tree.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * RuleLuckAwardLogicTreeNode 幸运兜底奖励结点
 *
 * @author yezhenxiong
 * @version 2024/07/09 15:02
 **/
@Slf4j
@Component("rule_luck_award")
public class RuleLuckAwardLogicTreeNode implements ILogicTreeNode {
    @Override
    public DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Integer awardId) {
        return DefaultTreeFactory.TreeActionEntity.builder()
                .ruleLogicCheckType(RuleLogicCheckTypeVO.TAKE_OVER)
                .strategyAwardData(DefaultTreeFactory.StrategyAwardVO.builder()
                        .awardId(101)
                        .awardRuleValue("1,100")
                        .build())
                .build();
    }
}
