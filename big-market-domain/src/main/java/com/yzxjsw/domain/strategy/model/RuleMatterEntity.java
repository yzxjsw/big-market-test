package com.yzxjsw.domain.strategy.model;

import lombok.Data;

/**
 * RuleMatterEntity 规则物料实体对象，用于过滤规则必要的参数信息
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:16
 **/
@Data
public class RuleMatterEntity {
    /** 用户ID */
    private String userId;

    /** 策略ID */
    private Long strategyId;

    /** 抽奖奖品ID */
    private Integer awardId;

    /** 抽奖规则类型 */
    private String ruleModel;
}
