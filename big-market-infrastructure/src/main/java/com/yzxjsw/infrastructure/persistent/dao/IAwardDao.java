package com.yzxjsw.infrastructure.persistent.dao;

import com.yzxjsw.infrastructure.persistent.po.Award;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * IAwardDao 奖品表的DAO
 *
 * @author yezhenxiong
 * @version 2024/06/27 22:01
 **/

@Mapper
public interface IAwardDao {

    List<Award> queryAwardList();
}
