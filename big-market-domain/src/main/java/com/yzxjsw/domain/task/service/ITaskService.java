package com.yzxjsw.domain.task.service;

import com.yzxjsw.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * ITaskService
 *
 * @author yezhenxiong
 * @version 2024/08/10 17:47
 **/
public interface ITaskService {
    /**
     * 查询发送MQ失败和超时1分钟未发送的MQ
     *
     * @return 未发送的任务消息列表10条
     */
    List<TaskEntity> queryNoSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskSendMessageCompleted(String userId, String messageId);

    void updateTaskSendMessageFail(String userId, String messageId);
}
