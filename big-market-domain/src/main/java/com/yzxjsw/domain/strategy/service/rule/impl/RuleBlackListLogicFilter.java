package com.yzxjsw.domain.strategy.service.rule.impl;

import com.yzxjsw.domain.strategy.model.RuleActionEntity;
import com.yzxjsw.domain.strategy.model.RuleMatterEntity;
import com.yzxjsw.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.annotation.LogicStrategy;
import com.yzxjsw.domain.strategy.service.rule.ILogicFilter;
import com.yzxjsw.domain.strategy.service.rule.factory.DefaultLogicFactory;
import com.yzxjsw.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;


import javax.annotation.Resource;

/**
 * RuleBlackListLogicFilter 黑名单过滤实现
 *
 * @author yezhenxiong
 * @version 2024/07/02 15:46
 **/

@Slf4j
@Component
@LogicStrategy(logicMode = DefaultLogicFactory.LogicModel.RULE_BLACKLIST)
public class RuleBlackListLogicFilter implements ILogicFilter<RuleActionEntity.RaffleBeforeEntity> {

    @Resource
    private IStrategyRepository strategyRepository;

    @Override
    public RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> filter(RuleMatterEntity ruleMatterEntity) {
        log.info("规则过滤-黑名单 userId:{} strategyId:{} ruleModel:{}",
                ruleMatterEntity.getUserId(), ruleMatterEntity.getStrategyId(), ruleMatterEntity.getRuleModel());
        String userId = ruleMatterEntity.getUserId();

        // 查询抽奖策略配置的黑名单规则值 rule_value
        String ruleValue = strategyRepository.queryStrategyRuleValue(ruleMatterEntity.getStrategyId(), ruleMatterEntity.getAwardId(),
                ruleMatterEntity.getRuleModel());
        String[] splitRuleValue = ruleValue.split(Constants.COLON);
        Integer awardId = Integer.parseInt(splitRuleValue[0]);

        // 判断物料中的 userId 是否配置在黑名单中，在：接管 TAKE_OVER
        String[] userBlackIds = splitRuleValue[1].split(Constants.SPLIT);
        for (String userBlackId : userBlackIds) {
            if (userId.equals(userBlackId)) {
                return RuleActionEntity.<RuleActionEntity.RaffleBeforeEntity>builder()
                        .ruleModel(DefaultLogicFactory.LogicModel.RULE_BLACKLIST.getCode())
                        .data(RuleActionEntity.RaffleBeforeEntity.builder()
                                .strategyId(ruleMatterEntity.getStrategyId())
                                .awardId(awardId)
                                .build())
                        .code(RuleLogicCheckTypeVO.TAKE_OVER.getCode())
                        .info(RuleLogicCheckTypeVO.TAKE_OVER.getInfo())
                        .build();
            }
        }
        return RuleActionEntity.<RuleActionEntity.RaffleBeforeEntity>builder()
                .code(RuleLogicCheckTypeVO.ALLOW.getCode())
                .info(RuleLogicCheckTypeVO.ALLOW.getInfo())
                .build();
    }
}
