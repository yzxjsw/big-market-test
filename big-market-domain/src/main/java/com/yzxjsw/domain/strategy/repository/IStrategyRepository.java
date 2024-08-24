package com.yzxjsw.domain.strategy.repository;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.model.StrategyEntity;
import com.yzxjsw.domain.strategy.model.StrategyRuleEntity;
import com.yzxjsw.domain.strategy.model.valobj.RuleTreeVO;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import com.yzxjsw.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * IStrategyRepository 策略仓储接口
 *
 * @author yezhenxiong
 * @version 2024/06/28 15:12
 **/
public interface IStrategyRepository {


    /**
     * 查询策略配置
     * @param strategyId 策略ID
     * @return 抽奖策略配置的奖品实体集合
     */
    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    /**
     * 将策略的概率映射表存入Redis
     * @param key 策略ID 全量 或者带权重
     * @param rateRange 随机数的范围
     * @param shuffleStrategyAwardSearchRateTables 打乱后的存储概率表，key value: awardId
     *
     */
    void storeStrategyAwardSearchRateTables(String key, int rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTables);

    int getRateRange(Long strategyId);
    int getRateRange(String key);

    Integer getStrategyAwardAssemble(String key, Integer rateKey);

    StrategyEntity queryStrategyEntityByStrategyId(Long strategyId);

    StrategyRuleEntity queryStrategyRule(Long strategyId, String ruleModel);

    String queryStrategyRuleValue(Long strategyId, Integer awardId, String ruleModel);

    /**
     * 通过策略ID 和 策略模型可以唯一确定策略模型配置的规则值
     * @param strategyId 策略ID
     * @param ruleModel 策略模型
     * @return 配置的规则值
     */
    String queryStrategyRuleValue(Long strategyId, String ruleModel);

    StrategyAwardRuleModelVO queryStrategyAwardRuleModel(Long strategyId, Integer awardId);

    RuleTreeVO queryRuleTreeVOByTreeId(String treeId);

    /**
     * 缓存奖品库存
     * @param cacheKey key
     * @param awardCount 库存值
     */
    void cacheStrategyAwardCount(String cacheKey, Integer awardCount);

    /**
     * 扣减库存 decr 方式。
     * @param key 缓存key
     * @return 扣减结果
     */
    Boolean subtractionAwardStock(String key);
    void awardStockConsumeSendQueue(StrategyAwardStockKeyVO strategyAwardStockKeyVO);


    StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException;

    void updateStrategyAwardStock(Long strategyId, Integer awardId);

    StrategyAwardEntity queryStrategyAwardEntity(Long strategyId, Integer awardId);

    Long queryStrategyIdByActivityId(Long activityId);

    Integer queryTodayUserRaffleCount(String userId, Long strategyId);

    Integer queryActivityAccountTotalUseCount(String userId, Long strategyId);
}
