package com.yzxjsw.domain.strategy.service;

import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import com.yzxjsw.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
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
public abstract class AbstractRaffleStrategy implements IRaffleStrategy{

    protected IStrategyRepository repository;

    protected IStrategyDispatch strategyDispatch;

    // 抽奖的责任链 -> 从抽奖的规则中，解耦出前置规则为责任链处理
    protected final DefaultChainFactory defaultChainFactory;
    // 抽奖的决策树 -> 负责抽奖中到抽奖后的规则过滤，如抽奖到A奖品ID，之后要做次数的判断和库存的扣减等。
    protected final DefaultTreeFactory defaultTreeFactory;

    protected final DefaultFilterFactory defaultFilterFactory;

    public AbstractRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch, DefaultChainFactory defaultChainFactory, DefaultTreeFactory defaultTreeFactory, DefaultFilterFactory defaultFilterFactory) {
        this.repository = repository;
        this.strategyDispatch = strategyDispatch;
        this.defaultChainFactory = defaultChainFactory;
        this.defaultTreeFactory = defaultTreeFactory;
        this.defaultFilterFactory = defaultFilterFactory;
    }

    @Override
    public RaffleAwardEntity performRaffle(RaffleFactorEntity raffleFactorEntity) {

        // 1. 参数校验
        String userId = raffleFactorEntity.getUserId();
        Long strategyId = raffleFactorEntity.getStrategyId();
        if (null == strategyId || StringUtils.isBlank(userId)) {
            throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
        }

        // 2. 责任链抽奖计算【这步拿到的是初步的抽奖ID，之后需要根据ID处理抽奖】注意；黑名单、权重等非默认抽奖的直接返回抽奖结果
        DefaultChainFactory.StrategyAwardVO chainStrategyAwardVO = this.raffleLogicChain(userId, strategyId);
        log.info("抽奖策略计算-责任链 userId: {}, strategyId: {} awardId: {}, ruleModel: {}",
                userId, strategyId, chainStrategyAwardVO.getAwardId(), chainStrategyAwardVO.getLogicModel());

        // 如果是黑名单的固定奖品，库存没有限制，直接返回
        if (DefaultChainFactory.LogicModel.RULE_BLACKLIST.getCode().equals(chainStrategyAwardVO.getLogicModel())) {
            return buildRaffleAwardEntity(strategyId, chainStrategyAwardVO.getAwardId(), null);
        }
        // 3. raffleAfterHandle 抽奖后处理
        DefaultFilterFactory.StrategyAwardVO strategyAwardVO = raffleAfterHandle(userId, strategyId, chainStrategyAwardVO.getAwardId());
        log.info("抽奖策略计算-抽奖后处理 {} {} {} {}", userId, strategyId, strategyAwardVO.getAwardId(), strategyAwardVO.getAwardRuleValue());

        // 4. 返回抽奖结果
        return buildRaffleAwardEntity(strategyId, strategyAwardVO.getAwardId(), strategyAwardVO.getAwardRuleValue());

    }

    private RaffleAwardEntity buildRaffleAwardEntity(Long strategyId, Integer awardId, String awardConfig) {
        StrategyAwardEntity strategyAward = repository.queryStrategyAwardEntity(strategyId, awardId);
        return RaffleAwardEntity.builder()
                .awardId(awardId)
                .awardTitle(strategyAward.getAwardTitle())
                .awardConfig(awardConfig)
                .sort(strategyAward.getSort())
                .build();
    }
    /**
     * 抽奖计算，责任链抽象方法
     *
     * @param userId     用户ID
     * @param strategyId 策略ID
     * @return 奖品ID
     */
    public abstract DefaultChainFactory.StrategyAwardVO raffleLogicChain(String userId, Long strategyId);

    /**
     * 抽奖结果过滤，决策树抽象方法
     *
     * @param userId     用户ID
     * @param strategyId 策略ID
     * @param awardId    奖品ID
     * @return 过滤结果【奖品ID，会根据抽奖次数判断、库存判断、兜底兜里返回最终的可获得奖品信息】
     */
    public abstract DefaultTreeFactory.StrategyAwardVO raffleLogicTree(String userId, Long strategyId, Integer awardId);

    /**
     *
     * @param userId 用户ID
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     * @return 抽奖后过滤结果【奖品是否已解锁、库存是否充足等等】
     */
    protected abstract DefaultFilterFactory.StrategyAwardVO raffleAfterHandle(String userId, Long strategyId, Integer awardId);
}
