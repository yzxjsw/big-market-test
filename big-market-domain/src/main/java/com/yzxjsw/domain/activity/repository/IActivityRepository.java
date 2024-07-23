package com.yzxjsw.domain.activity.repository;

import com.yzxjsw.domain.activity.model.aggregate.CreateOrderAggregate;
import com.yzxjsw.domain.activity.model.entity.ActivityCountEntity;
import com.yzxjsw.domain.activity.model.entity.ActivityEntity;
import com.yzxjsw.domain.activity.model.entity.ActivitySkuEntity;

/**
 * IActivityRepository 抽奖活动仓储接口
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:33
 **/
public interface IActivityRepository {
    ActivitySkuEntity queryActivitySku(Long sku);

    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);

    void saveOrder(CreateOrderAggregate createOrderAggregate);
}
