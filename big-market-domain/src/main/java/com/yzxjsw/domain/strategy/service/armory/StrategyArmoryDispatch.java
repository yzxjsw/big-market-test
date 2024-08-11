package com.yzxjsw.domain.strategy.service.armory;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.model.StrategyEntity;
import com.yzxjsw.domain.strategy.model.StrategyRuleEntity;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
import com.yzxjsw.types.common.Constants;
import com.yzxjsw.types.enums.ResponseCode;
import com.yzxjsw.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.SecureRandom;
import java.util.*;

/**
 * StrategyArmory 策略装配库, 负责初始化策略计算
 *
 * @author yezhenxiong
 * @version 2024/06/28 15:11
 **/
@Slf4j
@Service
public class StrategyArmoryDispatch implements IStrategyArmory, IStrategyDispatch{

    @Resource
    private IStrategyRepository strategyRepository;

    /**
     *
     * @param strategyId 策略ID
     * @return 是否装配成功
     */
    @Override
    public boolean assembleLotteryStrategy(Long strategyId) {
        // 1. 查询抽奖策略奖品配置
        List<StrategyAwardEntity> strategyAwardEntities = strategyRepository.queryStrategyAwardList(strategyId);

        // 2. 装配缓存奖品库存，【用于decr扣减库存使用】
        for (StrategyAwardEntity strategyAwardEntity : strategyAwardEntities) {
            Integer awardId = strategyAwardEntity.getAwardId();
            Integer awardCount = strategyAwardEntity.getAwardCount();
            cacheStrategyAwardCount(strategyId, awardId, awardCount);
        }

        // 默认装配配置，【全量抽奖概率装配】
        assembleLotteryStrategy(String.valueOf(strategyId), strategyAwardEntities);

        // 2. 权重策略配置-适用于rule_weight 权重规则配置
        StrategyEntity strategyEntity =  strategyRepository.queryStrategyEntityByStrategyId(strategyId);
        String ruleWeight = strategyEntity.getRuleWeight();
        if (null == ruleWeight) {
            return true;
        }

        // 3. 针对规则权重进行配置
        StrategyRuleEntity strategyRuleEntity = strategyRepository.queryStrategyRule(strategyId, ruleWeight);
        // 健壮性，如果在策略表中配置了权重抽奖规则，而在规则表中找不到这个规则
        if (null == strategyRuleEntity) {
            throw new AppException(ResponseCode.STRATEGY_RULE_WEIGHT_IS_NULL.getCode(), ResponseCode.STRATEGY_RULE_WEIGHT_IS_NULL.getInfo());
        }

        Map<String, List<Integer>> ruleWeightValueMap = strategyRuleEntity.getRuleWeightValues();
        Set<String> keys = ruleWeightValueMap.keySet();
        for (String key : keys) {
            List<Integer> ruleWeightValues = ruleWeightValueMap.get(key);
            ArrayList<StrategyAwardEntity> strategyAwardEntitiesClone = new ArrayList<>(strategyAwardEntities);
            strategyAwardEntitiesClone.removeIf(entity -> !ruleWeightValues.contains(entity.getAwardId()));
            assembleLotteryStrategy(String.valueOf(strategyId).concat("_").concat(key), strategyAwardEntitiesClone);
        }
        return true;
    }

    /**
     * 装配抽奖策略中奖品的库存
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     * @param awardCount 奖品库存
     */
    private void cacheStrategyAwardCount(Long strategyId, Integer awardId, Integer awardCount) {
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_COUNT_KEY + strategyId + Constants.UNDERLINE + awardId;
        strategyRepository.cacheStrategyAwardCount(cacheKey, awardCount);
    }

    /**
     * 转换计算，只根据小数位来计算。如【0.01返回100】、【0.009返回1000】、【0.0018返回10000】
     * 舍入误差过大 测试数据【0.5 + 0.25 + 0.125 + 0.125 = 1】
     * min = 10 => range[5, 3, 2, 2] = 12 真实概率值【0.5, 0.3, 0.2, 0.2】
     */
    private double convert(double min){
        double current = min;
        double max = 1;
        while (current < 1){
            current = current * 10;
            max = max * 10;
        }
        return max;
    }

    /**
     *
     * 转换计算，只根据小数位来计算。如【0.01返回100】、【0.009返回1000】、【0.0018返回10000】
     * 解决舍入误差过大 测试数据【0.5 + 0.25 + 0.125 + 0.125 = 1】
     *  max = 10 => range[5, 3, 2, 2] = 12 真实概率值【0.5, 0.3, 0.2, 0.2】所以会导致比较大的误差
     *  transfer max=1000
     */
    private double transfer(double min){
        String numStr = Double.toString(min);
        int dotIndex = numStr.indexOf('.');
        if (dotIndex == -1) {
            return 1;  // 如果没有小数点
        }

        // 去掉尾部的0 "0+$" 是一个正则表达式，用于匹配字符串末尾的一个或多个零 (0)。
        numStr = numStr.replaceAll("0+$", "");

        // 计算有效数字的数量
        int range = numStr.length() - dotIndex - 1;

        // 计算10的幂次
        return Math.pow(10, range);
    }

    /**
     * 装配的公共代码
     * 负责装配策略奖品实体的概率范围值和
     * @param key 策略ID
     * @param strategyAwardEntities 策略奖品实体
     */
    private void assembleLotteryStrategy(String key, List<StrategyAwardEntity> strategyAwardEntities) {
        // 1. 获取最小概率值
        BigDecimal minAwardRate = strategyAwardEntities.stream()
                .map(StrategyAwardEntity::getAwardRate)
                .min(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);

        // 2. 计算找到概率范围值【在数据库中要保证所有奖品概率值加起来不超过1】
        BigDecimal rateRange = BigDecimal.valueOf(transfer(minAwardRate.doubleValue()));

        // 3. 填充概率范围【存储awardId】
        ArrayList<Integer> strategyAwardSearchRateTables = new ArrayList<>(rateRange.intValue());
        for (StrategyAwardEntity strategyAwardEntity : strategyAwardEntities) {
            Integer awardId = strategyAwardEntity.getAwardId();
            BigDecimal awardRate = strategyAwardEntity.getAwardRate();

            // 计算出每个概率值需要存放的数量，循环填充
            int range = rateRange.multiply(awardRate).setScale(0, RoundingMode.CEILING).intValue();
            for (int i = 0; i < range; i++) {
                strategyAwardSearchRateTables.add(awardId);
            }
        }

        // 4. 乱序，
        Collections.shuffle(strategyAwardSearchRateTables);

        // 5. 存储
        HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTables = new HashMap<>();
        for (int i = 0; i < strategyAwardSearchRateTables.size(); i++) {
            shuffleStrategyAwardSearchRateTables.put(i, strategyAwardSearchRateTables.get(i));
        }

        // 6. 存储到 Redis
        strategyRepository.storeStrategyAwardSearchRateTables(key, shuffleStrategyAwardSearchRateTables.size(), shuffleStrategyAwardSearchRateTables);
    }
    @Override
    public Integer getRandomAwardId(Long strategyId) {
        int rateRange = strategyRepository.getRateRange(strategyId);
        return strategyRepository.getStrategyAwardAssemble(String.valueOf(strategyId), new SecureRandom().nextInt(rateRange));
    }

    @Override
    public Integer getRandomAwardId(Long strategyId, String ruleWeightValue) {
        String key = String.valueOf(strategyId).concat("_").concat(ruleWeightValue);
        int rateRange = strategyRepository.getRateRange(key);
        return strategyRepository.getStrategyAwardAssemble(key, new SecureRandom().nextInt(rateRange));
    }

    @Override
    public Boolean subtractionAwardStock(Long strategyId, Integer awardId) {
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_COUNT_KEY + strategyId + Constants.UNDERLINE + awardId;
        return strategyRepository.subtractionAwardStock(cacheKey);
    }
}
