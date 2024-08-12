package com.yzxjsw.domain.strategy.service.rule.filter.impl;

import com.yzxjsw.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import com.yzxjsw.domain.strategy.service.rule.filter.IFilterNode;
import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultFilterFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * RuleStockFilterNode 库存结点
 *
 * @author yezhenxiong
 * @version 2024/08/01 15:54
 **/
@Slf4j
@Component("stock")
public class RuleStockFilterNode implements IFilterNode {
    @Resource
    private IStrategyDispatch strategyDispatch;

    @Resource
    private IStrategyRepository strategyRepository;

    @Override
    public DefaultFilterFactory.ActionEntity logic(String userId, Long strategyId, Integer awardId, String ruleValue) {
        log.info("【抽奖后规则过滤】-库存扣减 userId:{} strategyId:{} awardId:{}", userId, strategyId, awardId);
        // 扣减库存
        Boolean status = strategyDispatch.subtractionAwardStock(strategyId, awardId);
        // true；库存扣减成功，TAKE_OVER 规则节点接管，返回奖品ID，奖品规则配置
        if (status) {
            log.info("规则过滤-库存扣减-成功 userId:{} strategyId:{} awardId:{}", userId, strategyId, awardId);

            // 写入延迟队列，延迟消费更新数据库记录。【在trigger的job；UpdateAwardStockJob 下消费队列，更新数据库记录】
            strategyRepository.awardStockConsumeSendQueue(StrategyAwardStockKeyVO.builder()
                    .strategyId(strategyId)
                    .awardId(awardId)
                    .build());

            return DefaultFilterFactory.ActionEntity.builder()
                    .ruleLogicCheckType(RuleLogicCheckTypeVO.TAKE_OVER)
                    .strategyAwardVO(DefaultFilterFactory.StrategyAwardVO.builder()
                            .awardId(awardId)
                            .awardRuleValue(ruleValue)
                            .build())
                    .build();
        }
        // 如果库存不足，则直接返回放行,交给下一个结点进行处理
        log.warn("规则过滤-库存扣减-告警，库存不足。userId:{} strategyId:{} awardId:{}", userId, strategyId, awardId);
        return DefaultFilterFactory.ActionEntity.builder()
                .ruleLogicCheckType(RuleLogicCheckTypeVO.ALLOW)
                .build();
    }
}
