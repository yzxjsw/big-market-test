package com.yzxjsw.test.domain.strategy;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.service.IRaffleStrategy;
import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
//import com.yzxjsw.domain.strategy.service.rule.filter.impl.RuleLockLogicFilter;
//import com.yzxjsw.domain.strategy.service.rule.filter.impl.RuleWeightLogicFilter;
import lombok.extern.slf4j.Slf4j;
import org.junit.runner.RunWith;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;

/**
 * RaffleStrategyTest 抽奖测试
 *
 * @author yezhenxiong
 * @version 2024/07/02 16:36
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleStrategyTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleStrategy raffleStrategy;

    //@Resource
    //private RuleWeightLogicFilter ruleWeightLogicFilter;
    //
    //@Resource
    //private RuleLockLogicFilter ruleLockLogicFilter;

    //@Before
    //public void setUp() {
    //
    //}

    @Test
    public void test_strategyArmory_weight() {
        // 装配 100004
        boolean success = strategyArmory.assembleLotteryStrategy(100005L);
        log.info("装配测试结果：{}", success);
    }
    @Test
    public void test_performRaffle() {
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("user4")
                .strategyId(100004L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
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
    public void test_strategyArmory_center() {
        // 装配 100005
        boolean success = strategyArmory.assembleLotteryStrategy(100005L);
        log.info("装配测试结果：{}", success);
    }
    @Test
    public void test_performRaffle_center() {
        //ReflectionTestUtils.setField(ruleWeightLogicFilter, "userScore", 5000L);
        //ReflectionTestUtils.setField(ruleLockLogicFilter, "userRaffleCount", 0L);
        RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                .userId("yzx")  // 黑名单用户 user1,user2,user3
                .strategyId(100005L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

        log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

}