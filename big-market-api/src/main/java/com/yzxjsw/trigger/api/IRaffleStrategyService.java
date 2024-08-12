package com.yzxjsw.trigger.api;

import com.yzxjsw.trigger.api.dto.RaffleAwardListRequestDTO;
import com.yzxjsw.trigger.api.dto.RaffleAwardListResponseDTO;
import com.yzxjsw.trigger.api.dto.RaffleStrategyRequestDTO;
import com.yzxjsw.trigger.api.dto.RaffleStrategyResponseDTO;
import com.yzxjsw.types.model.Response;

import java.util.List;

/**
 * IRaffleService
 * 抽奖服务的接口
 * @author yezhenxiong
 * @version 2024/07/15 14:36
 **/
public interface IRaffleStrategyService {
    /**
     * 抽奖策略装配接口
     * @param strategyId 抽奖策略ID
     * @return 装配结果
     */
    Response<Boolean> strategyArmory(Long strategyId);

    /**
     * 查询抽奖策略奖品配置列表
     * @param requestDTO 请求参数
     * @return 奖品列表数据
     */
    Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(RaffleAwardListRequestDTO requestDTO);

    /**
     * 执行随机抽奖接口
     * @param requestDTO 请求参数
     * @return 抽奖结果
     */
    Response<RaffleStrategyResponseDTO> randomRaffle(RaffleStrategyRequestDTO requestDTO);


}
