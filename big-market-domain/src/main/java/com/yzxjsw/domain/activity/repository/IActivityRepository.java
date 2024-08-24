package com.yzxjsw.domain.activity.repository;

import com.yzxjsw.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.yzxjsw.domain.activity.model.aggregate.CreateQuotaOrderAggregate;
import com.yzxjsw.domain.activity.model.entity.*;
import com.yzxjsw.domain.activity.model.valobj.ActivitySkuStockKeyVO;

import java.util.Date;
import java.util.List;

/**
 * IActivityRepository 抽奖活动仓储接口
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:33
 **/
public interface IActivityRepository {
    /**
     *
     * @param sku ID
     * @return 活动sku实体
     */
    ActivitySkuEntity queryActivitySku(Long sku);

    /**
     *
     * @param activityId 活动ID
     * 存在缓存
     * @return 活动实体
     */
    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);

    void saveOrder(CreateQuotaOrderAggregate createQuotaOrderAggregate);

    /**
     *
     * @param key sku
     * @param stockCount sku 的库存数量
     */
    void cacheActivitySkuStockCount(String key, Integer stockCount);

    /**
     *
     * @param sku ID
     * @param key 缓存key
     * @param endDateTime 活动结束后删除key的时间
     * @return 扣减库存的结果
     */
    boolean subtractionActivitySkuStock(Long sku, String key, Date endDateTime);

    void activitySkuStockConsumeSendQueue(ActivitySkuStockKeyVO activitySkuStockKeyVO);

    ActivitySkuStockKeyVO takeQueueValue();

    void clearQueueValue();

    void updateActivitySkuStock(Long sku);

    void clearActivitySkuStock(Long sku);

    /**
     * 保存参与活动的聚合对象【账户、抽奖单】
     * @param createPartakeOrderAggregate 聚合对象
     */
    void saveCreatePartakeOrderAggregate(CreatePartakeOrderAggregate createPartakeOrderAggregate);

    UserRaffleOrderEntity queryNoUsedRaffleOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);

    ActivityAccountEntity queryActivityAccountByUserId(String userId, Long activityId);

    ActivityAccountMonthEntity queryActivityAccountMonthByUserId(String userId, Long activityId, String month);

    ActivityAccountDayEntity queryActivityAccountDayByUserId(String userId, Long activityId, String day);

    List<ActivitySkuEntity> queryActivitySkuListByActivityId(Long activityId);

    Integer queryRaffleActivityAccountPartakeCount(Long activityId, String userId);

    Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId);

    ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId);
}
