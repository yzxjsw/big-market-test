package com.yzxjsw.test.infrastructure;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.infrastructure.persistent.dao.IRaffleActivityOrderDao;
import com.yzxjsw.infrastructure.persistent.po.RaffleActivityOrder;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * RaffleActivityOrderDaoTest
 *
 * @author yezhenxiong
 * @version 2024/07/19 15:56
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleActivityOrderDaoTest {

    @Resource
    private IRaffleActivityOrderDao raffleActivityOrderDao;

    //private final EasyRandom easyRandom = new EasyRandom();

    @Test
    public void test_insert_random() {
        for (int i = 0; i < 5; i++) {
            RaffleActivityOrder raffleActivityOrder = new RaffleActivityOrder();
            // EasyRandom 可以通过指定对象类的方式，随机生成对象值。如；easyRandom.nextObject(String.class)、easyRandom.nextObject(RaffleActivityOrder.class)
            raffleActivityOrder.setUserId("123456" + i);
            raffleActivityOrder.setActivityId(100301L);
            raffleActivityOrder.setActivityName("测试活动");
            raffleActivityOrder.setStrategyId(100006L);
            raffleActivityOrder.setOrderId(RandomStringUtils.randomNumeric(12));
            raffleActivityOrder.setOrderTime(new Date());
            raffleActivityOrder.setState("not_used");
            // 插入数据
            raffleActivityOrderDao.insert(raffleActivityOrder);
        }
    }

    @Test
    public void test_insert() {
        RaffleActivityOrder raffleActivityOrder = new RaffleActivityOrder();
        raffleActivityOrder.setUserId("yezhenxiong");
        raffleActivityOrder.setActivityId(100301L);
        raffleActivityOrder.setActivityName("测试活动");
        raffleActivityOrder.setStrategyId(100006L);
        raffleActivityOrder.setOrderId(RandomStringUtils.randomNumeric(12));
        raffleActivityOrder.setOrderTime(new Date());
        raffleActivityOrder.setState("not_used");
        // 插入数据
        raffleActivityOrderDao.insert(raffleActivityOrder);
    }

    @Test
    public void test_queryRaffleActivityOrderByUserId() {
        String userId = "yezhenxiong";
        List<RaffleActivityOrder> raffleActivityOrders = raffleActivityOrderDao.queryRaffleActivityOrderByUserId(userId);
        log.info("测试结果：{}", JSON.toJSONString(raffleActivityOrders));
    }

}
