package com.yzxjsw.domain.strategy.model.valobj;

import com.yzxjsw.domain.strategy.service.rule.factory.DefaultLogicFactory;
import com.yzxjsw.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * StrategyAwardRuleModelVO
 * 抽奖策略规则值对象
 * @author yezhenxiong
 * @version 2024/07/07 19:10
 **/
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardRuleModelVO {

    private String ruleModels;

    public String[] raffleCenterRuleModelList(){
        List<String> ruleModelList = new ArrayList<>();
        String[] ruleModelValues = ruleModels.split(Constants.SPLIT);
        for (String ruleModelValue : ruleModelValues) {
            if (DefaultLogicFactory.LogicModel.isCenter(ruleModelValue)) {
                ruleModelList.add(ruleModelValue);
            }
        }
        return ruleModelList.toArray(new String[0]);
    }
}
