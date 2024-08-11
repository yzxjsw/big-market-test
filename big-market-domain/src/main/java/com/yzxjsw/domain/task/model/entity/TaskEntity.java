package com.yzxjsw.domain.task.model.entity;

import lombok.Data;

/**
 * TaskEntity
 *
 * @author yezhenxiong
 * @version 2024/08/10 17:48
 **/
@Data
public class TaskEntity {

    /** 活动ID */
    private String userId;
    /** 消息主题 */
    private String topic;
    /** 消息编号 */
    private String messageId;
    /** 消息主体 */
    private String message;

}