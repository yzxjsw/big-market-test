package com.yzxjsw.domain.activity.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * ActivityStateVO 活动状态
 *
 * @author yezhenxiong
 * @version 2024/07/22 15:20
 **/
@Getter
@AllArgsConstructor
public enum ActivityStateVO {

    create("create", "创建"),
    open("open", "开启"),
    close("close", "关闭")
    ;

    private final String code;
    private final String desc;
}
