/*
Navicat MySQL Data Transfer

Source Server         : localhsot5.7
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : gfast-v32-roomchat

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-02-07 12:37:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', '1', '27', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '28', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '29', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '30', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '11', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '10', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '12', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '13', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '14', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '15', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '19', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '20', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '21', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '22', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '23', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '24', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '25', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '26', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '31', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '32', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '34', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '35', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '33', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_43', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_44', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_45', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_46', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_47', '9', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_31', '9', '', '', '', '');

-- ----------------------------
-- Table structure for message_content
-- ----------------------------
DROP TABLE IF EXISTS `message_content`;
CREATE TABLE `message_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_content
-- ----------------------------
INSERT INTO `message_content` VALUES ('407', '你号\n');
INSERT INTO `message_content` VALUES ('408', 'aasd');
INSERT INTO `message_content` VALUES ('409', '444');
INSERT INTO `message_content` VALUES ('410', 'asdasd');
INSERT INTO `message_content` VALUES ('411', 'yyyy');

-- ----------------------------
-- Table structure for message_list
-- ----------------------------
DROP TABLE IF EXISTS `message_list`;
CREATE TABLE `message_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint(20) unsigned DEFAULT '0' COMMENT '来源',
  `mtype` tinyint(3) DEFAULT '0' COMMENT '消息类型: 0 用户消息 1 用户进入 2 用户退出 3 错误消息',
  `ctype` tinyint(3) DEFAULT '0' COMMENT '消息格式: 0 字符串 1 图片',
  `msg_time` datetime DEFAULT NULL COMMENT '消息时间',
  `to` bigint(20) unsigned DEFAULT '0' COMMENT '目标用户',
  `message_content_id` bigint(20) DEFAULT '0' COMMENT '消息ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `room_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=545 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_list
-- ----------------------------
INSERT INTO `message_list` VALUES ('540', '31', '0', '0', null, '1', '407', '2024-02-05 18:01:18', '2024-02-05 18:01:18', null, '');
INSERT INTO `message_list` VALUES ('541', '31', '0', '0', null, '1', '408', '2024-02-05 18:06:10', '2024-02-05 18:06:10', null, '');
INSERT INTO `message_list` VALUES ('542', '1', '0', '0', null, '31', '409', '2024-02-05 18:06:16', '2024-02-05 18:06:16', null, '');
INSERT INTO `message_list` VALUES ('543', '1', '0', '0', null, '31', '410', '2024-02-05 18:18:12', '2024-02-05 18:18:12', null, '');
INSERT INTO `message_list` VALUES ('544', '31', '0', '0', null, '1', '411', '2024-02-05 18:18:17', '2024-02-05 18:18:17', null, '');

-- ----------------------------
-- Table structure for message_room
-- ----------------------------
DROP TABLE IF EXISTS `message_room`;
CREATE TABLE `message_room` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间名称',
  `identify` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '房间唯一标识',
  `inform` text COLLATE utf8_unicode_ci COMMENT '群公告',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identify_unique` (`identify`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_room
-- ----------------------------
INSERT INTO `message_room` VALUES ('21', '群聊_151', 'roomIdentify_21', null, '2024-02-04 09:21:39', '2024-02-04 09:21:39', null);
INSERT INTO `message_room` VALUES ('22', '群聊_922', 'roomIdentify_22', null, '2024-02-04 10:12:47', '2024-02-04 10:12:47', null);
INSERT INTO `message_room` VALUES ('23', '群聊_443', 'roomIdentify_23', null, '2024-02-05 09:23:35', '2024-02-05 09:23:35', null);

-- ----------------------------
-- Table structure for message_room_member
-- ----------------------------
DROP TABLE IF EXISTS `message_room_member`;
CREATE TABLE `message_room_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned DEFAULT '0' COMMENT '房间ID',
  `user_id` bigint(20) unsigned DEFAULT '0' COMMENT '成员ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id,user_id` (`room_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message_room_member
-- ----------------------------
INSERT INTO `message_room_member` VALUES ('58', '21', '1');
INSERT INTO `message_room_member` VALUES ('59', '21', '43');
INSERT INTO `message_room_member` VALUES ('60', '21', '44');
INSERT INTO `message_room_member` VALUES ('61', '22', '1');
INSERT INTO `message_room_member` VALUES ('62', '22', '43');
INSERT INTO `message_room_member` VALUES ('63', '22', '47');
INSERT INTO `message_room_member` VALUES ('64', '23', '1');
INSERT INTO `message_room_member` VALUES ('65', '23', '31');
INSERT INTO `message_room_member` VALUES ('66', '23', '43');

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `is_hide` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_iframe` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否内嵌iframe',
  `is_cached` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `redirect` varchar(255) NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否固定',
  `link_url` varchar(500) NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单节点表';

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES ('1', '0', 'api/v1/system/auth', '权限管理', 'ele-Stamp', '', '', '0', '30', '0', '/system/auth', 'layout/routerView/parent', '0', '', '0', '0', '1', '0', '0', '', '2022-03-24 15:03:37', '2022-04-14 16:29:19');
INSERT INTO `sys_auth_rule` VALUES ('2', '1', 'api/v1/system/auth/menuList', '菜单管理', 'ele-Calendar', '', '', '1', '0', '0', '/system/auth/menuList', 'system/menu/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-24 17:24:13', '2022-03-29 10:54:49');
INSERT INTO `sys_auth_rule` VALUES ('3', '2', 'api/v1/system/menu/add', '添加菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 16:48:43', '2022-03-29 17:05:19');
INSERT INTO `sys_auth_rule` VALUES ('4', '2', 'api/v1/system/menu/update', '修改菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 17:04:25', '2022-03-29 18:11:36');
INSERT INTO `sys_auth_rule` VALUES ('10', '1', 'api/v1/system/role/list', '角色管理', 'iconfont icon-juxingkaobei', '', '', '1', '0', '0', '/system/auth/roleList', 'system/role/index', '0', '', '0', '0', '1', '', '0', '', '2022-03-29 18:15:03', '2022-03-30 10:25:34');
INSERT INTO `sys_auth_rule` VALUES ('11', '2', 'api/v1/system/menu/delete', '删除菜单', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:10', '2022-04-06 14:49:17');
INSERT INTO `sys_auth_rule` VALUES ('12', '10', 'api/v1/system/role/add', '添加角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:49:46', '2022-04-06 14:49:46');
INSERT INTO `sys_auth_rule` VALUES ('13', '10', '/api/v1/system/role/edit', '修改角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:08', '2022-04-06 14:50:08');
INSERT INTO `sys_auth_rule` VALUES ('14', '10', '/api/v1/system/role/delete', '删除角色', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:50:22', '2022-04-06 14:50:22');
INSERT INTO `sys_auth_rule` VALUES ('15', '1', 'api/v1/system/dept/list', '部门管理', 'iconfont icon-siweidaotu', '', '', '1', '0', '0', '/system/auth/deptList', 'system/dept/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-06 14:52:23', '2022-04-07 22:59:20');
INSERT INTO `sys_auth_rule` VALUES ('16', '17', 'aliyun', '阿里云-iframe', 'iconfont icon-diannao1', '', '', '1', '0', '0', '/demo/outLink/aliyun', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'https://www.aliyun.com/daily-act/ecs/activity_selection?spm=5176.8789780.J_3965641470.5.568845b58KHj51', '2022-04-06 17:26:29', '2022-04-07 15:27:17');
INSERT INTO `sys_auth_rule` VALUES ('17', '0', 'outLink', '外链测试', 'iconfont icon-zhongduancanshu', '', '', '0', '20', '0', '/demo/outLink', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 15:20:51', '2022-04-14 16:29:07');
INSERT INTO `sys_auth_rule` VALUES ('18', '17', 'tenyun', '腾讯云-外链', 'iconfont icon-shouye_dongtaihui', '', '', '1', '0', '0', '/demo/outLink/tenyun', 'layout/routerView/link', '1', '', '0', '0', '1', '', '0', 'https://cloud.tencent.com/act/new?cps_key=20b1c3842f74986b2894e2c5fcde7ea2&fromSource=gwzcw.3775555.3775555.3775555&utm_id=gwzcw.3775555.3775555.3775555&utm_medium=cpc', '2022-04-07 15:23:52', '2022-04-07 15:27:25');
INSERT INTO `sys_auth_rule` VALUES ('19', '15', 'api/v1/system/dept/add', '添加部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:56:39', '2022-04-07 22:56:39');
INSERT INTO `sys_auth_rule` VALUES ('20', '15', 'api/v1/system/dept/edit', '修改部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:00', '2022-04-07 22:57:00');
INSERT INTO `sys_auth_rule` VALUES ('21', '15', 'api/v1/system/dept/delete', '删除部门', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:57:30', '2022-04-07 22:57:30');
INSERT INTO `sys_auth_rule` VALUES ('22', '1', 'api/v1/system/post/list', '岗位管理', 'iconfont icon-neiqianshujuchucun', '', '', '1', '0', '0', '/system/auth/postList', 'system/post/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-07 22:58:46', '2022-04-09 14:26:15');
INSERT INTO `sys_auth_rule` VALUES ('23', '22', 'api/v1/system/post/add', '添加岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:14:49', '2022-04-09 14:14:49');
INSERT INTO `sys_auth_rule` VALUES ('24', '22', 'api/v1/system/post/edit', '修改岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:25', '2022-04-09 14:15:25');
INSERT INTO `sys_auth_rule` VALUES ('25', '22', 'api/v1/system/post/delete', '删除岗位', '', '', '', '2', '0', '0', '', '', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:15:47', '2022-04-09 14:15:47');
INSERT INTO `sys_auth_rule` VALUES ('26', '1', 'api/v1/system/user/list', '用户管理', 'ele-User', '', '', '1', '0', '0', '/system/auth/user/list', 'system/user/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-09 14:19:10', '2022-04-09 14:19:58');
INSERT INTO `sys_auth_rule` VALUES ('27', '0', 'api/v1/system/dict', '系统配置', 'iconfont icon-shuxingtu', '', '', '0', '40', '0', '/system/dict', 'layout/routerView/parent', '0', '', '0', '0', '1', '654', '0', '', '2022-04-14 16:28:51', '2022-04-18 14:40:56');
INSERT INTO `sys_auth_rule` VALUES ('28', '27', 'api/v1/system/dict/type/list', '字典管理', 'iconfont icon-crew_feature', '', '', '1', '0', '0', '/system/dict/type/list', 'system/dict/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-14 16:32:10', '2022-04-16 17:02:50');
INSERT INTO `sys_auth_rule` VALUES ('29', '27', 'api/v1/system/dict/dataList', '字典数据管理', 'iconfont icon-putong', '', '', '1', '0', '1', '/system/dict/data/list/:dictType', 'system/dict/dataList', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 12:04:17', '2022-04-18 14:58:43');
INSERT INTO `sys_auth_rule` VALUES ('30', '27', 'api/v1/system/config/list', '参数管理', 'ele-Cherry', '', '', '1', '0', '0', '/system/config/list', 'system/config/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-18 21:05:20', '2022-04-18 21:13:19');
INSERT INTO `sys_auth_rule` VALUES ('31', '0', 'api/v1/system/monitor', '系统监控', 'iconfont icon-xuanzeqi', '', '', '0', '30', '0', '/system/monitor', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:40:19', '2022-04-19 10:44:38');
INSERT INTO `sys_auth_rule` VALUES ('32', '31', 'api/v1/system/monitor/server', '服务监控', 'iconfont icon-shuju', '', '', '1', '0', '0', '/system/monitor/server', 'system/monitor/server/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-19 10:43:32', '2022-04-19 10:44:47');
INSERT INTO `sys_auth_rule` VALUES ('33', '35', 'api/swagger', 'api文档', 'iconfont icon--chaifenlie', '', '', '1', '0', '0', '/system/swagger', 'layout/routerView/iframes', '1', '', '0', '1', '1', '', '0', 'http://localhost:8808/swagger', '2022-04-21 09:23:43', '2022-11-29 17:10:35');
INSERT INTO `sys_auth_rule` VALUES ('34', '31', 'api/v1/system/loginLog/list', '登录日志', 'ele-Finished', '', '', '1', '0', '0', '/system/monitor/loginLog', 'system/monitor/loginLog/index', '0', '', '0', '0', '1', '', '0', '', '2022-04-28 09:59:47', '2022-04-28 09:59:47');
INSERT INTO `sys_auth_rule` VALUES ('35', '0', 'api/v1/system/tools', '系统工具', 'iconfont icon-zujian', '', '', '0', '25', '0', '/system/tools', 'layout/routerView/parent', '0', '', '0', '0', '1', '', '0', '', '2022-10-26 09:29:08', '2022-10-26 10:11:25');
INSERT INTO `sys_auth_rule` VALUES ('38', '31', 'api/v1/system/operLog/list', '操作日志', 'iconfont icon-bolangnengshiyanchang', '', '', '1', '0', '0', '/system/monitor/operLog', 'system/monitor/operLog/index', '0', '', '0', '0', '1', '', '0', '', '2022-12-23 16:19:05', '2022-12-23 16:21:50');
INSERT INTO `sys_auth_rule` VALUES ('39', '31', 'api/v1/system/online/list', '在线用户', 'iconfont icon-skin', '', '', '1', '0', '0', '/system/monitor/userOnlie', 'system/monitor/userOnline/index', '0', '', '0', '0', '1', '', '0', '', '2023-01-11 15:48:06', '2023-01-11 17:02:39');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', '1', '31', '31', '文件上传大小限制', null, '2021-07-06 14:57:35');
INSERT INTO `sys_config` VALUES ('2', '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png,mp4', '1', '31', '31', '文件上传后缀类型限制', null, '2022-12-16 09:52:45');
INSERT INTO `sys_config` VALUES ('3', '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', '1', '31', '0', '图片上传后缀类型限制', null, null);
INSERT INTO `sys_config` VALUES ('4', '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', '1', '31', '31', '图片上传大小限制', null, null);
INSERT INTO `sys_config` VALUES ('11', '静态资源', 'static.resource', '/', '1', '2', '0', '', null, null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '奇讯科技', '0', null, '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-07-13 15:57:05', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', null, '15888888888', 'ry@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2021-11-04 09:16:38', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', null, '15888888888', 'ry@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('200', '100', '', '大数据', '1', '', '18888888888', 'liou@qq.com', '0', '0', '31', '2021-07-13 15:56:52', '2022-09-16 16:46:57', null);
INSERT INTO `sys_dept` VALUES ('201', '100', '', '开发', '1', null, '18888888888', 'li@qq.com', '0', '31', null, '2021-07-13 15:56:52', '2022-04-07 22:35:21', null);
INSERT INTO `sys_dept` VALUES ('202', '108', '', '外勤', '1', null, '18888888888', 'aa@qq.com', '1', '0', null, '2021-07-13 15:56:52', '2021-07-13 15:56:52', null);
INSERT INTO `sys_dept` VALUES ('203', '108', '', '行政', '0', '', '18888888888', 'aa@qq.com', '1', '0', '31', '2021-07-13 15:56:52', '2022-09-16 16:46:47', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '0', '男', '1', 'sys_user_sex', '', '', '0', '1', '31', '2', '备注信息', '2022-04-18 16:46:22', null);
INSERT INTO `sys_dict_data` VALUES ('2', '0', '女', '2', 'sys_user_sex', '', '', '0', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('3', '0', '保密', '0', 'sys_user_sex', '', '', '1', '1', '31', '31', '备注信息', null, null);
INSERT INTO `sys_dict_data` VALUES ('24', '0', '频道页', '1', 'cms_category_type', '', '', '0', '1', '31', '31', '作为频道页，不可作为栏目发布文章，可添加下级分类', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('25', '0', '发布栏目', '2', 'cms_category_type', '', '', '0', '1', '31', '31', '作为发布栏目，可添加文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('26', '0', '跳转栏目', '3', 'cms_category_type', '', '', '0', '1', '31', '31', '不直接发布内容，用于跳转页面', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('27', '0', '单页栏目', '4', 'cms_category_type', '', '', '0', '1', '31', '31', '单页面模式，分类直接显示为文章', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES ('28', '0', '正常', '0', 'sys_job_status', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('29', '0', '暂停', '1', 'sys_job_status', '', 'default', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '0', '默认', 'DEFAULT', 'sys_job_group', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '系统', 'SYSTEM', 'sys_job_group', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '0', '成功', '1', 'admin_login_status', '', 'default', '0', '1', '31', '31', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES ('33', '0', '失败', '0', 'admin_login_status', '', 'default', '0', '1', '31', '0', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES ('34', '0', '成功', '1', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '0', '失败', '0', 'sys_oper_log_status', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '0', '重复执行', '1', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('37', '0', '执行一次', '2', 'sys_job_policy', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('38', '0', '显示', '0', 'sys_show_hide', null, 'default', '1', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('39', '0', '隐藏', '1', 'sys_show_hide', null, 'default', '0', '1', '31', '0', null, null, null);
INSERT INTO `sys_dict_data` VALUES ('40', '0', '正常', '1', 'sys_normal_disable', '', 'default', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('41', '0', '停用', '0', 'sys_normal_disable', '', 'default', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('49', '0', '是', '1', 'sys_yes_no', '', '', '1', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('50', '0', '否', '0', 'sys_yes_no', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('51', '0', '已发布', '1', 'cms_article_pub_type', '', '', '1', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('54', '0', '未发布', '0', 'cms_article_pub_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('55', '0', '置顶', '1', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('56', '0', '推荐', '2', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('57', '0', '普通文章', '0', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('58', '0', '跳转链接', '1', 'cms_article_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('59', '0', 'cms模型', '6', 'cms_cate_models', '', '', '0', '1', '1', '1', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('61', '0', '政府工作目标', '1', 'gov_cate_models', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('62', '0', '系统后台', 'sys_admin', 'menu_module_type', '', '', '1', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('63', '0', '政务工作', 'gov_work', 'menu_module_type', '', '', '0', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('64', '0', '幻灯', '3', 'cms_article_attr', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('65', '0', '[work]测试业务表', 'wf_news', 'flow_type', '', '', '0', '1', '2', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('66', '0', '回退修改', '-1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('67', '0', '保存中', '0', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('68', '0', '流程中', '1', 'flow_status', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('69', '0', '审批通过', '2', 'flow_status', '', '', '0', '1', '31', '2', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('70', '2', '发布栏目', '2', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('71', '3', '跳转栏目', '3', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('72', '4', '单页栏目', '4', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('73', '2', '置顶', '1', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('74', '3', '幻灯', '2', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('75', '4', '推荐', '3', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('76', '1', '一般', '0', 'sys_log_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('77', '1', '频道页', '1', 'sys_blog_sign', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('78', '0', '普通', '0', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('79', '0', '加急', '1', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('80', '0', '紧急', '2', 'flow_level', '', '', '0', '1', '31', '0', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES ('81', '0', '特急', '3', 'flow_level', '', '', '0', '1', '31', '31', '', null, '2021-07-20 08:55:25');
INSERT INTO `sys_dict_data` VALUES ('82', '0', '频道页', '1', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('83', '0', '发布栏目', '2', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('84', '0', '跳转栏目', '3', 'sys_blog_type', '', '', '0', '1', '31', '31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('85', '0', '单页栏目', '4', 'sys_blog_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('87', '0', '[cms]文章表', 'cms_news', 'flow_type', '', '', '0', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('91', '0', '测试一下', '666', 'cms_article_type', '', '', '0', '1', '31', '0', '', '2021-08-03 17:04:12', '2021-08-03 17:04:12');
INSERT INTO `sys_dict_data` VALUES ('92', '0', '缓存测试222', '33333', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:16:45', '2021-08-03 17:19:41');
INSERT INTO `sys_dict_data` VALUES ('93', '0', '缓存测试222', '11111', 'cms_article_type', '', '', '0', '1', '31', '31', '', '2021-08-03 17:26:14', '2021-08-03 17:26:26');
INSERT INTO `sys_dict_data` VALUES ('94', '0', '1折', '10', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:38', '2021-08-14 11:59:38');
INSERT INTO `sys_dict_data` VALUES ('95', '0', '5折', '50', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 11:59:49', '2021-08-14 11:59:49');
INSERT INTO `sys_dict_data` VALUES ('96', '0', '8折', '80', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:00', '2021-08-14 12:00:00');
INSERT INTO `sys_dict_data` VALUES ('97', '0', '9折', '90', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:07', '2021-08-14 12:00:07');
INSERT INTO `sys_dict_data` VALUES ('98', '0', '无折扣', '100', 'plugin_store_discount', '', '', '0', '1', '31', '0', '', '2021-08-14 12:00:16', '2021-08-14 12:00:16');
INSERT INTO `sys_dict_data` VALUES ('99', '0', '不显示', 'none', 'cms_nav_position', '', '', '1', '1', '22', '0', '', '2021-08-31 15:37:35', '2021-08-31 15:37:35');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '顶部导航', 'top', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:37:57', '2021-08-31 15:37:57');
INSERT INTO `sys_dict_data` VALUES ('101', '0', '底部导航', 'bottom', 'cms_nav_position', '', '', '0', '1', '22', '0', '', '2021-08-31 15:38:08', '2021-08-31 15:38:08');
INSERT INTO `sys_dict_data` VALUES ('102', '0', '读取', 'GET', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:10', '2022-12-23 19:03:02');
INSERT INTO `sys_dict_data` VALUES ('103', '0', '新增', 'POST', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:22', '2022-12-23 19:03:10');
INSERT INTO `sys_dict_data` VALUES ('104', '0', '修改', 'PUT', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:32', '2022-12-23 19:03:19');
INSERT INTO `sys_dict_data` VALUES ('105', '0', '删除', 'DELETE', 'sys_oper_log_type', '', '', '0', '1', '31', '31', '', '2022-12-21 11:59:44', '2022-12-23 19:03:27');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int(64) unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int(64) unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '1', '31', '1', '用于选择用户性别', null, null);
INSERT INTO `sys_dict_type` VALUES ('2', '分类类型', 'cms_category_type', '1', '31', '3', '文章分类类型', null, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_type` VALUES ('3', '任务状态', 'sys_job_status', '1', '31', '31', '任务状态列表', null, null);
INSERT INTO `sys_dict_type` VALUES ('13', '任务分组', 'sys_job_group', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('14', '管理员登录状态', 'admin_login_status', '1', '31', '31', '', null, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_type` VALUES ('15', '操作日志状态', 'sys_oper_log_status', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('16', '任务策略', 'sys_job_policy', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('17', '菜单状态', 'sys_show_hide', '1', '31', '0', '菜单状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('18', '系统开关', 'sys_normal_disable', '1', '31', '31', '系统开关', null, null);
INSERT INTO `sys_dict_type` VALUES ('24', '系统内置', 'sys_yes_no', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('25', '文章发布状态', 'cms_article_pub_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('26', '文章附加状态', 'cms_article_attr', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('27', '文章类型', 'cms_article_type', '1', '31', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('28', '文章栏目模型分类', 'cms_cate_models', '1', '1', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('29', '政务工作模型分类', 'gov_cate_models', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('30', '菜单模块类型', 'menu_module_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('31', '工作流程类型', 'flow_type', '1', '2', '0', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('32', '工作流程审批状态', 'flow_status', '1', '31', '0', '工作流程审批状态', null, null);
INSERT INTO `sys_dict_type` VALUES ('33', '博客分类类型', 'sys_blog_type', '1', '31', '31', '博客分类中的标志', null, null);
INSERT INTO `sys_dict_type` VALUES ('34', '博客日志标志', 'sys_log_sign', '1', '31', '0', '博客日志管理中的标志数据字典', null, null);
INSERT INTO `sys_dict_type` VALUES ('35', '工作流紧急状态', 'flow_level', '1', '31', '31', '', null, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_type` VALUES ('48', '插件商城折扣', 'plugin_store_discount', '1', '31', '0', '', '2021-08-14 11:59:26', '2021-08-14 11:59:26');
INSERT INTO `sys_dict_type` VALUES ('49', 'CMS栏目导航位置', 'cms_nav_position', '1', '22', '0', '', '2021-08-31 15:37:04', '2021-08-31 15:37:04');
INSERT INTO `sys_dict_type` VALUES ('50', '操作日志类型', 'sys_oper_log_type', '1', '31', '0', '', '2022-12-21 11:55:02', '2022-12-21 11:55:02');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('2', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 11:52:52', '系统后台');
INSERT INTO `sys_login_log` VALUES ('3', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:29:54', '系统后台');
INSERT INTO `sys_login_log` VALUES ('4', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:53:02', '系统后台');
INSERT INTO `sys_login_log` VALUES ('5', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 15:53:26', '系统后台');
INSERT INTO `sys_login_log` VALUES ('6', '10001', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2023-12-11 16:02:37', '系统后台');
INSERT INTO `sys_login_log` VALUES ('7', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 17:53:32', '系统后台');
INSERT INTO `sys_login_log` VALUES ('8', '10001', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2023-12-11 18:03:41', '系统后台');
INSERT INTO `sys_login_log` VALUES ('9', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-11 18:04:07', '系统后台');
INSERT INTO `sys_login_log` VALUES ('10', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-12 08:38:18', '系统后台');
INSERT INTO `sys_login_log` VALUES ('11', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2023-12-12 08:56:28', '系统后台');
INSERT INTO `sys_login_log` VALUES ('12', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-04 09:18:46', '系统后台');
INSERT INTO `sys_login_log` VALUES ('13', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-04 09:20:54', '系统后台');
INSERT INTO `sys_login_log` VALUES ('14', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-04 10:12:33', '系统后台');
INSERT INTO `sys_login_log` VALUES ('15', 'demo', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-05 09:00:44', '系统后台');
INSERT INTO `sys_login_log` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2024-02-05 09:19:45', '系统后台');
INSERT INTO `sys_login_log` VALUES ('17', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-05 15:43:52', '系统后台');
INSERT INTO `sys_login_log` VALUES ('18', 'demo', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2024-02-05 18:01:12', '系统后台');
INSERT INTO `sys_login_log` VALUES ('19', 'admin', '::1', '内网IP', 'Chrome', 'Windows 10', '1', '登录成功', '2024-02-06 14:31:41', '系统后台');
INSERT INTO `sys_login_log` VALUES ('20', 'demo', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '1', '登录成功', '2024-02-06 14:40:56', '系统后台');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` text COMMENT '请求参数',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('61', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('62', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('63', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('64', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:56:35');
INSERT INTO `sys_oper_log` VALUES ('65', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000001\",\"nickName\":\"10001\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10001\"}', '', '2023-12-11 15:57:23');
INSERT INTO `sys_oper_log` VALUES ('66', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:57:23');
INSERT INTO `sys_oper_log` VALUES ('67', '角色管理', '0', '/api/v1/system/role/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/list?roleName=&roleStatus=&pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\",\"roleName\":\"\",\"roleStatus\":\"\"}', '', '2023-12-11 15:58:23');
INSERT INTO `sys_oper_log` VALUES ('68', '', '0', '/api/v1/system/role/getParams', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/getParams', '::1', '内网IP', '{}', '', '2023-12-11 15:58:29');
INSERT INTO `sys_oper_log` VALUES ('69', '添加角色', '0', '/api/v1/system/role/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/role/add', '::1', '内网IP', '{\"id\":0,\"listOrder\":0,\"menuIds\":[],\"name\":\"聊天演示\",\"remark\":\"聊天演示\",\"status\":1}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('70', '角色管理', '0', '/api/v1/system/role/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/list?roleName=&roleStatus=&pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\",\"roleName\":\"\",\"roleStatus\":\"\"}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('71', '', '0', '/api/v1/system/user/getUserMenus', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getUserMenus', '::1', '内网IP', '{}', '', '2023-12-11 15:59:11');
INSERT INTO `sys_oper_log` VALUES ('72', '', '0', '/api/v1/system/role/getParams', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/getParams', '::1', '内网IP', '{}', '', '2023-12-11 15:59:14');
INSERT INTO `sys_oper_log` VALUES ('73', '', '0', '/api/v1/system/role/get', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/role/get?id=9', '::1', '内网IP', '{\"id\":\"9\"}', '', '2023-12-11 15:59:14');
INSERT INTO `sys_oper_log` VALUES ('74', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('75', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('76', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('77', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('78', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=43', '::1', '内网IP', '{\"id\":\"43\"}', '', '2023-12-11 15:59:39');
INSERT INTO `sys_oper_log` VALUES ('79', '', '0', '/api/v1/system/user/edit', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/user/edit', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000001\",\"nickName\":\"10001\",\"password\":\"-\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"0\",\"status\":1,\"userId\":43,\"userName\":\"10001\"}', '', '2023-12-11 15:59:43');
INSERT INTO `sys_oper_log` VALUES ('80', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:43');
INSERT INTO `sys_oper_log` VALUES ('81', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('82', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('83', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('84', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 15:59:59');
INSERT INTO `sys_oper_log` VALUES ('85', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('86', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('87', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('88', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:06:46');
INSERT INTO `sys_oper_log` VALUES ('89', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('90', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('91', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('92', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('93', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('94', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('95', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('96', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('97', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000002\",\"nickName\":\"10002\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10002\"}', '', '2023-12-11 16:31:53');
INSERT INTO `sys_oper_log` VALUES ('98', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:31:53');
INSERT INTO `sys_oper_log` VALUES ('99', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000003\",\"nickName\":\"10003\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10003\"}', '', '2023-12-11 16:32:23');
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:32:23');
INSERT INTO `sys_oper_log` VALUES ('101', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000004\",\"nickName\":\"10004\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10004\"}', '', '2023-12-11 16:32:49');
INSERT INTO `sys_oper_log` VALUES ('102', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:32:49');
INSERT INTO `sys_oper_log` VALUES ('103', '', '0', '/api/v1/system/user/add', 'POST', '1', 'admin', '深圳总公司', '/api/v1/system/user/add', '::1', '内网IP', '{\"deptId\":100,\"email\":\"\",\"isAdmin\":1,\"mobile\":\"18800000005\",\"nickName\":\"10005\",\"password\":\"123456\",\"postIds\":[],\"remark\":\"\",\"roleIds\":[9],\"sex\":\"\",\"status\":1,\"userId\":0,\"userName\":\"10005\"}', '', '2023-12-11 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('104', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('105', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('106', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('107', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('108', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:40:13');
INSERT INTO `sys_oper_log` VALUES ('109', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('110', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('111', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('112', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:47:01');
INSERT INTO `sys_oper_log` VALUES ('113', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('114', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('115', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:47:09');
INSERT INTO `sys_oper_log` VALUES ('117', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('118', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('119', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('120', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 16:54:37');
INSERT INTO `sys_oper_log` VALUES ('121', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('122', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('123', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('124', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 17:52:50');
INSERT INTO `sys_oper_log` VALUES ('125', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('126', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('127', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 17:58:13');
INSERT INTO `sys_oper_log` VALUES ('129', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('130', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('131', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 18:00:01');
INSERT INTO `sys_oper_log` VALUES ('133', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('134', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('135', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('136', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-11 18:04:55');
INSERT INTO `sys_oper_log` VALUES ('137', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('138', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('139', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('140', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-12 10:13:19');
INSERT INTO `sys_oper_log` VALUES ('141', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2023-12-12 10:13:22');
INSERT INTO `sys_oper_log` VALUES ('142', '', '0', '/api/v1/system/user/edit', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/user/edit', '::1', '内网IP', '{\"deptId\":109,\"email\":\"123@qq.com\",\"isAdmin\":1,\"mobile\":\"15334455789\",\"nickName\":\"演示账号\",\"password\":\"-\",\"postIds\":[2],\"remark\":\"3\",\"roleIds\":[9],\"sex\":\"2\",\"status\":1,\"userId\":31,\"userName\":\"demo\"}', '', '2023-12-12 10:13:26');
INSERT INTO `sys_oper_log` VALUES ('143', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2023-12-12 10:13:26');
INSERT INTO `sys_oper_log` VALUES ('144', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 09:18:49');
INSERT INTO `sys_oper_log` VALUES ('145', '', '0', '/api/v1/system/personal/getPersonalInfo', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/personal/getPersonalInfo', '::1', '内网IP', '{}', '', '2024-02-04 09:18:56');
INSERT INTO `sys_oper_log` VALUES ('146', '', '0', '/api/v1/system/personal/resetPwd', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/personal/resetPwd', '::1', '内网IP', '{\"password\":\"123456\"}', '', '2024-02-04 09:19:05');
INSERT INTO `sys_oper_log` VALUES ('147', '', '0', '/api/v1/system/personal/resetPwd', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/personal/resetPwd', '::1', '内网IP', '{\"password\":\"123456\"}', '', '2024-02-04 09:19:47');
INSERT INTO `sys_oper_log` VALUES ('148', '', '0', '/api/v1/system/personal/getPersonalInfo', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/personal/getPersonalInfo', '::1', '内网IP', '{}', '', '2024-02-04 09:20:55');
INSERT INTO `sys_oper_log` VALUES ('149', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 09:20:55');
INSERT INTO `sys_oper_log` VALUES ('150', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_user_sex&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_user_sex\"}', '', '2024-02-04 09:21:01');
INSERT INTO `sys_oper_log` VALUES ('151', '', '0', '/api/v1/system/dept/treeSelect', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dept/treeSelect', '::1', '内网IP', '{}', '', '2024-02-04 09:21:01');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '0', '/api/v1/system/user/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/list?pageNum=1&pageSize=10&deptId=&mobile=&status=&keyWords=', '::1', '内网IP', '{\"deptId\":\"\",\"keyWords\":\"\",\"mobile\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 09:21:01');
INSERT INTO `sys_oper_log` VALUES ('153', '', '0', '/api/v1/system/user/params', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/params', '::1', '内网IP', '{}', '', '2024-02-04 09:21:01');
INSERT INTO `sys_oper_log` VALUES ('154', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-04 09:21:04');
INSERT INTO `sys_oper_log` VALUES ('155', '', '0', '/api/v1/system/user/resetPwd', 'PUT', '1', 'admin', '深圳总公司', '/api/v1/system/user/resetPwd', '::1', '内网IP', '{\"password\":\"123456\",\"userId\":31}', '', '2024-02-04 09:21:13');
INSERT INTO `sys_oper_log` VALUES ('156', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 10:12:04');
INSERT INTO `sys_oper_log` VALUES ('157', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 10:12:34');
INSERT INTO `sys_oper_log` VALUES ('158', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:27:47');
INSERT INTO `sys_oper_log` VALUES ('159', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:28:41');
INSERT INTO `sys_oper_log` VALUES ('160', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:30:53');
INSERT INTO `sys_oper_log` VALUES ('161', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:33:23');
INSERT INTO `sys_oper_log` VALUES ('162', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:33:57');
INSERT INTO `sys_oper_log` VALUES ('163', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:35:36');
INSERT INTO `sys_oper_log` VALUES ('164', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:36:39');
INSERT INTO `sys_oper_log` VALUES ('165', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:41:45');
INSERT INTO `sys_oper_log` VALUES ('166', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:45:11');
INSERT INTO `sys_oper_log` VALUES ('167', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 11:52:42');
INSERT INTO `sys_oper_log` VALUES ('168', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 14:38:41');
INSERT INTO `sys_oper_log` VALUES ('169', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 14:55:58');
INSERT INTO `sys_oper_log` VALUES ('170', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 14:57:48');
INSERT INTO `sys_oper_log` VALUES ('171', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 14:58:01');
INSERT INTO `sys_oper_log` VALUES ('172', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:03:22');
INSERT INTO `sys_oper_log` VALUES ('173', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:05:00');
INSERT INTO `sys_oper_log` VALUES ('174', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:12:52');
INSERT INTO `sys_oper_log` VALUES ('175', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:17:43');
INSERT INTO `sys_oper_log` VALUES ('176', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:18:20');
INSERT INTO `sys_oper_log` VALUES ('177', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:18:24');
INSERT INTO `sys_oper_log` VALUES ('178', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:20:21');
INSERT INTO `sys_oper_log` VALUES ('179', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:21:04');
INSERT INTO `sys_oper_log` VALUES ('180', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:32:28');
INSERT INTO `sys_oper_log` VALUES ('181', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:44:18');
INSERT INTO `sys_oper_log` VALUES ('182', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:45:10');
INSERT INTO `sys_oper_log` VALUES ('183', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:45:27');
INSERT INTO `sys_oper_log` VALUES ('184', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:49:26');
INSERT INTO `sys_oper_log` VALUES ('185', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:49:30');
INSERT INTO `sys_oper_log` VALUES ('186', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:51:54');
INSERT INTO `sys_oper_log` VALUES ('187', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:51:58');
INSERT INTO `sys_oper_log` VALUES ('188', '字典管理', '0', '/api/v1/system/dict/type/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/type/list?pageNum=1&pageSize=10&dictName=&dictType=&status=', '::1', '内网IP', '{\"dictName\":\"\",\"dictType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 15:54:46');
INSERT INTO `sys_oper_log` VALUES ('189', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:55:25');
INSERT INTO `sys_oper_log` VALUES ('190', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:55:30');
INSERT INTO `sys_oper_log` VALUES ('191', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:57:52');
INSERT INTO `sys_oper_log` VALUES ('192', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:57:56');
INSERT INTO `sys_oper_log` VALUES ('193', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:58:10');
INSERT INTO `sys_oper_log` VALUES ('194', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:58:40');
INSERT INTO `sys_oper_log` VALUES ('195', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:59:34');
INSERT INTO `sys_oper_log` VALUES ('196', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:59:37');
INSERT INTO `sys_oper_log` VALUES ('197', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 15:59:57');
INSERT INTO `sys_oper_log` VALUES ('198', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:00:02');
INSERT INTO `sys_oper_log` VALUES ('199', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:00:34');
INSERT INTO `sys_oper_log` VALUES ('200', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:00:37');
INSERT INTO `sys_oper_log` VALUES ('201', '字典管理', '0', '/api/v1/system/dict/type/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/type/list?pageNum=1&pageSize=10&dictName=&dictType=&status=', '::1', '内网IP', '{\"dictName\":\"\",\"dictType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 16:00:42');
INSERT INTO `sys_oper_log` VALUES ('202', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:01:01');
INSERT INTO `sys_oper_log` VALUES ('203', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:01:05');
INSERT INTO `sys_oper_log` VALUES ('204', '字典管理', '0', '/api/v1/system/dict/type/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/type/list?pageNum=1&pageSize=10&dictName=&dictType=&status=', '::1', '内网IP', '{\"dictName\":\"\",\"dictType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 16:01:05');
INSERT INTO `sys_oper_log` VALUES ('205', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_yes_no&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '', '2024-02-04 16:01:08');
INSERT INTO `sys_oper_log` VALUES ('206', '参数管理', '0', '/api/v1/system/config/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/config/list?pageNum=1&pageSize=10&configName=&configKey=&configType=', '::1', '内网IP', '{\"configKey\":\"\",\"configName\":\"\",\"configType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '', '2024-02-04 16:01:08');
INSERT INTO `sys_oper_log` VALUES ('207', '字典管理', '0', '/api/v1/system/dict/type/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/type/list?pageNum=1&pageSize=10&dictName=&dictType=&status=', '::1', '内网IP', '{\"dictName\":\"\",\"dictType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 16:01:11');
INSERT INTO `sys_oper_log` VALUES ('208', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_yes_no&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '', '2024-02-04 16:01:12');
INSERT INTO `sys_oper_log` VALUES ('209', '参数管理', '0', '/api/v1/system/config/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/config/list?pageNum=1&pageSize=10&configName=&configKey=&configType=', '::1', '内网IP', '{\"configKey\":\"\",\"configName\":\"\",\"configType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '', '2024-02-04 16:01:12');
INSERT INTO `sys_oper_log` VALUES ('210', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:04:48');
INSERT INTO `sys_oper_log` VALUES ('211', '', '0', '/api/v1/system/dict/data/getDictData', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/data/getDictData?dictType=sys_yes_no&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_yes_no\"}', '', '2024-02-04 16:04:51');
INSERT INTO `sys_oper_log` VALUES ('212', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:04:51');
INSERT INTO `sys_oper_log` VALUES ('213', '参数管理', '0', '/api/v1/system/config/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/config/list?pageNum=1&pageSize=10&configName=&configKey=&configType=', '::1', '内网IP', '{\"configKey\":\"\",\"configName\":\"\",\"configType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\"}', '', '2024-02-04 16:04:51');
INSERT INTO `sys_oper_log` VALUES ('214', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:06:08');
INSERT INTO `sys_oper_log` VALUES ('215', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:06:11');
INSERT INTO `sys_oper_log` VALUES ('216', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:07:33');
INSERT INTO `sys_oper_log` VALUES ('217', '字典管理', '0', '/api/v1/system/dict/type/list', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/dict/type/list?pageNum=1&pageSize=10&dictName=&dictType=&status=', '::1', '内网IP', '{\"dictName\":\"\",\"dictType\":\"\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"status\":\"\"}', '', '2024-02-04 16:07:43');
INSERT INTO `sys_oper_log` VALUES ('218', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:11:25');
INSERT INTO `sys_oper_log` VALUES ('219', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:14:52');
INSERT INTO `sys_oper_log` VALUES ('220', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:02');
INSERT INTO `sys_oper_log` VALUES ('221', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:12');
INSERT INTO `sys_oper_log` VALUES ('222', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:15');
INSERT INTO `sys_oper_log` VALUES ('223', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:26');
INSERT INTO `sys_oper_log` VALUES ('224', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:26');
INSERT INTO `sys_oper_log` VALUES ('225', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:29');
INSERT INTO `sys_oper_log` VALUES ('226', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:50');
INSERT INTO `sys_oper_log` VALUES ('227', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:15:54');
INSERT INTO `sys_oper_log` VALUES ('228', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:19:16');
INSERT INTO `sys_oper_log` VALUES ('229', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:19:19');
INSERT INTO `sys_oper_log` VALUES ('230', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:22:24');
INSERT INTO `sys_oper_log` VALUES ('231', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:23:06');
INSERT INTO `sys_oper_log` VALUES ('232', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:23:25');
INSERT INTO `sys_oper_log` VALUES ('233', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:24:34');
INSERT INTO `sys_oper_log` VALUES ('234', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:24:42');
INSERT INTO `sys_oper_log` VALUES ('235', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:27:41');
INSERT INTO `sys_oper_log` VALUES ('236', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 16:45:25');
INSERT INTO `sys_oper_log` VALUES ('237', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:15:08');
INSERT INTO `sys_oper_log` VALUES ('238', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:32:47');
INSERT INTO `sys_oper_log` VALUES ('239', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:33:04');
INSERT INTO `sys_oper_log` VALUES ('240', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:35:54');
INSERT INTO `sys_oper_log` VALUES ('241', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:40:02');
INSERT INTO `sys_oper_log` VALUES ('242', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:40:49');
INSERT INTO `sys_oper_log` VALUES ('243', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:44:59');
INSERT INTO `sys_oper_log` VALUES ('244', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:45:14');
INSERT INTO `sys_oper_log` VALUES ('245', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:52:54');
INSERT INTO `sys_oper_log` VALUES ('246', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:54:06');
INSERT INTO `sys_oper_log` VALUES ('247', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:54:26');
INSERT INTO `sys_oper_log` VALUES ('248', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:55:20');
INSERT INTO `sys_oper_log` VALUES ('249', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:56:54');
INSERT INTO `sys_oper_log` VALUES ('250', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 17:59:55');
INSERT INTO `sys_oper_log` VALUES ('251', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:01:52');
INSERT INTO `sys_oper_log` VALUES ('252', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:03:46');
INSERT INTO `sys_oper_log` VALUES ('253', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:05:18');
INSERT INTO `sys_oper_log` VALUES ('254', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:09:06');
INSERT INTO `sys_oper_log` VALUES ('255', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:12:01');
INSERT INTO `sys_oper_log` VALUES ('256', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-04 18:12:47');
INSERT INTO `sys_oper_log` VALUES ('257', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:00:47');
INSERT INTO `sys_oper_log` VALUES ('258', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:18:37');
INSERT INTO `sys_oper_log` VALUES ('259', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 09:19:46');
INSERT INTO `sys_oper_log` VALUES ('260', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:28:46');
INSERT INTO `sys_oper_log` VALUES ('261', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:43:16');
INSERT INTO `sys_oper_log` VALUES ('262', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:44:15');
INSERT INTO `sys_oper_log` VALUES ('263', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 09:48:04');
INSERT INTO `sys_oper_log` VALUES ('264', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 10:16:49');
INSERT INTO `sys_oper_log` VALUES ('265', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 10:27:16');
INSERT INTO `sys_oper_log` VALUES ('266', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 10:27:16');
INSERT INTO `sys_oper_log` VALUES ('267', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 10:27:22');
INSERT INTO `sys_oper_log` VALUES ('268', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:40:22');
INSERT INTO `sys_oper_log` VALUES ('269', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:40:22');
INSERT INTO `sys_oper_log` VALUES ('270', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:40:29');
INSERT INTO `sys_oper_log` VALUES ('271', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:45:13');
INSERT INTO `sys_oper_log` VALUES ('272', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:45:13');
INSERT INTO `sys_oper_log` VALUES ('273', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:45:26');
INSERT INTO `sys_oper_log` VALUES ('274', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:45:26');
INSERT INTO `sys_oper_log` VALUES ('275', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:45:46');
INSERT INTO `sys_oper_log` VALUES ('276', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:45:46');
INSERT INTO `sys_oper_log` VALUES ('277', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:46:14');
INSERT INTO `sys_oper_log` VALUES ('278', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:46:15');
INSERT INTO `sys_oper_log` VALUES ('279', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:46:49');
INSERT INTO `sys_oper_log` VALUES ('280', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:46:49');
INSERT INTO `sys_oper_log` VALUES ('281', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:49:49');
INSERT INTO `sys_oper_log` VALUES ('282', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:49:49');
INSERT INTO `sys_oper_log` VALUES ('283', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:49:50');
INSERT INTO `sys_oper_log` VALUES ('284', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:49:50');
INSERT INTO `sys_oper_log` VALUES ('285', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:50:02');
INSERT INTO `sys_oper_log` VALUES ('286', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '127.0.0.1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 11:50:37');
INSERT INTO `sys_oper_log` VALUES ('287', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '::1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 11:50:37');
INSERT INTO `sys_oper_log` VALUES ('288', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 15:43:54');
INSERT INTO `sys_oper_log` VALUES ('289', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 15:53:38');
INSERT INTO `sys_oper_log` VALUES ('290', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 16:26:32');
INSERT INTO `sys_oper_log` VALUES ('291', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 16:28:06');
INSERT INTO `sys_oper_log` VALUES ('292', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 17:02:29');
INSERT INTO `sys_oper_log` VALUES ('293', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 17:59:11');
INSERT INTO `sys_oper_log` VALUES ('294', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:00:18');
INSERT INTO `sys_oper_log` VALUES ('295', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:01:13');
INSERT INTO `sys_oper_log` VALUES ('296', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:05:38');
INSERT INTO `sys_oper_log` VALUES ('297', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:05:39');
INSERT INTO `sys_oper_log` VALUES ('298', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:05:41');
INSERT INTO `sys_oper_log` VALUES ('299', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:05:47');
INSERT INTO `sys_oper_log` VALUES ('300', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:08:11');
INSERT INTO `sys_oper_log` VALUES ('301', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:08:11');
INSERT INTO `sys_oper_log` VALUES ('302', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:17:44');
INSERT INTO `sys_oper_log` VALUES ('303', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:17:44');
INSERT INTO `sys_oper_log` VALUES ('304', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-05 18:18:02');
INSERT INTO `sys_oper_log` VALUES ('305', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-05 18:18:05');
INSERT INTO `sys_oper_log` VALUES ('306', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:31:43');
INSERT INTO `sys_oper_log` VALUES ('307', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 14:40:57');
INSERT INTO `sys_oper_log` VALUES ('308', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:48:04');
INSERT INTO `sys_oper_log` VALUES ('309', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 14:48:04');
INSERT INTO `sys_oper_log` VALUES ('310', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:48:09');
INSERT INTO `sys_oper_log` VALUES ('311', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 14:50:09');
INSERT INTO `sys_oper_log` VALUES ('312', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:50:09');
INSERT INTO `sys_oper_log` VALUES ('313', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:50:16');
INSERT INTO `sys_oper_log` VALUES ('314', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:53:21');
INSERT INTO `sys_oper_log` VALUES ('315', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:57:23');
INSERT INTO `sys_oper_log` VALUES ('316', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:57:43');
INSERT INTO `sys_oper_log` VALUES ('317', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 14:59:17');
INSERT INTO `sys_oper_log` VALUES ('318', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:59:18');
INSERT INTO `sys_oper_log` VALUES ('319', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 14:59:40');
INSERT INTO `sys_oper_log` VALUES ('320', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:01:00');
INSERT INTO `sys_oper_log` VALUES ('321', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:01:00');
INSERT INTO `sys_oper_log` VALUES ('322', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:08:38');
INSERT INTO `sys_oper_log` VALUES ('323', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:08:38');
INSERT INTO `sys_oper_log` VALUES ('324', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:15:17');
INSERT INTO `sys_oper_log` VALUES ('325', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:15:17');
INSERT INTO `sys_oper_log` VALUES ('326', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:15:27');
INSERT INTO `sys_oper_log` VALUES ('327', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:15:56');
INSERT INTO `sys_oper_log` VALUES ('328', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:15:56');
INSERT INTO `sys_oper_log` VALUES ('329', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:16:02');
INSERT INTO `sys_oper_log` VALUES ('330', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:16:06');
INSERT INTO `sys_oper_log` VALUES ('331', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:16:07');
INSERT INTO `sys_oper_log` VALUES ('332', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:20:24');
INSERT INTO `sys_oper_log` VALUES ('333', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:20:26');
INSERT INTO `sys_oper_log` VALUES ('334', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:21:11');
INSERT INTO `sys_oper_log` VALUES ('335', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:21:11');
INSERT INTO `sys_oper_log` VALUES ('336', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:28:00');
INSERT INTO `sys_oper_log` VALUES ('337', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:29:25');
INSERT INTO `sys_oper_log` VALUES ('338', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:29:25');
INSERT INTO `sys_oper_log` VALUES ('339', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:29:31');
INSERT INTO `sys_oper_log` VALUES ('340', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:30:26');
INSERT INTO `sys_oper_log` VALUES ('341', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:30:26');
INSERT INTO `sys_oper_log` VALUES ('342', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:44:02');
INSERT INTO `sys_oper_log` VALUES ('343', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:44:03');
INSERT INTO `sys_oper_log` VALUES ('344', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:46:54');
INSERT INTO `sys_oper_log` VALUES ('345', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 15:46:55');
INSERT INTO `sys_oper_log` VALUES ('346', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:47:02');
INSERT INTO `sys_oper_log` VALUES ('347', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 15:48:08');
INSERT INTO `sys_oper_log` VALUES ('348', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:13:03');
INSERT INTO `sys_oper_log` VALUES ('349', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:14:33');
INSERT INTO `sys_oper_log` VALUES ('350', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:15:58');
INSERT INTO `sys_oper_log` VALUES ('351', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:15:58');
INSERT INTO `sys_oper_log` VALUES ('352', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:16:05');
INSERT INTO `sys_oper_log` VALUES ('353', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:44:19');
INSERT INTO `sys_oper_log` VALUES ('354', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:44:20');
INSERT INTO `sys_oper_log` VALUES ('355', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:50:32');
INSERT INTO `sys_oper_log` VALUES ('356', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:50:33');
INSERT INTO `sys_oper_log` VALUES ('357', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:50:38');
INSERT INTO `sys_oper_log` VALUES ('358', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:54:35');
INSERT INTO `sys_oper_log` VALUES ('359', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:54:35');
INSERT INTO `sys_oper_log` VALUES ('360', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:55:34');
INSERT INTO `sys_oper_log` VALUES ('361', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:55:34');
INSERT INTO `sys_oper_log` VALUES ('362', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 16:56:45');
INSERT INTO `sys_oper_log` VALUES ('363', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 16:56:46');
INSERT INTO `sys_oper_log` VALUES ('364', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:03:27');
INSERT INTO `sys_oper_log` VALUES ('365', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:03:27');
INSERT INTO `sys_oper_log` VALUES ('366', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 17:03:27');
INSERT INTO `sys_oper_log` VALUES ('367', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 17:03:28');
INSERT INTO `sys_oper_log` VALUES ('368', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:03:39');
INSERT INTO `sys_oper_log` VALUES ('369', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:10:37');
INSERT INTO `sys_oper_log` VALUES ('370', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 17:10:38');
INSERT INTO `sys_oper_log` VALUES ('371', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:11:07');
INSERT INTO `sys_oper_log` VALUES ('372', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 17:11:07');
INSERT INTO `sys_oper_log` VALUES ('373', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'admin', '深圳总公司', '/api/v1/system/user/getEdit?id=1', '::1', '内网IP', '{\"id\":\"1\"}', '', '2024-02-06 17:20:13');
INSERT INTO `sys_oper_log` VALUES ('374', '', '0', '/api/v1/system/user/getEdit', 'GET', '1', 'demo', '财务部门', '/api/v1/system/user/getEdit?id=31', '127.0.0.1', '内网IP', '{\"id\":\"31\"}', '', '2024-02-06 17:20:19');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '1', '', '0', '0', '2021-07-11 11:32:58', null, null);
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '1', '', '0', '0', '2021-07-12 11:01:26', null, null);
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '1', '', '0', '31', '2021-07-12 11:01:30', '2022-09-16 16:48:18', null);
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', '普通员工', '0', '31', '2021-07-12 11:01:33', '2022-04-08 15:32:23', null);
INSERT INTO `sys_post` VALUES ('5', 'it', 'IT部', '5', '1', '信息部', '31', '31', '2021-07-12 11:09:42', '2022-04-09 12:59:12', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `list_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-28 10:00:15');
INSERT INTO `sys_role` VALUES ('2', '1', '0', '普通管理员', '备注', '3', '2022-04-01 11:38:39', '2022-04-28 10:01:34');
INSERT INTO `sys_role` VALUES ('3', '1', '0', '站点管理员', '站点管理人员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('4', '1', '0', '初级管理员', '初级管理员', '3', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('5', '1', '0', '高级管理员', '高级管理员', '2', '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES ('8', '1', '0', '区级管理员', '', '2', '2022-04-01 11:38:39', '2022-04-06 09:53:40');
INSERT INTO `sys_role` VALUES ('9', '1', '0', '聊天演示', '聊天演示', '3', '2023-12-11 15:59:11', '2023-12-11 15:59:11');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('5', '103');
INSERT INTO `sys_role_dept` VALUES ('5', '104');
INSERT INTO `sys_role_dept` VALUES ('5', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '105');
INSERT INTO `sys_role_dept` VALUES ('8', '106');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_login` (`user_name`,`deleted_at`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`,`deleted_at`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '13578342363', '超级管理员', '0', 'd84217993c0538e6e9caeca6236ecdf7', 'ndBNTGhEAX', '1', 'yxh669@qq.com', '1', 'upload_file/avatar/01.jpeg', '101', '', '1', 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '::1', '2024-02-06 14:31:41', '2021-06-22 17:58:00', '2024-02-04 09:19:47', null);
INSERT INTO `sys_user` VALUES ('31', 'demo', '15334455789', '演示账号', '0', '6dd68eea81e0fca319add0bd58c3fdf6', '46PvWe1Sl7', '1', '123@qq.com', '2', 'upload_file/avatar/02.jpeg', '109', '3', '1', '云南省曲靖市22223', '生活变的再糟糕，也不妨碍我变得更好', '127.0.0.1', '2024-02-06 14:40:56', '2021-06-22 17:58:00', '2023-12-12 10:13:26', null);
INSERT INTO `sys_user` VALUES ('43', '10001', '18800000001', '张飞', '0', '86c8b432832755a8a1a30b37abd7b350', 'GbDcSwi5pP', '1', '', '0', 'upload_file/avatar/03.jpeg', '100', '', '1', '', '', '127.0.0.1', '2023-12-11 18:03:41', '2023-12-11 15:57:22', '2023-12-11 15:59:43', null);
INSERT INTO `sys_user` VALUES ('44', '10002', '18800000002', '赵云', '0', '9bb19a3a6ac101c4b756f6254d75ae52', 'z7ApNfLD7b', '1', '', '0', 'upload_file/avatar/04.jpeg', '100', '', '1', '', '', '', null, '2023-12-11 16:31:52', '2023-12-11 16:31:52', null);
INSERT INTO `sys_user` VALUES ('45', '10003', '18800000003', '关羽', '0', 'b2a9a7a50facd629d661c0fc816bd123', '70CfL5HdbE', '1', '', '0', 'upload_file/avatar/05.jpeg', '100', '', '1', '', '', '', null, '2023-12-11 16:32:23', '2023-12-11 16:32:23', null);
INSERT INTO `sys_user` VALUES ('46', '10004', '18800000004', '曹操', '0', '31d80dd5b6c9c9f5c421f03695331694', '7LFc54F7yz', '1', '', '0', 'upload_file/avatar/06.jpeg', '100', '', '1', '', '', '', null, '2023-12-11 16:32:49', '2023-12-11 16:32:49', null);
INSERT INTO `sys_user` VALUES ('47', '10005', '18800000005', '孙权', '0', '970373c1046cade51cda5c167c37d1f0', 'bL4TSPf4aS', '1', '', '0', 'upload_file/avatar/07.jpeg', '100', '', '1', '', '', '', null, '2023-12-11 16:33:36', '2023-12-11 16:33:36', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `ip` varchar(120) NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户在线状态表';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('21', '8efe68bed2804ba03e7e555a5edc43b0', 'epkdiFldUlpTHB1FaL+k85Yny6P4BvdErPPVn0Tv96Chn59/qKQYMyq+jim7OJxodDyuMie8UEw2d8yb31ZrRaO5xA66P6Ypzc79C8de+ks/Mn5Q9G9IxYCB3aTpBkaFEnW2yXv37tru6H402SkJHA==', '2023-12-11 16:02:37', '10001', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('22', '9b5ffb4d091918a6eb2a4854d6fc41e0', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvl+hzds7wrjGWzbOeWAPzXoXYmfSpwPn+EilHWmJ1Hp5aUVFZE0FHxYghRa3FjMYwQ==', '2023-12-11 17:53:32', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('23', '1bc953f97bfc49bd2c1e8454ee66f930', 'epkdiFldUlpTHB1FaL+k85Yny6P4BvdErPPVn0Tv96Chn59/qKQYMyq+jim7OJxodDyuMie8UEw2d8yb31ZrRe/0Xw3SvMTedhhAkCHzBcNPv91H0nYaga5QClVMAs1U4z6VN2xotH+0dUon/48xDQ==', '2023-12-11 18:03:41', '10001', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('24', '13eae77b38cfc62bbe0ba153c3554755', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvmcSp00Y62dkuvj4T2TanokC3hDv+dky6tKZSHbsyHpDj/L8xSVce3zHg9X1ve+jzg==', '2023-12-11 18:04:07', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('25', 'e3988e311d2fe6d59f4bc59e526e08d7', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkRdI3L4RWTfSEVwwgX3sK5/k7qaR7SDwVipVyygsJk2M2IWEvyy9V1ageJdYj1WWudUzTn9I71pTgc/RlqL1oN+sbucvwJwll+Y4JQZVeOikTg==', '2023-12-12 08:38:18', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('26', '097bf7369c3624a8ff302d898297643f', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO3oQ4U2J4GO9GjSn7dcDNHU/fDkF0UuaY/4zxwJggcjvirjAGvS2nnPbRDRQHEingM+YSwJGUUV4+oasS5xIF55W0tZJuS4EdxGyfvdhW9VCw==', '2023-12-12 08:56:28', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('27', '6f18c07547dff8440ff33e39bb8f61f6', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkRdI3L4RWTfSEVwwgX3sK5/k7qaR7SDwVipVyygsJk2M2LKcS63Vs3f07IS5jLHlKoweDK3fRV6PV+WY+HvEP0PAmmTeM3A6rU4JcPewmcIt2g==', '2024-02-04 09:18:46', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('28', '19a4589c9995ba6cbcfa961cfe298f1b', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkReIjdcSFqNnoKGvBsV4C9paZD7i4xvI/WNbIWok8FRVaEcLdTK1mKVOSQv8QXtbsTX1/WrTpti+6p638yHySZZJUIIwk1xWj/NqeAvq/n5ylw==', '2024-02-04 09:20:54', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('29', '4232d02378ab8b595c4581a0ee682442', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkReIjdcSFqNnoKGvBsV4C9paZD7i4xvI/WNbIWok8FRVaA+GU5YRJBTnozo87d+Pnz6wRiW7nEG27dl6fBICz2B7h1Ik/PNu1i3lAfnFpbQanQ==', '2024-02-04 10:12:33', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('30', '7ffa54c26e620db90a7e8ef4dca3a705', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO0kFeGUBvtVuEzt7N0pZMMWYq1cEs7pPQs5GX+RGRVyvQpnCXxld3oUAnSklDOK4UD9GqSR1D4ix+P9hVl6AmkuKgJBo3EGzNShm2Qt6vy/bA==', '2024-02-05 09:00:44', 'demo', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('31', '02c30ec9d5cc121cbfd3cb7963e3ca8c', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkRfF8LRaN7n+dqJ5ZIrfDQK4Gza9I6V8BlYidrcsjn9B/D/uwTO5pyt+kkzJ8w/Bv/3Jn/bOUWxs990P2TiqQ42KkRmiHo+vaidouZXHr2Lmnw==', '2024-02-05 09:19:45', 'admin', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('32', 'fb2f55a4dce26819713a1aae2ec43814', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkReIjdcSFqNnoKGvBsV4C9paZD7i4xvI/WNbIWok8FRVaH7knD9sXeVABJqCky39Lxx0XlevSu+iZ2rqNRw2VaIA/C/sinaFjMC1xEjJeJhT6g==', '2024-02-05 15:43:52', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('33', 'cdc1e2b6e32d8702e4020749146e2ebc', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO1zHbsr/ct9sQhbIsrvrhKbxNkBXz4hoUuvPrdDzfRwag3Iq3oAoPUEQCTl/++ukIEKursN3SUOoNqWSBzyJ2Yqu485+1sg3HP2NV70OViOtQ==', '2024-02-05 18:01:12', 'demo', '127.0.0.1', 'Firefox', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('34', '4a6a6ce26326370688c9eac53d6d8e62', '5rrLCPtzPM4tnvlHq+0iav2BDmIrd9QCru7zhgXMkReIjdcSFqNnoKGvBsV4C9paZD7i4xvI/WNbIWok8FRVaBKjFuD4/dSkXW1bxEoVpnjw4TOA7ZH69d/niXdh9PMIS+vXOSxefuB3J2DP0f/gUQ==', '2024-02-06 14:31:41', 'admin', '::1', 'Chrome', 'Windows 10');
INSERT INTO `sys_user_online` VALUES ('35', '8539c7f47ba1c0e210579f0c7e078f5d', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO1zHbsr/ct9sQhbIsrvrhKbxNkBXz4hoUuvPrdDzfRwavWEe9HkTa0R/eYEXJj6zH9SPsEvO1Y7Eys0rQJDs/F7Jp2+G6oNdJCWR9jZZY3LdQ==', '2024-02-06 14:40:56', 'demo', '127.0.0.1', 'Firefox', 'Windows 10');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '2');
INSERT INTO `sys_user_post` VALUES ('1', '3');
INSERT INTO `sys_user_post` VALUES ('31', '2');
