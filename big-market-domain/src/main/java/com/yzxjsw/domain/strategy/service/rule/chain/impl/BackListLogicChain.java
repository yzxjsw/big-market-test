package com.yzxjsw.domain.strategy.service.rule.chain.impl;

import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.domain.strategy.service.rule.chain.AbstractLogicChain;
import com.yzxjsw.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * BackListLogicChain 黑名单责任链
 *
 * @author yezhenxiong
 * @version 2024/07/08 15:12
 **/
@Slf4j
@Component("rule_blacklist")
public class BackListLogicChain extends AbstractLogicChain {

    @Resource
    private IStrategyRepository repository;

    @Override
    public Integer logic(String userId, Long strategyId) {
        log.info("抽奖前规则过滤-【黑名单】-begin: userId:{}, strategyId:{}",userId, strategyId);
        String ruleValue = repository.queryStrategyRuleValue(strategyId, ruleModel());

        // 拆分出规则值 [奖品ID:用户列表,]
        String[] split = ruleValue.split(Constants.COLON);
        int awardId = Integer.parseInt(split[0]);

        // 拆分出用户列表
        String[] userBlackIds = split[1].split(Constants.SPLIT);
        for (String userBlackId : userBlackIds) {
            if (userId.equals(userBlackId)) {
                log.info("用户为黑名单中的用户。黑名单: {}, userId: {}",
                        userBlackIds, userBlackId);
                return awardId;
            }
        }

        // 用户不是黑名单中的用户
        log.info("抽奖前规则过滤-【黑名单】-end: 放行");
        // 调用责任链的下一个结点进行处理
        return next().logic(userId, strategyId);
    }

    @Override
    protected String ruleModel() {
        return "rule_blacklist";
    }
}
