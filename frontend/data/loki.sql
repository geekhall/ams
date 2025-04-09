/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql-loki
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3316
 Source Schema         : loki

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 09/04/2025 09:16:01
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
  `status` int NOT NULL DEFAULT '0' COMMENT '状态 0-正常 1-报废 2-维修',
  `purchase_date` bigint DEFAULT NULL COMMENT '购入日期',
  `purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '购买价格',
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
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Dell电脑', 'DELL-2025', 1, 1, '科技部', 0, 1672531200000, 12000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '服务器', 'IP14-2023', 2, 1, '科技部', 0, 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '交换机', 'DXPS-2023', 3, 2, '会议室', 0, 1672531200000, 10000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '路由器', 'RTP-2023', 4, 2, '科技部', 0, 1672531200000, 5000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '打印机', 'PRT-2023', 5, 3, '科技部', 0, 1672531200000, 3000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '显示器', 'MON-2023', 6, 3, '科技部', 0, 1672531200000, 2000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '手机', 'IPHONE-2023', 7, 4, '科技部', 0, 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '平板', 'IPAD-2023', 8, 4, '科技部', 0, 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '投影仪', 'PJT-2023', 9, 5, '会议室', 0, 1672531200000, 7000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '音响', 'SPK-2023', 10, 5, '会议室', 0, 1672531200000, 4000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '摄像头', 'CAM-2023', 11, 6, '科技部', 0, 1672531200000, 1500.00, 3, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '监控设备', 'CCTV-2023', 12, 6, '科技部', 0, 1672531200000, 5000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '门禁设备', 'ACD-2023', 13, 7, '科技部', 0, 1672531200000, 3000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '考勤机', 'AT-2023', 14, 7, '科技部', 0, 1672531200000, 2000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 'UPS', 'UPS-2023', 15, 8, '科技部', 0, 1672531200000, 2500.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '电源线', 'CABLE-2023', 16, 8, '科技部', 0, 1672531200000, 100.00, 20, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '网线', 'LAN-2023', 17, 9, '科技部', 0, 1672531200000, 50.00, 30, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '鼠标', 'MOUSE-2023', 18, 9, '科技部', 0, 1672531200000, 200.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '键盘', 'KEYBOARD-2023', 19, 10, '科技部', 0, 1672531200000, 300.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '传真机', 'FAX-2023', 20, 10, '科技部', 0, 1672531200000, 1500.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '办公设备', 'OFFICE-2023', 21, 11, '科技部', 0, 1672531200000, 500.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '电脑', 'PC-2023', 22, 11, '科技部', 0, 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, '服务器机柜', 'RACK-2023', 23, 12, '科技部', 0, 1672531200000, 2000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `asset_name`, `asset_code`, `asset_type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '机房空调', 'AC-2023', 24, 12, '机房', 0, 1672531200000, 8000.00, 1, 1, 1672531200000, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_asset_type
-- ----------------------------
DROP TABLE IF EXISTS `h_asset_type`;
CREATE TABLE `h_asset_type` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '资产类型名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，跟类型为NULL）',
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
-- Table structure for h_chapter
-- ----------------------------
DROP TABLE IF EXISTS `h_chapter`;
CREATE TABLE `h_chapter` (
  `id` bigint NOT NULL COMMENT '章节ID',
  `course_id` bigint DEFAULT NULL COMMENT '课程ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程';

-- ----------------------------
-- Records of h_chapter
-- ----------------------------
BEGIN;
INSERT INTO `h_chapter` (`id`, `course_id`, `title`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 1, '十分钟Git入门教程', 1, 1, '2023-03-04 11:27:56', NULL, 0);
INSERT INTO `h_chapter` (`id`, `course_id`, `title`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 2, '十分钟Markdown入门教程', 2, 1, '2023-03-04 11:27:56', NULL, 0);
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门';

-- ----------------------------
-- Records of h_department
-- ----------------------------
BEGIN;
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '信息科技部', '信息科技部', '0001', NULL, 1, 1, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '人力资源部', '人力资源部', '0002', NULL, 1, 2, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '财务部', '财务部', '0003', NULL, 1, 3, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '市场部', '市场部', '0004', NULL, 1, 4, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '销售部', '销售部', '0005', NULL, 1, 5, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '研发部', '研发部', '0006', NULL, 1, 6, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '运营部', '运营部', '0007', NULL, 1, 7, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '产品部', '产品部', '0008', NULL, 1, 8, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '行政部', '行政部', '0009', NULL, 1, 9, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '客服部', '客服部', '0010', NULL, 1, 10, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '技术部', '技术部', '0011', NULL, 1, 11, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '质量部', '质量部', '0012', NULL, 1, 12, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '采购部', '采购部', '0013', NULL, 1, 13, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '后勤部', '后勤部', '0014', NULL, 1, 14, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '法务部', '法务部', '0015', NULL, 1, 15, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '风控部', '风控部', '0016', NULL, 1, 16, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '风险部', '风险部', '0017', NULL, 1, 17, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '审计部', '审计部', '0018', NULL, 1, 18, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '资产部', '资产部', '0019', NULL, 1, 19, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '资金部', '资金部', '0020', NULL, 1, 20, 1, '2023-03-04 11:27:17', NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '投资部', '投资部', '0021', NULL, 1, 21, 1, '2023-03-04 11:27:17', NULL, 0);
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
  `use_from` datetime DEFAULT NULL COMMENT '使用开始时间',
  `use_to` datetime DEFAULT NULL COMMENT '使用结束时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
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
  `use_from` datetime DEFAULT NULL COMMENT '使用开始时间',
  `use_to` datetime DEFAULT NULL COMMENT '使用结束时间',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='测试环境';

-- ----------------------------
-- Records of h_environment
-- ----------------------------
BEGIN;
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Kf', '开发环境', 'Oracle11g', '16.24.33.7', '1521', '0', 'sopdb1', 'cbs', 'cbs', '******', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 'Bb', '版本环境', 'Oracle11g', '16.24.33.8', '1529', '0', 'sopdbver', 'cbs', 'cbs', '******', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 'Ver', 'Ver环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbs', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 'Kyiv', '基辅环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbs1', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 'Kite', 'Kite环境', 'Oracle11g', '16.24.44.131', '1529', '0', 'cbsqy', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 'Rose', 'Rose环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 'Moscow', '莫斯科环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs1', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 'Kj', '会计环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs2', 'cbs', 'cbs', '******', 1, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 'Test', 'Test环境', 'Oracle11g', '16.24.44.132', '1529', '0', 'cbs3', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 'New1', '新DB环境1', 'Oracle19c', '16.24.44.105', '1529', '1', 'cbs1', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
INSERT INTO `h_environment` (`id`, `name`, `description`, `db_type`, `db_host`, `db_port`, `db_serv_type`, `db_serv_name`, `db_name`, `db_user`, `db_password`, `user_id`, `use_from`, `use_to`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 'New2', '新DB环境2', 'Oracle19c', '16.24.44.105', '1529', '1', 'cbs2', 'cbs', 'cbs', '******', 2, '2023-01-01 00:00:00', '2023-01-04 23:59:59', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_forecast
-- ----------------------------
DROP TABLE IF EXISTS `h_forecast`;
CREATE TABLE `h_forecast` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '车辆名称',
  `description` varchar(255) DEFAULT NULL COMMENT '车辆描述',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `model` varchar(255) DEFAULT NULL COMMENT '车型',
  `configuration` varchar(255) DEFAULT NULL COMMENT '配置',
  `location` varchar(255) DEFAULT NULL COMMENT '购买地点',
  `purchase_time` varchar(255) DEFAULT NULL COMMENT '购买时间',
  `is_second_hand` tinyint(1) DEFAULT '0' COMMENT '是否二手',
  `second_hand_years` int DEFAULT '0' COMMENT '二手年限',
  `price` decimal(17,2) DEFAULT NULL COMMENT '预测价格',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_forecast
-- ----------------------------
BEGIN;
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='服务器';

-- ----------------------------
-- Records of h_machine
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_order
-- ----------------------------
DROP TABLE IF EXISTS `h_order`;
CREATE TABLE `h_order` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `order_date` datetime NOT NULL COMMENT '订单时间',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单数量',
  `payment_method` varchar(50) DEFAULT NULL COMMENT '支付渠道',
  `order_status` varchar(50) DEFAULT NULL COMMENT '订单状态',
  `billing_address` text COMMENT '账单地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 1-正常 2-禁用',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_order
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限';

-- ----------------------------
-- Records of h_permission
-- ----------------------------
BEGIN;
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '用户管理', 'user', 'system/user/index', 0, 0, 'system:user:list', 1, '#', '用户管理', '0001', 1, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '文章管理', 'article', 'system/article/index', 0, 0, 'system:article:index', 1, '#', '文章管理', '0002', 2, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '评论管理', 'comment', 'system/comment/index', 0, 0, 'system:comment:index', 1, '#', '评论管理', '0003', 3, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '消息管理', 'message', 'system/message/index', 0, 0, 'system:message:index', 1, '#', '消息管理', '0004', 4, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '菜单管理', 'menu', 'system/menu/index', 0, 0, 'system:menu:list', 1, '#', '菜单管理', '0005', 5, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '字典管理', 'dict', 'system/dict/index', 0, 0, 'system:dict:list', 1, '#', '字典管理', '0006', 6, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '系统日志', 'sys', 'system/sys/index', 0, 0, 'system:sys:list', 1, '#', '系统日志', '0007', 7, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '系统监控', 'super', 'system/super/index', 0, 0, 'system:super:list', 1, '#', '系统监控', '0008', 8, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '系统配置', 'conf', 'system/conf/index', 0, 0, 'system:conf:list', 1, '#', '系统配置', '0009', 9, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '系统通知', 'notify', 'system/notify/index', 0, 0, 'system:notify:list', 1, '#', '系统通知', '0010', 10, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '系统工具', 'tool', 'system/tool/index', 0, 0, 'system:tool:list', 1, '#', '系统工具', '0011', 11, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '系统接口', 'interface', 'system/interface/index', 0, 0, 'system:interface:list', 1, '#', '系统接口', '0012', 12, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '系统文档', 'doc', 'system/doc/index', 0, 0, 'system:doc:list', 1, '#', '系统文档', '0013', 13, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '系统报表', 'statement', 'system/statement/index', 0, 0, 'system:statement:list', 1, '#', '系统报表', '0014', 14, 1, '2023-03-04 11:27:42', NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '系统地图', 'map', 'system/map/index', 0, 0, 'system:map:list', 1, '#', '系统地图', '0015', 15, 1, '2023-03-04 11:27:42', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_player
-- ----------------------------
DROP TABLE IF EXISTS `h_player`;
CREATE TABLE `h_player` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `age` int DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_player
-- ----------------------------
BEGIN;
INSERT INTO `h_player` (`id`, `name`, `age`, `email`) VALUES (1, 'Jone', 18, 'test1@geekhall.cn');
INSERT INTO `h_player` (`id`, `name`, `age`, `email`) VALUES (2, 'Jack', 20, 'test2@geekhall.cn');
INSERT INTO `h_player` (`id`, `name`, `age`, `email`) VALUES (3, 'Tom', 28, 'test3@geekhall.cn');
INSERT INTO `h_player` (`id`, `name`, `age`, `email`) VALUES (4, 'Sandy', 21, 'test4@geekhall.cn');
INSERT INTO `h_player` (`id`, `name`, `age`, `email`) VALUES (5, 'Billie', 24, 'test5@geekhall.cn');
COMMIT;

-- ----------------------------
-- Table structure for h_product
-- ----------------------------
DROP TABLE IF EXISTS `h_product`;
CREATE TABLE `h_product` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `description` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `price` decimal(17,2) DEFAULT NULL COMMENT '价格',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_product
-- ----------------------------
BEGIN;
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (1, 'MacBookPro', 'Mac book pro', 'Apple', 15000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (2, 'MacBookAir', 'Mac book air', 'Apple', 8000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (3, 'iPhone13', 'iphone13 pro max', 'Apple', 9800.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (4, 'iMac', 'iMac', 'Apple', 12000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (5, 'iWatch', 'iWatch', 'Apple', 4000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (6, 'MacMini', 'MacMini', 'Apple', 6000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (7, 'AirPots', 'Air Pots Pro', 'Apple', 2000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (8, 'Surface', 'Surface book', 'Microsoft', 8000.00, 0);
INSERT INTO `h_product` (`id`, `name`, `description`, `brand`, `price`, `is_deleted`) VALUES (9, 'Honor', 'Honor phone', 'Huawei', 2000.00, 0);
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of h_role
-- ----------------------------
BEGIN;
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'ROLE_ADMIN', '超级管理员', '0001', 1, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 'ROLE_MANAGER', '管理员', '0002', 2, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 'ROLE_VIP', 'VIP', '0004', 4, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 'ROLE_USER', '普通用户', '0008', 8, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 'ROLE_DEV', '开发用户', '0016', 16, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (32, 'ROLE_TEST', '测试用户', '0032', 32, 1, '2023-02-06 12:55:45', NULL, 0);
INSERT INTO `h_role` (`id`, `name`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (64, 'ROLE_GUEST', '游客', '0064', 64, 1, '2023-02-06 12:55:45', NULL, 0);
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限关联';

-- ----------------------------
-- Records of h_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 1, 1, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 1, 2, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 1, 3, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 1, 4, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 1, 5, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 1, 6, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 1, 7, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 1, 8, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 1, 9, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 1, 10, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 1, 11, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 1, 12, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 1, 13, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 1, 14, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 1, 15, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 2, 1, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 2, 2, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 2, 3, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, 2, 4, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, 2, 5, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, 2, 6, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, 2, 7, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 2, 8, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, 2, 9, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, 3, 1, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, 3, 2, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, 3, 3, 1, '2023-03-04 11:27:51', NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, 4, 1, 1, '2023-03-04 11:27:51', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_sale
-- ----------------------------
DROP TABLE IF EXISTS `h_sale`;
CREATE TABLE `h_sale` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `order_id` int NOT NULL COMMENT '订单ID',
  `quantity` int NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total_sale_amount` decimal(10,2) NOT NULL,
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_sale
-- ----------------------------
BEGIN;
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_teacher
-- ----------------------------
DROP TABLE IF EXISTS `h_teacher`;
CREATE TABLE `h_teacher` (
  `id` bigint NOT NULL COMMENT '讲师ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师资历，一句话说明讲师',
  `level` int unsigned NOT NULL COMMENT '头衔 1-高级讲师 2-资深讲师 3-专家讲师 4-首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '讲师头像',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='讲师';

-- ----------------------------
-- Records of h_teacher
-- ----------------------------
BEGIN;
INSERT INTO `h_teacher` (`id`, `name`, `intro`, `career`, `level`, `avatar`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '张三', '十余年丰富前后端开发经验', '资深讲师', 2, NULL, 1, 1, '2023-03-04 11:28:02', NULL, 0);
INSERT INTO `h_teacher` (`id`, `name`, `intro`, `career`, `level`, `avatar`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '李四', '多年丰富前端开发经验', '高级讲师', 1, NULL, 2, 1, '2023-03-04 11:28:02', NULL, 0);
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
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别 1-男 2-女',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'token',
  `token_expire_time` datetime DEFAULT NULL COMMENT 'token过期时间',
  `id_card` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `age` int DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `department_id` bigint DEFAULT NULL COMMENT '部门ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `status` int DEFAULT '0' COMMENT '状态 0-正常 1-禁用',
  `version` int DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` int unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';

-- ----------------------------
-- Records of h_user
-- ----------------------------
BEGIN;
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1897630015512547329, NULL, 'admin', '$2a$10$HBoa7Tzqlgm668SRsdkb6.R6uc6/6dw1my1rhx2/Ss7TkHrM2PCR6', '431618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@gmail.com', NULL, 1, 0, NULL, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898257421470494721, NULL, 'user', '$2a$10$qlt4X2OqLZjnuHChjp./W.hcxflpcd/Spo4ErrdOyMV1m2Rj.rqpG', '85589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user@gmail.com', NULL, 8, 0, NULL, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898257629201788929, NULL, 'user6', '$2a$10$fSwTlCFtcGrmXfl9fn.5HujJdYaHiBBZ7bFzuMAGhFugM1c0/Lh2G', '300320', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user6@gmail.com', NULL, 8, 0, NULL, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898258120480616450, NULL, 'vip', '$2a$10$grLc14XgDDj2e4/YdNYmvuCSKkFu9kaH4mQ7QGoQ46D3PPs6/ZjA6', '825622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vip@gmail.com', NULL, 4, 0, NULL, NULL, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1898312658545778690, NULL, 'user1', '$2a$10$Fuez77lej9r2rwfN.gweQOoSTNomxiOYv9hrFyIKXxcBRbYIBEIP2', '184422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user1@gmail.com', NULL, NULL, 0, 1, '2025-03-08 17:59:41', NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908467995296985090, NULL, 'user2', '$2a$10$qhBqfY0IQRx3pZUhlSw22u4DZnq/MgCeDzWnjZ06kkzXyAGnJGdc6', '918829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user2@gmail.com', NULL, NULL, 0, 1, '2025-04-05 18:33:22', NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908471088071897089, NULL, 'user3', '$2a$10$ModBuaFjpIrk0mytCIHRaeGEW5jShGs.bEh.4hFpP76vISIh.AZ6q', '365897', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user3@gmail.com', NULL, NULL, 0, 1, '2025-04-05 18:45:40', NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `sex`, `token`, `token_expire_time`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `role_id`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1908480162679287810, NULL, 'user4', '$2a$10$FxKawF.Syku4qGKsNaz5P.1i3YzGuEq/nUseRgyFPBbUWdwps1Vle', '665001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user4@gmail.com', NULL, NULL, 0, 1, '2025-04-05 19:21:43', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_user_role
-- ----------------------------
DROP TABLE IF EXISTS `h_user_role`;
CREATE TABLE `h_user_role` (
  `id` bigint NOT NULL COMMENT '用户角色关系ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4776551169792290936, 1908467995296985090, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5113087338550938664, 1908480162679287810, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7490582593860205658, 1898312658545778690, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8990838681356496533, 1908471088071897089, 8, 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `h_vehicle`;
CREATE TABLE `h_vehicle` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '车辆名称',
  `description` varchar(255) DEFAULT NULL COMMENT '车辆描述',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `model` varchar(255) DEFAULT NULL COMMENT '车型',
  `configuration` varchar(255) DEFAULT NULL COMMENT '配置',
  `location` varchar(255) DEFAULT NULL COMMENT '购买地点',
  `purchase_time` varchar(255) DEFAULT NULL COMMENT '购买时间',
  `is_second_hand` tinyint(1) DEFAULT '0' COMMENT '是否二手',
  `second_hand_years` int DEFAULT '0' COMMENT '二手年限',
  `price` decimal(17,2) DEFAULT NULL COMMENT '价格',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_vehicle
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_weapon
-- ----------------------------
DROP TABLE IF EXISTS `h_weapon`;
CREATE TABLE `h_weapon` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '武器名称',
  `description` varchar(255) DEFAULT NULL COMMENT '武器描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_weapon
-- ----------------------------
BEGIN;
INSERT INTO `h_weapon` (`id`, `name`, `description`) VALUES (1, '雷神之锤', '雷神Thor的锤子');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
