package com.yzxjsw.domain.rebate.repository;

import com.yzxjsw.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.yzxjsw.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.yzxjsw.domain.rebate.model.valobj.BehaviorTypeVO;
import com.yzxjsw.domain.rebate.model.valobj.DailyBehaviorRebateVO;

import java.util.List;

/**
 * IBehaviorRebateRepository 行为返利仓储接口
 *
 * @author yezhenxiong
 * @version 2024/08/12 20:19
 **/
public interface IBehaviorRebateRepository {
    List<DailyBehaviorRebateVO> queryDailyBehaviorRebateConfig(BehaviorTypeVO behaviorTypeVO);

    void saveUserRebateRecord(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates);

    /**
     * 查询返利订单通过业务防重ID【日期字符串】
     * @param userId 用户ID
     * @param outBusinessNo 业务防重ID
     * @return 两个参数组合下的订单集合。因为一次签到的动作可能对应多种返利。比如sku次数或者是积分
     */
    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);
}
