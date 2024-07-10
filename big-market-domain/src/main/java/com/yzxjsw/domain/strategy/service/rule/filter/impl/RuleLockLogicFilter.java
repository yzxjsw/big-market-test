package com.yzxjsw.domain.strategy.service.rule.filter.impl;

import com.yzxjsw.domain.strategy.model.RuleActionEntity;
import com.yzxjsw.domain.strategy.model.RuleMatterEntity;
import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.annotation.LogicStrategy;
import com.yzxjsw.domain.strategy.service.rule.filter.ILogicFilter;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultLogicFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * RuleLockLogicFilter 用户抽奖n次后，对应奖品可解锁
 *
 * @author yezhenxiong
 * @version 2024/07/07 17:54
 **/
@Slf4j
@Component
@LogicStrategy(logicMode = DefaultLogicFactory.LogicModel.RULE_LOCK)
public class RuleLockLogicFilter implements ILogicFilter<RuleActionEntity.RaffleCenterEntity> {

    @Resource
    private IStrategyRepository strategyRepository;

    private Long userRaffleCount = 0L;


    @Override
    public RuleActionEntity<RuleActionEntity.RaffleCenterEntity> filter(RuleMatterEntity ruleMatterEntity) {
        log.info("规则过滤-次数锁 userId:{}, strategyId:{}, ruleModel:{}",
                ruleMatterEntity.getUserId(), ruleMatterEntity.getStrategyId(), ruleMatterEntity.getRuleModel());

        String ruleValue = strategyRepository.queryStrategyRuleValue(ruleMatterEntity.getStrategyId(), ruleMatterEntity.getAwardId(), ruleMatterEntity.getRuleModel());
        long raffleCount = Long.parseLong(ruleValue);

        // 用户抽奖次数大于该奖品配置的所需的抽奖解锁次数
        if (userRaffleCount >= raffleCount) {
            return RuleActionEntity.<RuleActionEntity.RaffleCenterEntity>builder()
                    .code(RuleLogicCheckTypeVO.ALLOW.getCode())
                    .info(RuleLogicCheckTypeVO.ALLOW.getInfo())
                    .build();
        }

        // 接管
        return RuleActionEntity.<RuleActionEntity.RaffleCenterEntity>builder()
                .code(RuleLogicCheckTypeVO.TAKE_OVER.getCode())
                .info(RuleLogicCheckTypeVO.TAKE_OVER.getInfo())
                .build();
    }
}
