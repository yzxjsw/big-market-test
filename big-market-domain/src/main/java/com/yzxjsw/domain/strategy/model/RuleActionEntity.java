package com.yzxjsw.domain.strategy.model;

import com.yzxjsw.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import lombok.*;

/**
 * RuleActionEntity 过滤完成后动作实体
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:19
 **/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleActionEntity<T extends RuleActionEntity.RaffleEntity>{

    private String code = RuleLogicCheckTypeVO.ALLOW.getCode();
    private String info = RuleLogicCheckTypeVO.ALLOW.getInfo();
    private String ruleModel;
    private T data;

    static public class RaffleEntity {
    }

    // 抽奖之前
    @EqualsAndHashCode(callSuper = true)
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    static public class RaffleBeforeEntity extends RaffleEntity {
        /**
         * 策略ID
         */
        private Long strategyId;

        /**
         * 权重值Key；用于抽奖时可以选择权重抽奖。
         */
        private String ruleWeightValueKey;

        /**
         * 奖品ID；
         */
        private Integer awardId;
    }

    /** 抽奖中 */

    static public class RaffleCenterEntity extends RaffleEntity {

    }

    /** 抽奖后 */
    static public class RaffleAfterEntity extends RaffleEntity {

    }
}
