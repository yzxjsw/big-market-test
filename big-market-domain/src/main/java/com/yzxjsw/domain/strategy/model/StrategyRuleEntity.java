package com.yzxjsw.domain.strategy.model;

import com.yzxjsw.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * StrategyRuleEntity 抽奖策略规则实体
 *
 * @author yezhenxiong
 * @version 2024/07/01 14:26
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyRuleEntity {

    /** 抽奖策略id */
    private Long strategyId;

    /** 抽奖奖品id */
    private Integer awardId;

    /** 抽奖规则类型【1-策略规则，2-奖品规则】 */
    private Integer ruleType;

    /** 抽奖规则类型
     * 【rule_random - 随机值计算、
     * rule_lock - 抽奖几次后解锁、
     * rule_luck_award - 幸运奖(兜底奖品)】 */
    private String ruleModel;

    /** 抽奖规则比值' */
    private String ruleValue;

    /** 抽奖规则描述 */
    private String ruleDesc;

    public Map<String, List<Integer>> getRuleWeightValues() {
        if (!"rule_weight".equals(ruleModel)) {
            return null;
        }
        String[] ruleValueGroups = ruleValue.split(Constants.SPACE);
        Map<String, List<Integer>> resultMap = new HashMap<>();
        for (String ruleValueGroup : ruleValueGroups) {
            // 检查输入是否为空
            if (ruleValueGroup == null || ruleValueGroup.isEmpty()) {
                return resultMap;
            }
            String[] parts = ruleValueGroup.split(Constants.COLON);
            if (parts.length != 2) {
                throw new IllegalArgumentException("rule_weight rule_rule invalid input format" + ruleValueGroup);
            }

            // 解析值
            String[] valueStrings = parts[1].split(Constants.SPLIT);
            List<Integer> values = new ArrayList<>();
            for (String valueString : valueStrings) {
                values.add(Integer.parseInt(valueString));
            }
            // 将键和值放入Map中
            resultMap.put(ruleValueGroup, values);
        }
        return resultMap;
    }
}
