/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : bsc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-07-25 17:48:31
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
  `p_ids` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `simple_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoqdgl3yv2b2x0a88dh6vtxjya` (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '2019-07-24 13:42:59', '1', '1', '2019-07-24 13:43:36', null, null, '1', null, '2', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('2', '2019-07-24 13:44:49', '2', '2', null, null, null, '0', null, '2', null, null, null, '1');

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
  `levels` int(11) DEFAULT NULL,
  `menu_flag` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_page_flag` int(11) DEFAULT NULL,
  `open_flag` int(11) DEFAULT NULL,
  `pcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pcodes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2jrf4gb0gjqi8882gxytpxnhe` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'system', null, 'layui-icon layui-icon-username', '1', '0', '系统管理', null, '1', '0', '[0],', '30', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('106', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr', null, '', '2', '0', '用户管理', null, '0', 'system', '[0],[system],', '1', '0', '/mgr', '105');
INSERT INTO `sys_menu` VALUES ('107', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_add', null, null, '3', '1', '添加用户', null, '0', 'mgr', '[0],[system],[mgr],', '1', '0', '/mgr/add', '106');
INSERT INTO `sys_menu` VALUES ('108', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_edit', null, null, '3', '1', '修改用户', null, '0', 'mgr', '[0],[system],[mgr],', '2', '0', '/mgr/edit', '106');
INSERT INTO `sys_menu` VALUES ('109', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_delete', null, null, '3', '1', '删除用户', null, '0', 'mgr', '[0],[system],[mgr],', '3', '0', '/mgr/delete', '106');
INSERT INTO `sys_menu` VALUES ('110', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_reset', null, null, '3', '1', '重置密码', null, '0', 'mgr', '[0],[system],[mgr],', '4', '0', '/mgr/reset', '106');
INSERT INTO `sys_menu` VALUES ('111', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_freeze', null, null, '3', '1', '冻结用户', null, '0', 'mgr', '[0],[system],[mgr],', '5', '0', '/mgr/freeze', '106');
INSERT INTO `sys_menu` VALUES ('112', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_unfreeze', null, null, '3', '1', '解除冻结用户', null, '0', 'mgr', '[0],[system],[mgr],', '6', '0', '/mgr/unfreeze', '106');
INSERT INTO `sys_menu` VALUES ('113', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_setRole', null, null, '3', '1', '分配角色', null, '0', 'mgr', '[0],[system],[mgr],', '7', '0', '/mgr/setRole', '106');
INSERT INTO `sys_menu` VALUES ('114', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role', null, null, '2', '0', '角色管理', null, '0', 'system', '[0],[system],', '2', '0', '/role', '105');
INSERT INTO `sys_menu` VALUES ('115', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_add', null, null, '3', '1', '添加角色', null, '0', 'role', '[0],[system],[role],', '1', '0', '/role/add', '114');
INSERT INTO `sys_menu` VALUES ('116', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_edit', null, null, '3', '1', '修改角色', null, '0', 'role', '[0],[system],[role],', '2', '0', '/role/edit', '114');
INSERT INTO `sys_menu` VALUES ('117', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_remove', null, null, '3', '1', '删除角色', null, '0', 'role', '[0],[system],[role],', '3', '0', '/role/remove', '114');
INSERT INTO `sys_menu` VALUES ('118', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_setAuthority', null, null, '3', '1', '配置权限', null, '0', 'role', '[0],[system],[role],', '4', '0', '/role/setAuthority', '114');
INSERT INTO `sys_menu` VALUES ('119', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu', null, null, '2', '0', '菜单管理', null, '0', 'system', '[0],[system],', '4', '0', '/menu', '105');
INSERT INTO `sys_menu` VALUES ('120', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_add', null, null, '3', '1', '添加菜单', null, '0', 'menu', '[0],[system],[menu],', '1', '0', '/menu/add', '119');
INSERT INTO `sys_menu` VALUES ('121', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_edit', null, null, '3', '1', '修改菜单', null, '0', 'menu', '[0],[system],[menu],', '2', '0', '/menu/edit', '119');
INSERT INTO `sys_menu` VALUES ('122', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_remove', null, null, '3', '1', '删除菜单', null, '0', 'menu', '[0],[system],[menu],', '3', '0', '/menu/remove', '119');
INSERT INTO `sys_menu` VALUES ('128', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'log', null, null, '2', '0', '业务日志', null, '0', 'system', '[0],[system],', '6', '0', '/log', '105');
INSERT INTO `sys_menu` VALUES ('130', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'druid', null, null, '2', '0', '监控管理', null, null, 'system', '[0],[system],', '7', '0', '/druid', '105');
INSERT INTO `sys_menu` VALUES ('131', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept', null, null, '2', '0', '部门管理', null, null, 'system', '[0],[system],', '3', '0', '/dept', '105');
INSERT INTO `sys_menu` VALUES ('132', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict', null, null, '2', '0', '字典管理', null, null, 'system', '[0],[system],', '4', '0', '/dict', '105');
INSERT INTO `sys_menu` VALUES ('133', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'loginLog', null, null, '2', '0', '登录日志', null, null, 'system', '[0],[system],', '6', '0', '/loginLog', '105');
INSERT INTO `sys_menu` VALUES ('134', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'log_clean', null, null, '3', '1', '清空日志', null, null, 'log', '[0],[system],[log],', '3', '0', '/log/delLog', '128');
INSERT INTO `sys_menu` VALUES ('135', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_add', null, null, '3', '1', '添加部门', null, null, 'dept', '[0],[system],[dept],', '1', '0', '/dept/add', '131');
INSERT INTO `sys_menu` VALUES ('136', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_update', null, null, '3', '1', '修改部门', null, null, 'dept', '[0],[system],[dept],', '1', '0', '/dept/update', '131');
INSERT INTO `sys_menu` VALUES ('137', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_delete', null, null, '3', '1', '删除部门', null, null, 'dept', '[0],[system],[dept],', '1', '0', '/dept/delete', '131');
INSERT INTO `sys_menu` VALUES ('138', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_add', null, null, '3', '1', '添加字典', null, null, 'dict', '[0],[system],[dict],', '1', '0', '/dict/add', '132');
INSERT INTO `sys_menu` VALUES ('139', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_update', null, null, '3', '1', '修改字典', null, null, 'dict', '[0],[system],[dict],', '1', '0', '/dict/update', '132');
INSERT INTO `sys_menu` VALUES ('140', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_delete', null, null, '3', '1', '删除字典', null, null, 'dict', '[0],[system],[dict],', '1', '0', '/dict/delete', '132');
INSERT INTO `sys_menu` VALUES ('141', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice', null, null, '2', '0', '通知管理', null, null, 'system', '[0],[system],', '9', '0', '/notice', '105');
INSERT INTO `sys_menu` VALUES ('142', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_add', null, null, '3', '1', '添加通知', null, null, 'notice', '[0],[system],[notice],', '1', '0', '/notice/add', '141');
INSERT INTO `sys_menu` VALUES ('143', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_update', null, null, '3', '1', '修改通知', null, null, 'notice', '[0],[system],[notice],', '2', '0', '/notice/update', '141');
INSERT INTO `sys_menu` VALUES ('144', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'notice_delete', null, null, '3', '1', '删除通知', null, null, 'notice', '[0],[system],[notice],', '3', '0', '/notice/delete', '141');
INSERT INTO `sys_menu` VALUES ('145', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'hello', null, 'layui-icon layui-icon-tips', '2', '0', '系统消息', null, null, 'system_message', '[0],[system_message],', '1', '0', '/notice/hello', '172');
INSERT INTO `sys_menu` VALUES ('149', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'api_mgr', null, 'fa-leaf', '2', '0', '接口文档', null, null, 'dev_tools', '[0],[dev_tools],', '3', '0', '/swagger-ui.html', '171');
INSERT INTO `sys_menu` VALUES ('150', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_menu_edit', null, '', '3', '1', '菜单编辑跳转', null, null, 'menu', '[0],[system],[menu],', '4', '0', '/menu/menu_edit', '119');
INSERT INTO `sys_menu` VALUES ('151', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'menu_list', null, '', '3', '1', '菜单列表', null, null, 'menu', '[0],[system],[menu],', '5', '0', '/menu/list', '119');
INSERT INTO `sys_menu` VALUES ('152', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_dept_update', null, '', '3', '1', '修改部门跳转', null, null, 'dept', '[0],[system],[dept],', '4', '0', '/dept/dept_update', '131');
INSERT INTO `sys_menu` VALUES ('153', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_list', null, '', '3', '1', '部门列表', null, null, 'dept', '[0],[system],[dept],', '5', '0', '/dept/list', '131');
INSERT INTO `sys_menu` VALUES ('154', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dept_detail', null, '', '3', '1', '部门详情', null, null, 'dept', '[0],[system],[dept],', '6', '0', '/dept/detail', '131');
INSERT INTO `sys_menu` VALUES ('155', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_dict_edit', null, '', '3', '1', '修改菜单跳转', null, null, 'dict', '[0],[system],[dict],', '4', '0', '/dict/dict_edit', '132');
INSERT INTO `sys_menu` VALUES ('156', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_list', null, '', '3', '1', '字典列表', null, null, 'dict', '[0],[system],[dict],', '5', '0', '/dict/list', '132');
INSERT INTO `sys_menu` VALUES ('157', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dict_detail', null, '', '3', '1', '字典详情', null, null, 'dict', '[0],[system],[dict],', '6', '0', '/dict/detail', '132');
INSERT INTO `sys_menu` VALUES ('158', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'log_list', null, '', '3', '1', '日志列表', null, null, 'log', '[0],[system],[log],', '2', '0', '/log/list', '128');
INSERT INTO `sys_menu` VALUES ('159', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'log_detail', null, '', '3', '1', '日志详情', null, null, 'log', '[0],[system],[log],', '3', '0', '/log/detail', '128');
INSERT INTO `sys_menu` VALUES ('160', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'del_login_log', null, '', '3', '1', '清空登录日志', null, null, 'loginLog', '[0],[system],[loginLog],', '1', '0', '/loginLog/delLoginLog', '133');
INSERT INTO `sys_menu` VALUES ('161', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'login_log_list', null, '', '3', '1', '登录日志列表', null, null, 'loginLog', '[0],[system],[loginLog],', '2', '0', '/loginLog/list', '133');
INSERT INTO `sys_menu` VALUES ('162', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_role_edit', null, '', '3', '1', '修改角色跳转', null, null, 'role', '[0],[system],[role],', '5', '0', '/role/role_edit', '114');
INSERT INTO `sys_menu` VALUES ('163', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_role_assign', null, '', '3', '1', '角色分配跳转', null, null, 'role', '[0],[system],[role],', '6', '0', '/role/role_assign', '114');
INSERT INTO `sys_menu` VALUES ('164', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'role_list', null, '', '3', '1', '角色列表', null, null, 'role', '[0],[system],[role],', '7', '0', '/role/list', '114');
INSERT INTO `sys_menu` VALUES ('165', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_assign_role', null, '', '3', '1', '分配角色跳转', null, null, 'mgr', '[0],[system],[mgr],', '8', '0', '/mgr/role_assign', '106');
INSERT INTO `sys_menu` VALUES ('166', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'to_user_edit', null, '', '3', '1', '编辑用户跳转', null, null, 'mgr', '[0],[system],[mgr],', '9', '0', '/mgr/user_edit', '106');
INSERT INTO `sys_menu` VALUES ('167', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'mgr_list', null, '', '3', '1', '用户列表', null, null, 'mgr', '[0],[system],[mgr],', '10', '0', '/mgr/list', '106');
INSERT INTO `sys_menu` VALUES ('171', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'dev_tools', null, 'layui-icon layui-icon-app', '1', '0', '开发工具', null, null, '0', '[0],', '20', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('172', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'system_message', null, 'layui-icon layui-icon-tips', '1', '1', '系统消息', null, null, '0', '[0],', '10', '0', '#', null);
INSERT INTO `sys_menu` VALUES ('173', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'generator', null, '', '2', '0', '代码生成', null, null, 'dev_tools', '[0],[dev_tools],', '2', '0', '/generator', '171');
INSERT INTO `sys_menu` VALUES ('174', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'generator_generator', null, '', '3', '1', '代码生成', null, null, 'generator', '[0],[dev_tools],[generator],', '1', '0', '/generator/generator', '173');
INSERT INTO `sys_menu` VALUES ('175', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'datasource', null, '', '2', '0', '数据源管理', null, null, 'dev_tools', '[0],[dev_tools],', '1', '0', '/datasource', '171');
INSERT INTO `sys_menu` VALUES ('176', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'datasource_add', null, '', '3', '1', '添加数据源', null, null, 'datasource', '[0],[dev_tools],[datasource],', '1', '0', '/datasource/add', '175');
INSERT INTO `sys_menu` VALUES ('177', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'datasource_edit', null, '', '3', '1', '修改数据源', null, null, 'datasource', '[0],[dev_tools],[datasource],', null, '0', '/datasource/edit', '175');
INSERT INTO `sys_menu` VALUES ('178', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'welcome', null, 'layui-icon layui-icon-home', '1', '0', '工作台', null, null, '0', '[0],', '1', '0', '/system/welcome', null);
INSERT INTO `sys_menu` VALUES ('179', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss', '', '', '2', '0', '云存储', null, null, 'system', '[0],[system],', '1', '0', '/oss', '105');
INSERT INTO `sys_menu` VALUES ('180', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_list', '', '', '3', '1', '云存储列表', null, null, 'oss', '[0],[system],[oss],', '1', '0', '/oss/list', '179');
INSERT INTO `sys_menu` VALUES ('181', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_add', '', '', '3', '1', '云存储添加', null, null, 'oss', '[0],[system],[oss],', '2', '0', '/oss/add', '179');
INSERT INTO `sys_menu` VALUES ('182', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_update', '', '', '3', '1', '云存储更新', null, null, 'oss', '[0],[system],[oss],', '3', '0', '/oss/update', '179');
INSERT INTO `sys_menu` VALUES ('183', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'oss_delete', '', '', '3', '1', '云存储删除', null, null, 'oss', '[0],[system],[oss],', '4', '0', '/oss/delete', '179');
INSERT INTO `sys_menu` VALUES ('184', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp', '', '', '2', '0', 'FTP配置', null, null, 'system', '[0],[system],', '1', '0', '/ftp', '105');
INSERT INTO `sys_menu` VALUES ('185', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_list', '', '', '3', '1', 'FTP配置列表', null, null, 'ftp', '[0],[system],[ftp],', '1', '0', '/ftp/list', '184');
INSERT INTO `sys_menu` VALUES ('186', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_add', '', '', '3', '1', 'FTP配置添加', null, null, 'ftp', '[0],[system],[ftp],', '1', '0', '/ftp/add', '184');
INSERT INTO `sys_menu` VALUES ('187', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_update', '', '', '3', '1', 'FTP配置更新', null, null, 'ftp', '[0],[system],[ftp],', '1', '0', '/ftp/update', '184');
INSERT INTO `sys_menu` VALUES ('188', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'ftp_delete', '', '', '3', '1', 'FTP配置删除', null, null, 'ftp', '[0],[system],[ftp],', '1', '0', '/ftp/delete', '184');
INSERT INTO `sys_menu` VALUES ('195', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project', '', 'layui-icon layui-icon-tips', '1', '0', '项目管理', null, null, '0', '[0],', '2', '0', '/project', null);
INSERT INTO `sys_menu` VALUES ('196', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_list', '', '', '3', '1', '项目列表', null, null, 'project', '[0],[project],[project],', '1', '0', '/project/list', '195');
INSERT INTO `sys_menu` VALUES ('197', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_add', '', '', '3', '1', '项目添加', null, null, 'project', '[0],[project],[project],', '2', '0', '/project/add', '195');
INSERT INTO `sys_menu` VALUES ('198', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_update', '', '', '3', '1', '项目更新', null, null, 'project', '[0],[project],[project],', '3', '0', '/project/update', '195');
INSERT INTO `sys_menu` VALUES ('199', '2019-07-25 10:23:42', '1', 'admin', null, null, null, '1', 'project_delete', '', '', '3', '1', '项目删除', null, null, 'project', '[0],[project],[project],', '4', '0', '/project/delete', '195');

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
  `pid` bigint(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2019-07-25 09:52:40', '1', 'admin', null, null, null, '1', 'administrator', '超级管理员', '0', '1', '0');

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
INSERT INTO `sys_role_menus` VALUES ('1', '112');
INSERT INTO `sys_role_menus` VALUES ('1', '113');
INSERT INTO `sys_role_menus` VALUES ('1', '114');
INSERT INTO `sys_role_menus` VALUES ('1', '115');
INSERT INTO `sys_role_menus` VALUES ('1', '116');
INSERT INTO `sys_role_menus` VALUES ('1', '117');
INSERT INTO `sys_role_menus` VALUES ('1', '118');
INSERT INTO `sys_role_menus` VALUES ('1', '119');
INSERT INTO `sys_role_menus` VALUES ('1', '120');
INSERT INTO `sys_role_menus` VALUES ('1', '121');
INSERT INTO `sys_role_menus` VALUES ('1', '122');
INSERT INTO `sys_role_menus` VALUES ('1', '128');
INSERT INTO `sys_role_menus` VALUES ('1', '130');
INSERT INTO `sys_role_menus` VALUES ('1', '131');
INSERT INTO `sys_role_menus` VALUES ('1', '132');
INSERT INTO `sys_role_menus` VALUES ('1', '133');
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
INSERT INTO `sys_role_menus` VALUES ('1', '150');
INSERT INTO `sys_role_menus` VALUES ('1', '151');
INSERT INTO `sys_role_menus` VALUES ('1', '152');
INSERT INTO `sys_role_menus` VALUES ('1', '153');
INSERT INTO `sys_role_menus` VALUES ('1', '154');
INSERT INTO `sys_role_menus` VALUES ('1', '155');
INSERT INTO `sys_role_menus` VALUES ('1', '156');
INSERT INTO `sys_role_menus` VALUES ('1', '157');
INSERT INTO `sys_role_menus` VALUES ('1', '158');
INSERT INTO `sys_role_menus` VALUES ('1', '159');
INSERT INTO `sys_role_menus` VALUES ('1', '160');
INSERT INTO `sys_role_menus` VALUES ('1', '161');
INSERT INTO `sys_role_menus` VALUES ('1', '162');
INSERT INTO `sys_role_menus` VALUES ('1', '163');
INSERT INTO `sys_role_menus` VALUES ('1', '164');
INSERT INTO `sys_role_menus` VALUES ('1', '165');
INSERT INTO `sys_role_menus` VALUES ('1', '166');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2019-07-25 09:47:31', '1', 'admin', null, null, null, '1', 'admin', null, null, null, null, '哈哈', '2944d32eca9cce547135c2b360826d19', null, 'q6taw', '1', '0', null);

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
