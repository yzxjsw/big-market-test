package com.yzxjsw.test.domain.strategy;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;
import com.yzxjsw.domain.strategy.service.IRaffleStrategy;
import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
import com.yzxjsw.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain;
import com.yzxjsw.domain.strategy.service.rule.filter.impl.RuleLockFilterNode;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;
import java.util.concurrent.CountDownLatch;

/**
 * RaffleStockTest 不超买测试
 *
 * @author yezhenxiong
 * @version 2024/08/02 16:05
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleStockTest {
    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleStrategy raffleStrategy;

    @Resource
    private RuleWeightLogicChain ruleWeightLogicChain;

    @Resource
    private RuleLockFilterNode ruleLockFilterNode;


    @Test
    public void test_strategyArmory() {
        // 100006 测试抽奖后处理
        boolean success = strategyArmory.assembleLotteryStrategy(100006L);
        log.info("装配测试结果：{}", success);
    }


    @Test
    public void test_performRaffle() throws InterruptedException {
        for (int i = 0; i < 3; i++) {
            ReflectionTestUtils.setField(ruleLockFilterNode, "userRaffleCount", 10L);
            RaffleFactorEntity raffleFactorEntity = RaffleFactorEntity.builder()
                    .userId("yzx")  // 黑名单用户 user1,user2,user3
                    .strategyId(100006L)
                    .build();

            RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactorEntity);

            log.info("请求参数：{}", JSON.toJSONString(raffleFactorEntity));
            log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
        }


        // 等待 UpdateAwardStockJob 消费队列
        new CountDownLatch(1).await();
    }
}
