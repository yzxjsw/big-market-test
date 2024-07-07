package com.yzxjsw.test.domain;

import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
import com.yzxjsw.domain.strategy.service.armory.IStrategyDispatch;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * StrategyArmoryTest 测试抽奖的流程
 *
 * @author yezhenxiong
 * @version 2024/06/30 16:50
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class StrategyArmoryTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IStrategyDispatch strategyDispatch;

    //
    //@Before
    //public void test_strategyArmory() {
    //    boolean success = strategyArmory.assembleLotteryStrategy(10001L);
    //    log.info("装配测试结果：{}", success);
    //}

    @Test
    public void test_strategyArmory_init() {
        // 100002 测试装配抽奖策略【无规则权重】
        boolean success = strategyArmory.assembleLotteryStrategy(100002L);
        log.info("装配测试结果：{}", success);
    }
    @Test
    public void test_strategyArmory_weight() {
        // 100002 测试装配抽奖策略【权重装配】
        boolean success = strategyArmory.assembleLotteryStrategy(100003L);
        log.info("装配测试结果：{}", success);
    }

    @Test
    public void test_getAssembleRandomVal() {
        log.info("测试结果【奖品ID值】：{}", strategyDispatch.getRandomAwardId(100002L));
    }
    @Test
    public void test_getAssembleRandomVal_ruleWeightValue() {
        // 4000:102,103,104,105 5000:102,103,104,106,107 6000:102,103,104,105,106,107,108
        log.info("测试结果：{} - 4000 策略配置", strategyDispatch.getRandomAwardId(100003L, "4000:102,103,104,105"));
        log.info("测试结果：{} - 5000 策略配置", strategyDispatch.getRandomAwardId(10001L, "5000:102,103,104,106,107"));
        log.info("测试结果：{} - 6000 策略配置", strategyDispatch.getRandomAwardId(10001L, "6000:102,103,104,105,106,107,108"));
    }
}
