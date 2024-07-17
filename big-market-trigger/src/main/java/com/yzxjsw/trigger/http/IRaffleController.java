package com.yzxjsw.trigger.http;

import com.alibaba.fastjson.JSON;
import com.yzxjsw.domain.strategy.service.armory.IStrategyArmory;
import com.yzxjsw.trigger.api.IRaffleService;
import com.yzxjsw.trigger.api.dto.RaffleAwardListRequestDTO;
import com.yzxjsw.trigger.api.dto.RaffleAwardListResponseDTO;
import com.yzxjsw.trigger.api.dto.RaffleRequestDTO;
import com.yzxjsw.trigger.api.dto.RaffleResponseDTO;
import com.yzxjsw.types.enums.ResponseCode;
import com.yzxjsw.types.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * IRaffleController
 *
 * @author yezhenxiong
 * @version 2024/07/15 14:47
 **/
@Slf4j
@RestController
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/")
public class IRaffleController implements IRaffleService {

    @Resource
    private IStrategyArmory strategyArmory;


    @Override
    @RequestMapping(value = "strategy_armory", method = RequestMethod.GET)
    public Response<Boolean> strategyArmory(Long strategyId) {
        try {
            log.info("抽奖策略装配开始 strategyId：{}", strategyId);
            boolean armoryStatus = strategyArmory.assembleLotteryStrategy(strategyId);
            Response<Boolean> response = Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(armoryStatus)
                    .build();
            log.info("抽奖策略装配完成 strategyId：{} response: {}", strategyId, JSON.toJSONString(response));
            return response;
        } catch (Exception e) {
            log.error("抽奖策略装配失败 strategyId：{}", strategyId, e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    @Override
    public Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(RaffleAwardListRequestDTO requestDTO) {
        return null;
    }

    @Override
    public Response<RaffleResponseDTO> randomRaffle(RaffleRequestDTO requestDTO) {
        return null;
    }
}
