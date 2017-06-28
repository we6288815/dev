/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : onlineshop

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2017-06-18 16:14:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bank_card`;
CREATE TABLE `bank_card` (
  `bank_card_id` bigint(20) NOT NULL COMMENT '银行卡ID',
  `user_id` bigint(32) NOT NULL COMMENT '用户ID',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名字',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_card_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bank_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `shop_id` bigint(20) NOT NULL COMMENT '商店ID',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名',
  `goods_type` int(11) NOT NULL COMMENT '商品种类',
  `price` double(10,2) NOT NULL COMMENT '价格',
  `discount` double(10,2) NOT NULL COMMENT '折扣',
  `image` mediumblob COMMENT '图片',
  `rank` double DEFAULT NULL,
  `statement` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goods_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `statement` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `order_ibfk_2` (`goods_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `shop_type` int(11) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `portrait` mediumblob,
  `location` varchar(255) NOT NULL,
  `rank` double DEFAULT NULL,
  `statement` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `goods_id` varchar(32) DEFAULT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `shopping_cart_ibfk_2` (`goods_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL,
  `portrait` mediumblob,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `statement` int(11) NOT NULL DEFAULT '1',
  `reg_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `collection_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `shop_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collection_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `from_user_id` bigint(20) NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statement` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET FOREIGN_KEY_CHECKS=1;
