package com.yzxjsw.domain.strategy.model.valobj;

import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultLogicFactory;
import com.yzxjsw.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Arrays;
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

    public String[] raffleRuleModelList(){
        return ruleModels.split(Constants.SPLIT);
    }

}
