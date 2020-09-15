/*
Navicat MySQL Data Transfer

Source Server         : PHP
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : crm_chat

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2019-03-28 23:50:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `to` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_turkish_ci NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- ----------------------------
-- Records of chat
-- ----------------------------
