package com.yzxjsw.domain.activity.service.partake;

import com.yzxjsw.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import com.yzxjsw.domain.activity.model.entity.*;
import com.yzxjsw.domain.activity.model.valobj.UserRaffleOrderStateVO;
import com.yzxjsw.domain.activity.repository.IActivityRepository;
import com.yzxjsw.types.enums.ResponseCode;
import com.yzxjsw.types.exception.AppException;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * RaffleActivityPartakeService
 *
 * @author yezhenxiong
 * @version 2024/08/09 21:58
 **/
@Service
public class RaffleActivityPartakeService extends AbstractRaffleActivityPartake{
    private final SimpleDateFormat dateFormatMonth = new SimpleDateFormat("yyyy-MM");
    private final SimpleDateFormat dateFormatDay = new SimpleDateFormat("yyyy-MM-dd");

    protected RaffleActivityPartakeService(IActivityRepository activityRepository) {
        super(activityRepository);
    }

    @Override
    protected CreatePartakeOrderAggregate doFilterAccount(String userId, Long activityId, Date currentDate) {
        // 查询总账户额度
        ActivityAccountEntity activityAccountEntity = activityRepository.queryActivityAccountByUserId(userId, activityId);

        // 额度判断（只判断总剩余额度）
        if (null == activityAccountEntity || activityAccountEntity.getTotalCountSurplus() <= 0) {
            throw new AppException(ResponseCode.ACCOUNT_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_QUOTA_ERROR.getInfo());
        }

        String month = dateFormatMonth.format(currentDate);
        String day = dateFormatDay.format(currentDate);

        // 查询月账户额度
        ActivityAccountMonthEntity activityAccountMonthEntity = activityRepository.queryActivityAccountMonthByUserId(userId, activityId, month);
        if (null != activityAccountMonthEntity && activityAccountMonthEntity.getMonthCountSurplus() <= 0) {
            throw new AppException(ResponseCode.ACCOUNT_MONTH_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_MONTH_QUOTA_ERROR.getInfo());
        }

        // 创建月账户额度；true = 存在月账户、false = 不存在月账户
        boolean isExistAccountMonth = (null != activityAccountMonthEntity);
        if (null == activityAccountMonthEntity) {
            activityAccountMonthEntity = new ActivityAccountMonthEntity();
            activityAccountMonthEntity.setUserId(userId);
            activityAccountMonthEntity.setActivityId(activityId);
            activityAccountMonthEntity.setMonth(month);
            activityAccountMonthEntity.setMonthCount(activityAccountEntity.getMonthCount());
            activityAccountMonthEntity.setMonthCountSurplus(activityAccountEntity.getMonthCountSurplus());
        }

        // 查询日账户额度
        ActivityAccountDayEntity activityAccountDayEntity = activityRepository.queryActivityAccountDayByUserId(userId, activityId, day);
        if (null != activityAccountDayEntity && activityAccountDayEntity.getDayCountSurplus() <= 0) {
            throw new AppException(ResponseCode.ACCOUNT_DAY_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_DAY_QUOTA_ERROR.getInfo());
        }

        // 创建月账户额度；true = 存在月账户、false = 不存在月账户
        boolean isExistAccountDay = (null != activityAccountDayEntity);
        if (null == activityAccountDayEntity) {
            activityAccountDayEntity = new ActivityAccountDayEntity();
            activityAccountDayEntity.setUserId(userId);
            activityAccountDayEntity.setActivityId(activityId);
            activityAccountDayEntity.setDay(day);
            activityAccountDayEntity.setDayCount(activityAccountEntity.getDayCount());
            activityAccountDayEntity.setDayCountSurplus(activityAccountEntity.getDayCountSurplus());
        }

        // 构建对象
        CreatePartakeOrderAggregate createPartakeOrderAggregate = new CreatePartakeOrderAggregate();
        createPartakeOrderAggregate.setUserId(userId);
        createPartakeOrderAggregate.setActivityId(activityId);

        createPartakeOrderAggregate.setActivityAccountEntity(activityAccountEntity);

        createPartakeOrderAggregate.setExistAccountMonth(isExistAccountMonth);
        createPartakeOrderAggregate.setActivityAccountMonthEntity(activityAccountMonthEntity);

        createPartakeOrderAggregate.setExistAccountDay(isExistAccountDay);
        createPartakeOrderAggregate.setActivityAccountDayEntity(activityAccountDayEntity);

        return createPartakeOrderAggregate;
    }

    @Override
    protected UserRaffleOrderEntity buildUserRaffleOrder(String userId, Date currentDate, ActivityEntity activityEntity) {

        // 构建订单
        UserRaffleOrderEntity userRaffleOrder = new UserRaffleOrderEntity();
        userRaffleOrder.setUserId(userId);
        userRaffleOrder.setActivityId(activityEntity.getActivityId());
        userRaffleOrder.setActivityName(activityEntity.getActivityName());
        userRaffleOrder.setStrategyId(activityEntity.getStrategyId());
        userRaffleOrder.setOrderId(RandomStringUtils.randomNumeric(12));
        userRaffleOrder.setOrderTime(currentDate);
        userRaffleOrder.setOrderState(UserRaffleOrderStateVO.create);
        return userRaffleOrder;
    }
}
