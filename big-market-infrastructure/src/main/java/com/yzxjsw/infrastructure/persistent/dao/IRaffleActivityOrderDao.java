package com.yzxjsw.infrastructure.persistent.dao;

import cn.bugstack.middleware.db.router.annotation.DBRouter;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import com.yzxjsw.infrastructure.persistent.po.RaffleActivityOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IRaffleActivityOrderDao 抽奖活动订单
 *
 * @author yezhenxiong
 * @version 2024/07/19 15:26
 **/
@Mapper
@DBRouterStrategy(splitTable = true)
public interface IRaffleActivityOrderDao {

    /**
     * 插入订单
     * @param raffleActivityOrder 抽奖活动订单对象
     *
     */
    @DBRouter(key = "userId")
    void insert(RaffleActivityOrder raffleActivityOrder);

    /**
     * 根据用户ID查询订单
     * @param userId 用户ID
     * @return list
     */
    @DBRouter
    List<RaffleActivityOrder> queryRaffleActivityOrderByUserId(String userId);
}
