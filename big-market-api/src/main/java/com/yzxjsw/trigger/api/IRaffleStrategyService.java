package com.yzxjsw.trigger.api;

import com.yzxjsw.trigger.api.dto.*;
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
     * 查询抽奖策略权重规则，给用户展示出抽奖N次后必中奖奖品范围
     *
     * @param request 请求对象
     * @return 权重奖品配置列表「这里会返回全部，前端可按需展示一条已达标的，或者一条要达标的」
     */
    Response<List<RaffleStrategyRuleWeightResponseDTO>> queryRaffleStrategyRuleWeight(RaffleStrategyRuleWeightRequestDTO request);

    /**
     * 执行随机抽奖接口
     * @param requestDTO 请求参数
     * @return 抽奖结果
     */
    Response<RaffleStrategyResponseDTO> randomRaffle(RaffleStrategyRequestDTO requestDTO);


}
