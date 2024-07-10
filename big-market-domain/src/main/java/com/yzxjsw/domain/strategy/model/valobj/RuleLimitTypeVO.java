package com.yzxjsw.domain.strategy.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * RuleLimitTypeVO 规则限定枚举值
 *
 * @author yezhenxiong
 * @version 2024/07/09 14:39
 **/
@Getter
@AllArgsConstructor
public enum RuleLimitTypeVO {
    EQUAL(1, "等于"),
    GT(2, "大于"),
    LT(3, "小于"),
    GE(4, "大于&等于"),
    LE(5, "小于&等于"),
    ENUM(6, "枚举"),
    ;

    private final Integer code;
    private final String info;
}
