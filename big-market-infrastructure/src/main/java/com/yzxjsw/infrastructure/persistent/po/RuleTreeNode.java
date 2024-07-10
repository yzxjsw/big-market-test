package com.yzxjsw.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * RuleTreeNode 规则树结点
 *
 * @author yezhenxiong
 * @version 2024/07/09 16:01
 **/
@Data
public class RuleTreeNode {

    /** 自增ID */
    private Long id;
    /** 规则树ID */
    private String treeId;
    /** 规则Key */
    private String ruleKey;
    /** 规则描述 */
    private String ruleDesc;
    /** 规则比值 */
    private String ruleValue;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;

}
