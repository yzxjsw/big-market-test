package com.yzxjsw.test.domain;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.service.IRaffleStrategy;
import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
import com.yzxjsw.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain;
import com.yzxjsw.domain.strategy.service.rule.filter.impl.RuleLockLogicFilter;
import com.yzxjsw.domain.strategy.service.rule.filter.impl.RuleWeightLogicFilter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;

/**
 * RaffleStrategyChainTest 责任链测试
 *
 * @author yezhenxiong
 * @version 2024/07/08 17:11
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleStrategyChainTest {
    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleStrategy raffleStrategy;

    @Resource
    private RuleWeightLogicChain ruleWeightLogicChain;
    @Resource
    private RuleWeightLogicFilter ruleWeightLogicFilter;

    @Resource
    private RuleLockLogicFilter ruleLockLogicFilter;

    @Test
    public void test_strategyArmory() {
        // 100004 测试抽奖前置规则
        boolean success = strategyArmory.assembleLotteryStrategy(100004L);
        // 100005 测试抽奖中规则 【rule_lock】
        //boolean success = strategyArmory.assembleLotteryStrategy(100005L);
        log.info("装配测试结果：{}", success);
    }

    @Test
    public void test_performRaffle_blacklist() {
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("user1")  // 黑名单用户 user1,user2,user3
                .strategyId(100004L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

    @Test
    public void test_performRaffle_weight() {
        ReflectionTestUtils.setField(ruleWeightLogicChain, "userScore", 6000L);
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("yzx")  // 黑名单用户 user1,user2,user3
                .strategyId(100004L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

    @Test
    public void test_performRaffle_center() {
        // 100005 测试抽奖中规则 【rule_lock】
        boolean success = strategyArmory.assembleLotteryStrategy(100005L);
        log.info("装配测试结果：{}", success);
        ReflectionTestUtils.setField(ruleWeightLogicChain, "userScore", 5000L);
        ReflectionTestUtils.setField(ruleLockLogicFilter, "userRaffleCount", 0L);
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("yzx")  // 黑名单用户 user1,user2,user3
                .strategyId(100005L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }
}
