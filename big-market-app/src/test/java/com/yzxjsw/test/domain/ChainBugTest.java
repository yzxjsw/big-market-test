package com.yzxjsw.test.domain;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.service.IRaffleStrategy;
import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
import com.yzxjsw.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;

/**
 * ChainBugTest 测试责任链存在的问题
 *
 * @author yezhenxiong
 * @version 2024/07/14 15:48
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ChainBugTest {
    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleStrategy raffleStrategy;

    @Resource
    private RuleWeightLogicChain ruleWeightLogicChain;
    @Test
    public void test_strategyArmory() {
        // 100009 没有配置抽奖前置规则
        boolean success = strategyArmory.assembleLotteryStrategy(100009L);
        // 1000010 配置了黑名单和权重抽奖
        boolean success1 = strategyArmory.assembleLotteryStrategy(1000010L);
        log.info("装配测试结果：{}", success);
    }

    @Test
    public void test_performRaffle_blacklist() {
        ReflectionTestUtils.setField(ruleWeightLogicChain, "userScore", 6000L);
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("user1")  // 黑名单用户 user1,user2,user3
                .strategyId(1000010L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

    @Test
    public void test_performRaffle() {

        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("yzx")  // 黑名单用户 user1,user2,user3
                .strategyId(100009L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }
}
