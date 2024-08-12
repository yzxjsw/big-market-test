package com.yzxjsw.domain.activity.model.entity;

import lombok.Builder;
import lombok.Data;

/**
 * PartakeRaffleActivityEntity
 *
 * @author yezhenxiong
 * @version 2024/08/09 21:35
 **/
@Data
@Builder
public class PartakeRaffleActivityEntity {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

}
