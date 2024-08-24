package com.yzxjsw.trigger.api.dto;

import lombok.Data;

/**
 * RaffleAwardListRequestDTO
 *
 * @author yezhenxiong
 * @version 2024/07/15 14:40
 **/
@Data
public class RaffleAwardListRequestDTO {

    // 抽奖策略ID
    @Deprecated
    private Long strategyId;

    // 用户ID
    private String userId;
    // 抽奖活动ID
    private Long activityId;

}
