package com.yzxjsw.domain.activity.service.rule;

import com.yzxjsw.domain.activity.model.entity.ActivityCountEntity;
import com.yzxjsw.domain.activity.model.entity.ActivityEntity;
import com.yzxjsw.domain.activity.model.entity.ActivitySkuEntity;

/**
 * IActionChain 下单规则过滤接口
 *
 * @author yezhenxiong
 * @version 2024/07/22 16:20
 **/
public interface IActionChain extends IActionChainArmory{
    boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);
}
