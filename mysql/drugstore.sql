/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL_Spring
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : drugstore

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 27/06/2020 20:08:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartid` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `did` int(11) NOT NULL COMMENT '药品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cartAmount` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`cartid`) USING BTREE,
  INDEX `did`(`did`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`did`) REFERENCES `drugs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (7, 43, 4, 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `Id` int(8) NOT NULL AUTO_INCREMENT COMMENT '种类id',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '种类名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '中西药品');
INSERT INTO `categories` VALUES (2, '养生保健');
INSERT INTO `categories` VALUES (3, '医疗器械');
INSERT INTO `categories` VALUES (4, '计生用品');
INSERT INTO `categories` VALUES (5, '中药饮片');
INSERT INTO `categories` VALUES (6, '中药饮片');
INSERT INTO `categories` VALUES (7, '美容护肤');

-- ----------------------------
-- Table structure for drugs
-- ----------------------------
DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DrugName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通用名',
  `ShopName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `Approval` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批准编号',
  `PublisherId` int(10) NULL DEFAULT NULL COMMENT '生产厂商id',
  `PublishDate` datetime(0) NULL DEFAULT NULL COMMENT '上架时间',
  `CategoryId` int(255) NULL DEFAULT NULL COMMENT '种类id',
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品规格',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '剂型',
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `price` float(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `amount` int(255) NOT NULL COMMENT '数量',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CategoryId`(`CategoryId`) USING BTREE,
  INDEX `PublisherId`(`PublisherId`) USING BTREE,
  CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drugs_ibfk_2` FOREIGN KEY (`PublisherId`) REFERENCES `publishers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drugs
-- ----------------------------
INSERT INTO `drugs` VALUES (1, '通便胶囊', NULL, 'Z19990071', 1, '2020-06-19 22:42:36', 1, '0.35gx9粒x2板/盒', '胶囊剂', 'drug1', 44.00, 23);
INSERT INTO `drugs` VALUES (2, '奥利司他胶囊', '雅塑', 'H20123131', 1, '2020-06-19 22:42:36', 1, '0.12gx18粒/盒', '胶囊剂', 'drug2', 78.00, 400);
INSERT INTO `drugs` VALUES (3, '维生素C泡腾片', '力度伸', 'H20056946', 2, '2020-06-19 22:42:36', 2, '1gx15片x2支/盒', '片剂(橙味)', 'drug3', 60.20, 50);
INSERT INTO `drugs` VALUES (4, '蛋白粉', '汤臣倍健', 'G20140134', 1, '2020-06-19 22:42:36', 2, '450g/罐', '粉剂', 'drug4', 135.00, 42);
INSERT INTO `drugs` VALUES (5, '肾宝片', '汇仁', 'Z20080627', 2, '2020-06-19 22:42:36', 4, '0.7gx9片x14板/盒', '薄膜衣片剂', 'drug5', 187.00, 30);
INSERT INTO `drugs` VALUES (6, '风热感冒颗粒', '云丰', 'Z53020406', 3, '2020-06-19 22:42:36', 1, '10gx6袋/盒', '颗粒剂', 'drug6', 8.81, 60);
INSERT INTO `drugs` VALUES (7, '复方北豆根氨酚那敏片', NULL, 'H22024171', 4, '2020-06-19 22:42:36', 1, '12片/盒', '薄膜衣片剂', 'drug7', 3.20, 88);
INSERT INTO `drugs` VALUES (8, '龙胆碳酸氢钠片', '金药师', 'H51021677', 3, '2020-06-19 22:42:36', 1, '30片/盒', '片剂', 'drug8', 3.17, 19);
INSERT INTO `drugs` VALUES (9, '万通筋骨贴', '万通', '20150009号', 3, '2020-06-19 22:42:36', 2, '7cmx10cmx10贴/盒', '贴剂', 'drug9', 12.50, 846);
INSERT INTO `drugs` VALUES (10, '天然胶乳橡胶避孕套', '杜蕾斯', '20162660063', 6, '2020-06-19 22:42:36', 4, '10只/盒', '大胆爱吧(香草香型)', 'drug10', 17.48, 845);
INSERT INTO `drugs` VALUES (11, '三七粉', NULL, '6909819150019', 5, '2020-06-19 22:42:36', 6, '2gx10包/盒', '粉剂', 'drug11', 15.80, 4548);
INSERT INTO `drugs` VALUES (12, '西洋参片', '康美', '6918564890668', 1, '2020-06-19 22:42:36', 6, '60g/瓶', '颗粒剂', 'drug12', 138.00, 848);
INSERT INTO `drugs` VALUES (13, '红参', '康庆餘堂', '6939389409750', 2, '2020-06-19 22:42:36', 6, '120g/罐', '颗粒剂', 'drug13', 83.50, 242);
INSERT INTO `drugs` VALUES (14, '除疤膏', '密丽', 'B20020108', 1, '2020-06-19 22:42:36', 7, '25g/支', '软膏剂', 'drug14', 51.80, 168);
INSERT INTO `drugs` VALUES (15, '红花皲裂膏', '虎鏢', '6940198519295', 2, '2020-06-19 22:42:36', 7, '30g/瓶', '软膏剂', 'drug15', 16.80, 168);
INSERT INTO `drugs` VALUES (16, '芦荟清痘膏', '冰王', '6922039206489', 3, '2020-06-19 22:42:36', 7, '20g/支', '膏剂', 'drug16', 39.00, 879);
INSERT INTO `drugs` VALUES (17, '创可贴', '海氏海诺', '20140025', 2, '2020-06-19 22:42:36', 7, '7cmx2.2cmx6片x20袋/盒', '贴剂(防水型)', 'drug17', 13.87, 156);
INSERT INTO `drugs` VALUES (18, '桂龙药膏', '葛洪', 'Z45022017', 1, '2020-06-19 22:42:36', 6, '202g/瓶', '煎膏剂', 'drug18', 218.00, 121);
INSERT INTO `drugs` VALUES (19, '棉签', '欧洁', '20140196', 1, '2020-06-19 22:42:36', 4, '7.5cmx100支/盒', '双头型', 'drug19', 5.00, 494);
INSERT INTO `drugs` VALUES (20, '健胃消食片', '江中', 'Z20013220', 2, '2020-06-19 22:42:36', 2, '0.8gx8片x4板/盒', '薄膜衣片剂(白盒)', 'drug20', 6.49, 248);
INSERT INTO `drugs` VALUES (21, '电子体温计', '欧姆龙', '20172200078', 1, '2020-06-19 22:42:36', 3, '1支/盒', 'MC-246型', 'drug21', 40.50, 13);
INSERT INTO `drugs` VALUES (22, '血糖仪', '三诺', '20172400323', 2, '2020-06-19 22:42:36', 3, '1台/盒', '安稳型(免调码)', 'drug22', 18.90, 36);
INSERT INTO `drugs` VALUES (23, '退热贴', '安瑞克', '20140008', 2, '2020-06-19 22:42:36', 4, '5cmx12cmx1贴x3袋/盒', '感冒退热型', 'drug23', 15.00, 200);
INSERT INTO `drugs` VALUES (24, '益安宁丸', '同溢堂', 'Z20063087', 1, '2020-06-19 22:42:36', 6, '112丸x3瓶/盒', '水蜜丸型', 'drug24', 614.99, 253);
INSERT INTO `drugs` VALUES (25, '复方阿胶浆', NULL, 'Z20083345', 1, '2020-06-19 22:42:36', 2, '20mlx48支/盒', '合剂(无糖型)', 'drug25', 235.00, 5959);
INSERT INTO `drugs` VALUES (26, '景天祛斑片', '吉春黄金', 'Z20090791', 2, '2020-06-19 22:42:36', 7, '0.5gx12片x2板/盒', '薄膜衣片剂', 'drug26', 17.40, 6);
INSERT INTO `drugs` VALUES (27, '灵芝粉', '国鹤', '6970057015255', 4, '2020-06-19 22:42:36', 6, '2gx30袋/罐', '粉剂', 'drug27', 68.00, 5646);
INSERT INTO `drugs` VALUES (28, '左炔诺孕酮片', '金毓婷', 'H11021372', 4, '2020-06-19 22:42:36', 4, '1.5mgx1片/盒', '片剂', 'drug28', 11.00, 44);
INSERT INTO `drugs` VALUES (29, '鸿茅药酒', '鸿茅', 'Z15020795', 1, '2020-06-19 22:42:36', 2, '500ml/瓶', '酒剂', 'drug29', 146.00, 14);
INSERT INTO `drugs` VALUES (30, '扑感片', '万年青', 'Z44021194', 1, '2020-06-19 22:42:36', 2, '24片/盒', '糖衣片剂', 'drug30', 6.00, 866);
INSERT INTO `drugs` VALUES (31, '泰国青草膏', NULL, '6927081800201', 4, '2020-06-19 22:42:36', 6, '50gx3瓶/盒', '膏剂', 'drug31', 83.50, 45);
INSERT INTO `drugs` VALUES (32, '氨基葡萄糖硫酸软骨素钙胶囊', '百合康', 'G20120473', 1, '2020-06-19 22:42:36', 2, '0.5gx100粒/瓶', '胶囊剂', 'drug32', 65.00, 459);
INSERT INTO `drugs` VALUES (33, '血压计-听诊器保健盒', '鱼跃', '20152200947', 4, '2020-06-19 22:42:36', 3, '1套/盒', 'A型(简装)', 'drug33', 97.70, 469);
INSERT INTO `drugs` VALUES (34, '血糖试纸(葡萄糖脱氢酶法)', '卓越金采', '20162402313', 1, '2020-06-19 22:42:36', 3, '50片/盒', '片剂', 'drug34', 135.00, 236);
INSERT INTO `drugs` VALUES (35, '壬苯醇醚栓', '妻之友', 'H20057496', 4, '2020-06-19 22:42:36', 1, '0.1gx5枚x2板/盒', '栓剂', 'drug35', 21.50, 846);
INSERT INTO `drugs` VALUES (36, '西红花', NULL, '6909819170093', 4, '2020-06-19 22:42:36', 6, '1g/瓶', '颗粒剂', 'drug36', 45.00, 496);
INSERT INTO `drugs` VALUES (37, '修护凝胶', '喜辽复', 'J20098880', 2, '2020-06-19 22:42:36', 7, '20g/支', '凝胶剂', 'drug37', 138.00, 165);
INSERT INTO `drugs` VALUES (38, '薏辛除湿止痛胶囊', '曹清华', 'B20020225', 3, '2020-06-19 22:42:36', 4, '0.3gx12粒x18板/盒', '胶囊剂', 'drug38', 383.00, 169);
INSERT INTO `drugs` VALUES (39, '维生素D滴剂', '星鲨', 'H35021450', 1, '2020-06-19 22:42:36', 2, '400Ux12粒x2板/盒', '口服溶液剂', 'drug39', 19.50, 128);
INSERT INTO `drugs` VALUES (40, '舒筋健腰丸', '陈李济', 'Z44021058', 1, '2020-06-19 22:42:36', 2, '45gx10瓶/盒', '水蜜丸剂', 'drug40', 685.00, 289);
INSERT INTO `drugs` VALUES (43, '复方阿胶浆', NULL, 'Z20083345', 8, '2020-06-19 23:15:14', 1, '20mlx48支/盒', '合剂(无糖型)', 'drug43', 235.00, 14);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `UserId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `Points` float NULL DEFAULT NULL COMMENT '积分',
  `LevelsId` int(18) NULL DEFAULT NULL COMMENT '会员等级id',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  INDEX `LevelsId`(`LevelsId`) USING BTREE,
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`LevelsId`) REFERENCES `viplevel` (`Lid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, 3015.94, 3);
INSERT INTO `member` VALUES (7, 17, 0, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `amount` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `type` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `shopdate` datetime(0) NULL DEFAULT NULL COMMENT '购买日期',
  `did` int(11) NULL DEFAULT NULL COMMENT '药品id',
  `cid` int(11) NULL DEFAULT NULL COMMENT '购物车旧id',
  PRIMARY KEY (`orderid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `order_ibfk_1`(`did`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`did`) REFERENCES `drugs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (10, 1, 1, 1, '2020-06-22 19:15:51', 18, 25);
INSERT INTO `order` VALUES (11, 1, 1, 1, '2020-06-23 15:17:23', 4, 26);
INSERT INTO `order` VALUES (12, 1, 1, 1, '2020-06-23 15:28:56', 19, 27);
INSERT INTO `order` VALUES (13, 1, 1, 1, '2020-06-23 15:32:30', 29, 28);
INSERT INTO `order` VALUES (14, 1, 1, 1, '2020-06-23 15:50:42', 4, 29);
INSERT INTO `order` VALUES (15, 1, 5, 1, '2020-06-23 16:05:18', 5, 33);
INSERT INTO `order` VALUES (16, 1, 1, 1, '2020-06-23 16:05:18', 29, 32);
INSERT INTO `order` VALUES (17, 1, 1, 1, '2020-06-23 16:05:18', 13, 31);
INSERT INTO `order` VALUES (18, 1, 1, 1, '2020-06-23 16:05:18', 4, 30);
INSERT INTO `order` VALUES (19, 1, 1, 1, '2020-06-23 16:17:05', 10, 34);
INSERT INTO `order` VALUES (20, 1, 1, 0, '2020-06-23 16:28:38', 24, 36);
INSERT INTO `order` VALUES (21, 1, 4, 1, '2020-06-23 16:28:38', 28, 35);
INSERT INTO `order` VALUES (23, 1, 0, 0, '2020-06-24 11:31:19', 3, 0);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `payid` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付id',
  `price` float NULL DEFAULT NULL COMMENT '总价格',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'orderid的集合',
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (13, 12, '2020-06-23 16:13:48', '123123');
INSERT INTO `pay` VALUES (14, 17.48, '2020-06-23 16:17:42', '19');
INSERT INTO `pay` VALUES (15, 17.48, '2020-06-23 16:18:46', '19');
INSERT INTO `pay` VALUES (16, 17.48, '2020-06-23 16:19:30', '19');
INSERT INTO `pay` VALUES (17, 44, '2020-06-23 16:34:47', '21');

-- ----------------------------
-- Table structure for publishers
-- ----------------------------
DROP TABLE IF EXISTS `publishers`;
CREATE TABLE `publishers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公司id',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publishers
-- ----------------------------
INSERT INTO `publishers` VALUES (1, 'JX商城测试有限公司');
INSERT INTO `publishers` VALUES (2, '四川济生堂药业有限公司');
INSERT INTO `publishers` VALUES (3, '江西川奇药业有限公司');
INSERT INTO `publishers` VALUES (4, '广州市龙力贸易发展有限公司');
INSERT INTO `publishers` VALUES (5, 'LifeScan Europe');
INSERT INTO `publishers` VALUES (6, '南京白敬宇制药有限责任公司');
INSERT INTO `publishers` VALUES (7, '青岛伦敦杜蕾斯有限公司');
INSERT INTO `publishers` VALUES (8, '东阿阿胶股份有限公司');

-- ----------------------------
-- Table structure for userroles
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userroles
-- ----------------------------
INSERT INTO `userroles` VALUES (1, '普通用户');
INSERT INTO `userroles` VALUES (2, 'VIP 用户');
INSERT INTO `userroles` VALUES (3, '管理员');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Id` int(255) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `NickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `Telphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `UserRoleId` int(11) NULL DEFAULT NULL COMMENT '权限',
  `UserStateId` int(11) NULL DEFAULT NULL COMMENT '是否有效',
  `Addtime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `Id`(`Id`, `UserRoleId`) USING BTREE,
  INDEX `UserRoled`(`UserRoleId`) USING BTREE,
  INDEX `UserStateId`(`UserStateId`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`UserRoleId`) REFERENCES `userroles` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`UserStateId`) REFERENCES `userstates` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'gou', 'e10adc3949ba59abbe56e057f20f883e', 'jiexi_root', '上海市', '13408696398', 2, 1, '2020-06-27 15:35:05');
INSERT INTO `users` VALUES (4, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'yingbi', '四川', '13458877613', 3, 1, '2020-06-27 15:35:08');
INSERT INTO `users` VALUES (7, 'pop', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:13');
INSERT INTO `users` VALUES (8, 'aa', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 3, 1, '2020-06-27 15:35:15');
INSERT INTO `users` VALUES (9, 'pp', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:19');
INSERT INTO `users` VALUES (10, 'op', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:22');
INSERT INTO `users` VALUES (11, 'wo', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:25');
INSERT INTO `users` VALUES (12, 'yu', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:27');
INSERT INTO `users` VALUES (13, 'ppp', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 1, 1, '2020-06-27 15:35:30');
INSERT INTO `users` VALUES (14, 'goua', 'e10adc3949ba59abbe56e057f20f883e', '', '', '13408696398', 1, 1, '2020-06-27 15:35:32');
INSERT INTO `users` VALUES (15, 'jiexi', 'e10adc3949ba59abbe56e057f20f883e', '', '', '13408696398', 1, 1, '2020-06-27 15:35:35');
INSERT INTO `users` VALUES (16, 'yinggou', 'e10adc3949ba59abbe56e057f20f883e', '阴狗是我的儿子', '四川省成都市温江区', '13458877613', 1, 1, '2020-06-27 15:35:37');
INSERT INTO `users` VALUES (17, 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', '13408696398', 2, 1, '2020-06-27 15:35:41');

-- ----------------------------
-- Table structure for userstates
-- ----------------------------
DROP TABLE IF EXISTS `userstates`;
CREATE TABLE `userstates`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userstates
-- ----------------------------
INSERT INTO `userstates` VALUES (1, '正常');
INSERT INTO `userstates` VALUES (2, '无效');

-- ----------------------------
-- Table structure for viplevel
-- ----------------------------
DROP TABLE IF EXISTS `viplevel`;
CREATE TABLE `viplevel`  (
  `Lid` int(18) NOT NULL,
  `LevelName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Lid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of viplevel
-- ----------------------------
INSERT INTO `viplevel` VALUES (1, '黄铜会员');
INSERT INTO `viplevel` VALUES (2, '白银会员');
INSERT INTO `viplevel` VALUES (3, '黄金会员');
INSERT INTO `viplevel` VALUES (4, '钻石会员');
INSERT INTO `viplevel` VALUES (5, '终生会员');

-- ----------------------------
-- Procedure structure for sp_addorder
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addorder`;
delimiter ;;
CREATE PROCEDURE `sp_addorder`(in uid2 int,in amount2 int,in did2 int,in cid2 int)
begin
	if cid2 != 0 then
		delete from cart where cart.cartid=cid2;
	end if;
	insert into `order`(uid,amount,shopdate,type,did,cid) VALUES (uid2,amount2,now(),0,did2,cid2);
	update drugs set amount=amount-amount2 where id=did2;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_addPayInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addPayInfo`;
delimiter ;;
CREATE PROCEDURE `sp_addPayInfo`(in ids2 int,in price2 float)
BEGIN
	insert into pay(price,date,ids) values (price2,now(),ids2);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_addpoint
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addpoint`;
delimiter ;;
CREATE PROCEDURE `sp_addpoint`(in id2 int,in price float)
begin
	declare point int;
	declare level_s int;
	UPDATE member set Points=Points+price where id = id2;
	select points into point from member;
	set level_s = 1;
	if point > 1000 then set level_s = 2; end if; 
	if point > 2000 then set level_s = 3; end if; 
	if point > 5000 then set level_s = 4; end if; 
	if point > 10000 then set level_s = 5; end if;
	UPDATE member set levelsId = level_s where id = id2;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_login`;
delimiter ;;
CREATE PROCEDURE `sp_login`(in username2 varchar(20),in password2 varchar(255),out flag int,out userid int,out userN varchar(25))
begin
	declare a varchar(20);
	declare b varchar(20);
	declare c varchar(20);
	set flag=1;
	
	select UserStateId into c from users where username=username2 or telphone=username2;
	if (c = 2) then 
		set flag=2;
	end if;
	
	select username into a from users where username=username2 and password=password2;
	select Id into c from users where username=username2 and password=password2;
	select username into a from users where telphone=username2 and password=password2;
	select Id into c from users where telphone=username2 and password=password2;
	if ISNULL(a) && ISNULL(b)  then
		set flag = 0;
	end if;
	set userid = c;
	set userN = a;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_register
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_register`;
delimiter ;;
CREATE PROCEDURE `sp_register`(in loginId2 VARCHAR(50),in loginPwd2 VARCHAR(255),in nickName2 varchar(50),in address2 VARCHAR(200),in phone2 varchar(200),out flag int)
BEGIN
	declare name_null varchar(50);
	declare userRoledId2 int;
	declare UserStateId2 int;
	set flag=0,userRoledId2=1,UserStateId2=1;
	select  username into name_null from users where username=loginId2;
	if ISNULL(name_null) then
		insert into users(username,password,nickname,address,telphone,UserRoleId,UserStateId) values (loginId2,loginPwd2,nickName2,address2,phone2,userRoledId2,UserStateId2);
		set flag=1;
	end if;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
