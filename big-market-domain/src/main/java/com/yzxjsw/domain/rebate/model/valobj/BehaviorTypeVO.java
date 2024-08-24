package com.yzxjsw.domain.rebate.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 值对象一般是不提供set方法的
 * @author yezhenxiong
 * @description 行为类型枚举值对象
 * @create 2024-04-30 14:36
 */
@Getter
@AllArgsConstructor
public enum BehaviorTypeVO {

    SIGN("sign", "签到"),
    OPENAI_PAY("pay", "支付"),
    ;

    private final String code;
    private final String info;

}
