package com.yzxjsw.domain.strategy.service.rule.filter1.factory;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.service.rule.filter1.IFilterNode;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * DefaultFilterFactory 过滤工厂
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:46
 **/
@Service
public class DefaultFilterFactory {

    private final Map<String, IFilterNode> filterNodeMap;

    public DefaultFilterFactory(Map<String, IFilterNode> filterNodeMap) {
        this.filterNodeMap = filterNodeMap;
    }

    /**
     *
     * @param filterNodeName filter 的名称
     * @return 具体的对象
     */
    public IFilterNode getFilterNode(String filterNodeName) {
        return filterNodeMap.get(filterNodeName);
    }

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class ActionEntity {
        private RuleLogicCheckTypeVO ruleLogicCheckType;
        private DefaultFilterFactory.StrategyAwardVO strategyAwardVO;
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
