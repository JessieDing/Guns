/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : guns

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-06-24 23:18:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` INT(11) DEFAULT NULL COMMENT '排序',
  `pid` INT(11) DEFAULT NULL COMMENT '父部门id',
  `simplename` VARCHAR(45) DEFAULT NULL COMMENT '简称',
  `fullname` VARCHAR(255) DEFAULT NULL COMMENT '全称',
  `tips` VARCHAR(255) DEFAULT NULL COMMENT '提示',
  `version` INT(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('24', '1', '0', '总公司', '总公司', '', NULL);
INSERT INTO `dept` VALUES ('25', '2', '24', '开发部', '开发部', '', NULL);
INSERT INTO `dept` VALUES ('26', '3', '24', '运营部', '运营部', '', NULL);
INSERT INTO `dept` VALUES ('27', '4', '24', '战略部', '战略部', '', NULL);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` INT(11) DEFAULT NULL COMMENT '排序',
  `pid` INT(11) DEFAULT NULL COMMENT '父级字典',
  `name` VARCHAR(255) DEFAULT NULL COMMENT '名称',
  `tips` VARCHAR(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('16', '0', '0', '状态', NULL);
INSERT INTO `dict` VALUES ('17', '1', '16', '启用', NULL);
INSERT INTO `dict` VALUES ('18', '2', '16', '禁用', NULL);
INSERT INTO `dict` VALUES ('29', '0', '0', '性别', NULL);
INSERT INTO `dict` VALUES ('30', '1', '29', '男', NULL);
INSERT INTO `dict` VALUES ('31', '2', '29', '女', NULL);
INSERT INTO `dict` VALUES ('35', '0', '0', '账号状态', NULL);
INSERT INTO `dict` VALUES ('36', '1', '35', '启用', NULL);
INSERT INTO `dict` VALUES ('37', '2', '35', '冻结', NULL);
INSERT INTO `dict` VALUES ('38', '3', '35', '已删除', NULL);

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` INT(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` VARCHAR(255) DEFAULT NULL COMMENT '日志名称',
  `userid` INT(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` DATETIME DEFAULT NULL COMMENT '创建时间',
  `succeed` VARCHAR(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` TEXT COMMENT '具体消息',
  `ip` VARCHAR(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('126', '退出日志', '1', '2017-06-04 10:21:55', '成功', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('127', '登录日志', '1', '2017-06-04 10:21:59', '成功', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('128', '退出日志', '1', '2017-06-04 10:22:59', '成功', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('129', '登录日志', '1', '2017-06-04 10:23:01', '成功', NULL, '127.0.0.1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` INT(65) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` VARCHAR(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` VARCHAR(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` VARCHAR(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` VARCHAR(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` VARCHAR(255) DEFAULT NULL COMMENT '菜单图标',
  `url` VARCHAR(255) DEFAULT NULL COMMENT 'url地址',
  `num` INT(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` INT(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` INT(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `status` INT(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` INT(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-user', '', '3', '1', '1', NULL, '1', '1');
INSERT INTO `menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', NULL, '1', '0');
INSERT INTO `menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', '3', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', '4', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', '5', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', '6', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', '7', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', NULL, '/role', '2', '2', '1', NULL, '1', '0');
INSERT INTO `menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', '3', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', '4', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', NULL, '/menu', '4', '2', '1', NULL, '1', '0');
INSERT INTO `menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', '1', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', '2', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', '3', '3', '0', NULL, '1', '0');
INSERT INTO `menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', NULL, '/log', '6', '2', '1', NULL, '1', '0');
INSERT INTO `menu` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', NULL, '/druid', '7', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', NULL, '/dept', '3', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', NULL, '/dict', '4', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', NULL, '/loginLog', '6', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dict/add', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dict/update', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dict/delete', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', NULL, '/notice', '9', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('148', 'code', 'system', '[0],[system],', '代码生成', 'fa-user', '/code', '10', '2', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', NULL, '1', NULL);
INSERT INTO `menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', NULL, '1', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` VARCHAR(255) DEFAULT NULL COMMENT '标题',
  `type` INT(11) DEFAULT NULL COMMENT '类型',
  `content` TEXT COMMENT '内容',
  `createtime` DATETIME DEFAULT NULL COMMENT '创建时间',
  `creater` INT(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='通知表';


-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('6', '世界', '10', '欢迎使用Guns管理系统', '2017-01-11 08:53:20', '1');
INSERT INTO `notice` VALUES ('8', '你好', NULL, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` INT(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` VARCHAR(255) DEFAULT NULL COMMENT '日志类型',
  `logname` VARCHAR(255) DEFAULT NULL COMMENT '日志名称',
  `userid` INT(65) DEFAULT NULL COMMENT '用户id',
  `classname` VARCHAR(255) DEFAULT NULL COMMENT '类名称',
  `method` TEXT COMMENT '方法名称',
  `createtime` DATETIME DEFAULT NULL COMMENT '创建时间',
  `succeed` VARCHAR(255) DEFAULT NULL COMMENT '是否成功',
  `message` TEXT COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of operation_log
-- ----------------------------
INSERT INTO `operation_log` VALUES ('480', '业务日志', '清空业务日志', '1', 'com.stylefeng.guns.modular.system.controller.LogController', 'delLog', '2017-06-03 23:04:22', '成功', '主键id=null');
INSERT INTO `operation_log` VALUES ('481', '业务日志', '清空登录日志', '1', 'com.stylefeng.guns.modular.system.controller.LoginLogController', 'delLog', '2017-06-03 23:04:25', '成功', '主键id=null');
INSERT INTO `operation_log` VALUES ('482', '业务日志', '修改菜单', '1', 'com.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2017-06-04 10:22:58', '成功', '菜单名称=分配角色跳转;;;字段名称:url地址,旧值:/role/role_assign,新值:/mgr/role_assign');

-- ----------------------------
-- Table structure for relation
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` INT(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` INT(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3679 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of relation
-- ----------------------------
INSERT INTO `relation` VALUES ('3377', '105', '5');
INSERT INTO `relation` VALUES ('3378', '106', '5');
INSERT INTO `relation` VALUES ('3379', '107', '5');
INSERT INTO `relation` VALUES ('3380', '108', '5');
INSERT INTO `relation` VALUES ('3381', '109', '5');
INSERT INTO `relation` VALUES ('3382', '110', '5');
INSERT INTO `relation` VALUES ('3383', '111', '5');
INSERT INTO `relation` VALUES ('3384', '112', '5');
INSERT INTO `relation` VALUES ('3385', '113', '5');
INSERT INTO `relation` VALUES ('3386', '114', '5');
INSERT INTO `relation` VALUES ('3387', '115', '5');
INSERT INTO `relation` VALUES ('3388', '116', '5');
INSERT INTO `relation` VALUES ('3389', '117', '5');
INSERT INTO `relation` VALUES ('3390', '118', '5');
INSERT INTO `relation` VALUES ('3391', '119', '5');
INSERT INTO `relation` VALUES ('3392', '120', '5');
INSERT INTO `relation` VALUES ('3393', '121', '5');
INSERT INTO `relation` VALUES ('3394', '122', '5');
INSERT INTO `relation` VALUES ('3395', '150', '5');
INSERT INTO `relation` VALUES ('3396', '151', '5');
INSERT INTO `relation` VALUES ('3624', '105', '1');
INSERT INTO `relation` VALUES ('3625', '106', '1');
INSERT INTO `relation` VALUES ('3626', '107', '1');
INSERT INTO `relation` VALUES ('3627', '108', '1');
INSERT INTO `relation` VALUES ('3628', '109', '1');
INSERT INTO `relation` VALUES ('3629', '110', '1');
INSERT INTO `relation` VALUES ('3630', '111', '1');
INSERT INTO `relation` VALUES ('3631', '112', '1');
INSERT INTO `relation` VALUES ('3632', '113', '1');
INSERT INTO `relation` VALUES ('3633', '165', '1');
INSERT INTO `relation` VALUES ('3634', '166', '1');
INSERT INTO `relation` VALUES ('3635', '167', '1');
INSERT INTO `relation` VALUES ('3636', '114', '1');
INSERT INTO `relation` VALUES ('3637', '115', '1');
INSERT INTO `relation` VALUES ('3638', '116', '1');
INSERT INTO `relation` VALUES ('3639', '117', '1');
INSERT INTO `relation` VALUES ('3640', '118', '1');
INSERT INTO `relation` VALUES ('3641', '162', '1');
INSERT INTO `relation` VALUES ('3642', '163', '1');
INSERT INTO `relation` VALUES ('3643', '164', '1');
INSERT INTO `relation` VALUES ('3644', '119', '1');
INSERT INTO `relation` VALUES ('3645', '120', '1');
INSERT INTO `relation` VALUES ('3646', '121', '1');
INSERT INTO `relation` VALUES ('3647', '122', '1');
INSERT INTO `relation` VALUES ('3648', '150', '1');
INSERT INTO `relation` VALUES ('3649', '151', '1');
INSERT INTO `relation` VALUES ('3650', '128', '1');
INSERT INTO `relation` VALUES ('3651', '134', '1');
INSERT INTO `relation` VALUES ('3652', '158', '1');
INSERT INTO `relation` VALUES ('3653', '159', '1');
INSERT INTO `relation` VALUES ('3654', '130', '1');
INSERT INTO `relation` VALUES ('3655', '131', '1');
INSERT INTO `relation` VALUES ('3656', '135', '1');
INSERT INTO `relation` VALUES ('3657', '136', '1');
INSERT INTO `relation` VALUES ('3658', '137', '1');
INSERT INTO `relation` VALUES ('3659', '152', '1');
INSERT INTO `relation` VALUES ('3660', '153', '1');
INSERT INTO `relation` VALUES ('3661', '154', '1');
INSERT INTO `relation` VALUES ('3662', '132', '1');
INSERT INTO `relation` VALUES ('3663', '138', '1');
INSERT INTO `relation` VALUES ('3664', '139', '1');
INSERT INTO `relation` VALUES ('3665', '140', '1');
INSERT INTO `relation` VALUES ('3666', '155', '1');
INSERT INTO `relation` VALUES ('3667', '156', '1');
INSERT INTO `relation` VALUES ('3668', '157', '1');
INSERT INTO `relation` VALUES ('3669', '133', '1');
INSERT INTO `relation` VALUES ('3670', '160', '1');
INSERT INTO `relation` VALUES ('3671', '161', '1');
INSERT INTO `relation` VALUES ('3672', '141', '1');
INSERT INTO `relation` VALUES ('3673', '142', '1');
INSERT INTO `relation` VALUES ('3674', '143', '1');
INSERT INTO `relation` VALUES ('3675', '144', '1');
INSERT INTO `relation` VALUES ('3676', '148', '1');
INSERT INTO `relation` VALUES ('3677', '145', '1');
INSERT INTO `relation` VALUES ('3678', '149', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` INT(11) DEFAULT NULL COMMENT '序号',
  `pid` INT(11) DEFAULT NULL COMMENT '父角色id',
  `name` VARCHAR(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` INT(11) DEFAULT NULL COMMENT '部门名称',
  `tips` VARCHAR(255) DEFAULT NULL COMMENT '提示',
  `version` INT(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO `role` VALUES ('5', '2', '1', '临时', '26', 'temp', NULL);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` INT(11) NOT NULL,
  `value` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '123');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` VARCHAR(255) DEFAULT NULL COMMENT '头像',
  `account` VARCHAR(45) DEFAULT NULL COMMENT '账号',
  `password` VARCHAR(45) DEFAULT NULL COMMENT '密码',
  `salt` VARCHAR(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` VARCHAR(45) DEFAULT NULL COMMENT '名字',
  `birthday` DATETIME DEFAULT NULL COMMENT '生日',
  `sex` INT(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` VARCHAR(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` VARCHAR(45) DEFAULT NULL COMMENT '电话',
  `roleid` VARCHAR(255) DEFAULT NULL COMMENT '角色id',
  `deptid` INT(11) DEFAULT NULL COMMENT '部门id',
  `status` INT(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` DATETIME DEFAULT NULL COMMENT '创建时间',
  `version` INT(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'sn93@qq.com', '18200000000', '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `user` VALUES ('44', NULL, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', '1', 'abc@123.com', '', '5', '26', '1', '2017-05-16 20:33:37', NULL);
