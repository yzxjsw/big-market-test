/*
 Navicat Premium Data Transfer

 Source Server         : nvicat-mysql
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : big_market_02

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 26/08/2024 11:37:49
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------
INSERT INTO `raffle_activity_account` VALUES (2, 'xiaofuge', 100301, 4, 3, 4, 3, 4, 3, '2024-03-23 12:40:56', '2024-03-23 13:16:40');
INSERT INTO `raffle_activity_account` VALUES (3, 'test', 100001, 20, 20, 1, 1, 20, 20, '2024-07-23 15:41:16', '2024-07-23 15:41:16');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-日次数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-月次数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_000
-- ----------------------------
INSERT INTO `raffle_activity_order_000` VALUES (1, 'test', 20001, 100001, '下单测试', 10001, '211877815388', '2024-07-23 07:40:45', 20, 1, 20, 'completed', '700091009111', '2024-07-23 15:41:16', '2024-07-23 15:41:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_001
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表，发送MQ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'yzx', 'send_award', '81822025414', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"81822025414\",\"timestamp\":1723342645161}', 'completed', '2024-08-11 10:23:55', '2024-08-11 10:41:00');
INSERT INTO `task` VALUES (2, 'yzx', 'send_award', '78226099339', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"78226099339\",\"timestamp\":1723343177884}', 'completed', '2024-08-11 10:26:21', '2024-08-11 10:26:21');
INSERT INTO `task` VALUES (3, 'yzx', 'send_award', '08947506510', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"08947506510\",\"timestamp\":1723343184860}', 'completed', '2024-08-11 10:26:24', '2024-08-11 10:26:24');
INSERT INTO `task` VALUES (4, 'yzx', 'send_award', '49285435438', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"49285435438\",\"timestamp\":1723343185387}', 'completed', '2024-08-11 10:26:25', '2024-08-11 10:26:25');
INSERT INTO `task` VALUES (5, 'yzx', 'send_award', '52112732446', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"52112732446\",\"timestamp\":1723343185905}', 'completed', '2024-08-11 10:26:25', '2024-08-11 10:26:25');
INSERT INTO `task` VALUES (6, 'yzx', 'send_award', '00329697176', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"00329697176\",\"timestamp\":1723343186426}', 'completed', '2024-08-11 10:26:26', '2024-08-11 10:26:26');
INSERT INTO `task` VALUES (7, 'yzx', 'send_award', '29624433471', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"29624433471\",\"timestamp\":1723343186942}', 'completed', '2024-08-11 10:26:26', '2024-08-11 10:26:26');
INSERT INTO `task` VALUES (8, 'yzx', 'send_award', '92024175624', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"92024175624\",\"timestamp\":1723343187455}', 'completed', '2024-08-11 10:26:27', '2024-08-11 10:26:27');
INSERT INTO `task` VALUES (9, 'yzx', 'send_award', '04825279727', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04825279727\",\"timestamp\":1723343187973}', 'completed', '2024-08-11 10:26:27', '2024-08-11 10:26:27');
INSERT INTO `task` VALUES (10, 'yzx', 'send_award', '30772876043', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"30772876043\",\"timestamp\":1723343188489}', 'completed', '2024-08-11 10:26:28', '2024-08-11 10:26:28');
INSERT INTO `task` VALUES (11, 'yzx', 'send_award', '69503308689', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"69503308689\",\"timestamp\":1723343189007}', 'completed', '2024-08-11 10:26:29', '2024-08-11 10:26:29');
INSERT INTO `task` VALUES (12, 'yzx', 'send_award', '95083084398', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95083084398\",\"timestamp\":1723343189519}', 'completed', '2024-08-11 10:26:29', '2024-08-11 10:26:29');
INSERT INTO `task` VALUES (13, 'yzx', 'send_award', '86678710129', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"86678710129\",\"timestamp\":1723343190035}', 'completed', '2024-08-11 10:26:30', '2024-08-11 10:26:30');
INSERT INTO `task` VALUES (14, 'yzx', 'send_award', '14769696698', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"14769696698\",\"timestamp\":1723343190552}', 'completed', '2024-08-11 10:26:30', '2024-08-11 10:26:30');
INSERT INTO `task` VALUES (15, 'yzx', 'send_award', '41654701834', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"41654701834\",\"timestamp\":1723343191084}', 'completed', '2024-08-11 10:26:31', '2024-08-11 10:26:31');
INSERT INTO `task` VALUES (16, 'yzx', 'send_award', '70568402882', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70568402882\",\"timestamp\":1723343191600}', 'completed', '2024-08-11 10:26:31', '2024-08-11 10:26:31');
INSERT INTO `task` VALUES (17, 'yzx', 'send_award', '93447597796', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"93447597796\",\"timestamp\":1723343192128}', 'completed', '2024-08-11 10:26:32', '2024-08-11 10:26:32');
INSERT INTO `task` VALUES (18, 'yzx', 'send_award', '41420316956', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"41420316956\",\"timestamp\":1723343192645}', 'completed', '2024-08-11 10:26:32', '2024-08-11 10:26:32');
INSERT INTO `task` VALUES (19, 'yzx', 'send_award', '70436914752', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70436914752\",\"timestamp\":1723343193177}', 'completed', '2024-08-11 10:26:33', '2024-08-11 10:26:33');
INSERT INTO `task` VALUES (20, 'yzx', 'send_award', '00421743093', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"00421743093\",\"timestamp\":1723343193691}', 'completed', '2024-08-11 10:26:33', '2024-08-11 10:26:33');
INSERT INTO `task` VALUES (21, 'yzx', 'send_award', '18536575323', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"18536575323\",\"timestamp\":1723343194209}', 'completed', '2024-08-11 10:26:34', '2024-08-11 10:26:34');
INSERT INTO `task` VALUES (22, 'yzx', 'send_award', '99987443997', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"99987443997\",\"timestamp\":1723343194734}', 'completed', '2024-08-11 10:26:34', '2024-08-11 10:26:34');
INSERT INTO `task` VALUES (23, 'yzx', 'send_award', '21497333532', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"21497333532\",\"timestamp\":1723343195247}', 'completed', '2024-08-11 10:26:35', '2024-08-11 10:26:35');
INSERT INTO `task` VALUES (24, 'yzx', 'send_award', '04364151295', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04364151295\",\"timestamp\":1723343195772}', 'completed', '2024-08-11 10:26:35', '2024-08-11 10:26:35');
INSERT INTO `task` VALUES (25, 'yzx', 'send_award', '99648709728', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"99648709728\",\"timestamp\":1723343196285}', 'completed', '2024-08-11 10:26:36', '2024-08-11 10:26:36');
INSERT INTO `task` VALUES (26, 'yzx', 'send_award', '10309945770', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"10309945770\",\"timestamp\":1723343196800}', 'completed', '2024-08-11 10:26:36', '2024-08-11 10:26:36');
INSERT INTO `task` VALUES (27, 'yzx', 'send_award', '97183484104', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"97183484104\",\"timestamp\":1723343197327}', 'completed', '2024-08-11 10:26:37', '2024-08-11 10:26:37');
INSERT INTO `task` VALUES (28, 'yzx', 'send_award', '89286289357', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"89286289357\",\"timestamp\":1723343197841}', 'completed', '2024-08-11 10:26:37', '2024-08-11 10:26:37');
INSERT INTO `task` VALUES (29, 'yzx', 'send_award', '50653714994', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"50653714994\",\"timestamp\":1723343198371}', 'completed', '2024-08-11 10:26:38', '2024-08-11 10:26:38');
INSERT INTO `task` VALUES (30, 'yzx', 'send_award', '14256834864', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"14256834864\",\"timestamp\":1723343198888}', 'completed', '2024-08-11 10:26:38', '2024-08-11 10:26:38');
INSERT INTO `task` VALUES (31, 'yzx', 'send_award', '50625029383', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"50625029383\",\"timestamp\":1723343199405}', 'completed', '2024-08-11 10:26:39', '2024-08-11 10:26:39');
INSERT INTO `task` VALUES (32, 'yzx', 'send_award', '15307969973', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"15307969973\",\"timestamp\":1723343199920}', 'completed', '2024-08-11 10:26:39', '2024-08-11 10:26:39');
INSERT INTO `task` VALUES (33, 'yzx', 'send_award', '90283432500', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"90283432500\",\"timestamp\":1723343200435}', 'completed', '2024-08-11 10:26:40', '2024-08-11 10:26:40');
INSERT INTO `task` VALUES (34, 'yzx', 'send_award', '70167701691', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70167701691\",\"timestamp\":1723343200949}', 'completed', '2024-08-11 10:26:40', '2024-08-11 10:26:40');
INSERT INTO `task` VALUES (35, 'yzx', 'send_award', '70177205854', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70177205854\",\"timestamp\":1723343201465}', 'completed', '2024-08-11 10:26:41', '2024-08-11 10:26:41');
INSERT INTO `task` VALUES (36, 'yzx', 'send_award', '13326619185', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"13326619185\",\"timestamp\":1723343201978}', 'completed', '2024-08-11 10:26:41', '2024-08-11 10:26:41');
INSERT INTO `task` VALUES (37, 'yzx', 'send_award', '35480504977', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"35480504977\",\"timestamp\":1723343202494}', 'completed', '2024-08-11 10:26:42', '2024-08-11 10:26:42');
INSERT INTO `task` VALUES (38, 'yzx', 'send_award', '09744388973', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"09744388973\",\"timestamp\":1723343203009}', 'completed', '2024-08-11 10:26:43', '2024-08-11 10:26:43');
INSERT INTO `task` VALUES (39, 'yzx', 'send_award', '92576693781', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"92576693781\",\"timestamp\":1723343203525}', 'completed', '2024-08-11 10:26:43', '2024-08-11 10:26:43');
INSERT INTO `task` VALUES (40, 'yzx', 'send_award', '59677524308', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"59677524308\",\"timestamp\":1723343204037}', 'completed', '2024-08-11 10:26:44', '2024-08-11 10:26:44');
INSERT INTO `task` VALUES (41, 'yzx', 'send_award', '08609997646', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"08609997646\",\"timestamp\":1723343204552}', 'completed', '2024-08-11 10:26:44', '2024-08-11 10:26:44');
INSERT INTO `task` VALUES (42, 'yzx', 'send_award', '49871727005', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"49871727005\",\"timestamp\":1723343205064}', 'completed', '2024-08-11 10:26:45', '2024-08-11 10:26:45');
INSERT INTO `task` VALUES (43, 'yzx', 'send_award', '70376271402', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70376271402\",\"timestamp\":1723343205576}', 'completed', '2024-08-11 10:26:45', '2024-08-11 10:26:45');
INSERT INTO `task` VALUES (44, 'yzx', 'send_award', '83763394635', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"83763394635\",\"timestamp\":1723343206090}', 'completed', '2024-08-11 10:26:46', '2024-08-11 10:26:46');
INSERT INTO `task` VALUES (45, 'yzx', 'send_award', '88087222426', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"88087222426\",\"timestamp\":1723343206609}', 'completed', '2024-08-11 10:26:46', '2024-08-11 10:26:46');
INSERT INTO `task` VALUES (46, 'yzx', 'send_award', '15369727815', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"15369727815\",\"timestamp\":1723343207121}', 'completed', '2024-08-11 10:26:47', '2024-08-11 10:26:47');
INSERT INTO `task` VALUES (47, 'yzx', 'send_award', '85334918357', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"85334918357\",\"timestamp\":1723343207646}', 'completed', '2024-08-11 10:26:47', '2024-08-11 10:26:47');
INSERT INTO `task` VALUES (48, 'yzx', 'send_award', '24973273308', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"24973273308\",\"timestamp\":1723343208161}', 'completed', '2024-08-11 10:26:48', '2024-08-11 10:26:48');
INSERT INTO `task` VALUES (49, 'yzx', 'send_award', '88325437705', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"88325437705\",\"timestamp\":1723343208674}', 'completed', '2024-08-11 10:26:48', '2024-08-11 10:26:48');
INSERT INTO `task` VALUES (50, 'yzx', 'send_award', '27817320724', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"27817320724\",\"timestamp\":1723343209187}', 'completed', '2024-08-11 10:26:49', '2024-08-11 10:26:49');
INSERT INTO `task` VALUES (51, 'yzx', 'send_award', '43558581910', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"43558581910\",\"timestamp\":1723343209701}', 'completed', '2024-08-11 10:26:49', '2024-08-11 10:26:49');
INSERT INTO `task` VALUES (52, 'yzx', 'send_award', '04683320061', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04683320061\",\"timestamp\":1723343210212}', 'completed', '2024-08-11 10:26:50', '2024-08-11 10:26:50');
INSERT INTO `task` VALUES (53, 'yzx', 'send_award', '59983528103', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"59983528103\",\"timestamp\":1723343210727}', 'completed', '2024-08-11 10:26:50', '2024-08-11 10:26:50');
INSERT INTO `task` VALUES (54, 'yzx', 'send_award', '12088827990', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"12088827990\",\"timestamp\":1723343211245}', 'completed', '2024-08-11 10:26:51', '2024-08-11 10:26:51');
INSERT INTO `task` VALUES (55, 'yzx', 'send_award', '76897481706', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"76897481706\",\"timestamp\":1723343211760}', 'completed', '2024-08-11 10:26:51', '2024-08-11 10:26:51');
INSERT INTO `task` VALUES (56, 'yzx', 'send_award', '73018240999', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"73018240999\",\"timestamp\":1723343212272}', 'completed', '2024-08-11 10:26:52', '2024-08-11 10:26:52');
INSERT INTO `task` VALUES (57, 'yzx', 'send_award', '86619478588', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"86619478588\",\"timestamp\":1723343212784}', 'completed', '2024-08-11 10:26:52', '2024-08-11 10:26:52');
INSERT INTO `task` VALUES (58, 'yzx', 'send_award', '01111641474', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"01111641474\",\"timestamp\":1723343213299}', 'completed', '2024-08-11 10:26:53', '2024-08-11 10:26:53');
INSERT INTO `task` VALUES (59, 'yzx', 'send_award', '07036079516', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"07036079516\",\"timestamp\":1723343213829}', 'completed', '2024-08-11 10:26:53', '2024-08-11 10:26:53');
INSERT INTO `task` VALUES (60, 'yzx', 'send_award', '26506586249', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"26506586249\",\"timestamp\":1723343214345}', 'completed', '2024-08-11 10:26:54', '2024-08-11 10:26:54');
INSERT INTO `task` VALUES (61, 'yzx', 'send_award', '88271887324', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"88271887324\",\"timestamp\":1723343214859}', 'completed', '2024-08-11 10:26:54', '2024-08-11 10:26:54');
INSERT INTO `task` VALUES (62, 'yzx', 'send_award', '42848493858', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"42848493858\",\"timestamp\":1723343215375}', 'completed', '2024-08-11 10:26:55', '2024-08-11 10:26:55');
INSERT INTO `task` VALUES (63, 'yzx', 'send_award', '36868799772', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"36868799772\",\"timestamp\":1723343215893}', 'completed', '2024-08-11 10:26:55', '2024-08-11 10:26:55');
INSERT INTO `task` VALUES (64, 'yzx', 'send_award', '79929372474', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"79929372474\",\"timestamp\":1723343216408}', 'completed', '2024-08-11 10:26:56', '2024-08-11 10:26:56');
INSERT INTO `task` VALUES (65, 'yzx', 'send_award', '28885831146', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"28885831146\",\"timestamp\":1723343216921}', 'completed', '2024-08-11 10:26:56', '2024-08-11 10:26:56');
INSERT INTO `task` VALUES (66, 'yzx', 'send_award', '92643890679', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"92643890679\",\"timestamp\":1723343217441}', 'completed', '2024-08-11 10:26:57', '2024-08-11 10:26:57');
INSERT INTO `task` VALUES (67, 'yzx', 'send_award', '62125411544', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"62125411544\",\"timestamp\":1723343217953}', 'completed', '2024-08-11 10:26:57', '2024-08-11 10:26:57');
INSERT INTO `task` VALUES (68, 'yzx', 'send_award', '16265870758', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"16265870758\",\"timestamp\":1723343218471}', 'completed', '2024-08-11 10:26:58', '2024-08-11 10:26:58');
INSERT INTO `task` VALUES (69, 'yzx', 'send_award', '79465452766', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"79465452766\",\"timestamp\":1723343219001}', 'completed', '2024-08-11 10:26:59', '2024-08-11 10:26:59');
INSERT INTO `task` VALUES (70, 'yzx', 'send_award', '91881110834', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"91881110834\",\"timestamp\":1723343219516}', 'completed', '2024-08-11 10:26:59', '2024-08-11 10:26:59');
INSERT INTO `task` VALUES (71, 'yzx', 'send_award', '31528214585', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"31528214585\",\"timestamp\":1723343220034}', 'completed', '2024-08-11 10:27:00', '2024-08-11 10:27:00');
INSERT INTO `task` VALUES (72, 'yzx', 'send_award', '93221256612', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"93221256612\",\"timestamp\":1723343220557}', 'completed', '2024-08-11 10:27:00', '2024-08-11 10:27:00');
INSERT INTO `task` VALUES (73, 'yzx', 'send_award', '29704593424', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"29704593424\",\"timestamp\":1723343221083}', 'completed', '2024-08-11 10:27:01', '2024-08-11 10:27:01');
INSERT INTO `task` VALUES (74, 'yzx', 'send_award', '77117454097', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"77117454097\",\"timestamp\":1723343221596}', 'completed', '2024-08-11 10:27:01', '2024-08-11 10:27:01');
INSERT INTO `task` VALUES (75, 'yzx', 'send_award', '97774789055', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"97774789055\",\"timestamp\":1723343222129}', 'completed', '2024-08-11 10:27:02', '2024-08-11 10:27:02');
INSERT INTO `task` VALUES (76, 'yzx', 'send_award', '16486760913', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"16486760913\",\"timestamp\":1723343222647}', 'completed', '2024-08-11 10:27:02', '2024-08-11 10:27:02');
INSERT INTO `task` VALUES (77, 'yzx', 'send_award', '29361691704', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"29361691704\",\"timestamp\":1723343223162}', 'completed', '2024-08-11 10:27:03', '2024-08-11 10:27:03');
INSERT INTO `task` VALUES (78, 'yzx', 'send_award', '72131702692', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"72131702692\",\"timestamp\":1723343223674}', 'completed', '2024-08-11 10:27:03', '2024-08-11 10:27:03');
INSERT INTO `task` VALUES (79, 'yzx', 'send_award', '92121038723', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"92121038723\",\"timestamp\":1723343224189}', 'completed', '2024-08-11 10:27:04', '2024-08-11 10:27:04');
INSERT INTO `task` VALUES (80, 'yzx', 'send_award', '51776853388', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"51776853388\",\"timestamp\":1723343224703}', 'completed', '2024-08-11 10:27:04', '2024-08-11 10:27:04');
INSERT INTO `task` VALUES (81, 'yzx', 'send_award', '69909302127', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"69909302127\",\"timestamp\":1723343225217}', 'completed', '2024-08-11 10:27:05', '2024-08-11 10:27:05');
INSERT INTO `task` VALUES (82, 'yzx', 'send_award', '70680044958', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70680044958\",\"timestamp\":1723343225743}', 'completed', '2024-08-11 10:27:05', '2024-08-11 10:27:05');
INSERT INTO `task` VALUES (83, 'yzx', 'send_award', '75186204853', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"75186204853\",\"timestamp\":1723343226258}', 'completed', '2024-08-11 10:27:06', '2024-08-11 10:27:06');
INSERT INTO `task` VALUES (84, 'yzx', 'send_award', '45477287435', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"45477287435\",\"timestamp\":1723343226774}', 'completed', '2024-08-11 10:27:06', '2024-08-11 10:27:06');
INSERT INTO `task` VALUES (85, 'yzx', 'send_award', '95619800733', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95619800733\",\"timestamp\":1723343227302}', 'completed', '2024-08-11 10:27:07', '2024-08-11 10:27:07');
INSERT INTO `task` VALUES (86, 'yzx', 'send_award', '47064753127', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"47064753127\",\"timestamp\":1723343227817}', 'completed', '2024-08-11 10:27:07', '2024-08-11 10:27:07');
INSERT INTO `task` VALUES (87, 'yzx', 'send_award', '72891539704', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"72891539704\",\"timestamp\":1723343228335}', 'completed', '2024-08-11 10:27:08', '2024-08-11 10:27:08');
INSERT INTO `task` VALUES (88, 'yzx', 'send_award', '90711251119', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"90711251119\",\"timestamp\":1723343228848}', 'completed', '2024-08-11 10:27:08', '2024-08-11 10:27:08');
INSERT INTO `task` VALUES (89, 'yzx', 'send_award', '60532494610', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"60532494610\",\"timestamp\":1723343229361}', 'completed', '2024-08-11 10:27:09', '2024-08-11 10:27:09');
INSERT INTO `task` VALUES (90, 'yzx', 'send_award', '00345438427', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"00345438427\",\"timestamp\":1723343229871}', 'completed', '2024-08-11 10:27:09', '2024-08-11 10:27:09');
INSERT INTO `task` VALUES (91, 'yzx', 'send_award', '61699078372', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"61699078372\",\"timestamp\":1723343230383}', 'completed', '2024-08-11 10:27:10', '2024-08-11 10:27:10');
INSERT INTO `task` VALUES (92, 'yzx', 'send_award', '40197831416', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"40197831416\",\"timestamp\":1723343230901}', 'completed', '2024-08-11 10:27:10', '2024-08-11 10:27:10');
INSERT INTO `task` VALUES (93, 'yzx', 'send_award', '15799586044', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"15799586044\",\"timestamp\":1723343231414}', 'completed', '2024-08-11 10:27:11', '2024-08-11 10:27:11');
INSERT INTO `task` VALUES (94, 'yzx', 'send_award', '66207739975', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"66207739975\",\"timestamp\":1723343231929}', 'completed', '2024-08-11 10:27:11', '2024-08-11 10:27:11');
INSERT INTO `task` VALUES (95, 'yzx', 'send_award', '04003062663', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04003062663\",\"timestamp\":1723343232442}', 'completed', '2024-08-11 10:27:12', '2024-08-11 10:27:12');
INSERT INTO `task` VALUES (96, 'yzx', 'send_award', '95745932426', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95745932426\",\"timestamp\":1723343232955}', 'completed', '2024-08-11 10:27:12', '2024-08-11 10:27:12');
INSERT INTO `task` VALUES (97, 'yzx', 'send_award', '24201901106', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"24201901106\",\"timestamp\":1723343233471}', 'completed', '2024-08-11 10:27:13', '2024-08-11 10:27:13');
INSERT INTO `task` VALUES (98, 'yzx', 'send_award', '23427066704', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"23427066704\",\"timestamp\":1723343233996}', 'completed', '2024-08-11 10:27:13', '2024-08-11 10:27:14');
INSERT INTO `task` VALUES (99, 'yzx', 'send_award', '35226754612', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"35226754612\",\"timestamp\":1723343234510}', 'completed', '2024-08-11 10:27:14', '2024-08-11 10:27:14');
INSERT INTO `task` VALUES (100, 'yzx', 'send_award', '86497605295', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"86497605295\",\"timestamp\":1723343235026}', 'completed', '2024-08-11 10:27:15', '2024-08-11 10:27:15');
INSERT INTO `task` VALUES (101, 'yzx', 'send_award', '57024592507', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"57024592507\",\"timestamp\":1723343588710}', 'completed', '2024-08-11 10:33:09', '2024-08-11 10:33:09');
INSERT INTO `task` VALUES (102, 'yzx', 'send_award', '24065453555', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"24065453555\",\"timestamp\":1723343589853}', 'completed', '2024-08-11 10:33:09', '2024-08-11 10:33:09');
INSERT INTO `task` VALUES (103, 'yzx', 'send_award', '71473686818', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"71473686818\",\"timestamp\":1723343590371}', 'completed', '2024-08-11 10:33:10', '2024-08-11 10:33:10');
INSERT INTO `task` VALUES (104, 'yzx', 'send_award', '06251760283', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"06251760283\",\"timestamp\":1723343590902}', 'completed', '2024-08-11 10:33:10', '2024-08-11 10:33:10');
INSERT INTO `task` VALUES (105, 'yzx', 'send_award', '22204517328', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"22204517328\",\"timestamp\":1723343591414}', 'completed', '2024-08-11 10:33:11', '2024-08-11 10:33:11');
INSERT INTO `task` VALUES (106, 'yzx', 'send_award', '88113850104', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"88113850104\",\"timestamp\":1723343591927}', 'completed', '2024-08-11 10:33:11', '2024-08-11 10:33:11');
INSERT INTO `task` VALUES (107, 'yzx', 'send_award', '87720851929', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"87720851929\",\"timestamp\":1723343592451}', 'completed', '2024-08-11 10:33:12', '2024-08-11 10:33:12');
INSERT INTO `task` VALUES (108, 'yzx', 'send_award', '77324985697', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"77324985697\",\"timestamp\":1723343592965}', 'completed', '2024-08-11 10:33:12', '2024-08-11 10:33:12');
INSERT INTO `task` VALUES (109, 'yzx', 'send_award', '77509622943', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"77509622943\",\"timestamp\":1723343593481}', 'completed', '2024-08-11 10:33:13', '2024-08-11 10:33:13');
INSERT INTO `task` VALUES (110, 'yzx', 'send_award', '04624989635', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04624989635\",\"timestamp\":1723343594001}', 'completed', '2024-08-11 10:33:14', '2024-08-11 10:33:14');
INSERT INTO `task` VALUES (111, 'yzx', 'send_award', '05880173295', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"05880173295\",\"timestamp\":1723343594516}', 'completed', '2024-08-11 10:33:14', '2024-08-11 10:33:14');
INSERT INTO `task` VALUES (112, 'yzx', 'send_award', '99401653200', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"99401653200\",\"timestamp\":1723343595035}', 'completed', '2024-08-11 10:33:15', '2024-08-11 10:33:15');
INSERT INTO `task` VALUES (113, 'yzx', 'send_award', '34641588792', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"34641588792\",\"timestamp\":1723343595545}', 'completed', '2024-08-11 10:33:15', '2024-08-11 10:33:15');
INSERT INTO `task` VALUES (114, 'yzx', 'send_award', '98175108928', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"98175108928\",\"timestamp\":1723343596072}', 'completed', '2024-08-11 10:33:16', '2024-08-11 10:33:16');
INSERT INTO `task` VALUES (115, 'yzx', 'send_award', '14195176573', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"14195176573\",\"timestamp\":1723343596592}', 'completed', '2024-08-11 10:33:16', '2024-08-11 10:33:16');
INSERT INTO `task` VALUES (116, 'yzx', 'send_award', '21474873254', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"21474873254\",\"timestamp\":1723343597118}', 'completed', '2024-08-11 10:33:17', '2024-08-11 10:33:17');
INSERT INTO `task` VALUES (117, 'yzx', 'send_award', '45259910276', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"45259910276\",\"timestamp\":1723343597634}', 'completed', '2024-08-11 10:33:17', '2024-08-11 10:33:17');
INSERT INTO `task` VALUES (118, 'yzx', 'send_award', '19936271280', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"19936271280\",\"timestamp\":1723343598147}', 'completed', '2024-08-11 10:33:18', '2024-08-11 10:33:18');
INSERT INTO `task` VALUES (119, 'yzx', 'send_award', '39464862801', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"39464862801\",\"timestamp\":1723343598665}', 'completed', '2024-08-11 10:33:18', '2024-08-11 10:33:18');
INSERT INTO `task` VALUES (120, 'yzx', 'send_award', '37391694445', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"37391694445\",\"timestamp\":1723343599178}', 'completed', '2024-08-11 10:33:19', '2024-08-11 10:33:19');
INSERT INTO `task` VALUES (121, 'yzx', 'send_award', '03418093416', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"03418093416\",\"timestamp\":1723343599693}', 'completed', '2024-08-11 10:33:19', '2024-08-11 10:33:19');
INSERT INTO `task` VALUES (122, 'yzx', 'send_award', '95776447445', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95776447445\",\"timestamp\":1723343600219}', 'completed', '2024-08-11 10:33:20', '2024-08-11 10:33:20');
INSERT INTO `task` VALUES (123, 'yzx', 'send_award', '67225380675', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"67225380675\",\"timestamp\":1723343600739}', 'completed', '2024-08-11 10:33:20', '2024-08-11 10:33:20');
INSERT INTO `task` VALUES (124, 'yzx', 'send_award', '56973888152', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"56973888152\",\"timestamp\":1723343601252}', 'completed', '2024-08-11 10:33:21', '2024-08-11 10:33:21');
INSERT INTO `task` VALUES (125, 'yzx', 'send_award', '77810995192', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"77810995192\",\"timestamp\":1723343601767}', 'completed', '2024-08-11 10:33:21', '2024-08-11 10:33:21');
INSERT INTO `task` VALUES (126, 'yzx', 'send_award', '69584126861', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"69584126861\",\"timestamp\":1723343602281}', 'completed', '2024-08-11 10:33:22', '2024-08-11 10:33:22');
INSERT INTO `task` VALUES (127, 'yzx', 'send_award', '39822516983', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"39822516983\",\"timestamp\":1723343602795}', 'completed', '2024-08-11 10:33:22', '2024-08-11 10:33:22');
INSERT INTO `task` VALUES (128, 'yzx', 'send_award', '42659538181', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"42659538181\",\"timestamp\":1723343603309}', 'completed', '2024-08-11 10:33:23', '2024-08-11 10:33:23');
INSERT INTO `task` VALUES (129, 'yzx', 'send_award', '77273758176', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"77273758176\",\"timestamp\":1723343603835}', 'completed', '2024-08-11 10:33:23', '2024-08-11 10:33:23');
INSERT INTO `task` VALUES (130, 'yzx', 'send_award', '85359632305', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"85359632305\",\"timestamp\":1723343604362}', 'completed', '2024-08-11 10:33:24', '2024-08-11 10:33:24');
INSERT INTO `task` VALUES (131, 'yzx', 'send_award', '35361569893', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"35361569893\",\"timestamp\":1723343604874}', 'completed', '2024-08-11 10:33:24', '2024-08-11 10:33:24');
INSERT INTO `task` VALUES (132, 'yzx', 'send_award', '05405803635', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"05405803635\",\"timestamp\":1723343605389}', 'completed', '2024-08-11 10:33:25', '2024-08-11 10:33:25');
INSERT INTO `task` VALUES (133, 'yzx', 'send_award', '61883057462', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"61883057462\",\"timestamp\":1723343605900}', 'completed', '2024-08-11 10:33:25', '2024-08-11 10:33:25');
INSERT INTO `task` VALUES (134, 'yzx', 'send_award', '76272516397', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"76272516397\",\"timestamp\":1723343606419}', 'completed', '2024-08-11 10:33:26', '2024-08-11 10:33:26');
INSERT INTO `task` VALUES (135, 'yzx', 'send_award', '69748182112', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"69748182112\",\"timestamp\":1723343606938}', 'completed', '2024-08-11 10:33:26', '2024-08-11 10:33:26');
INSERT INTO `task` VALUES (136, 'yzx', 'send_award', '35040899778', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"35040899778\",\"timestamp\":1723343607452}', 'completed', '2024-08-11 10:33:27', '2024-08-11 10:33:27');
INSERT INTO `task` VALUES (137, 'yzx', 'send_award', '75397598664', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"75397598664\",\"timestamp\":1723343607978}', 'completed', '2024-08-11 10:33:27', '2024-08-11 10:33:27');
INSERT INTO `task` VALUES (138, 'yzx', 'send_award', '33937197689', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"33937197689\",\"timestamp\":1723343608510}', 'completed', '2024-08-11 10:33:28', '2024-08-11 10:33:28');
INSERT INTO `task` VALUES (139, 'yzx', 'send_award', '94590196805', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"94590196805\",\"timestamp\":1723343609021}', 'completed', '2024-08-11 10:33:29', '2024-08-11 10:33:29');
INSERT INTO `task` VALUES (140, 'yzx', 'send_award', '97751185631', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"97751185631\",\"timestamp\":1723343609535}', 'completed', '2024-08-11 10:33:29', '2024-08-11 10:33:29');
INSERT INTO `task` VALUES (141, 'yzx', 'send_award', '97232666321', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"97232666321\",\"timestamp\":1723343610051}', 'completed', '2024-08-11 10:33:30', '2024-08-11 10:33:30');
INSERT INTO `task` VALUES (142, 'yzx', 'send_award', '55731957567', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"55731957567\",\"timestamp\":1723343610567}', 'completed', '2024-08-11 10:33:30', '2024-08-11 10:33:30');
INSERT INTO `task` VALUES (143, 'yzx', 'send_award', '46041118346', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"46041118346\",\"timestamp\":1723343611080}', 'completed', '2024-08-11 10:33:31', '2024-08-11 10:33:31');
INSERT INTO `task` VALUES (144, 'yzx', 'send_award', '30880357470', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"30880357470\",\"timestamp\":1723343611598}', 'completed', '2024-08-11 10:33:31', '2024-08-11 10:33:31');
INSERT INTO `task` VALUES (145, 'yzx', 'send_award', '66680812159', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"66680812159\",\"timestamp\":1723343612111}', 'completed', '2024-08-11 10:33:32', '2024-08-11 10:33:32');
INSERT INTO `task` VALUES (146, 'yzx', 'send_award', '74054696171', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"74054696171\",\"timestamp\":1723343612622}', 'completed', '2024-08-11 10:33:32', '2024-08-11 10:33:32');
INSERT INTO `task` VALUES (147, 'yzx', 'send_award', '51718528941', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"51718528941\",\"timestamp\":1723343613134}', 'completed', '2024-08-11 10:33:33', '2024-08-11 10:33:33');
INSERT INTO `task` VALUES (148, 'yzx', 'send_award', '02362932923', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"02362932923\",\"timestamp\":1723343613647}', 'completed', '2024-08-11 10:33:33', '2024-08-11 10:33:33');
INSERT INTO `task` VALUES (149, 'yzx', 'send_award', '78652209979', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"78652209979\",\"timestamp\":1723343614160}', 'completed', '2024-08-11 10:33:34', '2024-08-11 10:33:34');
INSERT INTO `task` VALUES (150, 'yzx', 'send_award', '19856501309', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"19856501309\",\"timestamp\":1723343614672}', 'completed', '2024-08-11 10:33:34', '2024-08-11 10:33:34');
INSERT INTO `task` VALUES (151, 'yzx', 'send_award', '20562951807', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"20562951807\",\"timestamp\":1723343615187}', 'completed', '2024-08-11 10:33:35', '2024-08-11 10:33:35');
INSERT INTO `task` VALUES (152, 'yzx', 'send_award', '55752473634', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"55752473634\",\"timestamp\":1723343615700}', 'completed', '2024-08-11 10:33:35', '2024-08-11 10:33:35');
INSERT INTO `task` VALUES (153, 'yzx', 'send_award', '19300092962', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"19300092962\",\"timestamp\":1723343616216}', 'completed', '2024-08-11 10:33:36', '2024-08-11 10:33:36');
INSERT INTO `task` VALUES (154, 'yzx', 'send_award', '15066198986', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"15066198986\",\"timestamp\":1723343616731}', 'completed', '2024-08-11 10:33:36', '2024-08-11 10:33:36');
INSERT INTO `task` VALUES (155, 'yzx', 'send_award', '40898549535', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"40898549535\",\"timestamp\":1723343617243}', 'completed', '2024-08-11 10:33:37', '2024-08-11 10:33:37');
INSERT INTO `task` VALUES (156, 'yzx', 'send_award', '74123091118', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"74123091118\",\"timestamp\":1723343617759}', 'completed', '2024-08-11 10:33:37', '2024-08-11 10:33:37');
INSERT INTO `task` VALUES (157, 'yzx', 'send_award', '18605637230', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"18605637230\",\"timestamp\":1723343618272}', 'completed', '2024-08-11 10:33:38', '2024-08-11 10:33:38');
INSERT INTO `task` VALUES (158, 'yzx', 'send_award', '00178577262', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"00178577262\",\"timestamp\":1723343618786}', 'completed', '2024-08-11 10:33:38', '2024-08-11 10:33:38');
INSERT INTO `task` VALUES (159, 'yzx', 'send_award', '56085207402', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"56085207402\",\"timestamp\":1723343619316}', 'completed', '2024-08-11 10:33:39', '2024-08-11 10:33:39');
INSERT INTO `task` VALUES (160, 'yzx', 'send_award', '21611288916', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"21611288916\",\"timestamp\":1723343619829}', 'completed', '2024-08-11 10:33:39', '2024-08-11 10:33:39');
INSERT INTO `task` VALUES (161, 'yzx', 'send_award', '04504504041', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"04504504041\",\"timestamp\":1723343620344}', 'completed', '2024-08-11 10:33:40', '2024-08-11 10:33:40');
INSERT INTO `task` VALUES (162, 'yzx', 'send_award', '08858793046', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"08858793046\",\"timestamp\":1723343620860}', 'completed', '2024-08-11 10:33:40', '2024-08-11 10:33:40');
INSERT INTO `task` VALUES (163, 'yzx', 'send_award', '93705707751', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"93705707751\",\"timestamp\":1723343621388}', 'completed', '2024-08-11 10:33:41', '2024-08-11 10:33:41');
INSERT INTO `task` VALUES (164, 'yzx', 'send_award', '06606073713', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"06606073713\",\"timestamp\":1723343621903}', 'completed', '2024-08-11 10:33:41', '2024-08-11 10:33:41');
INSERT INTO `task` VALUES (165, 'yzx', 'send_award', '70202423441', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"70202423441\",\"timestamp\":1723343622417}', 'completed', '2024-08-11 10:33:42', '2024-08-11 10:33:42');
INSERT INTO `task` VALUES (166, 'yzx', 'send_award', '61398269242', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"61398269242\",\"timestamp\":1723343622932}', 'completed', '2024-08-11 10:33:42', '2024-08-11 10:33:42');
INSERT INTO `task` VALUES (167, 'yzx', 'send_award', '25566072980', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"25566072980\",\"timestamp\":1723343623446}', 'completed', '2024-08-11 10:33:43', '2024-08-11 10:33:43');
INSERT INTO `task` VALUES (168, 'yzx', 'send_award', '27763821116', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"27763821116\",\"timestamp\":1723343623967}', 'completed', '2024-08-11 10:33:43', '2024-08-11 10:33:43');
INSERT INTO `task` VALUES (169, 'yzx', 'send_award', '30670744633', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"30670744633\",\"timestamp\":1723343624488}', 'completed', '2024-08-11 10:33:44', '2024-08-11 10:33:44');
INSERT INTO `task` VALUES (170, 'yzx', 'send_award', '37570420438', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"37570420438\",\"timestamp\":1723343625003}', 'completed', '2024-08-11 10:33:45', '2024-08-11 10:33:45');
INSERT INTO `task` VALUES (171, 'yzx', 'send_award', '95597563673', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95597563673\",\"timestamp\":1723343625517}', 'completed', '2024-08-11 10:33:45', '2024-08-11 10:33:45');
INSERT INTO `task` VALUES (172, 'yzx', 'send_award', '28572417161', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"28572417161\",\"timestamp\":1723343626027}', 'completed', '2024-08-11 10:33:46', '2024-08-11 10:33:46');
INSERT INTO `task` VALUES (173, 'yzx', 'send_award', '17607991491', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"17607991491\",\"timestamp\":1723343626540}', 'completed', '2024-08-11 10:33:46', '2024-08-11 10:33:46');
INSERT INTO `task` VALUES (174, 'yzx', 'send_award', '43764471026', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"43764471026\",\"timestamp\":1723343627054}', 'completed', '2024-08-11 10:33:47', '2024-08-11 10:33:47');
INSERT INTO `task` VALUES (175, 'yzx', 'send_award', '07719997301', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"07719997301\",\"timestamp\":1723343627572}', 'completed', '2024-08-11 10:33:47', '2024-08-11 10:33:47');
INSERT INTO `task` VALUES (176, 'yzx', 'send_award', '02658365377', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"02658365377\",\"timestamp\":1723343628086}', 'completed', '2024-08-11 10:33:48', '2024-08-11 10:33:48');
INSERT INTO `task` VALUES (177, 'yzx', 'send_award', '56100896910', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"56100896910\",\"timestamp\":1723343628601}', 'completed', '2024-08-11 10:33:48', '2024-08-11 10:33:48');
INSERT INTO `task` VALUES (178, 'yzx', 'send_award', '29961579953', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"29961579953\",\"timestamp\":1723343629117}', 'completed', '2024-08-11 10:33:49', '2024-08-11 10:33:49');
INSERT INTO `task` VALUES (179, 'yzx', 'send_award', '14224284827', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"14224284827\",\"timestamp\":1723343629634}', 'completed', '2024-08-11 10:33:49', '2024-08-11 10:33:49');
INSERT INTO `task` VALUES (180, 'yzx', 'send_award', '17075332524', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"17075332524\",\"timestamp\":1723343630151}', 'completed', '2024-08-11 10:33:50', '2024-08-11 10:33:50');
INSERT INTO `task` VALUES (181, 'yzx', 'send_award', '91409945462', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"91409945462\",\"timestamp\":1723343630669}', 'completed', '2024-08-11 10:33:50', '2024-08-11 10:33:50');
INSERT INTO `task` VALUES (182, 'yzx', 'send_award', '95778949635', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"95778949635\",\"timestamp\":1723343631185}', 'completed', '2024-08-11 10:33:51', '2024-08-11 10:33:51');
INSERT INTO `task` VALUES (183, 'yzx', 'send_award', '06284517884', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"06284517884\",\"timestamp\":1723343631698}', 'completed', '2024-08-11 10:33:51', '2024-08-11 10:33:51');
INSERT INTO `task` VALUES (184, 'yzx', 'send_award', '35123497588', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"35123497588\",\"timestamp\":1723343632216}', 'completed', '2024-08-11 10:33:52', '2024-08-11 10:33:52');
INSERT INTO `task` VALUES (185, 'yzx', 'send_award', '01625822452', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"01625822452\",\"timestamp\":1723343632737}', 'completed', '2024-08-11 10:33:52', '2024-08-11 10:33:52');
INSERT INTO `task` VALUES (186, 'yzx', 'send_award', '69738569004', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"69738569004\",\"timestamp\":1723343633253}', 'completed', '2024-08-11 10:33:53', '2024-08-11 10:33:53');
INSERT INTO `task` VALUES (187, 'yzx', 'send_award', '91868101223', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"91868101223\",\"timestamp\":1723343633768}', 'completed', '2024-08-11 10:33:53', '2024-08-11 10:33:53');
INSERT INTO `task` VALUES (188, 'yzx', 'send_award', '03603584212', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"03603584212\",\"timestamp\":1723343634284}', 'completed', '2024-08-11 10:33:54', '2024-08-11 10:33:54');
INSERT INTO `task` VALUES (189, 'yzx', 'send_award', '39388419478', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"39388419478\",\"timestamp\":1723343634797}', 'completed', '2024-08-11 10:33:54', '2024-08-11 10:33:54');
INSERT INTO `task` VALUES (190, 'yzx', 'send_award', '01151765468', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"01151765468\",\"timestamp\":1723343635312}', 'completed', '2024-08-11 10:33:55', '2024-08-11 10:33:55');
INSERT INTO `task` VALUES (191, 'yzx', 'send_award', '36747050791', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"36747050791\",\"timestamp\":1723343635826}', 'completed', '2024-08-11 10:33:55', '2024-08-11 10:33:55');
INSERT INTO `task` VALUES (192, 'yzx', 'send_award', '68506331239', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"68506331239\",\"timestamp\":1723343636342}', 'completed', '2024-08-11 10:33:56', '2024-08-11 10:33:56');
INSERT INTO `task` VALUES (193, 'yzx', 'send_award', '81874299636', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"81874299636\",\"timestamp\":1723343636859}', 'completed', '2024-08-11 10:33:56', '2024-08-11 10:33:56');
INSERT INTO `task` VALUES (194, 'yzx', 'send_award', '15565387120', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"15565387120\",\"timestamp\":1723343637374}', 'completed', '2024-08-11 10:33:57', '2024-08-11 10:33:57');
INSERT INTO `task` VALUES (195, 'yzx', 'send_award', '30266236238', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"30266236238\",\"timestamp\":1723343637891}', 'completed', '2024-08-11 10:33:57', '2024-08-11 10:33:57');
INSERT INTO `task` VALUES (196, 'yzx', 'send_award', '18976436517', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"18976436517\",\"timestamp\":1723343638405}', 'completed', '2024-08-11 10:33:58', '2024-08-11 10:33:58');
INSERT INTO `task` VALUES (197, 'yzx', 'send_award', '30460288040', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"30460288040\",\"timestamp\":1723343638919}', 'completed', '2024-08-11 10:33:58', '2024-08-11 10:33:58');
INSERT INTO `task` VALUES (198, 'yzx', 'send_award', '39935423066', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"39935423066\",\"timestamp\":1723343639431}', 'completed', '2024-08-11 10:33:59', '2024-08-11 10:33:59');
INSERT INTO `task` VALUES (199, 'yzx', 'send_award', '64683905013', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"64683905013\",\"timestamp\":1723343639946}', 'completed', '2024-08-11 10:33:59', '2024-08-11 10:33:59');
INSERT INTO `task` VALUES (200, 'yzx', 'send_award', '00777072694', '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"yzx\"},\"id\":\"00777072694\",\"timestamp\":1723343640458}', 'completed', '2024-08-11 10:34:00', '2024-08-11 10:34:00');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_001
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_002
-- ----------------------------
INSERT INTO `user_award_record_002` VALUES (1, 'yzx', 1001, 1002, '506186693430', 101, 'OpenAI 增加使用次数', '2024-08-11 02:15:56', 'create', '2024-08-11 10:23:54', '2024-08-11 10:23:54');
INSERT INTO `user_award_record_002` VALUES (2, 'yzx', 1001, 1002, '656392260926', 101, 'OpenAI 增加使用次数', '2024-08-11 02:24:24', 'create', '2024-08-11 10:26:21', '2024-08-11 10:26:21');
INSERT INTO `user_award_record_002` VALUES (3, 'yzx', 1001, 1002, '821571004259', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:22', 'create', '2024-08-11 10:26:24', '2024-08-11 10:26:24');
INSERT INTO `user_award_record_002` VALUES (4, 'yzx', 1001, 1002, '545119024457', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:25', 'create', '2024-08-11 10:26:25', '2024-08-11 10:26:25');
INSERT INTO `user_award_record_002` VALUES (5, 'yzx', 1001, 1002, '034458131363', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:26', 'create', '2024-08-11 10:26:25', '2024-08-11 10:26:25');
INSERT INTO `user_award_record_002` VALUES (6, 'yzx', 1001, 1002, '975671437884', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:26', 'create', '2024-08-11 10:26:26', '2024-08-11 10:26:26');
INSERT INTO `user_award_record_002` VALUES (7, 'yzx', 1001, 1002, '943784192677', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:27', 'create', '2024-08-11 10:26:26', '2024-08-11 10:26:26');
INSERT INTO `user_award_record_002` VALUES (8, 'yzx', 1001, 1002, '862649124364', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:27', 'create', '2024-08-11 10:26:27', '2024-08-11 10:26:27');
INSERT INTO `user_award_record_002` VALUES (9, 'yzx', 1001, 1002, '045622995696', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:28', 'create', '2024-08-11 10:26:27', '2024-08-11 10:26:27');
INSERT INTO `user_award_record_002` VALUES (10, 'yzx', 1001, 1002, '533300689495', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:28', 'create', '2024-08-11 10:26:28', '2024-08-11 10:26:28');
INSERT INTO `user_award_record_002` VALUES (11, 'yzx', 1001, 1002, '869142726896', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:29', 'create', '2024-08-11 10:26:29', '2024-08-11 10:26:29');
INSERT INTO `user_award_record_002` VALUES (12, 'yzx', 1001, 1002, '668297136097', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:30', 'create', '2024-08-11 10:26:29', '2024-08-11 10:26:29');
INSERT INTO `user_award_record_002` VALUES (13, 'yzx', 1001, 1002, '951548070660', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:30', 'create', '2024-08-11 10:26:30', '2024-08-11 10:26:30');
INSERT INTO `user_award_record_002` VALUES (14, 'yzx', 1001, 1002, '324478740299', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:31', 'create', '2024-08-11 10:26:30', '2024-08-11 10:26:30');
INSERT INTO `user_award_record_002` VALUES (15, 'yzx', 1001, 1002, '277615488187', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:31', 'create', '2024-08-11 10:26:31', '2024-08-11 10:26:31');
INSERT INTO `user_award_record_002` VALUES (16, 'yzx', 1001, 1002, '817339932847', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:32', 'create', '2024-08-11 10:26:31', '2024-08-11 10:26:31');
INSERT INTO `user_award_record_002` VALUES (17, 'yzx', 1001, 1002, '364011131679', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:32', 'create', '2024-08-11 10:26:32', '2024-08-11 10:26:32');
INSERT INTO `user_award_record_002` VALUES (18, 'yzx', 1001, 1002, '106402143132', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:33', 'create', '2024-08-11 10:26:32', '2024-08-11 10:26:32');
INSERT INTO `user_award_record_002` VALUES (19, 'yzx', 1001, 1002, '230164368519', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:33', 'create', '2024-08-11 10:26:33', '2024-08-11 10:26:33');
INSERT INTO `user_award_record_002` VALUES (20, 'yzx', 1001, 1002, '321718350746', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:34', 'create', '2024-08-11 10:26:33', '2024-08-11 10:26:33');
INSERT INTO `user_award_record_002` VALUES (21, 'yzx', 1001, 1002, '601282996047', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:34', 'create', '2024-08-11 10:26:34', '2024-08-11 10:26:34');
INSERT INTO `user_award_record_002` VALUES (22, 'yzx', 1001, 1002, '815173223665', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:35', 'create', '2024-08-11 10:26:34', '2024-08-11 10:26:34');
INSERT INTO `user_award_record_002` VALUES (23, 'yzx', 1001, 1002, '495097360454', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:35', 'create', '2024-08-11 10:26:35', '2024-08-11 10:26:35');
INSERT INTO `user_award_record_002` VALUES (24, 'yzx', 1001, 1002, '703261929595', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:36', 'create', '2024-08-11 10:26:35', '2024-08-11 10:26:35');
INSERT INTO `user_award_record_002` VALUES (25, 'yzx', 1001, 1002, '299373462228', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:36', 'create', '2024-08-11 10:26:36', '2024-08-11 10:26:36');
INSERT INTO `user_award_record_002` VALUES (26, 'yzx', 1001, 1002, '122722780511', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:37', 'create', '2024-08-11 10:26:36', '2024-08-11 10:26:36');
INSERT INTO `user_award_record_002` VALUES (27, 'yzx', 1001, 1002, '496421063565', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:37', 'create', '2024-08-11 10:26:37', '2024-08-11 10:26:37');
INSERT INTO `user_award_record_002` VALUES (28, 'yzx', 1001, 1002, '641273702955', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:38', 'create', '2024-08-11 10:26:37', '2024-08-11 10:26:37');
INSERT INTO `user_award_record_002` VALUES (29, 'yzx', 1001, 1002, '706306567413', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:38', 'create', '2024-08-11 10:26:38', '2024-08-11 10:26:38');
INSERT INTO `user_award_record_002` VALUES (30, 'yzx', 1001, 1002, '199904787364', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:39', 'create', '2024-08-11 10:26:38', '2024-08-11 10:26:38');
INSERT INTO `user_award_record_002` VALUES (31, 'yzx', 1001, 1002, '552670044508', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:39', 'create', '2024-08-11 10:26:39', '2024-08-11 10:26:39');
INSERT INTO `user_award_record_002` VALUES (32, 'yzx', 1001, 1002, '907276802464', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:40', 'create', '2024-08-11 10:26:39', '2024-08-11 10:26:39');
INSERT INTO `user_award_record_002` VALUES (33, 'yzx', 1001, 1002, '275330209424', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:40', 'create', '2024-08-11 10:26:40', '2024-08-11 10:26:40');
INSERT INTO `user_award_record_002` VALUES (34, 'yzx', 1001, 1002, '714266435361', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:41', 'create', '2024-08-11 10:26:40', '2024-08-11 10:26:40');
INSERT INTO `user_award_record_002` VALUES (35, 'yzx', 1001, 1002, '163650288760', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:41', 'create', '2024-08-11 10:26:41', '2024-08-11 10:26:41');
INSERT INTO `user_award_record_002` VALUES (36, 'yzx', 1001, 1002, '522852898805', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:42', 'create', '2024-08-11 10:26:41', '2024-08-11 10:26:41');
INSERT INTO `user_award_record_002` VALUES (37, 'yzx', 1001, 1002, '219873048735', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:42', 'create', '2024-08-11 10:26:42', '2024-08-11 10:26:42');
INSERT INTO `user_award_record_002` VALUES (38, 'yzx', 1001, 1002, '911450027303', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:43', 'create', '2024-08-11 10:26:43', '2024-08-11 10:26:43');
INSERT INTO `user_award_record_002` VALUES (39, 'yzx', 1001, 1002, '404884815467', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:44', 'create', '2024-08-11 10:26:43', '2024-08-11 10:26:43');
INSERT INTO `user_award_record_002` VALUES (40, 'yzx', 1001, 1002, '756608210393', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:44', 'create', '2024-08-11 10:26:44', '2024-08-11 10:26:44');
INSERT INTO `user_award_record_002` VALUES (41, 'yzx', 1001, 1002, '441186947949', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:45', 'create', '2024-08-11 10:26:44', '2024-08-11 10:26:44');
INSERT INTO `user_award_record_002` VALUES (42, 'yzx', 1001, 1002, '054923991555', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:45', 'create', '2024-08-11 10:26:45', '2024-08-11 10:26:45');
INSERT INTO `user_award_record_002` VALUES (43, 'yzx', 1001, 1002, '121850778630', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:46', 'create', '2024-08-11 10:26:45', '2024-08-11 10:26:45');
INSERT INTO `user_award_record_002` VALUES (44, 'yzx', 1001, 1002, '255707479044', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:46', 'create', '2024-08-11 10:26:46', '2024-08-11 10:26:46');
INSERT INTO `user_award_record_002` VALUES (45, 'yzx', 1001, 1002, '895807451498', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:47', 'create', '2024-08-11 10:26:46', '2024-08-11 10:26:46');
INSERT INTO `user_award_record_002` VALUES (46, 'yzx', 1001, 1002, '751916095745', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:47', 'create', '2024-08-11 10:26:47', '2024-08-11 10:26:47');
INSERT INTO `user_award_record_002` VALUES (47, 'yzx', 1001, 1002, '730665997989', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:48', 'create', '2024-08-11 10:26:47', '2024-08-11 10:26:47');
INSERT INTO `user_award_record_002` VALUES (48, 'yzx', 1001, 1002, '688943870428', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:48', 'create', '2024-08-11 10:26:48', '2024-08-11 10:26:48');
INSERT INTO `user_award_record_002` VALUES (49, 'yzx', 1001, 1002, '010994474277', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:49', 'create', '2024-08-11 10:26:48', '2024-08-11 10:26:48');
INSERT INTO `user_award_record_002` VALUES (50, 'yzx', 1001, 1002, '524155759536', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:49', 'create', '2024-08-11 10:26:49', '2024-08-11 10:26:49');
INSERT INTO `user_award_record_002` VALUES (51, 'yzx', 1001, 1002, '662863614739', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:50', 'create', '2024-08-11 10:26:49', '2024-08-11 10:26:49');
INSERT INTO `user_award_record_002` VALUES (52, 'yzx', 1001, 1002, '004503405550', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:50', 'create', '2024-08-11 10:26:50', '2024-08-11 10:26:50');
INSERT INTO `user_award_record_002` VALUES (53, 'yzx', 1001, 1002, '891134086223', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:51', 'create', '2024-08-11 10:26:50', '2024-08-11 10:26:50');
INSERT INTO `user_award_record_002` VALUES (54, 'yzx', 1001, 1002, '523254789775', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:51', 'create', '2024-08-11 10:26:51', '2024-08-11 10:26:51');
INSERT INTO `user_award_record_002` VALUES (55, 'yzx', 1001, 1002, '587877008323', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:52', 'create', '2024-08-11 10:26:51', '2024-08-11 10:26:51');
INSERT INTO `user_award_record_002` VALUES (56, 'yzx', 1001, 1002, '726231687795', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:52', 'create', '2024-08-11 10:26:52', '2024-08-11 10:26:52');
INSERT INTO `user_award_record_002` VALUES (57, 'yzx', 1001, 1002, '054959892926', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:53', 'create', '2024-08-11 10:26:52', '2024-08-11 10:26:52');
INSERT INTO `user_award_record_002` VALUES (58, 'yzx', 1001, 1002, '865451373033', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:53', 'create', '2024-08-11 10:26:53', '2024-08-11 10:26:53');
INSERT INTO `user_award_record_002` VALUES (59, 'yzx', 1001, 1002, '652473309220', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:54', 'create', '2024-08-11 10:26:53', '2024-08-11 10:26:53');
INSERT INTO `user_award_record_002` VALUES (60, 'yzx', 1001, 1002, '218116559016', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:54', 'create', '2024-08-11 10:26:54', '2024-08-11 10:26:54');
INSERT INTO `user_award_record_002` VALUES (61, 'yzx', 1001, 1002, '340101218363', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:55', 'create', '2024-08-11 10:26:54', '2024-08-11 10:26:54');
INSERT INTO `user_award_record_002` VALUES (62, 'yzx', 1001, 1002, '364015624485', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:55', 'create', '2024-08-11 10:26:55', '2024-08-11 10:26:55');
INSERT INTO `user_award_record_002` VALUES (63, 'yzx', 1001, 1002, '022023206597', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:56', 'create', '2024-08-11 10:26:55', '2024-08-11 10:26:55');
INSERT INTO `user_award_record_002` VALUES (64, 'yzx', 1001, 1002, '579244045587', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:56', 'create', '2024-08-11 10:26:56', '2024-08-11 10:26:56');
INSERT INTO `user_award_record_002` VALUES (65, 'yzx', 1001, 1002, '689319071789', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:57', 'create', '2024-08-11 10:26:56', '2024-08-11 10:26:56');
INSERT INTO `user_award_record_002` VALUES (66, 'yzx', 1001, 1002, '899935190597', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:57', 'create', '2024-08-11 10:26:57', '2024-08-11 10:26:57');
INSERT INTO `user_award_record_002` VALUES (67, 'yzx', 1001, 1002, '486924002996', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:58', 'create', '2024-08-11 10:26:57', '2024-08-11 10:26:57');
INSERT INTO `user_award_record_002` VALUES (68, 'yzx', 1001, 1002, '346864192527', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:58', 'create', '2024-08-11 10:26:58', '2024-08-11 10:26:58');
INSERT INTO `user_award_record_002` VALUES (69, 'yzx', 1001, 1002, '483481371969', 101, 'OpenAI 增加使用次数', '2024-08-11 02:26:59', 'create', '2024-08-11 10:26:59', '2024-08-11 10:26:59');
INSERT INTO `user_award_record_002` VALUES (70, 'yzx', 1001, 1002, '495252221491', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:00', 'create', '2024-08-11 10:26:59', '2024-08-11 10:26:59');
INSERT INTO `user_award_record_002` VALUES (71, 'yzx', 1001, 1002, '608825529093', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:00', 'create', '2024-08-11 10:27:00', '2024-08-11 10:27:00');
INSERT INTO `user_award_record_002` VALUES (72, 'yzx', 1001, 1002, '218064347284', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:01', 'create', '2024-08-11 10:27:00', '2024-08-11 10:27:00');
INSERT INTO `user_award_record_002` VALUES (73, 'yzx', 1001, 1002, '727959380410', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:01', 'create', '2024-08-11 10:27:01', '2024-08-11 10:27:01');
INSERT INTO `user_award_record_002` VALUES (74, 'yzx', 1001, 1002, '566940800567', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:02', 'create', '2024-08-11 10:27:01', '2024-08-11 10:27:01');
INSERT INTO `user_award_record_002` VALUES (75, 'yzx', 1001, 1002, '338199566423', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:02', 'create', '2024-08-11 10:27:02', '2024-08-11 10:27:02');
INSERT INTO `user_award_record_002` VALUES (76, 'yzx', 1001, 1002, '777068464035', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:03', 'create', '2024-08-11 10:27:02', '2024-08-11 10:27:02');
INSERT INTO `user_award_record_002` VALUES (77, 'yzx', 1001, 1002, '374956839446', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:03', 'create', '2024-08-11 10:27:03', '2024-08-11 10:27:03');
INSERT INTO `user_award_record_002` VALUES (78, 'yzx', 1001, 1002, '222992174830', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:04', 'create', '2024-08-11 10:27:03', '2024-08-11 10:27:03');
INSERT INTO `user_award_record_002` VALUES (79, 'yzx', 1001, 1002, '759762735793', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:04', 'create', '2024-08-11 10:27:04', '2024-08-11 10:27:04');
INSERT INTO `user_award_record_002` VALUES (80, 'yzx', 1001, 1002, '113621280956', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:05', 'create', '2024-08-11 10:27:04', '2024-08-11 10:27:04');
INSERT INTO `user_award_record_002` VALUES (81, 'yzx', 1001, 1002, '973333632573', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:05', 'create', '2024-08-11 10:27:05', '2024-08-11 10:27:05');
INSERT INTO `user_award_record_002` VALUES (82, 'yzx', 1001, 1002, '935382458038', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:06', 'create', '2024-08-11 10:27:05', '2024-08-11 10:27:05');
INSERT INTO `user_award_record_002` VALUES (83, 'yzx', 1001, 1002, '877888103430', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:06', 'create', '2024-08-11 10:27:06', '2024-08-11 10:27:06');
INSERT INTO `user_award_record_002` VALUES (84, 'yzx', 1001, 1002, '618416614765', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:07', 'create', '2024-08-11 10:27:06', '2024-08-11 10:27:06');
INSERT INTO `user_award_record_002` VALUES (85, 'yzx', 1001, 1002, '163894102095', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:07', 'create', '2024-08-11 10:27:07', '2024-08-11 10:27:07');
INSERT INTO `user_award_record_002` VALUES (86, 'yzx', 1001, 1002, '038200355136', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:08', 'create', '2024-08-11 10:27:07', '2024-08-11 10:27:07');
INSERT INTO `user_award_record_002` VALUES (87, 'yzx', 1001, 1002, '517029702053', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:08', 'create', '2024-08-11 10:27:08', '2024-08-11 10:27:08');
INSERT INTO `user_award_record_002` VALUES (88, 'yzx', 1001, 1002, '430831802178', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:09', 'create', '2024-08-11 10:27:08', '2024-08-11 10:27:08');
INSERT INTO `user_award_record_002` VALUES (89, 'yzx', 1001, 1002, '297062850399', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:09', 'create', '2024-08-11 10:27:09', '2024-08-11 10:27:09');
INSERT INTO `user_award_record_002` VALUES (90, 'yzx', 1001, 1002, '805966160407', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:10', 'create', '2024-08-11 10:27:09', '2024-08-11 10:27:09');
INSERT INTO `user_award_record_002` VALUES (91, 'yzx', 1001, 1002, '213029107160', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:10', 'create', '2024-08-11 10:27:10', '2024-08-11 10:27:10');
INSERT INTO `user_award_record_002` VALUES (92, 'yzx', 1001, 1002, '724781897883', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:11', 'create', '2024-08-11 10:27:10', '2024-08-11 10:27:10');
INSERT INTO `user_award_record_002` VALUES (93, 'yzx', 1001, 1002, '490064907082', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:11', 'create', '2024-08-11 10:27:11', '2024-08-11 10:27:11');
INSERT INTO `user_award_record_002` VALUES (94, 'yzx', 1001, 1002, '066332197890', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:12', 'create', '2024-08-11 10:27:11', '2024-08-11 10:27:11');
INSERT INTO `user_award_record_002` VALUES (95, 'yzx', 1001, 1002, '063455668072', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:12', 'create', '2024-08-11 10:27:12', '2024-08-11 10:27:12');
INSERT INTO `user_award_record_002` VALUES (96, 'yzx', 1001, 1002, '748340021883', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:13', 'create', '2024-08-11 10:27:12', '2024-08-11 10:27:12');
INSERT INTO `user_award_record_002` VALUES (97, 'yzx', 1001, 1002, '723551631332', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:13', 'create', '2024-08-11 10:27:13', '2024-08-11 10:27:13');
INSERT INTO `user_award_record_002` VALUES (98, 'yzx', 1001, 1002, '394476386447', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:14', 'create', '2024-08-11 10:27:13', '2024-08-11 10:27:13');
INSERT INTO `user_award_record_002` VALUES (99, 'yzx', 1001, 1002, '547697143660', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:15', 'create', '2024-08-11 10:27:14', '2024-08-11 10:27:14');
INSERT INTO `user_award_record_002` VALUES (100, 'yzx', 1001, 1002, '646105089914', 101, 'OpenAI 增加使用次数', '2024-08-11 02:27:15', 'create', '2024-08-11 10:27:15', '2024-08-11 10:27:15');
INSERT INTO `user_award_record_002` VALUES (101, 'yzx', 1001, 1002, '969716290560', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:09', 'create', '2024-08-11 10:33:09', '2024-08-11 10:33:09');
INSERT INTO `user_award_record_002` VALUES (102, 'yzx', 1001, 1002, '461181470182', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:10', 'create', '2024-08-11 10:33:09', '2024-08-11 10:33:09');
INSERT INTO `user_award_record_002` VALUES (103, 'yzx', 1001, 1002, '094151392246', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:10', 'create', '2024-08-11 10:33:10', '2024-08-11 10:33:10');
INSERT INTO `user_award_record_002` VALUES (104, 'yzx', 1001, 1002, '090985307033', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:11', 'create', '2024-08-11 10:33:10', '2024-08-11 10:33:10');
INSERT INTO `user_award_record_002` VALUES (105, 'yzx', 1001, 1002, '747737968173', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:11', 'create', '2024-08-11 10:33:11', '2024-08-11 10:33:11');
INSERT INTO `user_award_record_002` VALUES (106, 'yzx', 1001, 1002, '399369373499', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:12', 'create', '2024-08-11 10:33:11', '2024-08-11 10:33:11');
INSERT INTO `user_award_record_002` VALUES (107, 'yzx', 1001, 1002, '030344910099', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:12', 'create', '2024-08-11 10:33:12', '2024-08-11 10:33:12');
INSERT INTO `user_award_record_002` VALUES (108, 'yzx', 1001, 1002, '917661789418', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:13', 'create', '2024-08-11 10:33:12', '2024-08-11 10:33:12');
INSERT INTO `user_award_record_002` VALUES (109, 'yzx', 1001, 1002, '932482298937', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:13', 'create', '2024-08-11 10:33:13', '2024-08-11 10:33:13');
INSERT INTO `user_award_record_002` VALUES (110, 'yzx', 1001, 1002, '830893880192', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:14', 'create', '2024-08-11 10:33:14', '2024-08-11 10:33:14');
INSERT INTO `user_award_record_002` VALUES (111, 'yzx', 1001, 1002, '095451675841', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:15', 'create', '2024-08-11 10:33:14', '2024-08-11 10:33:14');
INSERT INTO `user_award_record_002` VALUES (112, 'yzx', 1001, 1002, '599571441960', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:15', 'create', '2024-08-11 10:33:15', '2024-08-11 10:33:15');
INSERT INTO `user_award_record_002` VALUES (113, 'yzx', 1001, 1002, '124391777123', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:16', 'create', '2024-08-11 10:33:15', '2024-08-11 10:33:15');
INSERT INTO `user_award_record_002` VALUES (114, 'yzx', 1001, 1002, '367237542086', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:16', 'create', '2024-08-11 10:33:16', '2024-08-11 10:33:16');
INSERT INTO `user_award_record_002` VALUES (115, 'yzx', 1001, 1002, '963112255667', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:17', 'create', '2024-08-11 10:33:16', '2024-08-11 10:33:16');
INSERT INTO `user_award_record_002` VALUES (116, 'yzx', 1001, 1002, '455125306814', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:17', 'create', '2024-08-11 10:33:17', '2024-08-11 10:33:17');
INSERT INTO `user_award_record_002` VALUES (117, 'yzx', 1001, 1002, '325520545819', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:18', 'create', '2024-08-11 10:33:17', '2024-08-11 10:33:17');
INSERT INTO `user_award_record_002` VALUES (118, 'yzx', 1001, 1002, '794548739633', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:18', 'create', '2024-08-11 10:33:18', '2024-08-11 10:33:18');
INSERT INTO `user_award_record_002` VALUES (119, 'yzx', 1001, 1002, '014678573274', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:19', 'create', '2024-08-11 10:33:18', '2024-08-11 10:33:18');
INSERT INTO `user_award_record_002` VALUES (120, 'yzx', 1001, 1002, '031827626589', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:19', 'create', '2024-08-11 10:33:19', '2024-08-11 10:33:19');
INSERT INTO `user_award_record_002` VALUES (121, 'yzx', 1001, 1002, '526076082983', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:20', 'create', '2024-08-11 10:33:19', '2024-08-11 10:33:19');
INSERT INTO `user_award_record_002` VALUES (122, 'yzx', 1001, 1002, '702278566275', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:20', 'create', '2024-08-11 10:33:20', '2024-08-11 10:33:20');
INSERT INTO `user_award_record_002` VALUES (123, 'yzx', 1001, 1002, '382678111021', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:21', 'create', '2024-08-11 10:33:20', '2024-08-11 10:33:20');
INSERT INTO `user_award_record_002` VALUES (124, 'yzx', 1001, 1002, '324688758267', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:21', 'create', '2024-08-11 10:33:21', '2024-08-11 10:33:21');
INSERT INTO `user_award_record_002` VALUES (125, 'yzx', 1001, 1002, '218161630027', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:22', 'create', '2024-08-11 10:33:21', '2024-08-11 10:33:21');
INSERT INTO `user_award_record_002` VALUES (126, 'yzx', 1001, 1002, '545622843104', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:22', 'create', '2024-08-11 10:33:22', '2024-08-11 10:33:22');
INSERT INTO `user_award_record_002` VALUES (127, 'yzx', 1001, 1002, '588886809430', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:23', 'create', '2024-08-11 10:33:22', '2024-08-11 10:33:22');
INSERT INTO `user_award_record_002` VALUES (128, 'yzx', 1001, 1002, '174359599986', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:23', 'create', '2024-08-11 10:33:23', '2024-08-11 10:33:23');
INSERT INTO `user_award_record_002` VALUES (129, 'yzx', 1001, 1002, '388601988764', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:24', 'create', '2024-08-11 10:33:23', '2024-08-11 10:33:23');
INSERT INTO `user_award_record_002` VALUES (130, 'yzx', 1001, 1002, '837575326315', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:24', 'create', '2024-08-11 10:33:24', '2024-08-11 10:33:24');
INSERT INTO `user_award_record_002` VALUES (131, 'yzx', 1001, 1002, '060306905808', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:25', 'create', '2024-08-11 10:33:24', '2024-08-11 10:33:24');
INSERT INTO `user_award_record_002` VALUES (132, 'yzx', 1001, 1002, '915774808422', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:25', 'create', '2024-08-11 10:33:25', '2024-08-11 10:33:25');
INSERT INTO `user_award_record_002` VALUES (133, 'yzx', 1001, 1002, '481550741802', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:26', 'create', '2024-08-11 10:33:25', '2024-08-11 10:33:25');
INSERT INTO `user_award_record_002` VALUES (134, 'yzx', 1001, 1002, '581518359191', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:26', 'create', '2024-08-11 10:33:26', '2024-08-11 10:33:26');
INSERT INTO `user_award_record_002` VALUES (135, 'yzx', 1001, 1002, '329421003404', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:27', 'create', '2024-08-11 10:33:26', '2024-08-11 10:33:26');
INSERT INTO `user_award_record_002` VALUES (136, 'yzx', 1001, 1002, '207397433731', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:27', 'create', '2024-08-11 10:33:27', '2024-08-11 10:33:27');
INSERT INTO `user_award_record_002` VALUES (137, 'yzx', 1001, 1002, '736359909680', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:28', 'create', '2024-08-11 10:33:27', '2024-08-11 10:33:27');
INSERT INTO `user_award_record_002` VALUES (138, 'yzx', 1001, 1002, '161633161695', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:29', 'create', '2024-08-11 10:33:28', '2024-08-11 10:33:28');
INSERT INTO `user_award_record_002` VALUES (139, 'yzx', 1001, 1002, '199092351916', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:29', 'create', '2024-08-11 10:33:29', '2024-08-11 10:33:29');
INSERT INTO `user_award_record_002` VALUES (140, 'yzx', 1001, 1002, '592243594259', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:30', 'create', '2024-08-11 10:33:29', '2024-08-11 10:33:29');
INSERT INTO `user_award_record_002` VALUES (141, 'yzx', 1001, 1002, '420914010254', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:30', 'create', '2024-08-11 10:33:30', '2024-08-11 10:33:30');
INSERT INTO `user_award_record_002` VALUES (142, 'yzx', 1001, 1002, '674485101339', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:31', 'create', '2024-08-11 10:33:30', '2024-08-11 10:33:30');
INSERT INTO `user_award_record_002` VALUES (143, 'yzx', 1001, 1002, '637946855636', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:31', 'create', '2024-08-11 10:33:31', '2024-08-11 10:33:31');
INSERT INTO `user_award_record_002` VALUES (144, 'yzx', 1001, 1002, '285281897947', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:32', 'create', '2024-08-11 10:33:31', '2024-08-11 10:33:31');
INSERT INTO `user_award_record_002` VALUES (145, 'yzx', 1001, 1002, '159053694275', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:32', 'create', '2024-08-11 10:33:32', '2024-08-11 10:33:32');
INSERT INTO `user_award_record_002` VALUES (146, 'yzx', 1001, 1002, '140211354397', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:33', 'create', '2024-08-11 10:33:32', '2024-08-11 10:33:32');
INSERT INTO `user_award_record_002` VALUES (147, 'yzx', 1001, 1002, '601839055812', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:33', 'create', '2024-08-11 10:33:33', '2024-08-11 10:33:33');
INSERT INTO `user_award_record_002` VALUES (148, 'yzx', 1001, 1002, '021072282892', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:34', 'create', '2024-08-11 10:33:33', '2024-08-11 10:33:33');
INSERT INTO `user_award_record_002` VALUES (149, 'yzx', 1001, 1002, '585444582009', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:34', 'create', '2024-08-11 10:33:34', '2024-08-11 10:33:34');
INSERT INTO `user_award_record_002` VALUES (150, 'yzx', 1001, 1002, '683372627083', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:35', 'create', '2024-08-11 10:33:34', '2024-08-11 10:33:34');
INSERT INTO `user_award_record_002` VALUES (151, 'yzx', 1001, 1002, '828065756408', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:35', 'create', '2024-08-11 10:33:35', '2024-08-11 10:33:35');
INSERT INTO `user_award_record_002` VALUES (152, 'yzx', 1001, 1002, '231753059772', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:36', 'create', '2024-08-11 10:33:35', '2024-08-11 10:33:35');
INSERT INTO `user_award_record_002` VALUES (153, 'yzx', 1001, 1002, '635522221957', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:36', 'create', '2024-08-11 10:33:36', '2024-08-11 10:33:36');
INSERT INTO `user_award_record_002` VALUES (154, 'yzx', 1001, 1002, '546684172029', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:37', 'create', '2024-08-11 10:33:36', '2024-08-11 10:33:36');
INSERT INTO `user_award_record_002` VALUES (155, 'yzx', 1001, 1002, '464220350677', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:37', 'create', '2024-08-11 10:33:37', '2024-08-11 10:33:37');
INSERT INTO `user_award_record_002` VALUES (156, 'yzx', 1001, 1002, '997217130885', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:38', 'create', '2024-08-11 10:33:37', '2024-08-11 10:33:37');
INSERT INTO `user_award_record_002` VALUES (157, 'yzx', 1001, 1002, '433079568458', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:38', 'create', '2024-08-11 10:33:38', '2024-08-11 10:33:38');
INSERT INTO `user_award_record_002` VALUES (158, 'yzx', 1001, 1002, '781693928389', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:39', 'create', '2024-08-11 10:33:38', '2024-08-11 10:33:38');
INSERT INTO `user_award_record_002` VALUES (159, 'yzx', 1001, 1002, '232469448334', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:39', 'create', '2024-08-11 10:33:39', '2024-08-11 10:33:39');
INSERT INTO `user_award_record_002` VALUES (160, 'yzx', 1001, 1002, '015162471672', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:40', 'create', '2024-08-11 10:33:39', '2024-08-11 10:33:39');
INSERT INTO `user_award_record_002` VALUES (161, 'yzx', 1001, 1002, '424587803779', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:40', 'create', '2024-08-11 10:33:40', '2024-08-11 10:33:40');
INSERT INTO `user_award_record_002` VALUES (162, 'yzx', 1001, 1002, '059797032570', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:41', 'create', '2024-08-11 10:33:40', '2024-08-11 10:33:40');
INSERT INTO `user_award_record_002` VALUES (163, 'yzx', 1001, 1002, '264819274724', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:41', 'create', '2024-08-11 10:33:41', '2024-08-11 10:33:41');
INSERT INTO `user_award_record_002` VALUES (164, 'yzx', 1001, 1002, '441436294074', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:42', 'create', '2024-08-11 10:33:41', '2024-08-11 10:33:41');
INSERT INTO `user_award_record_002` VALUES (165, 'yzx', 1001, 1002, '930206161345', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:42', 'create', '2024-08-11 10:33:42', '2024-08-11 10:33:42');
INSERT INTO `user_award_record_002` VALUES (166, 'yzx', 1001, 1002, '572018835153', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:43', 'create', '2024-08-11 10:33:42', '2024-08-11 10:33:42');
INSERT INTO `user_award_record_002` VALUES (167, 'yzx', 1001, 1002, '607843548896', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:43', 'create', '2024-08-11 10:33:43', '2024-08-11 10:33:43');
INSERT INTO `user_award_record_002` VALUES (168, 'yzx', 1001, 1002, '566109140902', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:44', 'create', '2024-08-11 10:33:43', '2024-08-11 10:33:43');
INSERT INTO `user_award_record_002` VALUES (169, 'yzx', 1001, 1002, '291105143841', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:44', 'create', '2024-08-11 10:33:44', '2024-08-11 10:33:44');
INSERT INTO `user_award_record_002` VALUES (170, 'yzx', 1001, 1002, '534184803399', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:45', 'create', '2024-08-11 10:33:45', '2024-08-11 10:33:45');
INSERT INTO `user_award_record_002` VALUES (171, 'yzx', 1001, 1002, '328650476100', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:46', 'create', '2024-08-11 10:33:45', '2024-08-11 10:33:45');
INSERT INTO `user_award_record_002` VALUES (172, 'yzx', 1001, 1002, '639051888827', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:46', 'create', '2024-08-11 10:33:46', '2024-08-11 10:33:46');
INSERT INTO `user_award_record_002` VALUES (173, 'yzx', 1001, 1002, '578862621181', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:47', 'create', '2024-08-11 10:33:46', '2024-08-11 10:33:46');
INSERT INTO `user_award_record_002` VALUES (174, 'yzx', 1001, 1002, '692871428344', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:47', 'create', '2024-08-11 10:33:47', '2024-08-11 10:33:47');
INSERT INTO `user_award_record_002` VALUES (175, 'yzx', 1001, 1002, '265813185538', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:48', 'create', '2024-08-11 10:33:47', '2024-08-11 10:33:47');
INSERT INTO `user_award_record_002` VALUES (176, 'yzx', 1001, 1002, '738267676413', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:48', 'create', '2024-08-11 10:33:48', '2024-08-11 10:33:48');
INSERT INTO `user_award_record_002` VALUES (177, 'yzx', 1001, 1002, '374503342654', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:49', 'create', '2024-08-11 10:33:48', '2024-08-11 10:33:48');
INSERT INTO `user_award_record_002` VALUES (178, 'yzx', 1001, 1002, '198140502194', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:49', 'create', '2024-08-11 10:33:49', '2024-08-11 10:33:49');
INSERT INTO `user_award_record_002` VALUES (179, 'yzx', 1001, 1002, '907036121233', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:50', 'create', '2024-08-11 10:33:49', '2024-08-11 10:33:49');
INSERT INTO `user_award_record_002` VALUES (180, 'yzx', 1001, 1002, '795896899295', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:50', 'create', '2024-08-11 10:33:50', '2024-08-11 10:33:50');
INSERT INTO `user_award_record_002` VALUES (181, 'yzx', 1001, 1002, '376979275140', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:51', 'create', '2024-08-11 10:33:50', '2024-08-11 10:33:50');
INSERT INTO `user_award_record_002` VALUES (182, 'yzx', 1001, 1002, '219486952561', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:51', 'create', '2024-08-11 10:33:51', '2024-08-11 10:33:51');
INSERT INTO `user_award_record_002` VALUES (183, 'yzx', 1001, 1002, '265701729241', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:52', 'create', '2024-08-11 10:33:51', '2024-08-11 10:33:51');
INSERT INTO `user_award_record_002` VALUES (184, 'yzx', 1001, 1002, '213941317464', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:52', 'create', '2024-08-11 10:33:52', '2024-08-11 10:33:52');
INSERT INTO `user_award_record_002` VALUES (185, 'yzx', 1001, 1002, '658115008837', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:53', 'create', '2024-08-11 10:33:52', '2024-08-11 10:33:52');
INSERT INTO `user_award_record_002` VALUES (186, 'yzx', 1001, 1002, '802131609518', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:53', 'create', '2024-08-11 10:33:53', '2024-08-11 10:33:53');
INSERT INTO `user_award_record_002` VALUES (187, 'yzx', 1001, 1002, '844746476509', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:54', 'create', '2024-08-11 10:33:53', '2024-08-11 10:33:53');
INSERT INTO `user_award_record_002` VALUES (188, 'yzx', 1001, 1002, '875575618419', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:54', 'create', '2024-08-11 10:33:54', '2024-08-11 10:33:54');
INSERT INTO `user_award_record_002` VALUES (189, 'yzx', 1001, 1002, '546671955217', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:55', 'create', '2024-08-11 10:33:54', '2024-08-11 10:33:54');
INSERT INTO `user_award_record_002` VALUES (190, 'yzx', 1001, 1002, '647818742702', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:55', 'create', '2024-08-11 10:33:55', '2024-08-11 10:33:55');
INSERT INTO `user_award_record_002` VALUES (191, 'yzx', 1001, 1002, '947915362539', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:56', 'create', '2024-08-11 10:33:55', '2024-08-11 10:33:55');
INSERT INTO `user_award_record_002` VALUES (192, 'yzx', 1001, 1002, '324217625464', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:56', 'create', '2024-08-11 10:33:56', '2024-08-11 10:33:56');
INSERT INTO `user_award_record_002` VALUES (193, 'yzx', 1001, 1002, '346282982691', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:57', 'create', '2024-08-11 10:33:56', '2024-08-11 10:33:56');
INSERT INTO `user_award_record_002` VALUES (194, 'yzx', 1001, 1002, '498811328925', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:57', 'create', '2024-08-11 10:33:57', '2024-08-11 10:33:57');
INSERT INTO `user_award_record_002` VALUES (195, 'yzx', 1001, 1002, '610600557627', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:58', 'create', '2024-08-11 10:33:57', '2024-08-11 10:33:57');
INSERT INTO `user_award_record_002` VALUES (196, 'yzx', 1001, 1002, '476093682974', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:58', 'create', '2024-08-11 10:33:58', '2024-08-11 10:33:58');
INSERT INTO `user_award_record_002` VALUES (197, 'yzx', 1001, 1002, '391959287523', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:59', 'create', '2024-08-11 10:33:58', '2024-08-11 10:33:58');
INSERT INTO `user_award_record_002` VALUES (198, 'yzx', 1001, 1002, '202038281612', 101, 'OpenAI 增加使用次数', '2024-08-11 02:33:59', 'create', '2024-08-11 10:33:59', '2024-08-11 10:33:59');
INSERT INTO `user_award_record_002` VALUES (199, 'yzx', 1001, 1002, '828344947161', 101, 'OpenAI 增加使用次数', '2024-08-11 02:34:00', 'create', '2024-08-11 10:33:59', '2024-08-11 10:33:59');
INSERT INTO `user_award_record_002` VALUES (200, 'yzx', 1001, 1002, '438205567521', 101, 'OpenAI 增加使用次数', '2024-08-11 02:34:00', 'create', '2024-08-11 10:34:00', '2024-08-11 10:34:00');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_behavior_rebate_order_001
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_001
-- ----------------------------

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
