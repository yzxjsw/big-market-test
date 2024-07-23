package com.yzxjsw.domain.activity.service.rule.impl;

import com.yzxjsw.domain.activity.model.entity.ActivityCountEntity;
import com.yzxjsw.domain.activity.model.entity.ActivityEntity;
import com.yzxjsw.domain.activity.model.entity.ActivitySkuEntity;
import com.yzxjsw.domain.activity.service.rule.AbstractActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * ActivityBaseActionChain 活动规则过滤 【日期，状态】
 *
 * @author yezhenxiong
 * @version 2024/07/22 16:24
 **/
@Slf4j
@Component("activity_base_action")
public class ActivityBaseActionChain extends AbstractActionChain {

    @Override
    public boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {

        log.info("活动责任链-基础信息【有效期、状态】校验开始。");

        return next().action(activitySkuEntity, activityEntity, activityCountEntity);
    }

}
