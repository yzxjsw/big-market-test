package com.yzxjsw.domain.strategy.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * StrategyAwardStockVO 策略奖品库存Key
 *
 * @author yezhenxiong
 * @version 2024/07/10 14:28
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardStockKeyVO {

    // 策略ID
    private Long strategyId;
    // 奖品ID
    private Integer awardId;

}
