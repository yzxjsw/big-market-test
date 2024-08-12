package com.yzxjsw.domain.strategy.service.rule.filter.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.rule.filter.IFilterNode;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * RuleLockFilterNode 奖品加锁结点
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:49
 **/
@Slf4j
@Component("lock")
public class RuleLockFilterNode implements IFilterNode {

    @Resource
    private IStrategyRepository strategyRepository;
    @Override
    public DefaultFilterFactory.ActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleModel) {
        log.info("【抽奖后规则过滤】-次数锁 userId:{} strategyId:{} awardId:{}",
                userId, strategyId, awardId);
        String ruleValue = strategyRepository.queryStrategyRuleValue(strategyId, awardId, ruleModel);
        // 解锁需要的次数
        long raffleCount = 0L;
        try {
            raffleCount = Long.parseLong(ruleValue);
        } catch (Exception e) {
            throw new RuntimeException("规则过滤-次数锁异常 ruleValue: " + ruleValue + " 配置不正确");
        }

        // 查询用户抽奖次数 - 当天的；策略ID:活动ID 1:1 的配置，可以直接用 strategyId 查询。
        Integer userRaffleCount = strategyRepository.queryTodayUserRaffleCount(userId, strategyId);
        // 解锁，放行
        if (userRaffleCount >= raffleCount) {
            return DefaultFilterFactory.ActionEntity.builder()
                    .ruleLogicCheckType(RuleLogicCheckTypeVO.ALLOW)
                    .build();
        }

        // 未达到解锁条件，拦截
        return DefaultFilterFactory.ActionEntity.builder()
                .ruleLogicCheckType(RuleLogicCheckTypeVO.TAKE_OVER)
                .build();
    }
}
