package com.yzxjsw.domain.award.repository;

import com.yzxjsw.domain.award.model.aggregate.UserAwardRecordAggregate;

/**
 * IAwardRepository 奖品仓储服务接口
 *
 * @author yezhenxiong
 * @version 2024/08/10 16:37
 **/
public interface IAwardRepository {

    void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate);

}
