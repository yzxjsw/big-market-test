package com.yzxjsw.domain.activity.service.armory;

import java.util.Date;

/**
 * IActivityDispatch 活动调度
 *
 * @author yezhenxiong
 * @version 2024/07/26 15:02
 **/
public interface IActivityDispatch {
    /**
     * 根据策略ID和奖品ID，扣减奖品缓存库存
     *
     * @param sku 活动SKU
     * @param endDateTime 活动结束时间，根据结束时间设置加锁的key为结束时间
     * @return 扣减结果
     */
    boolean subtractionActivitySkuStock(Long sku, Date endDateTime);
}
