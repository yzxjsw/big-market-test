package com.yzxjsw.domain.strategy.service.armory;

import com.yzxjsw.domain.strategy.model.StrategyAwardEntity;
import com.yzxjsw.domain.strategy.model.StrategyEntity;
import com.yzxjsw.domain.strategy.model.StrategyRuleEntity;
import com.yzxjsw.domain.strategy.repository.IStrategyRepository;
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

    @Override
    public boolean assembleLotteryStrategy(Long strategyId) {
        // 1. 查询抽奖策略奖品配置
        List<StrategyAwardEntity> strategyAwardEntities = strategyRepository.queryStrategyAwardList(strategyId);
        assembleLotteryStrategy(String.valueOf(strategyId), strategyAwardEntities);

        // 2. 权重策略配置-适用于rule_weight 权重规则配置
        StrategyEntity strategyEntity =  strategyRepository.queryStrategyEntityByStrategyId(strategyId);
        String ruleWeight = strategyEntity.getRuleWeight();
        if (null == ruleWeight) {
            return true;
        }

        // 3. 针对规则权重进行配置
        StrategyRuleEntity strategyRuleEntity = strategyRepository.queryStrategyRule(strategyId,ruleWeight);
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

    private void assembleLotteryStrategy(String key, List<StrategyAwardEntity> strategyAwardEntities) {
        // 1. 获取最小概率值
        BigDecimal minAwardRate = strategyAwardEntities.stream()
                .map(StrategyAwardEntity::getAwardRate)
                .min(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);

        // 2. 获取概率值总和
        BigDecimal totalAwardRate = strategyAwardEntities.stream()
                .map(StrategyAwardEntity::getAwardRate)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 3. 用 1 / 0.0001 获取概率范围，百分位，千分位，万分位10, 确定有多少个框
        BigDecimal rateRange = totalAwardRate.divide(minAwardRate, 0, RoundingMode.CEILING);

        // 4. 填充概率范围【存储awardId】
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

        // 5. 乱序，
        Collections.shuffle(strategyAwardSearchRateTables);

        // 6. 存储
        HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTables = new HashMap<>();
        for (int i = 0; i < strategyAwardSearchRateTables.size(); i++) {
            shuffleStrategyAwardSearchRateTables.put(i, strategyAwardSearchRateTables.get(i));
        }

        // 7. 存储到 Redis
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
}
