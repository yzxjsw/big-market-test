package com.yzxjsw.test.infrastructure;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.infrastructure.persistent.dao.IAwardDao;
import com.yzxjsw.infrastructure.persistent.po.Award;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * AwardDaoTest 奖品DAO的测试
 *
 * @author yezhenxiong
 * @version 2024/06/27 22:53
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class AwardDaoTest {

    @Resource
    private IAwardDao awardDao;

    @Test
    public void test_queryAwardList() {
        List<Award> awards = awardDao.queryAwardList();
        log.info("测试结果：{}", JSON.toJSONString(awards));
        //for (Award award: awards) {
        //    System.out.println(award);
        //}
    }
}
