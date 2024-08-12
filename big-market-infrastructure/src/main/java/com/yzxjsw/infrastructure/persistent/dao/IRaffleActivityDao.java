package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.RaffleActivity;
import org.apache.ibatis.annotations.Mapper;

/**
 * IRaffleActivity 抽奖活动
 *
 * @author yezhenxiong
 * @version 2024/07/19 15:28
 **/
@Mapper
public interface IRaffleActivityDao {
    /**
     * 根据活动ID查询活动信息
     * @param activityId 活动ID
     * @return RaffleActivity
     */
    RaffleActivity queryRaffleActivityByActivityId(Long activityId);

    /**
     * 根据活动ID查询配置的策略ID
     * @param activityId 活动ID
     * @return 策略ID
     */
    Long queryStrategyIdByActivityId(Long activityId);

    Long queryActivityIdByStrategyId(Long strategyId);
}
