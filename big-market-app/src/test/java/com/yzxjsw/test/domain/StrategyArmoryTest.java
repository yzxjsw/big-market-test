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

    @Test
    public void test_strategyArmory_init() {
        // 100007 测试装配抽奖策略【默认装配】
        boolean success = strategyArmory.assembleLotteryStrategy(100007L);
        log.info("装配测试结果：{}", success);
    }
    @Test
    public void test_strategyArmory_weight() {
        // 100008 测试装配抽奖策略【权重装配】
        boolean success = strategyArmory.assembleLotteryStrategy(100008L);
        log.info("装配测试结果：{}", success);
    }

    @Test
    public void test_getAssembleRandomVal() {
        log.info("【全量抽奖】测试结果：{}", strategyDispatch.getRandomAwardId(100007L));
        log.info("【权重抽奖】测试结果：{} ", strategyDispatch.getRandomAwardId(100008L, "6000:102,103,104"));
    }
}
