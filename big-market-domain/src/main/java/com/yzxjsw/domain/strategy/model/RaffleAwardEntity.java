package com.yzxjsw.domain.strategy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * RaffleAwardEntity 抽奖奖品实体
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:10
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleAwardEntity {

    ///** 抽奖策略Id */
    //private Long strategyId;

    /** 抽奖奖品id */
    private Integer awardId;

    ///** 奖品对接标识，每一个都有对应得发奖策略 */
    //private String awardKey;

    /** 奖品配置信息*/
    private String awardConfig;

    ///** 奖品内容描述 */
    //private String awardDesc;

    /** 奖品顺序号*/
    private Integer sort;
}
