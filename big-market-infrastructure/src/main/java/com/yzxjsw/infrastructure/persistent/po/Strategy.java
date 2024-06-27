package com.yzxjsw.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * Strategy 抽奖策略对象
 *
 * @author yezhenxiong
 * @version 2024/06/26 17:22
 **/
@Data
public class Strategy {

    /** 自增ID*/
    private Long id;

    /** 抽奖策略ID*/
    private Long strategyId;

    /** 抽奖策略描述*/
    private String strategyDes;

    /** 抽奖策略规则*/
    private String ruleModels;

    /** 创建时间*/
    private Date createTime;

    /** 更新时间*/
    private Date updateTime;

}
