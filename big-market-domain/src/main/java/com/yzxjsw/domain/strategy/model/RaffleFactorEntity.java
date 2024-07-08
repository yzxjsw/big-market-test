package com.yzxjsw.domain.strategy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * RaffleFactorEntity 抽奖因子,抽奖入参
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:08
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RaffleFactorEntity {
    /**
     * 用户id
     */
    private String userId;

    /**
     * 抽奖策略id
     */
    private Long strategyId;

    /**
     * 奖品ID
     *
     */
    private Integer awardId;
}
