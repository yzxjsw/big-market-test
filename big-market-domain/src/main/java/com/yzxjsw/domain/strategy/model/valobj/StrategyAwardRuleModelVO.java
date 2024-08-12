package com.yzxjsw.domain.strategy.model.valobj;

import com.yzxjsw.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;



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
