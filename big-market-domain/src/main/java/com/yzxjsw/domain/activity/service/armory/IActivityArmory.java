package com.yzxjsw.domain.activity.service.armory;

/**
 * IActivityArmory 活动装配预热
 *
 * @author yezhenxiong
 * @version 2024/07/26 14:51
 **/
public interface IActivityArmory {

    /**
     * 装配具体的一个sku
     * @param sku 编号
     * @return 是否装配成功
     */
    boolean assembleActivitySku(Long sku);

    /**
     * 将这个活动上配置的sku都进行装配
     * @param activityId 活动id
     * @return 是否装配成功
     */
    boolean assembleActivitySkuByActivityId(Long activityId);
}
