package com.yzxjsw.domain.activity.service.armory;

import com.yzxjsw.domain.activity.model.entity.ActivitySkuEntity;
import com.yzxjsw.domain.activity.repository.IActivityRepository;
import com.yzxjsw.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * ActivityArmory 活动装配
 *
 * @author yezhenxiong
 * @version 2024/07/26 14:51
 **/
@Slf4j
@Service
public class ActivityArmory implements IActivityArmory, IActivityDispatch{

    @Resource
    private IActivityRepository activityRepository;
    @Override
    public boolean assembleActivitySku(Long sku) {
        // 预热活动sku库存
        ActivitySkuEntity activitySkuEntity = activityRepository.queryActivitySku(sku);
        cacheActivitySkuStockCount(sku, activitySkuEntity.getStockCount());

        // 预热活动【查询时预热到缓存】
        activityRepository.queryRaffleActivityByActivityId(activitySkuEntity.getActivityId());

        // 预热活动次数【查询时预热到缓存】
        activityRepository.queryRaffleActivityCountByActivityCountId(activitySkuEntity.getActivityCountId());

        return true;
    }

    @Override
    public boolean assembleActivitySkuByActivityId(Long activityId) {
        List<ActivitySkuEntity> activitySkuEntities = activityRepository.queryActivitySkuListByActivityId(activityId);
        for (ActivitySkuEntity activitySkuEntity : activitySkuEntities) {
            cacheActivitySkuStockCount(activitySkuEntity.getSku(), activitySkuEntity.getStockCountSurplus());
            // 预热活动次数【查询时预热到缓存】
            activityRepository.queryRaffleActivityCountByActivityCountId(activitySkuEntity.getActivityCountId());
        }

        // 预热活动【查询时预热到缓存】
        activityRepository.queryRaffleActivityByActivityId(activityId);

        return true;
    }

    /**
     * 缓存活动sku库存数量
     * @param sku sku id
     * @param stockCount 库存数量
     */
    private void cacheActivitySkuStockCount(Long sku, Integer stockCount) {
        String key = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        activityRepository.cacheActivitySkuStockCount(key, stockCount);
    }

    @Override
    public boolean subtractionActivitySkuStock(Long sku, Date endDateTime) {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        return activityRepository.subtractionActivitySkuStock(sku, cacheKey, endDateTime);
    }
}
