package com.yzxjsw.domain.activity.service;

import com.yzxjsw.domain.activity.model.entity.ActivityCountEntity;
import com.yzxjsw.domain.activity.model.entity.ActivityEntity;
import com.yzxjsw.domain.activity.model.entity.ActivitySkuEntity;
import com.yzxjsw.domain.activity.repository.IActivityRepository;
import com.yzxjsw.domain.activity.service.rule.factory.DefaultActivityChainFactory;

/**
 * RaffleActivitySupport
 * 抽奖活动的支撑类
 * @author yezhenxiong
 * @version 2024/07/22 16:16
 **/
public class RaffleActivitySupport {
    protected DefaultActivityChainFactory defaultActivityChainFactory;

    protected IActivityRepository activityRepository;

    public RaffleActivitySupport(IActivityRepository activityRepository, DefaultActivityChainFactory defaultActivityChainFactory) {
        this.activityRepository = activityRepository;
        this.defaultActivityChainFactory = defaultActivityChainFactory;
    }

    public ActivitySkuEntity queryActivitySku(Long sku) {
        return activityRepository.queryActivitySku(sku);
    }

    public ActivityEntity queryRaffleActivityByActivityId(Long activityId) {
        return activityRepository.queryRaffleActivityByActivityId(activityId);
    }

    public ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId) {
        return activityRepository.queryRaffleActivityCountByActivityCountId(activityCountId);
    }

}
