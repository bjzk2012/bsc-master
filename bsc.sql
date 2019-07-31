/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : bsc

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-07-31 22:29:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `simple_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoqdgl3yv2b2x0a88dh6vtxjya` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '2019-07-24 13:42:59', '1', '1', '2019-07-26 19:39:13', null, null, '2', '', '部门1', '部门1', null, '3');
INSERT INTO `sys_dept` VALUES ('2', '2019-07-24 13:44:49', '2', '2', null, null, null, '0', null, '部门2', '部门2', null, '1');
INSERT INTO `sys_dept` VALUES ('3', '2019-07-26 19:35:09', '1', 'admin', null, null, null, '0', '', '111', '啊啊啊', null, null);
INSERT INTO `sys_dept` VALUES ('4', '2019-07-26 19:35:17', '1', 'admin', null, null, null, '0', '', '擦擦擦', '擦擦擦', null, '1');
INSERT INTO `sys_dept` VALUES ('5', '2019-07-26 19:35:28', '1', 'admin', '2019-07-26 19:40:13', null, null, '1', '', '本本v', '本本v', null, '4');
INSERT INTO `sys_dept` VALUES ('6', '2019-07-26 19:35:37', '1', 'admin', null, null, null, '0', '', '滚滚滚', '滚滚滚', null, '1');
INSERT INTO `sys_dept` VALUES ('7', '2019-07-26 19:35:52', '1', 'admin', null, null, null, '0', '', '反反复复', '顶顶顶顶', null, '2');
INSERT INTO `sys_dept` VALUES ('8', '2019-07-27 02:36:22', '1', 'admin', null, null, null, '0', '', '11', '11', '1', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21ymtrempcc0nebppl33qo9id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('50', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'SEX', '', '性别', '0', null);
INSERT INTO `sys_dict` VALUES ('51', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'M', '', '男', '1', '50');
INSERT INTO `sys_dict` VALUES ('52', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'F', '', '女', '2', '50');
INSERT INTO `sys_dict` VALUES ('53', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'STATUS', '', '状态', '0', null);
INSERT INTO `sys_dict` VALUES ('54', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'ENABLE', '', '启用', '1', '53');
INSERT INTO `sys_dict` VALUES ('55', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'DISABLE', '', '禁用', '2', '53');
INSERT INTO `sys_dict` VALUES ('56', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'ACCOUNT_STATUS', '', '账号状态', '0', null);
INSERT INTO `sys_dict` VALUES ('57', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'ENABLE', '', '启用', '1', '56');
INSERT INTO `sys_dict` VALUES ('58', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'FREEZE', '', '冻结', '2', '56');
INSERT INTO `sys_dict` VALUES ('59', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'DELETED', '用于数据库中是否删除的标记', '已删除', '3', '56');
INSERT INTO `sys_dict` VALUES ('60', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'DEL_FLAG', '', '是否删除', '0', null);
INSERT INTO `sys_dict` VALUES ('61', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'Y', '', '已经删除', '1', '60');
INSERT INTO `sys_dict` VALUES ('62', '2019-07-29 20:19:56', '1', 'admin', null, null, null, '0', 'N', null, '未删除', '2', '60');
INSERT INTO `sys_dict` VALUES ('63', '2019-07-29 21:59:24', '1', 'admin', null, null, null, '0', 'C', '', 'C', '1', '50');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `levels` int(11) NOT NULL,
  `menu_flag` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_page_flag` int(11) DEFAULT NULL,
  `open_flag` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2jrf4gb0gjqi8882gxytpxnhe` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', '2019-07-25 10:23:42', '1', 'admin', '2019-07-31 20:20:57', '1', 'admin', '10', 'system', null, 'layui-icon layui-icon-username', '1', '0', '系统管理', null, '0', '7', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('106', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 14:36:18', null, null, '5', 'mgr', null, '', '2', '0', '用户管理', null, '0', '1', '0', '/mgr', '105');
INSERT INTO `sys_menu` VALUES ('107', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_add', null, null, '3', '1', '添加用户', null, '0', '1', '0', '/mgr/add', '106');
INSERT INTO `sys_menu` VALUES ('108', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_edit', null, null, '3', '1', '修改用户', null, '0', '2', '0', '/mgr/edit', '106');
INSERT INTO `sys_menu` VALUES ('109', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:01:32', null, null, '2', 'mgr_delete', null, '', '3', '1', '删除用户', null, '0', '3', '0', '/mgr/delete/{id}', '106');
INSERT INTO `sys_menu` VALUES ('110', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:01:25', null, null, '2', 'mgr_reset', null, '', '3', '1', '重置密码', null, '0', '4', '0', '/mgr/reset/{id}', '106');
INSERT INTO `sys_menu` VALUES ('111', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 22:18:49', null, null, '4', 'mgr_freeze', null, '', '3', '1', '用户冻结解冻', null, '0', '5', '0', '/mgr/freeze/{id},/mgr/unfreeze/{id}', '106');
INSERT INTO `sys_menu` VALUES ('114', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role', null, null, '2', '0', '角色管理', null, '0', '2', '0', '/role', '105');
INSERT INTO `sys_menu` VALUES ('115', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_add', null, null, '3', '1', '添加角色', null, '0', '1', '0', '/role/add', '114');
INSERT INTO `sys_menu` VALUES ('116', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_edit', null, null, '3', '1', '修改角色', null, '0', '2', '0', '/role/edit', '114');
INSERT INTO `sys_menu` VALUES ('117', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:01:42', null, null, '2', 'role_delete', null, '', '3', '1', '删除角色', null, '0', '3', '0', '/role/delete/{id}', '114');
INSERT INTO `sys_menu` VALUES ('119', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu', null, null, '2', '0', '菜单管理', null, '0', '4', '0', '/menu', '105');
INSERT INTO `sys_menu` VALUES ('120', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_add', null, null, '3', '1', '添加菜单', null, '0', '1', '0', '/menu/add', '119');
INSERT INTO `sys_menu` VALUES ('121', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_edit', null, null, '3', '1', '修改菜单', null, '0', '2', '0', '/menu/edit', '119');
INSERT INTO `sys_menu` VALUES ('122', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:02:13', null, null, '2', 'menu_delete', null, '', '3', '1', '删除菜单', null, '0', '3', '0', '/menu/delete/{id}', '119');
INSERT INTO `sys_menu` VALUES ('128', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'log', null, null, '2', '0', '业务日志', null, '0', '6', '0', '/log', '105');
INSERT INTO `sys_menu` VALUES ('130', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'druid', null, null, '2', '0', '监控管理', null, '0', '7', '0', '/druid', '105');
INSERT INTO `sys_menu` VALUES ('131', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept', null, null, '2', '0', '部门管理', null, '0', '3', '0', '/dept', '105');
INSERT INTO `sys_menu` VALUES ('132', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict', null, null, '2', '0', '字典管理', null, '0', '4', '0', '/dict', '105');
INSERT INTO `sys_menu` VALUES ('134', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:15:37', null, null, '3', 'log_delete', null, '', '3', '1', '清空日志', null, '0', '1', '0', '/log/delete', '128');
INSERT INTO `sys_menu` VALUES ('135', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_add', null, null, '3', '1', '添加部门', null, '0', '1', '0', '/dept/add', '131');
INSERT INTO `sys_menu` VALUES ('136', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:16:11', null, null, '3', 'dept_edit', null, '', '3', '1', '修改部门', null, '0', '2', '0', '/dept/edit', '131');
INSERT INTO `sys_menu` VALUES ('137', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_delete', null, null, '3', '1', '删除部门', null, '0', '1', '0', '/dept/delete/{id}', '131');
INSERT INTO `sys_menu` VALUES ('138', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_add', null, null, '3', '1', '添加字典', null, '0', '1', '0', '/dict/add', '132');
INSERT INTO `sys_menu` VALUES ('139', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:05:08', null, null, '2', 'dict_edit', null, '', '3', '1', '修改字典', null, '0', '1', '0', '/dict/edit', '132');
INSERT INTO `sys_menu` VALUES ('140', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_delete', null, null, '3', '1', '删除字典', null, '0', '1', '0', '/dict/delete/{id}', '132');
INSERT INTO `sys_menu` VALUES ('141', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice', null, null, '2', '0', '通知管理', null, '0', '9', '0', '/notice', '105');
INSERT INTO `sys_menu` VALUES ('142', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_add', null, null, '3', '1', '添加通知', null, '0', '1', '0', '/notice/add', '141');
INSERT INTO `sys_menu` VALUES ('143', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_update', null, null, '3', '1', '修改通知', null, '0', '2', '0', '/notice/edit', '141');
INSERT INTO `sys_menu` VALUES ('144', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_delete', null, null, '3', '1', '删除通知', null, '0', '3', '0', '/notice/delete/{id}', '141');
INSERT INTO `sys_menu` VALUES ('145', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_hello', null, null, '2', '0', '系统消息', null, '0', '1', '0', '/notice/hello', '172');
INSERT INTO `sys_menu` VALUES ('149', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'api_mgr', null, null, '2', '0', '接口文档', null, '0', '3', '0', '/swagger-ui.html', '171');
INSERT INTO `sys_menu` VALUES ('208', '2019-07-27 15:00:44', '1', 'admin', '2019-07-27 15:13:58', null, null, '3', 'mgr_detail', null, '', '3', '1', '用户详情', null, '0', '8', '0', '/mgt/detail/{id}', '106');
INSERT INTO `sys_menu` VALUES ('151', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:15:15', null, null, '2', 'menu_list', null, '', '3', '1', '菜单列表', null, '0', '6', '0', '/menu/list', '119');
INSERT INTO `sys_menu` VALUES ('153', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_list', null, '', '3', '1', '部门列表', null, '0', '5', '0', '/dept/list', '131');
INSERT INTO `sys_menu` VALUES ('154', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_detail', null, '', '3', '1', '部门详情', null, '0', '6', '0', '/dept/detail', '131');
INSERT INTO `sys_menu` VALUES ('211', '2019-07-27 15:12:55', '1', 'admin', '2019-07-27 22:18:13', null, null, '2', 'role_detail', null, '', '3', '1', '角色详情', null, '0', '5', '0', '/role/detail/{id}', '114');
INSERT INTO `sys_menu` VALUES ('156', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_list', null, '', '3', '1', '字典列表', null, '0', '5', '0', '/dict/list', '132');
INSERT INTO `sys_menu` VALUES ('157', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_detail', null, '', '3', '1', '字典详情', null, '0', '6', '0', '/dict/detail', '132');
INSERT INTO `sys_menu` VALUES ('158', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:15:59', null, null, '2', 'log_list', null, '', '3', '1', '日志列表', null, '0', '3', '0', '/log/list', '128');
INSERT INTO `sys_menu` VALUES ('159', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:15:49', null, null, '3', 'log_detail', null, '', '3', '1', '日志详情', null, '0', '2', '0', '/log/detail/{id}', '128');
INSERT INTO `sys_menu` VALUES ('214', '2019-07-31 20:18:35', '1', 'admin', '2019-07-31 20:19:36', '1', 'admin', '1', 'work_audit', null, 'layui-icon layui-icon-read', '1', '0', '工作审核', null, null, '3', '0', '/work_audit', null);
INSERT INTO `sys_menu` VALUES ('213', '2019-07-31 20:17:44', '1', 'admin', '2019-07-31 20:19:26', '1', 'admin', '1', 'work', null, 'layui-icon layui-icon-form', '1', '0', '工作录入', null, null, '2', '0', '/work', null);
INSERT INTO `sys_menu` VALUES ('164', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:14:20', null, null, '2', 'role_list', null, '', '3', '1', '角色列表', null, '0', '6', '0', '/role/list', '114');
INSERT INTO `sys_menu` VALUES ('209', '2019-07-27 15:03:03', '1', 'admin', '2019-07-27 22:19:55', null, null, '2', 'menu_freeze', null, '', '3', '1', '菜单禁用启用', null, '0', '5', '0', '/menu/freeze/{id},/menu/unfreeze/{id}', '119');
INSERT INTO `sys_menu` VALUES ('167', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:14:04', null, null, '2', 'mgr_list', null, '', '3', '1', '用户列表', null, '0', '9', '0', '/mgr/list', '106');
INSERT INTO `sys_menu` VALUES ('171', '2019-07-25 10:23:42', '1', 'admin', '2019-07-31 20:20:42', '1', 'admin', '2', 'dev_tools', null, 'layui-icon layui-icon-app', '1', '0', '开发工具', null, '0', '5', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('172', '2019-07-25 10:23:42', '1', 'admin', '2019-07-31 20:20:49', '1', 'admin', '3', 'system_message', null, 'layui-icon layui-icon-tips', '1', '1', '系统消息', null, '0', '6', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('173', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 14:36:00', null, null, '2', 'generator', null, '', '2', '0', '代码生成', null, '0', '2', '0', '/generator', '171');
INSERT INTO `sys_menu` VALUES ('174', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'generator_generator', null, '', '3', '1', '代码生成', null, '0', '1', '0', '/generator/generator', '173');
INSERT INTO `sys_menu` VALUES ('175', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'datasource', null, '', '2', '0', '数据源管理', null, '0', '1', '0', '/datasource', '171');
INSERT INTO `sys_menu` VALUES ('176', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'datasource_add', null, '', '3', '1', '添加数据源', null, '0', '1', '0', '/datasource/add', '175');
INSERT INTO `sys_menu` VALUES ('177', '2019-07-25 10:23:42', '1', 'admin', '2019-07-27 15:23:01', null, null, '2', 'datasource_edit', null, '', '3', '1', '修改数据源', null, '0', '2', '0', '/datasource/edit', '175');
INSERT INTO `sys_menu` VALUES ('178', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'welcome', null, 'layui-icon layui-icon-home', '1', '0', '工作台', null, '0', '1', '0', '/system/welcome', null);
INSERT INTO `sys_menu` VALUES ('179', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss', '', '', '2', '0', '云存储', null, '0', '1', '0', '/oss', '105');
INSERT INTO `sys_menu` VALUES ('180', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_list', '', '', '3', '1', '云存储列表', null, '0', '1', '0', '/oss/list', '179');
INSERT INTO `sys_menu` VALUES ('181', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_add', '', '', '3', '1', '云存储添加', null, '0', '2', '0', '/oss/add', '179');
INSERT INTO `sys_menu` VALUES ('182', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_edit', '', '', '3', '1', '云存储更新', null, '0', '3', '0', '/oss/edit', '179');
INSERT INTO `sys_menu` VALUES ('183', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_delete', '', '', '3', '1', '云存储删除', null, '0', '4', '0', '/oss/delete', '179');
INSERT INTO `sys_menu` VALUES ('184', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp', '', '', '2', '0', 'FTP配置', null, '0', '1', '0', '/ftp', '105');
INSERT INTO `sys_menu` VALUES ('185', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_list', '', '', '3', '1', 'FTP配置列表', null, '0', '1', '0', '/ftp/list', '184');
INSERT INTO `sys_menu` VALUES ('186', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_add', '', '', '3', '1', 'FTP配置添加', null, '0', '1', '0', '/ftp/add', '184');
INSERT INTO `sys_menu` VALUES ('187', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_edit', '', '', '3', '1', 'FTP配置更新', null, '0', '1', '0', '/ftp/edit', '184');
INSERT INTO `sys_menu` VALUES ('188', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_delete', '', '', '3', '1', 'FTP配置删除', null, '0', '1', '0', '/ftp/delete/{id}', '184');
INSERT INTO `sys_menu` VALUES ('195', '2019-07-25 10:23:42', '1', 'admin', '2019-07-31 20:20:30', '1', 'admin', '3', 'project', null, 'layui-icon layui-icon-tips', '1', '0', '项目管理', null, '0', '4', '0', '/project', null);
INSERT INTO `sys_menu` VALUES ('196', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_list', '', '', '3', '1', '项目列表', null, '0', '1', '0', '/project/list', '195');
INSERT INTO `sys_menu` VALUES ('197', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_add', '', '', '3', '1', '项目添加', null, '0', '2', '0', '/project/add', '195');
INSERT INTO `sys_menu` VALUES ('198', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_edit', '', '', '3', '1', '项目更新', null, '0', '3', '0', '/project/edit', '195');
INSERT INTO `sys_menu` VALUES ('199', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_delete', '', '', '3', '1', '项目删除', null, '0', '4', '0', '/project/delete/{id}', '195');
INSERT INTO `sys_menu` VALUES ('212', '2019-07-27 22:16:31', '1', 'admin', null, null, null, '0', 'role_freeze', null, '', '3', '1', '角色禁用启用', null, null, '1', '0', '/role/freeze/{id},/role/unfreeze/{id}', '114');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `log_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `succeed` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('1', 'cn.kcyf.bsc.modular.system.controller.MenuController', '2019-07-29 19:38:03', '删除菜单', '4', '133 & ', 'delete', '0', null, null);
INSERT INTO `sys_operation_log` VALUES ('2', 'cn.kcyf.bsc.modular.system.service.ShiroServiceImpl', '2019-07-29 20:33:57', '登录日志', '0', '用户【admin】登录成功', 'post', '0', '1', 'admin');
INSERT INTO `sys_operation_log` VALUES ('3', 'cn.kcyf.bsc.modular.system.service.ShiroServiceImpl', '2019-07-29 22:16:44', '登录日志', '0', '用户【admin】登录成功', 'post', '0', '1', 'admin');
INSERT INTO `sys_operation_log` VALUES ('4', 'cn.kcyf.bsc.modular.system.controller.MenuController', '2019-07-31 20:17:44', '新增菜单', '4', 'Menu(code=work, parentId=null, name=工作录入, icon=layui-icon layui-icon-form, url=/work, sort=1, levels=1, menuFlag=YES, description=null, status=ENABLE, newPageFlag=null, openFlag=null) & org.springframework.validation.BeanPropertyBindingResult: 0 errors & ', 'add', '0', null, null);
INSERT INTO `sys_operation_log` VALUES ('5', 'cn.kcyf.bsc.modular.system.service.ShiroServiceImpl', '2019-07-31 20:18:59', '登录日志', '0', '用户【admin】登录成功', 'post', '0', '1', 'admin');
INSERT INTO `sys_operation_log` VALUES ('6', 'cn.kcyf.bsc.modular.system.controller.MenuController', '2019-07-31 20:19:26', '修改菜单', '4', 'Menu(code=work, parentId=null, name=工作录入, icon=layui-icon layui-icon-form, url=/work, sort=2, levels=1, menuFlag=YES, description=null, status=ENABLE, newPageFlag=null, openFlag=null) & org.springframework.validation.BeanPropertyBindingResult: 0 errors & ', 'edit', '0', '1', 'admin');
INSERT INTO `sys_operation_log` VALUES ('7', 'cn.kcyf.bsc.modular.system.controller.MenuController', '2019-07-31 20:20:42', '修改菜单', '4', 'Menu(code=dev_tools, parentId=null, name=开发工具, icon=layui-icon layui-icon-app, url=#, sort=5, levels=1, menuFlag=YES, description=null, status=ENABLE, newPageFlag=null, openFlag=null) & org.springframework.validation.BeanPropertyBindingResult: 0 errors & ', 'edit', '0', '1', 'admin');

-- ----------------------------
-- Table structure for sys_project
-- ----------------------------
DROP TABLE IF EXISTS `sys_project`;
CREATE TABLE `sys_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_project
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2019-07-25 09:52:40', '1', 'admin', '2019-07-31 20:18:47', '1', 'admin', '5', 'administrator', '超级管理员', '1', '0');
INSERT INTO `sys_role` VALUES ('2', '2019-07-26 22:56:22', '1', 'admin', null, null, null, '1', 'test', '测试用户', '1', '0');
INSERT INTO `sys_role` VALUES ('3', '2019-07-26 22:56:22', '1', 'admin', null, null, null, '1', 'test1', '测试用户1', '1', '0');
INSERT INTO `sys_role` VALUES ('4', '2019-07-26 22:56:22', '1', 'admin', null, null, null, '1', 'test2', '测试用户2', '1', '0');
INSERT INTO `sys_role` VALUES ('5', '2019-07-26 22:56:22', '1', 'admin', null, null, null, '1', 'test3', '测试用户3', '1', '0');
INSERT INTO `sys_role` VALUES ('6', '2019-07-26 22:56:22', '1', 'admin', null, null, null, '1', 'test4', '测试用户4', '1', '0');
INSERT INTO `sys_role` VALUES ('7', '2019-07-27 19:31:04', '1', 'admin', '2019-07-27 19:55:22', null, null, '1', '啊啊啊啊', '啊啊啊啊', '1', null);
INSERT INTO `sys_role` VALUES ('8', '2019-07-27 21:38:21', '1', 'admin', '2019-07-27 21:38:29', null, null, '1', 'ccccccc', 'cccccc', '1', null);
INSERT INTO `sys_role` VALUES ('9', '2019-07-27 21:41:30', '1', 'admin', '2019-07-27 21:46:56', '1', 'admin', '5', 'ddd', 'ddd', '1', null);

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus` (
  `role_id` bigint(20) NOT NULL,
  `menus_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menus_id`),
  KEY `FK7v0ib65fnv4k1fh5rge5liivl` (`menus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
INSERT INTO `sys_role_menus` VALUES ('1', '105');
INSERT INTO `sys_role_menus` VALUES ('1', '106');
INSERT INTO `sys_role_menus` VALUES ('1', '107');
INSERT INTO `sys_role_menus` VALUES ('1', '108');
INSERT INTO `sys_role_menus` VALUES ('1', '109');
INSERT INTO `sys_role_menus` VALUES ('1', '110');
INSERT INTO `sys_role_menus` VALUES ('1', '111');
INSERT INTO `sys_role_menus` VALUES ('1', '114');
INSERT INTO `sys_role_menus` VALUES ('1', '115');
INSERT INTO `sys_role_menus` VALUES ('1', '116');
INSERT INTO `sys_role_menus` VALUES ('1', '117');
INSERT INTO `sys_role_menus` VALUES ('1', '119');
INSERT INTO `sys_role_menus` VALUES ('1', '120');
INSERT INTO `sys_role_menus` VALUES ('1', '121');
INSERT INTO `sys_role_menus` VALUES ('1', '122');
INSERT INTO `sys_role_menus` VALUES ('1', '128');
INSERT INTO `sys_role_menus` VALUES ('1', '130');
INSERT INTO `sys_role_menus` VALUES ('1', '131');
INSERT INTO `sys_role_menus` VALUES ('1', '132');
INSERT INTO `sys_role_menus` VALUES ('1', '134');
INSERT INTO `sys_role_menus` VALUES ('1', '135');
INSERT INTO `sys_role_menus` VALUES ('1', '136');
INSERT INTO `sys_role_menus` VALUES ('1', '137');
INSERT INTO `sys_role_menus` VALUES ('1', '138');
INSERT INTO `sys_role_menus` VALUES ('1', '139');
INSERT INTO `sys_role_menus` VALUES ('1', '140');
INSERT INTO `sys_role_menus` VALUES ('1', '141');
INSERT INTO `sys_role_menus` VALUES ('1', '142');
INSERT INTO `sys_role_menus` VALUES ('1', '143');
INSERT INTO `sys_role_menus` VALUES ('1', '144');
INSERT INTO `sys_role_menus` VALUES ('1', '145');
INSERT INTO `sys_role_menus` VALUES ('1', '149');
INSERT INTO `sys_role_menus` VALUES ('1', '151');
INSERT INTO `sys_role_menus` VALUES ('1', '153');
INSERT INTO `sys_role_menus` VALUES ('1', '154');
INSERT INTO `sys_role_menus` VALUES ('1', '156');
INSERT INTO `sys_role_menus` VALUES ('1', '157');
INSERT INTO `sys_role_menus` VALUES ('1', '158');
INSERT INTO `sys_role_menus` VALUES ('1', '159');
INSERT INTO `sys_role_menus` VALUES ('1', '164');
INSERT INTO `sys_role_menus` VALUES ('1', '167');
INSERT INTO `sys_role_menus` VALUES ('1', '171');
INSERT INTO `sys_role_menus` VALUES ('1', '172');
INSERT INTO `sys_role_menus` VALUES ('1', '173');
INSERT INTO `sys_role_menus` VALUES ('1', '174');
INSERT INTO `sys_role_menus` VALUES ('1', '175');
INSERT INTO `sys_role_menus` VALUES ('1', '176');
INSERT INTO `sys_role_menus` VALUES ('1', '177');
INSERT INTO `sys_role_menus` VALUES ('1', '178');
INSERT INTO `sys_role_menus` VALUES ('1', '179');
INSERT INTO `sys_role_menus` VALUES ('1', '180');
INSERT INTO `sys_role_menus` VALUES ('1', '181');
INSERT INTO `sys_role_menus` VALUES ('1', '182');
INSERT INTO `sys_role_menus` VALUES ('1', '183');
INSERT INTO `sys_role_menus` VALUES ('1', '184');
INSERT INTO `sys_role_menus` VALUES ('1', '185');
INSERT INTO `sys_role_menus` VALUES ('1', '186');
INSERT INTO `sys_role_menus` VALUES ('1', '187');
INSERT INTO `sys_role_menus` VALUES ('1', '188');
INSERT INTO `sys_role_menus` VALUES ('1', '195');
INSERT INTO `sys_role_menus` VALUES ('1', '196');
INSERT INTO `sys_role_menus` VALUES ('1', '197');
INSERT INTO `sys_role_menus` VALUES ('1', '198');
INSERT INTO `sys_role_menus` VALUES ('1', '199');
INSERT INTO `sys_role_menus` VALUES ('1', '208');
INSERT INTO `sys_role_menus` VALUES ('1', '209');
INSERT INTO `sys_role_menus` VALUES ('1', '211');
INSERT INTO `sys_role_menus` VALUES ('1', '212');
INSERT INTO `sys_role_menus` VALUES ('1', '213');
INSERT INTO `sys_role_menus` VALUES ('1', '214');
INSERT INTO `sys_role_menus` VALUES ('2', '1');
INSERT INTO `sys_role_menus` VALUES ('3', '1');
INSERT INTO `sys_role_menus` VALUES ('4', '1');
INSERT INTO `sys_role_menus` VALUES ('5', '1');
INSERT INTO `sys_role_menus` VALUES ('9', '105');
INSERT INTO `sys_role_menus` VALUES ('9', '106');
INSERT INTO `sys_role_menus` VALUES ('9', '107');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `account` varchar(36) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_awpog86ljqwb89aqa1c5gvdrd` (`account`),
  KEY `FKb3pkx0wbo6o8i8lj0gxr37v1n` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2019-07-25 09:47:31', '1', 'admin', null, null, null, '1', 'admin', '陕西省西安市秦渡镇', '/assets/common/images/head.png', '2019-07-27 00:00:00', 'bjzk_2012_zk@163.com', '不吃耗子的猫', '2944d32eca9cce547135c2b360826d19', '1555555555', 'q6taw', '1', '0', '6');
INSERT INTO `sys_user` VALUES ('2', '2019-07-25 20:55:11', '1', 'admin', '2019-07-27 02:19:25', null, null, '1', 'aaaaaa', '', '/assets/common/images/head.png', '2019-07-27 00:00:00', 'aaaaaa@aaaaaa.aaaaaa', 'aaaaaa', 'aaaaaa', '', null, '0', '0', '7');
INSERT INTO `sys_user` VALUES ('3', '2019-07-25 21:03:44', '1', 'admin', null, null, null, '0', 'aaaaaa1', '', '/assets/common/images/head.png', null, 'aaaaaa@aaaaaa.aaaaaa', 'aaaaaa', 'aaaaaa', '', null, '0', '0', '1');
INSERT INTO `sys_user` VALUES ('4', '2019-07-25 21:36:43', '1', 'admin', null, null, null, '0', 'asdasd', '', '/assets/common/images/head.png', null, 'aaaaa@aaaaa.aaaaa', 'asdasd', 'c3bf7b3f89be376eabf86dc118679d6e', '', 'FmYLB', '0', '0', '1');
INSERT INTO `sys_user` VALUES ('5', '2019-07-25 22:15:13', '1', 'admin', null, null, null, '0', 'aaaaaa11', '', '/assets/common/images/head.png', '2019-07-25 00:00:00', 'aaaaa@aaaaa.aaaaa', 'aaaaaa11', '856bff5c03afd504a621608ad9b57e84', '', 'q6taw', '0', '0', '2');
INSERT INTO `sys_user` VALUES ('6', '2019-07-25 22:15:57', '1', 'admin', '2019-07-27 02:22:53', null, null, '4', 'aaaaa12', '', '/assets/common/images/head.png', null, '1111@111.ccc', 'aa', '2944d32eca9cce547135c2b360826d19', '', 'q6taw', '0', '0', '3');
INSERT INTO `sys_user` VALUES ('7', '2019-07-25 22:17:08', '1', 'admin', '2019-07-27 02:24:14', null, null, '1', 'aaaa2222', '', '/assets/common/images/head.png', null, '1111@111.ccc', 'aaaa2222', '2944d32eca9cce547135c2b360826d19', '', 'q6taw', '0', '0', '4');
INSERT INTO `sys_user` VALUES ('8', '2019-07-25 22:17:42', '1', 'admin', '2019-07-27 01:51:59', null, null, '1', 'aaa111222', '', '/assets/common/images/head.png', null, '1111@111.ccc', 'aaa111222', '3b3ef5ce6f99b3f8e2c8fba8ad9df99b', '', 'mtRFq', '0', '0', '5');
INSERT INTO `sys_user` VALUES ('9', '2019-07-26 22:33:22', '1', 'admin', '2019-07-27 02:28:26', null, null, '8', '11111111a', '', '/assets/common/images/head.png', null, '11111111a@11111111a.11111111a', '11111111a', '7da171f4b4ab73cdf1e6f08003007fc0', '029-85960142', 'Gprzh', '1', '0', '1');
INSERT INTO `sys_user` VALUES ('10', '2019-07-26 23:11:24', '1', 'admin', '2019-07-27 01:48:46', null, null, '4', 'vvvvvvvvvvvvvv', '', '/assets/common/images/head.png', null, 'vvvvvvvvvvvvvv@vvvvvvvvvvvvvv.vvvvvvvvvvvvvv', 'vvvvvvvvvvvvvv', '54dd607f0721595e03e7500bad3e22de', '', 'igabe', '0', '0', '3');
INSERT INTO `sys_user` VALUES ('11', '2019-07-26 23:33:01', '1', 'admin', null, null, null, '0', 'aaaaaccccc', '', '/assets/common/images/head.png', '2019-07-26 00:00:00', 'aaaaaccccc@aaaaaccccc.aaaaaccccc', 'aaaaaccccc', 'ad0d5da5f38fbb77278575b58f8a3de2', '', 'gSnju', '0', '0', '1');
INSERT INTO `sys_user` VALUES ('12', '2019-07-26 23:34:37', '1', 'admin', null, null, null, '0', 'bbbbbbbbbbbbbbbbb', '', '/assets/common/images/head.png', null, 'bbbbbbb@bbbbbb.bbbb', 'bbbbbbbbbbbbbbbbb', '4353faaa3fd173b51ada763539aca9d2', '', 'OMmVn', '0', '0', '1');
INSERT INTO `sys_user` VALUES ('13', '2019-07-26 23:40:34', '1', 'admin', null, null, null, '0', 'vvvvvvvvvvvaaaaaa', '', '/assets/common/images/head.png', '2019-07-26 00:00:00', 'vvvvvv@vvvvvv.vvvvvv', 'aa', '173b674c4da0c46dfc97c5a6c7fced7b', '', 'VHZsj', '0', '0', '1');
INSERT INTO `sys_user` VALUES ('14', '2019-07-26 23:43:36', '1', 'admin', null, null, null, '0', 'xxxxxxxx', '', '/assets/common/images/head.png', null, 'xxx@xxx.xx', 'xxxxxxxx', 'f1838715043164d2d68a93153d980e19', '', 'yNVaO', '0', '0', '1');
INSERT INTO `sys_user` VALUES ('15', '2019-07-26 23:45:03', '1', 'admin', null, null, null, '0', 'zzzzzz', '', '/assets/common/images/head.png', null, 'zzzzzz@zzzzzz.zzzzzz', 'zzzzzz', '3296da5ab3485d9967b78a0249a0cd3e', '', 'LADgL', '0', '0', '2');
INSERT INTO `sys_user` VALUES ('16', '2019-07-26 23:47:19', '1', 'admin', null, null, null, '0', 'nnnnnn', '', '/assets/common/images/head.png', null, 'nnnnnn@nnnnnn.nnnnnn', 'nnnnnn', 'c438d39f09018ce5c4cade35a4932375', '', 'VPYwx', '0', '0', '2');
INSERT INTO `sys_user` VALUES ('17', '2019-07-27 02:16:47', '1', 'admin', null, null, null, '0', 'aaaaa121', '', '/assets/common/images/head.png', null, 'aaaaa12@aaaaa12.ccc', 'aaaaa121', '54ab644f7ab0c8853fc8adba3563a2c1', '', 'azDPa', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKdpvc6d7xqpqr43dfuk1s27cqh` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES ('1', '1');
INSERT INTO `sys_user_roles` VALUES ('2', '5');
INSERT INTO `sys_user_roles` VALUES ('2', '6');
INSERT INTO `sys_user_roles` VALUES ('6', '2');
INSERT INTO `sys_user_roles` VALUES ('7', '1');
INSERT INTO `sys_user_roles` VALUES ('7', '2');
INSERT INTO `sys_user_roles` VALUES ('7', '3');
INSERT INTO `sys_user_roles` VALUES ('7', '4');
INSERT INTO `sys_user_roles` VALUES ('7', '5');
INSERT INTO `sys_user_roles` VALUES ('7', '6');
INSERT INTO `sys_user_roles` VALUES ('8', '4');
INSERT INTO `sys_user_roles` VALUES ('8', '5');
INSERT INTO `sys_user_roles` VALUES ('8', '6');
INSERT INTO `sys_user_roles` VALUES ('9', '5');
INSERT INTO `sys_user_roles` VALUES ('9', '6');
INSERT INTO `sys_user_roles` VALUES ('10', '2');
INSERT INTO `sys_user_roles` VALUES ('11', '1');
INSERT INTO `sys_user_roles` VALUES ('12', '2');
INSERT INTO `sys_user_roles` VALUES ('13', '1');
INSERT INTO `sys_user_roles` VALUES ('14', '1');
INSERT INTO `sys_user_roles` VALUES ('15', '1');
INSERT INTO `sys_user_roles` VALUES ('16', '1');
INSERT INTO `sys_user_roles` VALUES ('17', '5');
INSERT INTO `sys_user_roles` VALUES ('17', '6');

-- ----------------------------
-- Table structure for sys_visit
-- ----------------------------
DROP TABLE IF EXISTS `sys_visit`;
CREATE TABLE `sys_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `isp` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `login_id` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=660 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_visit
-- ----------------------------
INSERT INTO `sys_visit` VALUES ('1', '2019-07-31 20:16:15', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:15', '/');
INSERT INTO `sys_visit` VALUES ('2', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('3', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('4', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/pv');
INSERT INTO `sys_visit` VALUES ('5', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('6', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/monthpv');
INSERT INTO `sys_visit` VALUES ('7', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/regionpv');
INSERT INTO `sys_visit` VALUES ('8', '2019-07-31 20:16:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:16', '/system/userpv');
INSERT INTO `sys_visit` VALUES ('9', '2019-07-31 20:16:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:18', '/project');
INSERT INTO `sys_visit` VALUES ('10', '2019-07-31 20:16:19', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:19', '/project/list');
INSERT INTO `sys_visit` VALUES ('11', '2019-07-31 20:16:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:36', '/menu');
INSERT INTO `sys_visit` VALUES ('12', '2019-07-31 20:16:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:36', '/menu/list');
INSERT INTO `sys_visit` VALUES ('13', '2019-07-31 20:16:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:39', '/menu/menu_add');
INSERT INTO `sys_visit` VALUES ('14', '2019-07-31 20:16:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:16:39', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('15', '2019-07-31 20:17:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:17:44', '/menu/add');
INSERT INTO `sys_visit` VALUES ('16', '2019-07-31 20:17:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:17:44', '/menu/list');
INSERT INTO `sys_visit` VALUES ('17', '2019-07-31 20:17:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:17:46', '/menu/menu_add');
INSERT INTO `sys_visit` VALUES ('18', '2019-07-31 20:17:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:17:46', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('19', '2019-07-31 20:18:35', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:35', '/menu/add');
INSERT INTO `sys_visit` VALUES ('20', '2019-07-31 20:18:35', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:35', '/menu/list');
INSERT INTO `sys_visit` VALUES ('21', '2019-07-31 20:18:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:37', '/role');
INSERT INTO `sys_visit` VALUES ('22', '2019-07-31 20:18:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:38', '/role/list');
INSERT INTO `sys_visit` VALUES ('23', '2019-07-31 20:18:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:40', '/role/role_edit');
INSERT INTO `sys_visit` VALUES ('24', '2019-07-31 20:18:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:40', '/role/detail/1');
INSERT INTO `sys_visit` VALUES ('25', '2019-07-31 20:18:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:40', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('26', '2019-07-31 20:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:47', '/role/edit');
INSERT INTO `sys_visit` VALUES ('27', '2019-07-31 20:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:47', '/role/list');
INSERT INTO `sys_visit` VALUES ('28', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/');
INSERT INTO `sys_visit` VALUES ('29', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('30', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('31', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/project');
INSERT INTO `sys_visit` VALUES ('32', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/menu');
INSERT INTO `sys_visit` VALUES ('33', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/role');
INSERT INTO `sys_visit` VALUES ('34', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/project/list');
INSERT INTO `sys_visit` VALUES ('35', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/menu/list');
INSERT INTO `sys_visit` VALUES ('36', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/system/pv');
INSERT INTO `sys_visit` VALUES ('37', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/role/list');
INSERT INTO `sys_visit` VALUES ('38', '2019-07-31 20:18:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:18:59', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('39', '2019-07-31 20:19:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:01', '/work');
INSERT INTO `sys_visit` VALUES ('40', '2019-07-31 20:19:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:01', '/work/list');
INSERT INTO `sys_visit` VALUES ('41', '2019-07-31 20:19:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:01', '/work/records');
INSERT INTO `sys_visit` VALUES ('42', '2019-07-31 20:19:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:01', '/work/records');
INSERT INTO `sys_visit` VALUES ('43', '2019-07-31 20:19:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:01', '/work/records');
INSERT INTO `sys_visit` VALUES ('44', '2019-07-31 20:19:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:24', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('45', '2019-07-31 20:19:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:24', '/menu/detail/213');
INSERT INTO `sys_visit` VALUES ('46', '2019-07-31 20:19:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:24', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('47', '2019-07-31 20:19:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:26', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('48', '2019-07-31 20:19:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:26', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('49', '2019-07-31 20:19:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:26', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('50', '2019-07-31 20:19:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:26', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('51', '2019-07-31 20:19:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:26', '/menu/list');
INSERT INTO `sys_visit` VALUES ('52', '2019-07-31 20:19:34', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:34', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('53', '2019-07-31 20:19:34', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:34', '/menu/detail/214');
INSERT INTO `sys_visit` VALUES ('54', '2019-07-31 20:19:34', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:34', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('55', '2019-07-31 20:19:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:36', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('56', '2019-07-31 20:19:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:36', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('57', '2019-07-31 20:19:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:36', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('58', '2019-07-31 20:19:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:36', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('59', '2019-07-31 20:19:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:36', '/menu/list');
INSERT INTO `sys_visit` VALUES ('60', '2019-07-31 20:19:50', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:50', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('61', '2019-07-31 20:19:50', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:50', '/menu/detail/171');
INSERT INTO `sys_visit` VALUES ('62', '2019-07-31 20:19:50', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:50', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('63', '2019-07-31 20:19:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:58', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('64', '2019-07-31 20:19:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:58', '/menu/detail/172');
INSERT INTO `sys_visit` VALUES ('65', '2019-07-31 20:19:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:19:58', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('66', '2019-07-31 20:20:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:01', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('67', '2019-07-31 20:20:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:01', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('68', '2019-07-31 20:20:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:01', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('69', '2019-07-31 20:20:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:01', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('70', '2019-07-31 20:20:01', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:01', '/menu/list');
INSERT INTO `sys_visit` VALUES ('71', '2019-07-31 20:20:15', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:15', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('72', '2019-07-31 20:20:15', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:15', '/menu/detail/195');
INSERT INTO `sys_visit` VALUES ('73', '2019-07-31 20:20:15', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:15', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('74', '2019-07-31 20:20:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:18', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('75', '2019-07-31 20:20:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:18', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('76', '2019-07-31 20:20:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:18', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('77', '2019-07-31 20:20:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:18', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('78', '2019-07-31 20:20:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:18', '/menu/list');
INSERT INTO `sys_visit` VALUES ('79', '2019-07-31 20:20:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:28', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('80', '2019-07-31 20:20:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:28', '/menu/detail/195');
INSERT INTO `sys_visit` VALUES ('81', '2019-07-31 20:20:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:28', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('82', '2019-07-31 20:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:30', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('83', '2019-07-31 20:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:30', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('84', '2019-07-31 20:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:30', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('85', '2019-07-31 20:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:30', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('86', '2019-07-31 20:20:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:31', '/menu/list');
INSERT INTO `sys_visit` VALUES ('87', '2019-07-31 20:20:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:39', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('88', '2019-07-31 20:20:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:39', '/menu/detail/171');
INSERT INTO `sys_visit` VALUES ('89', '2019-07-31 20:20:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:39', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('90', '2019-07-31 20:20:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:42', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('91', '2019-07-31 20:20:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:42', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('92', '2019-07-31 20:20:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:42', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('93', '2019-07-31 20:20:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:42', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('94', '2019-07-31 20:20:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:42', '/menu/list');
INSERT INTO `sys_visit` VALUES ('95', '2019-07-31 20:20:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:46', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('96', '2019-07-31 20:20:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:46', '/menu/detail/172');
INSERT INTO `sys_visit` VALUES ('97', '2019-07-31 20:20:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:46', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('98', '2019-07-31 20:20:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:49', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('99', '2019-07-31 20:20:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:49', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('100', '2019-07-31 20:20:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:49', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('101', '2019-07-31 20:20:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:49', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('102', '2019-07-31 20:20:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:49', '/menu/list');
INSERT INTO `sys_visit` VALUES ('103', '2019-07-31 20:20:53', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:53', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('104', '2019-07-31 20:20:53', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:53', '/menu/detail/105');
INSERT INTO `sys_visit` VALUES ('105', '2019-07-31 20:20:53', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:53', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('106', '2019-07-31 20:20:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:57', '/menu/edit');
INSERT INTO `sys_visit` VALUES ('107', '2019-07-31 20:20:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:57', '/menu/menu_edit');
INSERT INTO `sys_visit` VALUES ('108', '2019-07-31 20:20:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:57', '/menu/detail/null');
INSERT INTO `sys_visit` VALUES ('109', '2019-07-31 20:20:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:57', '/menu/treeSelect');
INSERT INTO `sys_visit` VALUES ('110', '2019-07-31 20:20:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:57', '/menu/list');
INSERT INTO `sys_visit` VALUES ('111', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/');
INSERT INTO `sys_visit` VALUES ('112', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('113', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('114', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/project');
INSERT INTO `sys_visit` VALUES ('115', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/menu');
INSERT INTO `sys_visit` VALUES ('116', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/role');
INSERT INTO `sys_visit` VALUES ('117', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/work');
INSERT INTO `sys_visit` VALUES ('118', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/project/list');
INSERT INTO `sys_visit` VALUES ('119', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/role/list');
INSERT INTO `sys_visit` VALUES ('120', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/work/list');
INSERT INTO `sys_visit` VALUES ('121', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/work/records');
INSERT INTO `sys_visit` VALUES ('122', '2019-07-31 20:20:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:58', '/system/pv');
INSERT INTO `sys_visit` VALUES ('123', '2019-07-31 20:20:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:59', '/work/records');
INSERT INTO `sys_visit` VALUES ('124', '2019-07-31 20:20:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:59', '/work/records');
INSERT INTO `sys_visit` VALUES ('125', '2019-07-31 20:20:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:59', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('126', '2019-07-31 20:20:59', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:20:59', '/menu/list');
INSERT INTO `sys_visit` VALUES ('127', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('128', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/pv');
INSERT INTO `sys_visit` VALUES ('129', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('130', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/monthpv');
INSERT INTO `sys_visit` VALUES ('131', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/regionpv');
INSERT INTO `sys_visit` VALUES ('132', '2019-07-31 20:21:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 20:21:06', '/system/userpv');
INSERT INTO `sys_visit` VALUES ('133', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/');
INSERT INTO `sys_visit` VALUES ('134', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('135', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('136', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/project');
INSERT INTO `sys_visit` VALUES ('137', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/menu');
INSERT INTO `sys_visit` VALUES ('138', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/role');
INSERT INTO `sys_visit` VALUES ('139', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/work');
INSERT INTO `sys_visit` VALUES ('140', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/system/pv');
INSERT INTO `sys_visit` VALUES ('141', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('142', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/project/list');
INSERT INTO `sys_visit` VALUES ('143', '2019-07-31 21:00:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:22', '/role/list');
INSERT INTO `sys_visit` VALUES ('144', '2019-07-31 21:00:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:23', '/work/list');
INSERT INTO `sys_visit` VALUES ('145', '2019-07-31 21:00:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:23', '/work/records');
INSERT INTO `sys_visit` VALUES ('146', '2019-07-31 21:00:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:23', '/work/records');
INSERT INTO `sys_visit` VALUES ('147', '2019-07-31 21:00:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:23', '/work/records');
INSERT INTO `sys_visit` VALUES ('148', '2019-07-31 21:00:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:00:23', '/menu/list');
INSERT INTO `sys_visit` VALUES ('149', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/work');
INSERT INTO `sys_visit` VALUES ('150', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/project');
INSERT INTO `sys_visit` VALUES ('151', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/menu');
INSERT INTO `sys_visit` VALUES ('152', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/role');
INSERT INTO `sys_visit` VALUES ('153', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('154', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('155', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/system/pv');
INSERT INTO `sys_visit` VALUES ('156', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('157', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/work/records');
INSERT INTO `sys_visit` VALUES ('158', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/work/list');
INSERT INTO `sys_visit` VALUES ('159', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/role/list');
INSERT INTO `sys_visit` VALUES ('160', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/project/list');
INSERT INTO `sys_visit` VALUES ('161', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/work/records');
INSERT INTO `sys_visit` VALUES ('162', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/work/records');
INSERT INTO `sys_visit` VALUES ('163', '2019-07-31 21:17:31', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:17:31', '/menu/list');
INSERT INTO `sys_visit` VALUES ('164', '2019-07-31 21:18:20', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:20', '/');
INSERT INTO `sys_visit` VALUES ('165', '2019-07-31 21:18:20', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:20', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('166', '2019-07-31 21:18:20', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:20', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('167', '2019-07-31 21:18:20', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:20', '/project');
INSERT INTO `sys_visit` VALUES ('168', '2019-07-31 21:18:20', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:20', '/menu');
INSERT INTO `sys_visit` VALUES ('169', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/role');
INSERT INTO `sys_visit` VALUES ('170', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/work');
INSERT INTO `sys_visit` VALUES ('171', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/system/pv');
INSERT INTO `sys_visit` VALUES ('172', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/project/list');
INSERT INTO `sys_visit` VALUES ('173', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/role/list');
INSERT INTO `sys_visit` VALUES ('174', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('175', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/menu/list');
INSERT INTO `sys_visit` VALUES ('176', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/work/list');
INSERT INTO `sys_visit` VALUES ('177', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/work/records');
INSERT INTO `sys_visit` VALUES ('178', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/work/records');
INSERT INTO `sys_visit` VALUES ('179', '2019-07-31 21:18:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:21', '/work/records');
INSERT INTO `sys_visit` VALUES ('180', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/');
INSERT INTO `sys_visit` VALUES ('181', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('182', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('183', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/project');
INSERT INTO `sys_visit` VALUES ('184', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/menu');
INSERT INTO `sys_visit` VALUES ('185', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/role');
INSERT INTO `sys_visit` VALUES ('186', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/work');
INSERT INTO `sys_visit` VALUES ('187', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/project/list');
INSERT INTO `sys_visit` VALUES ('188', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/system/pv');
INSERT INTO `sys_visit` VALUES ('189', '2019-07-31 21:18:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:46', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('190', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/role/list');
INSERT INTO `sys_visit` VALUES ('191', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/menu/list');
INSERT INTO `sys_visit` VALUES ('192', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/work/list');
INSERT INTO `sys_visit` VALUES ('193', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/work/records');
INSERT INTO `sys_visit` VALUES ('194', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/work/records');
INSERT INTO `sys_visit` VALUES ('195', '2019-07-31 21:18:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:18:47', '/work/records');
INSERT INTO `sys_visit` VALUES ('196', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/');
INSERT INTO `sys_visit` VALUES ('197', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('198', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('199', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/project');
INSERT INTO `sys_visit` VALUES ('200', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/menu');
INSERT INTO `sys_visit` VALUES ('201', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/role');
INSERT INTO `sys_visit` VALUES ('202', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/work');
INSERT INTO `sys_visit` VALUES ('203', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/project/list');
INSERT INTO `sys_visit` VALUES ('204', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/system/pv');
INSERT INTO `sys_visit` VALUES ('205', '2019-07-31 21:20:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:29', '/role/list');
INSERT INTO `sys_visit` VALUES ('206', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('207', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/work/list');
INSERT INTO `sys_visit` VALUES ('208', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/work/records');
INSERT INTO `sys_visit` VALUES ('209', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/work/records');
INSERT INTO `sys_visit` VALUES ('210', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/work/records');
INSERT INTO `sys_visit` VALUES ('211', '2019-07-31 21:20:30', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:20:30', '/menu/list');
INSERT INTO `sys_visit` VALUES ('212', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/');
INSERT INTO `sys_visit` VALUES ('213', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('214', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('215', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/project');
INSERT INTO `sys_visit` VALUES ('216', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/menu');
INSERT INTO `sys_visit` VALUES ('217', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/role');
INSERT INTO `sys_visit` VALUES ('218', '2019-07-31 21:26:28', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:28', '/work');
INSERT INTO `sys_visit` VALUES ('219', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/project/list');
INSERT INTO `sys_visit` VALUES ('220', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/role/list');
INSERT INTO `sys_visit` VALUES ('221', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/work/list');
INSERT INTO `sys_visit` VALUES ('222', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/work/records');
INSERT INTO `sys_visit` VALUES ('223', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/work/records');
INSERT INTO `sys_visit` VALUES ('224', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/work/records');
INSERT INTO `sys_visit` VALUES ('225', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/system/pv');
INSERT INTO `sys_visit` VALUES ('226', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('227', '2019-07-31 21:26:29', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:29', '/menu/list');
INSERT INTO `sys_visit` VALUES ('228', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/');
INSERT INTO `sys_visit` VALUES ('229', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('230', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('231', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/project');
INSERT INTO `sys_visit` VALUES ('232', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/menu');
INSERT INTO `sys_visit` VALUES ('233', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/role');
INSERT INTO `sys_visit` VALUES ('234', '2019-07-31 21:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:44', '/work');
INSERT INTO `sys_visit` VALUES ('235', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/project/list');
INSERT INTO `sys_visit` VALUES ('236', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/work/list');
INSERT INTO `sys_visit` VALUES ('237', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('238', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/system/pv');
INSERT INTO `sys_visit` VALUES ('239', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('240', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/role/list');
INSERT INTO `sys_visit` VALUES ('241', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/menu/list');
INSERT INTO `sys_visit` VALUES ('242', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('243', '2019-07-31 21:26:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:45', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('244', '2019-07-31 21:26:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:46', '/work/records');
INSERT INTO `sys_visit` VALUES ('245', '2019-07-31 21:26:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:47', '/work/records');
INSERT INTO `sys_visit` VALUES ('246', '2019-07-31 21:26:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:26:48', '/work/records');
INSERT INTO `sys_visit` VALUES ('247', '2019-07-31 21:27:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:41', '/');
INSERT INTO `sys_visit` VALUES ('248', '2019-07-31 21:27:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:42', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('249', '2019-07-31 21:27:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:42', '/project');
INSERT INTO `sys_visit` VALUES ('250', '2019-07-31 21:27:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:42', '/menu');
INSERT INTO `sys_visit` VALUES ('251', '2019-07-31 21:27:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:42', '/role');
INSERT INTO `sys_visit` VALUES ('252', '2019-07-31 21:27:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:42', '/work');
INSERT INTO `sys_visit` VALUES ('253', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/project/list');
INSERT INTO `sys_visit` VALUES ('254', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/role/list');
INSERT INTO `sys_visit` VALUES ('255', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/system/pv');
INSERT INTO `sys_visit` VALUES ('256', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('257', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/menu/list');
INSERT INTO `sys_visit` VALUES ('258', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('259', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/work/list');
INSERT INTO `sys_visit` VALUES ('260', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('261', '2019-07-31 21:27:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('262', '2019-07-31 21:27:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:27:44', '/work/records');
INSERT INTO `sys_visit` VALUES ('263', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/');
INSERT INTO `sys_visit` VALUES ('264', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/project');
INSERT INTO `sys_visit` VALUES ('265', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('266', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/menu');
INSERT INTO `sys_visit` VALUES ('267', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/role');
INSERT INTO `sys_visit` VALUES ('268', '2019-07-31 21:34:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:37', '/work');
INSERT INTO `sys_visit` VALUES ('269', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/project/list');
INSERT INTO `sys_visit` VALUES ('270', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/role/list');
INSERT INTO `sys_visit` VALUES ('271', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/work/list');
INSERT INTO `sys_visit` VALUES ('272', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/work/records');
INSERT INTO `sys_visit` VALUES ('273', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/work/records');
INSERT INTO `sys_visit` VALUES ('274', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/system/pv');
INSERT INTO `sys_visit` VALUES ('275', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/work/records');
INSERT INTO `sys_visit` VALUES ('276', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('277', '2019-07-31 21:34:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:34:38', '/menu/list');
INSERT INTO `sys_visit` VALUES ('278', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/');
INSERT INTO `sys_visit` VALUES ('279', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('280', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/project');
INSERT INTO `sys_visit` VALUES ('281', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/menu');
INSERT INTO `sys_visit` VALUES ('282', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/role');
INSERT INTO `sys_visit` VALUES ('283', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/work');
INSERT INTO `sys_visit` VALUES ('284', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/project/list');
INSERT INTO `sys_visit` VALUES ('285', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/work/records');
INSERT INTO `sys_visit` VALUES ('286', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/work/list');
INSERT INTO `sys_visit` VALUES ('287', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/system/pv');
INSERT INTO `sys_visit` VALUES ('288', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/role/list');
INSERT INTO `sys_visit` VALUES ('289', '2019-07-31 21:39:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:07', '/menu/list');
INSERT INTO `sys_visit` VALUES ('290', '2019-07-31 21:39:08', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:08', '/work/records');
INSERT INTO `sys_visit` VALUES ('291', '2019-07-31 21:39:08', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:08', '/work/records');
INSERT INTO `sys_visit` VALUES ('292', '2019-07-31 21:39:08', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:08', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('293', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/');
INSERT INTO `sys_visit` VALUES ('294', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('295', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/project');
INSERT INTO `sys_visit` VALUES ('296', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/menu');
INSERT INTO `sys_visit` VALUES ('297', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/role');
INSERT INTO `sys_visit` VALUES ('298', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/work');
INSERT INTO `sys_visit` VALUES ('299', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/project/list');
INSERT INTO `sys_visit` VALUES ('300', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/role/list');
INSERT INTO `sys_visit` VALUES ('301', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/work/list');
INSERT INTO `sys_visit` VALUES ('302', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/work/records');
INSERT INTO `sys_visit` VALUES ('303', '2019-07-31 21:39:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:48', '/system/pv');
INSERT INTO `sys_visit` VALUES ('304', '2019-07-31 21:39:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:49', '/work/records');
INSERT INTO `sys_visit` VALUES ('305', '2019-07-31 21:39:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:49', '/work/records');
INSERT INTO `sys_visit` VALUES ('306', '2019-07-31 21:39:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:49', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('307', '2019-07-31 21:39:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:39:49', '/menu/list');
INSERT INTO `sys_visit` VALUES ('308', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/');
INSERT INTO `sys_visit` VALUES ('309', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('310', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('311', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/project');
INSERT INTO `sys_visit` VALUES ('312', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/menu');
INSERT INTO `sys_visit` VALUES ('313', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/role');
INSERT INTO `sys_visit` VALUES ('314', '2019-07-31 21:40:23', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:23', '/work');
INSERT INTO `sys_visit` VALUES ('315', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/project/list');
INSERT INTO `sys_visit` VALUES ('316', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/work/records');
INSERT INTO `sys_visit` VALUES ('317', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/work/list');
INSERT INTO `sys_visit` VALUES ('318', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/role/list');
INSERT INTO `sys_visit` VALUES ('319', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/system/pv');
INSERT INTO `sys_visit` VALUES ('320', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/menu/list');
INSERT INTO `sys_visit` VALUES ('321', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/work/records');
INSERT INTO `sys_visit` VALUES ('322', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/work/records');
INSERT INTO `sys_visit` VALUES ('323', '2019-07-31 21:40:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:40:24', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('324', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/');
INSERT INTO `sys_visit` VALUES ('325', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('326', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/project');
INSERT INTO `sys_visit` VALUES ('327', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/menu');
INSERT INTO `sys_visit` VALUES ('328', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/role');
INSERT INTO `sys_visit` VALUES ('329', '2019-07-31 21:41:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:57', '/work');
INSERT INTO `sys_visit` VALUES ('330', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/project/list');
INSERT INTO `sys_visit` VALUES ('331', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/system/pv');
INSERT INTO `sys_visit` VALUES ('332', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/menu/list');
INSERT INTO `sys_visit` VALUES ('333', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/role/list');
INSERT INTO `sys_visit` VALUES ('334', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('335', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/work/list');
INSERT INTO `sys_visit` VALUES ('336', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/work/records');
INSERT INTO `sys_visit` VALUES ('337', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/work/records');
INSERT INTO `sys_visit` VALUES ('338', '2019-07-31 21:41:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:41:58', '/work/records');
INSERT INTO `sys_visit` VALUES ('339', '2019-07-31 21:42:35', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:35', '/');
INSERT INTO `sys_visit` VALUES ('340', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('341', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/project');
INSERT INTO `sys_visit` VALUES ('342', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/menu');
INSERT INTO `sys_visit` VALUES ('343', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/role');
INSERT INTO `sys_visit` VALUES ('344', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/work');
INSERT INTO `sys_visit` VALUES ('345', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/project/list');
INSERT INTO `sys_visit` VALUES ('346', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/role/list');
INSERT INTO `sys_visit` VALUES ('347', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/work/list');
INSERT INTO `sys_visit` VALUES ('348', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/work/records');
INSERT INTO `sys_visit` VALUES ('349', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/work/records');
INSERT INTO `sys_visit` VALUES ('350', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/system/pv');
INSERT INTO `sys_visit` VALUES ('351', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/work/records');
INSERT INTO `sys_visit` VALUES ('352', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/menu/list');
INSERT INTO `sys_visit` VALUES ('353', '2019-07-31 21:42:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:36', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('354', '2019-07-31 21:42:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:38', '/work/records');
INSERT INTO `sys_visit` VALUES ('355', '2019-07-31 21:42:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:40', '/work/records');
INSERT INTO `sys_visit` VALUES ('356', '2019-07-31 21:42:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:41', '/work/records');
INSERT INTO `sys_visit` VALUES ('357', '2019-07-31 21:42:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:42:42', '/work/records');
INSERT INTO `sys_visit` VALUES ('358', '2019-07-31 21:43:35', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:43:35', '/work/records');
INSERT INTO `sys_visit` VALUES ('359', '2019-07-31 21:43:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:43:36', '/work/records');
INSERT INTO `sys_visit` VALUES ('360', '2019-07-31 21:43:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:43:37', '/work/records');
INSERT INTO `sys_visit` VALUES ('361', '2019-07-31 21:43:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:43:38', '/work/records');
INSERT INTO `sys_visit` VALUES ('362', '2019-07-31 21:43:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:43:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('363', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/');
INSERT INTO `sys_visit` VALUES ('364', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('365', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/project');
INSERT INTO `sys_visit` VALUES ('366', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/menu');
INSERT INTO `sys_visit` VALUES ('367', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/role');
INSERT INTO `sys_visit` VALUES ('368', '2019-07-31 21:44:16', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:16', '/work');
INSERT INTO `sys_visit` VALUES ('369', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/project/list');
INSERT INTO `sys_visit` VALUES ('370', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/role/list');
INSERT INTO `sys_visit` VALUES ('371', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/work/list');
INSERT INTO `sys_visit` VALUES ('372', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/menu/list');
INSERT INTO `sys_visit` VALUES ('373', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/system/pv');
INSERT INTO `sys_visit` VALUES ('374', '2019-07-31 21:44:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:44:17', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('375', '2019-07-31 21:49:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:39', '/');
INSERT INTO `sys_visit` VALUES ('376', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('377', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('378', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/project');
INSERT INTO `sys_visit` VALUES ('379', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/menu');
INSERT INTO `sys_visit` VALUES ('380', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/role');
INSERT INTO `sys_visit` VALUES ('381', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/work');
INSERT INTO `sys_visit` VALUES ('382', '2019-07-31 21:49:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:40', '/project/list');
INSERT INTO `sys_visit` VALUES ('383', '2019-07-31 21:49:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:41', '/system/pv');
INSERT INTO `sys_visit` VALUES ('384', '2019-07-31 21:49:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:41', '/role/list');
INSERT INTO `sys_visit` VALUES ('385', '2019-07-31 21:49:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:41', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('386', '2019-07-31 21:49:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:41', '/work/list');
INSERT INTO `sys_visit` VALUES ('387', '2019-07-31 21:49:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:49:41', '/menu/list');
INSERT INTO `sys_visit` VALUES ('388', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/');
INSERT INTO `sys_visit` VALUES ('389', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('390', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/project');
INSERT INTO `sys_visit` VALUES ('391', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/menu');
INSERT INTO `sys_visit` VALUES ('392', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/role');
INSERT INTO `sys_visit` VALUES ('393', '2019-07-31 21:50:21', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:21', '/work');
INSERT INTO `sys_visit` VALUES ('394', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/project/list');
INSERT INTO `sys_visit` VALUES ('395', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/system/pv');
INSERT INTO `sys_visit` VALUES ('396', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/role/list');
INSERT INTO `sys_visit` VALUES ('397', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('398', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/work/list');
INSERT INTO `sys_visit` VALUES ('399', '2019-07-31 21:50:22', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:50:22', '/menu/list');
INSERT INTO `sys_visit` VALUES ('400', '2019-07-31 21:55:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:17', '/');
INSERT INTO `sys_visit` VALUES ('401', '2019-07-31 21:55:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:17', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('402', '2019-07-31 21:55:17', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:17', '/project');
INSERT INTO `sys_visit` VALUES ('403', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/menu');
INSERT INTO `sys_visit` VALUES ('404', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/role');
INSERT INTO `sys_visit` VALUES ('405', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/work');
INSERT INTO `sys_visit` VALUES ('406', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/project/list');
INSERT INTO `sys_visit` VALUES ('407', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/system/pv');
INSERT INTO `sys_visit` VALUES ('408', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('409', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/work/list');
INSERT INTO `sys_visit` VALUES ('410', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/role/list');
INSERT INTO `sys_visit` VALUES ('411', '2019-07-31 21:55:18', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:18', '/menu/list');
INSERT INTO `sys_visit` VALUES ('412', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/');
INSERT INTO `sys_visit` VALUES ('413', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('414', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('415', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/project');
INSERT INTO `sys_visit` VALUES ('416', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/menu');
INSERT INTO `sys_visit` VALUES ('417', '2019-07-31 21:55:51', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:51', '/role');
INSERT INTO `sys_visit` VALUES ('418', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/work');
INSERT INTO `sys_visit` VALUES ('419', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/layui/css/layui.css');
INSERT INTO `sys_visit` VALUES ('420', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/demos/googlegg.js');
INSERT INTO `sys_visit` VALUES ('421', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/layui/layui.js');
INSERT INTO `sys_visit` VALUES ('422', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/project/list');
INSERT INTO `sys_visit` VALUES ('423', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/system/pv');
INSERT INTO `sys_visit` VALUES ('424', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('425', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/role/list');
INSERT INTO `sys_visit` VALUES ('426', '2019-07-31 21:55:52', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:55:52', '/menu/list');
INSERT INTO `sys_visit` VALUES ('427', '2019-07-31 21:57:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:25', '/');
INSERT INTO `sys_visit` VALUES ('428', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('429', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/project');
INSERT INTO `sys_visit` VALUES ('430', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/menu');
INSERT INTO `sys_visit` VALUES ('431', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/role');
INSERT INTO `sys_visit` VALUES ('432', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/work');
INSERT INTO `sys_visit` VALUES ('433', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/layui/css/layui.css');
INSERT INTO `sys_visit` VALUES ('434', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/demos/googlegg.js');
INSERT INTO `sys_visit` VALUES ('435', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/role/list');
INSERT INTO `sys_visit` VALUES ('436', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/project/list');
INSERT INTO `sys_visit` VALUES ('437', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/system/pv');
INSERT INTO `sys_visit` VALUES ('438', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('439', '2019-07-31 21:57:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:26', '/menu/list');
INSERT INTO `sys_visit` VALUES ('440', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/');
INSERT INTO `sys_visit` VALUES ('441', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('442', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/menu');
INSERT INTO `sys_visit` VALUES ('443', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/project');
INSERT INTO `sys_visit` VALUES ('444', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/role');
INSERT INTO `sys_visit` VALUES ('445', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/work');
INSERT INTO `sys_visit` VALUES ('446', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/layui/css/layui.css');
INSERT INTO `sys_visit` VALUES ('447', '2019-07-31 21:57:57', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:57', '/demos/googlegg.js');
INSERT INTO `sys_visit` VALUES ('448', '2019-07-31 21:57:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:58', '/project/list');
INSERT INTO `sys_visit` VALUES ('449', '2019-07-31 21:57:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:58', '/system/pv');
INSERT INTO `sys_visit` VALUES ('450', '2019-07-31 21:57:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:58', '/role/list');
INSERT INTO `sys_visit` VALUES ('451', '2019-07-31 21:57:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:58', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('452', '2019-07-31 21:57:58', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:57:58', '/menu/list');
INSERT INTO `sys_visit` VALUES ('453', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/');
INSERT INTO `sys_visit` VALUES ('454', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('455', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('456', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/menu');
INSERT INTO `sys_visit` VALUES ('457', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/project');
INSERT INTO `sys_visit` VALUES ('458', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/role');
INSERT INTO `sys_visit` VALUES ('459', '2019-07-31 21:59:37', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:37', '/work');
INSERT INTO `sys_visit` VALUES ('460', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/project/list');
INSERT INTO `sys_visit` VALUES ('461', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/role/list');
INSERT INTO `sys_visit` VALUES ('462', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/menu/list');
INSERT INTO `sys_visit` VALUES ('463', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/system/pv');
INSERT INTO `sys_visit` VALUES ('464', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/work/list');
INSERT INTO `sys_visit` VALUES ('465', '2019-07-31 21:59:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 21:59:38', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('466', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/');
INSERT INTO `sys_visit` VALUES ('467', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('468', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/project');
INSERT INTO `sys_visit` VALUES ('469', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/menu');
INSERT INTO `sys_visit` VALUES ('470', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/work');
INSERT INTO `sys_visit` VALUES ('471', '2019-07-31 22:00:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:24', '/role');
INSERT INTO `sys_visit` VALUES ('472', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/project/list');
INSERT INTO `sys_visit` VALUES ('473', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/role/list');
INSERT INTO `sys_visit` VALUES ('474', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/menu/list');
INSERT INTO `sys_visit` VALUES ('475', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/work/list');
INSERT INTO `sys_visit` VALUES ('476', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/system/pv');
INSERT INTO `sys_visit` VALUES ('477', '2019-07-31 22:00:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:25', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('478', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/');
INSERT INTO `sys_visit` VALUES ('479', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('480', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/menu');
INSERT INTO `sys_visit` VALUES ('481', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/project');
INSERT INTO `sys_visit` VALUES ('482', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/role');
INSERT INTO `sys_visit` VALUES ('483', '2019-07-31 22:00:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:42', '/work');
INSERT INTO `sys_visit` VALUES ('484', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/project/list');
INSERT INTO `sys_visit` VALUES ('485', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/role/list');
INSERT INTO `sys_visit` VALUES ('486', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/work/list');
INSERT INTO `sys_visit` VALUES ('487', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('488', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/system/pv');
INSERT INTO `sys_visit` VALUES ('489', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('490', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/menu/list');
INSERT INTO `sys_visit` VALUES ('491', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/work/records');
INSERT INTO `sys_visit` VALUES ('492', '2019-07-31 22:00:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:43', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('493', '2019-07-31 22:00:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('494', '2019-07-31 22:00:46', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:00:46', '/work/records');
INSERT INTO `sys_visit` VALUES ('495', '2019-07-31 22:03:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:05', '/');
INSERT INTO `sys_visit` VALUES ('496', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('497', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/project');
INSERT INTO `sys_visit` VALUES ('498', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/role');
INSERT INTO `sys_visit` VALUES ('499', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/menu');
INSERT INTO `sys_visit` VALUES ('500', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/work');
INSERT INTO `sys_visit` VALUES ('501', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/project/list');
INSERT INTO `sys_visit` VALUES ('502', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/role/list');
INSERT INTO `sys_visit` VALUES ('503', '2019-07-31 22:03:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:06', '/system/pv');
INSERT INTO `sys_visit` VALUES ('504', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('505', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/work/list');
INSERT INTO `sys_visit` VALUES ('506', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/work/records');
INSERT INTO `sys_visit` VALUES ('507', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/menu/list');
INSERT INTO `sys_visit` VALUES ('508', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/work/records');
INSERT INTO `sys_visit` VALUES ('509', '2019-07-31 22:03:07', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:07', '/work/records');
INSERT INTO `sys_visit` VALUES ('510', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/');
INSERT INTO `sys_visit` VALUES ('511', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('512', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('513', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/project');
INSERT INTO `sys_visit` VALUES ('514', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/menu');
INSERT INTO `sys_visit` VALUES ('515', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/role');
INSERT INTO `sys_visit` VALUES ('516', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/work');
INSERT INTO `sys_visit` VALUES ('517', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/role/list');
INSERT INTO `sys_visit` VALUES ('518', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/work/records');
INSERT INTO `sys_visit` VALUES ('519', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/work/list');
INSERT INTO `sys_visit` VALUES ('520', '2019-07-31 22:03:13', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:13', '/project/list');
INSERT INTO `sys_visit` VALUES ('521', '2019-07-31 22:03:14', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:14', '/menu/list');
INSERT INTO `sys_visit` VALUES ('522', '2019-07-31 22:03:14', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:14', '/system/pv');
INSERT INTO `sys_visit` VALUES ('523', '2019-07-31 22:03:14', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:14', '/work/records');
INSERT INTO `sys_visit` VALUES ('524', '2019-07-31 22:03:14', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:14', '/work/records');
INSERT INTO `sys_visit` VALUES ('525', '2019-07-31 22:03:14', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:03:14', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('526', '2019-07-31 22:04:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:41', '/');
INSERT INTO `sys_visit` VALUES ('527', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('528', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('529', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/project');
INSERT INTO `sys_visit` VALUES ('530', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/menu');
INSERT INTO `sys_visit` VALUES ('531', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/role');
INSERT INTO `sys_visit` VALUES ('532', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/work');
INSERT INTO `sys_visit` VALUES ('533', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/project/list');
INSERT INTO `sys_visit` VALUES ('534', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/work/list');
INSERT INTO `sys_visit` VALUES ('535', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/work/records');
INSERT INTO `sys_visit` VALUES ('536', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/role/list');
INSERT INTO `sys_visit` VALUES ('537', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/system/pv');
INSERT INTO `sys_visit` VALUES ('538', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/work/records');
INSERT INTO `sys_visit` VALUES ('539', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/work/records');
INSERT INTO `sys_visit` VALUES ('540', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('541', '2019-07-31 22:04:42', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:42', '/menu/list');
INSERT INTO `sys_visit` VALUES ('542', '2019-07-31 22:04:47', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:47', '/work/records');
INSERT INTO `sys_visit` VALUES ('543', '2019-07-31 22:04:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:48', '/work/records');
INSERT INTO `sys_visit` VALUES ('544', '2019-07-31 22:04:48', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:48', '/work/records');
INSERT INTO `sys_visit` VALUES ('545', '2019-07-31 22:04:49', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:04:49', '/work/records');
INSERT INTO `sys_visit` VALUES ('546', '2019-07-31 22:09:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:38', '/');
INSERT INTO `sys_visit` VALUES ('547', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('548', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/project');
INSERT INTO `sys_visit` VALUES ('549', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/work');
INSERT INTO `sys_visit` VALUES ('550', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/menu');
INSERT INTO `sys_visit` VALUES ('551', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/role');
INSERT INTO `sys_visit` VALUES ('552', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/project/list');
INSERT INTO `sys_visit` VALUES ('553', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/work/list');
INSERT INTO `sys_visit` VALUES ('554', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('555', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/system/pv');
INSERT INTO `sys_visit` VALUES ('556', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('557', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/role/list');
INSERT INTO `sys_visit` VALUES ('558', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('559', '2019-07-31 22:09:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:39', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('560', '2019-07-31 22:09:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:40', '/menu/list');
INSERT INTO `sys_visit` VALUES ('561', '2019-07-31 22:09:40', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:09:40', '/work/records');
INSERT INTO `sys_visit` VALUES ('562', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/');
INSERT INTO `sys_visit` VALUES ('563', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('564', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('565', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/project');
INSERT INTO `sys_visit` VALUES ('566', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/menu');
INSERT INTO `sys_visit` VALUES ('567', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/role');
INSERT INTO `sys_visit` VALUES ('568', '2019-07-31 22:10:04', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:04', '/work');
INSERT INTO `sys_visit` VALUES ('569', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/project/list');
INSERT INTO `sys_visit` VALUES ('570', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/role/list');
INSERT INTO `sys_visit` VALUES ('571', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/menu/list');
INSERT INTO `sys_visit` VALUES ('572', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/system/pv');
INSERT INTO `sys_visit` VALUES ('573', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('574', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/work/list');
INSERT INTO `sys_visit` VALUES ('575', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/work/records');
INSERT INTO `sys_visit` VALUES ('576', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/work/records');
INSERT INTO `sys_visit` VALUES ('577', '2019-07-31 22:10:05', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:05', '/work/records');
INSERT INTO `sys_visit` VALUES ('578', '2019-07-31 22:10:06', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:06', '/work/records');
INSERT INTO `sys_visit` VALUES ('579', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/');
INSERT INTO `sys_visit` VALUES ('580', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('581', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('582', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/project');
INSERT INTO `sys_visit` VALUES ('583', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/menu');
INSERT INTO `sys_visit` VALUES ('584', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/role');
INSERT INTO `sys_visit` VALUES ('585', '2019-07-31 22:10:38', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:38', '/work');
INSERT INTO `sys_visit` VALUES ('586', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/project/list');
INSERT INTO `sys_visit` VALUES ('587', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/role/list');
INSERT INTO `sys_visit` VALUES ('588', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/work/list');
INSERT INTO `sys_visit` VALUES ('589', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('590', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/system/pv');
INSERT INTO `sys_visit` VALUES ('591', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('592', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/work/records');
INSERT INTO `sys_visit` VALUES ('593', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('594', '2019-07-31 22:10:39', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:39', '/menu/list');
INSERT INTO `sys_visit` VALUES ('595', '2019-07-31 22:10:41', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:41', '/work/records');
INSERT INTO `sys_visit` VALUES ('596', '2019-07-31 22:10:45', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:10:45', '/work/records');
INSERT INTO `sys_visit` VALUES ('597', '2019-07-31 22:11:35', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:35', '/');
INSERT INTO `sys_visit` VALUES ('598', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('599', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('600', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/project');
INSERT INTO `sys_visit` VALUES ('601', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/menu');
INSERT INTO `sys_visit` VALUES ('602', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/role');
INSERT INTO `sys_visit` VALUES ('603', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/work');
INSERT INTO `sys_visit` VALUES ('604', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/role/list');
INSERT INTO `sys_visit` VALUES ('605', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/project/list');
INSERT INTO `sys_visit` VALUES ('606', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/work/list');
INSERT INTO `sys_visit` VALUES ('607', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/system/pv');
INSERT INTO `sys_visit` VALUES ('608', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('609', '2019-07-31 22:11:36', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:11:36', '/menu/list');
INSERT INTO `sys_visit` VALUES ('610', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/');
INSERT INTO `sys_visit` VALUES ('611', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('612', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('613', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/project');
INSERT INTO `sys_visit` VALUES ('614', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/menu');
INSERT INTO `sys_visit` VALUES ('615', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/role');
INSERT INTO `sys_visit` VALUES ('616', '2019-07-31 22:12:11', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:11', '/work');
INSERT INTO `sys_visit` VALUES ('617', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/project/list');
INSERT INTO `sys_visit` VALUES ('618', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/role/list');
INSERT INTO `sys_visit` VALUES ('619', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/work/list');
INSERT INTO `sys_visit` VALUES ('620', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/system/pv');
INSERT INTO `sys_visit` VALUES ('621', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/menu/list');
INSERT INTO `sys_visit` VALUES ('622', '2019-07-31 22:12:12', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:12:12', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('623', '2019-07-31 22:26:24', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:24', '/');
INSERT INTO `sys_visit` VALUES ('624', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('625', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/project');
INSERT INTO `sys_visit` VALUES ('626', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/menu');
INSERT INTO `sys_visit` VALUES ('627', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/role');
INSERT INTO `sys_visit` VALUES ('628', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/work');
INSERT INTO `sys_visit` VALUES ('629', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/project/list');
INSERT INTO `sys_visit` VALUES ('630', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/role/list');
INSERT INTO `sys_visit` VALUES ('631', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/system/pv');
INSERT INTO `sys_visit` VALUES ('632', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/work/list');
INSERT INTO `sys_visit` VALUES ('633', '2019-07-31 22:26:25', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:25', '/menu/list');
INSERT INTO `sys_visit` VALUES ('634', '2019-07-31 22:26:26', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:26', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('635', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/');
INSERT INTO `sys_visit` VALUES ('636', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('637', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('638', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/project');
INSERT INTO `sys_visit` VALUES ('639', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/menu');
INSERT INTO `sys_visit` VALUES ('640', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/role');
INSERT INTO `sys_visit` VALUES ('641', '2019-07-31 22:26:43', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:43', '/work');
INSERT INTO `sys_visit` VALUES ('642', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/project/list');
INSERT INTO `sys_visit` VALUES ('643', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/role/list');
INSERT INTO `sys_visit` VALUES ('644', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/work/list');
INSERT INTO `sys_visit` VALUES ('645', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/system/pv');
INSERT INTO `sys_visit` VALUES ('646', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/menu/list');
INSERT INTO `sys_visit` VALUES ('647', '2019-07-31 22:26:44', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:26:44', '/system/hourpv');
INSERT INTO `sys_visit` VALUES ('648', '2019-07-31 22:28:08', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:08', '/');
INSERT INTO `sys_visit` VALUES ('649', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/system/welcome');
INSERT INTO `sys_visit` VALUES ('650', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/project');
INSERT INTO `sys_visit` VALUES ('651', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/menu');
INSERT INTO `sys_visit` VALUES ('652', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/role');
INSERT INTO `sys_visit` VALUES ('653', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/work');
INSERT INTO `sys_visit` VALUES ('654', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/project/list');
INSERT INTO `sys_visit` VALUES ('655', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/role/list');
INSERT INTO `sys_visit` VALUES ('656', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/work/list');
INSERT INTO `sys_visit` VALUES ('657', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/menu/list');
INSERT INTO `sys_visit` VALUES ('658', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/system/pv');
INSERT INTO `sys_visit` VALUES ('659', '2019-07-31 22:28:09', '1', 'admin', null, null, null, '0', null, null, '127.0.0.1', null, '1', 'admin', null, '2019-07-31 22:28:09', '/system/hourpv');

-- ----------------------------
-- Table structure for sys_work
-- ----------------------------
DROP TABLE IF EXISTS `sys_work`;
CREATE TABLE `sys_work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `today` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_work
-- ----------------------------

-- ----------------------------
-- Table structure for sys_work_audit
-- ----------------------------
DROP TABLE IF EXISTS `sys_work_audit`;
CREATE TABLE `sys_work_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `suggestions` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_record_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtr1h9jqkgpqrpalqxxkmjbls1` (`work_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_work_audit
-- ----------------------------

-- ----------------------------
-- Table structure for sys_work_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_work_record`;
CREATE TABLE `sys_work_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_user_id` bigint(20) DEFAULT NULL,
  `last_update_user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `work_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkkyypg00g4wagjb6pk634aeo0` (`project_id`),
  KEY `FKnsrl9y6y8x5mgdfua5dgx62im` (`work_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_work_record
-- ----------------------------
