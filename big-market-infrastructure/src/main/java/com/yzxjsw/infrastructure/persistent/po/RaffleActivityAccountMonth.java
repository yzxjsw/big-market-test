package com.yzxjsw.infrastructure.persistent.po;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * RaffleActivityAccountMouth 用户活动账户-月次数
 *
 * @author yezhenxiong
 * @version 2024/08/09 15:23
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleActivityAccountMonth {
    /** 自增ID */
    private String id;
    /** 用户ID */
    private String userId;
    /** 活动ID */
    private Long activityId;
    /** 月（yyyy-mm） */
    private String month;
    /** 月次数 */
    private Integer monthCount;
    /** 月次数-剩余 */
    private Integer monthCountSurplus;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;

}
