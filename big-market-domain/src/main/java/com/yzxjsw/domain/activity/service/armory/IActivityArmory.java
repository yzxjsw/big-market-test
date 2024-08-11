package com.yzxjsw.domain.activity.service.armory;

/**
 * IActivityArmory 活动装配预热
 *
 * @author yezhenxiong
 * @version 2024/07/26 14:51
 **/
public interface IActivityArmory {

    /**
     *
     * @param sku 编号
     * @return 是否装配成功
     */
    boolean assembleActivitySku(Long sku);
}
