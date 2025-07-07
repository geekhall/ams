/*
 Navicat Premium Dump SQL

 Source Server         : docker-loki
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3326
 Source Schema         : loki

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 08/07/2025 06:57:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for h_article
-- ----------------------------
DROP TABLE IF EXISTS `h_article`;
CREATE TABLE `h_article` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '资产名称',
  `code` varchar(255) NOT NULL COMMENT '资产编号',
  `sn` varchar(255) DEFAULT NULL COMMENT '资产序列号',
  `type` bigint NOT NULL COMMENT '资产类型',
  `model` varchar(255) DEFAULT NULL COMMENT '设备型号',
  `config` varchar(255) DEFAULT NULL COMMENT '配置',
  `ip` varchar(255) DEFAULT NULL COMMENT '设备IP',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `provider` varchar(255) DEFAULT NULL COMMENT '供应商',
  `department_id` bigint NOT NULL COMMENT '所属部门',
  `owner_id` bigint DEFAULT NULL COMMENT '负责人ID',
  `user_id` bigint DEFAULT NULL COMMENT '使用人ID',
  `location` varchar(255) DEFAULT NULL COMMENT '存放地点',
  `status` varchar(255) NOT NULL COMMENT '状态 0-正常 1-报废 2-维修',
  `use_status` varchar(255) DEFAULT NULL COMMENT '使用状态 0-未使用 1-使用中',
  `purchase_date` bigint DEFAULT NULL COMMENT '购入日期',
  `purchase_price` decimal(17,2) DEFAULT '0.00' COMMENT '购买价格',
  `count` int DEFAULT '1' COMMENT '数量',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=1942205591386681347 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_asset
-- ----------------------------
BEGIN;
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Dell电脑', 'DELL-2025', 'SN1', 1, '型号1', '4C', '16.24.32.11', '资产描述', 'Dell', 5, NULL, NULL, '科技部', '正常', '在用', 1671379200000, 112004.00, 2, 1, 1672531200000, 1751892133541, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '服务器', 'IP14-2023', NULL, 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '交换机', 'DXPS-2023', NULL, 3, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '会议室', '正常', NULL, 1672531200000, 10000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '路由器', 'RTP-2023', NULL, 4, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, '科技部', '正常', NULL, 1672416000000, 5000.00, 2, 1, 1672531200000, 1744889852678, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '打印机', 'PRT-2023', NULL, 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, '科技部', '正常', NULL, 1732550400000, 3000.00, 2, 1, 1672531200000, 1744889864320, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '显示器', 'MON-2023', NULL, 6, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, '科技部', '正常', NULL, 1672502400000, 2000.00, 2, 1, 1672531200000, 1744807745404, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '手机', 'IPHONE-2023', NULL, 7, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '平板', 'IPAD-2023', NULL, 8, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '投影仪', 'PJT-2023', NULL, 9, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, '会议室', '正常', NULL, 1672531200000, 7000.00, 2, 1, 1672531200000, 1744889770344, 1);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '音响', 'SPK-2023', NULL, 10, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, '会议室', '正常', NULL, 1672531200000, 4000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '摄像头', 'CAM-2023', NULL, 11, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 1500.00, 3, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '监控设备', 'CCTV-2023', NULL, 12, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 5000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '门禁设备', 'ACD-2023', NULL, 13, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 3000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '考勤机', 'AT-2023', NULL, 14, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 2000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 'UPS', 'UPS-2025', NULL, 15, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, '科技部', '正常', NULL, 1672502400000, 2500.00, 2, 1, 1672531200000, 1744298662338, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '电源线', 'CABLE-2023', NULL, 16, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 100.00, 20, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '网线', 'LAN-2023', NULL, 17, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 50.00, 30, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '鼠标', 'MOUSE-2023', NULL, 18, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 200.00, 10, 1, 1672531200000, 1744288245023, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '键盘', 'KEYBOARD-2023', NULL, 19, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 300.00, 5, 1, 1672531200000, 1744288235878, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '传真机', 'FAX-2023', NULL, 20, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 1500.00, 2, 1, 1672531200000, 1744288248700, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '办公设备', 'OFFICE-2023', NULL, 21, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 500.00, 10, 1, 1672531200000, 1744288252268, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '电脑', 'PC-2023', NULL, 22, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, '科技部', '正常', NULL, 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, '服务器机柜', 'RACK-2023', NULL, 23, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, '科技部', '正常', NULL, 1672416000000, 2000.00, 1, 1, 1672531200000, 1746889595107, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '机房空调', 'AC-2023', NULL, 24, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, '机房', '报废', NULL, 1671811200000, 8000.00, 1, 1, 1672531200000, 1746889673438, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (101, 'Dell电脑', 'GM39V34', 'SBZCO104202407010072', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1671984000000, 1.00, 1, 1, 1672531200000, 1746888641133, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (102, 'Dell电脑', 'C4PH4Y3', 'SBZC0104202407010135', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (103, 'Dell电脑', 'DAPH4Y3', 'SBZC0104202407010131', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (104, 'Dell电脑', '2N39V34', 'SBZC0104202407010101', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (105, 'Dell电脑', '3Q39V34', 'SBZC0104202407010103', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (106, 'Dell电脑', '94PH4Y3', 'SBZC0104202407010128', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (107, 'Dell电脑', 'B4PH4Y3', 'SBZC0104202407010126', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (108, 'Dell电脑', '9N39V34', 'SBZC0104202407010076', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (109, 'Dell电脑', '6P39V34', 'SBZC0104202407010077', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (110, 'Dell电脑', 'HP39V34', 'SBZC0104202407010056', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (111, '显示器', 'CN-O8NDHH-FCC00-35N-D88X-A03', 'SBZC0104202408130135', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (112, '显示器', 'CN-O8NDHH-FCC00-35N-D89X-A03', 'SBZC0104202408130132', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (113, '显示器', 'CN-OSNDHH-FCC00-35N-D8DX-AO3', 'SBZC0104202408130124', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (114, '显示器', 'CN-08NDHH-FCC00-44N-D7UX-A03', 'SBZC0104202408130125', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (115, '显示器', 'CN-O8NDHH-FCC00-44N-ARWX-AO4', 'SBZC0104202408130050', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (116, '显示器', 'CN-08NDHH-FCC00-44N-DD5X-AO4', 'SBZC0104202408130049', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (117, '显示器', 'CN-O8NDHH-FCC00-44N-DD2X-AO4', 'SBZC0104202408130052', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (118, '显示器', 'CN-O8NDHH-FCC00-44N-DCFX-AO4', 'SBZC0104202408130051', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (119, '显示器', 'CN-O8NDHH-FCC00-35N-DA2X-AO3', 'SBZC0104202408130123', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (120, '显示器', 'CN-O8NDHH-FCC00-44N-ATDX-A04', 'SBZC0104202408130101', 3, 'E2222H', '23寸', '', '', 'Dell', 32, NULL, NULL, '信息科技部-信悦汇15楼', '正常', '0', 1672243200000, 0.00, 1, 1, 1672531200000, 1746883000426, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910322874336444417, '测试资产1', 'TEST-2025-1', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '维修', NULL, 1743436800000, 111.00, 2, 1, 1744291439982, 1744890393129, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910323327828807681, '测试资产12', 'TEST-2025-12', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744128000000, 22.00, 23, 1, 1744291548104, 1744298088266, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910324022036410369, '测试资产13', 'TEST-2025-13', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 22.00, 23, 1, 1744291713615, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910328673377009666, '测试资产122', 'TEST-2025-122', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 21231.00, 11, 1, 1744292822581, 1744298423305, 1);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910338981256560641, '测试资产134', 'TEST-2025-134', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 1111.00, 22, 1, 1744295280172, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910342483366170626, '测试资产1222', 'TEST-2025-1222', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 222.00, 22, 1, 1744296115139, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910344710797488129, '测试资产144', 'TEST-2025-14', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744041600000, 4442.00, 11, 1, 1744296646201, 1744889878520, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910352072333651970, '测试资产166', 'TEST-2025-16', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 666.00, 6, 1, 1744298401327, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910354939274653697, '测试资产17', 'TEST-2025-17', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '正常', NULL, 1744214400000, 7.00, 7, 1, 1744299084859, 1744299099146, 1);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1921218695261110274, '测试资产12', 'Test-Code1', NULL, 4, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, '信悦汇15楼', '正常', NULL, 1746806400000, 0.00, 1, 1, 1746889206125, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1927356979265646594, '服务器1', 'SERVER1', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, '', '正常', NULL, 1748275200000, 0.00, 1, 1, 1748352687076, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `owner_id`, `user_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1942205591386681346, 'test1', '1', '', 1, '', '', '', '', '', 8, NULL, NULL, '', '正常', '闲置', 1751731200000, 1.00, 1, 1, 1751892872079, 1751892882805, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_asset_type
-- ----------------------------
DROP TABLE IF EXISTS `h_asset_type`;
CREATE TABLE `h_asset_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '资产类型名称',
  `status` int DEFAULT NULL COMMENT '状态',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1935971366803144707 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_asset_type
-- ----------------------------
BEGIN;
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '服务器1', 1, 1, 1672531200000, 1751892902128, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '主机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '显示器', 1, 1, 1672531200000, NULL, 1);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '网络设备', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '路由器', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '交换机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '防火墙', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '存储设备', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '硬盘', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 'SSD', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '打印机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '传真机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '办公设备', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '电脑', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '手机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '平板', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '投影仪', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '音响', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '摄像头', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '监控设备', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '门禁设备', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '考勤机', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 'UPS', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '电源线', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, '网线', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, '鼠标', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, '键盘', 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, 'API测试1', 1, 1, NULL, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (29, 'API测试2', 1, 1, 1744123986830, NULL, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (30, 'API测试33', 1, 1, 1744125246152, 1744125939224, 0);
INSERT INTO `h_asset_type` (`id`, `name`, `status`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1935971366803144706, '测试', NULL, 1, 1750406517114, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_budget
-- ----------------------------
DROP TABLE IF EXISTS `h_budget`;
CREATE TABLE `h_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=1920507110335008770 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_budget
-- ----------------------------
BEGIN;
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 2025, '新核心系统建设', '根据人民银行金融信息技术应用创新（信创）工作要求，……', 2, '1', 0, 231371112.00, 32, 1, '0', '0', NULL, 1743523200000, '备注', 0, NULL, 1, NULL, 1746545826065, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, 2025, '新核心生产环境', '新核心生产环境', 1, '1', 1, 30442600.00, 28, 1, '0', '0', NULL, 1744214400000, '备注', 0, NULL, 1, NULL, 1745845577012, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, 2025, '监管预留', '监管预留', 1, '1', 1, 5000001.00, 30, 1, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745845638463, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, 2025, '全行办公设备采购', '全行办公设备采购', 1, '2', 0, 19000001.00, 32, 1, '1', '1', '业务优先级情况说明', 1744214400000, '备注', 0, NULL, 1, NULL, 1746107718235, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, 2025, '信创版亚信杀毒软件采购项目', '信创版亚信杀毒软件采购项目', 2, '2', 0, 2000000.00, 25, 1, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745845587442, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, 2025, '总行机关三楼机房不间断电源老旧更换', '总行机关三楼机房不间断电源老旧更换', 3, '2', 0, 2000001.00, 32, 1, '1', '1', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1746107755535, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, 2025, '零售信贷相关系统', '零售信贷相关系统', 1, '2', 0, 13520000.00, 17, 1, '1', '1', '业务优先级情况说明', 1744297928610, '备注', 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, 2025, '对公业务管理平台二期项目', '对公业务管理平台二期项目', 1, '2', 0, 3930000.00, 12, 1, '1', '5', '业务优先级情况说明', 1744128000000, '备注', 0, NULL, 1, NULL, 1745067433543, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, 2025, '测试项目1', '测试需求及目标', 4, '1', 1, 10001.00, 32, 1, '1', '5', '测试业务优先级情况说明', 1744905600000, '测试备注', 0, NULL, 1, 1745058506994, 1746241666292, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 2025, '测试项目2', '测试需求及目标', 2, '1', 1, 100001.00, 27, 1, '1', '5', '测试业务优先级情况说明', 1744819200000, '测试备注', 0, NULL, 1, 1745058542696, 1746107773774, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 2025, '测试项目4', '测试需求及目标', 2, '1', 1, 10002.00, 32, 1, '1', '5', '测试业务优先级情况说明', 1744819200000, '测试备注', 0, NULL, 1, 1745063805361, 1746241678834, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 2025, '测试项目5', '测试需求及目标', 2, '1', 1, 10000.00, 32, 1, '1', '已立项', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745063916808, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 2025, '测试项目6', '测试需求及目标', 2, '1', 1, 10000.00, 32, 1, '1', '5', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745064003048, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 2025, '测试项目7', '测试需求及目标', 2, '1', 0, 10000.00, 32, 1, '1', '5', '测试业务优先级情况说明', 1744992000000, '测试备注', 0, NULL, 1, 1745067465875, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 2025, 'test', 'aaa', 2, '1', 0, 1111.00, 5, 1, '1', '5', '', 1746633600000, 'fff', 0, NULL, 1, 1746719420551, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 2025, 'tttt', 'aaaa', 3, '8', 0, 11112222.00, 32, 1, '1', '5', '', 1746633600000, '啊啊', 0, NULL, 1, 1746719457760, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 2025, '啊啊啊顶顶顶顶', '发的发', 2, '6', 0, 333.00, 32, 1, '1', '5', '', 1746633600000, '啊d', 0, NULL, 1, 1746719519688, NULL, 0);
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 2025, '自动覆盖', ' 森岛帆高', 4, '4', 0, 23.00, 32, 1, '1', '5', '', 1746633600000, '23', 0, NULL, 1, 1746719551057, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_budget_adjustment
-- ----------------------------
DROP TABLE IF EXISTS `h_budget_adjustment`;
CREATE TABLE `h_budget_adjustment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '预算性质名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，根类型为NULL）',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '预算类型名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类型（支持多级分类，根类型为NULL）',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `post_id` bigint NOT NULL COMMENT '文章ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `parent_id` bigint DEFAULT NULL COMMENT '父评论ID',
  `content` text NOT NULL COMMENT '评论内容',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门';

-- ----------------------------
-- Records of h_department
-- ----------------------------
BEGIN;
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '总行领导', '总行领导', '0001', NULL, 1, 1, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '纪检监察组', '纪检监察组', '0002', NULL, 1, 2, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '纪检监察组纪检监察部', '纪检监察组纪检监察部', '0003', NULL, 1, 3, 1, 20230304112717, NULL, 0);
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
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (55, '消费金融有限公司', '消费金融有限公司', '0055', NULL, 1, 55, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (56, '数科技术有限公司', '数科技术有限公司', '0056', NULL, 1, 56, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (57, '上海宝山', '上海宝山', '0057', NULL, 1, 57, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (58, '沈阳沈北', '沈阳沈北', '0058', NULL, 1, 58, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (59, '沈阳辽中', '沈阳辽中', '0059', NULL, 1, 59, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (60, '沈阳法库', '沈阳法库', '0060', NULL, 1, 60, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (61, '沈阳新民', '沈阳新民', '0061', NULL, 1, 61, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (62, '宁波江北', '宁波江北', '0062', NULL, 1, 62, 1, 20230304112717, NULL, 0);
INSERT INTO `h_department` (`id`, `name`, `description`, `code`, `parent_id`, `level`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (63, '其他', '其他', '0063', NULL, 1, 63, 1, 20230304112717, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_department_quota
-- ----------------------------
DROP TABLE IF EXISTS `h_department_quota`;
CREATE TABLE `h_department_quota` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `department_id` bigint NOT NULL COMMENT '部门ID',
  `budget_year` int NOT NULL COMMENT '预算年度',
  `quota` decimal(17,2) NOT NULL COMMENT '预算额度',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `department_budget_year` (`department_id`,`budget_year`)
) ENGINE=InnoDB AUTO_INCREMENT=1912320915336290306 DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_duty
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for h_image
-- ----------------------------
DROP TABLE IF EXISTS `h_image`;
CREATE TABLE `h_image` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
-- Table structure for h_message
-- ----------------------------
DROP TABLE IF EXISTS `h_message`;
CREATE TABLE `h_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者',
  `send_time` bigint DEFAULT NULL COMMENT '发送时间',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息类型',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息表';

-- ----------------------------
-- Records of h_message
-- ----------------------------
BEGIN;
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1, '【系统消息】欢迎使用AMS系统', '欢迎使用本系统！', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (2, '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '系统管理员', 1746626369000, '系统通知', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (3, '【系统公告】AMS系统已上线', 'AMS系统已上线，欢迎使用！', '系统管理员', 1746626369000, '系统公告', 0, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (4, '【系统消息】请及时更新您的个人信息', '请及时更新您的个人信息，以便我们更好地为您服务。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (5, '【系统通知】系统将于下周一进行例行维护', '系统将于下周一进行例行维护，请提前做好准备。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (6, '【系统公告】AMS系统已完成升级', 'AMS系统已完成升级，感谢您的耐心等待！', '系统管理员', 1746626369000, '系统公告', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (7, '【系统消息】今晚零点整发跨年红包，各位小伙伴兔年大吉，先到先得', '今晚零点整发跨年红包，各位小伙伴兔年大吉，先到先得。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (8, '【系统通知】系统将于本周五进行数据备份', '系统将于本周五进行数据备份，请提前做好准备。', '系统管理员', 1746626369000, '系统通知', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (9, '【系统公告】新年红包已发放完毕，感谢各位小伙伴的参与', '新年红包已发放完毕，感谢各位小伙伴的参与！', '系统管理员', 1746626369000, '系统公告', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (10, '【系统消息】预祝各位小伙伴新年快乐', '预祝各位小伙伴新年快乐', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (11, '【系统通知】系统将于下周一进行例行维护', '系统将于下周一进行例行维护，请提前做好准备。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (12, '【系统公告】AMS系统已完成升级', 'AMS系统已完成升级，感谢您的耐心等待！', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (13, '【系统消息】请及时更新您的个人信息', '请及时更新您的个人信息，以便我们更好地为您服务。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (14, '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '系统将于今晚凌晨1点到3点进行升级维护，请提前做好准备。', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (15, '【系统公告】AMS系统更新完成，新增预算管理功能！', 'AMS系统更新完成，新增预算管理功能！', '系统管理员', 1746626369000, '系统消息', 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (16, 'test12', 'test content', '系统管理员', 1746627779204, '系统消息', 1, 1746627779204, 1746628262404, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (17, 'test1112', 'test 111111', '系统管理员', 1746628275951, '系统消息', 1, 1746628275951, 1746628282253, 1);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (18, 'tttt111', 'ttttt222', '系统管理员', 1746630131938, '系统消息', 1, 1746630131938, 1746630142236, 1);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (19, 'aaaa', 'absdaf', '系统管理员', 1746710585229, '系统消息', 1, 1746710585229, 1746710585229, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (20, 'test222', 'test222', '系统管理员', 1747019148503, '系统消息', 1, 1747019148503, 1747019148503, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (21, '【系统公告】今晚8点更新', '【系统公告】今晚8点更新', '系统管理员', 1747664871279, NULL, 1, 1747664871279, 1747664871279, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (22, '【系统消息】欢迎使用AMS系统', '欢迎使用本系统！', '系统管理员', 1747667538392, NULL, 1, 1747667538392, 1747667538392, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (23, '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '系统管理员', 1747668105841, NULL, 1, 1747668105841, 1747668105841, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (24, '【系统更新】今晚11点更新', '【系统更新】今晚11点更新', 'admin', 1748175571285, NULL, 1, 1748175571285, 1748175571285, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `type`, `version`, `create_date`, `update_date`, `deleted`) VALUES (25, '测试消息', '测试消息', '系统管理员', 1748352911344, NULL, 1, 1748352911344, 1748352911344, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `h_message_receiver`;
CREATE TABLE `h_message_receiver` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `message_id` bigint NOT NULL COMMENT '消息ID',
  `user_id` bigint NOT NULL COMMENT '接收用户ID',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态：0-正常，1-已读, 2-回收站',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1927357919997702147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息接收记录表';

-- ----------------------------
-- Records of h_message_receiver
-- ----------------------------
BEGIN;
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505086148610, 19, 1897630015512547329, 1, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505086148611, 19, 1898257421470494721, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505086148612, 19, 1898257629201788929, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505086148613, 19, 1898258120480616450, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505086148614, 19, 1898312658545778690, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505090342914, 19, 1908467995296985090, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505090342915, 19, 1908471088071897089, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505090342916, 19, 1908480162679287810, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537217, 19, 1912050960380383234, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537218, 19, 1917576896571314178, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537219, 19, 1917577780013338625, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537220, 19, 1917844358466453506, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537221, 19, 1917846652826238977, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537222, 19, 1918659054115323905, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505094537223, 19, 1918826227513229314, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505098731522, 19, 6119170176878989095, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1920469505098731523, 19, 6706720622553003629, 0, 1, 1746710585263, 1746710585263, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714258993153, 20, 1897630015512547329, 2, 1, 1747019148648, 1747019148648, 1);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714334490626, 20, 1898257421470494721, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714338684930, 20, 1898257629201788929, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714342879233, 20, 1898258120480616450, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714347073537, 20, 1898312658545778690, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714351267841, 20, 1908467995296985090, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714355462146, 20, 1908471088071897089, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714363850754, 20, 1908480162679287810, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714363850755, 20, 1912050960380383234, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714368045057, 20, 1917576896571314178, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714368045058, 20, 1917577780013338625, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714368045059, 20, 1917844358466453506, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714372239361, 20, 1917846652826238977, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714372239362, 20, 1918659054115323905, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714384822273, 20, 1918826227513229314, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714384822274, 20, 1920830621851144193, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714397405186, 20, 1921512565949644801, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714414182401, 20, 6119170176878989095, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1921763714414182402, 20, 6706720622553003629, 0, 1, 1747019148648, 1747019148648, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070752747521, 21, 1897630015512547329, 1, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070752747522, 21, 1898257421470494721, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941825, 21, 1898257629201788929, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941826, 21, 1898258120480616450, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941827, 21, 1898312658545778690, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941828, 21, 1908467995296985090, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941829, 21, 1908471088071897089, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941830, 21, 1908480162679287810, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941831, 21, 1912050960380383234, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070756941832, 21, 1917576896571314178, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136129, 21, 1917577780013338625, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136130, 21, 1917844358466453506, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136131, 21, 1917846652826238977, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136132, 21, 1918659054115323905, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136133, 21, 1918826227513229314, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136134, 21, 1920830621851144193, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136135, 21, 1921512565949644801, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136136, 21, 1921847830786637826, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136137, 21, 6119170176878989095, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924472070761136138, 21, 6706720622553003629, 0, 1, 1747664871286, 1747664871286, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257490018306, 22, 1897630015512547329, 1, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257490018307, 22, 1898257421470494721, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257490018308, 22, 1898257629201788929, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257494212610, 22, 1898258120480616450, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257494212611, 22, 1898312658545778690, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257498406914, 22, 1908467995296985090, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257498406915, 22, 1908471088071897089, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257502601217, 22, 1908480162679287810, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257502601218, 22, 1912050960380383234, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257502601219, 22, 1917576896571314178, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257502601220, 22, 1917577780013338625, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257506795522, 22, 1917844358466453506, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257506795523, 22, 1917846652826238977, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257506795524, 22, 1918659054115323905, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257506795525, 22, 1918826227513229314, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257510989826, 22, 1920830621851144193, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257510989827, 22, 1921512565949644801, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257510989828, 22, 1921847830786637826, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257510989829, 22, 6119170176878989095, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924483257515184129, 22, 6706720622553003629, 0, 1, 1747667538405, 1747667538405, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637480714242, 23, 1897630015512547329, 2, 1, 1747668105846, 1747668105846, 1);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637480714243, 23, 1898257421470494721, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637480714244, 23, 1898257629201788929, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637480714245, 23, 1898258120480616450, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908546, 23, 1898312658545778690, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908547, 23, 1908467995296985090, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908548, 23, 1908471088071897089, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908549, 23, 1908480162679287810, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908550, 23, 1912050960380383234, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637484908551, 23, 1917576896571314178, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102850, 23, 1917577780013338625, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102851, 23, 1917844358466453506, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102852, 23, 1917846652826238977, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102853, 23, 1918659054115323905, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102854, 23, 1918826227513229314, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637489102855, 23, 1920830621851144193, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637497491458, 23, 1921512565949644801, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637497491459, 23, 1921847830786637826, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637497491460, 23, 6119170176878989095, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1924485637497491461, 23, 6706720622553003629, 0, 1, 1747668105846, 1747668105846, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101925003265, 24, 1897630015512547329, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101933391873, 24, 1898257421470494721, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101933391874, 24, 1898257629201788929, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101933391875, 24, 1898258120480616450, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101933391876, 24, 1898312658545778690, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101937586177, 24, 1908467995296985090, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101937586178, 24, 1908471088071897089, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101941780481, 24, 1908480162679287810, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101941780482, 24, 1912050960380383234, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101945974786, 24, 1917576896571314178, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101945974787, 24, 1917577780013338625, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101945974788, 24, 1917844358466453506, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101945974789, 24, 1917846652826238977, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101971140610, 24, 1918659054115323905, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101975334913, 24, 1918826227513229314, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101975334914, 24, 1920830621851144193, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101979529218, 24, 1921512565949644801, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101979529219, 24, 1921847830786637826, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101979529220, 24, 6119170176878989095, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1926614101979529221, 24, 6706720622553003629, 0, 1, 1748175571302, 1748175571302, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919976730625, 25, 1897630015512547329, 1, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919980924930, 25, 1898257421470494721, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919980924931, 25, 1898257629201788929, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919980924932, 25, 1898258120480616450, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919985119233, 25, 1898312658545778690, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919985119234, 25, 1908467995296985090, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919985119235, 25, 1908471088071897089, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919985119236, 25, 1908480162679287810, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313537, 25, 1912050960380383234, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313538, 25, 1917576896571314178, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313539, 25, 1917577780013338625, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313540, 25, 1917844358466453506, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313541, 25, 1917846652826238977, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919989313542, 25, 1918659054115323905, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919993507841, 25, 1918826227513229314, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919993507842, 25, 1920830621851144193, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919993507843, 25, 1921512565949644801, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919993507844, 25, 1921847830786637826, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919993507845, 25, 6119170176878989095, 0, 1, 1748352911353, 1748352911353, 0);
INSERT INTO `h_message_receiver` (`id`, `message_id`, `user_id`, `status`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1927357919997702146, 25, 6706720622553003629, 0, 1, 1748352911353, 1748352911353, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_permission
-- ----------------------------
DROP TABLE IF EXISTS `h_permission`;
CREATE TABLE `h_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限';

-- ----------------------------
-- Records of h_permission
-- ----------------------------
BEGIN;
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '查看资产', 'asset', 'asset', 0, 0, 'asset:view', 1, '#', '查看资产', '0001', 1, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '管理资产', 'asset', 'asset', 0, 0, 'asset:manage', 1, '#', '管理资产', '0002', 2, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '查看预算', 'budget', 'budget', 0, 0, 'budget:view', 1, '#', '查看预算', '0003', 3, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '管理预算', 'budget', 'budget', 0, 0, 'budget:manage', 1, '#', '管理预算', '0004', 4, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '查看部门', 'department', 'department', 0, 0, 'department:view', 1, '#', '查看部门', '0005', 5, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '管理部门', 'department', 'department', 0, 0, 'department:manage', 1, '#', '管理部门', '0006', 6, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '查看值班', 'duty', 'duty', 0, 0, 'duty:view', 1, '#', '查看值班', '0007', 7, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '管理值班', 'duty', 'duty', 0, 0, 'duty:manage', 1, '#', '管理值班', '0008', 8, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '查看消息', 'message', 'message', 0, 0, 'message:view', 1, '#', '查看消息', '0009', 9, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '管理消息', 'message', 'message', 0, 0, 'message:manage', 1, '#', '管理消息', '0010', 10, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '查看角色', 'role', 'role', 0, 0, 'role:view', 1, '#', '查看角色', '0011', 11, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '管理角色', 'role', 'role', 0, 0, 'role:manage', 1, '#', '管理角色', '0012', 12, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '查看团队', 'team', 'team', 0, 0, 'team:view', 1, '#', '查看团队', '0013', 13, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '管理团队', 'team', 'team', 0, 0, 'team:manage', 1, '#', '管理团队', '0014', 14, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '查看用户', 'user', 'user', 0, 0, 'user:view', 1, '#', '查看用户', '0015', 15, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '管理用户', 'user', 'user', 0, 0, 'user:manage', 1, '#', '管理用户', '0016', 16, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '查看看板', 'dashboard', 'dashboard', 0, 0, 'dashboard:view', 1, '#', '查看看板', '0017', 17, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '管理看板', 'dashboard', 'dashboard', 0, 0, 'dashboard:manage', 1, '#', '管理看板', '0018', 18, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '查看系统', 'system', 'system', 0, 0, 'system:view', 1, '#', '查看系统', '0019', 19, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '管理系统', 'system', 'system', 0, 0, 'system:manage', 1, '#', '管理系统', '0020', 20, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '查看设置', 'setting', 'setting', 0, 0, 'setting:view', 1, '#', '查看设置', '0021', 21, 1, 20230304112742, NULL, 0);
INSERT INTO `h_permission` (`id`, `name`, `path`, `component`, `visible`, `status`, `permission`, `type`, `icon`, `description`, `code`, `sort`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '管理设置', 'setting', 'setting', 0, 0, 'setting:manage', 1, '#', '管理设置', '0022', 22, 1, 20230304112742, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_role
-- ----------------------------
DROP TABLE IF EXISTS `h_role`;
CREATE TABLE `h_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  `sort` int unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `permission_id` bigint DEFAULT NULL COMMENT '权限ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色权限关联';

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
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, 1, 10, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, 1, 11, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, 1, 12, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 1, 13, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, 1, 14, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 1, 15, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, 1, 16, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, 1, 17, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, 1, 18, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, 1, 19, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, 1, 20, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, 1, 21, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, 1, 22, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 2, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, 2, 2, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, 2, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, 2, 4, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, 2, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, 2, 6, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (29, 2, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (30, 2, 8, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (31, 2, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (32, 2, 10, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (33, 2, 11, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (34, 2, 12, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (35, 2, 13, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (36, 2, 14, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (37, 2, 15, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (38, 2, 16, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (39, 2, 17, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (40, 2, 18, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (41, 2, 19, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (42, 2, 20, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (43, 2, 21, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (44, 2, 22, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (45, 4, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (46, 4, 2, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (47, 4, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (48, 4, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (49, 4, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (50, 4, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (51, 4, 11, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (52, 4, 13, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (53, 4, 15, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (54, 4, 17, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (55, 4, 19, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (56, 4, 21, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (57, 8, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (58, 8, 2, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (59, 8, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (60, 8, 5, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (61, 8, 7, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (62, 8, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (63, 8, 11, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (64, 8, 13, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (65, 8, 15, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (66, 8, 17, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (67, 8, 19, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (68, 8, 21, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (69, 16, 1, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (70, 16, 3, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (71, 16, 9, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (72, 16, 11, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (73, 16, 13, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (74, 16, 15, 1, 20230304112751, NULL, 0);
INSERT INTO `h_role_permission` (`id`, `role_id`, `permission_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (75, 16, 17, 1, 20230304112751, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_team
-- ----------------------------
DROP TABLE IF EXISTS `h_team`;
CREATE TABLE `h_team` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) NOT NULL COMMENT '团队名称',
  `description` varchar(255) DEFAULT NULL COMMENT '团队描述',
  `leader_id` bigint DEFAULT NULL COMMENT '团队负责人ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_team
-- ----------------------------
BEGIN;
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, '未指定', '未指定', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '核心开发', '核心开发', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '外围开发', '外围开发', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '管理系统', '管理系统', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '电子银行', '电子银行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '信息安全', '信息安全', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '设备运行', '设备运行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '网络通讯', '网络通讯', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '生产运行', '生产运行', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '应用维护', '应用维护', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '数据中心', '数据中心', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '测试', '测试', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, 'PMO', 'PMO', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '人力', '人力', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, '新核心', '新核心', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '其他', '其他', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '未指定', '未指定', 1897630015512547329, 1, NULL, NULL, 0);
INSERT INTO `h_team` (`id`, `name`, `description`, `leader_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '未指定', '未指定', 1897630015512547329, 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_user
-- ----------------------------
DROP TABLE IF EXISTS `h_user`;
CREATE TABLE `h_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=6706720622553003630 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户';

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
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1920830621851144193, NULL, 'user17', '$2a$10$wML7uRsytNTKd6pTVlfsoebcz7K9i6x8LfRx4Sj/hoGJZw79gIxDG', '958219', NULL, NULL, NULL, NULL, NULL, 'user17@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746796682214, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1921512565949644801, NULL, 'user20', '$2a$10$4QbD76M2dIFqZFm.obsryeQtAN1teOq0ksCaI4tTuU1UL3v.87m2W', '225594', NULL, NULL, NULL, NULL, NULL, 'user20@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1746959270357, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1921847830786637826, NULL, 'manager', '$2a$10$9J79Bp6.QmZEJK1QWZd5CubPKYQMUocfL71iYeVIduhEgujdVoMd.', '995133', NULL, NULL, NULL, NULL, NULL, 'manager@gmail.com', NULL, 0, 0, 0, NULL, NULL, NULL, 1, 1747039203730, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6119170176878989095, 'user16', 'user16', '$2a$10$H4ZBCBnFX4KZzN6ed04v5.tPnBXY5cXRk0hVLVMVlsVnCUjbaSqpq', '7eUAOY', NULL, NULL, '13500006666', '', NULL, 'user16@gmail.com', 32, 0, 0, 1, NULL, NULL, NULL, 1, 1746368271947, NULL, 0);
INSERT INTO `h_user` (`id`, `name`, `username`, `password`, `salt`, `gender`, `id_card`, `phone`, `avatar`, `age`, `email`, `department_id`, `status`, `is_lock`, `is_active`, `last_login_time`, `last_login_ip`, `address`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6706720622553003629, 'user15', 'user15', '$2a$10$9j5O2dI86Pj5Q3eWYqlX7.XrLnvyFDwBav5skjDsFcwHJfpGa9olq', 'WwdQvq', NULL, NULL, '13500005555', '', NULL, 'user15@gmail.com', 32, 1, 0, 1, NULL, NULL, NULL, 1, 1746327944869, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for h_user_role
-- ----------------------------
DROP TABLE IF EXISTS `h_user_role`;
CREATE TABLE `h_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_time` bigint DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9073155160205823332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, 1921847830786637826, 2, 1, 1747039203774, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, 1920830621851144193, 8, 1, 1746796682220, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, 6706720622553003629, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, 6706720622553003629, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (25, 1918826227513229314, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (26, 1908471088071897089, 4, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (27, 1908471088071897089, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (28, 6119170176878989095, 8, 1, NULL, NULL, 0);
INSERT INTO `h_user_role` (`id`, `user_id`, `role_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (29, 1921512565949644801, 8, 1, 1746959270362, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
