package com.yzxjsw.domain.activity.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * OrderStateVO 订单状态
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:22
 **/
@Getter
@AllArgsConstructor
public enum OrderStateVO {

    completed("completed", "完成");

    private final String code;
    private final String desc;
}
