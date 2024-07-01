package com.yzxjsw.test;

import com.yzxjsw.infrastructure.persistent.redis.IRedisService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.redisson.api.RMap;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ApiTest {

    @Resource
    private IRedisService redisService;

    @Test
    public void test() {
        //log.info("测试完成");
        RMap<Object, Object> map = redisService.getMap("strategy_id_10001");
        map.put(1, 101);
        map.put(2, 102);
        map.put(3, 103);
        map.put(4, 104);
        map.put(5, 105);
        map.put(6, 106);
        map.put(7, 107);
        map.put(8, 108);
        log.info("测试结果，{}", redisService.getFromMap("strategy_id_10001", 2).toString());
    }




}
