package com.yzxjsw.infrastructure.persistent.po;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * StrategyAward 抽奖策略详细配置
 *
 * @author yezhenxiong
 * @version 2024/06/26 17:31
 **/
@Data
public class StrategyAward {

    /** 自增id */
    private Long id;

    /** 抽奖策略Id */
    private Long strategyId;

    /** '抽奖奖品id */
    private Integer awardId;

    /** 抽奖奖品标题 */
    private String awardTitle;

    /** 抽奖奖品副标题【是否解锁】 */
    private String awardSubtitle;

    /** 奖品总库存 */
    private Integer awardCount;

    /** 奖品剩余库存 */
    private Integer awardCountSurplus;

    /** 奖品中奖概率 */
    private BigDecimal awardRate;

    /** 排序 */
    private Integer sort;

    /** 规则模型，rule配置记录 */
    private String ruleModels;

    /** 创建时间 */
    private Date createTime;

    /** 更新时间 */
    private Date updateTime;
}
