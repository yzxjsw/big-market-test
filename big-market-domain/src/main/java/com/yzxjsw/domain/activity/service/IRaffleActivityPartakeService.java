package com.yzxjsw.domain.activity.service;

import com.yzxjsw.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.yzxjsw.domain.activity.model.entity.UserRaffleOrderEntity;

/**
 * IRaffleActivityPartakeService 参与活动接口服务
 *
 * @author yezhenxiong
 * @version 2024/08/09 21:34
 **/
public interface IRaffleActivityPartakeService {

    /**
     * 创建抽奖单；用户参与抽奖活动，扣减活动账户库存，产生抽奖单。如存在未被使用的抽奖单则直接返回已存在的抽奖单。
     *
     * @param partakeRaffleActivityEntity 参与抽奖活动实体对象
     * @return 用户抽奖订单实体对象
     */
    UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);

    /**
     *
     * @param userId 用户id
     * @param activityId 活动id
     * @return
     */
    UserRaffleOrderEntity createOrder(String userId, Long activityId);
}
