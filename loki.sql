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

 Date: 08/05/2025 20:56:28
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
  `location` varchar(255) DEFAULT NULL COMMENT '存放地点',
  `status` varchar(255) NOT NULL COMMENT '状态 正常 报废 维修',
  `use_status` varchar(255) DEFAULT NULL COMMENT '使用状态',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of h_asset
-- ----------------------------

BEGIN;
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 'Dell电脑', 'DELL-2025', 1, 1, '科技部', '正常', 1672531200000, 12000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (2, '服务器', 'IP14-2023', 2, 1, '科技部', '正常', 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (3, '交换机', 'DXPS-2023', 3, 2, '会议室', '正常', 1672531200000, 10000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (4, '路由器', 'RTP-2023', 4, 14, '科技部', '正常', 1672416000000, 5000.00, 2, 1, 1672531200000, 1744889852678, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (5, '打印机', 'PRT-2023', 5, 5, '科技部', '正常', 1732550400000, 3000.00, 2, 1, 1672531200000, 1744889864320, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (6, '显示器', 'MON-2023', 6, 7, '科技部', '正常', 1672502400000, 2000.00, 2, 1, 1672531200000, 1744807745404, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (7, '手机', 'IPHONE-2023', 7, 4, '科技部', '正常', 1672531200000, 8000.00, 10, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (8, '平板', 'IPAD-2023', 8, 4, '科技部', '正常', 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (9, '投影仪', 'PJT-2023', 9, 5, '会议室', '正常', 1672531200000, 7000.00, 2, 1, 1672531200000, 1744889770344, 1);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (10, '音响', 'SPK-2023', 10, 5, '会议室', '正常', 1672531200000, 4000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (11, '摄像头', 'CAM-2023', 11, 6, '科技部', '正常', 1672531200000, 1500.00, 3, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (12, '监控设备', 'CCTV-2023', 12, 6, '科技部', '正常', 1672531200000, 5000.00, 2, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (13, '门禁设备', 'ACD-2023', 13, 7, '科技部', '正常', 1672531200000, 3000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (14, '考勤机', 'AT-2023', 14, 7, '科技部', '正常', 1672531200000, 2000.00, 1, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (15, 'UPS', 'UPS-2025', 15, 8, '科技部', '正常', 1672502400000, 2500.00, 2, 1, 1672531200000, 1744298662338, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (16, '电源线', 'CABLE-2023', 16, 8, '科技部', '正常', 1672531200000, 100.00, 20, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (17, '网线', 'LAN-2023', 17, 9, '科技部', '正常', 1672531200000, 50.00, 30, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (18, '鼠标', 'MOUSE-2023', 18, 9, '科技部', '正常', 1672531200000, 200.00, 10, 1, 1672531200000, 1744288245023, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (19, '键盘', 'KEYBOARD-2023', 19, 10, '科技部', '正常', 1672531200000, 300.00, 5, 1, 1672531200000, 1744288235878, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (20, '传真机', 'FAX-2023', 20, 10, '科技部', '正常', 1672531200000, 1500.00, 2, 1, 1672531200000, 1744288248700, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (21, '办公设备', 'OFFICE-2023', 21, 11, '科技部', '正常', 1672531200000, 500.00, 10, 1, 1672531200000, 1744288252268, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (22, '电脑', 'PC-2023', 22, 11, '科技部', '正常', 1672531200000, 6000.00, 5, 1, 1672531200000, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (23, '服务器机柜', 'RACK-2023', 23, 12, '科技部', '正常', 1672502400000, 2000.00, 2, 1, 1672531200000, 1744890093637, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (24, '机房空调', 'AC-2023', 24, 8, '机房', '报废', 1671984000000, 8000.00, 3, 1, 1672531200000, 1744890388422, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910322874336444417, '测试资产1', 'TEST-2025-1', 1, 1, NULL, '维修', 1743436800000, 111.00, 2, 1, 1744291439982, 1744890393129, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910323327828807681, '测试资产12', 'TEST-2025-12', 1, 1, NULL, '正常', 1744128000000, 22.00, 23, 1, 1744291548104, 1744298088266, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910324022036410369, '测试资产13', 'TEST-2025-13', 1, 1, NULL, '正常', 1744214400000, 22.00, 23, 1, 1744291713615, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910328673377009666, '测试资产122', 'TEST-2025-122', 1, 1, NULL, '正常', 1744214400000, 21231.00, 11, 1, 1744292822581, 1744298423305, 1);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910338981256560641, '测试资产134', 'TEST-2025-134', 1, 1, NULL, '正常', 1744214400000, 1111.00, 22, 1, 1744295280172, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910342483366170626, '测试资产1222', 'TEST-2025-1222', 1, 1, NULL, '正常', 1744214400000, 222.00, 22, 1, 1744296115139, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910344710797488129, '测试资产144', 'TEST-2025-14', 1, 1, NULL, '正常', 1744041600000, 4442.00, 11, 1, 1744296646201, 1744889878520, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910352072333651970, '测试资产166', 'TEST-2025-16', 4, 1, NULL, '正常', 1744214400000, 666.00, 6, 1, 1744298401327, NULL, 0);
INSERT INTO `h_asset` (`id`, `name`, `code`, `type`, `department_id`, `location`, `status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1910354939274653697, '测试资产17', 'TEST-2025-17', 1, 1, NULL, '正常', 1744214400000, 7.00, 7, 1, 1744299084859, 1744299099146, 1);
INSERT INTO `loki`.`h_asset` (`id`, `name`, `code`, `sn`, `type`, `model`, `config`, `ip`, `description`, `provider`, `department_id`, `location`, `status`, `use_status`, `purchase_date`, `purchase_price`, `count`, `version`, `create_time`, `update_time`, `deleted`) VALUES
(101, 'Dell电脑', 'GM39V34', 'SBZCO104202407010072', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(102, 'Dell电脑', 'C4PH4Y3', 'SBZC0104202407010135', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(103, 'Dell电脑', 'DAPH4Y3', 'SBZC0104202407010131', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(104, 'Dell电脑', '2N39V34', 'SBZC0104202407010101', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(105, 'Dell电脑', '3Q39V34', 'SBZC0104202407010103', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(106, 'Dell电脑', '94PH4Y3', 'SBZC0104202407010128', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(107, 'Dell电脑', 'B4PH4Y3', 'SBZC0104202407010126', 2, 'OptiPlex 3000(i3)', 'Corei3', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(108, 'Dell电脑', '9N39V34', 'SBZC0104202407010076', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0),
(109, 'Dell电脑', '6P39V34', 'SBZC0104202407010077', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0),
(110, 'Dell电脑', 'HP39V34', 'SBZC0104202407010056', 2, 'OptiPlex 7010BTX(i5)', 'Corei5', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0),
(111, '显示器', 'CN-O8NDHH-FCC00-35N-D88X-A03', 'SBZC0104202408130135', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(112, '显示器', 'CN-O8NDHH-FCC00-35N-D89X-A03', 'SBZC0104202408130132', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(113, '显示器', 'CN-OSNDHH-FCC00-35N-D8DX-AO3', 'SBZC0104202408130124', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(114, '显示器', 'CN-08NDHH-FCC00-44N-D7UX-A03', 'SBZC0104202408130125', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1, 1, 1672531200000, 1746883000426, 0),
(115, '显示器', 'CN-O8NDHH-FCC00-44N-ARWX-AO4', 'SBZC0104202408130050', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(116, '显示器', 'CN-08NDHH-FCC00-44N-DD5X-AO4', 'SBZC0104202408130049', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(117, '显示器', 'CN-O8NDHH-FCC00-44N-DD2X-AO4', 'SBZC0104202408130052', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000, 0, 1 ,1 ,1672531200000 ,1746883000426 ,0),
(118, '显示器', 'CN-O8NDHH-FCC00-44N-DCFX-AO4', 'SBZC0104202408130051', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0),
(119, '显示器', 'CN-O8NDHH-FCC00-35N-DA2X-AO3', 'SBZC0104202408130123', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0),
(120, '显示器', 'CN-O8NDHH-FCC00-44N-ATDX-A04', 'SBZC0104202408130101', 3, 'E2222H', '23寸', '', '', 'Dell', 32, '信息科技部-信悦汇15楼', '正常', 0, 1672243200000 ,0 ,1 ,1 ,1672531200000 ,1746883000426 ,0);

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
INSERT INTO `h_budget` (`id`, `year`, `name`, `description`, `type`, `category`, `is_inno`, `amount`, `department_id`, `team_id`, `priority`, `business_priority`, `business_description`, `planned_start_date`, `remark`, `status`, `applicant_id`, `version`, `create_time`, `update_time`, `deleted`) VALUES (1, 2025, '新核心系统建设', '根据人民银行金融信息技术应用创新（信创）工作要求，……', 2, '1', 0, 231371112.00, 32, 0, '0', '0', NULL, 1743523200000, '备注', 0, NULL, 1, NULL, 1746545826065, 0);
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
-- Table structure for h_message
-- ----------------------------
DROP TABLE IF EXISTS `h_message`;
CREATE TABLE `h_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `sender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送者',
  `send_time` bigint DEFAULT NULL COMMENT '发送时间',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息表';

-- ----------------------------
-- Records of h_message
-- ----------------------------
BEGIN;
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (1, '【系统消息】欢迎使用AMS系统', '欢迎使用本系统！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (2, '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (3, '【系统公告】AMS系统已上线', 'AMS系统已上线，欢迎使用！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (4, '【系统消息】请及时更新您的个人信息', '请及时更新您的个人信息，以便我们更好地为您服务。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (5, '【系统通知】系统将于下周一进行例行维护', '系统将于下周一进行例行维护，请提前做好准备。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (6, '【系统公告】AMS系统已完成升级', 'AMS系统已完成升级，感谢您的耐心等待！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (7, '【系统消息】今晚零点整发跨年红包，各位小伙伴兔年大吉，先到先得', '今晚零点整发跨年红包，各位小伙伴兔年大吉，先到先得。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (8, '【系统通知】系统将于本周五进行数据备份', '系统将于本周五进行数据备份，请提前做好准备。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (9, '【系统公告】新年红包已发放完毕，感谢各位小伙伴的参与', '新年红包已发放完毕，感谢各位小伙伴的参与！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (10, '【系统消息】预祝各位小伙伴新年快乐', '预祝各位小伙伴新年快乐', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (11, '【系统通知】系统将于下周一进行例行维护', '系统将于下周一进行例行维护，请提前做好准备。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (12, '【系统公告】AMS系统已完成升级', 'AMS系统已完成升级，感谢您的耐心等待！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (13, '【系统消息】请及时更新您的个人信息', '请及时更新您的个人信息，以便我们更好地为您服务。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (14, '【系统通知】系统将于今晚凌晨1点到3点进行升级维护', '系统将于今晚凌晨1点到3点进行升级维护，请提前做好准备。', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (15, '【系统公告】AMS系统更新完成，新增预算管理功能！', 'AMS系统更新完成，新增预算管理功能！', '系统管理员', 1746626369000, 1, 1746626369000, 1746626369000, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (16, 'test12', 'test content', '系统管理员', 1746627779204, 1, 1746627779204, 1746628262404, 0);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (17, 'test1112', 'test 111111', '系统管理员', 1746628275951, 1, 1746628275951, 1746628282253, 1);
INSERT INTO `h_message` (`id`, `title`, `content`, `sender`, `send_time`, `version`, `create_date`, `update_date`, `deleted`) VALUES (18, 'tttt111', 'ttttt222', '系统管理员', 1746630131938, 1, 1746630131938, 1746630142236, 1);
COMMIT;

-- ----------------------------
-- Table structure for h_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `h_message_receiver`;
CREATE TABLE `h_message_receiver` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `message_id` bigint NOT NULL COMMENT '消息ID',
  `user_id` bigint NOT NULL COMMENT '接收用户ID',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读：0-未读，1-已读',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0-正常，1-已删除',
  `read_time` bigint DEFAULT NULL COMMENT '阅读时间',
  `version` int DEFAULT '1' COMMENT '版本号',
  `create_date` bigint DEFAULT NULL COMMENT '创建日期',
  `update_date` bigint DEFAULT NULL COMMENT '更新日期',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息接收记录表';

-- ----------------------------
-- Records of h_message_receiver
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

SET FOREIGN_KEY_CHECKS = 1;
