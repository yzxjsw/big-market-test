package com.yzxjsw.domain.task.repository;

import com.yzxjsw.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * ITaskRepository
 *
 * @author yezhenxiong
 * @version 2024/08/10 17:48
 **/
public interface ITaskRepository {
    List<TaskEntity> queryNoSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskSendMessageCompleted(String userId, String messageId);

    void updateTaskSendMessageFail(String userId, String messageId);
}
