package com.yzxjsw.domain.strategy.service.rule.tree.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * RuleStockLogicTreeNode 库存扣减结点
 *
 * @author yezhenxiong
 * @version 2024/07/09 15:04
 **/
@Slf4j
@Component("rule_stock")
public class RuleStockLogicTreeNode implements ILogicTreeNode {

    @Override
    public DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Integer awardId) {
        return DefaultTreeFactory.TreeActionEntity.builder()
                .ruleLogicCheckType(RuleLogicCheckTypeVO.TAKE_OVER)
                .build();
    }

}