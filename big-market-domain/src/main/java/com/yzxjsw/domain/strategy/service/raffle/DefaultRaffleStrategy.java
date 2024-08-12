package com.yzxjsw.domain.strategy.service.raffle;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.model.valobj.RuleTreeVO;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.AbstractRaffleStrategy;
import com.yzxjsw.domain.strategy.service.IRaffleAward;
import com.yzxjsw.domain.strategy.service.IRaffleStock;
import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import com.yzxjsw.domain.strategy.service.rule.chain.ILogicChain;
import com.yzxjsw.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.yzxjsw.domain.strategy.service.rule.filter.IFilterNode;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import com.yzxjsw.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * DefaultRaffleStrategy 抽奖实现
 *
 * @author yezhenxiong
 * @version 2024/07/02 16:27
 **/

@Slf4j
@Service
public class DefaultRaffleStrategy extends AbstractRaffleStrategy implements IRaffleAward, IRaffleStock {

    public DefaultRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch, DefaultChainFactory defaultChainFactory, DefaultTreeFactory defaultTreeFactory, DefaultFilterFactory defaultFilterFactory) {
        super(repository, strategyDispatch, defaultChainFactory, defaultTreeFactory, defaultFilterFactory);
    }

    @Override
    public DefaultChainFactory.StrategyAwardVO raffleLogicChain(String userId, Long strategyId) {
        ILogicChain logicChain = defaultChainFactory.openLogicChain(strategyId);
        return logicChain.logic(userId, strategyId);
    }

    @Override
    public DefaultTreeFactory.StrategyAwardVO raffleLogicTree(String userId, Long strategyId, Integer awardId) {
        StrategyAwardRuleModelVO strategyAwardRuleModelVO = repository.queryStrategyAwardRuleModel(strategyId, awardId);
        if (null == strategyAwardRuleModelVO) {
            return DefaultTreeFactory.StrategyAwardVO.builder().awardId(awardId).build();
        }
        RuleTreeVO ruleTreeVO = repository.queryRuleTreeVOByTreeId(strategyAwardRuleModelVO.getRuleModels());
        if (null == ruleTreeVO) {
            throw new RuntimeException("存在抽奖策略配置的规则模型 Key，未在库表 rule_tree、rule_tree_node、rule_tree_line 配置对应的规则树信息 " + strategyAwardRuleModelVO.getRuleModels());
        }
        IDecisionTreeEngine treeEngine = defaultTreeFactory.openLogicTree(ruleTreeVO);
        return treeEngine.process(userId, strategyId, awardId);
    }

    @Override
    protected DefaultFilterFactory.StrategyAwardVO raffleAfterHandle(String userId, Long strategyId, Integer awardId) {

        // 1. 查询奖品的规则配置
        String[] ruleValues = null;
        StrategyAwardRuleModelVO strategyAwardRuleModelVO = repository.queryStrategyAwardRuleModel(strategyId, awardId);
        DefaultFilterFactory.ActionEntity actionEntity = null;
        IFilterNode ruleLock = defaultFilterFactory.getFilterNode("lock");
        IFilterNode ruleLuck = defaultFilterFactory.getFilterNode("luck");
        IFilterNode ruleStock = defaultFilterFactory.getFilterNode("stock");

        String ruleValue = strategyAwardRuleModelVO.getRuleModels();
        // 如果配置了次数锁
        if ("lock".equals(ruleValue)) {
            actionEntity = ruleLock.logic(userId, strategyId, awardId, "lock");
            // 拦截，未达到解锁条件
            if (actionEntity.getRuleLogicCheckType().equals(RuleLogicCheckTypeVO.TAKE_OVER)) {
                actionEntity = ruleLuck.logic(userId, strategyId, awardId, "luck");
                return actionEntity.getStrategyAwardVO();
            }
        }
        // 1. 奖品达到解锁条件
        // 2. 没有配置，
        // 走库存，不足就走兜底
        actionEntity = ruleStock.logic(userId, strategyId, awardId, "stock");
        // 如果放行，走兜底
        if (actionEntity.getRuleLogicCheckType().equals(RuleLogicCheckTypeVO.ALLOW)) {
            actionEntity = ruleLuck.logic(userId, strategyId, awardId, "luck");
        }
        return actionEntity.getStrategyAwardVO();

    }

    @Override
    public StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException {
        return repository.takeQueueValue();
    }

    @Override
    public void updateStrategyAwardStock(Long strategyId, Integer awardId) {
        repository.updateStrategyAwardStock(strategyId, awardId);
    }

    @Override
    public List<StrategyAwardEntity> queryRaffleStrategyAwardList(Long strategyId) {
        return repository.queryStrategyAwardList(strategyId);
    }
}
