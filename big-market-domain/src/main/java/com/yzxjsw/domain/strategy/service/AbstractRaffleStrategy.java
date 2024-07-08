package com.yzxjsw.domain.strategy.service;

import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.model.RuleActionEntity;
import com.yzxjsw.domain.strategy.model.StrategyEntity;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import com.yzxjsw.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.IRaffleStrategy;
import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import com.yzxjsw.domain.strategy.service.rule.chain.ILogicChain;
import com.yzxjsw.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.yzxjsw.domain.strategy.service.rule.filter.ILogicFilter;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultLogicFactory;
import com.yzxjsw.types.enums.ResponseCode;
import com.yzxjsw.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * AbstractRaffleStrategy 抽奖策略抽象类
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:14
 **/
@Slf4j
public abstract class AbstractRaffleStrategy implements IRaffleStrategy {

    protected IStrategyRepository repository;

    protected IStrategyDispatch strategyDispatch;

    private final DefaultChainFactory defaultChainFactory;

    public AbstractRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch, DefaultChainFactory defaultChainFactory) {
        this.repository = repository;
        this.strategyDispatch = strategyDispatch;
        this.defaultChainFactory = defaultChainFactory;
    }

    @Override
    public RaffleAwardEntity performRaffle(RaffleFactorEntity raffleFactorEntity) {

        // 1. 参数校验
        String userId = raffleFactorEntity.getUserId();
        Long strategyId = raffleFactorEntity.getStrategyId();
        if (null == strategyId || StringUtils.isBlank(userId)) {
            throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
        }
        // 2. 获取责任链
        ILogicChain logicChain = defaultChainFactory.openLogicChain(strategyId);

        // 3. 通过责任链进行抽奖前规则过滤, 【得到奖品】
        Integer awardId = logicChain.logic(userId, strategyId);

        //// 2. 抽奖策略查询 【这部分代码通过过滤实现】
        //StrategyEntity strategy = repository.queryStrategyEntityByStrategyId(strategyId);
        //
        //// 3. 抽奖前 - 规则过滤
        //RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> ruleActionEntity =
        //        this.doCheckRaffleBeforeLogic(RaffleFactorEntity.builder().userId(userId).strategyId(strategyId).build(), strategy.ruleModels());
        //
        //if (RuleLogicCheckTypeVO.TAKE_OVER.getCode().equals(ruleActionEntity.getCode())) {
        //    if (DefaultLogicFactory.LogicModel.RULE_BLACKLIST.getCode().equals(ruleActionEntity.getRuleModel())) {
        //        // 黑名单返回固定的奖品ID
        //        return RaffleAwardEntity.builder()
        //                .awardId(ruleActionEntity.getData().getAwardId())
        //                .build();
        //    } else if (DefaultLogicFactory.LogicModel.RULE_WIGHT.getCode().equals(ruleActionEntity.getRuleModel())) {
        //        // 权重根据返回的信息进行抽奖
        //        RuleActionEntity.RaffleBeforeEntity raffleBeforeEntity = ruleActionEntity.getData();
        //        String ruleWeightValueKey = raffleBeforeEntity.getRuleWeightValueKey();
        //        Integer awardId = strategyDispatch.getRandomAwardId(strategyId, ruleWeightValueKey);
        //        return RaffleAwardEntity.builder()
        //                .awardId(awardId)
        //                .build();
        //    }
        //}
        //
        //// 4. 默认抽奖流程
        //Integer awardId = strategyDispatch.getRandomAwardId(strategyId);

        // 5. 过滤抽奖中的规则
        // 5.1 查询奖品配置那些规则
        StrategyAwardRuleModelVO strategyAwardRuleModelVO = repository.queryStrategyAwardRuleModel(strategyId, awardId);

        // 奖品没有配置规则 null or ""
        if (StringUtils.isBlank(strategyAwardRuleModelVO.getRuleModels())) {
            return RaffleAwardEntity.builder()
                    .awardId(awardId)
                    .build();
        }

        RuleActionEntity<RuleActionEntity.RaffleCenterEntity> raffleActionCenterEntity = this.doCheckRaffleCenterLogic(RaffleFactorEntity.builder()
                .userId(userId)
                .strategyId(strategyId)
                .awardId(awardId)
                .build(), strategyAwardRuleModelVO.raffleCenterRuleModelList());

        if (RuleLogicCheckTypeVO.TAKE_OVER.getCode().equals(raffleActionCenterEntity.getCode())) {
            log.info("[临时日志] 中奖中规则拦截，通过抽奖后规则 rule_luck_award 走兜底奖励");
            return RaffleAwardEntity.builder()
                    .awardDesc("中奖中规则拦截，通过抽奖后规则 rule_luck_award 走兜底奖励")
                    .build();
        }

        return RaffleAwardEntity.builder()
                .awardId(awardId)
                .build();
    }

    protected abstract RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> doCheckRaffleBeforeLogic(RaffleFactorEntity raffleFactorEntity, String[] logics);
    protected abstract RuleActionEntity<RuleActionEntity.RaffleCenterEntity> doCheckRaffleCenterLogic(RaffleFactorEntity raffleFactorEntity, String[] logics);
}
