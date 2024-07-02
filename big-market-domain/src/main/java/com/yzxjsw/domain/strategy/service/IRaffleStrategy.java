package com.yzxjsw.domain.strategy.service;

import com.yzxjsw.domain.strategy.model.RaffleAwardEntity;
import com.yzxjsw.domain.strategy.model.RaffleFactorEntity;

/**
 * IRaffleStrategy 抽奖策略接口
 *
 * @author yezhenxiong
 * @version 2024/07/01 20:07
 **/
public interface IRaffleStrategy {


    RaffleAwardEntity performRaffle(RaffleFactorEntity raffleFactorEntity);
}
