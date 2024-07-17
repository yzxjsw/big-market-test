package com.yzxjsw.domain.strategy.service.rule.tree.factory;

import com.yzxjsw.domain.strategy.model.valobj.RuleTreeVO;
import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.engine.impl.DecisionTreeEngine;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * DefaultTreeFactory 规则树工厂
 *
 * @author yezhenxiong
 * @version 2024/07/09 14:49
 **/
@Service
public class DefaultTreeFactory {

    private final Map<String, ILogicTreeNode> logicTreeNodeGroup;

    public DefaultTreeFactory(Map<String, ILogicTreeNode> logicTreeNodeGroup) {
        this.logicTreeNodeGroup = logicTreeNodeGroup;
    }

    public IDecisionTreeEngine openLogicTree(RuleTreeVO ruleTreeVO) {
        return new DecisionTreeEngine(logicTreeNodeGroup, ruleTreeVO);
    }

    /**
     * 决策树个动作实习
     */
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class TreeActionEntity {
        private RuleLogicCheckTypeVO ruleLogicCheckType;
        private StrategyAwardVO strategyAwardVO;
    }

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class StrategyAwardVO {
        /**
         * 抽奖奖品ID - 内部流转使用
         */
        private Integer awardId;
        /**
         * 抽奖奖品规则
         */
        private String awardRuleValue;
    }
}
