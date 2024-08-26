/*
 Navicat Premium Data Transfer

 Source Server         : nvicat-mysql
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : big-market

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/08/2024 11:37:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
  `award_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
  `award_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品配置信息',
  `award_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品内容描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '奖品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES (1, 101, 'user_credit_random', '1,100', '用户积分', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (2, 102, 'openai_use_count', '5', 'OpenAI 增加使用次数', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (3, 103, 'openai_use_count', '10', 'OpenAI 增加使用次数', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (4, 104, 'openai_use_count', '20', 'OpenAI 增加使用次数', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (5, 105, 'openai_model', 'gpt-4', 'OpenAI 增加模型', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (6, 106, 'openai_model', 'dall-e-2', 'OpenAI 增加模型', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (7, 107, 'openai_model', 'dall-e-3', 'OpenAI 增加模型', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (8, 108, 'openai_use_count', '100', 'OpenAI 增加使用次数', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `award` VALUES (9, 109, 'openai_model', 'gpt-4,dall-e-2,dall-e-3', 'OpenAI 增加模型', '2024-07-06 14:48:35', '2024-07-06 14:48:35');

-- ----------------------------
-- Table structure for daily_behavior_rebate
-- ----------------------------
DROP TABLE IF EXISTS `daily_behavior_rebate`;
CREATE TABLE `daily_behavior_rebate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、pay 支付）',
  `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置ID',
  `state` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（open 开启、close 关闭）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_behavior_type`(`behavior_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日常行为返利活动配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_behavior_rebate
-- ----------------------------
INSERT INTO `daily_behavior_rebate` VALUES (1, 'sign', '签到返利-sku额度', 'sku', '400002', 'open', '2024-08-12 19:57:53', '2024-08-12 20:00:36');
INSERT INTO `daily_behavior_rebate` VALUES (2, 'sign', '签到返利-积分', 'integral', '10', 'open', '2024-08-12 19:57:53', '2024-08-12 19:57:53');

-- ----------------------------
-- Table structure for raffle_activity
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity`;
CREATE TABLE `raffle_activity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `activity_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动描述',
  `begin_date_time` datetime NOT NULL COMMENT '开始时间',
  `end_date_time` datetime NOT NULL COMMENT '结束时间',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `state` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_begin_date_time`(`begin_date_time` ASC) USING BTREE,
  INDEX `idx_end_date_time`(`end_date_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity
-- ----------------------------
INSERT INTO `raffle_activity` VALUES (1, 1000001, '测试', '测试RaffleOrder', '2024-07-22 15:49:23', '2024-07-22 15:49:29', 10001, 'create', '2024-07-22 15:49:38', '2024-07-22 15:55:52');
INSERT INTO `raffle_activity` VALUES (2, 1002, '测试下单', '测试库存扣减', '2024-07-23 15:31:40', '2024-08-18 15:31:42', 100001, 'open', '2024-07-23 15:31:47', '2024-08-12 14:39:56');
INSERT INTO `raffle_activity` VALUES (3, 200001, '活动，单元测试', '测试流程', '2024-08-11 15:50:52', '2024-08-31 15:51:01', 1000011, 'open', '2024-08-12 15:51:25', '2024-08-12 15:57:46');

-- ----------------------------
-- Table structure for raffle_activity_count
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_count`;
CREATE TABLE `raffle_activity_count`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `activity_count_id` bigint NOT NULL COMMENT '活动次数编号',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_activity_count_id`(`activity_count_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动次数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_count
-- ----------------------------
INSERT INTO `raffle_activity_count` VALUES (1, 10001, 1, 1, 1, '2024-07-22 15:50:01', '2024-07-22 15:50:01');
INSERT INTO `raffle_activity_count` VALUES (2, 300001, 1, 1, 1, '2024-07-23 15:32:15', '2024-08-12 15:52:38');

-- ----------------------------
-- Table structure for raffle_activity_sku
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_sku`;
CREATE TABLE `raffle_activity_sku`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sku` bigint NOT NULL COMMENT '商品sku - 把每一个组合当做一个商品',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_count_id` bigint NOT NULL COMMENT '活动个人参与次数ID',
  `stock_count` int NOT NULL COMMENT '商品库存',
  `stock_count_surplus` int NOT NULL COMMENT '剩余库存',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_sku`(`sku` ASC) USING BTREE,
  INDEX `idx_activity_id_activity_count_id`(`activity_id` ASC, `activity_count_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_sku
-- ----------------------------
INSERT INTO `raffle_activity_sku` VALUES (1, 10021, 1000001, 10001, 2, 2, '2024-07-22 15:50:29', '2024-07-22 15:50:29');
INSERT INTO `raffle_activity_sku` VALUES (2, 400001, 200001, 300001, 20, 20, '2024-07-23 15:30:42', '2024-08-12 15:53:06');
INSERT INTO `raffle_activity_sku` VALUES (3, 400002, 200001, 300001, 20, 11, '2024-08-12 20:00:17', '2024-08-16 11:09:30');

-- ----------------------------
-- Table structure for rule_tree
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree`;
CREATE TABLE `rule_tree`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
  `tree_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树名称',
  `tree_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则树描述',
  `tree_node_rule_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树根入口规则',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_tree_id`(`tree_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_tree
-- ----------------------------
INSERT INTO `rule_tree` VALUES (1, 'tree_lock_1', '规则树', '规则树', 'rule_lock', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree` VALUES (2, 'tree_luck_award', '规则树-兜底奖励', '规则树-兜底奖励', 'rule_stock', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree` VALUES (3, 'tree_lock_2', '规则树', '规则树', 'rule_lock', '2024-07-18 15:28:28', '2024-07-18 15:28:28');

-- ----------------------------
-- Table structure for rule_tree_node
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node`;
CREATE TABLE `rule_tree_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
  `rule_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key',
  `rule_desc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则描述',
  `rule_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则比值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_tree_node
-- ----------------------------
INSERT INTO `rule_tree_node` VALUES (1, 'tree_lock_1', 'rule_lock', '限定用户已完成N次抽奖后解锁', '1', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (2, 'tree_lock_1', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (3, 'tree_lock_1', 'rule_stock', '库存扣减规则', NULL, '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (4, 'tree_luck_award', 'rule_stock', '库存扣减规则', NULL, '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (5, 'tree_luck_award', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (6, 'tree_lock_2', 'rule_lock', '限定用户已完成N次抽奖后解锁', '2', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (7, 'tree_lock_2', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-07-18 15:28:28', '2024-07-18 15:28:28');
INSERT INTO `rule_tree_node` VALUES (8, 'tree_lock_2', 'rule_stock', '库存扣减规则', NULL, '2024-07-18 15:28:28', '2024-07-18 15:28:28');

-- ----------------------------
-- Table structure for rule_tree_node_line
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node_line`;
CREATE TABLE `rule_tree_node_line`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
  `rule_node_from` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key节点 From',
  `rule_node_to` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key节点 To',
  `rule_limit_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '限定类型；1:=;2:>;3:<;4:>=;5<=;6:enum[枚举范围];',
  `rule_limit_value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '限定值（到下个节点）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rule_tree_node_line
-- ----------------------------
INSERT INTO `rule_tree_node_line` VALUES (1, 'tree_lock_1', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (2, 'tree_lock_1', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (3, 'tree_lock_1', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (4, 'tree_luck_award', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (5, 'tree_lock_2', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (6, 'tree_lock_2', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2024-07-18 15:29:10', '2024-07-18 15:29:10');
INSERT INTO `rule_tree_node_line` VALUES (7, 'tree_lock_2', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-07-18 15:29:10', '2024-07-18 15:29:10');

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `strategy_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述',
  `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_strategy_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES (1, 100001, '抽奖策略', 'rule_weight,rule_blacklist', '2024-07-06 14:48:35', '2024-07-06 14:48:35');
INSERT INTO `strategy` VALUES (2, 100002, '测试初始版策略装配，无权重', NULL, '2024-07-06 16:50:18', '2024-07-06 16:50:18');
INSERT INTO `strategy` VALUES (3, 100003, '抽奖策略', 'rule_weight,rule_blacklist', '2024-07-06 17:37:54', '2024-07-07 17:35:41');
INSERT INTO `strategy` VALUES (6, 100004, '测试抽奖前处理', 'rule_blacklist,rule_weight', '2024-07-07 17:09:03', '2024-08-01 14:12:17');
INSERT INTO `strategy` VALUES (7, 100005, '测试抽奖后处理', 'rule_weight,rule_blacklist', '2024-07-07 19:48:26', '2024-08-02 15:56:26');
INSERT INTO `strategy` VALUES (8, 100006, '测试不超卖处理', 'rule_weight', '2024-07-10 16:53:29', '2024-08-02 17:33:32');
INSERT INTO `strategy` VALUES (9, 100007, '默认抽奖策略装配测试', NULL, '2024-07-11 17:11:47', '2024-07-11 17:11:47');
INSERT INTO `strategy` VALUES (10, 100008, '权重抽奖策略装配测试', 'rule_weight', '2024-07-11 17:12:18', '2024-07-11 17:12:18');
INSERT INTO `strategy` VALUES (11, 100009, '测试责任链bug', '', '2024-07-14 15:44:07', '2024-07-14 16:16:46');
INSERT INTO `strategy` VALUES (12, 1000010, '测试责任链bug', 'rule_weight,rule_blacklist', '2024-07-14 15:44:55', '2024-07-14 15:44:55');
INSERT INTO `strategy` VALUES (13, 1000011, '完整的一个策略', 'rule_weight,rule_blacklist', '2024-08-12 15:30:45', '2024-08-12 15:30:45');

-- ----------------------------
-- Table structure for strategy_award
-- ----------------------------
DROP TABLE IF EXISTS `strategy_award`;
CREATE TABLE `strategy_award`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖奖品标题',
  `award_subtitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖奖品副标题',
  `award_count` int NOT NULL DEFAULT 0 COMMENT '奖品库存总量',
  `award_count_surplus` int NOT NULL DEFAULT 0 COMMENT '奖品库存剩余',
  `award_rate` decimal(6, 4) NOT NULL COMMENT '奖品中奖概率',
  `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_strategy_id_award_id`(`strategy_id` ASC, `award_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略奖品配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES (1, 100001, 101, '随机积分', NULL, 80000, 79997, 0.5000, '', 1, '2024-07-06 14:55:35', '2024-08-12 15:02:10');
INSERT INTO `strategy_award` VALUES (2, 100001, 102, '5次使用', NULL, 10000, 10000, 0.2500, '', 2, '2024-07-06 14:55:35', '2024-08-12 14:55:01');
INSERT INTO `strategy_award` VALUES (3, 100001, 103, '10次使用', NULL, 5000, 5000, 0.1250, '', 3, '2024-07-06 14:55:35', '2024-08-12 14:55:03');
INSERT INTO `strategy_award` VALUES (4, 100001, 104, '20次使用', NULL, 4000, 4000, 0.0620, '', 4, '2024-07-06 14:55:35', '2024-08-12 14:55:05');
INSERT INTO `strategy_award` VALUES (5, 100001, 105, '增加gpt-4对话模型', NULL, 600, 600, 0.0310, '', 5, '2024-07-06 14:55:35', '2024-08-12 14:55:07');
INSERT INTO `strategy_award` VALUES (6, 100001, 106, '增加dall-e-2画图模型', NULL, 200, 200, 0.0160, '', 6, '2024-07-06 14:55:35', '2024-08-12 14:55:09');
INSERT INTO `strategy_award` VALUES (7, 100001, 107, '增加dall-e-3画图模型', '抽奖1次后解锁', 200, 200, 0.0080, 'rule_lock', 7, '2024-07-06 14:55:35', '2024-08-12 14:55:14');
INSERT INTO `strategy_award` VALUES (8, 100001, 108, '增加100次使用', '抽奖2次后解锁', 199, 199, 0.0040, 'rule_lock', 8, '2024-07-06 14:55:35', '2024-08-12 14:55:19');
INSERT INTO `strategy_award` VALUES (9, 100001, 109, '解锁全部模型', '抽奖6次后解锁', 1, 1, 0.0020, 'rule_lock', 9, '2024-07-06 14:55:35', '2024-08-12 14:55:25');
INSERT INTO `strategy_award` VALUES (10, 100002, 101, '随机积分', NULL, 80000, 80000, 0.5000, 'rule_random,rule_luck_award', 1, '2024-07-06 16:52:39', '2024-07-06 17:03:27');
INSERT INTO `strategy_award` VALUES (11, 100002, 102, '5次使用', NULL, 10000, 10000, 0.2500, 'rule_luck_award', 2, '2024-07-06 16:52:39', '2024-07-06 17:03:32');
INSERT INTO `strategy_award` VALUES (12, 100002, 103, '10次使用', NULL, 5000, 5000, 0.1250, 'rule_luck_award', 3, '2024-07-06 16:52:39', '2024-07-06 17:04:19');
INSERT INTO `strategy_award` VALUES (13, 100002, 104, '20次使用', NULL, 4000, 4000, 0.0620, 'rule_luck_award', 4, '2024-07-06 16:52:39', '2024-07-06 17:04:23');
INSERT INTO `strategy_award` VALUES (14, 100002, 105, '增加gpt-4对话模型', NULL, 600, 600, 0.0310, 'rule_luck_award', 5, '2024-07-06 16:52:39', '2024-07-06 17:04:27');
INSERT INTO `strategy_award` VALUES (15, 100002, 106, '增加dall-e-2画图模型', NULL, 200, 200, 0.0160, 'rule_luck_award', 6, '2024-07-06 16:52:39', '2024-07-06 17:04:30');
INSERT INTO `strategy_award` VALUES (16, 100002, 107, '增加dall-e-3画图模型', '抽奖1次后解锁', 200, 200, 0.0080, 'rule_lock,rule_luck_award', 7, '2024-07-06 16:52:39', '2024-07-06 17:04:36');
INSERT INTO `strategy_award` VALUES (17, 100002, 108, '增加100次使用', '抽奖2次后解锁', 199, 199, 0.0040, 'rule_lock,rule_luck_award', 8, '2024-07-06 16:52:39', '2024-07-06 17:04:03');
INSERT INTO `strategy_award` VALUES (18, 100002, 109, '解锁全部模型', '抽奖6次后解锁', 1, 1, 0.0020, 'rule_lock,rule_luck_award', 9, '2024-07-06 16:52:39', '2024-07-06 17:03:57');
INSERT INTO `strategy_award` VALUES (28, 100003, 101, '随机积分', NULL, 80000, 80000, 0.5000, 'rule_random,rule_luck_award', 1, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (29, 100003, 102, '5次使用', NULL, 10000, 10000, 0.2500, 'rule_luck_award', 2, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (30, 100003, 103, '10次使用', NULL, 5000, 5000, 0.1250, 'rule_luck_award', 3, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (31, 100003, 104, '20次使用', NULL, 4000, 4000, 0.0620, 'rule_luck_award', 4, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (32, 100003, 105, '增加gpt-4对话模型', NULL, 600, 600, 0.0310, 'rule_luck_award', 5, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (33, 100003, 106, '增加dall-e-2画图模型', NULL, 200, 200, 0.0160, 'rule_luck_award', 6, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (34, 100003, 107, '增加dall-e-3画图模型', '抽奖1次后解锁', 200, 200, 0.0080, 'rule_lock,rule_luck_award', 7, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (35, 100003, 108, '增加100次使用', '抽奖2次后解锁', 199, 199, 0.0040, 'rule_lock,rule_luck_award', 8, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (36, 100003, 109, '解锁全部模型', '抽奖6次后解锁', 1, 1, 0.0020, 'rule_lock,rule_luck_award', 9, '2024-07-06 17:37:54', '2024-07-06 17:37:54');
INSERT INTO `strategy_award` VALUES (43, 100004, 101, '随机积分', NULL, 80000, 80000, 0.5000, '', 1, '2024-07-07 17:09:03', '2024-07-08 17:47:39');
INSERT INTO `strategy_award` VALUES (44, 100004, 102, '5次使用', NULL, 10000, 10000, 0.2500, '', 2, '2024-07-07 17:09:03', '2024-07-08 17:47:42');
INSERT INTO `strategy_award` VALUES (45, 100004, 103, '10次使用', NULL, 5000, 5000, 0.2500, '', 3, '2024-07-07 17:09:03', '2024-07-08 17:47:45');
INSERT INTO `strategy_award` VALUES (46, 100005, 101, '随机积分', NULL, 80000, 80000, 0.5000, 'rule_lock', 1, '2024-07-07 19:48:26', '2024-08-01 17:24:28');
INSERT INTO `strategy_award` VALUES (47, 100005, 102, '5次使用', NULL, 10000, 10000, 0.2500, 'rule_lock', 2, '2024-07-07 19:48:26', '2024-08-01 17:24:33');
INSERT INTO `strategy_award` VALUES (48, 100005, 103, '10次使用', NULL, 5000, 5000, 0.2500, 'rule_lock', 3, '2024-07-07 19:48:26', '2024-08-01 17:24:42');
INSERT INTO `strategy_award` VALUES (51, 100007, 101, '随机积分', NULL, 80000, 80000, 0.5000, 'rule_random,rule_luck_award', 1, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (52, 100007, 102, '5次使用', NULL, 10000, 10000, 0.2500, 'rule_luck_award', 2, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (53, 100007, 103, '10次使用', NULL, 5000, 5000, 0.1250, 'rule_luck_award', 3, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (54, 100007, 104, '20次使用', NULL, 4000, 4000, 0.1250, 'rule_luck_award', 4, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (55, 100008, 101, '随机积分', NULL, 80000, 80000, 0.5000, 'rule_random,rule_luck_award', 1, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (56, 100008, 102, '5次使用', NULL, 10000, 10000, 0.2500, 'rule_luck_award', 2, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (57, 100008, 103, '10次使用', NULL, 5000, 5000, 0.1250, 'rule_luck_award', 3, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (58, 100008, 104, '20次使用', NULL, 4000, 4000, 0.1250, 'rule_luck_award', 4, '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_award` VALUES (59, 100009, 101, '随机积分', NULL, 80000, 80000, 0.5000, '', 1, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (60, 100009, 102, '5次使用', NULL, 10000, 10000, 0.2500, '', 2, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (61, 100009, 103, '10次使用', NULL, 5000, 5000, 0.2500, '', 3, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (62, 1000010, 101, '随机积分', NULL, 80000, 80000, 0.5000, '', 1, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (63, 1000010, 102, '5次使用', NULL, 10000, 10000, 0.2500, '', 2, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (64, 1000010, 103, '10次使用', NULL, 5000, 5000, 0.2500, '', 3, '2024-07-14 15:47:05', '2024-07-14 15:47:05');
INSERT INTO `strategy_award` VALUES (72, 100006, 101, '随机积分', NULL, 100, 100, 0.5000, NULL, 1, '2024-08-02 15:58:43', '2024-08-02 17:37:36');
INSERT INTO `strategy_award` VALUES (73, 100006, 102, '三等奖', NULL, 50, 0, 0.2500, NULL, 2, '2024-08-02 15:59:29', '2024-08-02 17:45:45');
INSERT INTO `strategy_award` VALUES (74, 100006, 103, '二等奖', NULL, 25, 0, 0.1500, NULL, 3, '2024-08-02 16:00:22', '2024-08-02 17:44:05');
INSERT INTO `strategy_award` VALUES (75, 100006, 104, '一等奖', '抽奖3次后解锁', 10, 0, 0.1000, 'rule_lock', 4, '2024-08-02 16:01:10', '2024-08-02 17:45:00');
INSERT INTO `strategy_award` VALUES (76, 1000011, 1000, '随机积分', NULL, 8000, 7996, 0.8900, NULL, 1, '2024-08-12 15:31:59', '2024-08-15 20:13:00');
INSERT INTO `strategy_award` VALUES (77, 1000011, 1001, '第一个奖品', NULL, 5000, 5000, 0.0400, NULL, 2, '2024-08-12 15:34:44', '2024-08-12 15:34:44');
INSERT INTO `strategy_award` VALUES (78, 1000011, 1002, '第二个奖品', NULL, 5000, 5000, 0.0200, NULL, 3, '2024-08-12 15:35:23', '2024-08-12 15:35:23');
INSERT INTO `strategy_award` VALUES (79, 1000011, 1003, '第三个奖品', NULL, 4000, 4000, 0.0200, NULL, 4, '2024-08-12 15:36:01', '2024-08-12 15:36:01');
INSERT INTO `strategy_award` VALUES (80, 1000011, 1004, '第四个奖品', NULL, 2000, 2000, 0.0100, NULL, 5, '2024-08-12 15:36:31', '2024-08-12 15:36:31');
INSERT INTO `strategy_award` VALUES (81, 1000011, 1005, '第五个奖品', NULL, 2000, 2000, 0.0100, NULL, 6, '2024-08-12 15:37:11', '2024-08-12 15:37:11');
INSERT INTO `strategy_award` VALUES (82, 1000011, 1006, '第六个奖品', NULL, 1000, 1000, 0.0050, 'lock', 7, '2024-08-12 15:38:08', '2024-08-12 15:38:08');
INSERT INTO `strategy_award` VALUES (83, 1000011, 1007, '第七个奖品', '抽奖5次后解锁', 1000, 1000, 0.0025, 'lock', 8, '2024-08-12 15:38:56', '2024-08-12 15:38:56');
INSERT INTO `strategy_award` VALUES (84, 1000011, 1009, '第八个奖品', '抽奖10次后解锁', 1000, 1000, 0.0025, 'lock', 9, '2024-08-12 15:39:28', '2024-08-12 15:39:28');

-- ----------------------------
-- Table structure for strategy_rule
-- ----------------------------
DROP TABLE IF EXISTS `strategy_rule`;
CREATE TABLE `strategy_rule`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` int NOT NULL COMMENT '抽奖策略ID',
  `award_id` int NULL DEFAULT NULL COMMENT '抽奖奖品ID【规则类型为策略，则不需要奖品ID】',
  `rule_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '抽象规则类型；1-策略规则、2-奖品规则',
  `rule_model` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则类型【rule_random - 随机值计算、rule_lock - 抽奖几次后解锁、rule_luck_award - 幸运奖(兜底奖品)】',
  `rule_value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则比值',
  `rule_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_strategy_id_award_id`(`strategy_id` ASC, `award_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略规则配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES (1, 100001, 101, 2, 'rule_random', '1,1000', '随机积分策略', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (2, 100001, 107, 2, 'rule_lock', '1', '抽奖1次后解锁', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (3, 100001, 108, 2, 'rule_lock', '2', '抽奖2次后解锁', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (4, 100001, 109, 2, 'rule_lock', '6', '抽奖6次后解锁', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (5, 100001, 107, 2, 'rule_luck_award', '1,100', '兜底奖品100以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (6, 100001, 108, 2, 'rule_luck_award', '1,100', '兜底奖品100以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (7, 100001, 101, 2, 'rule_luck_award', '1,10', '兜底奖品10以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (8, 100001, 102, 2, 'rule_luck_award', '1,20', '兜底奖品20以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (9, 100001, 103, 2, 'rule_luck_award', '1,30', '兜底奖品30以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (10, 100001, 104, 2, 'rule_luck_award', '1,40', '兜底奖品40以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (11, 100001, 105, 2, 'rule_luck_award', '1,50', '兜底奖品50以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (12, 100001, 106, 2, 'rule_luck_award', '1,60', '兜底奖品60以内随机积分', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (13, 100001, NULL, 1, 'rule_weight', '6000:102,103,104,105,106,107,108,109', '消耗6000分，必中奖范围', '2024-07-06 14:55:36', '2024-07-06 14:55:36');
INSERT INTO `strategy_rule` VALUES (14, 100001, NULL, 1, 'rule_blacklist', '100:user1,user2,user3', '黑名单抽奖，积分兜底', '2024-07-06 14:55:36', '2024-07-07 15:02:10');
INSERT INTO `strategy_rule` VALUES (15, 100003, NULL, 1, 'rule_weight', '4000:102,103,104,105 5000:102,103,104,105,106,107 6000:102,103,104,105,106,107,108,109', '消耗6000分，必中奖范围', '2024-07-06 17:37:54', '2024-07-06 17:41:26');
INSERT INTO `strategy_rule` VALUES (17, 100004, NULL, 1, 'rule_weight', '6000:102,103', '消耗6000分，必中奖范围', '2024-07-07 17:09:03', '2024-07-07 17:09:03');
INSERT INTO `strategy_rule` VALUES (18, 100004, NULL, 1, 'rule_blacklist', '101:user1,user2,user3', '黑名单规则', '2024-07-07 17:09:03', '2024-08-01 14:19:22');
INSERT INTO `strategy_rule` VALUES (30, 100005, NULL, 1, 'rule_weight', '6000:102,103', '消耗6000分，必中奖范围', '2024-07-07 19:55:56', '2024-07-07 19:55:56');
INSERT INTO `strategy_rule` VALUES (31, 100005, NULL, 1, 'rule_blacklist', '101:user1,user2,user3', '黑名单规则', '2024-07-07 19:55:56', '2024-08-01 17:25:09');
INSERT INTO `strategy_rule` VALUES (32, 100005, 101, 2, 'rule_lock', '2', '抽奖两次后解锁', '2024-07-07 19:55:56', '2024-07-07 19:55:56');
INSERT INTO `strategy_rule` VALUES (33, 100005, 102, 2, 'rule_lock', '4', '抽奖四次后解锁', '2024-07-07 19:55:56', '2024-07-07 19:55:56');
INSERT INTO `strategy_rule` VALUES (34, 100005, 103, 2, 'rule_lock', '6', '抽奖六次后解锁', '2024-07-07 19:55:56', '2024-07-07 19:55:56');
INSERT INTO `strategy_rule` VALUES (35, 100008, NULL, 1, 'rule_weight', '6000:102,103,104', '消耗6000分，必中奖范围', '2024-07-11 17:16:34', '2024-07-11 17:16:34');
INSERT INTO `strategy_rule` VALUES (36, 1000010, NULL, 1, 'rule_weight', '6000:102,103', '消耗6000分，必中奖范围', '2024-07-14 15:47:41', '2024-07-14 15:47:41');
INSERT INTO `strategy_rule` VALUES (37, 1000010, NULL, 1, 'rule_blacklist', '100:user1,user2,user3', '黑名单规则', '2024-07-14 15:47:41', '2024-07-14 15:47:41');
INSERT INTO `strategy_rule` VALUES (38, 100005, 101, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-01 17:38:09', '2024-08-01 17:45:19');
INSERT INTO `strategy_rule` VALUES (41, 100005, 102, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-01 17:45:14', '2024-08-01 17:45:14');
INSERT INTO `strategy_rule` VALUES (42, 100005, 103, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-01 17:45:46', '2024-08-01 17:45:46');
INSERT INTO `strategy_rule` VALUES (43, 100006, 104, 2, 'rule_lock', '3', '抽奖三次后解锁', '2024-08-02 16:02:34', '2024-08-02 16:02:34');
INSERT INTO `strategy_rule` VALUES (44, 100006, 101, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-02 16:03:06', '2024-08-02 17:23:45');
INSERT INTO `strategy_rule` VALUES (45, 100006, 102, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-02 16:03:26', '2024-08-02 17:23:51');
INSERT INTO `strategy_rule` VALUES (46, 100006, 103, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-02 16:03:49', '2024-08-02 17:23:55');
INSERT INTO `strategy_rule` VALUES (47, 100006, 104, 2, 'rule_luck', '101:1,100', '兜底积分', '2024-08-02 16:04:14', '2024-08-02 17:23:59');
INSERT INTO `strategy_rule` VALUES (48, 100006, NULL, 1, 'rule_weight', '100:102,103,104', '权重抽奖', '2024-08-02 17:23:39', '2024-08-02 17:23:39');
INSERT INTO `strategy_rule` VALUES (49, 1000011, 1001, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:41:53', '2024-08-12 15:43:32');
INSERT INTO `strategy_rule` VALUES (50, 1000011, 1002, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:42:13', '2024-08-12 15:43:38');
INSERT INTO `strategy_rule` VALUES (51, 1000011, 1003, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:42:35', '2024-08-12 15:43:41');
INSERT INTO `strategy_rule` VALUES (52, 1000011, 1004, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:42:56', '2024-08-12 15:43:45');
INSERT INTO `strategy_rule` VALUES (53, 1000011, 1005, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:43:24', '2024-08-12 15:43:24');
INSERT INTO `strategy_rule` VALUES (54, 1000011, 1006, 2, 'luck', '1000:100,200', '兜底随机积分', '2024-08-12 15:44:22', '2024-08-12 15:44:57');
INSERT INTO `strategy_rule` VALUES (55, 1000011, 1007, 2, 'luck', '1000:100,200', '兜底随机积分', '2024-08-12 15:44:50', '2024-08-12 15:44:50');
INSERT INTO `strategy_rule` VALUES (56, 1000011, 1008, 2, 'luck', '1000:100,200', '兜底随机积分', '2024-08-12 15:45:29', '2024-08-12 15:45:29');
INSERT INTO `strategy_rule` VALUES (57, 1000011, 1000, 2, 'luck', '1000:1,100', '兜底随机积分', '2024-08-12 15:46:06', '2024-08-12 15:46:06');
INSERT INTO `strategy_rule` VALUES (58, 1000011, 1006, 2, 'lock', '1', '抽奖一次后解锁', '2024-08-12 15:46:50', '2024-08-12 15:46:50');
INSERT INTO `strategy_rule` VALUES (59, 1000011, 1007, 2, 'lock', '5', '抽奖五次后解锁', '2024-08-12 15:47:08', '2024-08-12 15:47:08');
INSERT INTO `strategy_rule` VALUES (60, 1000011, 1008, 2, 'lock', '10', '抽奖十次后解锁', '2024-08-12 15:47:35', '2024-08-12 15:47:35');
INSERT INTO `strategy_rule` VALUES (61, 1000011, NULL, 1, 'rule_weight', '6000:1002,1003,1004,1005,1006,1007,1008', '权重抽奖范围', '2024-08-12 15:48:32', '2024-08-12 15:48:32');
INSERT INTO `strategy_rule` VALUES (62, 1000011, NULL, 1, 'rule_blacklist', '1000:user1,user2,user3', '黑名单规则', '2024-08-12 15:49:21', '2024-08-12 15:49:21');

SET FOREIGN_KEY_CHECKS = 1;
