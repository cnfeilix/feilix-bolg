/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : blog

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 03/25/2018 17:24:28 PM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) DEFAULT NULL COMMENT 'snowflake-id',
  `title` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '笔记标题',
  `text_md` mediumtext COLLATE utf8mb4_bin COMMENT '笔记正文markdown',
  `render_type` tinyint(1) DEFAULT NULL COMMENT '渲染类型，1editor-md',
  `text_html` mediumtext COLLATE utf8mb4_bin COMMENT '笔记正文html',
  `marks` int(11) DEFAULT NULL COMMENT '使用位运算来设置标签组合，每个标签的值应该设置为2的幂数（n=1...N），或运算表示包含，异或运算表示排除',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态，使用位运算，比如公开，保密等',
  `creator` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `modifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `modify_dt` datetime DEFAULT NULL,
  `latest_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reocrd_version` int(11) DEFAULT '0' COMMENT '乐观锁版本控制',
  `is_deleted` tinyint(255) DEFAULT '0' COMMENT '是否已删除，0未删除，1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='笔记表';

SET FOREIGN_KEY_CHECKS = 1;
