package com.yzxjsw.infrastructure.persistent.dao;


import com.yzxjsw.infrastructure.persistent.po.DailyBehaviorRebate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 *
 * @author yezhenxiong
 * @description 日常行为返利活动配置
 * @create 2024-04-30 13:48
 */
@Mapper
public interface IDailyBehaviorRebateDao {

    /**
     *
     * @param behaviorType
     * @return
     */
    List<DailyBehaviorRebate> queryDailyBehaviorRebateByBehaviorType(String behaviorType);

}
