package com.yzxjsw.domain.award.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * TaskStateVO 任务状态值对象
 *
 * @author yezhenxiong
 * @version 2024/08/10 16:40
 **/
@Getter
@AllArgsConstructor
public enum TaskStateVO {

    create("create", "创建"),
    complete("complete", "发送完成"),
    fail("fail", "发送失败"),
    ;

    private final String code;
    private final String desc;

}
