package com.yzxjsw.test.domain.activity;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.activity.model.entity.ActivityOrderEntity;
import com.yzxjsw.domain.activity.model.entity.ActivityShopCartEntity;
import com.yzxjsw.domain.activity.model.entity.SkuRechargeEntity;
import com.yzxjsw.domain.activity.service.IRaffleOrder;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * RaffleOrder 抽奖订单测试
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:46
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleOrderTest {
    @Resource
    private IRaffleOrder raffleOrder;

    @Test
    public void test_createSkuRechargeOrder() {
        SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
        skuRechargeEntity.setUserId("test");
        skuRechargeEntity.setSku(20001L);
        // outBusinessNo 作为幂等仿重使用，同一个业务单号2次使用会抛出索引冲突 Duplicate entry '700091009111' for key 'uq_out_business_no' 确保唯一性。
        skuRechargeEntity.setOutBusinessNo("700091009111");
        String orderId = raffleOrder.createSkuRechargeOrder(skuRechargeEntity);
        log.info("测试结果：{}", orderId);
    }

}
