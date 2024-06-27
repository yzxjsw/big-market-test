package com.yzxjsw.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * StrategyRule 规则
 *
 * @author yezhenxiong
 * @version 2024/06/27 21:45
 **/
@Data
public class StrategyRule {

    /** 自增ID */
    private Long id;

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

    /** 创建时间 */
    private Date createTime;

    /** 更新时间 */
    private Date updateTime;
}
