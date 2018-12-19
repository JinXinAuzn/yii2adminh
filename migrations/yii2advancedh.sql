/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : 127.0.0.1:3306
 Source Schema         : yii2advancedh

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 19/12/2018 16:30:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `auth_assignment_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('超级管理员', '1', 1545096646);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 2, NULL, NULL, NULL, 1545042909, 1545042909);
INSERT INTO `auth_item` VALUES ('/adminh/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/adminh/assignment/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/assignment/assign', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/assignment/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/assignment/revoke', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/assignment/view', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/base/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/default/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/default/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/logs/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/logs/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/main/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/main/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/*', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/create', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/delete', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/update', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/menu/view', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/permission/*', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/assign', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/create', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/delete', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/index', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/permission/remove', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/update', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/permission/view', 2, NULL, NULL, NULL, 1545208169, 1545208169);
INSERT INTO `auth_item` VALUES ('/adminh/role/*', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/assign', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/create', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/delete', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/index', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/remove', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/update', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/role/view', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/*', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/assign', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/create', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/index', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/refresh', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/route/remove', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/*', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/create', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/delete', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/index', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/update', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/rule/view', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/adminh/user/activate', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/captcha', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/change-password', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/delete', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/index', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/login', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/logout', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/request-password-reset', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/reset-password', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/signup', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/adminh/user/view', 2, NULL, NULL, NULL, 1545208170, 1545208170);
INSERT INTO `auth_item` VALUES ('/debug/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/index', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/default/view', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/user/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 2, NULL, NULL, NULL, 1545208171, 1545208171);
INSERT INTO `auth_item` VALUES ('admin', 2, '超级管理员', NULL, NULL, 1545096612, 1545096625);
INSERT INTO `auth_item` VALUES ('超级管理员', 1, '超级管理员', NULL, NULL, 1545096640, 1545096640);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admin', '/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', '/*');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自编号',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '日志类型',
  `master_id` int(11) NOT NULL DEFAULT 1 COMMENT '操作人编号',
  `ip` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.0.0.0' COMMENT '操作者ip',
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路由',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  `updated_at` int(11) NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `data` blob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '权限管理', NULL, NULL, 99, 0x7B2269636F6E223A202266612066612D746163686F6D65746572222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES (2, '管理员列表', 1, '/adminh/user/index', 1, NULL);
INSERT INTO `menu` VALUES (3, '分配列表', 1, '/adminh/assignment/index', 2, NULL);
INSERT INTO `menu` VALUES (4, '角色列表', 1, '/adminh/role/index', 3, NULL);
INSERT INTO `menu` VALUES (5, '权限列表', 1, '/adminh/permission/index', 4, NULL);
INSERT INTO `menu` VALUES (6, '菜单列表', 1, '/adminh/menu/index', 5, NULL);
INSERT INTO `menu` VALUES (7, '规则列表', 1, '/adminh/rule/index', 6, NULL);
INSERT INTO `menu` VALUES (8, '路由列表', 1, '/adminh/route/index', 7, NULL);
INSERT INTO `menu` VALUES (9, '操作日志', 1, '/adminh/logs/index', 8, NULL);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1545042670);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1545042804);
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', 1545042672);
INSERT INTO `migration` VALUES ('m160312_050000_create_user', 1545042672);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1545042804);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'b4Jj789yYlrTB-NA8OPO_aOOCJNYWirK', '$2y$13$Qo9cAy.e277FBwxx4kPEquba2SLdVkVJerDYj192eyZ8t6d1me1SS', NULL, '690550322@QQ.com', 10, 1535300311, 1537031768);

SET FOREIGN_KEY_CHECKS = 1;
