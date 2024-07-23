package com.yzxjsw.test.infrastructure;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.infrastructure.persistent.dao.IRaffleActivityDao;
import com.yzxjsw.infrastructure.persistent.po.RaffleActivity;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Deque;
import java.util.LinkedList;


/**
 * RaffleActivityDaoTest DAO测试
 *
 * @author yezhenxiong
 * @version 2024/07/19 15:46
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleActivityDaoTest {

    @Resource
    private IRaffleActivityDao raffleActivityDao;

    @Test
    public void test_queryRaffleActivityByActivityId() {
        RaffleActivity raffleActivity = raffleActivityDao.queryRaffleActivityByActivityId(100301L);
        log.info("测试结果：{}", JSON.toJSONString(raffleActivity));
    }


}

