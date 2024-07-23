package com.yzxjsw.domain.activity.service;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.activity.model.aggregate.CreateOrderAggregate;
import com.yzxjsw.domain.activity.model.entity.*;
import com.yzxjsw.domain.activity.repository.IActivityRepository;
import com.yzxjsw.domain.activity.service.rule.IActionChain;
import com.yzxjsw.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import com.yzxjsw.types.enums.ResponseCode;
import com.yzxjsw.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * AbstractRaffleActivity 抽奖活动抽象类，定义标准流程
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:30
 **/
@Slf4j
public abstract class AbstractRaffleActivity extends RaffleActivitySupport implements IRaffleOrder {

    public AbstractRaffleActivity(IActivityRepository activityRepository, DefaultActivityChainFactory defaultActivityChainFactory) {
        super(activityRepository, defaultActivityChainFactory);
    }


    @Override
    public String createSkuRechargeOrder(SkuRechargeEntity skuRechargeEntity) {
        // 1. 参数校验
        Long sku = skuRechargeEntity.getSku();
        String userId = skuRechargeEntity.getUserId();
        String outBusinessNo = skuRechargeEntity.getOutBusinessNo();
        if (null == sku || StringUtils.isBlank(userId) || StringUtils.isBlank(outBusinessNo)) {
            throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
        }
        // 2. 查询基础信息
        // 2.1 通过sku查询活动信息
        ActivitySkuEntity activitySkuEntity = queryActivitySku(sku);
        // 2.2 查询活动信息
        ActivityEntity activityEntity = queryRaffleActivityByActivityId(activitySkuEntity.getActivityId());
        // 2.3 查询次数信息（用户在活动上可参与的次数）
        ActivityCountEntity activityCountEntity = queryRaffleActivityCountByActivityCountId(activitySkuEntity.getActivityCountId());

        // 3. 活动的规则校验 #TODO
        IActionChain actionChain = defaultActivityChainFactory.openActionChain();
        boolean success = actionChain.action(activitySkuEntity, activityEntity, activityCountEntity);

        // 4. 构建订单聚合对象
        CreateOrderAggregate createOrderAggregate = buildOrderAggregate(skuRechargeEntity, activitySkuEntity, activityEntity, activityCountEntity);
        // 5. 保存订单
        doSaveOrder(createOrderAggregate);
        // 6. 返回单号
        return createOrderAggregate.getActivityOrderEntity().getOrderId();
    }

    protected abstract CreateOrderAggregate buildOrderAggregate(SkuRechargeEntity skuRechargeEntity, ActivitySkuEntity activitySkuEntity,
                                                     ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) ;
    protected abstract void doSaveOrder(CreateOrderAggregate createOrderAggregate);
}

