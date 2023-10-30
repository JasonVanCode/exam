/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 100605 (10.6.5-MariaDB-1:10.6.5+maria~focal)
 Source Host           : 127.0.0.1:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 100605 (10.6.5-MariaDB-1:10.6.5+maria~focal)
 File Encoding         : 65001

 Date: 27/10/2023 16:05:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  `v6` varchar(25) DEFAULT NULL,
  `v7` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`,`v6`,`v7`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_exam`;
CREATE TABLE `el_exam` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
  `open_type` int(11) NOT NULL DEFAULT 1 COMMENT '1公开2部门3定员',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '考试状态',
  `time_limit` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否限时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `total_score` int(11) NOT NULL DEFAULT 0 COMMENT '总分数',
  `total_time` int(11) NOT NULL DEFAULT 0 COMMENT '总时长（分钟）',
  `qualify_score` int(11) NOT NULL DEFAULT 0 COMMENT '及格分数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `open_type` (`open_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试主表';

-- ----------------------------
-- Records of el_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, '11', '11', 2, 0, 1, '2023-05-07 11:00:00', '2023-05-07 12:00:00', 18, 20, 10, '2023-05-07 11:10:30', '2023-05-07 11:10:30', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, '22', '2222', 2, 0, 1, '2023-05-07 00:00:00', '2023-05-07 23:00:00', 14, 50, 10, '2023-05-07 12:23:18', '2023-05-07 12:23:18', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, '333333', '333333', 2, 0, 1, '2023-05-23 00:00:00', '2023-05-29 00:00:00', 20, 100, 10, '2023-05-25 12:44:16', '2023-05-25 12:54:34', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, '测试测试', '测试测试', 2, 0, 1, '2023-05-24 00:00:00', '2023-05-27 00:00:00', 100, 200, 60, '2023-05-25 15:12:27', '2023-05-25 17:21:13', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, '1123', '1221321', 2, 0, 1, '2023-05-25 11:44:17', '2023-05-25 23:44:19', 7, 300, 3, '2023-05-25 15:44:26', '2023-05-25 15:48:25', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, '测试212222222222', '测试212222222222', 2, 0, 1, '2023-05-24 00:00:00', '2023-06-01 00:00:00', 80, 100, 60, '2023-05-25 17:23:56', '2023-05-30 16:29:17', NULL);
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `time_limit`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, '2023-06-03', '2023-06-03', 2, 0, 1, '2023-06-02 00:00:00', '2023-06-10 00:00:00', 40, 100, 20, '2023-06-03 12:09:31', '2023-06-03 12:09:31', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_exam_depart
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_depart`;
CREATE TABLE `el_exam_depart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exam_id` int(11) NOT NULL COMMENT '考试ID',
  `depart_id` int(11) NOT NULL COMMENT '部门ID',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE,
  KEY `depart_id` (`depart_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试部门';

-- ----------------------------
-- Records of el_exam_depart
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 35, 10, '2023-05-07 11:10:30', '2023-05-07 11:10:30', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 36, 10, '2023-05-07 12:23:18', '2023-05-07 12:23:18', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 39, 10, '2023-05-25 12:40:25', '2023-05-25 12:40:25', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 40, 10, '2023-05-25 12:54:34', '2023-05-25 12:54:34', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 44, 10, '2023-05-25 15:48:25', '2023-05-25 15:48:25', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 42, 8, '2023-05-25 17:21:13', '2023-05-25 17:21:13', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 45, 9, '2023-05-30 16:29:17', '2023-05-30 16:29:17', NULL);
INSERT INTO `el_exam_depart` (`id`, `exam_id`, `depart_id`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 46, 10, '2023-06-03 12:09:31', '2023-06-03 12:09:31', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_exam_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_repo`;
CREATE TABLE `el_exam_repo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exam_id` int(11) NOT NULL COMMENT '考试ID',
  `repo_id` int(11) NOT NULL COMMENT '题库ID',
  `radio_count` int(11) NOT NULL DEFAULT 0 COMMENT '单选题数量',
  `radio_score` int(11) NOT NULL DEFAULT 0 COMMENT '单选题分数',
  `multi_count` int(11) NOT NULL DEFAULT 0 COMMENT '多选题数量',
  `multi_score` int(11) NOT NULL DEFAULT 0 COMMENT '多选题分数',
  `judge_count` int(11) NOT NULL DEFAULT 0 COMMENT '判断题数量',
  `judge_score` int(11) NOT NULL DEFAULT 0 COMMENT '判断题分数',
  `saq_count` int(11) NOT NULL DEFAULT 0 COMMENT '简答题数量',
  `saq_score` int(11) NOT NULL DEFAULT 0 COMMENT '简答题分数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `total_judge` int(11) DEFAULT 0,
  `total_multi` int(11) DEFAULT 0,
  `total_radio` int(11) DEFAULT 0,
  `total_oper` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`) USING BTREE,
  KEY `rule_id` (`exam_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试题库';

-- ----------------------------
-- Records of el_exam_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (16, 17, 3, 1, 50, 1, 0, 0, 0, 0, 0, '2023-04-22 08:45:09', '2023-04-22 08:45:09', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (17, 18, 6, 1, 50, 1, 0, 0, 0, 0, 0, '2023-04-22 09:57:09', '2023-04-22 09:57:09', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (18, 19, 17, 1, 50, 1, 0, 0, 0, 0, 0, '2023-04-22 10:04:15', '2023-04-22 10:04:15', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (20, 21, 19, 1, 50, 1, 50, 0, 0, 0, 0, '2023-04-22 13:42:58', '2023-04-22 13:42:58', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (21, 20, 19, 1, 50, 1, 50, 0, 0, 0, 0, '2023-04-22 13:44:49', '2023-04-22 13:44:49', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (22, 22, 6, 1, 50, 1, 50, 0, 0, 0, 0, '2023-04-22 13:58:37', '2023-04-22 13:58:37', NULL, 0, 1, 1, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (36, 35, 8, 4, 3, 0, 0, 0, 0, 2, 3, '2023-05-07 11:10:30', '2023-05-07 11:10:30', NULL, 0, 0, 4, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (37, 36, 8, 4, 2, 0, 0, 0, 0, 2, 3, '2023-05-07 12:23:18', '2023-05-07 12:23:18', NULL, 0, 0, 4, NULL);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (53, 39, 49, 1, 10, 0, 0, 0, 0, 1, 10, '2023-05-25 12:40:25', '2023-05-25 12:40:25', NULL, 0, 0, 4, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (54, 39, 7, 1, 10, 0, 0, 0, 0, 1, 10, '2023-05-25 12:40:25', '2023-05-25 12:40:25', NULL, 0, 0, 4, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (57, 40, 7, 1, 10, 0, 0, 0, 0, 1, 10, '2023-05-25 12:54:34', '2023-05-25 12:54:34', NULL, 0, 0, 4, 1);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (61, 44, 60, 4, 1, 0, 0, 0, 0, 3, 1, '2023-05-25 15:48:25', '2023-05-25 15:48:25', NULL, 0, 0, 4, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (64, 42, 63, 2, 20, 0, 0, 0, 0, 2, 30, '2023-05-25 17:21:13', '2023-05-25 17:21:13', NULL, 0, 0, 4, 2);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (69, 45, 7, 2, 20, 0, 0, 0, 0, 2, 20, '2023-05-30 16:29:17', '2023-05-30 16:29:17', NULL, 0, 0, 4, 3);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`, `created_at`, `updated_at`, `deleted_at`, `total_judge`, `total_multi`, `total_radio`, `total_oper`) VALUES (70, 46, 7, 2, 20, 0, 0, 0, 0, 0, 0, '2023-06-03 12:09:31', '2023-06-03 12:09:31', NULL, 0, 0, 4, 3);
COMMIT;

-- ----------------------------
-- Table structure for el_paper
-- ----------------------------
DROP TABLE IF EXISTS `el_paper`;
CREATE TABLE `el_paper` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `exam_id` int(11) NOT NULL COMMENT '规则ID',
  `title` varchar(64) NOT NULL COMMENT '考试标题',
  `total_time` int(11) NOT NULL DEFAULT 0 COMMENT '考试时长',
  `user_time` int(11) NOT NULL DEFAULT 0 COMMENT '用户时长',
  `total_score` int(11) NOT NULL DEFAULT 0 COMMENT '试卷总分',
  `qualify_score` int(11) NOT NULL DEFAULT 0 COMMENT '及格分',
  `obj_score` int(11) NOT NULL DEFAULT 0 COMMENT '客观分',
  `subj_score` int(11) NOT NULL DEFAULT 0 COMMENT '主观分',
  `user_score` int(11) NOT NULL COMMENT '用户得分',
  `has_saq` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否包含简答题',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '试卷状态',
  `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试记录';

-- ----------------------------
-- Records of el_paper
-- ----------------------------
BEGIN;
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 1, '1', 1, '测试考试', 30, 0, 100, 60, 0, 0, 0, 0, 0, NULL, '2023-04-20 15:45:15', '2023-04-20 15:45:15', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 1, '1', 1, '测试考试', 30, 0, 100, 60, 0, 0, 0, 0, 0, NULL, '2023-04-21 20:52:14', '2023-04-21 20:52:14', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 1, '1', 1, '测试考试', 30, -567, 100, 60, 10, 10, 10, 0, 2, NULL, '2023-04-21 21:29:44', '2023-04-22 06:56:56', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 1, '1', 1, '测试考试', 30, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-22 08:57:36', '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 1, '1', 17, '考试_2022_04_22', 30, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-22 09:11:43', '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 1, '1', 17, '考试_2022_04_22', 30, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-22 09:26:44', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 1, '1', 17, '考试_2022_04_22', 30, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-22 09:32:18', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 1, '1', 23, '考试_2022_04_22_03', 100, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-22 14:06:41', '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 1, '1', 23, '考试_2022_04_22_03', 100, -25, 100, 50, 0, 0, 0, 0, 2, '2023-04-22 15:51:31', '2023-04-22 14:11:32', '2023-04-22 14:37:28', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 1, '1', 23, '考试_2022_04_22_03', 100, 2, 100, 50, 0, 0, 0, 0, 2, '2023-04-22 16:35:45', '2023-04-22 14:55:45', '2023-04-22 14:57:15', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 1, '1', 23, '考试_2022_04_22_03', 100, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-23 23:26:29', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 1, '1', 23, '考试_2022_04_22_03', 100, 0, 100, 50, 0, 0, 0, 0, 0, '2023-04-23 23:27:47', '2023-04-23 21:47:47', '2023-04-23 21:47:47', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 1, '1', 6, '123', 30, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-23 22:18:07', '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 1, '1', 6, '123', 30, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-23 22:18:18', '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 1, '1', 6, '123', 30, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-23 22:19:29', '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 1, '1', 6, '123', 30, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-23 22:20:07', '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 4, '10', 24, '2023_0424_01', 60, 1, 100, 100, 0, 0, 0, 0, 2, '2023-04-24 16:18:45', '2023-04-24 15:18:46', '2023-04-24 15:19:02', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 1, '1', 23, '考试_2022_04_22_03', 100, 2, 100, 50, 100, 100, 100, 0, 2, '2023-04-24 17:06:14', '2023-04-24 15:26:14', '2023-04-24 15:27:46', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 4, '10', 24, '2023_0424_01', 60, 1, 100, 100, 50, 50, 50, 0, 2, '2023-04-24 17:32:17', '2023-04-24 16:32:17', '2023-04-24 16:32:28', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 4, '10', 6, '123', 30, 30, 100, 60, 0, 0, 0, 0, 2, '2023-04-24 17:23:56', '2023-04-24 16:53:56', '2023-04-24 17:37:49', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 4, '10', 24, '2023_0424_01', 60, 1, 100, 100, 50, 50, 50, 0, 2, '2023-04-24 18:48:42', '2023-04-24 17:48:42', '2023-04-24 17:49:42', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 4, '10', 24, '2023_0424_01', 60, 1, 100, 100, 0, 0, 0, 0, 2, '2023-04-24 20:40:27', '2023-04-24 19:40:27', '2023-04-24 19:40:41', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 4, '10', 25, '考试_2023_04_46', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 12:56:35', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:19:28', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:22:14', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:30:50', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:32:19', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:33:58', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:34:37', '2023-04-26 11:54:37', '2023-04-26 11:54:37', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-26 13:35:11', '2023-04-26 11:55:11', '2023-04-26 11:55:11', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 1, '1', 27, '测试考试2023-04-26_03', 100, 73, 100, 60, 0, 0, 0, 0, 2, '2023-04-26 14:34:02', '2023-04-26 12:54:02', '2023-04-26 14:06:08', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 1, '1', 27, '测试考试2023-04-26_03', 100, 100, 100, 60, 25, 25, 25, 0, 2, '2023-04-26 16:50:16', '2023-04-26 15:10:17', '2023-04-26 19:30:21', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 1, '1', 27, '测试考试2023-04-26_03', 100, 6, 100, 60, 25, 25, 25, 0, 2, '2023-04-26 21:10:44', '2023-04-26 19:30:44', '2023-04-26 19:36:44', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-27 10:40:28', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 1, '1', 27, '测试考试2023-04-26_03', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-27 14:45:46', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 22, '10', 25, '考试_2023_04_46', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-04-27 17:20:36', '2023-04-27 15:40:36', '2023-04-27 15:40:36', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 31, '10', 34, '20230507-01', 1000, 0, 100, 60, 0, 0, 0, 0, 0, '2023-05-08 02:16:20', '2023-05-07 09:36:20', '2023-05-07 09:36:20', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 31, '10', 35, '11', 20, 0, 18, 10, 0, 0, 0, 0, 0, '2023-05-07 11:30:42', '2023-05-07 11:10:42', '2023-05-07 11:10:42', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 31, '10', 35, '11', 20, 0, 18, 10, 0, 0, 0, 0, 0, '2023-05-07 11:38:10', '2023-05-07 11:18:11', '2023-05-07 11:18:11', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 31, '10', 36, '22', 50, 0, 14, 10, 0, 0, 0, 0, 0, '2023-05-07 13:13:34', '2023-05-07 12:23:34', '2023-05-07 12:23:34', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 31, '10', 36, '22', 50, 0, 14, 10, 0, 0, 0, 0, 0, '2023-05-07 13:28:14', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 30, '10', 37, '11', 50, 0, 50, 30, 0, 0, 0, 0, 0, '2023-05-25 09:38:01', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 30, '10', 37, '11', 50, 0, 50, 30, 0, 0, 0, 0, 0, '2023-05-25 10:02:36', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 33, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 12:13:00', '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 30, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 12:32:09', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 30, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 12:45:37', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 33, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 13:13:11', '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 33, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 13:14:03', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 33, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 13:14:31', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 33, '10', 39, '23221111', 100, 0, 40, 20, 0, 0, 0, 0, 0, '2023-05-25 13:14:46', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 30, '10', 39, '23221111', 100, 0, 60, 20, 0, 0, 0, 0, 0, '2023-05-25 13:34:06', '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 30, '10', 40, '333333', 100, 0, 20, 10, 0, 0, 0, 0, 0, '2023-05-25 16:15:54', '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (63, 33, '10', 40, '333333', 100, 0, 20, 10, 0, 0, 0, 0, 0, '2023-05-25 16:27:04', '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (64, 34, '10', 40, '333333', 100, 17, 20, 10, 0, 0, 0, 0, 2, '2023-05-25 16:29:10', '2023-05-25 14:49:10', '2023-05-25 15:05:15', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (66, 34, '10', 42, '测试测试', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-05-25 16:54:50', '2023-05-25 15:14:50', '2023-05-25 15:14:50', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (69, 30, '10', 43, '11', 10, 10, 70, 10, 0, 0, 0, 0, 2, '2023-05-25 15:39:58', '2023-05-25 15:29:58', '2023-05-25 15:43:20', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (74, 30, '10', 44, '1123', 3, 3, 7, 3, 0, 0, 0, 0, 2, '2023-05-25 15:48:01', '2023-05-25 15:45:01', '2023-05-25 15:48:03', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (76, 35, '8', 42, '测试测试', 100, 0, 100, 60, 0, 0, 0, 0, 0, '2023-05-25 18:53:11', '2023-05-25 17:13:11', '2023-05-25 17:13:11', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (77, 37, '9', 45, '测试212222222222', 100, 0, 80, 60, 0, 0, 0, 0, 0, '2023-05-25 19:14:26', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (78, 37, '9', 45, '测试212222222222', 100, 0, 80, 60, 0, 0, 0, 0, 0, '2023-05-30 18:09:34', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper` (`id`, `user_id`, `depart_id`, `exam_id`, `title`, `total_time`, `user_time`, `total_score`, `qualify_score`, `obj_score`, `subj_score`, `user_score`, `has_saq`, `state`, `limit_time`, `created_at`, `updated_at`, `deleted_at`) VALUES (79, 38, '10', 46, '2023-06-03', 100, 1, 40, 20, 20, 20, 20, 0, 2, '2023-06-03 13:50:29', '2023-06-03 12:10:29', '2023-06-03 12:11:23', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu`;
CREATE TABLE `el_paper_qu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `qu_id` int(11) NOT NULL COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `answered` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已答',
  `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '问题排序',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '单题分分值',
  `actual_score` int(11) NOT NULL DEFAULT 0 COMMENT '实际得分(主观题)',
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否答对',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试记录考题';

-- ----------------------------
-- Records of el_paper_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 4, 1, 1, 1, '', NULL, 0, 0, 10, 0, '2023-04-20 15:45:15', '2023-04-21 15:35:22', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 5, 1, 1, 0, '', NULL, 0, 0, 10, 0, '2023-04-21 20:40:36', '2023-04-21 20:40:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 6, 1, 1, 0, '', NULL, 0, 0, 10, 0, '2023-04-21 20:48:27', '2023-04-21 20:48:27', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 7, 1, 1, 0, '', NULL, 0, 0, 10, 0, '2023-04-21 20:50:34', '2023-04-21 20:50:34', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 8, 1, 1, 1, '', NULL, 0, 0, 10, 0, '2023-04-21 20:52:14', '2023-04-21 21:27:42', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 9, 1, 1, 1, '', NULL, 0, 10, 10, 1, '2023-04-21 21:29:44', '2023-04-22 06:56:53', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 10, 1, 1, 0, '', NULL, 0, 0, 10, 0, '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 12, 1, 1, 0, '', NULL, 0, 0, 50, 0, '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 13, 1, 1, 0, '', NULL, 0, 0, 50, 0, '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 13, 7, 1, 0, '', NULL, 1, 0, 50, 0, '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 13, 14, 1, 0, '', NULL, 2, 0, 50, 0, '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 13, 13, 2, 0, '', NULL, 3, 0, 0, 0, '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 14, 14, 1, 0, '', NULL, 0, 0, 50, 0, '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 14, 13, 2, 0, '', NULL, 1, 0, 0, 0, '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 18, 1, 1, 1, '', NULL, 0, 50, 50, 1, '2023-04-22 14:05:13', '2023-04-22 14:08:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 18, 13, 2, 0, '', NULL, 1, 0, 50, 0, '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 19, 1, 1, 1, '', NULL, 0, 0, 50, 0, '2023-04-22 14:11:32', '2023-04-22 14:37:26', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 19, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-22 14:11:32', '2023-04-22 14:37:16', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 20, 1, 1, 1, '', NULL, 0, 0, 50, 0, '2023-04-22 14:55:45', '2023-04-22 14:57:13', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 20, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-22 14:55:45', '2023-04-22 14:56:00', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 21, 1, 1, 0, '', NULL, 0, 0, 50, 0, '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 21, 13, 2, 0, '', NULL, 1, 0, 50, 0, '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 22, 1, 1, 1, '', NULL, 0, 0, 50, 0, '2023-04-23 21:47:47', '2023-04-23 21:47:55', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 22, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-23 21:47:47', '2023-04-23 21:47:52', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 23, 1, 1, 0, '', NULL, 0, 0, 100, 0, '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 24, 1, 1, 0, '', NULL, 0, 0, 100, 0, '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 25, 1, 1, 0, '', NULL, 0, 0, 100, 0, '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 26, 1, 1, 0, '', NULL, 0, 0, 100, 0, '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 27, 1, 1, 1, '', NULL, 0, 0, 50, 0, '2023-04-24 15:18:46', '2023-04-24 15:18:52', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 27, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-24 15:18:46', '2023-04-24 15:19:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 28, 1, 1, 1, '', NULL, 0, 50, 50, 1, '2023-04-24 15:26:14', '2023-04-24 15:27:41', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 28, 13, 2, 1, '', NULL, 1, 50, 50, 1, '2023-04-24 15:26:14', '2023-04-24 15:27:45', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 29, 1, 1, 1, '', NULL, 0, 50, 50, 1, '2023-04-24 16:32:17', '2023-04-24 16:32:20', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 29, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-24 16:32:17', '2023-04-24 16:32:24', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 30, 1, 1, 1, '', NULL, 0, 0, 100, 0, '2023-04-24 16:53:56', '2023-04-24 17:16:44', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 31, 1, 1, 1, '', NULL, 0, 50, 50, 1, '2023-04-24 17:48:42', '2023-04-24 17:49:41', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 31, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-24 17:48:42', '2023-04-24 17:48:48', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 32, 1, 1, 1, '', NULL, 0, 0, 50, 0, '2023-04-24 19:40:27', '2023-04-24 19:40:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 32, 13, 2, 1, '', NULL, 1, 0, 50, 0, '2023-04-24 19:40:27', '2023-04-24 19:40:38', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 33, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 33, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 33, 17, 3, 0, '', NULL, 2, 0, 0, 0, '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 34, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 34, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 34, 17, 3, 0, '', NULL, 2, 0, 0, 0, '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 35, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 35, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 35, 17, 3, 0, '', NULL, 2, 0, 0, 0, '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 35, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 36, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 36, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 36, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 36, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 37, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 37, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 37, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 37, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 38, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 38, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 38, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 38, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (63, 39, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (64, 39, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (65, 39, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (66, 39, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (67, 40, 1, 1, 1, '', NULL, 0, 25, 25, 1, '2023-04-26 11:55:11', '2023-04-26 12:22:59', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (68, 40, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-26 11:55:11', '2023-04-26 12:13:33', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (69, 40, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-26 11:55:11', '2023-04-26 12:17:27', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (70, 40, 15, 4, 0, '', NULL, 3, 0, 25, 0, '2023-04-26 11:55:11', '2023-04-26 12:16:53', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (71, 41, 1, 1, 1, '', NULL, 0, 0, 25, 0, '2023-04-26 12:54:02', '2023-04-26 14:06:07', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (72, 41, 13, 2, 1, '', NULL, 1, 0, 25, 0, '2023-04-26 12:54:02', '2023-04-26 14:06:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (73, 41, 17, 3, 1, '', NULL, 2, 0, 25, 0, '2023-04-26 12:54:02', '2023-04-26 14:06:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (74, 41, 15, 4, 1, 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426135047.txt', '12333', 3, 0, 25, 0, '2023-04-26 12:54:02', '2023-04-26 13:50:48', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (75, 42, 1, 1, 1, '', '', 0, 0, 25, 0, '2023-04-26 15:10:17', '2023-04-26 16:05:23', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (76, 42, 13, 2, 1, '', '', 1, 0, 25, 0, '2023-04-26 15:10:17', '2023-04-26 15:10:27', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (77, 42, 17, 3, 1, '', '', 2, 25, 25, 1, '2023-04-26 15:10:17', '2023-04-26 15:10:30', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (78, 42, 15, 4, 1, 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426160511.txt', '表关系.txt', 3, 0, 25, 0, '2023-04-26 15:10:17', '2023-04-26 16:05:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (79, 43, 1, 1, 1, '', '', 0, 25, 25, 1, '2023-04-26 19:30:44', '2023-04-26 19:35:55', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (80, 43, 13, 2, 1, '', '', 1, 0, 25, 0, '2023-04-26 19:30:44', '2023-04-26 19:31:00', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (81, 43, 17, 3, 1, '', '', 2, 0, 25, 0, '2023-04-26 19:30:44', '2023-04-26 19:36:41', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (82, 43, 15, 4, 1, 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426193613.txt', '表关系.txt', 3, 0, 25, 0, '2023-04-26 19:30:44', '2023-04-26 19:36:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (83, 44, 1, 1, 0, '', '', 0, 0, 25, 0, '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (84, 44, 13, 2, 0, '', '', 1, 0, 25, 0, '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (85, 44, 17, 3, 0, '', '', 2, 0, 25, 0, '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (86, 44, 15, 4, 0, '', '', 3, 0, 25, 0, '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (87, 45, 1, 1, 0, '', NULL, 0, 0, 25, 0, '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (88, 45, 13, 2, 0, '', NULL, 1, 0, 25, 0, '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (89, 45, 17, 3, 0, '', NULL, 2, 0, 25, 0, '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (90, 46, 1, 1, 0, '', '', 0, 0, 25, 0, '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (91, 46, 13, 2, 0, '', '', 1, 0, 25, 0, '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (92, 46, 17, 3, 0, '', '', 2, 0, 0, 0, '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (93, 47, 18, 1, 0, '', '', 0, 0, 50, 0, '2023-05-07 09:36:20', '2023-05-07 10:22:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (94, 47, 12, 4, 0, '', '', 1, 0, 50, 0, '2023-05-07 09:36:20', '2023-05-07 09:36:20', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (95, 48, 1, 1, 1, '', '', 0, 3, 3, 1, '2023-05-07 11:10:42', '2023-05-07 11:11:05', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (96, 48, 7, 1, 1, '', '', 1, 0, 3, 0, '2023-05-07 11:10:42', '2023-05-07 11:10:56', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (97, 48, 16, 1, 1, '', '', 2, 0, 3, 0, '2023-05-07 11:10:42', '2023-05-07 11:11:09', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (98, 48, 18, 1, 1, '', '', 3, 0, 3, 0, '2023-05-07 11:10:42', '2023-05-07 11:11:03', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (99, 48, 12, 4, 0, '', '', 4, 0, 3, 0, '2023-05-07 11:10:42', '2023-05-07 11:10:42', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (100, 48, 15, 4, 0, '', '', 5, 0, 3, 0, '2023-05-07 11:10:42', '2023-05-07 11:10:42', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (101, 49, 1, 1, 1, '', '', 0, 3, 3, 1, '2023-05-07 11:18:11', '2023-05-07 11:22:27', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (102, 49, 7, 1, 1, '', '', 1, 0, 3, 0, '2023-05-07 11:18:11', '2023-05-07 11:22:30', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (103, 49, 16, 1, 1, '', '', 2, 0, 3, 0, '2023-05-07 11:18:11', '2023-05-07 11:22:33', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (104, 49, 18, 1, 1, '', '', 3, 3, 3, 1, '2023-05-07 11:18:11', '2023-05-07 11:22:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (105, 49, 12, 4, 0, '', '', 4, 0, 3, 0, '2023-05-07 11:18:11', '2023-05-07 11:18:11', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (106, 49, 15, 4, 0, '', '', 5, 0, 3, 0, '2023-05-07 11:18:11', '2023-05-07 11:18:11', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (107, 50, 1, 1, 1, '', '', 0, 0, 2, 0, '2023-05-07 12:23:35', '2023-05-07 12:23:41', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (108, 50, 7, 1, 1, '', '', 1, 2, 2, 1, '2023-05-07 12:23:35', '2023-05-07 12:23:42', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (109, 50, 16, 1, 1, '', '', 2, 2, 2, 1, '2023-05-07 12:23:35', '2023-05-07 12:23:43', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (110, 50, 18, 1, 1, '', '', 3, 0, 2, 0, '2023-05-07 12:23:35', '2023-05-07 12:23:45', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (111, 50, 12, 4, 0, '', '', 4, 0, 3, 0, '2023-05-07 12:23:35', '2023-05-07 12:23:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (112, 50, 15, 4, 0, '', '', 5, 0, 3, 0, '2023-05-07 12:23:35', '2023-05-07 12:23:35', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (113, 51, 1, 1, 0, '', '', 0, 0, 2, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (114, 51, 7, 1, 0, '', '', 1, 0, 2, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (115, 51, 16, 1, 0, '', '', 2, 0, 2, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (116, 51, 18, 1, 0, '', '', 3, 0, 2, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (117, 51, 12, 4, 0, '', '', 4, 0, 3, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (118, 51, 15, 4, 0, '', '', 5, 0, 3, 0, '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (119, 52, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (120, 52, 7, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (121, 52, 16, 1, 0, '', '', 2, 0, 10, 0, '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (122, 52, 18, 1, 0, '', '', 3, 0, 10, 0, '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (123, 52, 15, 4, 0, '', '', 4, 0, 10, 0, '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (124, 53, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (125, 53, 7, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (126, 53, 16, 1, 0, '', '', 2, 0, 10, 0, '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (127, 53, 18, 1, 0, '', '', 3, 0, 10, 0, '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (128, 53, 15, 4, 0, '', '', 4, 0, 10, 0, '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (129, 54, 16, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (130, 54, 18, 1, 1, '', '', 1, 10, 10, 1, '2023-05-25 10:33:01', '2023-05-25 11:10:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (131, 54, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (132, 54, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (133, 55, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (134, 55, 16, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (135, 55, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (136, 55, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (137, 56, 7, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (138, 56, 18, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (139, 56, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (140, 56, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (141, 57, 1, 1, 1, '', '', 0, 10, 10, 1, '2023-05-25 11:33:12', '2023-05-25 11:33:19', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (142, 57, 18, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (143, 57, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (144, 57, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (145, 58, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (146, 58, 16, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (147, 58, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (148, 58, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (149, 59, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (150, 59, 18, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (151, 59, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (152, 59, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (153, 60, 16, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (154, 60, 18, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (155, 60, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (156, 60, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (157, 61, 7, 1, 1, '', '', 0, 0, 10, 0, '2023-05-25 11:54:06', '2023-05-25 11:54:11', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (158, 61, 18, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (159, 61, 12, 4, 0, '', '', 2, 0, 10, 0, '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (160, 61, 15, 4, 0, '', '', 3, 0, 10, 0, '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (161, 62, 1, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (162, 62, 15, 4, 0, '', '', 1, 0, 10, 0, '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (163, 63, 7, 1, 0, '', '', 0, 0, 10, 0, '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (164, 63, 15, 4, 0, '', '', 1, 0, 10, 0, '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (165, 64, 7, 1, 1, '', '', 0, 0, 10, 0, '2023-05-25 14:49:10', '2023-05-25 15:05:12', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (169, 66, 12, 4, 1, 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525162617.jpg', '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 0, 0, 50, 0, '2023-05-25 15:14:50', '2023-05-25 16:26:18', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (170, 66, 15, 4, 0, '', NULL, 1, 0, 50, 0, '2023-05-25 15:14:50', '2023-05-25 16:20:06', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (175, 69, 1, 1, 1, '', '', 0, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:39:28', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (176, 69, 7, 1, 0, '', '', 1, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (177, 69, 16, 1, 0, '', '', 2, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (178, 69, 18, 1, 0, '', '', 3, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (179, 69, 12, 4, 0, '', '', 4, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (180, 69, 15, 4, 0, '', '', 5, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (181, 69, 19, 4, 0, '', '', 6, 0, 10, 0, '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (190, 74, 1, 1, 0, '', '', 0, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (191, 74, 7, 1, 0, '', '', 1, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (192, 74, 16, 1, 0, '', '', 2, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (193, 74, 18, 1, 0, '', '', 3, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (194, 74, 12, 4, 0, '', '', 4, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (195, 74, 15, 4, 0, '', '', 5, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (196, 74, 19, 4, 0, '', '', 6, 0, 1, 0, '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (199, 77, 7, 1, 0, '', '', 0, 0, 20, 0, '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (200, 77, 16, 1, 0, '', '', 1, 0, 20, 0, '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (201, 77, 12, 4, 0, '', '', 2, 0, 20, 0, '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (202, 77, 19, 4, 0, '', '', 3, 0, 20, 0, '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (203, 78, 1, 1, 0, '', '', 0, 0, 20, 0, '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (204, 78, 7, 1, 0, '', '', 1, 0, 20, 0, '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (205, 78, 12, 4, 1, 'uploads/file/4f4adcbf8c6f66dcfc8a3282ac2bf10a_20230530163232.html', '404.html', 2, 0, 20, 0, '2023-05-30 16:29:34', '2023-05-30 16:32:33', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (206, 78, 19, 4, 0, '', '', 3, 0, 20, 0, '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (207, 79, 1, 1, 1, '', '', 0, 20, 20, 1, '2023-06-03 12:10:29', '2023-06-03 12:11:21', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (208, 79, 7, 1, 1, '', '', 1, 0, 20, 0, '2023-06-03 12:10:29', '2023-06-03 12:11:17', NULL);
INSERT INTO `el_paper_qu` (`id`, `paper_id`, `qu_id`, `qu_type`, `answered`, `answer`, `file_name`, `sort`, `score`, `actual_score`, `is_right`, `created_at`, `updated_at`, `deleted_at`) VALUES (209, 0, 0, 0, 0, '', NULL, 0, 0, 0, 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu_answer`;
CREATE TABLE `el_paper_qu_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `paper_id` int(11) NOT NULL COMMENT '试卷ID',
  `answer_id` int(11) NOT NULL COMMENT '回答项ID',
  `qu_id` int(11) NOT NULL COMMENT '题目ID',
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否正确项',
  `checked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否选中',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试记录答案';

-- ----------------------------
-- Records of el_paper_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 4, 1, 1, 1, 0, 0, 'A', '2023-04-20 15:45:15', '2023-04-21 15:35:23', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 4, 2, 1, 0, 0, 1, 'B', '2023-04-20 15:45:15', '2023-04-21 15:35:23', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 4, 3, 1, 0, 1, 2, 'C', '2023-04-20 15:45:15', '2023-04-21 15:35:23', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 4, 4, 1, 0, 0, 3, 'D', '2023-04-20 15:45:15', '2023-04-21 15:35:23', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 5, 1, 1, 1, 0, 0, 'A', '2023-04-21 20:40:36', '2023-04-21 20:40:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, 5, 2, 1, 0, 0, 1, 'B', '2023-04-21 20:40:36', '2023-04-21 20:40:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 5, 3, 1, 0, 0, 2, 'C', '2023-04-21 20:40:36', '2023-04-21 20:40:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 5, 4, 1, 0, 0, 3, 'D', '2023-04-21 20:40:36', '2023-04-21 20:40:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 6, 1, 1, 1, 0, 0, 'A', '2023-04-21 20:48:27', '2023-04-21 20:48:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 6, 2, 1, 0, 0, 1, 'B', '2023-04-21 20:48:27', '2023-04-21 20:48:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (11, 6, 3, 1, 0, 0, 2, 'C', '2023-04-21 20:48:27', '2023-04-21 20:48:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (12, 6, 4, 1, 0, 0, 3, 'D', '2023-04-21 20:48:27', '2023-04-21 20:48:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (13, 7, 1, 1, 1, 0, 0, 'A', '2023-04-21 20:50:35', '2023-04-21 20:50:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 7, 2, 1, 0, 0, 1, 'B', '2023-04-21 20:50:35', '2023-04-21 20:50:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 7, 3, 1, 0, 0, 2, 'C', '2023-04-21 20:50:35', '2023-04-21 20:50:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 7, 4, 1, 0, 0, 3, 'D', '2023-04-21 20:50:35', '2023-04-21 20:50:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (17, 8, 1, 1, 1, 0, 0, 'A', '2023-04-21 20:52:14', '2023-04-21 21:27:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (18, 8, 2, 1, 0, 1, 1, 'B', '2023-04-21 20:52:14', '2023-04-21 21:27:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (19, 8, 3, 1, 0, 0, 2, 'C', '2023-04-21 20:52:14', '2023-04-21 21:27:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (20, 8, 4, 1, 0, 0, 3, 'D', '2023-04-21 20:52:14', '2023-04-21 21:27:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (21, 9, 1, 1, 1, 1, 0, 'A', '2023-04-21 21:29:44', '2023-04-22 06:56:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (22, 9, 2, 1, 0, 0, 1, 'B', '2023-04-21 21:29:44', '2023-04-22 06:56:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (23, 9, 3, 1, 0, 0, 2, 'C', '2023-04-21 21:29:44', '2023-04-22 06:56:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (24, 9, 4, 1, 0, 0, 3, 'D', '2023-04-21 21:29:44', '2023-04-22 06:56:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (25, 10, 1, 1, 1, 0, 0, 'A', '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (26, 10, 2, 1, 0, 0, 1, 'B', '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (27, 10, 3, 1, 0, 0, 2, 'C', '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (28, 10, 4, 1, 0, 0, 3, 'D', '2023-04-22 08:57:06', '2023-04-22 08:57:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (29, 12, 1, 1, 1, 0, 0, 'A', '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (30, 12, 2, 1, 0, 0, 1, 'B', '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 12, 3, 1, 0, 0, 2, 'C', '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 12, 4, 1, 0, 0, 3, 'D', '2023-04-22 09:19:08', '2023-04-22 09:19:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 13, 1, 1, 1, 0, 0, 'A', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 13, 2, 1, 0, 0, 1, 'B', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 13, 3, 1, 0, 0, 2, 'C', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 13, 4, 1, 0, 0, 3, 'D', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 13, 58, 7, 0, 0, 0, 'A', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 13, 59, 7, 0, 0, 1, 'B', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 13, 60, 7, 1, 0, 2, 'C', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 13, 61, 7, 0, 0, 3, 'D', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 13, 66, 14, 1, 0, 0, 'A', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 13, 67, 14, 0, 0, 1, 'B', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 13, 68, 14, 0, 0, 2, 'C', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 13, 69, 14, 0, 0, 3, 'D', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 13, 62, 13, 1, 0, 0, 'A', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (46, 13, 63, 13, 1, 0, 1, 'B', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (47, 13, 64, 13, 0, 0, 2, 'C', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (48, 13, 65, 13, 0, 0, 3, 'D', '2023-04-22 09:31:15', '2023-04-22 09:31:15', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (49, 14, 66, 14, 1, 0, 0, 'A', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (50, 14, 67, 14, 0, 0, 1, 'B', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (51, 14, 68, 14, 0, 0, 2, 'C', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (52, 14, 69, 14, 0, 0, 3, 'D', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (53, 14, 62, 13, 1, 0, 0, 'A', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (54, 14, 63, 13, 1, 0, 1, 'B', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (55, 14, 64, 13, 0, 0, 2, 'C', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (56, 14, 65, 13, 0, 0, 3, 'D', '2023-04-22 09:44:20', '2023-04-22 09:44:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (57, 18, 1, 1, 1, 1, 0, 'A', '2023-04-22 14:05:13', '2023-04-22 14:08:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (58, 18, 2, 1, 0, 0, 1, 'B', '2023-04-22 14:05:13', '2023-04-22 14:08:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (59, 18, 3, 1, 0, 0, 2, 'C', '2023-04-22 14:05:13', '2023-04-22 14:08:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (60, 18, 4, 1, 0, 0, 3, 'D', '2023-04-22 14:05:13', '2023-04-22 14:08:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (61, 18, 62, 13, 1, 0, 0, 'A', '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (62, 18, 63, 13, 1, 0, 1, 'B', '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (63, 18, 64, 13, 0, 0, 2, 'C', '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (64, 18, 65, 13, 0, 0, 3, 'D', '2023-04-22 14:05:13', '2023-04-22 14:05:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (65, 19, 1, 1, 1, 0, 0, 'A', '2023-04-22 14:11:32', '2023-04-22 14:37:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (66, 19, 2, 1, 0, 1, 1, 'B', '2023-04-22 14:11:32', '2023-04-22 14:37:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (67, 19, 3, 1, 0, 0, 2, 'C', '2023-04-22 14:11:32', '2023-04-22 14:37:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (68, 19, 4, 1, 0, 0, 3, 'D', '2023-04-22 14:11:32', '2023-04-22 14:37:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (69, 19, 62, 13, 1, 1, 0, 'A', '2023-04-22 14:11:32', '2023-04-22 14:37:16', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (70, 19, 63, 13, 1, 0, 1, 'B', '2023-04-22 14:11:32', '2023-04-22 14:37:16', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (71, 19, 64, 13, 0, 0, 2, 'C', '2023-04-22 14:11:32', '2023-04-22 14:37:16', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (72, 19, 65, 13, 0, 0, 3, 'D', '2023-04-22 14:11:32', '2023-04-22 14:37:16', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (73, 20, 1, 1, 1, 0, 0, 'A', '2023-04-22 14:55:45', '2023-04-22 14:57:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (74, 20, 2, 1, 0, 0, 1, 'B', '2023-04-22 14:55:45', '2023-04-22 14:57:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (75, 20, 3, 1, 0, 1, 2, 'C', '2023-04-22 14:55:45', '2023-04-22 14:57:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (76, 20, 4, 1, 0, 0, 3, 'D', '2023-04-22 14:55:45', '2023-04-22 14:57:13', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (77, 20, 62, 13, 1, 0, 0, 'A', '2023-04-22 14:55:45', '2023-04-22 14:56:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (78, 20, 63, 13, 1, 0, 1, 'B', '2023-04-22 14:55:45', '2023-04-22 14:56:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (79, 20, 64, 13, 0, 0, 2, 'C', '2023-04-22 14:55:45', '2023-04-22 14:56:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (80, 20, 65, 13, 0, 1, 3, 'D', '2023-04-22 14:55:45', '2023-04-22 14:56:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (81, 21, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (82, 21, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (83, 21, 3, 1, 0, 0, 2, 'C', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (84, 21, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (85, 21, 62, 13, 1, 0, 0, 'A', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (86, 21, 63, 13, 1, 0, 1, 'B', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (87, 21, 64, 13, 0, 0, 2, 'C', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (88, 21, 65, 13, 0, 0, 3, 'D', '2023-04-23 21:46:29', '2023-04-23 21:46:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (89, 22, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:47:47', '2023-04-23 21:47:55', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (90, 22, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:47:47', '2023-04-23 21:47:55', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (91, 22, 3, 1, 0, 1, 2, 'C', '2023-04-23 21:47:47', '2023-04-23 21:47:55', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (92, 22, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:47:47', '2023-04-23 21:47:55', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (93, 22, 62, 13, 1, 0, 0, 'A', '2023-04-23 21:47:47', '2023-04-23 21:47:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (94, 22, 63, 13, 1, 1, 1, 'B', '2023-04-23 21:47:47', '2023-04-23 21:47:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (95, 22, 64, 13, 0, 0, 2, 'C', '2023-04-23 21:47:47', '2023-04-23 21:47:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (96, 22, 65, 13, 0, 0, 3, 'D', '2023-04-23 21:47:47', '2023-04-23 21:47:53', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (97, 23, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (98, 23, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (99, 23, 3, 1, 0, 0, 2, 'C', '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (100, 23, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:48:08', '2023-04-23 21:48:08', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (101, 24, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (102, 24, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (103, 24, 3, 1, 0, 0, 2, 'C', '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (104, 24, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:48:18', '2023-04-23 21:48:18', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (105, 25, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (106, 25, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (107, 25, 3, 1, 0, 0, 2, 'C', '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (108, 25, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:49:29', '2023-04-23 21:49:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (109, 26, 1, 1, 1, 0, 0, 'A', '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (110, 26, 2, 1, 0, 0, 1, 'B', '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (111, 26, 3, 1, 0, 0, 2, 'C', '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (112, 26, 4, 1, 0, 0, 3, 'D', '2023-04-23 21:50:07', '2023-04-23 21:50:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (113, 27, 1, 1, 1, 0, 0, 'A', '2023-04-24 15:18:46', '2023-04-24 15:18:52', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (114, 27, 2, 1, 0, 1, 1, 'B', '2023-04-24 15:18:46', '2023-04-24 15:18:52', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (115, 27, 3, 1, 0, 0, 2, 'C', '2023-04-24 15:18:46', '2023-04-24 15:18:52', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (116, 27, 4, 1, 0, 0, 3, 'D', '2023-04-24 15:18:46', '2023-04-24 15:18:52', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (117, 27, 62, 13, 1, 0, 0, 'A', '2023-04-24 15:18:46', '2023-04-24 15:19:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (118, 27, 63, 13, 1, 0, 1, 'B', '2023-04-24 15:18:46', '2023-04-24 15:19:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (119, 27, 64, 13, 0, 0, 2, 'C', '2023-04-24 15:18:46', '2023-04-24 15:19:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (120, 27, 65, 13, 0, 1, 3, 'D', '2023-04-24 15:18:46', '2023-04-24 15:19:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (121, 28, 1, 1, 1, 1, 0, 'A', '2023-04-24 15:26:14', '2023-04-24 15:27:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (122, 28, 2, 1, 0, 0, 1, 'B', '2023-04-24 15:26:14', '2023-04-24 15:27:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (123, 28, 3, 1, 0, 0, 2, 'C', '2023-04-24 15:26:14', '2023-04-24 15:27:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (124, 28, 4, 1, 0, 0, 3, 'D', '2023-04-24 15:26:14', '2023-04-24 15:27:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (125, 28, 62, 13, 1, 1, 0, 'A', '2023-04-24 15:26:14', '2023-04-24 15:27:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (126, 28, 63, 13, 1, 1, 1, 'B', '2023-04-24 15:26:14', '2023-04-24 15:27:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (127, 28, 64, 13, 0, 0, 2, 'C', '2023-04-24 15:26:14', '2023-04-24 15:27:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (128, 28, 65, 13, 0, 0, 3, 'D', '2023-04-24 15:26:14', '2023-04-24 15:27:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (129, 29, 1, 1, 1, 1, 0, 'A', '2023-04-24 16:32:17', '2023-04-24 16:32:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (130, 29, 2, 1, 0, 0, 1, 'B', '2023-04-24 16:32:17', '2023-04-24 16:32:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (131, 29, 3, 1, 0, 0, 2, 'C', '2023-04-24 16:32:17', '2023-04-24 16:32:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (132, 29, 4, 1, 0, 0, 3, 'D', '2023-04-24 16:32:17', '2023-04-24 16:32:20', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (133, 29, 62, 13, 1, 0, 0, 'A', '2023-04-24 16:32:17', '2023-04-24 16:32:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (134, 29, 63, 13, 1, 0, 1, 'B', '2023-04-24 16:32:17', '2023-04-24 16:32:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (135, 29, 64, 13, 0, 1, 2, 'C', '2023-04-24 16:32:17', '2023-04-24 16:32:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (136, 29, 65, 13, 0, 0, 3, 'D', '2023-04-24 16:32:17', '2023-04-24 16:32:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (137, 30, 1, 1, 1, 0, 0, 'A', '2023-04-24 16:53:56', '2023-04-24 17:16:44', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (138, 30, 2, 1, 0, 1, 1, 'B', '2023-04-24 16:53:56', '2023-04-24 17:16:44', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (139, 30, 3, 1, 0, 0, 2, 'C', '2023-04-24 16:53:56', '2023-04-24 17:16:44', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (140, 30, 4, 1, 0, 0, 3, 'D', '2023-04-24 16:53:56', '2023-04-24 17:16:44', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (141, 31, 1, 1, 1, 1, 0, 'A', '2023-04-24 17:48:42', '2023-04-24 17:49:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (142, 31, 2, 1, 0, 0, 1, 'B', '2023-04-24 17:48:42', '2023-04-24 17:49:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (143, 31, 3, 1, 0, 0, 2, 'C', '2023-04-24 17:48:42', '2023-04-24 17:49:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (144, 31, 4, 1, 0, 0, 3, 'D', '2023-04-24 17:48:42', '2023-04-24 17:49:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (145, 31, 62, 13, 1, 1, 0, 'A', '2023-04-24 17:48:42', '2023-04-24 17:48:48', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (146, 31, 63, 13, 1, 0, 1, 'B', '2023-04-24 17:48:42', '2023-04-24 17:48:48', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (147, 31, 64, 13, 0, 0, 2, 'C', '2023-04-24 17:48:42', '2023-04-24 17:48:48', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (148, 31, 65, 13, 0, 0, 3, 'D', '2023-04-24 17:48:42', '2023-04-24 17:48:48', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (149, 32, 1, 1, 1, 0, 0, 'A', '2023-04-24 19:40:27', '2023-04-24 19:40:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (150, 32, 2, 1, 0, 0, 1, 'B', '2023-04-24 19:40:27', '2023-04-24 19:40:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (151, 32, 3, 1, 0, 1, 2, 'C', '2023-04-24 19:40:27', '2023-04-24 19:40:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (152, 32, 4, 1, 0, 0, 3, 'D', '2023-04-24 19:40:27', '2023-04-24 19:40:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (153, 32, 62, 13, 1, 1, 0, 'A', '2023-04-24 19:40:27', '2023-04-24 19:40:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (154, 32, 63, 13, 1, 0, 1, 'B', '2023-04-24 19:40:27', '2023-04-24 19:40:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (155, 32, 64, 13, 0, 0, 2, 'C', '2023-04-24 19:40:27', '2023-04-24 19:40:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (156, 32, 65, 13, 0, 0, 3, 'D', '2023-04-24 19:40:27', '2023-04-24 19:40:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (157, 33, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (158, 33, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (159, 33, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (160, 33, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (161, 33, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (162, 33, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (163, 33, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (164, 33, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (165, 33, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (166, 33, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:16:35', '2023-04-26 11:16:35', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (167, 34, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (168, 34, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (169, 34, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (170, 34, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (171, 34, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (172, 34, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (173, 34, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (174, 34, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (175, 34, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (176, 34, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:39:28', '2023-04-26 11:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (177, 35, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (178, 35, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (179, 35, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (180, 35, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (181, 35, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (182, 35, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (183, 35, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (184, 35, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (185, 35, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (186, 35, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:50:17', '2023-04-26 11:50:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (187, 36, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (188, 36, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (189, 36, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (190, 36, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (191, 36, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (192, 36, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (193, 36, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (194, 36, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (195, 36, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (196, 36, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:51:57', '2023-04-26 11:51:57', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (197, 37, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (198, 37, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (199, 37, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (200, 37, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (201, 37, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (202, 37, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (203, 37, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (204, 37, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (205, 37, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (206, 37, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:53:38', '2023-04-26 11:53:38', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (207, 38, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (208, 38, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (209, 38, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (210, 38, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (211, 38, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (212, 38, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (213, 38, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (214, 38, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (215, 38, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (216, 38, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:54:17', '2023-04-26 11:54:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (217, 39, 1, 1, 1, 0, 0, 'A', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (218, 39, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (219, 39, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (220, 39, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (221, 39, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (222, 39, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (223, 39, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (224, 39, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (225, 39, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (226, 39, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:54:54', '2023-04-26 11:54:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (227, 40, 1, 1, 1, 1, 0, 'A', '2023-04-26 11:55:11', '2023-04-26 12:22:59', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (228, 40, 2, 1, 0, 0, 1, 'B', '2023-04-26 11:55:11', '2023-04-26 12:22:59', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (229, 40, 3, 1, 0, 0, 2, 'C', '2023-04-26 11:55:11', '2023-04-26 12:22:59', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (230, 40, 4, 1, 0, 0, 3, 'D', '2023-04-26 11:55:11', '2023-04-26 12:22:59', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (231, 40, 62, 13, 1, 0, 0, 'A', '2023-04-26 11:55:11', '2023-04-26 12:13:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (232, 40, 63, 13, 1, 0, 1, 'B', '2023-04-26 11:55:11', '2023-04-26 12:13:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (233, 40, 64, 13, 0, 0, 2, 'C', '2023-04-26 11:55:11', '2023-04-26 12:13:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (234, 40, 65, 13, 0, 0, 3, 'D', '2023-04-26 11:55:11', '2023-04-26 12:13:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (235, 40, 74, 17, 1, 0, 0, 'A', '2023-04-26 11:55:11', '2023-04-26 12:17:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (236, 40, 75, 17, 0, 0, 1, 'B', '2023-04-26 11:55:11', '2023-04-26 12:17:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (237, 41, 1, 1, 1, 0, 0, 'A', '2023-04-26 12:54:02', '2023-04-26 14:06:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (238, 41, 2, 1, 0, 1, 1, 'B', '2023-04-26 12:54:02', '2023-04-26 14:06:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (239, 41, 3, 1, 0, 0, 2, 'C', '2023-04-26 12:54:02', '2023-04-26 14:06:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (240, 41, 4, 1, 0, 0, 3, 'D', '2023-04-26 12:54:02', '2023-04-26 14:06:07', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (241, 41, 62, 13, 1, 1, 0, 'A', '2023-04-26 12:54:02', '2023-04-26 14:06:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (242, 41, 63, 13, 1, 0, 1, 'B', '2023-04-26 12:54:02', '2023-04-26 14:06:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (243, 41, 64, 13, 0, 0, 2, 'C', '2023-04-26 12:54:02', '2023-04-26 14:06:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (244, 41, 65, 13, 0, 0, 3, 'D', '2023-04-26 12:54:02', '2023-04-26 14:06:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (245, 41, 74, 17, 1, 0, 0, 'A', '2023-04-26 12:54:02', '2023-04-26 14:06:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (246, 41, 75, 17, 0, 1, 1, 'B', '2023-04-26 12:54:02', '2023-04-26 14:06:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (247, 42, 1, 1, 1, 0, 0, 'A', '2023-04-26 15:10:17', '2023-04-26 16:05:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (248, 42, 2, 1, 0, 1, 1, 'B', '2023-04-26 15:10:17', '2023-04-26 16:05:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (249, 42, 3, 1, 0, 0, 2, 'C', '2023-04-26 15:10:17', '2023-04-26 16:05:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (250, 42, 4, 1, 0, 0, 3, 'D', '2023-04-26 15:10:17', '2023-04-26 16:05:24', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (251, 42, 62, 13, 1, 0, 0, 'A', '2023-04-26 15:10:17', '2023-04-26 15:10:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (252, 42, 63, 13, 1, 0, 1, 'B', '2023-04-26 15:10:17', '2023-04-26 15:10:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (253, 42, 64, 13, 0, 0, 2, 'C', '2023-04-26 15:10:17', '2023-04-26 15:10:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (254, 42, 65, 13, 0, 1, 3, 'D', '2023-04-26 15:10:17', '2023-04-26 15:10:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (255, 42, 74, 17, 1, 1, 0, 'A', '2023-04-26 15:10:17', '2023-04-26 15:10:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (256, 42, 75, 17, 0, 0, 1, 'B', '2023-04-26 15:10:17', '2023-04-26 15:10:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (257, 43, 1, 1, 1, 1, 0, 'A', '2023-04-26 19:30:44', '2023-04-26 19:35:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (258, 43, 2, 1, 0, 0, 1, 'B', '2023-04-26 19:30:44', '2023-04-26 19:35:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (259, 43, 3, 1, 0, 0, 2, 'C', '2023-04-26 19:30:44', '2023-04-26 19:35:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (260, 43, 4, 1, 0, 0, 3, 'D', '2023-04-26 19:30:44', '2023-04-26 19:35:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (261, 43, 62, 13, 1, 0, 0, 'A', '2023-04-26 19:30:44', '2023-04-26 19:31:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (262, 43, 63, 13, 1, 1, 1, 'B', '2023-04-26 19:30:44', '2023-04-26 19:31:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (263, 43, 64, 13, 0, 0, 2, 'C', '2023-04-26 19:30:44', '2023-04-26 19:31:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (264, 43, 65, 13, 0, 0, 3, 'D', '2023-04-26 19:30:44', '2023-04-26 19:31:00', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (265, 43, 74, 17, 1, 0, 0, 'A', '2023-04-26 19:30:44', '2023-04-26 19:36:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (266, 43, 75, 17, 0, 1, 1, 'B', '2023-04-26 19:30:44', '2023-04-26 19:36:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (267, 44, 1, 1, 1, 0, 0, 'A', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (268, 44, 2, 1, 0, 0, 1, 'B', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (269, 44, 3, 1, 0, 0, 2, 'C', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (270, 44, 4, 1, 0, 0, 3, 'D', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (271, 44, 62, 13, 1, 0, 0, 'A', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (272, 44, 63, 13, 1, 0, 1, 'B', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (273, 44, 64, 13, 0, 0, 2, 'C', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (274, 44, 65, 13, 0, 0, 3, 'D', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (275, 44, 74, 17, 1, 0, 0, 'A', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (276, 44, 75, 17, 0, 0, 1, 'B', '2023-04-27 09:00:29', '2023-04-27 09:00:29', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (277, 45, 1, 1, 1, 0, 0, 'A', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (278, 45, 2, 1, 0, 0, 1, 'B', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (279, 45, 3, 1, 0, 0, 2, 'C', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (280, 45, 4, 1, 0, 0, 3, 'D', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (281, 45, 62, 13, 1, 0, 0, 'A', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (282, 45, 63, 13, 1, 0, 1, 'B', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (283, 45, 64, 13, 0, 0, 2, 'C', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (284, 45, 65, 13, 0, 0, 3, 'D', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (285, 45, 74, 17, 1, 0, 0, 'A', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (286, 45, 75, 17, 0, 0, 1, 'B', '2023-04-27 13:05:46', '2023-04-27 13:05:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (287, 46, 1, 1, 1, 0, 0, 'A', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (288, 46, 2, 1, 0, 0, 1, 'B', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (289, 46, 3, 1, 0, 0, 2, 'C', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (290, 46, 4, 1, 0, 0, 3, 'D', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (291, 46, 62, 13, 1, 0, 0, 'A', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (292, 46, 63, 13, 1, 0, 1, 'B', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (293, 46, 64, 13, 0, 0, 2, 'C', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (294, 46, 65, 13, 0, 0, 3, 'D', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (295, 46, 74, 17, 1, 0, 0, 'A', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (296, 46, 75, 17, 0, 0, 1, 'B', '2023-04-27 15:40:37', '2023-04-27 15:40:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (297, 47, 76, 18, 1, 0, 0, 'A', '2023-05-07 09:36:20', '2023-05-07 10:22:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (298, 47, 77, 18, 0, 0, 1, 'B', '2023-05-07 09:36:20', '2023-05-07 10:22:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (299, 47, 78, 18, 0, 0, 2, 'C', '2023-05-07 09:36:20', '2023-05-07 10:22:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (300, 47, 79, 18, 0, 0, 3, 'D', '2023-05-07 09:36:20', '2023-05-07 10:22:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (301, 48, 1, 1, 1, 1, 0, 'A', '2023-05-07 11:10:42', '2023-05-07 11:11:05', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (302, 48, 2, 1, 0, 0, 1, 'B', '2023-05-07 11:10:42', '2023-05-07 11:11:05', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (303, 48, 3, 1, 0, 0, 2, 'C', '2023-05-07 11:10:42', '2023-05-07 11:11:05', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (304, 48, 4, 1, 0, 0, 3, 'D', '2023-05-07 11:10:42', '2023-05-07 11:11:05', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (305, 48, 58, 7, 0, 0, 0, 'A', '2023-05-07 11:10:42', '2023-05-07 11:10:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (306, 48, 59, 7, 0, 1, 1, 'B', '2023-05-07 11:10:42', '2023-05-07 11:10:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (307, 48, 60, 7, 1, 0, 2, 'C', '2023-05-07 11:10:42', '2023-05-07 11:10:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (308, 48, 61, 7, 0, 0, 3, 'D', '2023-05-07 11:10:42', '2023-05-07 11:10:56', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (309, 48, 70, 16, 0, 0, 0, 'A', '2023-05-07 11:10:42', '2023-05-07 11:11:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (310, 48, 71, 16, 1, 0, 1, 'B', '2023-05-07 11:10:42', '2023-05-07 11:11:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (311, 48, 72, 16, 0, 1, 2, 'C', '2023-05-07 11:10:42', '2023-05-07 11:11:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (312, 48, 73, 16, 0, 0, 3, 'D', '2023-05-07 11:10:42', '2023-05-07 11:11:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (313, 48, 76, 18, 1, 0, 0, 'A', '2023-05-07 11:10:42', '2023-05-07 11:11:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (314, 48, 77, 18, 0, 1, 1, 'B', '2023-05-07 11:10:42', '2023-05-07 11:11:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (315, 48, 78, 18, 0, 0, 2, 'C', '2023-05-07 11:10:42', '2023-05-07 11:11:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (316, 48, 79, 18, 0, 0, 3, 'D', '2023-05-07 11:10:42', '2023-05-07 11:11:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (317, 49, 1, 1, 1, 1, 0, 'A', '2023-05-07 11:18:11', '2023-05-07 11:22:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (318, 49, 2, 1, 0, 0, 1, 'B', '2023-05-07 11:18:11', '2023-05-07 11:22:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (319, 49, 3, 1, 0, 0, 2, 'C', '2023-05-07 11:18:11', '2023-05-07 11:22:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (320, 49, 4, 1, 0, 0, 3, 'D', '2023-05-07 11:18:11', '2023-05-07 11:22:27', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (321, 49, 58, 7, 0, 0, 0, 'A', '2023-05-07 11:18:11', '2023-05-07 11:22:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (322, 49, 59, 7, 0, 1, 1, 'B', '2023-05-07 11:18:11', '2023-05-07 11:22:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (323, 49, 60, 7, 1, 0, 2, 'C', '2023-05-07 11:18:11', '2023-05-07 11:22:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (324, 49, 61, 7, 0, 0, 3, 'D', '2023-05-07 11:18:11', '2023-05-07 11:22:30', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (325, 49, 70, 16, 0, 0, 0, 'A', '2023-05-07 11:18:11', '2023-05-07 11:22:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (326, 49, 71, 16, 1, 0, 1, 'B', '2023-05-07 11:18:11', '2023-05-07 11:22:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (327, 49, 72, 16, 0, 1, 2, 'C', '2023-05-07 11:18:11', '2023-05-07 11:22:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (328, 49, 73, 16, 0, 0, 3, 'D', '2023-05-07 11:18:11', '2023-05-07 11:22:33', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (329, 49, 76, 18, 1, 1, 0, 'A', '2023-05-07 11:18:11', '2023-05-07 11:22:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (330, 49, 77, 18, 0, 0, 1, 'B', '2023-05-07 11:18:11', '2023-05-07 11:22:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (331, 49, 78, 18, 0, 0, 2, 'C', '2023-05-07 11:18:11', '2023-05-07 11:22:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (332, 49, 79, 18, 0, 0, 3, 'D', '2023-05-07 11:18:11', '2023-05-07 11:22:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (333, 50, 1, 1, 1, 0, 0, 'A', '2023-05-07 12:23:35', '2023-05-07 12:23:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (334, 50, 2, 1, 0, 0, 1, 'B', '2023-05-07 12:23:35', '2023-05-07 12:23:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (335, 50, 3, 1, 0, 1, 2, 'C', '2023-05-07 12:23:35', '2023-05-07 12:23:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (336, 50, 4, 1, 0, 0, 3, 'D', '2023-05-07 12:23:35', '2023-05-07 12:23:41', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (337, 50, 58, 7, 0, 0, 0, 'A', '2023-05-07 12:23:35', '2023-05-07 12:23:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (338, 50, 59, 7, 0, 0, 1, 'B', '2023-05-07 12:23:35', '2023-05-07 12:23:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (339, 50, 60, 7, 1, 1, 2, 'C', '2023-05-07 12:23:35', '2023-05-07 12:23:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (340, 50, 61, 7, 0, 0, 3, 'D', '2023-05-07 12:23:35', '2023-05-07 12:23:42', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (341, 50, 70, 16, 0, 0, 0, 'A', '2023-05-07 12:23:35', '2023-05-07 12:23:43', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (342, 50, 71, 16, 1, 1, 1, 'B', '2023-05-07 12:23:35', '2023-05-07 12:23:43', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (343, 50, 72, 16, 0, 0, 2, 'C', '2023-05-07 12:23:35', '2023-05-07 12:23:43', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (344, 50, 73, 16, 0, 0, 3, 'D', '2023-05-07 12:23:35', '2023-05-07 12:23:43', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (345, 50, 76, 18, 1, 0, 0, 'A', '2023-05-07 12:23:35', '2023-05-07 12:23:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (346, 50, 77, 18, 0, 0, 1, 'B', '2023-05-07 12:23:35', '2023-05-07 12:23:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (347, 50, 78, 18, 0, 1, 2, 'C', '2023-05-07 12:23:35', '2023-05-07 12:23:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (348, 50, 79, 18, 0, 0, 3, 'D', '2023-05-07 12:23:35', '2023-05-07 12:23:45', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (349, 51, 1, 1, 1, 0, 0, 'A', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (350, 51, 2, 1, 0, 0, 1, 'B', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (351, 51, 3, 1, 0, 0, 2, 'C', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (352, 51, 4, 1, 0, 0, 3, 'D', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (353, 51, 58, 7, 0, 0, 0, 'A', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (354, 51, 59, 7, 0, 0, 1, 'B', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (355, 51, 60, 7, 1, 0, 2, 'C', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (356, 51, 61, 7, 0, 0, 3, 'D', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (357, 51, 70, 16, 0, 0, 0, 'A', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (358, 51, 71, 16, 1, 0, 1, 'B', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (359, 51, 72, 16, 0, 0, 2, 'C', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (360, 51, 73, 16, 0, 0, 3, 'D', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (361, 51, 76, 18, 1, 0, 0, 'A', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (362, 51, 77, 18, 0, 0, 1, 'B', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (363, 51, 78, 18, 0, 0, 2, 'C', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (364, 51, 79, 18, 0, 0, 3, 'D', '2023-05-07 12:38:14', '2023-05-07 12:38:14', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (365, 52, 1, 1, 1, 0, 0, 'A', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (366, 52, 2, 1, 0, 0, 1, 'B', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (367, 52, 3, 1, 0, 0, 2, 'C', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (368, 52, 4, 1, 0, 0, 3, 'D', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (369, 52, 58, 7, 0, 0, 0, 'A', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (370, 52, 59, 7, 0, 0, 1, 'B', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (371, 52, 60, 7, 1, 0, 2, 'C', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (372, 52, 61, 7, 0, 0, 3, 'D', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (373, 52, 70, 16, 0, 0, 0, 'A', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (374, 52, 71, 16, 1, 0, 1, 'B', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (375, 52, 72, 16, 0, 0, 2, 'C', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (376, 52, 73, 16, 0, 0, 3, 'D', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (377, 52, 76, 18, 1, 0, 0, 'A', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (378, 52, 77, 18, 0, 0, 1, 'B', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (379, 52, 78, 18, 0, 0, 2, 'C', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (380, 52, 79, 18, 0, 0, 3, 'D', '2023-05-25 08:48:02', '2023-05-25 08:48:02', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (381, 53, 1, 1, 1, 0, 0, 'A', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (382, 53, 2, 1, 0, 0, 1, 'B', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (383, 53, 3, 1, 0, 0, 2, 'C', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (384, 53, 4, 1, 0, 0, 3, 'D', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (385, 53, 58, 7, 0, 0, 0, 'A', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (386, 53, 59, 7, 0, 0, 1, 'B', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (387, 53, 60, 7, 1, 0, 2, 'C', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (388, 53, 61, 7, 0, 0, 3, 'D', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (389, 53, 70, 16, 0, 0, 0, 'A', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (390, 53, 71, 16, 1, 0, 1, 'B', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (391, 53, 72, 16, 0, 0, 2, 'C', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (392, 53, 73, 16, 0, 0, 3, 'D', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (393, 53, 76, 18, 1, 0, 0, 'A', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (394, 53, 77, 18, 0, 0, 1, 'B', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (395, 53, 78, 18, 0, 0, 2, 'C', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (396, 53, 79, 18, 0, 0, 3, 'D', '2023-05-25 09:12:36', '2023-05-25 09:12:36', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (397, 54, 70, 16, 0, 0, 0, 'A', '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (398, 54, 71, 16, 1, 0, 1, 'B', '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (399, 54, 72, 16, 0, 0, 2, 'C', '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (400, 54, 73, 16, 0, 0, 3, 'D', '2023-05-25 10:33:01', '2023-05-25 10:33:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (401, 54, 76, 18, 1, 1, 0, 'A', '2023-05-25 10:33:01', '2023-05-25 11:10:47', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (402, 54, 77, 18, 0, 0, 1, 'B', '2023-05-25 10:33:01', '2023-05-25 11:10:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (403, 54, 78, 18, 0, 0, 2, 'C', '2023-05-25 10:33:01', '2023-05-25 11:10:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (404, 54, 79, 18, 0, 0, 3, 'D', '2023-05-25 10:33:01', '2023-05-25 11:10:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (405, 55, 1, 1, 1, 0, 0, 'A', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (406, 55, 2, 1, 0, 0, 1, 'B', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (407, 55, 3, 1, 0, 0, 2, 'C', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (408, 55, 4, 1, 0, 0, 3, 'D', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (409, 55, 70, 16, 0, 0, 0, 'A', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (410, 55, 71, 16, 1, 0, 1, 'B', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (411, 55, 72, 16, 0, 0, 2, 'C', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (412, 55, 73, 16, 0, 0, 3, 'D', '2023-05-25 10:52:09', '2023-05-25 10:52:09', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (413, 56, 58, 7, 0, 0, 0, 'A', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (414, 56, 59, 7, 0, 0, 1, 'B', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (415, 56, 60, 7, 1, 0, 2, 'C', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (416, 56, 61, 7, 0, 0, 3, 'D', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (417, 56, 76, 18, 1, 0, 0, 'A', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (418, 56, 77, 18, 0, 0, 1, 'B', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (419, 56, 78, 18, 0, 0, 2, 'C', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (420, 56, 79, 18, 0, 0, 3, 'D', '2023-05-25 11:05:37', '2023-05-25 11:05:37', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (421, 57, 1, 1, 1, 1, 0, 'A', '2023-05-25 11:33:12', '2023-05-25 11:33:19', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (422, 57, 2, 1, 0, 0, 1, 'B', '2023-05-25 11:33:12', '2023-05-25 11:33:19', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (423, 57, 3, 1, 0, 0, 2, 'C', '2023-05-25 11:33:12', '2023-05-25 11:33:19', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (424, 57, 4, 1, 0, 0, 3, 'D', '2023-05-25 11:33:12', '2023-05-25 11:33:19', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (425, 57, 76, 18, 1, 0, 0, 'A', '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (426, 57, 77, 18, 0, 0, 1, 'B', '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (427, 57, 78, 18, 0, 0, 2, 'C', '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (428, 57, 79, 18, 0, 0, 3, 'D', '2023-05-25 11:33:12', '2023-05-25 11:33:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (429, 58, 1, 1, 1, 0, 0, 'A', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (430, 58, 2, 1, 0, 0, 1, 'B', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (431, 58, 3, 1, 0, 0, 2, 'C', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (432, 58, 4, 1, 0, 0, 3, 'D', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (433, 58, 70, 16, 0, 0, 0, 'A', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (434, 58, 71, 16, 1, 0, 1, 'B', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (435, 58, 72, 16, 0, 0, 2, 'C', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (436, 58, 73, 16, 0, 0, 3, 'D', '2023-05-25 11:34:04', '2023-05-25 11:34:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (437, 59, 1, 1, 1, 0, 0, 'A', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (438, 59, 2, 1, 0, 0, 1, 'B', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (439, 59, 3, 1, 0, 0, 2, 'C', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (440, 59, 4, 1, 0, 0, 3, 'D', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (441, 59, 76, 18, 1, 0, 0, 'A', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (442, 59, 77, 18, 0, 0, 1, 'B', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (443, 59, 78, 18, 0, 0, 2, 'C', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (444, 59, 79, 18, 0, 0, 3, 'D', '2023-05-25 11:34:31', '2023-05-25 11:34:31', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (445, 60, 70, 16, 0, 0, 0, 'A', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (446, 60, 71, 16, 1, 0, 1, 'B', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (447, 60, 72, 16, 0, 0, 2, 'C', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (448, 60, 73, 16, 0, 0, 3, 'D', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (449, 60, 76, 18, 1, 0, 0, 'A', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (450, 60, 77, 18, 0, 0, 1, 'B', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (451, 60, 78, 18, 0, 0, 2, 'C', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (452, 60, 79, 18, 0, 0, 3, 'D', '2023-05-25 11:34:46', '2023-05-25 11:34:46', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (453, 61, 58, 7, 0, 1, 0, 'A', '2023-05-25 11:54:06', '2023-05-25 11:54:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (454, 61, 59, 7, 0, 0, 1, 'B', '2023-05-25 11:54:06', '2023-05-25 11:54:11', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (455, 61, 60, 7, 1, 0, 2, 'C', '2023-05-25 11:54:06', '2023-05-25 11:54:11', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (456, 61, 61, 7, 0, 0, 3, 'D', '2023-05-25 11:54:06', '2023-05-25 11:54:11', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (457, 61, 76, 18, 1, 0, 0, 'A', '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (458, 61, 77, 18, 0, 0, 1, 'B', '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (459, 61, 78, 18, 0, 0, 2, 'C', '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (460, 61, 79, 18, 0, 0, 3, 'D', '2023-05-25 11:54:06', '2023-05-25 11:54:06', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (461, 62, 1, 1, 1, 0, 0, 'A', '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (462, 62, 2, 1, 0, 0, 1, 'B', '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (463, 62, 3, 1, 0, 0, 2, 'C', '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (464, 62, 4, 1, 0, 0, 3, 'D', '2023-05-25 14:35:54', '2023-05-25 14:35:54', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (465, 63, 58, 7, 0, 0, 0, 'A', '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (466, 63, 59, 7, 0, 0, 1, 'B', '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (467, 63, 60, 7, 1, 0, 2, 'C', '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (468, 63, 61, 7, 0, 0, 3, 'D', '2023-05-25 14:47:04', '2023-05-25 14:47:04', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (469, 64, 58, 7, 0, 1, 0, 'A', '2023-05-25 14:49:10', '2023-05-25 15:05:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (470, 64, 59, 7, 0, 0, 1, 'B', '2023-05-25 14:49:10', '2023-05-25 15:05:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (471, 64, 60, 7, 1, 0, 2, 'C', '2023-05-25 14:49:10', '2023-05-25 15:05:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (472, 64, 61, 7, 0, 0, 3, 'D', '2023-05-25 14:49:10', '2023-05-25 15:05:12', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (473, 69, 1, 1, 1, 0, 0, 'A', '2023-05-25 15:29:58', '2023-05-25 15:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (474, 69, 2, 1, 0, 0, 1, 'B', '2023-05-25 15:29:58', '2023-05-25 15:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (475, 69, 3, 1, 0, 1, 2, 'C', '2023-05-25 15:29:58', '2023-05-25 15:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (476, 69, 4, 1, 0, 0, 3, 'D', '2023-05-25 15:29:58', '2023-05-25 15:39:28', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (477, 69, 58, 7, 0, 0, 0, 'A', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (478, 69, 59, 7, 0, 0, 1, 'B', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (479, 69, 60, 7, 1, 0, 2, 'C', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (480, 69, 61, 7, 0, 0, 3, 'D', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (481, 69, 70, 16, 0, 0, 0, 'A', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (482, 69, 71, 16, 1, 0, 1, 'B', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (483, 69, 72, 16, 0, 0, 2, 'C', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (484, 69, 73, 16, 0, 0, 3, 'D', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (485, 69, 76, 18, 1, 0, 0, 'A', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (486, 69, 77, 18, 0, 0, 1, 'B', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (487, 69, 78, 18, 0, 0, 2, 'C', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (488, 69, 79, 18, 0, 0, 3, 'D', '2023-05-25 15:29:58', '2023-05-25 15:29:58', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (489, 74, 1, 1, 1, 0, 0, 'A', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (490, 74, 2, 1, 0, 0, 1, 'B', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (491, 74, 3, 1, 0, 0, 2, 'C', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (492, 74, 4, 1, 0, 0, 3, 'D', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (493, 74, 58, 7, 0, 0, 0, 'A', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (494, 74, 59, 7, 0, 0, 1, 'B', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (495, 74, 60, 7, 1, 0, 2, 'C', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (496, 74, 61, 7, 0, 0, 3, 'D', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (497, 74, 70, 16, 0, 0, 0, 'A', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (498, 74, 71, 16, 1, 0, 1, 'B', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (499, 74, 72, 16, 0, 0, 2, 'C', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (500, 74, 73, 16, 0, 0, 3, 'D', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (501, 74, 76, 18, 1, 0, 0, 'A', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (502, 74, 77, 18, 0, 0, 1, 'B', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (503, 74, 78, 18, 0, 0, 2, 'C', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (504, 74, 79, 18, 0, 0, 3, 'D', '2023-05-25 15:45:01', '2023-05-25 15:45:01', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (505, 77, 58, 7, 0, 0, 0, 'A', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (506, 77, 59, 7, 0, 0, 1, 'B', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (507, 77, 60, 7, 1, 0, 2, 'C', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (508, 77, 61, 7, 0, 0, 3, 'D', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (509, 77, 70, 16, 0, 0, 0, 'A', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (510, 77, 71, 16, 1, 0, 1, 'B', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (511, 77, 72, 16, 0, 0, 2, 'C', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (512, 77, 73, 16, 0, 0, 3, 'D', '2023-05-25 17:34:26', '2023-05-25 17:34:26', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (513, 78, 1, 1, 1, 0, 0, 'A', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (514, 78, 2, 1, 0, 0, 1, 'B', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (515, 78, 3, 1, 0, 0, 2, 'C', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (516, 78, 4, 1, 0, 0, 3, 'D', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (517, 78, 58, 7, 0, 0, 0, 'A', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (518, 78, 59, 7, 0, 0, 1, 'B', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (519, 78, 60, 7, 1, 0, 2, 'C', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (520, 78, 61, 7, 0, 0, 3, 'D', '2023-05-30 16:29:34', '2023-05-30 16:29:34', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (521, 79, 1, 1, 1, 1, 0, 'A', '2023-06-03 12:10:29', '2023-06-03 12:11:21', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (522, 79, 2, 1, 0, 0, 1, 'B', '2023-06-03 12:10:29', '2023-06-03 12:11:21', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (523, 79, 3, 1, 0, 0, 2, 'C', '2023-06-03 12:10:29', '2023-06-03 12:11:21', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (524, 79, 4, 1, 0, 0, 3, 'D', '2023-06-03 12:10:29', '2023-06-03 12:11:21', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (525, 79, 58, 7, 0, 1, 0, 'A', '2023-06-03 12:10:29', '2023-06-03 12:11:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (526, 79, 59, 7, 0, 0, 1, 'B', '2023-06-03 12:10:29', '2023-06-03 12:11:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (527, 79, 60, 7, 1, 0, 2, 'C', '2023-06-03 12:10:29', '2023-06-03 12:11:17', NULL);
INSERT INTO `el_paper_qu_answer` (`id`, `paper_id`, `answer_id`, `qu_id`, `is_right`, `checked`, `sort`, `abc`, `created_at`, `updated_at`, `deleted_at`) VALUES (528, 79, 61, 7, 0, 0, 3, 'D', '2023-06-03 12:10:29', '2023-06-03 12:11:17', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_qu`;
CREATE TABLE `el_qu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `qu_type` int(11) NOT NULL COMMENT '题目类型',
  `level` int(11) NOT NULL DEFAULT 1 COMMENT '1普通,2较难',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
  `content` varchar(2000) NOT NULL COMMENT '题目内容',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `scimage` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='试题主表';

-- ----------------------------
-- Records of el_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (1, 1, 1, '', '我国面积最大的湖泊是（）。', '', '青海湖是我国最大的湖泊，它是一个咸水湖，面积约4450平方公里，说起来也不小了，但是如果把它放到全世界范围来看的话，青海湖实际上并非大型湖泊，单就面积而言，在全世界排名第34位，和我国国土面积世界第三的位置很不相称，世界最大湖泊里海的面积（38万平方公里），就相当于84个青海湖。', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (7, 1, 1, '', '11122', '', '', '2023-04-16 16:47:47', '2023-04-18 16:54:50', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (12, 4, 1, '', '测试实操题', '', '测试实操题', '2023-04-19 15:36:31', '2023-04-19 15:36:31', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (13, 2, 1, '', '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', '', '', '2023-04-22 08:17:14', '2023-04-22 08:17:14', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (15, 4, 1, '', '实操题目测试', '', '', '2023-04-26 08:48:33', '2023-04-26 08:48:33', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (16, 1, 1, '', '11', '', '11', '2023-04-26 09:51:02', '2023-04-26 09:51:02', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (17, 3, 1, '', '测试判断题', '', '', '2023-04-26 10:56:44', '2023-05-05 09:52:55', NULL, NULL, NULL, 'FF5566', NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (18, 1, 1, '', '测试题目', '', '测试题目', '2023-05-05 09:47:45', '2023-05-05 09:47:45', NULL, NULL, NULL, 'BT635', NULL);
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `remark`, `analysis`, `created_at`, `updated_at`, `deleted_at`, `create_time`, `update_time`, `code`, `scimage`) VALUES (19, 4, 1, '', '11', '', '1111', '2023-05-25 15:28:33', '2023-05-25 15:28:33', NULL, NULL, NULL, '11', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_answer`;
CREATE TABLE `el_qu_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案ID',
  `qu_id` int(11) NOT NULL COMMENT '问题ID',
  `is_right` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否正确',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '选项图片',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
  `analysis` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案分析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='试题答案选项';

-- ----------------------------
-- Records of el_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (1, 1, 1, '', '青海湖', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (2, 1, 0, '', '太湖', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (3, 1, 0, '', '洞庭湖', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (4, 1, 0, '', '鄱阳湖', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (58, 7, 0, '', '122', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (59, 7, 0, '', '222', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (60, 7, 1, '', '32', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (61, 7, 0, '', '422', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (62, 13, 1, '', '香港', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (63, 13, 1, '', '澳门', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (64, 13, 0, '', '珠海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (65, 13, 0, '', '重庆', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (67, 14, 0, '', '3', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (68, 14, 0, '', '4', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (69, 14, 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (70, 16, 0, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (71, 16, 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (72, 16, 0, '', '1', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (73, 16, 0, '', '111', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (76, 18, 1, '', '1', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (77, 18, 0, '', '2', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (78, 18, 0, '', '3', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (79, 18, 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (80, 17, 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES (81, 17, 0, '', '错误', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_repo`;
CREATE TABLE `el_qu_repo` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `qu_id` int(11) NOT NULL COMMENT '试题',
  `repo_id` int(11) NOT NULL COMMENT '归属题库',
  `qu_type` int(11) NOT NULL DEFAULT 0 COMMENT '题目类型',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='试题题库关联';

-- ----------------------------
-- Records of el_qu_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 1, 1, 6, NULL, NULL, NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 2, 1, 0, '2023-04-16 11:15:22', '2023-04-16 11:15:22', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (14, 1, 0, 1, 0, '2023-04-26 10:54:04', '2023-04-26 10:54:04', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (15, 13, 0, 2, 0, '2023-04-26 10:54:04', '2023-04-26 10:54:04', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (16, 15, 0, 4, 0, '2023-04-26 10:54:04', '2023-04-26 10:54:04', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (31, 18, 8, 1, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (32, 16, 8, 1, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (33, 7, 8, 1, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (34, 1, 8, 1, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (35, 15, 8, 4, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (36, 12, 8, 4, 0, '2023-05-07 11:09:50', '2023-05-07 11:09:50', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (37, 18, 9, 1, 0, '2023-05-25 09:41:04', '2023-05-25 09:41:04', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (38, 15, 9, 4, 0, '2023-05-25 09:41:04', '2023-05-25 09:41:04', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (39, 18, 7, 1, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (40, 16, 7, 1, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (41, 7, 7, 1, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (42, 1, 7, 1, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (43, 19, 7, 4, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (44, 15, 7, 4, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (45, 12, 7, 4, 0, '2023-05-25 15:28:48', '2023-05-25 15:28:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_repo`;
CREATE TABLE `el_repo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题库ID',
  `code` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '题库编号',
  `title` varchar(255) CHARACTER SET utf8mb3 NOT NULL COMMENT '题库名称',
  `remark` varchar(255) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '题库备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='题库信息';

-- ----------------------------
-- Records of el_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, '', '题库_2022-04-22_02', '题库_2022-04-22_02', '2023-04-26 10:52:30', '2023-05-25 15:28:48', NULL);
INSERT INTO `el_repo` (`id`, `code`, `title`, `remark`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, '', '2023050701', '2023050701', '2023-05-07 09:32:54', '2023-05-07 11:09:50', NULL);
COMMIT;

-- ----------------------------
-- Table structure for el_user_book
-- ----------------------------
DROP TABLE IF EXISTS `el_user_book`;
CREATE TABLE `el_user_book` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
  `wrong_count` int(11) NOT NULL COMMENT '错误时间',
  `title` varchar(1000) NOT NULL COMMENT '题目标题',
  `sort` int(11) NOT NULL COMMENT '错题序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='错题本';

-- ----------------------------
-- Records of el_user_book
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_user_exam`;
CREATE TABLE `el_user_exam` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `exam_id` int(11) NOT NULL COMMENT '考试ID',
  `try_count` int(11) NOT NULL DEFAULT 1 COMMENT '考试次数',
  `max_score` int(11) NOT NULL DEFAULT 0 COMMENT '最高分数',
  `passed` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否通过',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `paper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='考试记录';

-- ----------------------------
-- Records of el_user_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (8, 4, 24, 1, 0, 0, '2023-04-24 19:40:41', '2023-04-24 19:40:41', NULL, 32);
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (9, 1, 27, 3, 25, 0, '2023-04-26 14:06:08', '2023-04-26 19:36:44', NULL, 43);
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (10, 34, 40, 1, 0, 0, '2023-05-25 15:05:15', '2023-05-25 15:05:15', NULL, 64);
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (11, 30, 43, 2, 0, 0, '2023-05-25 15:40:00', '2023-05-25 15:43:20', NULL, 69);
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (12, 30, 44, 1, 0, 0, '2023-05-25 15:48:03', '2023-05-25 15:48:03', NULL, 74);
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `created_at`, `updated_at`, `deleted_at`, `paper_id`) VALUES (13, 38, 46, 1, 20, 0, '2023-06-03 12:10:29', '2023-06-03 12:11:23', NULL, 79);
COMMIT;

-- ----------------------------
-- Table structure for exa_customers
-- ----------------------------
DROP TABLE IF EXISTS `exa_customers`;
CREATE TABLE `exa_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint(20) unsigned DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_exa_customers_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exa_customers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for exa_file_chunks
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_chunks`;
CREATE TABLE `exa_file_chunks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `exa_file_id` bigint(20) unsigned DEFAULT NULL,
  `file_chunk_number` bigint(20) DEFAULT NULL,
  `file_chunk_path` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exa_file_chunks
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for exa_file_upload_and_downloads
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
CREATE TABLE `exa_file_upload_and_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exa_file_upload_and_downloads
-- ----------------------------
BEGIN;
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (1, '2023-04-23 16:35:39.000', '2023-04-23 16:35:39.000', NULL, 'logo.png', 'uploads/file/96d6f2e7e1f705ab5e59c84a6dc009b2_20230423163539.png', 'png', '96d6f2e7e1f705ab5e59c84a6dc009b2_20230423163539.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (2, '2023-04-23 16:41:38.000', '2023-04-23 16:41:38.000', NULL, 'logo.png', 'uploads/file/96d6f2e7e1f705ab5e59c84a6dc009b2_20230423164137.png', 'png', '96d6f2e7e1f705ab5e59c84a6dc009b2_20230423164137.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (3, '2023-04-23 16:42:37.000', '2023-04-23 16:42:37.000', NULL, 'logoh.png', 'uploads/file/6164ad77d99132c80dbfda5b83894544_20230423164237.png', 'png', '6164ad77d99132c80dbfda5b83894544_20230423164237.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (4, '2023-04-23 16:43:11.000', '2023-04-23 16:43:11.000', NULL, 'logoh.png', 'uploads/file/6164ad77d99132c80dbfda5b83894544_20230423164311.png', 'png', '6164ad77d99132c80dbfda5b83894544_20230423164311.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (5, '2023-04-23 16:44:24.000', '2023-04-23 16:44:24.000', NULL, 'logoh.png', 'uploads/file/6164ad77d99132c80dbfda5b83894544_20230423164424.png', 'png', '6164ad77d99132c80dbfda5b83894544_20230423164424.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (6, '2023-04-23 21:26:27.000', '2023-04-23 21:26:27.000', NULL, 'logo.png', 'uploads/file/96d6f2e7e1f705ab5e59c84a6dc009b2_20230423212627.png', 'png', '96d6f2e7e1f705ab5e59c84a6dc009b2_20230423212627.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (7, '2023-04-26 09:55:58.000', '2023-04-26 09:55:58.000', NULL, 'logoh.png', 'uploads/file/6164ad77d99132c80dbfda5b83894544_20230426095558.png', 'png', '6164ad77d99132c80dbfda5b83894544_20230426095558.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (8, '2023-04-26 12:52:32.000', '2023-04-26 12:52:32.000', NULL, '2241678502177_.pic.jpg', 'uploads/file/8eede94b8106a57533b09acc2c537198_20230426125231.jpg', 'jpg', '8eede94b8106a57533b09acc2c537198_20230426125231.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (9, '2023-04-26 13:50:48.000', '2023-04-26 13:50:48.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426135047.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426135047.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (10, '2023-04-26 15:12:51.000', '2023-04-26 15:12:51.000', NULL, '返回结果.json', 'uploads/file/75ef6f105a931ef65e468dd69852b7c3_20230426151249.json', 'json', '75ef6f105a931ef65e468dd69852b7c3_20230426151249.json');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (11, '2023-04-26 15:20:53.000', '2023-04-26 15:20:53.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426152053.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426152053.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (12, '2023-04-26 16:05:12.000', '2023-04-26 16:05:12.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426160511.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426160511.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (13, '2023-04-26 19:31:11.000', '2023-04-26 19:31:11.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426193111.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426193111.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (14, '2023-04-26 19:33:15.000', '2023-04-26 19:33:15.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426193314.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426193314.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (15, '2023-04-26 19:34:35.000', '2023-04-26 19:34:35.000', NULL, '返回结果.json', 'uploads/file/75ef6f105a931ef65e468dd69852b7c3_20230426193435.json', 'json', '75ef6f105a931ef65e468dd69852b7c3_20230426193435.json');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (16, '2023-04-26 19:36:14.000', '2023-04-26 19:36:14.000', NULL, '表关系.txt', 'uploads/file/e5cd8b68c5b308219b15d46aa77cef4c_20230426193613.txt', 'txt', 'e5cd8b68c5b308219b15d46aa77cef4c_20230426193613.txt');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (17, '2023-04-27 14:58:41.664', '2023-04-27 14:58:41.664', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427145841.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427145841.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (18, '2023-04-27 15:03:02.053', '2023-04-27 15:03:02.053', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427150302.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427150302.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (19, '2023-04-27 15:26:19.079', '2023-04-27 15:26:19.079', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427152619.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427152619.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (20, '2023-04-27 15:29:48.527', '2023-04-27 15:29:48.527', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427152948.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427152948.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (21, '2023-04-27 15:30:57.053', '2023-04-27 15:30:57.053', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427153057.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427153057.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (22, '2023-04-27 15:40:06.178', '2023-04-27 15:40:06.178', NULL, '1111.xlsx', 'uploads/file/b59c67bf196a4758191e42f76670ceba_20230427154006.xlsx', 'xlsx', 'b59c67bf196a4758191e42f76670ceba_20230427154006.xlsx');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (23, '2023-05-25 15:01:52.938', '2023-05-25 15:01:52.938', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525150152.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525150152.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (24, '2023-05-25 15:02:17.014', '2023-05-25 15:02:17.014', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525150216.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525150216.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (25, '2023-05-25 15:29:01.269', '2023-05-25 15:29:01.269', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525152901.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525152901.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (26, '2023-05-25 15:36:15.186', '2023-05-25 15:36:15.186', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525153615.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525153615.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (27, '2023-05-25 15:39:05.864', '2023-05-25 15:39:05.864', NULL, '2111999-20211029092046299-796043907.png', 'uploads/file/f70c48be51920029460aac802d0cd38a_20230525153905.png', 'png', 'f70c48be51920029460aac802d0cd38a_20230525153905.png');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (28, '2023-05-25 15:41:22.521', '2023-05-25 15:41:22.521', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525154122.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525154122.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (29, '2023-05-25 15:45:19.550', '2023-05-25 15:45:19.550', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525154519.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525154519.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (30, '2023-05-25 15:47:30.761', '2023-05-25 15:47:30.761', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525154730.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525154730.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (31, '2023-05-25 16:16:59.204', '2023-05-25 16:16:59.204', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525161659.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525161659.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (32, '2023-05-25 16:20:05.758', '2023-05-25 16:20:05.758', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231.jpg', 'uploads/file/654701d2a0ae7a37587cf6eaa7069460_20230525162005.jpg', 'jpg', '654701d2a0ae7a37587cf6eaa7069460_20230525162005.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (33, '2023-05-25 16:20:29.895', '2023-05-25 16:20:29.895', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (2).jpg', 'uploads/file/8ad5759a8193ab1b1ddcc250a12d9071_20230525162029.jpg', 'jpg', '8ad5759a8193ab1b1ddcc250a12d9071_20230525162029.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (34, '2023-05-25 16:22:50.018', '2023-05-25 16:22:50.018', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525162249.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525162249.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (35, '2023-05-25 16:23:36.232', '2023-05-25 16:23:36.232', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525162336.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525162336.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (36, '2023-05-25 16:25:15.268', '2023-05-25 16:25:15.268', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525162515.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525162515.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (37, '2023-05-25 16:26:17.931', '2023-05-25 16:26:17.931', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525162617.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525162617.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (38, '2023-05-25 16:36:09.662', '2023-05-25 16:36:09.662', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230525163609.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230525163609.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (39, '2023-05-30 16:31:41.009', '2023-05-30 16:31:41.009', NULL, '8eede94b8106a57533b09acc2c537198_20230426125231 (1).jpg', 'uploads/file/a2c266544fba6eb4351795ff0b1508de_20230530163140.jpg', 'jpg', 'a2c266544fba6eb4351795ff0b1508de_20230530163140.jpg');
INSERT INTO `exa_file_upload_and_downloads` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `url`, `tag`, `key`) VALUES (40, '2023-05-30 16:32:32.552', '2023-05-30 16:32:32.552', NULL, '404.html', 'uploads/file/4f4adcbf8c6f66dcfc8a3282ac2bf10a_20230530163232.html', 'html', '4f4adcbf8c6f66dcfc8a3282ac2bf10a_20230530163232.html');
COMMIT;

-- ----------------------------
-- Table structure for exa_files
-- ----------------------------
DROP TABLE IF EXISTS `exa_files`;
CREATE TABLE `exa_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_md5` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `chunk_total` bigint(20) DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_exa_files_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of exa_files
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jwt_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `jwt_blacklists`;
CREATE TABLE `jwt_blacklists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'jwt',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jwt_blacklists
-- ----------------------------
BEGIN;
INSERT INTO `jwt_blacklists` (`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES (72, '2023-06-03 11:48:41.854', '2023-06-03 11:48:41.854', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIiwiSUQiOjM3LCJVc2VybmFtZSI6IjU1NTU1NSIsIk5pY2tOYW1lIjoiIiwiQXV0aG9yaXR5SWQiOjAsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2ODYwNDAxNzIsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY4NTQzNDM3Mn0.VgDiZYjkmB6GyD4mb3Y7v8v8ZL1czw90ln-YV0A_un8');
INSERT INTO `jwt_blacklists` (`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES (73, '2023-06-03 12:10:20.431', '2023-06-03 12:10:20.431', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6IiIsIkF1dGhvcml0eUlkIjowLCJCdWZmZXJUaW1lIjo4NjQwMCwiZXhwIjoxNjg2MzY5MTQwLCJpc3MiOiJxbVBsdXMiLCJuYmYiOjE2ODU3NjMzNDB9.NFePmWCuMPrv6T_GWNcIdCq98ncReUeNWQKVppI5gLk');
INSERT INTO `jwt_blacklists` (`id`, `created_at`, `updated_at`, `deleted_at`, `jwt`) VALUES (74, '2023-06-03 12:11:25.755', '2023-06-03 12:11:25.755', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAwIiwiSUQiOjM4LCJVc2VybmFtZSI6IjY2NjY2NjYiLCJOaWNrTmFtZSI6IiIsIkF1dGhvcml0eUlkIjowLCJCdWZmZXJUaW1lIjo4NjQwMCwiZXhwIjoxNjg2MzcwMjI0LCJpc3MiOiJxbVBsdXMiLCJuYmYiOjE2ODU3NjQ0MjR9.glYhn1zCGvGOGHlLVbk5ar4x0mRTdGtRHIEcmErI3gw');
COMMIT;

-- ----------------------------
-- Table structure for sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_apis`;
CREATE TABLE `sys_apis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) COLLATE utf8mb4_bin DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_apis_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_apis
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) COLLATE utf8mb4_bin DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`) USING BTREE,
  UNIQUE KEY `authority_id` (`authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_authority_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_btns`;
CREATE TABLE `sys_authority_btns` (
  `authority_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint(20) unsigned DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint(20) unsigned DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_authority_btns
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_authority_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_menus`;
CREATE TABLE `sys_authority_menus` (
  `sys_base_menu_id` bigint(20) unsigned NOT NULL,
  `sys_authority_authority_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_authority_menus
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_auto_code_histories
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_code_histories`;
CREATE TABLE `sys_auto_code_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `business_db` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `request_meta` text COLLATE utf8mb4_bin DEFAULT NULL,
  `auto_code_path` text COLLATE utf8mb4_bin DEFAULT NULL,
  `injection_meta` text COLLATE utf8mb4_bin DEFAULT NULL,
  `struct_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `struct_cn_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `api_ids` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `flag` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_auto_code_histories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_auto_codes
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_codes`;
CREATE TABLE `sys_auto_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '包名',
  `label` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '展示名',
  `desc` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_auto_codes_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_auto_codes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_base_menu_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_btns`;
CREATE TABLE `sys_base_menu_btns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL,
  `sys_base_menu_id` bigint(20) unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_base_menu_btns
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_base_menu_parameters
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_parameters`;
CREATE TABLE `sys_base_menu_parameters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_base_menu_parameters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_base_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menus`;
CREATE TABLE `sys_base_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint(20) unsigned DEFAULT NULL,
  `parent_id` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附加属性',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_base_menus
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_chat_gpt_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat_gpt_options`;
CREATE TABLE `sys_chat_gpt_options` (
  `sk` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_chat_gpt_options
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `site_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `front_logo` varchar(255) DEFAULT NULL COMMENT '前端LOGO',
  `back_logo` varchar(255) DEFAULT NULL COMMENT '后台LOGO',
  `copy_right` varchar(255) DEFAULT NULL COMMENT '版权信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `data_flag` int(11) DEFAULT 0 COMMENT '数据标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统设置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `site_name`, `front_logo`, `back_logo`, `copy_right`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1', '在线培训考试系统', NULL, NULL, NULL, '2020-12-03 16:51:30', '2020-12-03 16:51:30', '', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_data_authority_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority_id`;
CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_data_authority_id
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1公司2部门',
  `parent_id` int(11) NOT NULL COMMENT '所属上级',
  `dept_name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_code` varchar(20) NOT NULL DEFAULT '' COMMENT '部门编码',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间\n',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间\n',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门信息';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
BEGIN;
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 0, '在线考试', 'A01', 1, NULL, '2023-04-19 14:14:31', NULL);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 1, 1, '20号上午场', 'A01A01', 1, NULL, '2023-04-19 14:14:57', NULL);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (9, 1, 1, '20号下午场', 'A01A02', 2, NULL, '2023-04-19 14:15:04', NULL);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (10, 1, 1, '31号下午场', 'A01A03', 3, NULL, '2023-04-19 14:15:14', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionary_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_details`;
CREATE TABLE `sys_dictionary_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '展示值',
  `value` bigint(20) DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint(20) DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dictionary_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_records`;
CREATE TABLE `sys_operation_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求路径',
  `status` bigint(20) DEFAULT NULL COMMENT '请求状态',
  `latency` bigint(20) DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '错误信息',
  `body` text COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求Body',
  `resp` text COLLATE utf8mb4_bin DEFAULT NULL COMMENT '响应Body',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_operation_records
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('sa', '超级管理员');
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('student', '学员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐',
  `role_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '角色列表',
  `depart_id` int(32) NOT NULL DEFAULT 0 COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `data_flag` int(11) NOT NULL DEFAULT 0 COMMENT '0正常,1隐藏',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `identification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='管理用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `user_name`, `real_name`, `password`, `salt`, `role_ids`, `depart_id`, `create_time`, `update_time`, `state`, `data_flag`, `created_at`, `updated_at`, `deleted_at`, `identification`) VALUES (1, 'admin', '超管A', '$2a$10$iyiCl8SlCt2VqrKpr3TJXeZbf1JDTxW6Jjb9uEQkKxkFpyviH3xwa', 'XoFFuS', 'sa', 1, '2020-04-20 13:51:03', '2020-04-20 13:51:03', 0, 0, '2020-04-20 13:51:03', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE `sys_user_authority` (
  `sys_user_id` bigint(20) unsigned NOT NULL,
  `sys_authority_authority_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_authority
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318103579445284865', '1', 'sa');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318128865264132097', '2', 'student');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
