package com.yzxjsw.trigger.api.dto;

import lombok.Data;

/**
 * ActivityDrawRequestDTO 活动抽奖请求的DTO（data transfer object）
 *
 * @author yezhenxiong
 * @version 2024/08/11 13:56
 **/
@Data
public class ActivityDrawRequestDTO {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

}

