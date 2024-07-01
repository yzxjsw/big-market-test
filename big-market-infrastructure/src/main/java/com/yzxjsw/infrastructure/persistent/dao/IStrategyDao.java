package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.Strategy;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IStrategyDao 策略DAO
 *
 * @author yezhenxiong
 * @version 2024/06/27 22:02
 **/
@Mapper
public interface IStrategyDao {

    List<Strategy> queryStrategyList();

    Strategy queryStrategyByStrategyId(Long strategyId);
}
