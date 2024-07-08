package com.yzxjsw.domain.strategy.service.annotation;

import com.yzxjsw.domain.strategy.service.rule.filter.factory.DefaultLogicFactory;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * LogicStrategy 策略自定义枚举
 *
 * @author yezhenxiong
 * @version 2024/07/02 15:41
 **/
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface LogicStrategy {

    DefaultLogicFactory.LogicModel logicMode();

}
