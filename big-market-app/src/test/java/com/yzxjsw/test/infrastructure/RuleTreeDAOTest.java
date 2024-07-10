package com.yzxjsw.test.infrastructure;

import com.yzxjsw.domain.strategy.model.valobj.RuleTreeVO;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.infrastructure.persistent.dao.IRuleTreeDao;
import com.yzxjsw.infrastructure.persistent.po.RuleTree;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * RuleTreeDAOTest 测试数据仓储查询
 *
 * @author yezhenxiong
 * @version 2024/07/09 16:11
 **/
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RuleTreeDAOTest {

    @Resource
    private IRuleTreeDao ruleTreeDao;

    @Resource
    private IStrategyRepository strategyRepository;

    @Test
    public void test_query() {
        RuleTree ruleLock = ruleTreeDao.queryRuleTreeByTreeId("tree_lock");
        log.info("查询结果：{}", ruleLock);
    }

    @Test
    public void test_armoryTree() {
        RuleTreeVO ruleTreeVO = strategyRepository.queryRuleTreeVOByTreeId("tree_lock");
        log.info("测试结果：{}",ruleTreeVO);
    }
}
