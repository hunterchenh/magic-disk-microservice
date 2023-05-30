/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : file

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 29/03/2023 16:21:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commonfile
-- ----------------------------
DROP TABLE IF EXISTS `commonfile`;
CREATE TABLE `commonfile`  (
  `commonFileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userFileId` bigint(20) NULL DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`commonFileId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commonfile
-- ----------------------------

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `fileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `createUserId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建用户id',
  `fileSize` bigint(10) NULL DEFAULT NULL COMMENT '文件大小',
  `fileStatus` int(1) NULL DEFAULT NULL COMMENT '文件状态(0-失效，1-生效)',
  `fileUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `identifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5唯一标识',
  `modifyTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改用户id',
  `storageType` int(1) NULL DEFAULT NULL COMMENT '存储类型',
  PRIMARY KEY (`fileId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for fileclassification
-- ----------------------------
DROP TABLE IF EXISTS `fileclassification`;
CREATE TABLE `fileclassification`  (
  `fileClassificationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileExtendName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `fileTypeId` bigint(20) NULL DEFAULT NULL COMMENT '文件类型id',
  PRIMARY KEY (`fileClassificationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fileclassification
-- ----------------------------
INSERT INTO `fileclassification` VALUES (1, 'bmp', 1);
INSERT INTO `fileclassification` VALUES (2, 'jpg', 1);
INSERT INTO `fileclassification` VALUES (3, 'png', 1);
INSERT INTO `fileclassification` VALUES (4, 'tif', 1);
INSERT INTO `fileclassification` VALUES (5, 'gif', 1);
INSERT INTO `fileclassification` VALUES (6, 'jpeg', 1);
INSERT INTO `fileclassification` VALUES (7, 'doc', 2);
INSERT INTO `fileclassification` VALUES (8, 'docx', 2);
INSERT INTO `fileclassification` VALUES (9, 'docm', 2);
INSERT INTO `fileclassification` VALUES (10, 'dot', 2);
INSERT INTO `fileclassification` VALUES (11, 'dotx', 2);
INSERT INTO `fileclassification` VALUES (12, 'dotm', 2);
INSERT INTO `fileclassification` VALUES (13, 'odt', 2);
INSERT INTO `fileclassification` VALUES (14, 'fodt', 2);
INSERT INTO `fileclassification` VALUES (15, 'ott', 2);
INSERT INTO `fileclassification` VALUES (16, 'rtf', 2);
INSERT INTO `fileclassification` VALUES (17, 'txt', 2);
INSERT INTO `fileclassification` VALUES (18, 'html', 2);
INSERT INTO `fileclassification` VALUES (19, 'htm', 2);
INSERT INTO `fileclassification` VALUES (20, 'mht', 2);
INSERT INTO `fileclassification` VALUES (21, 'xml', 2);
INSERT INTO `fileclassification` VALUES (22, 'pdf', 2);
INSERT INTO `fileclassification` VALUES (23, 'djvu', 2);
INSERT INTO `fileclassification` VALUES (24, 'fb2', 2);
INSERT INTO `fileclassification` VALUES (25, 'epub', 2);
INSERT INTO `fileclassification` VALUES (26, 'xps', 2);
INSERT INTO `fileclassification` VALUES (27, 'xls', 2);
INSERT INTO `fileclassification` VALUES (28, 'xlsx', 2);
INSERT INTO `fileclassification` VALUES (29, 'xlsm', 2);
INSERT INTO `fileclassification` VALUES (30, 'xlt', 2);
INSERT INTO `fileclassification` VALUES (31, 'xltx', 2);
INSERT INTO `fileclassification` VALUES (32, 'xltm', 2);
INSERT INTO `fileclassification` VALUES (33, 'ods', 2);
INSERT INTO `fileclassification` VALUES (34, 'fods', 2);
INSERT INTO `fileclassification` VALUES (35, 'ots', 2);
INSERT INTO `fileclassification` VALUES (36, 'csv', 2);
INSERT INTO `fileclassification` VALUES (37, 'pps', 2);
INSERT INTO `fileclassification` VALUES (38, 'ppsx', 2);
INSERT INTO `fileclassification` VALUES (39, 'ppsm', 2);
INSERT INTO `fileclassification` VALUES (40, 'ppt', 2);
INSERT INTO `fileclassification` VALUES (41, 'pptx', 2);
INSERT INTO `fileclassification` VALUES (42, 'pptm', 2);
INSERT INTO `fileclassification` VALUES (43, 'pot', 2);
INSERT INTO `fileclassification` VALUES (44, 'potx', 2);
INSERT INTO `fileclassification` VALUES (45, 'potm', 2);
INSERT INTO `fileclassification` VALUES (46, 'odp', 2);
INSERT INTO `fileclassification` VALUES (47, 'fodp', 2);
INSERT INTO `fileclassification` VALUES (48, 'otp', 2);
INSERT INTO `fileclassification` VALUES (49, 'hlp', 2);
INSERT INTO `fileclassification` VALUES (50, 'wps', 2);
INSERT INTO `fileclassification` VALUES (51, 'java', 2);
INSERT INTO `fileclassification` VALUES (52, 'js', 2);
INSERT INTO `fileclassification` VALUES (53, 'css', 2);
INSERT INTO `fileclassification` VALUES (54, 'json', 2);
INSERT INTO `fileclassification` VALUES (55, 'avi', 3);
INSERT INTO `fileclassification` VALUES (56, 'mp4', 3);
INSERT INTO `fileclassification` VALUES (57, 'mpg', 3);
INSERT INTO `fileclassification` VALUES (58, 'mov', 3);
INSERT INTO `fileclassification` VALUES (59, 'swf', 3);
INSERT INTO `fileclassification` VALUES (60, 'wav', 4);
INSERT INTO `fileclassification` VALUES (61, 'aif', 4);
INSERT INTO `fileclassification` VALUES (62, 'au', 4);
INSERT INTO `fileclassification` VALUES (63, 'mp3', 4);
INSERT INTO `fileclassification` VALUES (64, 'ram', 4);
INSERT INTO `fileclassification` VALUES (65, 'wma', 4);
INSERT INTO `fileclassification` VALUES (66, 'mmf', 4);
INSERT INTO `fileclassification` VALUES (67, 'amr', 4);
INSERT INTO `fileclassification` VALUES (68, 'aac', 4);
INSERT INTO `fileclassification` VALUES (69, 'flac', 4);
INSERT INTO `fileclassification` VALUES (70, 'md', 2);
INSERT INTO `fileclassification` VALUES (71, 'markdown', 2);

-- ----------------------------
-- Table structure for fileextend
-- ----------------------------
DROP TABLE IF EXISTS `fileextend`;
CREATE TABLE `fileextend`  (
  `fileExtendName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fileExtendDesc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名描述',
  `fileExtendImgUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名预览图',
  PRIMARY KEY (`fileExtendName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fileextend
-- ----------------------------
INSERT INTO `fileextend` VALUES ('aac', NULL, NULL);
INSERT INTO `fileextend` VALUES ('aif', NULL, NULL);
INSERT INTO `fileextend` VALUES ('amr', NULL, NULL);
INSERT INTO `fileextend` VALUES ('au', NULL, NULL);
INSERT INTO `fileextend` VALUES ('avi', NULL, NULL);
INSERT INTO `fileextend` VALUES ('bmp', NULL, NULL);
INSERT INTO `fileextend` VALUES ('css', NULL, NULL);
INSERT INTO `fileextend` VALUES ('csv', NULL, NULL);
INSERT INTO `fileextend` VALUES ('djvu', NULL, NULL);
INSERT INTO `fileextend` VALUES ('doc', NULL, NULL);
INSERT INTO `fileextend` VALUES ('docm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('docx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('dot', NULL, NULL);
INSERT INTO `fileextend` VALUES ('dotm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('dotx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('epub', NULL, NULL);
INSERT INTO `fileextend` VALUES ('fb2', NULL, NULL);
INSERT INTO `fileextend` VALUES ('flac', NULL, NULL);
INSERT INTO `fileextend` VALUES ('fodp', NULL, NULL);
INSERT INTO `fileextend` VALUES ('fods', NULL, NULL);
INSERT INTO `fileextend` VALUES ('fodt', NULL, NULL);
INSERT INTO `fileextend` VALUES ('gif', NULL, NULL);
INSERT INTO `fileextend` VALUES ('hlp', NULL, NULL);
INSERT INTO `fileextend` VALUES ('htm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('html', NULL, NULL);
INSERT INTO `fileextend` VALUES ('java', NULL, NULL);
INSERT INTO `fileextend` VALUES ('jpeg', NULL, NULL);
INSERT INTO `fileextend` VALUES ('jpg', NULL, NULL);
INSERT INTO `fileextend` VALUES ('js', NULL, NULL);
INSERT INTO `fileextend` VALUES ('json', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mht', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mmf', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mov', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mp3', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mp4', NULL, NULL);
INSERT INTO `fileextend` VALUES ('mpg', NULL, NULL);
INSERT INTO `fileextend` VALUES ('odp', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ods', NULL, NULL);
INSERT INTO `fileextend` VALUES ('odt', NULL, NULL);
INSERT INTO `fileextend` VALUES ('otp', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ots', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ott', NULL, NULL);
INSERT INTO `fileextend` VALUES ('pdf', NULL, NULL);
INSERT INTO `fileextend` VALUES ('png', NULL, NULL);
INSERT INTO `fileextend` VALUES ('pot', NULL, NULL);
INSERT INTO `fileextend` VALUES ('potm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('potx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('pps', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ppsm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ppsx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ppt', NULL, NULL);
INSERT INTO `fileextend` VALUES ('pptm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('pptx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('ram', NULL, NULL);
INSERT INTO `fileextend` VALUES ('rtf', NULL, NULL);
INSERT INTO `fileextend` VALUES ('swf', NULL, NULL);
INSERT INTO `fileextend` VALUES ('tif', NULL, NULL);
INSERT INTO `fileextend` VALUES ('txt', NULL, NULL);
INSERT INTO `fileextend` VALUES ('wav', NULL, NULL);
INSERT INTO `fileextend` VALUES ('wma', NULL, NULL);
INSERT INTO `fileextend` VALUES ('wps', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xls', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xlsm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xlsx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xlt', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xltm', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xltx', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xml', NULL, NULL);
INSERT INTO `fileextend` VALUES ('xps', NULL, NULL);

-- ----------------------------
-- Table structure for filepermission
-- ----------------------------
DROP TABLE IF EXISTS `filepermission`;
CREATE TABLE `filepermission`  (
  `filePermissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `commonFileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '共享文件id',
  `filePermissionCode` int(2) NULL DEFAULT NULL COMMENT '用户对文件的权限码',
  `userId` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`filePermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filepermission
-- ----------------------------

-- ----------------------------
-- Table structure for filetype
-- ----------------------------
DROP TABLE IF EXISTS `filetype`;
CREATE TABLE `filetype`  (
  `fileTypeId` int(11) NOT NULL,
  `fileTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型名',
  `orderNum` int(2) NULL DEFAULT NULL COMMENT '次序',
  PRIMARY KEY (`fileTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filetype
-- ----------------------------
INSERT INTO `filetype` VALUES (0, '全部', NULL);
INSERT INTO `filetype` VALUES (1, '图片', NULL);
INSERT INTO `filetype` VALUES (2, '文档', NULL);
INSERT INTO `filetype` VALUES (3, '视频', NULL);
INSERT INTO `filetype` VALUES (4, '音乐', NULL);
INSERT INTO `filetype` VALUES (5, '其他', NULL);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `imageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileId` bigint(20) NULL DEFAULT NULL COMMENT '文件id',
  `imageHeight` int(5) NULL DEFAULT NULL COMMENT '图像的高',
  `imageWidth` int(5) NULL DEFAULT NULL COMMENT '图像的宽',
  PRIMARY KEY (`imageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music`  (
  `musicId` bigint(20) NOT NULL AUTO_INCREMENT,
  `album` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `albumArtist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `albumImage` mediumblob NULL,
  `artist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `composer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `encoder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fileId` bigint(20) NULL DEFAULT NULL COMMENT '文件id',
  `genre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lyrics` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '歌词',
  `originalArtist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `publicer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `track` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trackLength` float NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`musicId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `noticeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'html内容',
  `createTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `createUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建用户id',
  `isLongValidData` int(1) NULL DEFAULT NULL COMMENT '是否长期有效(0-否,1-是)',
  `markdownContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'markdown原文',
  `modifyTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `platform` int(2) NULL DEFAULT NULL COMMENT '平台(1-社区,2-管理端,3-网盘,4-股票)',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `validDateTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`noticeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for operationlog
-- ----------------------------
DROP TABLE IF EXISTS `operationlog`;
CREATE TABLE `operationlog`  (
  `operationLogId` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作详情',
  `logLevel` int(11) NULL DEFAULT NULL,
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作',
  `operationObj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `platform` int(2) NULL DEFAULT NULL COMMENT '平台(1-社区,2-管理端,3-网盘,4-股票)',
  `requestMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `requestURI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作结果',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `terminal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端ip地址',
  `time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`operationLogId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operationlog
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `createUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建用户id',
  `modifyTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `orderNum` int(2) NULL DEFAULT NULL COMMENT '次序',
  `parentId` bigint(20) NULL DEFAULT NULL COMMENT '父编号',
  `permissionCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识码',
  `permissionName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `resourceType` int(2) NULL DEFAULT NULL COMMENT '资源类型',
  PRIMARY KEY (`permissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for picturefile
-- ----------------------------
DROP TABLE IF EXISTS `picturefile`;
CREATE TABLE `picturefile`  (
  `pictureFileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `createUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建用户id',
  `extendName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展名',
  `fileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `fileSize` bigint(10) NULL DEFAULT NULL COMMENT '文件大小',
  `fileUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `modifyTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `storageType` int(1) NULL DEFAULT NULL COMMENT '存储类型',
  `userId` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`pictureFileId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picturefile
-- ----------------------------

-- ----------------------------
-- Table structure for recoveryfile
-- ----------------------------
DROP TABLE IF EXISTS `recoveryfile`;
CREATE TABLE `recoveryfile`  (
  `recoveryFileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleteBatchNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除批次号',
  `deleteTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `userFileId` bigint(20) NULL DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`recoveryFileId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recoveryfile
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` int(2) NULL DEFAULT NULL COMMENT '是否可用(0-不可用,1-可用)',
  `createTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `createUserId` bigint(20) NULL DEFAULT NULL COMMENT '创建用户id',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `modifyTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `roleName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 1, NULL, NULL, '超级管理员', '2021-11-10 20:46:06', NULL, '超级管理员');
INSERT INTO `role` VALUES (2, 1, NULL, NULL, '普通用户', NULL, NULL, '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permissionId` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  `roleId` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `shareId` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失效时间',
  `extractionCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提取码',
  `shareBatchNum` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享批次号',
  `shareStatus` int(2) NULL DEFAULT NULL COMMENT '分享状态(0正常,1已失效,2已撤销)',
  `shareTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享时间',
  `shareType` int(2) NULL DEFAULT NULL COMMENT '分享类型(0公共,1私密,2好友)',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`shareId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for sharefile
-- ----------------------------
DROP TABLE IF EXISTS `sharefile`;
CREATE TABLE `sharefile`  (
  `shareFileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `shareBatchNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享批次号',
  `shareFilePath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享文件路径',
  `userFileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户文件id',
  PRIMARY KEY (`shareFileId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sharefile
-- ----------------------------

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `storageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `modifyTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `storageSize` bigint(20) NULL DEFAULT NULL COMMENT '占用存储大小',
  `totalStorageSize` bigint(20) NULL DEFAULT NULL COMMENT '总存储大小',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`storageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storage
-- ----------------------------

-- ----------------------------
-- Table structure for sysparam
-- ----------------------------
DROP TABLE IF EXISTS `sysparam`;
CREATE TABLE `sysparam`  (
  `sysParamId` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sysParamDesc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sysParamKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sysParamValue` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sysParamId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysparam
-- ----------------------------
INSERT INTO `sysparam` VALUES (1, NULL, '总存储大小（单位M）', 'totalStorageSize', '1024');
INSERT INTO `sysparam` VALUES (2, NULL, '系统初始化数据标识', 'initDataFlag', '1');
INSERT INTO `sysparam` VALUES (3, NULL, '当前脚本的版本号', 'version', '1.1.2');

-- ----------------------------
-- Table structure for uploadtask
-- ----------------------------
DROP TABLE IF EXISTS `uploadtask`;
CREATE TABLE `uploadtask`  (
  `uploadTaskId` bigint(20) NOT NULL AUTO_INCREMENT,
  `extendName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展名',
  `fileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `filePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `identifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5唯一标识',
  `uploadStatus` int(1) NULL DEFAULT NULL COMMENT '上传状态(1-成功,0-失败或未完成)',
  `uploadTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `userId` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`uploadTaskId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uploadtask
-- ----------------------------

-- ----------------------------
-- Table structure for uploadtaskdetail
-- ----------------------------
DROP TABLE IF EXISTS `uploadtaskdetail`;
CREATE TABLE `uploadtaskdetail`  (
  `uploadTaskDetailId` bigint(20) NOT NULL AUTO_INCREMENT,
  `chunkNumber` int(5) NULL DEFAULT NULL COMMENT '当前分片数',
  `chunkSize` bigint(10) NULL DEFAULT NULL COMMENT '当前分片大小',
  `filePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `identifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件md5唯一标识',
  `relativePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件相对路径',
  `totalChunks` int(5) NULL DEFAULT NULL COMMENT '文件总分片数',
  `totalSize` bigint(10) NULL DEFAULT NULL COMMENT '文件总大小',
  PRIMARY KEY (`uploadTaskDetailId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uploadtaskdetail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `addrArea` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `addrCity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `addrProvince` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `available` int(2) NULL DEFAULT NULL COMMENT '是否可用(0-不可用,1-可用)',
  `birthday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `imageUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `industry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行业',
  `intro` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `lastLoginTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录时间',
  `modifyTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modifyUserId` bigint(20) NULL DEFAULT NULL COMMENT '修改用户id',
  `password` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `registerTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `sex` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `telephone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `wxOpenId` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open id',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'df655ad8d3229f3269fad2a8bab59b6c', NULL, NULL, 'admin', NULL, 'admin', 'admin', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userRoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) NULL DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userRoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for userfile
-- ----------------------------
DROP TABLE IF EXISTS `userfile`;
CREATE TABLE `userfile`  (
  `userFileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleteBatchNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除批次号',
  `deleteFlag` int(11) NULL DEFAULT NULL COMMENT '删除标识(0-未删除，1-已删除)',
  `deleteTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `extendName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展名',
  `fileId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件id',
  `fileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `filePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `isDir` int(1) NULL DEFAULT NULL COMMENT '是否是目录(0-否,1-是)',
  `uploadTime` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `userId` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`userFileId`) USING BTREE,
  UNIQUE INDEX `fileindex`(`userId`, `filePath`, `fileName`, `extendName`, `deleteFlag`, `isDir`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userfile
-- ----------------------------

-- ----------------------------
-- Table structure for userlogininfo
-- ----------------------------
DROP TABLE IF EXISTS `userlogininfo`;
CREATE TABLE `userlogininfo`  (
  `userLoginId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `userloginDate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录日期',
  PRIMARY KEY (`userLoginId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlogininfo
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
