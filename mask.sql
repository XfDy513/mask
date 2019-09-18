/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : mask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-09-18 18:45:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键，也是唯一编号',
  `user_name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `phone` char(11) CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '性别 0女 1男',
  `device_code` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户注册时设备号',
  `inviter` int(11) unsigned DEFAULT NULL COMMENT '邀请人的总数',
  `agent_status` tinyint(1) unsigned NOT NULL COMMENT '是否是代理  1是，0否',
  `status` tinyint(1) unsigned NOT NULL COMMENT '用户状态，是否被禁用，1是0否',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for account_income
-- ----------------------------
DROP TABLE IF EXISTS `account_income`;
CREATE TABLE `account_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `benefit` int(10) unsigned NOT NULL COMMENT '受益人',
  `income_source` int(10) unsigned NOT NULL COMMENT '消费人',
  `income_path` tinyint(1) unsigned NOT NULL COMMENT '1聊天,2礼物,3照片,4动态,5相册,6会员',
  `income_money` decimal(4,2) unsigned NOT NULL COMMENT '收益金额',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '收益时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for account_info
-- ----------------------------
DROP TABLE IF EXISTS `account_info`;
CREATE TABLE `account_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(10) unsigned NOT NULL COMMENT '唯一编号，account.id',
  `head_photo` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `user_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `resident_city` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '常驻城市',
  `age` tinyint(2) unsigned DEFAULT NULL COMMENT '年龄',
  `constellation` tinyint(2) unsigned DEFAULT NULL COMMENT '星座',
  `vocation` tinyint(3) unsigned DEFAULT NULL COMMENT '职业',
  `birthday` bigint(14) unsigned NOT NULL COMMENT '生日',
  `dating_show` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '约会节目',
  `hope_object` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '期望对象',
  `wechat` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信',
  `qq` bigint(20) unsigned DEFAULT NULL COMMENT 'QQ号码',
  `introduce` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人介绍',
  `balance` decimal(6,2) unsigned NOT NULL COMMENT '金额（余额）',
  `info_status` tinyint(1) unsigned NOT NULL COMMENT '是否需要验证查看',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agentor` int(10) unsigned NOT NULL COMMENT '代理人account.id',
  `invited` int(10) unsigned NOT NULL COMMENT '邀请的人',
  `income` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '收益',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '成为代理的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for consume
-- ----------------------------
DROP TABLE IF EXISTS `consume`;
CREATE TABLE `consume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `consume_account` int(11) NOT NULL,
  `consume_to` int(10) unsigned NOT NULL COMMENT '消费到哪里,值为account.id',
  `consume_path` tinyint(1) unsigned DEFAULT NULL COMMENT '1聊天,2礼物,3相册,4照片,5动态,6会员',
  `chat` int(10) unsigned DEFAULT NULL COMMENT '聊天人id',
  `gift` int(10) unsigned DEFAULT NULL COMMENT '礼物编号 gift.id',
  `album` int(10) unsigned DEFAULT NULL COMMENT '相册消费，值为相册归属人account.id',
  `photo` int(10) unsigned DEFAULT NULL COMMENT '照片编号',
  `trends` int(10) unsigned DEFAULT NULL COMMENT '动态编号',
  `amount` decimal(2,2) unsigned NOT NULL COMMENT '消费金额',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned DEFAULT NULL COMMENT '节目id',
  `trend_id` int(10) unsigned DEFAULT NULL COMMENT '动态id',
  `reviewer` int(10) unsigned NOT NULL COMMENT '评论人',
  `be_reviewer` int(10) unsigned NOT NULL COMMENT '被评论人',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '评论内容',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `id` int(11) NOT NULL,
  `gift_name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '礼物名称',
  `picture` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '礼物图片路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hope_object
-- ----------------------------
DROP TABLE IF EXISTS `hope_object`;
CREATE TABLE `hope_object` (
  `id` int(11) NOT NULL,
  `object` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '对象类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for info_see
-- ----------------------------
DROP TABLE IF EXISTS `info_see`;
CREATE TABLE `info_see` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petitioner` int(10) unsigned DEFAULT NULL COMMENT '请求访问人account.id',
  `verifier` int(10) unsigned DEFAULT NULL COMMENT '被访问人account,id',
  `verify_picture` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '验证照片',
  `request_time` bigint(14) unsigned DEFAULT NULL COMMENT '发送验证请求时间',
  `validate` tinyint(1) unsigned DEFAULT NULL COMMENT '验证 0拒绝，1允许',
  `pass_time` bigint(14) unsigned DEFAULT NULL COMMENT '验证通过时间 15天后过期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for look_info_check
-- ----------------------------
DROP TABLE IF EXISTS `look_info_check`;
CREATE TABLE `look_info_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `petitioner` int(10) unsigned NOT NULL COMMENT '请求者',
  `verifier` int(10) unsigned NOT NULL COMMENT '验证人',
  `verify_picture` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '验证图片',
  `request_time` bigint(14) unsigned NOT NULL COMMENT '请求时间',
  `validate_status` tinyint(1) unsigned NOT NULL COMMENT '验证状态 1允许，0拒绝',
  `pass_time` bigint(14) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setter` int(10) unsigned NOT NULL COMMENT '设置者account.id',
  `chat` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '私聊通知',
  `broadcast_sign_up` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '广播报名通知',
  `support` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新点赞提醒',
  `discuss` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新评论提醒',
  `new_broadcast` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新广播提醒',
  `verified` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户通过我的验证提醒',
  `invite_code` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '邀请码申请成功提醒',
  `voice` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '面具公园未打开时声音',
  `shock` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '面具公园未打开时震动',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `belonger` int(10) unsigned NOT NULL COMMENT '照片归属人',
  `photo_path` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '照片路径',
  `thumbnail_path` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '缩略图',
  `status` tinyint(1) unsigned NOT NULL COMMENT '照片状态 1正常，2阅后即焚，3红包阅后即焚，4红包相册',
  `money` decimal(2,2) unsigned DEFAULT NULL COMMENT '红包金额',
  `lookup_num` int(10) unsigned DEFAULT NULL COMMENT '被查看人数（非正常照片）',
  `photos_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否相册加锁 0否，1是',
  `lock_money` decimal(2,2) unsigned DEFAULT NULL,
  `create_time` bigint(14) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for plat_income
-- ----------------------------
DROP TABLE IF EXISTS `plat_income`;
CREATE TABLE `plat_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chat` decimal(10,2) unsigned DEFAULT NULL COMMENT '聊天消费',
  `gift` decimal(10,2) unsigned DEFAULT NULL COMMENT '礼物消费',
  `album` decimal(10,2) unsigned DEFAULT NULL COMMENT '相册消费',
  `photo` decimal(10,2) unsigned DEFAULT NULL COMMENT '照片消费',
  `program` decimal(10,2) unsigned DEFAULT NULL COMMENT '约节目消费',
  `trends` decimal(10,2) unsigned DEFAULT NULL COMMENT '动态消费',
  `vip` decimal(10,2) unsigned DEFAULT NULL,
  `create_time` bigint(14) unsigned NOT NULL COMMENT '收益时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for privacy_set
-- ----------------------------
DROP TABLE IF EXISTS `privacy_set`;
CREATE TABLE `privacy_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `setter` int(10) unsigned NOT NULL COMMENT '设置者',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否公开详情 1是，0否',
  `photos` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '付费相册 1是 0否',
  `look` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '查看前通过我的验证 0否，1是',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '公园列表隐藏我 1是 0否',
  `hide_distance` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '对他人隐藏我的距离 1是 0否',
  `hide_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '隐藏我的在线时间 1是 0否',
  `social_accounts` tinyint(1) unsigned NOT NULL COMMENT '隐藏社交账号 1是，0否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for program
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `theme` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '节目主题',
  `promoter` int(10) unsigned NOT NULL COMMENT '节目发起人',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `hope_object` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '期望对象',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '节目地点',
  `length_time` tinyint(1) unsigned NOT NULL COMMENT '节目时长',
  `layout` varchar(255) DEFAULT NULL COMMENT '节目配图id,逗号间隔',
  `explain` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '补充说明',
  `hide` tinyint(255) unsigned NOT NULL DEFAULT '0' COMMENT '同性隐藏 1是，0否',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '节目发布时间',
  `discuss` tinyint(255) DEFAULT NULL COMMENT '是否有评论，有则去查评论表，条件节目id',
  `close_discuss` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭评论，1是，0否',
  `click_support_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人数',
  `sign_up_sum` int(10) unsigned DEFAULT '0' COMMENT '报名人数',
  `close_sign_up` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '关闭报名 0否，1是',
  `report` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '举报状态 0否 1是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for program_picture
-- ----------------------------
DROP TABLE IF EXISTS `program_picture`;
CREATE TABLE `program_picture` (
  `id` int(11) NOT NULL,
  `program_id` int(10) unsigned NOT NULL COMMENT '节目id',
  `picture_path` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for program_signup
-- ----------------------------
DROP TABLE IF EXISTS `program_signup`;
CREATE TABLE `program_signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL COMMENT '节目id',
  `sign_up` int(10) unsigned NOT NULL COMMENT '报名者id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `report_type` tinyint(1) unsigned NOT NULL COMMENT '举报类型1对人举报,2节目举报,3动态举报',
  `report_cause` tinyint(1) unsigned NOT NULL COMMENT '举报原因 1广告/骗子，2虚假信息/盗用照片，3色情低俗，4骚扰/谩骂/不文明聊天',
  `accuser` int(10) unsigned NOT NULL COMMENT '举报人',
  `accused` int(10) unsigned NOT NULL COMMENT '被举报人',
  `program` int(10) unsigned DEFAULT NULL COMMENT '节目id',
  `trend` int(10) unsigned DEFAULT NULL COMMENT '动态id',
  `screen_capture` tinyint(1) unsigned DEFAULT NULL COMMENT '举报配图  对人举报必须有图片',
  `replenish` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '补充说明',
  `report_time` bigint(14) unsigned NOT NULL COMMENT '举报时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for report_picture
-- ----------------------------
DROP TABLE IF EXISTS `report_picture`;
CREATE TABLE `report_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `picture` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '配图路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for resident_city
-- ----------------------------
DROP TABLE IF EXISTS `resident_city`;
CREATE TABLE `resident_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '城市id',
  `province` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '省份',
  `city_name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for support_log
-- ----------------------------
DROP TABLE IF EXISTS `support_log`;
CREATE TABLE `support_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞记录表 主键',
  `clicker` int(10) unsigned NOT NULL COMMENT '点赞者',
  `blessed` int(10) unsigned NOT NULL COMMENT '被点赞的人',
  `program_id` int(10) unsigned DEFAULT NULL COMMENT '节目点赞',
  `trend_id` int(10) unsigned DEFAULT NULL COMMENT '动态点赞',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for trends
-- ----------------------------
DROP TABLE IF EXISTS `trends`;
CREATE TABLE `trends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `promoter` int(10) unsigned NOT NULL COMMENT '发起人',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '动态内容',
  `layout` tinyint(1) unsigned DEFAULT '0' COMMENT '动态配图 0无，1有',
  `discuss` tinyint(1) unsigned DEFAULT '0' COMMENT '评论0无1有',
  `close_discuss` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '关闭评论 0否 ，1是',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否对同性隐藏 0否，1是',
  `report` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被举报 0否，1是',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '动态发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for trend_picture
-- ----------------------------
DROP TABLE IF EXISTS `trend_picture`;
CREATE TABLE `trend_picture` (
  `id` int(11) NOT NULL,
  `trend_id` int(10) unsigned NOT NULL COMMENT '动态id',
  `picture_path` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '配图路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(10) unsigned NOT NULL COMMENT 'account.id',
  `buy_way` tinyint(1) unsigned NOT NULL COMMENT '购买方式',
  `buy_month` tinyint(2) unsigned NOT NULL COMMENT '购买周期',
  `invite_code` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '我的邀请码',
  `create_time` bigint(14) unsigned NOT NULL COMMENT '会员购买时间',
  `due_time` bigint(14) unsigned NOT NULL COMMENT '会员到期时间',
  `make_time` bigint(14) unsigned NOT NULL COMMENT '第一次成为会员时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for visit_notes
-- ----------------------------
DROP TABLE IF EXISTS `visit_notes`;
CREATE TABLE `visit_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `visitor` int(10) unsigned NOT NULL COMMENT '访问者account.id',
  `interviewee` int(10) unsigned NOT NULL COMMENT '被访问者 account.id',
  `photo_id` int(10) unsigned DEFAULT NULL COMMENT '被访问照片编号photos.id',
  `photo_pre_status` tinyint(1) unsigned DEFAULT NULL COMMENT '被访问照片原状态',
  `photo_after_status` tinyint(1) unsigned DEFAULT NULL COMMENT '访问后状态',
  `is_charge` tinyint(1) unsigned DEFAULT NULL COMMENT '是否红包照片 1是，0否',
  `is_pay` int(10) unsigned DEFAULT NULL COMMENT '是否支付,如果支付，则值为消费表id',
  `again_look` tinyint(1) unsigned DEFAULT NULL COMMENT '是否可以再次查看1是，0否',
  `date` bigint(20) unsigned NOT NULL COMMENT '访问日期，主要记录男士非会员每天免费查看15位女士',
  `atime` bigint(14) unsigned NOT NULL COMMENT '访问时间，方便排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vocation
-- ----------------------------
DROP TABLE IF EXISTS `vocation`;
CREATE TABLE `vocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '职业id',
  `name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '职业名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
