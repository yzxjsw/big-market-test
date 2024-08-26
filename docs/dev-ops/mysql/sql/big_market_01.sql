/*
 Navicat Premium Data Transfer

 Source Server         : nvicat-mysql
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : big_market_01

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/08/2024 11:37:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for raffle_activity_account
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account`;
CREATE TABLE `raffle_activity_account`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `total_count` int NOT NULL COMMENT '总次数',
  `total_count_surplus` int NOT NULL COMMENT '总次数-剩余',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------
INSERT INTO `raffle_activity_account` VALUES (6, 'test_user', 200001, 6, 1, 6, 1, 6, 1, '2024-08-13 15:31:25', '2024-08-16 11:09:24');
INSERT INTO `raffle_activity_account` VALUES (7, 'user1', 200001, 1, 1, 1, 1, 1, 1, '2024-08-16 10:16:48', '2024-08-16 10:16:48');

-- ----------------------------
-- Table structure for raffle_activity_account_day
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_day`;
CREATE TABLE `raffle_activity_account_day`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日期（yyyy-mm-dd）',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_user_id_activity_id_day`(`user_id` ASC, `activity_id` ASC, `day` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-日次数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------
INSERT INTO `raffle_activity_account_day` VALUES (4, 'test_user', 200001, '2024-08-14', 3, 0, '2024-08-14 14:28:43', '2024-08-14 15:40:43');
INSERT INTO `raffle_activity_account_day` VALUES (5, 'test_user', 200001, '2024-08-15', 5, 0, '2024-08-15 18:44:34', '2024-08-15 20:12:46');

-- ----------------------------
-- Table structure for raffle_activity_account_month
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_month`;
CREATE TABLE `raffle_activity_account_month`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月（yyyy-mm）',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_user_id_activity_id_month`(`user_id` ASC, `activity_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-月次数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------
INSERT INTO `raffle_activity_account_month` VALUES (3, 'test_user', 200001, '2024-08', 6, 1, '2024-08-14 14:28:43', '2024-08-16 11:09:24');

-- ----------------------------
-- Table structure for raffle_activity_order_000
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_000`;
CREATE TABLE `raffle_activity_order_000`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_000
-- ----------------------------
INSERT INTO `raffle_activity_order_000` VALUES (1, 'user1', 400002, 200001, '活动，单元测试', 1000011, '266212228322', '2024-08-16 02:16:48', 1, 1, 1, 'completed', 'user1_sku_20240816', '2024-08-16 10:16:48', '2024-08-16 10:16:48');

-- ----------------------------
-- Table structure for raffle_activity_order_001
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_001`;
CREATE TABLE `raffle_activity_order_001`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_001
-- ----------------------------
INSERT INTO `raffle_activity_order_001` VALUES (98, 'test_user', 400002, 200001, '活动，单元测试', 1000011, '856687500898', '2024-08-16 03:09:25', 1, 1, 1, 'completed', 'test_user_sku_20240816', '2024-08-16 11:09:24', '2024-08-16 11:09:24');

-- ----------------------------
-- Table structure for raffle_activity_order_002
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_002`;
CREATE TABLE `raffle_activity_order_002`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_003
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_003`;
CREATE TABLE `raffle_activity_order_003`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `sku` bigint NOT NULL COMMENT '商品sku',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_003
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `topic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主题',
  `message_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息编号',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主体',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_message_id`(`message_id` ASC) USING BTREE,
  INDEX `idx_state`(`state` ASC) USING BTREE,
  INDEX `idx_create_time`(`update_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表，发送MQ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'test_user', 'send_award', '16311521359', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"16311521359\",\"timestamp\":1723446130578}', 'completed', '2024-08-12 15:02:10', '2024-08-12 15:02:10');
INSERT INTO `task` VALUES (2, 'test_user', 'send_award', '74633756272', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"74633756272\",\"timestamp\":1723449606521}', 'completed', '2024-08-12 16:00:06', '2024-08-12 16:00:06');
INSERT INTO `task` VALUES (3, 'test_user', 'send_rebate', '25550150469', '{\"data\":{\"bizId\":\"test_user_sku_20240812\",\"rebateConfig\":\"400002\",\"rebateType\":\"sign\",\"userId\":\"test_user\"},\"id\":\"25550150469\",\"timestamp\":1723467077194}', 'completed', '2024-08-12 20:51:17', '2024-08-12 20:51:17');
INSERT INTO `task` VALUES (4, 'test_user', 'send_rebate', '65143154185', '{\"data\":{\"bizId\":\"test_user_integral_20240812\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"test_user\"},\"id\":\"65143154185\",\"timestamp\":1723467077196}', 'completed', '2024-08-12 20:51:17', '2024-08-12 20:51:17');
INSERT INTO `task` VALUES (5, 'test_user', 'send_rebate', '23541082779', '{\"data\":{\"bizId\":\"test_user_sku_20240811\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"23541082779\",\"timestamp\":1723468963006}', 'completed', '2024-08-12 21:22:43', '2024-08-12 21:22:43');
INSERT INTO `task` VALUES (6, 'test_user', 'send_rebate', '43058060609', '{\"data\":{\"bizId\":\"test_user_integral_20240811\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"43058060609\",\"timestamp\":1723468963008}', 'completed', '2024-08-12 21:22:43', '2024-08-12 21:22:43');
INSERT INTO `task` VALUES (7, 'test_user', 'send_rebate', '23633684595', '{\"data\":{\"bizId\":\"test_user_sku_20240810\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"23633684595\",\"timestamp\":1723469196828}', 'completed', '2024-08-12 21:26:36', '2024-08-12 21:26:36');
INSERT INTO `task` VALUES (8, 'test_user', 'send_rebate', '48503263862', '{\"data\":{\"bizId\":\"test_user_integral_20240810\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"48503263862\",\"timestamp\":1723469196830}', 'completed', '2024-08-12 21:26:36', '2024-08-12 21:26:36');
INSERT INTO `task` VALUES (9, 'test_user', 'send_rebate', '64191476052', '{\"data\":{\"bizId\":\"test_user_sku_20240809\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"64191476052\",\"timestamp\":1723469555970}', 'completed', '2024-08-12 21:32:36', '2024-08-12 21:32:36');
INSERT INTO `task` VALUES (10, 'test_user', 'send_rebate', '19784764921', '{\"data\":{\"bizId\":\"test_user_integral_20240809\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"19784764921\",\"timestamp\":1723469555972}', 'completed', '2024-08-12 21:32:36', '2024-08-12 21:32:36');
INSERT INTO `task` VALUES (11, 'test_user', 'send_rebate', '85130717044', '{\"data\":{\"bizId\":\"test_user_sku_20240813\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"85130717044\",\"timestamp\":1723516719647}', 'completed', '2024-08-13 10:52:37', '2024-08-13 10:54:51');
INSERT INTO `task` VALUES (12, 'test_user', 'send_rebate', '02174144159', '{\"data\":{\"bizId\":\"test_user_integral_20240813\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"02174144159\",\"timestamp\":1723517064297}', 'completed', '2024-08-13 10:52:57', '2024-08-13 10:54:52');
INSERT INTO `task` VALUES (13, 'test_user', 'send_rebate', '25807892996', '{\"data\":{\"bizId\":\"test_user_sku_20240814\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"25807892996\",\"timestamp\":1723519024670}', 'completed', '2024-08-13 11:17:04', '2024-08-13 11:17:23');
INSERT INTO `task` VALUES (14, 'test_user', 'send_rebate', '23327666024', '{\"data\":{\"bizId\":\"test_user_integral_20240814\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"23327666024\",\"timestamp\":1723519024673}', 'completed', '2024-08-13 11:17:04', '2024-08-13 11:17:24');
INSERT INTO `task` VALUES (15, 'test_user', 'send_rebate', '10654921104', '{\"data\":{\"bizId\":\"test_user_sku_20240815\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"10654921104\",\"timestamp\":1723532911413}', 'completed', '2024-08-13 15:08:39', '2024-08-13 15:08:39');
INSERT INTO `task` VALUES (16, 'test_user', 'send_rebate', '65611721476', '{\"data\":{\"bizId\":\"test_user_integral_20240815\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"65611721476\",\"timestamp\":1723532911418}', 'completed', '2024-08-13 15:08:39', '2024-08-13 15:08:39');
INSERT INTO `task` VALUES (17, 'test_user', 'send_rebate', '84017464949', '{\"data\":{\"bizId\":\"test_user_sku_20240815\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"84017464949\",\"timestamp\":1723533840936}', 'completed', '2024-08-13 15:24:01', '2024-08-13 15:24:01');
INSERT INTO `task` VALUES (18, 'test_user', 'send_rebate', '20255917338', '{\"data\":{\"bizId\":\"test_user_integral_20240815\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"20255917338\",\"timestamp\":1723533840939}', 'completed', '2024-08-13 15:24:01', '2024-08-13 15:24:01');
INSERT INTO `task` VALUES (21, 'test_user', 'send_rebate', '50320205052', '{\"data\":{\"bizId\":\"test_user_sku_20240815\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"50320205052\",\"timestamp\":1723534251010}', 'completed', '2024-08-13 15:30:51', '2024-08-13 15:31:14');
INSERT INTO `task` VALUES (22, 'test_user', 'send_rebate', '32404755646', '{\"data\":{\"bizId\":\"test_user_integral_20240815\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"32404755646\",\"timestamp\":1723534251013}', 'completed', '2024-08-13 15:30:51', '2024-08-13 15:31:14');
INSERT INTO `task` VALUES (23, 'test_user', 'send_rebate', '73892348924', '{\"data\":{\"bizId\":\"test_user_sku_20240814\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"73892348924\",\"timestamp\":1723534384714}', 'completed', '2024-08-13 15:33:05', '2024-08-13 15:33:07');
INSERT INTO `task` VALUES (24, 'test_user', 'send_rebate', '20435621017', '{\"data\":{\"bizId\":\"test_user_integral_20240814\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"20435621017\",\"timestamp\":1723534384719}', 'completed', '2024-08-13 15:33:05', '2024-08-13 15:33:07');
INSERT INTO `task` VALUES (25, 'test_user', 'send_award', '21080556139', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"21080556139\",\"timestamp\":1723616923954}', 'completed', '2024-08-14 14:28:44', '2024-08-14 14:28:44');
INSERT INTO `task` VALUES (26, 'test_user', 'send_award', '85420263262', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"85420263262\",\"timestamp\":1723616980953}', 'completed', '2024-08-14 14:29:40', '2024-08-14 14:29:40');
INSERT INTO `task` VALUES (27, 'test_user', 'send_rebate', '74205655173', '{\"data\":{\"bizId\":\"test_user_sku_20240816\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"74205655173\",\"timestamp\":1723617132490}', 'completed', '2024-08-14 14:32:12', '2024-08-14 14:32:12');
INSERT INTO `task` VALUES (28, 'test_user', 'send_rebate', '19128149615', '{\"data\":{\"bizId\":\"test_user_integral_20240816\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"19128149615\",\"timestamp\":1723617132492}', 'completed', '2024-08-14 14:32:12', '2024-08-14 14:32:12');
INSERT INTO `task` VALUES (29, 'test_user', 'send_award', '75575196008', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"75575196008\",\"timestamp\":1723621657156}', 'completed', '2024-08-14 16:12:56', '2024-08-14 16:12:56');
INSERT INTO `task` VALUES (30, 'test_user', 'send_rebate', '96843783390', '{\"data\":{\"bizId\":\"test_user_sku_20240810\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"96843783390\",\"timestamp\":1723717207730}', 'completed', '2024-08-15 18:20:08', '2024-08-15 18:20:08');
INSERT INTO `task` VALUES (31, 'test_user', 'send_rebate', '90493970047', '{\"data\":{\"bizId\":\"test_user_integral_20240810\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"90493970047\",\"timestamp\":1723717207733}', 'completed', '2024-08-15 18:20:08', '2024-08-15 18:20:08');
INSERT INTO `task` VALUES (32, 'test_user', 'send_award', '11572325914', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"11572325914\",\"timestamp\":1723723517842}', 'completed', '2024-08-15 20:05:19', '2024-08-15 20:05:19');
INSERT INTO `task` VALUES (33, 'test_user', 'send_rebate', '42237676785', '{\"data\":{\"bizId\":\"test_user_sku_20240819\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"42237676785\",\"timestamp\":1723723587942}', 'completed', '2024-08-15 20:06:28', '2024-08-15 20:06:28');
INSERT INTO `task` VALUES (34, 'test_user', 'send_rebate', '85431578986', '{\"data\":{\"bizId\":\"test_user_integral_20240819\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"85431578986\",\"timestamp\":1723723587944}', 'completed', '2024-08-15 20:06:28', '2024-08-15 20:06:28');
INSERT INTO `task` VALUES (35, 'test_user', 'send_award', '99199938998', '{\"data\":{\"awardId\":1000,\"awardTitle\":\"随机积分\",\"userId\":\"test_user\"},\"id\":\"99199938998\",\"timestamp\":1723724535669}', 'completed', '2024-08-15 20:31:26', '2024-08-15 20:31:26');
INSERT INTO `task` VALUES (36, 'user1', 'send_rebate', '82941596596', '{\"data\":{\"bizId\":\"user1_sku_20240816\",\"rebateConfig\":\"400002\",\"rebateType\":\"sku\",\"userId\":\"user1\"},\"id\":\"82941596596\",\"timestamp\":1723774608187}', 'completed', '2024-08-16 10:16:48', '2024-08-16 10:16:48');
INSERT INTO `task` VALUES (37, 'user1', 'send_rebate', '62047059965', '{\"data\":{\"bizId\":\"user1_integral_20240816\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user1\"},\"id\":\"62047059965\",\"timestamp\":1723774608187}', 'completed', '2024-08-16 10:16:48', '2024-08-16 10:16:48');
INSERT INTO `task` VALUES (38, 'test_user', 'send_rebate', '68870561535', '{\"data\":{\"bizId\":\"test_user_sku_20240816\",\"rebateConfig\":\"400002\",\"rebateDesc\":\"签到返利-sku额度\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"68870561535\",\"timestamp\":1723777579878}', 'completed', '2024-08-16 11:06:24', '2024-08-16 11:06:24');
INSERT INTO `task` VALUES (39, 'test_user', 'send_rebate', '76619128556', '{\"data\":{\"bizId\":\"test_user_integral_20240816\",\"rebateConfig\":\"10\",\"rebateDesc\":\"签到返利-积分\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"76619128556\",\"timestamp\":1723777579881}', 'completed', '2024-08-16 11:06:24', '2024-08-16 11:06:24');
INSERT INTO `task` VALUES (40, 'test_user', 'send_rebate', '32123640617', '{\"data\":{\"bizId\":\"test_user_sku_20240816\",\"rebateConfig\":\"400002\",\"rebateDesc\":\"签到返利-sku额度\",\"rebateType\":\"sku\",\"userId\":\"test_user\"},\"id\":\"32123640617\",\"timestamp\":1723777764514}', 'completed', '2024-08-16 11:09:24', '2024-08-16 11:09:24');
INSERT INTO `task` VALUES (41, 'test_user', 'send_rebate', '27923087323', '{\"data\":{\"bizId\":\"test_user_integral_20240816\",\"rebateConfig\":\"10\",\"rebateDesc\":\"签到返利-积分\",\"rebateType\":\"integral\",\"userId\":\"test_user\"},\"id\":\"27923087323\",\"timestamp\":1723777764514}', 'completed', '2024-08-16 11:09:24', '2024-08-16 11:09:24');

-- ----------------------------
-- Table structure for user_award_record_000
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_000`;
CREATE TABLE `user_award_record_000`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_001
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_001`;
CREATE TABLE `user_award_record_001`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_001
-- ----------------------------
INSERT INTO `user_award_record_001` VALUES (3, 'test_user', 200001, 1000011, '380658382486', 1000, '随机积分', '2024-08-14 06:28:44', 'create', '2024-08-14 14:28:44', '2024-08-14 14:28:44');
INSERT INTO `user_award_record_001` VALUES (4, 'test_user', 200001, 1000011, '794793302087', 1000, '随机积分', '2024-08-14 06:29:41', 'create', '2024-08-14 14:29:40', '2024-08-14 14:29:40');
INSERT INTO `user_award_record_001` VALUES (5, 'test_user', 200001, 1000011, '392896214966', 1000, '随机积分', '2024-08-14 07:47:16', 'create', '2024-08-14 16:12:56', '2024-08-14 16:12:56');
INSERT INTO `user_award_record_001` VALUES (6, 'test_user', 200001, 1000011, '441019461642', 1000, '随机积分', '2024-08-15 12:05:18', 'create', '2024-08-15 20:05:19', '2024-08-15 20:05:19');
INSERT INTO `user_award_record_001` VALUES (7, 'test_user', 200001, 1000011, '158601747987', 1000, '随机积分', '2024-08-15 12:20:42', 'create', '2024-08-15 20:31:26', '2024-08-15 20:31:26');

-- ----------------------------
-- Table structure for user_award_record_002
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_002`;
CREATE TABLE `user_award_record_002`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_003
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_003`;
CREATE TABLE `user_award_record_003`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
  `award_id` int NOT NULL COMMENT '奖品ID',
  `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
  `award_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_003
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_000
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;
CREATE TABLE `user_behavior_rebate_order_000`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值：拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior_rebate_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_001
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;
CREATE TABLE `user_behavior_rebate_order_001`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值：拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior_rebate_order_001
-- ----------------------------
INSERT INTO `user_behavior_rebate_order_001` VALUES (4, 'test_user', '007515300163', 'sign', '签到返利-sku额度', 'sku', '400002', '20240816', 'test_user_sku_20240816', '2024-08-16 11:09:24', '2024-08-16 11:09:24');
INSERT INTO `user_behavior_rebate_order_001` VALUES (5, 'test_user', '374885348567', 'sign', '签到返利-积分', 'integral', '10', '20240816', 'test_user_integral_20240816', '2024-08-16 11:09:24', '2024-08-16 11:09:24');

-- ----------------------------
-- Table structure for user_behavior_rebate_order_002
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;
CREATE TABLE `user_behavior_rebate_order_002`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值：拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior_rebate_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_003
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;
CREATE TABLE `user_behavior_rebate_order_003`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
  `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
  `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
  `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值：拼接 out_business_no + 自身枚举',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior_rebate_order_003
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_000
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_000`;
CREATE TABLE `user_raffle_order_000`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancle-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_001
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_001`;
CREATE TABLE `user_raffle_order_001`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancle-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_001
-- ----------------------------
INSERT INTO `user_raffle_order_001` VALUES (4, 'test_user', 200001, '活动，单元测试', 1000011, '380658382486', '2024-08-14 06:28:44', 'used', '2024-08-14 14:28:43', '2024-08-14 14:28:44');
INSERT INTO `user_raffle_order_001` VALUES (5, 'test_user', 200001, '活动，单元测试', 1000011, '794793302087', '2024-08-14 06:29:41', 'used', '2024-08-14 14:29:40', '2024-08-14 14:29:40');
INSERT INTO `user_raffle_order_001` VALUES (6, 'test_user', 200001, '活动，单元测试', 1000011, '392896214966', '2024-08-14 06:39:25', 'used', '2024-08-14 15:40:43', '2024-08-14 16:12:56');
INSERT INTO `user_raffle_order_001` VALUES (7, 'test_user', 200001, '活动，单元测试', 1000011, '441019461642', '2024-08-15 10:24:36', 'used', '2024-08-15 18:44:34', '2024-08-15 20:05:19');
INSERT INTO `user_raffle_order_001` VALUES (8, 'test_user', 200001, '活动，单元测试', 1000011, '158601747987', '2024-08-15 12:12:22', 'used', '2024-08-15 20:12:46', '2024-08-15 20:31:26');

-- ----------------------------
-- Table structure for user_raffle_order_002
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_002`;
CREATE TABLE `user_raffle_order_002`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancle-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_003
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_003`;
CREATE TABLE `user_raffle_order_003`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `activity_id` bigint NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
  `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancle-已作废',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_003
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
