package com.yzxjsw.domain.strategy.service.rule.filter1.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.rule.filter1.IFilterNode;
import com.yzxjsw.domain.strategy.service.rule.filter1.factory.DefaultFilterFactory;
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
@Component("rule_lock")
public class RuleLockFilterNode implements IFilterNode {
    // 模拟用户的抽奖次数
    private Long userRaffleCount = 10L;

    @Resource
    private IStrategyRepository strategyRepository;
    @Override
    public DefaultFilterFactory.ActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleModel) {
        log.info("抽奖后规则过滤-次数锁 userId:{} strategyId:{} awardId:{}",
                userId, strategyId, awardId);
        String ruleValue = strategyRepository.queryStrategyRuleValue(strategyId, awardId, ruleModel);
        // 解锁需要的次数
        long raffleCount = 0L;
        try {
            raffleCount = Long.parseLong(ruleValue);
        } catch (Exception e) {
            throw new RuntimeException("规则过滤-次数锁异常 ruleValue: " + ruleValue + " 配置不正确");
        }
        // 解锁，放行
        if (userRaffleCount >= raffleCount) {
            log.info("奖品可解锁，放行，将由下一结点进行处理");
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
