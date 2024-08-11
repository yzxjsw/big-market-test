package com.yzxjsw.domain.award.model.entity;

import com.yzxjsw.domain.award.event.SendAwardMessageEvent;
import com.yzxjsw.domain.award.model.valobj.TaskStateVO;
import com.yzxjsw.types.event.BaseEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * TaskEntity 任务实体对象
 *
 * @author yezhenxiong
 * @version 2024/08/10 16:39
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TaskEntity {

    /** 活动ID */
    private String userId;
    /** 消息主题 */
    private String topic;
    /** 消息编号 */
    private String messageId;
    /** 消息主体 */
    private BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> message;
    /** 任务状态；create-创建、completed-完成、fail-失败 */
    private TaskStateVO state;

}