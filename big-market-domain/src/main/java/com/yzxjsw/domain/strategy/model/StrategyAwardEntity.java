package com.yzxjsw.domain.strategy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * StrategyEntity 策略奖品实体
 *
 * @author yezhenxiong
 * @version 2024/06/28 15:17
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StrategyAwardEntity {
    /** 抽奖策略Id */
    private Long strategyId;

    /** 抽奖奖品id */
    private Integer awardId;

    /** 奖品总库存 */
    private Integer awardCount;

    /** 奖品剩余库存 */
    private Integer awardCountSurplus;

    /** 奖品中奖概率 */
    private BigDecimal awardRate;




}
