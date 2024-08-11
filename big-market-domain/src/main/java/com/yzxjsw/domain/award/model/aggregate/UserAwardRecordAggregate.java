package com.yzxjsw.domain.award.model.aggregate;

import com.yzxjsw.domain.award.model.entity.TaskEntity;
import com.yzxjsw.domain.award.model.entity.UserAwardRecordEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * UserAwardRecordAggregate 用户中奖记录聚合对象【一个聚合对象往往用于同一个事务】
 *
 * @author yezhenxiong
 * @version 2024/08/10 16:38
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAwardRecordAggregate {

    private UserAwardRecordEntity userAwardRecordEntity;

    private TaskEntity taskEntity;

}
