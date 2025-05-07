/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql-loki
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3326
 Source Schema         : loki

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 06/05/2025 22:00:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for h_article
-- ----------------------------
DROP TABLE IF EXISTS `h_article`;
CREATE TABLE `h_article` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `subtitle` varchar(255) NOT NULL COMMENT '副标题',
  `summary` tinytext COMMENT '摘要',
  `content` text NOT NULL COMMENT '正文',
  `author_id` bigint DEFAULT NULL COMMENT '作者ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_article
-- ----------------------------
BEGIN;
INSERT INTO `h_article` (`id`, `title`, `subtitle`, `summary`, `content`, `author_id`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1, 'Spring Boot 教程', '快速入门指南', '介绍 Spring Boot 的基本概念', 'Spring Boot 是一个简化 Spring 开发的框架...', 1, 1, 1739284914, 1739284914, 0);
INSERT INTO `h_article` (`id`, `title`, `subtitle`, `summary`, `content`, `author_id`, `version`, `create_date`, `update_date`, `deleted`) VALUES (2, 'MySQL 优化', '提升数据库性能的技巧', '本文分享了 MySQL 性能优化的方法', '在大规模数据应用中，优化 MySQL 是至关重要的...', 2, 1, 1739284914, 1739284914, 0);
INSERT INTO `h_article` (`id`, `title`, `subtitle`, `summary`, `content`, `author_id`, `version`, `create_date`, `update_date`, `deleted`) VALUES (3, '微服务架构', '探索分布式系统设计', '微服务架构的基本思想和实践', '微服务是一种架构风格，它强调将应用拆分成多个独立的服务...', 3, 1, 1739284914, 1739284914, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_asset
-- ----------------------------
DROP TABLE IF EXISTS `h_asset`;
CREATE TABLE `h_asset` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `asset_name` varchar(255) NOT NULL COMMENT '资产名称',
  `asset_code` varchar(255) NOT NULL COMMENT '资产编号',
  `asset_type` bigint NOT NULL COMMENT '资产类型(外键关联h_asset_type)',
  `department_id` bigint NOT NULL COMMENT '所属部门（外键关联h_department)',
  `location` varchar(255) DEFAULT NULL COMMENT '存放地点',
  `status` varchar(255) NOT NULL COMMENT '状态 正常 报废 维修',
  `purchase_date` bigint DEFAULT NULL COMMENT '购入日期',
  `purchase_price` decimal(17,2) DEFAULT '0.00' COMMENT '购买价格',
  `count` int DEFAULT '1' COMMENT '数量',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `asset_code` (`asset_code`),
  UNIQUE KEY `asset_name` (`asset_name`),
  UNIQUE KEY `asset_code_2` (`asset_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_asset
-- ----------------------------
BEGIN;
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Dell电脑', 'DELL-2025', 1, 1, '科技部', '正常', 1672531200000, 12000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '服务器', 'IP14-2023', 2, 1, '科技部', '正常', 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '交换机', 'DXPS-2023', 3, 2, '会议室', '正常', 1672531200000, 10000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '路由器', 'RTP-2023', 4, 14, '科技部', '正常', 1672416000000, 5000.00, 2, 1, 1672531200000, 1744889852678, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '打印机', 'PRT-2023', 5, 5, '科技部', '正常', 1732550400000, 3000.00, 2, 1, 1672531200000, 1744889864320, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '显示器', 'MON-2023', 6, 7, '科技部', '正常', 1672502400000, 2000.00, 2, 1, 1672531200000, 1744807745404, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '手机', 'IPHONE-2023', 7, 4, '科技部', '正常', 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '平板', 'IPAD-2023', 8, 4, '科技部', '正常', 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '投影仪', 'PJT-2023', 9, 5, '会议室', '正常', 1672531200000, 7000.00, 2, 1, 1672531200000, 1744889770344, 1);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '音响', 'SPK-2023', 10, 5, '会议室', '正常', 1672531200000, 4000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '摄像头', 'CAM-2023', 11, 6, '科技部', '正常', 1672531200000, 1500.00, 3, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '监控设备', 'CCTV-2023', 12, 6, '科技部', '正常', 1672531200000, 5000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '门禁设备', 'ACD-2023', 13, 7, '科技部', '正常', 1672531200000, 3000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '考勤机', 'AT-2023', 14, 7, '科技部', '正常', 1672531200000, 2000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 'UPS', 'UPS-2025', 15, 8, '科技部', '正常', 1672502400000, 2500.00, 2, 1, 1672531200000, 1744298662338, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '电源线', 'CABLE-2023', 16, 8, '科技部', '正常', 1672531200000, 100.00, 20, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '网线', 'LAN-2023', 17, 9, '科技部', '正常', 1672531200000, 50.00, 30, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '鼠标', 'MOUSE-2023', 18, 9, '科技部', '正常', 1672531200000, 200.00, 10, 1, 1672531200000, 1744288245023, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '键盘', 'KEYBOARD-2023', 19, 10, '科技部', '正常', 1672531200000, 300.00, 5, 1, 1672531200000, 1744288235878, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '传真机', 'FAX-2023', 20, 10, '科技部', '正常', 1672531200000, 1500.00, 2, 1, 1672531200000, 1744288248700, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '办公设备', 'OFFICE-2023', 21, 11, '科技部', '正常', 1672531200000, 500.00, 10, 1, 1672531200000, 1744288252268, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '电脑', 'PC-2023', 22, 11, '科技部', '正常', 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, '服务器机柜', 'RACK-2023', 23, 12, '科技部', '正常', 1672502400000, 2000.00, 2, 1, 1672531200000, 1744890093637, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '机房空调', 'AC-2023', 24, 8, '机房', '报废', 1671984000000, 8000.00, 3, 1, 1672531200000, 1744890388422, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910322874336444417, '测试资产1', 'TEST-2025-1', 1, 1, NULL, '维修', 1743436800000, 111.00, 2, 1, 1744291439982, 1744890393129, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910323327828807681, '测试资产12', 'TEST-2025-12', 1, 1, NULL, '正常', 1744128000000, 22.00, 23, 1, 1744291548104, 1744298088266, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910324022036410369, '测试资产13', 'TEST-2025-13', 1, 1, NULL, '正常', 1744214400000, 22.00, 23, 1, 1744291713615, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910328673377009666, '测试资产122', 'TEST-2025-122', 1, 1, NULL, '正常', 1744214400000, 21231.00, 11, 1, 1744292822581, 1744298423305, 1);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910338981256560641, '测试资产134', 'TEST-2025-134', 1, 1, NULL, '正常', 1744214400000, 1111.00, 22, 1, 1744295280172, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910342483366170626, '测试资产1222', 'TEST-2025-1222', 1, 1, NULL, '正常', 1744214400000, 222.00, 22, 1, 1744296115139, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910344710797488129, '测试资产144', 'TEST-2025-14', 1, 1, NULL, '正常', 1744041600000, 4442.00, 11, 1, 1744296646201, 1744889878520, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910352072333651970, '测试资产166', 'TEST-2025-16', 4, 1, NULL, '正常', 1744214400000, 666.00, 6, 1, 1744298401327, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910354939274653697, '测试资产17', 'TEST-2025-17', 1, 1, NULL, '正常', 1744214400000, 7.00, 7, 1, 1744299084859, 1744299099146, 1);
COMMIT;

-- ----------------------------
-- Table structure for h_asset_type
-- ----------------------------
DROP TABLE IF EXISTS `h_asset_type`;
CREATE TABLE `h_asset_type` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '资产类型名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，根类型为NULL）',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_asset_type
-- ----------------------------
BEGIN;
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '服务器', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '主机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '显示器', NULL, 1, 1672531200000, NULL, 1);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '网络设备', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '路由器', 4, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '交换机', 4, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '防火墙', 4, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '存储设备', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '硬盘', 8, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 'SSD', 8, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '打印机', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '传真机', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '办公设备', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '电脑', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '手机', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '平板', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '投影仪', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '音响', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '摄像头', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '监控设备', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '门禁设备', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '考勤机', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 'UPS', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '电源线', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, '网线', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, '鼠标', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, '键盘', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1909619214547738625, 'API测试1', NULL, 1, NULL, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1909620524911210498, 'API测试2', NULL, 1, 1744123986830, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1909625806890520577, 'API测试33', NULL, 1, 1744125246152, 1744125939224, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_budget
-- ----------------------------
DROP TABLE IF EXISTS `h_budget`;
CREATE TABLE `h_budget` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `year` int NOT NULL COMMENT '预算年度',
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `description` varchar(4096) DEFAULT NULL COMMENT '项目描述',
  `type` bigint NOT NULL COMMENT '项目类型(外键关联h_budget_type)',
  `category` varchar(255) NOT NULL COMMENT '项目性质(外键关联h_budget_category)',
  `is_inno` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否信创 0-是 1-否',
  `amount` decimal(17,2) NOT NULL COMMENT '预算金额',
  `department_id` bigint NOT NULL COMMENT '所属部门（外键关联h_department)',
  `team_id` bigint NOT NULL COMMENT '所属团队（外键关联h_team)',
  `priority` varchar(255) DEFAULT NULL COMMENT '优先级 1-高 2-中 3-低',
  `business_priority` varchar(255) DEFAULT NULL COMMENT '业务优先级',
  `business_description` varchar(255) DEFAULT NULL COMMENT '业务优先级情况说明',
  `planned_start_date` bigint DEFAULT NULL COMMENT '计划开始日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态 0-待审批 1-审批中 2-已审批 3-已拒绝',
  `applicant_id` bigint DEFAULT NULL COMMENT '申请人ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget
-- ----------------------------
BEGIN;
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 2025, '新核心系统建设', '根据人民银行金融信息技术应用创新（信创）工作要求，……', 2, '1', 0, 231371112.00, 32, 0, '0', '0', NULL, 1743609600000, '备注', 0, NULL, 1, NULL, 1746241646031, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 2025, '新核心生产环境', '新核心生产环境', 1, '1', 1, 30442600.00, 28, 0, '0', '0', NULL, 1744214400000, '备注', 0, NULL, 1, NULL, 1745845577012, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 2025, '监管预留', '监管预留', 1, '1', 1, 5000001.00, 30, 0, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745845638463, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 2025, '全行办公设备采购', '全行办公设备采购', 1, '2', 0, 19000001.00, 32, 0, '1', '1', '业务优先级情况说明', 1744214400000, '备注', 0, NULL, 1, NULL, 1746107718235, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 2025, '信创版亚信杀毒软件采购项目', '信创版亚信杀毒软件采购项目', 2, '2', 0, 2000000.00, 25, 0, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745845587442, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 2025, '总行机关三楼机房不间断电源老旧更换', '总行机关三楼机房不间断电源老旧更换', 3, '2', 0, 2000001.00, 32, 0, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1746107755535, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 2025, '零售信贷相关系统', '零售信贷相关系统', 1, '2', 0, 13520000.00, 17, 1, '1', '1', '业务优先级情况说明', 1744297928610, '备注', 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 2025, '对公业务管理平台二期项目', '对公业务管理平台二期项目', 1, '2', 0, 3930000.00, 12, 0, '1', '5', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745067433543, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913540186575085569, 2025, '测试项目1', '测试需求及目标', 4, '1', 1, 10001.00, 32, 0, '1', '5', '测试业务优先级情况说明', 1744905600000, '测试备注', 0, NULL, 1, 1745058506994, 1746241666292, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913540336320126978, 2025, '测试项目2', '测试需求及目标', 2, '1', 1, 100001.00, 27, 0, '1', '5', '测试业务优先级情况说明', 1744819200000, '测试备注', 0, NULL, 1, 1745058542696, 1746107773774, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913562409536987138, 2025, '测试项目4', '测试需求及目标', 2, '1', 1, 10002.00, 32, 0, '1', '5', '测试业务优先级情况说明', 1744819200000, '测试备注', 0, NULL, 1, 1745063805361, 1746241678834, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913562876979585025, 2025, '测试项目5', '测试需求及目标', 2, '1', 1, 10000.00, 32, 0, '1', '已立项', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745063916808, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913563238696361985, 2025, '测试项目6', '测试需求及目标', 2, '1', 1, 10000.00, 32, 0, '1', '5', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745064003048, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913577762849685505, 2025, '测试项目7', '测试需求及目标', 2, '1', 0, 10000.00, 32, 0, '1', '5', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745067465875, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_budget_adjustment
-- ----------------------------
DROP TABLE IF EXISTS `h_budget_adjustment`;
CREATE TABLE `h_budget_adjustment` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `budget_id` bigint NOT NULL COMMENT '预算ID',
  `user_id` bigint NOT NULL COMMENT '申请人ID',
  `adjustment_amount` decimal(17,2) NOT NULL COMMENT '调整金额',
  `adjustment_reason` varchar(255) NOT NULL COMMENT '调整原因',
  `adjustment_date` bigint NOT NULL COMMENT '调整日期',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态 0-待审批 1-审批中 2-已审批 3-已拒绝',
  `approver_id` bigint DEFAULT NULL COMMENT '审批人ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget_adjustment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_budget_category
-- ----------------------------
DROP TABLE IF EXISTS `h_budget_category`;
CREATE TABLE `h_budget_category` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '预算性质名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，根类型为NULL）',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget_category
-- ----------------------------
BEGIN;
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '监管要求落实', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '基础设施建设-基础软硬件平台建设', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '基础设施建设-系统升级（每年固定）', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '基础设施建设-系统升级（按需升级）', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '基础设施建设-老旧设备更换', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '日常运营类', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '日常安全防护类', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '日常运维监控类', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '信息科技工具平台类', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_category` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '业务规划类', NULL, 1, 1672531200000, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_budget_execution
-- ----------------------------
DROP TABLE IF EXISTS `h_budget_execution`;
CREATE TABLE `h_budget_execution` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `budget_id` bigint NOT NULL COMMENT '预算ID',
  `execution_amount` decimal(17,2) NOT NULL COMMENT '执行金额',
  `execution_reason` varchar(255) NOT NULL COMMENT '执行原因',
  `execution_date` bigint NOT NULL COMMENT '执行日期',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget_execution
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_budget_type
-- ----------------------------
DROP TABLE IF EXISTS `h_budget_type`;
CREATE TABLE `h_budget_type` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '预算类型名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，根类型为NULL）',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget_type
-- ----------------------------
BEGIN;
INSERT INTO `h_budget_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '基础硬件', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '软件', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '人力资源池', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '软硬件联合', NULL, 1, 1672531200000, NULL, 0);
INSERT INTO `h_budget_type` (`id`, `name`, `parent_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '其他', NULL, 1, 1672531200000, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_comment
-- ----------------------------
DROP TABLE IF EXISTS `h_comment`;
CREATE TABLE `h_comment` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `post_id` bigint NOT NULL COMMENT '文章ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `parent_id` bigint DEFAULT NULL COMMENT '父评论ID',
  `content` text NOT NULL COMMENT '评论内容',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_comment
-- ----------------------------
BEGIN;
INSERT INTO `h_comment` (`id`, `post_id`, `user_id`, `parent_id`, `content`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1, 1, 1, NULL, '这是一条评论', 1, 1739284999, 1739284999, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_department
-- ----------------------------
DROP TABLE IF EXISTS `h_department`;
CREATE TABLE `h_department` (
  `id` bigint NOT NULL COMMENT '部门ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门描述',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门编码',
  `parent_id` bigint DEFAULT NULL COMMENT '父级部门ID',
  `level` int DEFAULT NULL COMMENT '部门层级',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门';

-- ----------------------------
-- Records of h_department
-- ----------------------------
BEGIN;
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '总行领导', '总行领导', '0001', NULL, 1, 1, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '驻盛京银行纪检监察组', '驻盛京银行纪检监察组', '0002', NULL, 1, 2, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '驻盛京银行纪检监察组纪检监察部', '驻盛京银行纪检监察组纪检监察部', '0003', NULL, 1, 3, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '党委办公室', '党委办公室', '0004', NULL, 1, 4, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '办公室', '办公室', '0005', NULL, 1, 5, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '党委组织部', '党委组织部', '0006', NULL, 1, 6, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '人力资源部', '人力资源部', '0007', NULL, 1, 7, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '计划财务部', '计划财务部', '0008', NULL, 1, 8, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '董事会办公室', '董事会办公室', '0009', NULL, 1, 9, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '监事会办公室', '监事会办公室', '0010', NULL, 1, 10, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '工会', '工会', '0011', NULL, 1, 11, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '公司银行部', '公司银行部', '0012', NULL, 1, 12, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '机构业务部', '机构业务部', '0013', NULL, 1, 13, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '交易银行部', '交易银行部', '0014', NULL, 1, 14, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '小企业金融服务中心', '小企业金融服务中心', '0015', NULL, 1, 15, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '零售银行部', '零售银行部', '0016', NULL, 1, 16, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '零售信贷部', '零售信贷部', '0017', NULL, 1, 17, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '数字金融部', '数字金融部', '0018', NULL, 1, 18, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '信用卡中心', '信用卡中心', '0019', NULL, 1, 19, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '资金运营中心', '资金运营中心', '0020', NULL, 1, 20, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '资产管理部', '资产管理部', '0021', NULL, 1, 21, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '风险管理部', '风险管理部', '0022', NULL, 1, 22, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, '授信审批部', '授信审批部', '0023', NULL, 1, 23, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '资产保全部', '资产保全部', '0024', NULL, 1, 24, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, '资产保全二部', '资产保全二部', '0025', NULL, 1, 25, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, '资产保全三部', '资产保全三部', '0026', NULL, 1, 26, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, '特殊资产经营中心', '特殊资产经营中心', '0027', NULL, 1, 27, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, '合规部', '合规部', '0028', NULL, 1, 28, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (29, '督查办公室', '督查办公室', '0029', NULL, 1, 29, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (30, '审计部', '审计部', '0030', NULL, 1, 30, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (31, '运营管理部', '运营管理部', '0031', NULL, 1, 31, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (32, '信息科技部', '信息科技部', '0032', NULL, 1, 32, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (33, '保卫部', '保卫部', '0033', NULL, 1, 33, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (34, '机关党委', '机关党委', '0034', NULL, 1, 34, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (35, '团委', '团委', '0035', NULL, 1, 35, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (36, '资深专员', '资深专员', '0036', NULL, 1, 36, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (37, '沈阳分行', '沈阳分行', '0037', NULL, 1, 37, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (38, '北京分行', '北京分行', '0038', NULL, 1, 38, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (39, '上海分行', '上海分行', '0039', NULL, 1, 39, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (40, '天津分行', '天津分行', '0040', NULL, 1, 40, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (41, '长春分行', '长春分行', '0041', NULL, 1, 41, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (42, '大连分行', '大连分行', '0042', NULL, 1, 42, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (43, '鞍山分行', '鞍山分行', '0043', NULL, 1, 43, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (44, '抚顺分行', '抚顺分行', '0044', NULL, 1, 44, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (45, '本溪分行', '本溪分行', '0045', NULL, 1, 45, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (46, '丹东分行', '丹东分行', '0046', NULL, 1, 46, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (47, '锦州分行', '锦州分行', '0047', NULL, 1, 47, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (48, '营口分行', '营口分行', '0048', NULL, 1, 48, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (49, '阜新分行', '阜新分行', '0049', NULL, 1, 49, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (50, '辽阳分行', '辽阳分行', '0050', NULL, 1, 50, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (51, '盘锦分行', '盘锦分行', '0051', NULL, 1, 51, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (52, '铁岭分行', '铁岭分行', '0052', NULL, 1, 52, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (53, '朝阳分行', '朝阳分行', '0053', NULL, 1, 53, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (54, '葫芦岛分行', '葫芦岛分行', '0054', NULL, 1, 54, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (55, '盛银消费金融有限公司', '盛银消费金融有限公司', '0055', NULL, 1, 55, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (56, '盛银数科（沈阳）技术有限公司', '盛银数科（沈阳）技术有限公司', '0056', NULL, 1, 56, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (57, '上海宝山富民村镇银行', '上海宝山富民村镇银行', '0057', NULL, 1, 57, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (58, '沈阳沈北富民村镇银行', '沈阳沈北富民村镇银行', '0058', NULL, 1, 58, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (59, '沈阳辽中富民村镇银行', '沈阳辽中富民村镇银行', '0059', NULL, 1, 59, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (60, '沈阳法库富民村镇银行', '沈阳法库富民村镇银行', '0060', NULL, 1, 60, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (61, '沈阳新民富民村镇银行', '沈阳新民富民村镇银行', '0061', NULL, 1, 61, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (62, '宁波江北富民村镇银行', '宁波江北富民村镇银行', '0062', NULL, 1, 62, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (63, '其他', '其他', '0063', NULL, 1, 63, 1, 20230304112717, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_department_quota
-- ----------------------------
DROP TABLE IF EXISTS `h_department_quota`;
CREATE TABLE `h_department_quota` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `department_id` bigint NOT NULL COMMENT '部门ID',
  `budget_year` int NOT NULL COMMENT '预算年度',
  `quota` decimal(17,2) NOT NULL COMMENT '预算额度',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_budget_year` (`department_id`,`budget_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_department_quota
-- ----------------------------
BEGIN;
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 5, 2025, 5000000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 7, 2025, 960000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 8, 2025, 13650000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 12, 2025, 13930000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 14, 2025, 4630000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 15, 2025, 32707600.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 16, 2025, 9923900.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 17, 2025, 26280000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 18, 2025, 17300000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 19, 2025, 18000000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 20, 2025, 18008000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 21, 2025, 3840000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 22, 2025, 5400000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 24, 2025, 4000000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 28, 2025, 2660000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 31, 2025, 20248000.00, 1, NULL, NULL, 0);
INSERT INTO `h_department_quota` (`id`, `department_id`, `budget_year`, `quota`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1912320915336290305, 32, 2025, 12345678901234.00, 1, 1744767810079, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_duty
-- ----------------------------
DROP TABLE IF EXISTS `h_duty`;
CREATE TABLE `h_duty` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` bigint NOT NULL COMMENT '日期',
  `day` varchar(20) DEFAULT NULL COMMENT '白班',
  `night` varchar(20) DEFAULT NULL COMMENT '夜班',
  `adjust` varchar(20) DEFAULT NULL COMMENT '调休',
  `core` varchar(20) DEFAULT NULL COMMENT '核心响应',
  `core_phone` varchar(20) DEFAULT NULL COMMENT '核心响应电话',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3949 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_duty
-- ----------------------------
BEGIN;
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 1558314000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 1558400400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 1558486800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 1558573200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 1558659600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 1558746000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 1558832400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 1558918800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 1559005200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 1559091600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 1559178000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 1559264400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 1559350800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 1559437200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 1559523600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 1559610000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 1559696400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 1559782800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, 1559869200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, 1559955600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, 1560042000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, 1560128400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 1560214800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, 1560301200, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, 1560387600, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, 1560474000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, 1560560400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, 1560646800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (29, 1560733200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (30, 1560819600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (31, 1560906000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (32, 1560992400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (33, 1561078800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (34, 1561165200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (35, 1561251600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (36, 1561338000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (37, 1561424400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (38, 1561510800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (39, 1561597200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (40, 1561683600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (41, 1561770000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (42, 1561856400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (43, 1561942800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (44, 1562029200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (45, 1562115600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (46, 1562202000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (47, 1562288400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (48, 1562374800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (49, 1562461200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (50, 1562547600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (51, 1562634000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (52, 1562720400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (53, 1562806800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (54, 1562893200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (55, 1562979600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (56, 1563066000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (57, 1563152400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (58, 1563238800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (59, 1563325200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (60, 1563411600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (61, 1563498000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (62, 1563584400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (63, 1563670800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (64, 1563757200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (65, 1563843600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (66, 1563930000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (67, 1564016400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (68, 1564102800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (69, 1564189200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (70, 1564275600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (71, 1564362000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (72, 1564448400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (73, 1564534800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (74, 1564621200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (75, 1564707600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (76, 1564794000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (77, 1564880400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (78, 1564966800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (79, 1565053200, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (80, 1565139600, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (81, 1565226000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (82, 1565312400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (83, 1565398800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (84, 1565485200, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (85, 1565571600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (86, 1565658000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (87, 1565744400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (88, 1565830800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (89, 1565917200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (90, 1566003600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (91, 1566090000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (92, 1566176400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (93, 1566262800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (94, 1566349200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (95, 1566435600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (96, 1566522000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (97, 1566608400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (98, 1566694800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (99, 1566781200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (100, 1566867600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (101, 1566954000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (102, 1567040400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (103, 1567126800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (104, 1567213200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (105, 1567299600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (106, 1567386000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (107, 1567472400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (108, 1567558800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (109, 1567645200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (110, 1567731600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (111, 1567818000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (112, 1567904400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (113, 1567990800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (114, 1568077200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (115, 1568163600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (116, 1568250000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (117, 1568336400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (118, 1568422800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (119, 1568509200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (120, 1568595600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (121, 1568682000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (122, 1568768400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (123, 1568854800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (124, 1568941200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (125, 1569027600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (126, 1569114000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (127, 1569200400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (128, 1569286800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (129, 1569373200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (130, 1569459600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (131, 1569546000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (132, 1569632400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (133, 1569718800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (134, 1569805200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (135, 1569891600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (136, 1569978000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (137, 1570064400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (138, 1570150800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (139, 1570237200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (140, 1570323600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (141, 1570410000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (142, 1570496400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (143, 1570582800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (144, 1570669200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (145, 1570755600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (146, 1570842000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (147, 1570928400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (148, 1571014800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (149, 1571101200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (150, 1571187600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (151, 1571274000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (152, 1571360400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (153, 1571446800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (154, 1571533200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (155, 1571619600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (156, 1571706000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (157, 1571792400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (158, 1571878800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (159, 1571965200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (160, 1572051600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (161, 1572138000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (162, 1572224400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (163, 1572310800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (164, 1572397200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (165, 1572483600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (166, 1572570000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (167, 1572656400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (168, 1572742800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (169, 1572829200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (170, 1572915600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (171, 1573002000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (172, 1573088400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (173, 1573174800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (174, 1573261200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (175, 1573347600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (176, 1573434000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (177, 1573520400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (178, 1573606800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (179, 1573693200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (180, 1573779600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (181, 1573866000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (182, 1573952400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (183, 1574038800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (184, 1574125200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (185, 1574211600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (186, 1574298000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (187, 1574384400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (188, 1574470800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (189, 1574557200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (190, 1574643600, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (191, 1574730000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (192, 1574816400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (193, 1574902800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (194, 1574989200, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (195, 1575075600, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (196, 1575162000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (197, 1575248400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (198, 1575334800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (199, 1575421200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (200, 1575507600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (201, 1575594000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (202, 1575680400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (203, 1575766800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (204, 1575853200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (205, 1575939600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (206, 1576026000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (207, 1576112400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (208, 1576198800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (209, 1576285200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (210, 1576371600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (211, 1576458000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (212, 1576544400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (213, 1576630800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (214, 1576717200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (215, 1576803600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (216, 1576890000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (217, 1576976400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (218, 1577062800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (219, 1577149200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (220, 1577235600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (221, 1577322000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (222, 1577408400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (223, 1577494800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (224, 1577581200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (225, 1577667600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (226, 1577754000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (227, 1577840400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (228, 1577926800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (229, 1578013200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (230, 1578099600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (231, 1578186000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (232, 1578272400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (233, 1578358800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (234, 1578445200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (235, 1578531600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (236, 1578618000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (237, 1578704400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (238, 1578790800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (239, 1578877200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (240, 1578963600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (241, 1579050000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (242, 1579136400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (243, 1579222800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (244, 1579309200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (245, 1579395600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (246, 1579482000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (247, 1579568400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (248, 1579654800, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (249, 1579741200, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (250, 1579827600, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (251, 1579914000, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (252, 1580000400, NULL, NULL, NULL, '佟金龙', '13889286791', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (253, 1580086800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (254, 1580173200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (255, 1580259600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (256, 1580346000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (257, 1580432400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (258, 1580518800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (259, 1580605200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (260, 1580691600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (261, 1580778000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (262, 1580864400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (263, 1580950800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (264, 1581037200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (265, 1581123600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (266, 1581210000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (267, 1581296400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (268, 1581382800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (269, 1581469200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (270, 1581555600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (271, 1581642000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (272, 1581728400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (273, 1581814800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (274, 1581901200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (275, 1581987600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (276, 1582074000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (277, 1582160400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (278, 1582246800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (279, 1582333200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (280, 1582419600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (281, 1582506000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (282, 1582592400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (283, 1582678800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (284, 1582765200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (285, 1582851600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (286, 1582938000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (287, 1583024400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (288, 1583110800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (289, 1583197200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (290, 1583283600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (291, 1583370000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (292, 1583456400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (293, 1583542800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (294, 1583629200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (295, 1583715600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (296, 1583802000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (297, 1583888400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (298, 1583974800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (299, 1584061200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (300, 1584147600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (301, 1584234000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (302, 1584320400, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (303, 1584406800, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (304, 1584493200, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (305, 1584579600, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (306, 1584666000, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (307, 1584752400, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (308, 1584838800, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (309, 1584925200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (310, 1585011600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (311, 1585098000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (312, 1585184400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (313, 1585270800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (314, 1585357200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (315, 1585443600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (316, 1585530000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (317, 1585616400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (318, 1585702800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (319, 1585789200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (320, 1585875600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (321, 1585962000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (322, 1586048400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (323, 1586134800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (324, 1586221200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (325, 1586307600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (326, 1586394000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (327, 1586480400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (328, 1586566800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (329, 1586653200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (330, 1586739600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (331, 1586826000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (332, 1586912400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (333, 1586998800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (334, 1587085200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (335, 1587171600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (336, 1587258000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (337, 1587344400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (338, 1587430800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (339, 1587517200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (340, 1587603600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (341, 1587690000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (342, 1587776400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (343, 1587862800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (344, 1587949200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (345, 1588035600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (346, 1588122000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (347, 1588208400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (348, 1588294800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (349, 1588381200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (350, 1588467600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (351, 1588554000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (352, 1588640400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (353, 1588726800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (354, 1588813200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (355, 1588899600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (356, 1588986000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (357, 1589072400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (358, 1589158800, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (359, 1589245200, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (360, 1589331600, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (361, 1589418000, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (362, 1589504400, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (363, 1589590800, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (364, 1589677200, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (365, 1589763600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (366, 1589850000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (367, 1589936400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (368, 1590022800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (369, 1590109200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (370, 1590195600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (371, 1590282000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (372, 1590368400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (373, 1590454800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (374, 1590541200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (375, 1590627600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (376, 1590714000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (377, 1590800400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (378, 1590886800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (379, 1590973200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (380, 1591059600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (381, 1591146000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (382, 1591232400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (383, 1591318800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (384, 1591405200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (385, 1591491600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (386, 1591578000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (387, 1591664400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (388, 1591750800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (389, 1591837200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (390, 1591923600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (391, 1592010000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (392, 1592096400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (393, 1592182800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (394, 1592269200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (395, 1592355600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (396, 1592442000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (397, 1592528400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (398, 1592614800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (399, 1592701200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (400, 1592787600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (401, 1592874000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (402, 1592960400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (403, 1593046800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (404, 1593133200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (405, 1593219600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (406, 1593306000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (407, 1593392400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (408, 1593478800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (409, 1593565200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (410, 1593651600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (411, 1593738000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (412, 1593824400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (413, 1593910800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (414, 1593997200, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (415, 1594083600, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (416, 1594170000, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (417, 1594256400, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (418, 1594342800, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (419, 1594429200, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (420, 1594515600, NULL, NULL, NULL, '佟金龙', '15524507248', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (421, 1594602000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (422, 1594688400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (423, 1594774800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (424, 1594861200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (425, 1594947600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (426, 1595034000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (427, 1595120400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (428, 1595206800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (429, 1595293200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (430, 1595379600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (431, 1595466000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (432, 1595552400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (433, 1595638800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (434, 1595725200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (435, 1595811600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (436, 1595898000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (437, 1595984400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (438, 1596070800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (439, 1596157200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (440, 1596243600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (441, 1596330000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (442, 1596416400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (443, 1596502800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (444, 1596589200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (445, 1596675600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (446, 1596762000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (447, 1596848400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (448, 1596934800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (449, 1597021200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (450, 1597107600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (451, 1597194000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (452, 1597280400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (453, 1597366800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (454, 1597453200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (455, 1597539600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (456, 1597626000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (457, 1597712400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (458, 1597798800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (459, 1597885200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (460, 1597971600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (461, 1598058000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (462, 1598144400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (463, 1598230800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (464, 1598317200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (465, 1598403600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (466, 1598490000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (467, 1598576400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (468, 1598662800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (469, 1598749200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (470, 1598835600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (471, 1598922000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (472, 1599008400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (473, 1599094800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (474, 1599181200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (475, 1599267600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (476, 1599354000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (477, 1599440400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (478, 1599526800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (479, 1599613200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (480, 1599699600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (481, 1599786000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (482, 1599872400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (483, 1599958800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (484, 1600045200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (485, 1600131600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (486, 1600218000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (487, 1600304400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (488, 1600390800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (489, 1600477200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (490, 1600563600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (491, 1600650000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (492, 1600736400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (493, 1600822800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (494, 1600909200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (495, 1600995600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (496, 1601082000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (497, 1601168400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (498, 1601254800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (499, 1601341200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (500, 1601427600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (501, 1601514000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (502, 1601600400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (503, 1601686800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (504, 1601773200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (505, 1601859600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (506, 1601946000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (507, 1602032400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (508, 1602118800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (509, 1602205200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (510, 1602291600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (511, 1602378000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (512, 1602464400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (513, 1602550800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (514, 1602637200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (515, 1602723600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (516, 1602810000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (517, 1602896400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (518, 1602982800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (519, 1603069200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (520, 1603155600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (521, 1603242000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (522, 1603328400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (523, 1603414800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (524, 1603501200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (525, 1603587600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (526, 1603674000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (527, 1603760400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (528, 1603846800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (529, 1603933200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (530, 1604019600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (531, 1604106000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (532, 1604192400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (533, 1604278800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (534, 1604365200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (535, 1604451600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (536, 1604538000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (537, 1604624400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (538, 1604710800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (539, 1604797200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (540, 1604883600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (541, 1604970000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (542, 1605056400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (543, 1605142800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (544, 1605229200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (545, 1605315600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (546, 1605402000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (547, 1605488400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (548, 1605574800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (549, 1605661200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (550, 1605747600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (551, 1605834000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (552, 1605920400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (553, 1606006800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (554, 1606093200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (555, 1606179600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (556, 1606266000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (557, 1606352400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (558, 1606438800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (559, 1606525200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (560, 1606611600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (561, 1606698000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (562, 1606784400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (563, 1606870800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (564, 1606957200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (565, 1607043600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (566, 1607130000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (567, 1607216400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (568, 1607302800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (569, 1607389200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (570, 1607475600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (571, 1607562000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (572, 1607648400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (573, 1607734800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (574, 1607821200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (575, 1607907600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (576, 1607994000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (577, 1608080400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (578, 1608166800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (579, 1608253200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (580, 1608339600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (581, 1608426000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (582, 1608512400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (583, 1608598800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (584, 1608685200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (585, 1608771600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (586, 1608858000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (587, 1608944400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (588, 1609030800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (589, 1609117200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (590, 1609203600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (591, 1609290000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (592, 1609376400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (593, 1609462800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (594, 1609549200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (595, 1609635600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (596, 1609722000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (597, 1609808400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (598, 1609894800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (599, 1609981200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (600, 1610067600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (601, 1610154000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (602, 1610240400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (603, 1610326800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (604, 1610413200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (605, 1610499600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (606, 1610586000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (607, 1610672400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (608, 1610758800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (609, 1610845200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (610, 1610931600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (611, 1611018000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (612, 1611104400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (613, 1611190800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (614, 1611277200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (615, 1611363600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (616, 1611450000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (617, 1611536400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (618, 1611622800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (619, 1611709200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (620, 1611795600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (621, 1611882000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (622, 1611968400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (623, 1612054800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (624, 1612141200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (625, 1612227600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (626, 1612314000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (627, 1612400400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (628, 1612486800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (629, 1612573200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (630, 1612659600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (631, 1612746000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (632, 1612832400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (633, 1612918800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (634, 1613005200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (635, 1613091600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (636, 1613178000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (637, 1613264400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (638, 1613350800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (639, 1613437200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (640, 1613523600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (641, 1613610000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (642, 1613696400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (643, 1613782800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (644, 1613869200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (645, 1613955600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (646, 1614042000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (647, 1614128400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (648, 1614214800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (649, 1614301200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (650, 1614387600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (651, 1614474000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (652, 1614560400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (653, 1614646800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (654, 1614733200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (655, 1614819600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (656, 1614906000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (657, 1614992400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (658, 1615078800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (659, 1615165200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (660, 1615251600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (661, 1615338000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (662, 1615424400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (663, 1615510800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (664, 1615597200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (665, 1615683600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (666, 1615770000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (667, 1615856400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (668, 1615942800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (669, 1616029200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (670, 1616115600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (671, 1616202000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (672, 1616288400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (673, 1616374800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (674, 1616461200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (675, 1616547600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (676, 1616634000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (677, 1616720400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (678, 1616806800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (679, 1616893200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (680, 1616979600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (681, 1617066000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (682, 1617152400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (683, 1617238800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (684, 1617325200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (685, 1617411600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (686, 1617498000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (687, 1617584400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (688, 1617670800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (689, 1617757200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (690, 1617843600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (691, 1617930000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (692, 1618016400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (693, 1618102800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (694, 1618189200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (695, 1618275600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (696, 1618362000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (697, 1618448400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (698, 1618534800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (699, 1618621200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (700, 1618707600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (701, 1618794000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (702, 1618880400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (703, 1618966800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (704, 1619053200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (705, 1619139600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (706, 1619226000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (707, 1619312400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (708, 1619398800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (709, 1619485200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (710, 1619571600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (711, 1619658000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (712, 1619744400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (713, 1619830800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (714, 1619917200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (715, 1620003600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (716, 1620090000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (717, 1620176400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (718, 1620262800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (719, 1620349200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (720, 1620435600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (721, 1620522000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (722, 1620608400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (723, 1620694800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (724, 1620781200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (725, 1620867600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (726, 1620954000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (727, 1621040400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (728, 1621126800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (729, 1621213200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (730, 1621299600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (731, 1621386000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (732, 1621472400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (733, 1621558800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (734, 1621645200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (735, 1621731600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (736, 1621818000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (737, 1621904400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (738, 1621990800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (739, 1622077200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (740, 1622163600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (741, 1622250000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (742, 1622336400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (743, 1622422800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (744, 1622509200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (745, 1622595600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (746, 1622682000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (747, 1622768400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (748, 1622854800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (749, 1622941200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (750, 1623027600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (751, 1623114000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (752, 1623200400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (753, 1623286800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (754, 1623373200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (755, 1623459600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (756, 1623546000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (757, 1623632400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (758, 1623718800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (759, 1623805200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (760, 1623891600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (761, 1623978000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (762, 1624064400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (763, 1624150800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (764, 1624237200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (765, 1624323600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (766, 1624410000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (767, 1624496400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (768, 1624582800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (769, 1624669200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (770, 1624755600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (771, 1624842000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (772, 1624928400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (773, 1625014800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (774, 1625101200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (775, 1625187600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (776, 1625274000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (777, 1625360400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (778, 1625446800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (779, 1625533200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (780, 1625619600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (781, 1625706000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (782, 1625792400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (783, 1625878800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (784, 1625965200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (785, 1626051600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (786, 1626138000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (787, 1626224400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (788, 1626310800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (789, 1626397200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (790, 1626483600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (791, 1626570000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (792, 1626656400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (793, 1626742800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (794, 1626829200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (795, 1626915600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (796, 1627002000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (797, 1627088400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (798, 1627174800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (799, 1627261200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (800, 1627347600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (801, 1627434000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (802, 1627520400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (803, 1627606800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (804, 1627693200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (805, 1627779600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (806, 1627866000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (807, 1627952400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (808, 1628038800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (809, 1628125200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (810, 1628211600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (811, 1628298000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (812, 1628384400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (813, 1628470800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (814, 1628557200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (815, 1628643600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (816, 1628730000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (817, 1628816400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (818, 1628902800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (819, 1628989200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (820, 1629075600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (821, 1629162000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (822, 1629248400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (823, 1629334800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (824, 1629421200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (825, 1629507600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (826, 1629594000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (827, 1629680400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (828, 1629766800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (829, 1629853200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (830, 1629939600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (831, 1630026000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (832, 1630112400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (833, 1630198800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (834, 1630285200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (835, 1630371600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (836, 1630458000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (837, 1630544400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (838, 1630630800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (839, 1630717200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (840, 1630803600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (841, 1630890000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (842, 1630976400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (843, 1631062800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (844, 1631149200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (845, 1631235600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (846, 1631322000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (847, 1631408400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (848, 1631494800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (849, 1631581200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (850, 1631667600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (851, 1631754000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (852, 1631840400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (853, 1631926800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (854, 1632013200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (855, 1632099600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (856, 1632186000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (857, 1632272400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (858, 1632358800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (859, 1632445200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (860, 1632531600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (861, 1632618000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (862, 1632704400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (863, 1632790800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (864, 1632877200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (865, 1632963600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (866, 1633050000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (867, 1633136400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (868, 1633222800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (869, 1633309200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (870, 1633395600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (871, 1633482000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (872, 1633568400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (873, 1633654800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (874, 1633741200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (875, 1633827600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (876, 1633914000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (877, 1634000400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (878, 1634086800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (879, 1634173200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (880, 1634259600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (881, 1634346000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (882, 1634432400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (883, 1634518800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (884, 1634605200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (885, 1634691600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (886, 1634778000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (887, 1634864400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (888, 1634950800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (889, 1635037200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (890, 1635123600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (891, 1635210000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (892, 1635296400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (893, 1635382800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (894, 1635469200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (895, 1635555600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (896, 1635642000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (897, 1635728400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (898, 1635814800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (899, 1635901200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (900, 1635987600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (901, 1636074000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (902, 1636160400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (903, 1636246800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (904, 1636333200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (905, 1636419600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (906, 1636506000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (907, 1636592400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (908, 1636678800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (909, 1636765200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (910, 1636851600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (911, 1636938000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (912, 1637024400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (913, 1637110800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (914, 1637197200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (915, 1637283600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (916, 1637370000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (917, 1637456400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (918, 1637542800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (919, 1637629200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (920, 1637715600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (921, 1637802000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (922, 1637888400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (923, 1637974800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (924, 1638061200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (925, 1638147600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (926, 1638234000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (927, 1638320400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (928, 1638406800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (929, 1638493200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (930, 1638579600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (931, 1638666000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (932, 1638752400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (933, 1638838800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (934, 1638925200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (935, 1639011600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (936, 1639098000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (937, 1639184400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (938, 1639270800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (939, 1639357200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (940, 1639443600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (941, 1639530000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (942, 1639616400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (943, 1639702800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (944, 1639789200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (945, 1639875600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (946, 1639962000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (947, 1640048400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (948, 1640134800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (949, 1640221200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (950, 1640307600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (951, 1640394000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (952, 1640480400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (953, 1640566800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (954, 1640653200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (955, 1640739600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (956, 1640826000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (957, 1640912400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (958, 1640998800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (959, 1641085200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (960, 1641171600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (961, 1641258000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (962, 1641344400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (963, 1641430800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (964, 1641517200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (965, 1641603600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (966, 1641690000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (967, 1641776400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (968, 1641862800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (969, 1641949200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (970, 1642035600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (971, 1642122000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (972, 1642208400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (973, 1642294800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (974, 1642381200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (975, 1642467600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (976, 1642554000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (977, 1642640400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (978, 1642726800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (979, 1642813200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (980, 1642899600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (981, 1642986000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (982, 1643072400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (983, 1643158800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (984, 1643245200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (985, 1643331600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (986, 1643418000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (987, 1643504400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (988, 1643590800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (989, 1643677200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (990, 1643763600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (991, 1643850000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (992, 1643936400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (993, 1644022800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (994, 1644109200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (995, 1644195600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (996, 1644282000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (997, 1644368400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (998, 1644454800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (999, 1644541200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1000, 1644627600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1001, 1644714000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1002, 1644800400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1003, 1644886800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1004, 1644973200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1005, 1645059600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1006, 1645146000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1007, 1645232400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1008, 1645318800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1009, 1645405200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1010, 1645491600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1011, 1645578000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1012, 1645664400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1013, 1645750800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1014, 1645837200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1015, 1645923600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1016, 1646010000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1017, 1646096400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1018, 1646182800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1019, 1646269200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1020, 1646355600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1021, 1646442000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1022, 1646528400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1023, 1646614800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1024, 1646701200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1025, 1646787600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1026, 1646874000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1027, 1646960400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1028, 1647046800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1029, 1647133200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1030, 1647219600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1031, 1647306000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1032, 1647392400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1033, 1647478800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1034, 1647565200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1035, 1647651600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1036, 1647738000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1037, 1647824400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1038, 1647910800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1039, 1647997200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1040, 1648083600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1041, 1648170000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1042, 1648256400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1043, 1648342800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1044, 1648429200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1045, 1648515600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1046, 1648602000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1047, 1648688400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1048, 1648774800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1049, 1648861200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1050, 1648947600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1051, 1649034000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1052, 1649120400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1053, 1649206800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1054, 1649293200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1055, 1649379600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1056, 1649466000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1057, 1649552400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1058, 1649638800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1059, 1649725200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1060, 1649811600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1061, 1649898000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1062, 1649984400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1063, 1650070800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1064, 1650157200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1065, 1650243600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1066, 1650330000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1067, 1650416400, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1068, 1650502800, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1069, 1650589200, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1070, 1650675600, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1071, 1650762000, NULL, NULL, NULL, '林乐森', '18321975695', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1072, 1650848400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1073, 1650934800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1074, 1651021200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1075, 1651107600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1076, 1651194000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1077, 1651280400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1078, 1651366800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1079, 1651453200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1080, 1651539600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1081, 1651626000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1082, 1651712400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1083, 1651798800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1084, 1651885200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1085, 1651971600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1086, 1652058000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1087, 1652144400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1088, 1652230800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1089, 1652317200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1090, 1652403600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1091, 1652490000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1092, 1652576400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1093, 1652662800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1094, 1652749200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1095, 1652835600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1096, 1652922000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1097, 1653008400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1098, 1653094800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1099, 1653181200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1100, 1653267600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1101, 1653354000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1102, 1653440400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1103, 1653526800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1104, 1653613200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1105, 1653699600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1106, 1653786000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1107, 1653872400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1108, 1653958800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1109, 1654045200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1110, 1654131600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1111, 1654218000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1112, 1654304400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1113, 1654390800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1114, 1654477200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1115, 1654563600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1116, 1654650000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1117, 1654736400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1118, 1654822800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1119, 1654909200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1120, 1654995600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1121, 1655082000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1122, 1655168400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1123, 1655254800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1124, 1655341200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1125, 1655427600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1126, 1655514000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1127, 1655600400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1128, 1655686800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1129, 1655773200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1130, 1655859600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1131, 1655946000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1132, 1656032400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1133, 1656118800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1134, 1656205200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1135, 1656291600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1136, 1656378000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1137, 1656464400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1138, 1656550800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1139, 1656637200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1140, 1656723600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1141, 1656810000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1142, 1656896400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1143, 1656982800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1144, 1657069200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1145, 1657155600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1146, 1657242000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1147, 1657328400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1148, 1657414800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1149, 1657501200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1150, 1657587600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1151, 1657674000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1152, 1657760400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1153, 1657846800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1154, 1657933200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1155, 1658019600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1156, 1658106000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1157, 1658192400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1158, 1658278800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1159, 1658365200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1160, 1658451600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1161, 1658538000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1162, 1658624400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1163, 1658710800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1164, 1658797200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1165, 1658883600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1166, 1658970000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1167, 1659056400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1168, 1659142800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1169, 1659229200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1170, 1659315600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1171, 1659402000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1172, 1659488400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1173, 1659574800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1174, 1659661200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1175, 1659747600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1176, 1659834000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1177, 1659920400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1178, 1660006800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1179, 1660093200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1180, 1660179600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1181, 1660266000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1182, 1660352400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1183, 1660438800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1184, 1660525200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1185, 1660611600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1186, 1660698000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1187, 1660784400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1188, 1660870800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1189, 1660957200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1190, 1661043600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1191, 1661130000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1192, 1661216400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1193, 1661302800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1194, 1661389200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1195, 1661475600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1196, 1661562000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1197, 1661648400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1198, 1661734800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1199, 1661821200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1200, 1661907600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1201, 1661994000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1202, 1662080400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1203, 1662166800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1204, 1662253200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1205, 1662339600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1206, 1662426000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1207, 1662512400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1208, 1662598800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1209, 1662685200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1210, 1662771600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1211, 1662858000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1212, 1662944400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1213, 1663030800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1214, 1663117200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1215, 1663203600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1216, 1663290000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1217, 1663376400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1218, 1663462800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1219, 1663549200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1220, 1663635600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1221, 1663722000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1222, 1663808400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1223, 1663894800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1224, 1663981200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1225, 1664067600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1226, 1664154000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1227, 1664240400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1228, 1664326800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1229, 1664413200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1230, 1664499600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1231, 1664586000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1232, 1664672400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1233, 1664758800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1234, 1664845200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1235, 1664931600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1236, 1665018000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1237, 1665104400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1238, 1665190800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1239, 1665277200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1240, 1665363600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1241, 1665450000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1242, 1665536400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1243, 1665622800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1244, 1665709200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1245, 1665795600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1246, 1665882000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1247, 1665968400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1248, 1666054800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1249, 1666141200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1250, 1666227600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1251, 1666314000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1252, 1666400400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1253, 1666486800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1254, 1666573200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1255, 1666659600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1256, 1666746000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1257, 1666832400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1258, 1666918800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1259, 1667005200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1260, 1667091600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1261, 1667178000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1262, 1667264400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1263, 1667350800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1264, 1667437200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1265, 1667523600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1266, 1667610000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1267, 1667696400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1268, 1667782800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1269, 1667869200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1270, 1667955600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1271, 1668042000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1272, 1668128400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1273, 1668214800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1274, 1668301200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1275, 1668387600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1276, 1668474000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1277, 1668560400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1278, 1668646800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1279, 1668733200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1280, 1668819600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1281, 1668906000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1282, 1668992400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1283, 1669078800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1284, 1669165200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1285, 1669251600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1286, 1669338000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1287, 1669424400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1288, 1669510800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1289, 1669597200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1290, 1669683600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1291, 1669770000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1292, 1669856400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1293, 1669942800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1294, 1670029200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1295, 1670115600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1296, 1670202000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1297, 1670288400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1298, 1670374800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1299, 1670461200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1300, 1670547600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1301, 1670634000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1302, 1670720400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1303, 1670806800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1304, 1670893200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1305, 1670979600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1306, 1671066000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1307, 1671152400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1308, 1671238800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1309, 1671325200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1310, 1671411600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1311, 1671498000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1312, 1671584400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1313, 1671670800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1314, 1671757200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1315, 1671843600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1316, 1671930000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1317, 1672016400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1318, 1672102800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1319, 1672189200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1320, 1672275600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1321, 1672362000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1322, 1672448400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1323, 1672534800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1324, 1672621200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1325, 1672707600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1326, 1672794000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1327, 1672880400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1328, 1672966800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1329, 1673053200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1330, 1673139600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1331, 1673226000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1332, 1673312400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1333, 1673398800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1334, 1673485200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1335, 1673571600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1336, 1673658000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1337, 1673744400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1338, 1673830800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1339, 1673917200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1340, 1674003600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1341, 1674090000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1342, 1674176400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1343, 1674262800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1344, 1674349200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1345, 1674435600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1346, 1674522000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1347, 1674608400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1348, 1674694800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1349, 1674781200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1350, 1674867600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1351, 1674954000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1352, 1675040400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1353, 1675126800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1354, 1675213200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1355, 1675299600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1356, 1675386000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1357, 1675472400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1358, 1675558800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1359, 1675645200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1360, 1675731600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1361, 1675818000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1362, 1675904400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1363, 1675990800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1364, 1676077200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1365, 1676163600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1366, 1676250000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1367, 1676336400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1368, 1676422800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1369, 1676509200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1370, 1676595600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1371, 1676682000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1372, 1676768400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1373, 1676854800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1374, 1676941200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1375, 1677027600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1376, 1677114000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1377, 1677200400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1378, 1677286800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1379, 1677373200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1380, 1677459600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1381, 1677546000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1382, 1677632400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1383, 1677718800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1384, 1677805200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1385, 1677891600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1386, 1677978000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1387, 1673830800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1388, 1673917200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1389, 1674003600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1390, 1674090000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1391, 1674176400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1392, 1674262800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1393, 1674349200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1394, 1674435600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1395, 1674522000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1396, 1674608400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1397, 1674694800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1398, 1674781200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1399, 1674867600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1400, 1674954000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1401, 1675040400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1402, 1675126800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1403, 1675213200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1404, 1675299600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1405, 1675386000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1406, 1675472400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1407, 1675558800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1408, 1675645200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1409, 1675731600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1410, 1675818000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1411, 1675904400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1412, 1675990800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1413, 1676077200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1414, 1676163600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1415, 1676250000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1416, 1676336400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1417, 1676422800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1418, 1676509200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1419, 1676595600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1420, 1676682000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1421, 1676768400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1422, 1676854800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1423, 1676941200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1424, 1677027600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1425, 1677114000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1426, 1677200400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1427, 1677286800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1428, 1677373200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1429, 1677459600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1430, 1677546000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1431, 1677632400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1432, 1677718800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1433, 1677805200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1434, 1677891600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1435, 1677978000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1436, 1678064400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1437, 1678150800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1438, 1678237200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1439, 1678323600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1440, 1678410000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1441, 1678496400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1442, 1678582800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1443, 1678669200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1444, 1678755600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1445, 1678842000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1446, 1678928400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1447, 1679014800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1448, 1679101200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1449, 1679187600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1450, 1679274000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1451, 1679360400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1452, 1679446800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1453, 1679533200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1454, 1679619600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1455, 1679706000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1456, 1679792400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1457, 1679878800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1458, 1679965200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1459, 1680051600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1460, 1680138000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1461, 1680224400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1462, 1680310800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1463, 1680397200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1464, 1680483600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1465, 1680570000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1466, 1680656400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1467, 1680742800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1468, 1680829200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1469, 1680915600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1470, 1681002000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1471, 1681088400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1472, 1681174800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1473, 1681261200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1474, 1681347600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1475, 1681434000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1476, 1681520400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1477, 1681606800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1478, 1681693200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1479, 1681779600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1480, 1681866000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1481, 1681952400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1482, 1682038800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1483, 1682125200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1484, 1682211600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1485, 1682298000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1486, 1682384400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1487, 1682470800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1488, 1682557200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1489, 1682643600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1490, 1682730000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1491, 1682816400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1492, 1682902800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1493, 1682989200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1494, 1683075600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1495, 1683162000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1496, 1683248400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1497, 1683334800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1498, 1683421200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1499, 1683507600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1500, 1683594000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1501, 1683680400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1502, 1683766800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1503, 1683853200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1504, 1683939600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1505, 1684026000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1506, 1684112400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1507, 1684198800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1508, 1684285200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1509, 1684371600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1510, 1684458000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1511, 1684544400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1512, 1684630800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1513, 1684717200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1514, 1684803600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1515, 1684890000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1516, 1684976400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1517, 1685062800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1518, 1685149200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1519, 1685235600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1520, 1685322000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1521, 1685408400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1522, 1685494800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1523, 1685581200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1524, 1685667600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1525, 1685754000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1526, 1685840400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1527, 1685926800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1528, 1686013200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1529, 1686099600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1530, 1686186000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1531, 1686272400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1532, 1686358800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1533, 1686445200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1534, 1686531600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1535, 1686618000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1536, 1686704400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1537, 1686790800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1538, 1686877200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1539, 1686963600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1540, 1687050000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1541, 1687136400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1542, 1687222800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1543, 1687309200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1544, 1687395600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1545, 1687482000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1546, 1687568400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1547, 1687654800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1548, 1687741200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1549, 1687827600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1550, 1687914000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1551, 1688000400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1552, 1688086800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1553, 1688173200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1554, 1688259600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1555, 1688346000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1556, 1688432400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1557, 1688518800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1558, 1688605200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1559, 1688691600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1560, 1688778000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1561, 1688864400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1562, 1688950800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1563, 1689037200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1564, 1689123600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1565, 1689210000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1566, 1689296400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1567, 1689382800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1568, 1689469200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1569, 1689555600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1570, 1689642000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1571, 1689728400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1572, 1689814800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1573, 1689901200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1574, 1689987600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1575, 1690074000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1576, 1690160400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1577, 1690246800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1578, 1690333200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1579, 1690419600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1580, 1690506000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1581, 1690592400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1582, 1690678800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1583, 1690765200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1584, 1690851600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1585, 1690938000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1586, 1691024400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1587, 1691110800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1588, 1691197200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1589, 1691283600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1590, 1691370000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1591, 1691456400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1592, 1691542800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1593, 1691629200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1594, 1691715600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1595, 1691802000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1596, 1691888400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1597, 1691974800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1598, 1692061200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1599, 1692147600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1600, 1692234000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1601, 1692320400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1602, 1692406800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1603, 1692493200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1604, 1692579600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1605, 1692666000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1606, 1692752400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1607, 1692838800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1608, 1692925200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1609, 1693011600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1610, 1693098000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1611, 1693184400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1612, 1693270800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1613, 1693357200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1614, 1693443600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1615, 1693530000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1616, 1693616400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1617, 1693702800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1618, 1693789200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1619, 1693875600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1620, 1693962000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1621, 1694048400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1622, 1694134800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1623, 1694221200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1624, 1694307600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1625, 1694394000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1626, 1694480400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1627, 1694566800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1628, 1694653200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1629, 1694739600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1630, 1694826000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1631, 1694912400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1632, 1694998800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1633, 1695085200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1634, 1695171600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1635, 1695258000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1636, 1695344400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1637, 1695430800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1638, 1695517200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1639, 1695603600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1640, 1695690000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1641, 1695776400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1642, 1695862800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1643, 1695949200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1644, 1696035600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1645, 1696122000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1646, 1696208400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1647, 1696294800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1648, 1696381200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1649, 1696467600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1650, 1696554000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1651, 1696640400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1652, 1696726800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1653, 1696813200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1654, 1696899600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1655, 1696986000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1656, 1697072400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1657, 1697158800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1658, 1697245200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1659, 1697331600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1660, 1697418000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1661, 1697504400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1662, 1697590800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1663, 1697677200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1664, 1697763600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1665, 1697850000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1666, 1697936400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1667, 1698022800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1668, 1698109200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1669, 1698195600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1670, 1698282000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1671, 1698368400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1672, 1698454800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1673, 1698541200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1674, 1698627600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1675, 1698714000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1676, 1698800400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1677, 1698886800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1678, 1698973200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1679, 1699059600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1680, 1699146000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1681, 1699232400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1682, 1699318800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1683, 1699405200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1684, 1699491600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1685, 1699578000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1686, 1699664400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1687, 1699750800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1688, 1699837200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1689, 1699923600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1690, 1700010000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1691, 1700096400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1692, 1700182800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1693, 1700269200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1694, 1700355600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1695, 1700442000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1696, 1700528400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1697, 1700614800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1698, 1700701200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1699, 1700787600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1700, 1700874000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1701, 1700960400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1702, 1701046800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1703, 1701133200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1704, 1701219600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1705, 1701306000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1706, 1701392400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1707, 1701478800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1708, 1701565200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1709, 1701651600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1710, 1701738000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1711, 1701824400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1712, 1701910800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1713, 1701997200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1714, 1702083600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1715, 1702170000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1716, 1702256400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1717, 1702342800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1718, 1702429200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1719, 1702515600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1720, 1702602000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1721, 1702688400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1722, 1702774800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1723, 1702861200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1724, 1702947600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1725, 1703034000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1726, 1703120400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1727, 1703206800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1728, 1703293200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1729, 1703379600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1730, 1703466000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1731, 1703552400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1732, 1703638800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1733, 1703725200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1734, 1703811600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1735, 1703898000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1736, 1703984400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1737, 1704070800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1738, 1704157200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1739, 1704243600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1740, 1704330000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1741, 1704416400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1742, 1704502800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1743, 1704589200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1744, 1704675600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1745, 1704762000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1746, 1704848400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1747, 1704934800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1748, 1705021200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1749, 1705107600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1750, 1705194000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1751, 1705280400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1752, 1705366800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1753, 1705453200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1754, 1705539600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1755, 1705626000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1756, 1705712400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1757, 1705798800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1758, 1705885200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1759, 1705971600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1760, 1706058000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1761, 1706144400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1762, 1706230800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1763, 1706317200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1764, 1706403600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1765, 1706490000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1766, 1706576400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1767, 1706662800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1768, 1706749200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1769, 1706835600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1770, 1706922000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1771, 1707008400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1772, 1707094800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1773, 1707181200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1774, 1707267600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1775, 1707354000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1776, 1707440400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1777, 1707526800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1778, 1707613200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1779, 1707699600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1780, 1707786000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1781, 1707872400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1782, 1707958800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1783, 1708045200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1784, 1708131600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1785, 1708218000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1786, 1708304400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1787, 1708390800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1788, 1708477200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1789, 1708563600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1790, 1708650000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1791, 1708736400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1792, 1708822800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1793, 1708909200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1794, 1708995600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1795, 1709082000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1796, 1709168400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1797, 1709254800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1798, 1709341200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1799, 1709427600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1800, 1709514000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1801, 1709600400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1802, 1709686800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1803, 1709773200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1804, 1709859600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1805, 1709946000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1806, 1710032400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1807, 1710118800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1808, 1710205200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1809, 1710291600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1810, 1710378000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1811, 1710464400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1812, 1710550800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1813, 1710637200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1814, 1710723600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1815, 1710810000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1816, 1710896400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1817, 1710982800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1818, 1711069200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1819, 1711155600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1820, 1711242000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1821, 1711328400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1822, 1711414800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1823, 1711501200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1824, 1711587600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1825, 1711674000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1826, 1711760400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1827, 1711846800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1828, 1711933200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1829, 1712019600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1830, 1712106000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1831, 1712192400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1832, 1712278800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1833, 1712365200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1834, 1712451600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1835, 1712538000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1836, 1712624400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1837, 1712710800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1838, 1712797200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1839, 1712883600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1840, 1712970000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1841, 1713056400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1842, 1713142800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1843, 1713229200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1844, 1713315600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1845, 1713402000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1846, 1713488400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1847, 1713574800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1848, 1713661200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1849, 1713747600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1850, 1713834000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1851, 1713920400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1852, 1714006800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1853, 1714093200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1854, 1714179600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1855, 1714266000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1856, 1714352400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1857, 1714438800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1858, 1714525200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1859, 1714611600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1860, 1714698000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1861, 1714784400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1862, 1714870800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1863, 1714957200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1864, 1715043600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1865, 1715130000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1866, 1715216400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1867, 1715302800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1868, 1715389200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1869, 1715475600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1870, 1715562000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1871, 1715648400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1872, 1715734800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1873, 1715821200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1874, 1715907600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1875, 1715994000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1876, 1716080400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1877, 1716166800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1878, 1716253200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1879, 1716339600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1880, 1716426000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1881, 1716512400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1882, 1716598800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1883, 1716685200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1884, 1716771600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1885, 1716858000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1886, 1716944400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1887, 1717030800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1888, 1717117200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1889, 1717203600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1890, 1717290000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1891, 1717376400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1892, 1717462800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1893, 1717549200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1894, 1717635600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1895, 1717722000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1896, 1717808400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1897, 1717894800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898, 1717981200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1899, 1718067600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1900, 1718154000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1901, 1718240400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1902, 1718326800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1903, 1718413200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1904, 1718499600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1905, 1718586000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1906, 1718672400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1907, 1718758800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908, 1718845200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1909, 1718931600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910, 1719018000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1911, 1719104400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1912, 1719190800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1913, 1719277200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1914, 1719363600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1915, 1719450000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1916, 1719536400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1917, 1719622800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1918, 1719709200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1919, 1719795600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1920, 1719882000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1921, 1719968400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1922, 1720054800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1923, 1720141200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1924, 1720227600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1925, 1720314000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1926, 1720400400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1927, 1720486800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1928, 1720573200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1929, 1720659600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1930, 1720746000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1931, 1720832400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1932, 1720918800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1933, 1721005200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1934, 1721091600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1935, 1721178000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1936, 1721264400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1937, 1721350800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1938, 1721437200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1939, 1721523600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1940, 1721610000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1941, 1721696400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1942, 1721782800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1943, 1721869200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1944, 1721955600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1945, 1722042000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1946, 1722128400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1947, 1722214800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1948, 1722301200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1949, 1722387600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1950, 1722474000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1951, 1722560400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1952, 1722646800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1953, 1722733200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1954, 1722819600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1955, 1722906000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1956, 1722992400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1957, 1723078800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1958, 1723165200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1959, 1723251600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1960, 1723338000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1961, 1723424400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1962, 1723510800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1963, 1723597200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1964, 1723683600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1965, 1723770000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1966, 1723856400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1967, 1723942800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1968, 1724029200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1969, 1724115600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1970, 1724202000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1971, 1724288400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1972, 1724374800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1973, 1724461200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1974, 1724547600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1975, 1724634000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1976, 1724720400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1977, 1724806800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1978, 1724893200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1979, 1724979600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1980, 1725066000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1981, 1725152400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1982, 1725238800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1983, 1725325200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1984, 1725411600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1985, 1725498000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1986, 1725584400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1987, 1725670800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1988, 1725757200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1989, 1725843600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1990, 1725930000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1991, 1726016400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1992, 1726102800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1993, 1726189200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1994, 1726275600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1995, 1726362000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1996, 1726448400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1997, 1726534800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1998, 1726621200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1999, 1726707600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2000, 1726794000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2001, 1726880400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2002, 1726966800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2003, 1727053200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2004, 1727139600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2005, 1727226000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2006, 1727312400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2007, 1727398800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2008, 1727485200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2009, 1727571600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2010, 1727658000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2011, 1727744400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2012, 1727830800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2013, 1727917200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2014, 1728003600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2015, 1728090000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2016, 1728176400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2017, 1728262800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2018, 1728349200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2019, 1728435600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2020, 1728522000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2021, 1728608400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2022, 1728694800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2023, 1728781200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2024, 1728867600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2025, 1728954000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2026, 1729040400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2027, 1729126800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2028, 1729213200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2029, 1729299600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2030, 1729386000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2031, 1729472400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2032, 1729558800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2033, 1729645200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2034, 1729731600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2035, 1729818000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2036, 1729904400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2037, 1729990800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2038, 1730077200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2039, 1730163600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2040, 1730250000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2041, 1730336400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2042, 1730422800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2043, 1730509200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2044, 1730595600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2045, 1730682000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2046, 1730768400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2047, 1730854800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2048, 1730941200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2049, 1731027600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2050, 1731114000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2051, 1731200400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2052, 1731286800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2053, 1731373200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2054, 1731459600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2055, 1731546000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2056, 1731632400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2057, 1731718800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2058, 1731805200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2059, 1731891600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2060, 1731978000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2061, 1732064400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2062, 1732150800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2063, 1732237200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2064, 1732323600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2065, 1732410000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2066, 1732496400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2067, 1732582800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2068, 1732669200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2069, 1732755600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2070, 1732842000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2071, 1732928400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2072, 1733014800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2073, 1733101200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2074, 1733187600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2075, 1733274000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2076, 1733360400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2077, 1733446800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2078, 1733533200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2079, 1733619600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2080, 1733706000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2081, 1733792400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2082, 1733878800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2083, 1733965200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2084, 1734051600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2085, 1734138000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2086, 1734224400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2087, 1734310800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2088, 1734397200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2089, 1734483600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2090, 1734570000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2091, 1734656400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2092, 1734742800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2093, 1734829200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2094, 1734915600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2095, 1735002000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2096, 1735088400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2097, 1735174800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2098, 1735261200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2099, 1735347600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2100, 1735434000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2101, 1735520400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2102, 1735606800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2103, 1735693200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2104, 1735779600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2105, 1735866000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2106, 1735952400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2107, 1736038800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2108, 1736125200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2109, 1736211600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2110, 1736298000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2111, 1736384400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2112, 1736470800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2113, 1736557200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2114, 1736643600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2115, 1736730000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2116, 1736816400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2117, 1736902800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2118, 1736989200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2119, 1737075600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2120, 1737162000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2121, 1737248400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2122, 1737334800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2123, 1737421200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2124, 1737507600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2125, 1737594000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2126, 1737680400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2127, 1737766800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2128, 1737853200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2129, 1737939600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2130, 1738026000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2131, 1738112400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2132, 1738198800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2133, 1738285200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2134, 1738371600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2135, 1738458000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2136, 1738544400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2137, 1738630800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2138, 1738717200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2139, 1738803600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2140, 1738890000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2141, 1738976400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2142, 1739062800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2143, 1739149200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2144, 1739235600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2145, 1739322000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2146, 1739408400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2147, 1739494800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2148, 1739581200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2149, 1739667600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2150, 1739754000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2151, 1739840400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2152, 1739926800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2153, 1740013200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2154, 1740099600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2155, 1740186000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2156, 1740272400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2157, 1740358800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2158, 1740445200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2159, 1740531600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2160, 1740618000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2161, 1740704400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2162, 1740790800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2163, 1740877200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2164, 1740963600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2165, 1741050000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2166, 1741136400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2167, 1741222800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2168, 1741309200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2169, 1741395600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2170, 1741482000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2171, 1741568400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2172, 1741654800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2173, 1741741200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2174, 1741827600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2175, 1741914000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2176, 1742000400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2177, 1742086800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2178, 1742173200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2179, 1742259600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2180, 1742346000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2181, 1742432400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2182, 1742518800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2183, 1742605200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2184, 1742691600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2185, 1742778000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2186, 1742864400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2187, 1742950800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2188, 1743037200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2189, 1743123600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2190, 1743210000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2191, 1743296400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2192, 1743382800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2193, 1743469200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2194, 1743555600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2195, 1743642000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2196, 1743728400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2197, 1743814800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2198, 1743901200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2199, 1743987600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2200, 1744074000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2201, 1744160400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2202, 1744246800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2203, 1744333200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2204, 1744419600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2205, 1744506000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2206, 1744592400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2207, 1744678800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2208, 1744765200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2209, 1744851600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2210, 1744938000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2211, 1745024400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2212, 1745110800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2213, 1745197200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2214, 1745283600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2215, 1745370000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2216, 1745456400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2217, 1745542800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2218, 1745629200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2219, 1745715600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2220, 1745802000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2221, 1745888400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2222, 1745974800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2223, 1746061200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2224, 1746147600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2225, 1746234000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2226, 1746320400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2227, 1746406800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2228, 1746493200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2229, 1746579600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2230, 1746666000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2231, 1746752400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2232, 1746838800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2233, 1746925200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2234, 1747011600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2235, 1747098000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2236, 1747184400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2237, 1747270800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2238, 1747357200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2239, 1747443600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2240, 1747530000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2241, 1747616400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2242, 1747702800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2243, 1747789200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2244, 1747875600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2245, 1747962000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2246, 1748048400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2247, 1748134800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2248, 1748221200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2249, 1748307600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2250, 1748394000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2251, 1748480400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2252, 1748566800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2253, 1748653200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2254, 1748739600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2255, 1748826000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2256, 1748912400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2257, 1748998800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2258, 1749085200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2259, 1749171600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2260, 1749258000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2261, 1749344400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2262, 1749430800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2263, 1749517200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2264, 1749603600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2265, 1749690000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2266, 1749776400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2267, 1749862800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2268, 1749949200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2269, 1750035600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2270, 1750122000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2271, 1750208400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2272, 1750294800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2273, 1750381200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2274, 1750467600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2275, 1750554000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2276, 1750640400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2277, 1750726800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2278, 1750813200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2279, 1750899600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2280, 1750986000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2281, 1751072400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2282, 1751158800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2283, 1751245200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2284, 1751331600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2285, 1751418000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2286, 1751504400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2287, 1751590800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2288, 1751677200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2289, 1751763600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2290, 1751850000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2291, 1751936400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2292, 1752022800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2293, 1752109200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2294, 1752195600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2295, 1752282000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2296, 1752368400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2297, 1752454800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2298, 1752541200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2299, 1752627600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2300, 1752714000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2301, 1752800400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2302, 1752886800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2303, 1752973200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2304, 1753059600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2305, 1753146000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2306, 1753232400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2307, 1753318800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2308, 1753405200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2309, 1753491600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2310, 1753578000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2311, 1753664400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2312, 1753750800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2313, 1753837200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2314, 1753923600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2315, 1754010000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2316, 1754096400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2317, 1754182800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2318, 1754269200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2319, 1754355600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2320, 1754442000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2321, 1754528400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2322, 1754614800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2323, 1754701200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2324, 1754787600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2325, 1754874000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2326, 1754960400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2327, 1755046800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2328, 1755133200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2329, 1755219600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2330, 1755306000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2331, 1755392400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2332, 1755478800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2333, 1755565200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2334, 1755651600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2335, 1755738000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2336, 1755824400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2337, 1755910800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2338, 1755997200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2339, 1756083600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2340, 1756170000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2341, 1756256400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2342, 1756342800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2343, 1756429200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2344, 1756515600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2345, 1756602000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2346, 1756688400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2347, 1756774800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2348, 1756861200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2349, 1756947600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2350, 1757034000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2351, 1757120400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2352, 1757206800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2353, 1757293200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2354, 1757379600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2355, 1757466000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2356, 1757552400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2357, 1757638800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2358, 1757725200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2359, 1757811600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2360, 1757898000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2361, 1757984400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2362, 1758070800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2363, 1758157200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2364, 1758243600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2365, 1758330000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2366, 1758416400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2367, 1758502800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2368, 1758589200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2369, 1758675600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2370, 1758762000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2371, 1758848400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2372, 1758934800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2373, 1759021200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2374, 1759107600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2375, 1759194000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2376, 1759280400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2377, 1759366800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2378, 1759453200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2379, 1759539600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2380, 1759626000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2381, 1759712400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2382, 1759798800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2383, 1759885200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2384, 1759971600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2385, 1760058000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2386, 1760144400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2387, 1760230800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2388, 1760317200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2389, 1760403600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2390, 1760490000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2391, 1760576400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2392, 1760662800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2393, 1760749200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2394, 1760835600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2395, 1760922000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2396, 1761008400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2397, 1761094800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2398, 1761181200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2399, 1761267600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2400, 1761354000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2401, 1761440400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2402, 1761526800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2403, 1761613200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2404, 1761699600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2405, 1761786000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2406, 1761872400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2407, 1761958800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2408, 1762045200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2409, 1762131600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2410, 1762218000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2411, 1762304400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2412, 1762390800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2413, 1762477200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2414, 1762563600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2415, 1762650000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2416, 1762736400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2417, 1762822800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2418, 1762909200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2419, 1762995600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2420, 1763082000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2421, 1763168400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2422, 1763254800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2423, 1763341200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2424, 1763427600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2425, 1763514000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2426, 1763600400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2427, 1763686800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2428, 1763773200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2429, 1763859600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2430, 1763946000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2431, 1764032400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2432, 1764118800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2433, 1764205200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2434, 1764291600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2435, 1764378000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2436, 1764464400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2437, 1764550800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2438, 1764637200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2439, 1764723600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2440, 1764810000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2441, 1764896400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2442, 1764982800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2443, 1765069200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2444, 1765155600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2445, 1765242000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2446, 1765328400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2447, 1765414800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2448, 1765501200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2449, 1765587600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2450, 1765674000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2451, 1765760400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2452, 1765846800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2453, 1765933200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2454, 1766019600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2455, 1766106000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2456, 1766192400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2457, 1766278800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2458, 1766365200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2459, 1766451600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2460, 1766538000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2461, 1766624400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2462, 1766710800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2463, 1766797200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2464, 1766883600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2465, 1766970000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2466, 1767056400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2467, 1767142800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2468, 1767229200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2469, 1767315600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2470, 1767402000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2471, 1767488400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2472, 1767574800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2473, 1767661200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2474, 1767747600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2475, 1767834000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2476, 1767920400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2477, 1768006800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2478, 1768093200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2479, 1768179600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2480, 1768266000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2481, 1768352400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2482, 1768438800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2483, 1768525200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2484, 1768611600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2485, 1768698000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2486, 1768784400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2487, 1768870800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2488, 1768957200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2489, 1769043600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2490, 1769130000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2491, 1769216400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2492, 1769302800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2493, 1769389200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2494, 1769475600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2495, 1769562000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2496, 1769648400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2497, 1769734800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2498, 1769821200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2499, 1769907600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2500, 1769994000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2501, 1770080400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2502, 1770166800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2503, 1770253200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2504, 1770339600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2505, 1770426000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2506, 1770512400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2507, 1770598800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2508, 1770685200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2509, 1770771600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2510, 1770858000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2511, 1770944400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2512, 1771030800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2513, 1771117200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2514, 1771203600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2515, 1771290000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2516, 1771376400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2517, 1771462800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2518, 1771549200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2519, 1771635600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2520, 1771722000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2521, 1771808400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2522, 1771894800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2523, 1771981200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2524, 1772067600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2525, 1772154000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2526, 1772240400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2527, 1772326800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2528, 1772413200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2529, 1772499600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2530, 1772586000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2531, 1772672400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2532, 1772758800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2533, 1772845200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2534, 1772931600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2535, 1773018000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2536, 1773104400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2537, 1773190800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2538, 1773277200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2539, 1773363600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2540, 1773450000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2541, 1773536400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2542, 1773622800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2543, 1773709200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2544, 1773795600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2545, 1773882000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2546, 1773968400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2547, 1774054800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2548, 1774141200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2549, 1774227600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2550, 1774314000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2551, 1774400400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2552, 1774486800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2553, 1774573200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2554, 1774659600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2555, 1774746000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2556, 1774832400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2557, 1774918800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2558, 1775005200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2559, 1775091600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2560, 1775178000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2561, 1775264400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2562, 1775350800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2563, 1775437200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2564, 1775523600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2565, 1775610000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2566, 1775696400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2567, 1775782800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2568, 1775869200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2569, 1775955600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2570, 1776042000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2571, 1776128400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2572, 1776214800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2573, 1776301200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2574, 1776387600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2575, 1776474000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2576, 1776560400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2577, 1776646800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2578, 1776733200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2579, 1776819600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2580, 1776906000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2581, 1776992400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2582, 1777078800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2583, 1777165200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2584, 1777251600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2585, 1777338000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2586, 1777424400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2587, 1777510800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2588, 1777597200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2589, 1777683600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2590, 1777770000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2591, 1777856400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2592, 1777942800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2593, 1778029200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2594, 1778115600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2595, 1778202000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2596, 1778288400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2597, 1778374800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2598, 1778461200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2599, 1778547600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2600, 1778634000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2601, 1778720400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2602, 1778806800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2603, 1778893200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2604, 1778979600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2605, 1779066000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2606, 1779152400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2607, 1779238800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2608, 1779325200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2609, 1779411600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2610, 1779498000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2611, 1779584400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2612, 1779670800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2613, 1779757200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2614, 1779843600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2615, 1779930000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2616, 1780016400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2617, 1780102800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2618, 1780189200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2619, 1780275600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2620, 1780362000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2621, 1780448400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2622, 1780534800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2623, 1780621200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2624, 1780707600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2625, 1780794000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2626, 1780880400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2627, 1780966800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2628, 1781053200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2629, 1781139600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2630, 1781226000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2631, 1781312400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2632, 1781398800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2633, 1781485200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2634, 1781571600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2635, 1781658000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2636, 1781744400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2637, 1781830800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2638, 1781917200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2639, 1782003600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2640, 1782090000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2641, 1782176400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2642, 1782262800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2643, 1782349200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2644, 1782435600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2645, 1782522000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2646, 1782608400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2647, 1782694800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2648, 1782781200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2649, 1782867600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2650, 1782954000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2651, 1783040400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2652, 1783126800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2653, 1783213200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2654, 1783299600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2655, 1783386000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2656, 1783472400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2657, 1783558800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2658, 1783645200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2659, 1783731600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2660, 1783818000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2661, 1783904400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2662, 1783990800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2663, 1784077200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2664, 1784163600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2665, 1784250000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2666, 1784336400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2667, 1784422800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2668, 1784509200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2669, 1784595600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2670, 1784682000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2671, 1784768400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2672, 1784854800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2673, 1784941200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2674, 1785027600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2675, 1785114000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2676, 1785200400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2677, 1785286800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2678, 1785373200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2679, 1785459600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2680, 1785546000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2681, 1785632400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2682, 1785718800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2683, 1785805200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2684, 1785891600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2685, 1785978000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2686, 1786064400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2687, 1786150800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2688, 1786237200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2689, 1786323600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2690, 1786410000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2691, 1786496400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2692, 1786582800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2693, 1786669200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2694, 1786755600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2695, 1786842000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2696, 1786928400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2697, 1787014800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2698, 1787101200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2699, 1787187600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2700, 1787274000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2701, 1787360400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2702, 1787446800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2703, 1787533200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2704, 1787619600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2705, 1787706000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2706, 1787792400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2707, 1787878800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2708, 1787965200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2709, 1788051600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2710, 1788138000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2711, 1788224400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2712, 1788310800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2713, 1788397200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2714, 1788483600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2715, 1788570000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2716, 1788656400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2717, 1788742800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2718, 1788829200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2719, 1788915600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2720, 1789002000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2721, 1789088400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2722, 1789174800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2723, 1789261200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2724, 1789347600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2725, 1789434000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2726, 1789520400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2727, 1789606800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2728, 1789693200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2729, 1789779600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2730, 1789866000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2731, 1789952400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2732, 1790038800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2733, 1790125200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2734, 1790211600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2735, 1790298000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2736, 1790384400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2737, 1790470800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2738, 1790557200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2739, 1790643600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2740, 1790730000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2741, 1790816400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2742, 1790902800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2743, 1790989200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2744, 1791075600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2745, 1791162000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2746, 1791248400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2747, 1791334800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2748, 1791421200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2749, 1791507600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2750, 1791594000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2751, 1791680400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2752, 1791766800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2753, 1791853200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2754, 1791939600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2755, 1792026000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2756, 1792112400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2757, 1792198800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2758, 1792285200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2759, 1792371600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2760, 1792458000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2761, 1792544400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2762, 1792630800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2763, 1792717200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2764, 1792803600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2765, 1792890000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2766, 1792976400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2767, 1793062800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2768, 1793149200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2769, 1793235600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2770, 1793322000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2771, 1793408400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2772, 1793494800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2773, 1793581200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2774, 1793667600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2775, 1793754000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2776, 1793840400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2777, 1793926800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2778, 1794013200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2779, 1794099600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2780, 1794186000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2781, 1794272400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2782, 1794358800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2783, 1794445200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2784, 1794531600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2785, 1794618000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2786, 1794704400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2787, 1794790800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2788, 1794877200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2789, 1794963600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2790, 1795050000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2791, 1795136400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2792, 1795222800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2793, 1795309200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2794, 1795395600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2795, 1795482000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2796, 1795568400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2797, 1795654800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2798, 1795741200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2799, 1795827600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2800, 1795914000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2801, 1796000400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2802, 1796086800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2803, 1796173200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2804, 1796259600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2805, 1796346000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2806, 1796432400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2807, 1796518800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2808, 1796605200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2809, 1796691600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2810, 1796778000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2811, 1796864400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2812, 1796950800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2813, 1797037200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2814, 1797123600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2815, 1797210000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2816, 1797296400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2817, 1797382800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2818, 1797469200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2819, 1797555600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2820, 1797642000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2821, 1797728400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2822, 1797814800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2823, 1797901200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2824, 1797987600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2825, 1798074000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2826, 1798160400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2827, 1798246800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2828, 1798333200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2829, 1798419600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2830, 1798506000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2831, 1798592400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2832, 1798678800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2833, 1798765200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2834, 1798851600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2835, 1798938000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2836, 1799024400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2837, 1799110800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2838, 1799197200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2839, 1799283600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2840, 1799370000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2841, 1799456400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2842, 1799542800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2843, 1799629200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2844, 1799715600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2845, 1799802000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2846, 1799888400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2847, 1799974800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2848, 1800061200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2849, 1800147600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2850, 1800234000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2851, 1800320400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2852, 1800406800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2853, 1800493200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2854, 1800579600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2855, 1800666000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2856, 1800752400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2857, 1800838800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2858, 1800925200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2859, 1801011600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2860, 1801098000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2861, 1801184400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2862, 1801270800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2863, 1801357200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2864, 1801443600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2865, 1801530000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2866, 1801616400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2867, 1801702800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2868, 1801789200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2869, 1801875600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2870, 1801962000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2871, 1802048400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2872, 1802134800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2873, 1802221200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2874, 1802307600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2875, 1802394000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2876, 1802480400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2877, 1802566800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2878, 1802653200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2879, 1802739600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2880, 1802826000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2881, 1802912400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2882, 1802998800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2883, 1803085200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2884, 1803171600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2885, 1803258000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2886, 1803344400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2887, 1803430800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2888, 1803517200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2889, 1803603600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2890, 1803690000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2891, 1803776400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2892, 1803862800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2893, 1803949200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2894, 1804035600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2895, 1804122000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2896, 1804208400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2897, 1804294800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2898, 1804381200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2899, 1804467600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2900, 1804554000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2901, 1804640400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2902, 1804726800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2903, 1804813200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2904, 1804899600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2905, 1804986000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2906, 1805072400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2907, 1805158800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2908, 1805245200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2909, 1805331600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2910, 1805418000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2911, 1805504400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2912, 1805590800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2913, 1805677200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2914, 1805763600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2915, 1805850000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2916, 1805936400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2917, 1806022800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2918, 1806109200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2919, 1806195600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2920, 1806282000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2921, 1806368400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2922, 1806454800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2923, 1806541200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2924, 1806627600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2925, 1806714000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2926, 1806800400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2927, 1806886800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2928, 1806973200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2929, 1807059600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2930, 1807146000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2931, 1807232400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2932, 1807318800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2933, 1807405200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2934, 1807491600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2935, 1807578000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2936, 1807664400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2937, 1807750800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2938, 1807837200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2939, 1807923600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2940, 1808010000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2941, 1808096400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2942, 1808182800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2943, 1808269200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2944, 1808355600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2945, 1808442000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2946, 1808528400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2947, 1808614800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2948, 1808701200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2949, 1808787600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2950, 1808874000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2951, 1808960400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2952, 1809046800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2953, 1809133200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2954, 1809219600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2955, 1809306000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2956, 1809392400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2957, 1809478800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2958, 1809565200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2959, 1809651600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2960, 1809738000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2961, 1809824400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2962, 1809910800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2963, 1809997200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2964, 1810083600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2965, 1810170000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2966, 1810256400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2967, 1810342800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2968, 1810429200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2969, 1810515600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2970, 1810602000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2971, 1810688400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2972, 1810774800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2973, 1810861200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2974, 1810947600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2975, 1811034000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2976, 1811120400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2977, 1811206800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2978, 1811293200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2979, 1811379600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2980, 1811466000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2981, 1811552400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2982, 1811638800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2983, 1811725200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2984, 1811811600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2985, 1811898000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2986, 1811984400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2987, 1812070800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2988, 1812157200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2989, 1812243600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2990, 1812330000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2991, 1812416400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2992, 1812502800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2993, 1812589200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2994, 1812675600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2995, 1812762000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2996, 1812848400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2997, 1812934800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2998, 1813021200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2999, 1813107600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3000, 1813194000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3001, 1813280400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3002, 1813366800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3003, 1813453200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3004, 1813539600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3005, 1813626000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3006, 1813712400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3007, 1813798800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3008, 1813885200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3009, 1813971600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3010, 1814058000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3011, 1814144400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3012, 1814230800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3013, 1814317200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3014, 1814403600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3015, 1814490000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3016, 1814576400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3017, 1814662800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3018, 1814749200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3019, 1814835600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3020, 1814922000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3021, 1815008400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3022, 1815094800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3023, 1815181200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3024, 1815267600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3025, 1815354000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3026, 1815440400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3027, 1815526800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3028, 1815613200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3029, 1815699600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3030, 1815786000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3031, 1815872400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3032, 1815958800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3033, 1816045200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3034, 1816131600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3035, 1816218000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3036, 1816304400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3037, 1816390800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3038, 1816477200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3039, 1816563600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3040, 1816650000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3041, 1816736400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3042, 1816822800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3043, 1816909200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3044, 1816995600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3045, 1817082000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3046, 1817168400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3047, 1817254800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3048, 1817341200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3049, 1817427600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3050, 1817514000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3051, 1817600400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3052, 1817686800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3053, 1817773200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3054, 1817859600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3055, 1817946000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3056, 1818032400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3057, 1818118800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3058, 1818205200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3059, 1818291600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3060, 1818378000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3061, 1818464400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3062, 1818550800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3063, 1818637200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3064, 1818723600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3065, 1818810000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3066, 1818896400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3067, 1818982800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3068, 1819069200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3069, 1819155600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3070, 1819242000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3071, 1819328400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3072, 1819414800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3073, 1819501200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3074, 1819587600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3075, 1819674000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3076, 1819760400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3077, 1819846800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3078, 1819933200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3079, 1820019600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3080, 1820106000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3081, 1820192400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3082, 1820278800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3083, 1820365200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3084, 1820451600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3085, 1820538000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3086, 1820624400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3087, 1820710800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3088, 1820797200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3089, 1820883600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3090, 1820970000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3091, 1821056400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3092, 1821142800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3093, 1821229200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3094, 1821315600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3095, 1821402000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3096, 1821488400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3097, 1821574800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3098, 1821661200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3099, 1821747600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3100, 1821834000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3101, 1821920400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3102, 1822006800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3103, 1822093200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3104, 1822179600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3105, 1822266000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3106, 1822352400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3107, 1822438800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3108, 1822525200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3109, 1822611600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3110, 1822698000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3111, 1822784400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3112, 1822870800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3113, 1822957200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3114, 1823043600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3115, 1823130000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3116, 1823216400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3117, 1823302800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3118, 1823389200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3119, 1823475600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3120, 1823562000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3121, 1823648400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3122, 1823734800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3123, 1823821200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3124, 1823907600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3125, 1823994000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3126, 1824080400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3127, 1824166800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3128, 1824253200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3129, 1824339600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3130, 1824426000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3131, 1824512400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3132, 1824598800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3133, 1824685200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3134, 1824771600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3135, 1824858000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3136, 1824944400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3137, 1825030800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3138, 1825117200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3139, 1825203600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3140, 1825290000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3141, 1825376400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3142, 1825462800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3143, 1825549200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3144, 1825635600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3145, 1825722000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3146, 1825808400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3147, 1825894800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3148, 1825981200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3149, 1826067600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3150, 1826154000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3151, 1826240400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3152, 1826326800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3153, 1826413200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3154, 1826499600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3155, 1826586000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3156, 1826672400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3157, 1826758800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3158, 1826845200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3159, 1826931600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3160, 1827018000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3161, 1827104400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3162, 1827190800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3163, 1827277200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3164, 1827363600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3165, 1827450000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3166, 1827536400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3167, 1827622800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3168, 1827709200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3169, 1827795600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3170, 1827882000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3171, 1827968400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3172, 1828054800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3173, 1828141200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3174, 1828227600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3175, 1828314000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3176, 1828400400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3177, 1828486800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3178, 1828573200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3179, 1828659600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3180, 1828746000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3181, 1828832400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3182, 1828918800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3183, 1829005200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3184, 1829091600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3185, 1829178000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3186, 1829264400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3187, 1829350800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3188, 1829437200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3189, 1829523600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3190, 1829610000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3191, 1829696400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3192, 1829782800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3193, 1829869200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3194, 1829955600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3195, 1830042000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3196, 1830128400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3197, 1830214800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3198, 1830301200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3199, 1830387600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3200, 1830474000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3201, 1830560400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3202, 1830646800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3203, 1830733200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3204, 1830819600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3205, 1830906000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3206, 1830992400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3207, 1831078800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3208, 1831165200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3209, 1831251600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3210, 1831338000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3211, 1831424400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3212, 1831510800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3213, 1831597200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3214, 1831683600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3215, 1831770000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3216, 1831856400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3217, 1831942800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3218, 1832029200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3219, 1832115600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3220, 1832202000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3221, 1832288400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3222, 1832374800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3223, 1832461200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3224, 1832547600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3225, 1832634000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3226, 1832720400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3227, 1832806800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3228, 1832893200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3229, 1832979600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3230, 1833066000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3231, 1833152400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3232, 1833238800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3233, 1833325200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3234, 1833411600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3235, 1833498000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3236, 1833584400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3237, 1833670800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3238, 1833757200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3239, 1833843600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3240, 1833930000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3241, 1834016400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3242, 1834102800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3243, 1834189200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3244, 1834275600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3245, 1834362000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3246, 1834448400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3247, 1834534800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3248, 1834621200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3249, 1834707600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3250, 1834794000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3251, 1834880400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3252, 1834966800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3253, 1835053200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3254, 1835139600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3255, 1835226000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3256, 1835312400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3257, 1835398800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3258, 1835485200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3259, 1835571600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3260, 1835658000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3261, 1835744400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3262, 1835830800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3263, 1835917200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3264, 1836003600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3265, 1836090000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3266, 1836176400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3267, 1836262800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3268, 1836349200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3269, 1836435600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3270, 1836522000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3271, 1836608400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3272, 1836694800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3273, 1836781200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3274, 1836867600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3275, 1836954000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3276, 1837040400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3277, 1837126800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3278, 1837213200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3279, 1837299600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3280, 1837386000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3281, 1837472400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3282, 1837558800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3283, 1837645200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3284, 1837731600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3285, 1837818000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3286, 1837904400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3287, 1837990800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3288, 1838077200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3289, 1838163600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3290, 1838250000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3291, 1838336400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3292, 1838422800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3293, 1838509200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3294, 1838595600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3295, 1838682000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3296, 1838768400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3297, 1838854800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3298, 1838941200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3299, 1839027600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3300, 1839114000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3301, 1839200400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3302, 1839286800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3303, 1839373200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3304, 1839459600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3305, 1839546000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3306, 1839632400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3307, 1839718800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3308, 1839805200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3309, 1839891600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3310, 1839978000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3311, 1840064400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3312, 1840150800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3313, 1840237200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3314, 1840323600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3315, 1840410000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3316, 1840496400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3317, 1840582800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3318, 1840669200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3319, 1840755600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3320, 1840842000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3321, 1840928400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3322, 1841014800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3323, 1841101200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3324, 1841187600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3325, 1841274000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3326, 1841360400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3327, 1841446800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3328, 1841533200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3329, 1841619600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3330, 1841706000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3331, 1841792400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3332, 1841878800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3333, 1841965200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3334, 1842051600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3335, 1842138000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3336, 1842224400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3337, 1842310800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3338, 1842397200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3339, 1842483600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3340, 1842570000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3341, 1842656400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3342, 1842742800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3343, 1842829200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3344, 1842915600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3345, 1843002000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3346, 1843088400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3347, 1843174800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3348, 1843261200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3349, 1843347600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3350, 1843434000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3351, 1843520400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3352, 1843606800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3353, 1843693200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3354, 1843779600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3355, 1843866000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3356, 1843952400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3357, 1844038800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3358, 1844125200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3359, 1844211600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3360, 1844298000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3361, 1844384400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3362, 1844470800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3363, 1844557200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3364, 1844643600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3365, 1844730000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3366, 1844816400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3367, 1844902800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3368, 1844989200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3369, 1845075600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3370, 1845162000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3371, 1845248400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3372, 1845334800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3373, 1845421200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3374, 1845507600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3375, 1845594000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3376, 1845680400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3377, 1845766800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3378, 1845853200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3379, 1845939600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3380, 1846026000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3381, 1846112400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3382, 1846198800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3383, 1846285200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3384, 1846371600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3385, 1846458000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3386, 1846544400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3387, 1846630800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3388, 1846717200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3389, 1846803600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3390, 1846890000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3391, 1846976400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3392, 1847062800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3393, 1847149200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3394, 1847235600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3395, 1847322000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3396, 1847408400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3397, 1847494800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3398, 1847581200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3399, 1847667600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3400, 1847754000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3401, 1847840400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3402, 1847926800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3403, 1848013200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3404, 1848099600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3405, 1848186000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3406, 1848272400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3407, 1848358800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3408, 1848445200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3409, 1848531600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3410, 1848618000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3411, 1848704400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3412, 1848790800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3413, 1848877200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3414, 1848963600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3415, 1849050000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3416, 1849136400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3417, 1849222800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3418, 1849309200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3419, 1849395600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3420, 1849482000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3421, 1849568400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3422, 1849654800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3423, 1849741200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3424, 1849827600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3425, 1849914000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3426, 1850000400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3427, 1850086800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3428, 1850173200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3429, 1850259600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3430, 1850346000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3431, 1850432400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3432, 1850518800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3433, 1850605200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3434, 1850691600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3435, 1850778000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3436, 1850864400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3437, 1850950800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3438, 1851037200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3439, 1851123600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3440, 1851210000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3441, 1851296400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3442, 1851382800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3443, 1851469200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3444, 1851555600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3445, 1851642000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3446, 1851728400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3447, 1851814800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3448, 1851901200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3449, 1851987600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3450, 1852074000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3451, 1852160400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3452, 1852246800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3453, 1852333200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3454, 1852419600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3455, 1852506000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3456, 1852592400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3457, 1852678800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3458, 1852765200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3459, 1852851600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3460, 1852938000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3461, 1853024400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3462, 1853110800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3463, 1853197200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3464, 1853283600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3465, 1853370000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3466, 1853456400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3467, 1853542800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3468, 1853629200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3469, 1853715600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3470, 1853802000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3471, 1853888400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3472, 1853974800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3473, 1854061200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3474, 1854147600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3475, 1854234000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3476, 1854320400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3477, 1854406800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3478, 1854493200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3479, 1854579600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3480, 1854666000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3481, 1854752400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3482, 1854838800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3483, 1854925200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3484, 1855011600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3485, 1855098000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3486, 1855184400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3487, 1855270800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3488, 1855357200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3489, 1855443600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3490, 1855530000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3491, 1855616400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3492, 1855702800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3493, 1855789200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3494, 1855875600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3495, 1855962000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3496, 1856048400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3497, 1856134800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3498, 1856221200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3499, 1856307600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3500, 1856394000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3501, 1856480400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3502, 1856566800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3503, 1856653200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3504, 1856739600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3505, 1856826000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3506, 1856912400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3507, 1856998800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3508, 1857085200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3509, 1857171600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3510, 1857258000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3511, 1857344400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3512, 1857430800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3513, 1857517200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3514, 1857603600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3515, 1857690000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3516, 1857776400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3517, 1857862800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3518, 1857949200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3519, 1858035600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3520, 1858122000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3521, 1858208400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3522, 1858294800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3523, 1858381200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3524, 1858467600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3525, 1858554000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3526, 1858640400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3527, 1858726800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3528, 1858813200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3529, 1858899600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3530, 1858986000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3531, 1859072400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3532, 1859158800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3533, 1859245200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3534, 1859331600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3535, 1859418000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3536, 1859504400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3537, 1859590800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3538, 1859677200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3539, 1859763600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3540, 1859850000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3541, 1859936400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3542, 1860022800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3543, 1860109200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3544, 1860195600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3545, 1860282000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3546, 1860368400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3547, 1860454800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3548, 1860541200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3549, 1860627600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3550, 1860714000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3551, 1860800400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3552, 1860886800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3553, 1860973200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3554, 1861059600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3555, 1861146000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3556, 1861232400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3557, 1861318800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3558, 1861405200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3559, 1861491600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3560, 1861578000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3561, 1861664400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3562, 1861750800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3563, 1861837200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3564, 1861923600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3565, 1862010000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3566, 1862096400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3567, 1862182800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3568, 1862269200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3569, 1862355600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3570, 1862442000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3571, 1862528400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3572, 1862614800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3573, 1862701200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3574, 1862787600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3575, 1862874000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3576, 1862960400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3577, 1863046800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3578, 1863133200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3579, 1863219600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3580, 1863306000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3581, 1863392400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3582, 1863478800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3583, 1863565200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3584, 1863651600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3585, 1863738000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3586, 1863824400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3587, 1863910800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3588, 1863997200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3589, 1864083600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3590, 1864170000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3591, 1864256400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3592, 1864342800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3593, 1864429200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3594, 1864515600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3595, 1864602000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3596, 1864688400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3597, 1864774800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3598, 1864861200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3599, 1864947600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3600, 1865034000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3601, 1865120400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3602, 1865206800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3603, 1865293200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3604, 1865379600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3605, 1865466000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3606, 1865552400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3607, 1865638800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3608, 1865725200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3609, 1865811600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3610, 1865898000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3611, 1865984400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3612, 1866070800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3613, 1866157200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3614, 1866243600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3615, 1866330000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3616, 1866416400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3617, 1866502800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3618, 1866589200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3619, 1866675600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3620, 1866762000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3621, 1866848400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3622, 1866934800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3623, 1867021200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3624, 1867107600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3625, 1867194000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3626, 1867280400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3627, 1867366800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3628, 1867453200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3629, 1867539600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3630, 1867626000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3631, 1867712400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3632, 1867798800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3633, 1867885200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3634, 1867971600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3635, 1868058000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3636, 1868144400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3637, 1868230800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3638, 1868317200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3639, 1868403600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3640, 1868490000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3641, 1868576400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3642, 1868662800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3643, 1868749200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3644, 1868835600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3645, 1868922000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3646, 1869008400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3647, 1869094800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3648, 1869181200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3649, 1869267600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3650, 1869354000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3651, 1869440400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3652, 1869526800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3653, 1869613200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3654, 1869699600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3655, 1869786000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3656, 1869872400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3657, 1869958800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3658, 1870045200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3659, 1870131600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3660, 1870218000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3661, 1870304400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3662, 1870390800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3663, 1870477200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3664, 1870563600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3665, 1870650000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3666, 1870736400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3667, 1870822800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3668, 1870909200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3669, 1870995600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3670, 1871082000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3671, 1871168400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3672, 1871254800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3673, 1871341200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3674, 1871427600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3675, 1871514000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3676, 1871600400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3677, 1871686800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3678, 1871773200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3679, 1871859600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3680, 1871946000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3681, 1872032400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3682, 1872118800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3683, 1872205200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3684, 1872291600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3685, 1872378000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3686, 1872464400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3687, 1872550800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3688, 1872637200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3689, 1872723600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3690, 1872810000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3691, 1872896400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3692, 1872982800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3693, 1873069200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3694, 1873155600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3695, 1873242000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3696, 1873328400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3697, 1873414800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3698, 1873501200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3699, 1873587600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3700, 1873674000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3701, 1873760400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3702, 1873846800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3703, 1873933200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3704, 1874019600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3705, 1874106000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3706, 1874192400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3707, 1874278800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3708, 1874365200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3709, 1874451600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3710, 1874538000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3711, 1874624400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3712, 1874710800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3713, 1874797200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3714, 1874883600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3715, 1874970000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3716, 1875056400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3717, 1875142800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3718, 1875229200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3719, 1875315600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3720, 1875402000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3721, 1875488400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3722, 1875574800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3723, 1875661200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3724, 1875747600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3725, 1875834000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3726, 1875920400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3727, 1876006800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3728, 1876093200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3729, 1876179600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3730, 1876266000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3731, 1876352400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3732, 1876438800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3733, 1876525200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3734, 1876611600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3735, 1876698000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3736, 1876784400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3737, 1876870800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3738, 1876957200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3739, 1877043600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3740, 1877130000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3741, 1877216400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3742, 1877302800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3743, 1877389200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3744, 1877475600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3745, 1877562000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3746, 1877648400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3747, 1877734800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3748, 1877821200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3749, 1877907600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3750, 1877994000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3751, 1878080400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3752, 1878166800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3753, 1878253200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3754, 1878339600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3755, 1878426000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3756, 1878512400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3757, 1878598800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3758, 1878685200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3759, 1878771600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3760, 1878858000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3761, 1878944400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3762, 1879030800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3763, 1879117200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3764, 1879203600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3765, 1879290000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3766, 1879376400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3767, 1879462800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3768, 1879549200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3769, 1879635600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3770, 1879722000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3771, 1879808400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3772, 1879894800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3773, 1879981200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3774, 1880067600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3775, 1880154000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3776, 1880240400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3777, 1880326800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3778, 1880413200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3779, 1880499600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3780, 1880586000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3781, 1880672400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3782, 1880758800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3783, 1880845200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3784, 1880931600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3785, 1881018000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3786, 1881104400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3787, 1881190800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3788, 1881277200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3789, 1881363600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3790, 1881450000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3791, 1881536400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3792, 1881622800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3793, 1881709200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3794, 1881795600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3795, 1881882000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3796, 1881968400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3797, 1882054800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3798, 1882141200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3799, 1882227600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3800, 1882314000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3801, 1882400400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3802, 1882486800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3803, 1882573200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3804, 1882659600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3805, 1882746000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3806, 1882832400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3807, 1882918800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3808, 1883005200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3809, 1883091600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3810, 1883178000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3811, 1883264400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3812, 1883350800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3813, 1883437200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3814, 1883523600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3815, 1883610000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3816, 1883696400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3817, 1883782800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3818, 1883869200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3819, 1883955600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3820, 1884042000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3821, 1884128400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3822, 1884214800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3823, 1884301200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3824, 1884387600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3825, 1884474000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3826, 1884560400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3827, 1884646800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3828, 1884733200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3829, 1884819600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3830, 1884906000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3831, 1884992400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3832, 1885078800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3833, 1885165200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3834, 1885251600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3835, 1885338000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3836, 1885424400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3837, 1885510800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3838, 1885597200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3839, 1885683600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3840, 1885770000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3841, 1885856400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3842, 1885942800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3843, 1886029200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3844, 1886115600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3845, 1886202000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3846, 1886288400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3847, 1886374800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3848, 1886461200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3849, 1886547600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3850, 1886634000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3851, 1886720400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3852, 1886806800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3853, 1886893200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3854, 1886979600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3855, 1887066000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3856, 1887152400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3857, 1887238800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3858, 1887325200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3859, 1887411600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3860, 1887498000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3861, 1887584400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3862, 1887670800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3863, 1887757200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3864, 1887843600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3865, 1887930000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3866, 1888016400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3867, 1888102800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3868, 1888189200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3869, 1888275600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3870, 1888362000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3871, 1888448400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3872, 1888534800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3873, 1888621200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3874, 1888707600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3875, 1888794000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3876, 1888880400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3877, 1888966800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3878, 1889053200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3879, 1889139600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3880, 1889226000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3881, 1889312400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3882, 1889398800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3883, 1889485200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3884, 1889571600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3885, 1889658000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3886, 1889744400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3887, 1889830800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3888, 1889917200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3889, 1890003600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3890, 1890090000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3891, 1890176400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3892, 1890262800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3893, 1890349200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3894, 1890435600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3895, 1890522000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3896, 1890608400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3897, 1890694800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3898, 1890781200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3899, 1890867600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3900, 1890954000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3901, 1891040400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3902, 1891126800, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3903, 1891213200, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3904, 1891299600, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3905, 1891386000, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3906, 1891472400, NULL, NULL, NULL, '银洋', '13998131582', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3907, 1891558800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3908, 1891645200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3909, 1891731600, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3910, 1891818000, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3911, 1891904400, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3912, 1891990800, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3913, 1892077200, NULL, NULL, NULL, '王跃达', '18802432218', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3914, 1892163600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3915, 1892250000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3916, 1892336400, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3917, 1892422800, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3918, 1892509200, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3919, 1892595600, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3920, 1892682000, NULL, NULL, NULL, '郭子龙', '15041289974', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3921, 1892768400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3922, 1892854800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3923, 1892941200, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3924, 1893027600, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3925, 1893114000, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3926, 1893200400, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3927, 1893286800, NULL, NULL, NULL, '陈明星', '15040096272', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3928, 1893373200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3929, 1893459600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3930, 1893546000, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3931, 1893632400, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3932, 1893718800, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3933, 1893805200, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3934, 1893891600, NULL, NULL, NULL, '王书宇', '15904064360', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3935, 1893978000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3936, 1894064400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3937, 1894150800, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3938, 1894237200, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3939, 1894323600, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3940, 1894410000, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3941, 1894496400, NULL, NULL, NULL, '佟金龙', '18802488607', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3942, 1894582800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3943, 1894669200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3944, 1894755600, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3945, 1894842000, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3946, 1894928400, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3947, 1895014800, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
INSERT INTO `h_duty` (`id`, `date`, `day`, `night`, `adjust`, `core`, `core_phone`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3948, 1895101200, NULL, NULL, NULL, '刘永飞', '15998304166', 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_env
-- ----------------------------
DROP TABLE IF EXISTS `h_env`;
CREATE TABLE `h_env` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `db_type` varchar(256) DEFAULT NULL COMMENT '数据库类型',
  `db_host` varchar(256) DEFAULT NULL COMMENT '数据库主机',
  `db_port` varchar(256) DEFAULT NULL COMMENT '数据库端口',
  `db_serv_type` varchar(256) DEFAULT NULL COMMENT '数据库连接类型(0-SID,1-SERVICE)',
  `db_serv_name` varchar(256) DEFAULT NULL COMMENT '数据库连接名称',
  `db_name` varchar(256) DEFAULT NULL COMMENT '数据库名称',
  `db_user` varchar(256) DEFAULT NULL COMMENT '数据库用户名',
  `db_password` varchar(256) DEFAULT NULL COMMENT '数据库密码',
  `app_address` varchar(256) DEFAULT NULL COMMENT '应用地址',
  `esb_address` varchar(256) DEFAULT NULL COMMENT 'ESB地址',
  `counter_address` varchar(256) DEFAULT NULL COMMENT '柜面地址',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(512) DEFAULT NULL COMMENT '使用人',
  `user_project` varchar(512) DEFAULT NULL COMMENT '使用项目',
  `use_from` bigint DEFAULT NULL COMMENT '使用开始时间',
  `use_to` bigint DEFAULT NULL COMMENT '使用结束时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='测试环境';

-- ----------------------------
-- Records of h_env
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_environment
-- ----------------------------
DROP TABLE IF EXISTS `h_environment`;
CREATE TABLE `h_environment` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `db_type` varchar(30) DEFAULT NULL COMMENT '数据库类型',
  `db_host` varchar(30) DEFAULT NULL COMMENT '数据库主机',
  `db_port` varchar(30) DEFAULT NULL COMMENT '数据库端口',
  `db_serv_type` varchar(30) DEFAULT NULL COMMENT '数据库连接类型(0-SID,1-SERVICE)',
  `db_serv_name` varchar(30) DEFAULT NULL COMMENT '数据库连接名称',
  `db_name` varchar(30) DEFAULT NULL COMMENT '数据库名称',
  `db_user` varchar(30) DEFAULT NULL COMMENT '数据库用户名',
  `db_password` varchar(30) DEFAULT NULL COMMENT '数据库密码',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `use_from` bigint DEFAULT NULL COMMENT '使用开始时间',
  `use_to` bigint DEFAULT NULL COMMENT '使用结束时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='测试环境';

-- ----------------------------
-- Records of h_environment
-- ----------------------------
BEGIN;
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Kf', '开发环境', 'Oracle11g', '16.24.33.7', '1521', '0', 'sopdb1', 'cbs', 'cbs', '******', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 'Bb', '版本环境', 'Oracle11g', '16.24.33.8', '1529', '0', 'sopdbver', 'cbs', 'cbs', '******', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 'Ver', 'Ver环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbs', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 'Kyiv', '基辅环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbs1', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 'Kite', 'Kite环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbsqy', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 'Rose', 'Rose环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 'Moscow', '莫斯科环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs1', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 'Kj', '会计环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs2', 'cbs', 'cbs', '******', 1, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 'Test', 'Test环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs3', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 'New1', '新DB环境1', 'Oracle19c', '16.24.44.105', '1529', '1', 'cbs1', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 'New2', '新DB环境2', 'Oracle19c', '16.24.44.105', '1529', '1', 'cbs2', 'cbs', 'cbs', '******', 2, 20230101000000, 20230104235959, NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_image
-- ----------------------------
DROP TABLE IF EXISTS `h_image`;
CREATE TABLE `h_image` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `path` varchar(256) DEFAULT NULL COMMENT '路径',
  `data` longblob COMMENT '数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_machine
-- ----------------------------
DROP TABLE IF EXISTS `h_machine`;
CREATE TABLE `h_machine` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `type` int DEFAULT NULL COMMENT '类型',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `cpu` varchar(50) DEFAULT NULL COMMENT 'cpu',
  `memory` varchar(50) DEFAULT NULL COMMENT '内存',
  `disk` varchar(50) DEFAULT NULL COMMENT '磁盘',
  `environment_id` bigint DEFAULT NULL COMMENT '环境ID',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='服务器';

-- ----------------------------
-- Records of h_machine
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_permission
-- ----------------------------
DROP TABLE IF EXISTS `h_permission`;
CREATE TABLE `h_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限组件',
  `visible` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否可见(0:可见,1:不可见)',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '权限状态(0:启动,1:禁用)',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '权限类型(1:目录,2:菜单,3:按钮)',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限描述',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限编码',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限';

-- ----------------------------
-- Records of h_permission
-- ----------------------------
BEGIN;
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '用户管理', 'user', 'system/user/index', 0, 0, 'system:user:list', 1, '#', '用户管理', '0001', 1, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '文章管理', 'article', 'system/article/index', 0, 0, 'system:article:index', 1, '#', '文章管理', '0002', 2, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '评论管理', 'comment', 'system/comment/index', 0, 0, 'system:comment:index', 1, '#', '评论管理', '0003', 3, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '消息管理', 'message', 'system/message/index', 0, 0, 'system:message:index', 1, '#', '消息管理', '0004', 4, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '资产管理', 'asset/hardware', 'asset/hardware', 0, 0, 'asset:hardware', 1, '#', '资产管理', '0005', 5, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '系统清单', 'asset/system', 'asset/system', 0, 0, 'asset:syetem', 1, '#', '系统清单', '0006', 6, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '预算概览', 'budget/board', 'budget/board', 0, 0, 'budget:board', 1, '#', '预算概览', '0007', 7, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '预算额度', 'budget/quota', 'budget/quota', 0, 0, 'budget:quota', 1, '#', '预算额度', '0008', 8, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '预算明细', 'budget/detail', 'budget/detail', 0, 0, 'budget:detail', 1, '#', '预算明细', '0009', 9, 1, 20230304112742, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_role
-- ----------------------------
DROP TABLE IF EXISTS `h_role`;
CREATE TABLE `h_role` (
  `id` bigint NOT NULL COMMENT '角色ID',
  `name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of h_role
-- ----------------------------
BEGIN;
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'ROLE_ADMIN', '超级管理员', '0001', 1, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 'ROLE_MANAGER', '管理员', '0002', 2, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 'ROLE_VIP', 'VIP', '0004', 4, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 'ROLE_USER', '普通用户', '0008', 8, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 'ROLE_DEV', '开发用户', '0016', 16, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (32, 'ROLE_TEST', '测试用户', '0032', 32, 1, 20230206125545, NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (64, 'ROLE_GUEST', '游客', '0064', 64, 1, 20230206125545, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `h_role_permission`;
CREATE TABLE `h_role_permission` (
  `id` bigint NOT NULL COMMENT '角色权限关联ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `permission_id` bigint DEFAULT NULL COMMENT '权限ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限关联';

-- ----------------------------
-- Records of h_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 1, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 1, 2, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 1, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 1, 4, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 1, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 1, 6, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 1, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 1, 8, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 1, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 2, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 2, 2, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 2, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 2, 4, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 2, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 4, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 4, 6, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 4, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 4, 8, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, 4, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, 8, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, 8, 6, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, 8, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 8, 8, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, 8, 9, 1, 20230304112751, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_task
-- ----------------------------
DROP TABLE IF EXISTS `h_task`;
CREATE TABLE `h_task` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `task_name` varchar(255) NOT NULL,
  `task_description` text,
  `schedule` varchar(255) NOT NULL,
  `last_run_time` datetime DEFAULT NULL,
  `next_run_time` datetime DEFAULT NULL,
  `task_status` varchar(50) NOT NULL DEFAULT 'pending',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 1-正常 2-禁用',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_team
-- ----------------------------
DROP TABLE IF EXISTS `h_team`;
CREATE TABLE `h_team` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '团队名称',
  `description` varchar(255) DEFAULT NULL COMMENT '团队描述',
  `leader_id` bigint DEFAULT NULL COMMENT '团队负责人ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_team
-- ----------------------------
BEGIN;
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (0, '未指定', '未指定', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '核心开发', '核心开发', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '外围开发', '外围开发', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '管理系统', '管理系统', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '电子银行', '电子银行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '信息安全', '信息安全', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '设备运行', '设备运行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '网络通讯', '网络通讯', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '生产运行', '生产运行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '应用维护', '应用维护', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '数据中心', '数据中心', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '测试', '测试', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 'PMO', 'PMO', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '人力', '人力', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '新核心', '新核心', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '其他', '其他', 1897630015512547329, 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_user
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盐',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别 1-男 2-女',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `age` int DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `department_id` bigint DEFAULT NULL COMMENT '部门ID',
  `status` int DEFAULT '0' COMMENT '状态 0-正常 1-禁用',
  `is_lock` int DEFAULT '0' COMMENT '是否锁定 0-否 1-是',
  `is_active` int DEFAULT '0' COMMENT '是否激活 0-否 1-是',
  `last_login_time` bigint DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录IP',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';

-- ----------------------------
-- Records of h_user
-- ----------------------------
BEGIN;
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1897630015512547329, 'Admin', 'admin', '$2a$10$HBoa7Tzqlgm668SRsdkb6.R6uc6/6dw1my1rhx2/Ss7TkHrM2PCR6', '431618', 1, '123456789012345678', '13912348888', './test', 18, 'admin@gmail.com', 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898257421470494721, 'User', 'user', '$2a$10$qlt4X2OqLZjnuHChjp./W.hcxflpcd/Spo4ErrdOyMV1m2Rj.rqpG', '85589', 0, '123456789011112222', '13912346666', './user', 18, 'user@gmail.com', 2, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1746272199985, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898257629201788929, 'user', 'user6', '$2a$10$fSwTlCFtcGrmXfl9fn.5HujJdYaHiBBZ7bFzuMAGhFugM1c0/Lh2G', '300320', 0, NULL, '13900006667', NULL, 29, 'user6@gmail.com', 8, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1746274867417, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898258120480616450, 'vip', 'vip', '$2a$10$grLc14XgDDj2e4/YdNYmvuCSKkFu9kaH4mQ7QGoQ46D3PPs6/ZjA6', '825622', 0, NULL, '13011112222', NULL, NULL, 'vip@gmail.com', 5, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1746274883196, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898312658545778690, 'user1', 'user1', '$2a$10$Fuez77lej9r2rwfN.gweQOoSTNomxiOYv9hrFyIKXxcBRbYIBEIP2', '184422', 0, NULL, '13011112222', NULL, NULL, 'user1@gmail.com', 8, 0, 0, 0, NULL, NULL, NULL, 1, NULL, 1746276506653, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908467995296985090, 'user2', 'user2', '$2a$10$qhBqfY0IQRx3pZUhlSw22u4DZnq/MgCeDzWnjZ06kkzXyAGnJGdc6', '918829', 0, NULL, '13022221112', NULL, NULL, 'user2@gmail.com', 14, 1, 0, 0, NULL, NULL, NULL, 1, NULL, 1746323117744, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908471088071897089, 'user3', 'user3', '$2a$10$ModBuaFjpIrk0mytCIHRaeGEW5jShGs.bEh.4hFpP76vISIh.AZ6q', '365897', 0, NULL, '13300003332', NULL, NULL, 'user3@gmail.com', 6, 0, 0, 1, NULL, NULL, NULL, 1, NULL, 1746328582769, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908480162679287810, NULL, 'user4', '$2a$10$FxKawF.Syku4qGKsNaz5P.1i3YzGuEq/nUseRgyFPBbUWdwps1Vle', '665001', NULL, NULL, NULL, NULL, NULL, 'user4@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, NULL, 1746318343440, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1912050960380383234, NULL, 'user10', '$2a$10$QK0Gwrr0R.mM6AzwkHHYdODB.8YB2Y6KyTk9A3ukjubB8.P7W.Pjq', '559389', NULL, NULL, NULL, NULL, NULL, 'user10@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1917576896571314178, NULL, 'user11', '$2a$10$E36XG9t3eikhDu7T6gtO/esp2mJv/4p86sba2XiCr7yxvZUw5c3zK', '106119', NULL, NULL, NULL, NULL, NULL, 'user11@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746020933657, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1917577780013338625, NULL, 'user12', '$2a$10$ka6AEvz8L5USGs9l5iMACuvpgXtlGwrcOdpA8Di4W5vkQEDHuvEF.', '109794', NULL, NULL, NULL, NULL, NULL, 'user12@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746021144285, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1917844358466453506, NULL, 'test1', '$2a$10$.e0ZaQMGPMTZZObL46J3ZuyrzlJblbDm7bGT9Aqs5SIDfhMdnsbnC', '926477', NULL, NULL, NULL, NULL, NULL, 'test1@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746084701541, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1917846652826238977, NULL, 'testuser2', '$2a$10$0wGTLOHONdn82VyBJzlh7O4CHnqCBMwMQyvLBN9lR44q37weIji5W', '819344', NULL, NULL, NULL, NULL, NULL, 'test2@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746085248559, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1918659054115323905, 'user13', 'user13', '$2a$10$yDkj9LYhHyOKrT5rPh092uRQtskwJJmuAXmKDyuI.cBPpSUWS9JJa', 'LrUJdX', NULL, NULL, '13300003333', '', NULL, 'user13@gmail.com', 32, 1, 0, 1, NULL, NULL, NULL, 1, 1746278940121, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1918826227513229314, 'user14', 'user14', '$2a$10$UMRp1IkJq1MDMhmTPztps.wcZTCBJZsnjH4wQLyS7qekFBvL2jF/O', 'iDTDwX', NULL, NULL, '13911114444', '', NULL, 'user14@gmail.com', 5, 1, 0, 0, NULL, NULL, NULL, 1, 1746318797364, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6119170176878989095, 'user16', 'user16', '$2a$10$H4ZBCBnFX4KZzN6ed04v5.tPnBXY5cXRk0hVLVMVlsVnCUjbaSqpq', '7eUAOY', NULL, NULL, '13500006666', '', NULL, 'user16@gmail.com', 32, 0, 0, 1, NULL, NULL, NULL, 1, 1746368271947, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6706720622553003629, 'user15', 'user15', '$2a$10$9j5O2dI86Pj5Q3eWYqlX7.XrLnvyFDwBav5skjDsFcwHJfpGa9olq', 'WwdQvq', NULL, NULL, '13500005555', '', NULL, 'user15@gmail.com', 32, 1, 0, 1, NULL, NULL, NULL, 1, 1746327944869, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_user_role
-- ----------------------------
DROP TABLE IF EXISTS `h_user_role`;
CREATE TABLE `h_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8990838681356496545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of h_user_role
-- ----------------------------
BEGIN;
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 1897630015512547329, 1, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 1897630015512547329, 2, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 1897630015512547329, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 1897630015512547329, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 1897630015512547329, 16, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 1897630015512547329, 32, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 1898258120480616450, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 1898258120480616450, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 1898257421470494721, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 1898257629201788929, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 1908467995296985090, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 1908480162679287810, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 1917576896571314178, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 1912050960380383234, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 1917844358466453506, 8, 1, 1746084701546, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 1898312658545778690, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 1917577780013338625, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 1917846652826238977, 8, 1, 1746085248563, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, 1918659054115323905, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496535, 6706720622553003629, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496536, 6706720622553003629, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496537, 1918826227513229314, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496542, 1908471088071897089, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496543, 1908471088071897089, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496544, 6119170176878989095, 8, 1, NULL, NULL, 0);
COMMIT;

CREATE TABLE h_message (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '消息ID',
  `title` VARCHAR(255) NOT NULL COMMENT '消息标题',
  `content` TEXT NOT NULL COMMENT '消息内容',
  `sender` VARCHAR(50) NOT NULL COMMENT '发送者',
  `send_time` BIGINT DEFAULT NULL COMMENT '发送时间',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息表';

CREATE TABLE h_message_receiver (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
  `message_id` BIGINT NOT NULL COMMENT '消息ID',
  `user_id` BIGINT NOT NULL COMMENT '接收用户ID',
  `is_read` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否已读：0-未读，1-已读',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '状态：0-正常，1-已删除',
  `read_time` bigint COMMENT '阅读时间',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息接收记录表';


SET FOREIGN_KEY_CHECKS = 1;
