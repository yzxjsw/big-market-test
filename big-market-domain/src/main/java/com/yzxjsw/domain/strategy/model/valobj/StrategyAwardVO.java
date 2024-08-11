package com.yzxjsw.domain.strategy.model.valobj;

import lombok.*;

/**
 * StrategyAwardVO 策略奖品值对象
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:08
 **/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardVO {
    /** 抽奖奖品ID - 内部流转使用 */
    private Integer awardId;
    /** 规则模型 */
    private String ruleModel;

    @Getter
    @AllArgsConstructor
    public enum LogicModel {

        RULE_DEFAULT("rule_default", "默认抽奖"),
        RULE_BLACKLIST("rule_blacklist", "黑名单抽奖"),
        RULE_WEIGHT("rule_weight", "权重规则"),
        ;

        private final String code;
        private final String info;

    }
}
