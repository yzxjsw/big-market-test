package com.yzxjsw.domain.strategy.service.rule.filter.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.rule.filter.IFilterNode;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;
import com.yzxjsw.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * RuleLuckAwardFilterNode 兜底奖励
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:52
 **/
@Slf4j
@Component("luck")
public class RuleLuckAwardFilterNode implements IFilterNode {

    @Resource
    private IStrategyRepository strategyRepository;

    @Override
    public DefaultFilterFactory.ActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleModel) {
        log.info("【抽奖后规则过滤】-兜底奖品 userId:{} strategyId:{} awardId:{} ruleValue:{}", userId, strategyId, awardId, ruleModel);
        String ruleValue = strategyRepository.queryStrategyRuleValue(strategyId, awardId, ruleModel);
        String[] split = ruleValue.split(Constants.COLON);
        if (split.length == 0) {
            log.error("规则过滤-兜底奖品，兜底奖品未配置告警 userId:{} strategyId:{} awardId:{}", userId, strategyId, awardId);
            throw new RuntimeException("兜底奖品未配置 " + ruleValue);
        }
        // 兜底奖励配置
        Integer luckAwardId = Integer.valueOf(split[0]);
        String awardRuleValue = split.length > 1 ? split[1] : "";
        // 返回兜底奖品
        log.info("规则过滤-兜底奖品 userId:{} strategyId:{} awardId:{} awardRuleValue:{}", userId, strategyId, luckAwardId, awardRuleValue);

        return DefaultFilterFactory.ActionEntity.builder()
                .ruleLogicCheckType(RuleLogicCheckTypeVO.TAKE_OVER)
                .strategyAwardVO(DefaultFilterFactory.StrategyAwardVO.builder()
                        .awardId(awardId)
                        .awardRuleValue(awardRuleValue)
                        .build())
                .build();
    }
}
