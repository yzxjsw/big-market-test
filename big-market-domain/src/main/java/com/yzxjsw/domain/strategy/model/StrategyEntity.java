package com.yzxjsw.domain.strategy.model;

import com.yzxjsw.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

/**
 * StrategyEntity 抽奖策略实体对象
 *
 * @author yezhenxiong
 * @version 2024/07/01 14:03
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyEntity {

    /** 抽奖策略ID*/
    private Long strategyId;

    /** 抽奖策略描述*/
    private String strategyDes;

    /** 抽奖策略规则*/
    private String ruleModels;

    public String[] ruleModels() {
        if (StringUtils.isBlank(ruleModels)) {
            return null;
        }
        return ruleModels.split(Constants.SPLIT);
    }

    public String getRuleWeight() {
        String[] ruleModelsArray = this.ruleModels();
        if (null != ruleModelsArray) {
            for (String ruleModel : ruleModelsArray) {
                if ("rule_weight".equals(ruleModel)) {
                    return ruleModel;
                }
            }
        }
        return null;
    }

}
