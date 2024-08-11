package com.yzxjsw.domain.award.service;

import com.yzxjsw.domain.award.model.entity.UserAwardRecordEntity;

/**
 * IAwardService 奖品服务接口
 *
 * @author yezhenxiong
 * @version 2024/08/10 14:05
 **/
public interface IAwardService {

    /**
     * 保存用户的中奖记录
     * @param userAwardRecordEntity 用户中奖记录实体对象
     */
    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);
}
