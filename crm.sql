/*
 Navicat Premium Data Transfer

 Source Server         : 172.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 30/12/2020 20:13:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startDate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endDate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('580b18d8242a4fbdb5414b889377745d', '40f6cdea0bd34aceb77492a1656d9fb3', '皮卡丘修改测试', '2020-12-06', '2020-12-31', '20000', '皮卡皮卡哈哈哈', '2020-12-06 16:16:52', '张三', '2020-12-06 16:19:05', '张三');
INSERT INTO `tbl_activity` VALUES ('58e92be793c94b6c830ccf813e09f9d5', '06f5fc056eac41558a964f96daa7f27c', '百度推广', '2020-12-18', '2020-12-31', '20', '百度推广活动修改测试', '2020-12-18 16:29:53', '张三', '2020-12-18 16:30:07', '张三');
INSERT INTO `tbl_activity` VALUES ('6a178fa31b4c41f1a714744ce8c57f66', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单1234', '2020-12-26', '2020-12-31', '20', '便宜的发传单', '2020-12-26 10:40:26', '张三', '2020-12-28 14:11:35', '张三');
INSERT INTO `tbl_activity` VALUES ('94b9a5e7be1647af8e8e1a65d7b86176', '06f5fc056eac41558a964f96daa7f27c', '详情页测试', '2020-12-30', '2020-12-31', '成本test', '描述test修改test', '2020-12-05 21:08:14', '张三', '2020-12-05 21:36:36', '张三');
INSERT INTO `tbl_activity` VALUES ('b5b578c9f569487e9657799810dd7077', '40f6cdea0bd34aceb77492a1656d9fb3', '哔哩哔哩bilibili', '2020-12-09', '2020-12-16', 'sfd的负担', 's\'f\'d', '2020-12-09 09:36:04', '张三', NULL, NULL);
INSERT INTO `tbl_activity` VALUES ('bd7e4c27086346759be4359e69f87424', '06f5fc056eac41558a964f96daa7f27c', 'bilibili推广', '2020-12-05', '2020-12-30', 'qwq', '好累啊', '2020-12-05 16:10:38', '张三', '2020-12-05 21:06:15', '张三');

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('228bbbe97b924cc09ea3d2d88bd5d8e4', '修改测试\n修改测试第二行', '2020-12-06 14:44:46', '张三', NULL, NULL, '0', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('32ba2f76e63c4c99ace4c9e8a4004f22', '撒打算', '2020-12-06 14:50:12', '张三', NULL, NULL, '0', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('5161c80806444b2683480b27900d9117', '修改人测试！', '2020-12-06 15:18:12', '李四', '2020-12-06 15:29:56', '张三', '1', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('544081227bad4449a63456a9288bb0f8', '皮卡丘是我张三的！', '2020-12-06 15:21:02', '张三', '2020-12-06 15:30:25', '张三', '1', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('5acebb8c5542478e8b6597b7605ff509', '修改测试', '2020-12-06 14:25:41', '张三', '2020-12-06 15:16:48', '张三', '1', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('6a9428d0e9b542489fb3cbcb654d6fd9', 'sadasd', '2020-12-06 16:35:09', '张三', NULL, NULL, '0', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_activity_remark` VALUES ('6b2fa56b76a44e41a123fcf1a700b739', '嘿嘿！', '2020-12-06 14:25:43', '张三', '2020-12-06 15:27:23', '张三', '1', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('7c8ace810e944940a9165985e5a76a50', '阿斯顿', '2020-12-06 14:55:01', '张三', NULL, NULL, '0', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('932a98ed0e3f4d578e4218b4e783891f', '超长文本修改测试', '2020-12-06 15:17:17', '张三', NULL, NULL, '0', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('a0ac7df88fc048e6be6a42184f401fbd', '43', '2020-12-28 15:36:53', '张三', NULL, NULL, '0', '6a178fa31b4c41f1a714744ce8c57f66');
INSERT INTO `tbl_activity_remark` VALUES ('a611bda57d45454e93662678d6a0e2b4', '文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试文本长度测试', '2020-12-06 15:19:40', '张三', NULL, NULL, '0', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('c09070ac2be04e1da2cb95aca2254223', '泡泡糖公主觉得很赞！', '2020-12-06 15:20:13', '张三', '2020-12-06 15:29:17', '张三', '1', '94b9a5e7be1647af8e8e1a65d7b86176');
INSERT INTO `tbl_activity_remark` VALUES ('dbf2ce627b0a441a822510da7f19f3f4', '(。・∀・)ノ', '2020-12-08 13:32:53', '张三', NULL, NULL, '0', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_activity_remark` VALUES ('ffd6f742a0c74545b6357e9737e263e6', '找几个百大来给帮忙宣传宣传吧', '2020-12-06 14:12:35', '张三', NULL, NULL, '0', 'bd7e4c27086346759be4359e69f87424');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('c51037da5e1641938c5f09bbc7940a38', '刘强东', '先生', '40f6cdea0bd34aceb77492a1656d9fb3', 'jd', 'ceo', '123@123.com', '123123', 'jd.com', '123123123123', '虚假线索', '请选择', '张三', '2020-12-28 11:13:21', NULL, NULL, '虚假线索', '联系纪要', '2020-12-29', '北京');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clueId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('01514fe463704cc1ac2a606cb2114cdb', 'c51037da5e1641938c5f09bbc7940a38', 'on');
INSERT INTO `tbl_clue_activity_relation` VALUES ('1913b730dcea4d09a09edf78e7547c50', '1ae47f056b124b4983b2bad634dd5046', 'b5b578c9f569487e9657799810dd7077');
INSERT INTO `tbl_clue_activity_relation` VALUES ('2a8540ffadb04e639f503db6535fd099', '1ae47f056b124b4983b2bad634dd5046', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_clue_activity_relation` VALUES ('3fa4b839d9be4a2ca6a51eadb288593b', '1ae47f056b124b4983b2bad634dd5046', 'on');
INSERT INTO `tbl_clue_activity_relation` VALUES ('759efa3d87d54f9791fffc8361258129', 'c51037da5e1641938c5f09bbc7940a38', 'b5b578c9f569487e9657799810dd7077');
INSERT INTO `tbl_clue_activity_relation` VALUES ('857e4bb3153f4f09b3fd977ff829f97c', 'c51037da5e1641938c5f09bbc7940a38', 'on');
INSERT INTO `tbl_clue_activity_relation` VALUES ('ce5a1aaa2ac64bc98f316a7c09962bfa', '1ae47f056b124b4983b2bad634dd5046', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_clue_activity_relation` VALUES ('d6f54be894d14c609cd302c8d129e09b', '1ae47f056b124b4983b2bad634dd5046', 'on');
INSERT INTO `tbl_clue_activity_relation` VALUES ('db29ba761ca74be6bc132ee16431f461', 'c51037da5e1641938c5f09bbc7940a38', 'bd7e4c27086346759be4359e69f87424');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clueId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appellation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('20aa8efe5ee54036a51fe0ad8f6fa5e7', '06f5fc056eac41558a964f96daa7f27c', '合作伙伴研讨会', '42cf291144c547fba570c5b2634dd4a7', '马云', '先生', 'my@albb.com', '137328812883', 'CEO', NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-12 18:59:09', NULL, NULL, NULL, NULL, '2020-12-09', '北京市朝阳区阿里巴巴A楼B座');
INSERT INTO `tbl_contacts` VALUES ('9d3e61a37a71490080a028bfde4dc753', '06f5fc056eac41558a964f96daa7f27c', '合作伙伴研讨会', '42cf291144c547fba570c5b2634dd4a7', '马云', '先生', 'my@albb.com', '137328812883', 'CEO', NULL, '张三', '2020-12-28 11:23:58', NULL, NULL, NULL, NULL, '2020-12-09', '北京市朝阳区阿里巴巴A楼B座');
INSERT INTO `tbl_contacts` VALUES ('d6259f92fe83465f8fef2e5c7241942e', '06f5fc056eac41558a964f96daa7f27c', '内部研讨会', '6238b29f3d734a96892878acc2b224ac', '李彦宏', '先生', 'naidu.com', '1234645772', 'ceo', NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 14:15:58', NULL, NULL, NULL, NULL, '2020-12-31', '北京');
INSERT INTO `tbl_contacts` VALUES ('e72110a1bd444dc88f1a1356d130e314', '06f5fc056eac41558a964f96daa7f27c', '销售邮件', 'ef9a9ec8cfa141e08b66868c44144671', '姓名添加测试', '教授', '邮箱添加测试', '手机添加测试', '职位添加测试', NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-12 20:05:54', NULL, NULL, NULL, NULL, '下次联系时间添加测试', '详细地址添加测试');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('053177cf45904b1ca317bdd520794a05', '906977cf077a4620a11e44877192d46c', '2b78e5cf684b43bda7206478d7dfce20');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('08ab7abd09844480b12be1b610302cac', '4548d10b672c4e24af6009cbf7d0092e', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('0f8db7fc6df84c6aa2d6071ff3a921b0', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '45971b57459f4571837f72d6e7bd9ef3');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('19898d5f6e894639bfd9e4fc6b0731cc', '906977cf077a4620a11e44877192d46c', 'dd43fdbc63894cd3a140dc3e7c59877a');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('289704ee14224e1e91a15a39cd1369ea', '4548d10b672c4e24af6009cbf7d0092e', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('4262795d2ffc4a6f8e81e793858b40ee', '20aa8efe5ee54036a51fe0ad8f6fa5e7', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('684a5131a33b422499943e5bddab1f20', '906977cf077a4620a11e44877192d46c', 'd300e0a9872645cc934fa68862437ff2');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('73773c46ede045ed91b5eba71c3d0424', '20aa8efe5ee54036a51fe0ad8f6fa5e7', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('7b5ea1de88414cefbbedbf0f5a20a141', '906977cf077a4620a11e44877192d46c', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('912d1014bbb94bf683a8f98987b05967', '906977cf077a4620a11e44877192d46c', '8c83bab35b364083ac4267597c0ab137');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('935dcef6929744538e352a7f5b83bdb7', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '117a5e726b72426ea99923edff73e679');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('983ecab6ba3547daa1d8f936814eec34', '4548d10b672c4e24af6009cbf7d0092e', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('9d03e63a011447e8bc6d0fc596d4bcb9', '906977cf077a4620a11e44877192d46c', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('9eb4ce121046402fba12eb7aaa599bc5', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '8c83bab35b364083ac4267597c0ab137');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('a0c7ed7057c8437f9a3a096dd8ed71a4', '20aa8efe5ee54036a51fe0ad8f6fa5e7', 'd300e0a9872645cc934fa68862437ff2');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('a5d0b27df14047798800c9b5f14ded97', 'd6259f92fe83465f8fef2e5c7241942e', 'bd7e4c27086346759be4359e69f87424');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('a8f97e4226de45feb211edb061fc37d9', '906977cf077a4620a11e44877192d46c', '45971b57459f4571837f72d6e7bd9ef3');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('a9034b75fbe844f1a34d12594f526b71', '906977cf077a4620a11e44877192d46c', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('b17a157afd3f42df9f75d52e5625c66b', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('b34ea6e87bcd42a9a979596529f4bb31', '4548d10b672c4e24af6009cbf7d0092e', 'd300e0a9872645cc934fa68862437ff2');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('be2a12daff464b99948e903f8b9198c1', '4548d10b672c4e24af6009cbf7d0092e', '117a5e726b72426ea99923edff73e679');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('c183e8a41fc3464a98865565f8f30d4b', 'd6259f92fe83465f8fef2e5c7241942e', 'on');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('c424a5193d224591b21e571e1f29669c', '4548d10b672c4e24af6009cbf7d0092e', 'dd43fdbc63894cd3a140dc3e7c59877a');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('c52d4377eeac4f9aab082c605d5f5502', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '2b78e5cf684b43bda7206478d7dfce20');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('c770399127124ee5aded03c5d66116c1', '4548d10b672c4e24af6009cbf7d0092e', '8c83bab35b364083ac4267597c0ab137');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('cb96bc16d8db4809a364a6663cd1e94f', '4548d10b672c4e24af6009cbf7d0092e', '2b78e5cf684b43bda7206478d7dfce20');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('cd99c5b8c6bc449da5d7bece6e4a08a8', 'e72110a1bd444dc88f1a1356d130e314', '580b18d8242a4fbdb5414b889377745d');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('d4d8ce1e13234f34a82bde6c6644e8eb', '20aa8efe5ee54036a51fe0ad8f6fa5e7', 'dd43fdbc63894cd3a140dc3e7c59877a');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('e57e6936e84941bfa4003db71f45452c', '4548d10b672c4e24af6009cbf7d0092e', '45971b57459f4571837f72d6e7bd9ef3');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('f43958f8f8cb49c2a65080315cc73f23', '906977cf077a4620a11e44877192d46c', '117a5e726b72426ea99923edff73e679');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('00d432f1bb264727bb6b882510b333f8', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('03db40ff480447fe920156fb6ad554b2', '备注4', NULL, NULL, NULL, NULL, NULL, 'ef9a9ec8cfa141e08b66868c44144671');
INSERT INTO `tbl_contacts_remark` VALUES ('05b935ea73714167874bd22df8a1f0b2', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('0b61abfdcd914e51b64a5d481c518223', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('272061149556427ba30e3d9a47b7a2e7', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('2840144036484772aac2133f6874d8fc', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('3072dc9a81fd4ce5b1452fc5a95d6160', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('30b904a12c1e4cb1a9527f75ba3b9338', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('42093d73d4ee48f5a924790ab6e4dbb0', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('bd7c42c4595b4d819250f19f1385a63c', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('c9de4e670d324069b60dc178f6d95878', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('de02475d686b466baa1b845f8dcdfcf9', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_contacts_remark` VALUES ('de77a137587a4bbaa2a27ccebfefec3e', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('2aa425f1ae294bfd967086ba2ec6a9de', '40f6cdea0bd34aceb77492a1656d9fb3', '阿', NULL, NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-18 16:49:48', NULL, NULL, '', '', '', NULL);
INSERT INTO `tbl_customer` VALUES ('42cf291144c547fba570c5b2634dd4a7', '06f5fc056eac41558a964f96daa7f27c', '阿里巴巴', 'albb.com', '83729394', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-12 18:59:09', NULL, NULL, NULL, '2020-12-09', NULL, '北京市朝阳区阿里巴巴A楼B座');
INSERT INTO `tbl_customer` VALUES ('6238b29f3d734a96892878acc2b224ac', '06f5fc056eac41558a964f96daa7f27c', '百度', 'baidu.com', '800836123', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 14:15:58', NULL, NULL, NULL, '2020-12-31', NULL, '北京');
INSERT INTO `tbl_customer` VALUES ('7dbd0812766e491393a0d0392aff38f5', '40f6cdea0bd34aceb77492a1656d9fb3', '百度集团', NULL, NULL, '40f6cdea0bd34aceb77492a1656d9fb3', NULL, NULL, NULL, '666', '2020-12-24', '333', NULL);
INSERT INTO `tbl_customer` VALUES ('b2561763a504442c882c6f4180b001b5', '40f6cdea0bd34aceb77492a1656d9fb3', '', NULL, NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 11:33:02', NULL, NULL, '', '', '', NULL);
INSERT INTO `tbl_customer` VALUES ('de90440ad6d6455180b478b86aab04fd', '06f5fc056eac41558a964f96daa7f27c', '白', NULL, NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-20 13:25:11', NULL, NULL, '', '', '', NULL);
INSERT INTO `tbl_customer` VALUES ('ef9a9ec8cfa141e08b66868c44144671', '06f5fc056eac41558a964f96daa7f27c', '阿里巴巴123', '公司网站添加测试', '公司座机添加测试', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-12 20:05:54', NULL, NULL, NULL, '下次联系时间添加测试', NULL, '详细地址添加测试');

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('198d4e35b63d43ceb369b3924f95a887', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('42c15912b139462db59038debc27a1f6', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('48e39cda67164b4cb11589f5bf09b502', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('51f7d49e797f4a91a5a2e60d6def0e3d', '备注4', NULL, NULL, NULL, NULL, NULL, 'ef9a9ec8cfa141e08b66868c44144671');
INSERT INTO `tbl_customer_remark` VALUES ('58a03b35f12d4b2a86a6a6f7cf51d42b', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('5ab5378cc3cb4a46b430b5db557d9fed', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('650cd5db070b4337a7a5d7b47c89cd58', '备注2', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('73dfee0fcceb4079bf0cf9303bb3c695', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('77ed426ab48c49d1b9ea75b23c57a82c', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('8176d9c8230e49db844699ef9b1b9644', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('8c4da19620a24ce79dbf32b65482e19f', '备注3', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('901059478bd5400799a8c4d6c151a8f4', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');
INSERT INTO `tbl_customer_remark` VALUES ('d24d163de65643df81d0f29329842ac8', '备注1', NULL, NULL, NULL, NULL, NULL, '42cf291144c547fba570c5b2634dd4a7');

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type`  (
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以为空',
  `orderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `typeCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07成交', '07成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01资质审查', '01资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08丢失的线索', '08丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09因竞争丢失关闭', '09因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02需求分析', '02需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05提案/报价', '05提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03价值建议', '03价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04确定决策者', '04确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06谈判/复审', '06谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customerId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activityId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactsId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactSummary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nextContactTime` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('4a09f07dc2cb4f7384eb6cb256f9a074', '40f6cdea0bd34aceb77492a1656d9fb3', '20000', '和京东的首次合作', '2020-12-31', '2745e6284d3146258fa564ecdee973ca', '06谈判/复审', NULL, '请选择', '580b18d8242a4fbdb5414b889377745d', '1081dfbb6498412bb97c84fa0c88d9e3', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-26 15:19:12', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 15:37:22', NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('5f33014eb1a541c6b511823e08f38f65', '06f5fc056eac41558a964f96daa7f27c', '2000000000', '购买xxxx50000个', '2020-12-30', '42cf291144c547fba570c5b2634dd4a7', '09因竞争丢失关闭', NULL, '合作伙伴研讨会', '', '9d3e61a37a71490080a028bfde4dc753', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 11:23:58', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 11:27:11', NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('6fb31d4a879942fc86832da408d566fa', '06f5fc056eac41558a964f96daa7f27c', '566666', '测试属于李四的交易', '2020-12-29', 'de90440ad6d6455180b478b86aab04fd', '08丢失的线索', '已有业务', '广告', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-20 13:25:11', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 10:35:11', '', '', '');
INSERT INTO `tbl_tran` VALUES ('76e53f01216146ccb571c5fe8b5d13d1', '06f5fc056eac41558a964f96daa7f27c', '23', '测试交易', '2020-12-30', '6238b29f3d734a96892878acc2b224ac', '05提案/报价', NULL, '内部研讨会', '', 'd6259f92fe83465f8fef2e5c7241942e', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 14:15:58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('8382cda2469c4a81b9c102226555ccb6', '40f6cdea0bd34aceb77492a1656d9fb3', '', '1', '', 'b2561763a504442c882c6f4180b001b5', '01资质审查', '已有业务', '广告', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 11:35:02', NULL, NULL, '', '', '');
INSERT INTO `tbl_tran` VALUES ('9addf791a6ad4de3b068db7d9b335ac3', '40f6cdea0bd34aceb77492a1656d9fb3', '30', '购买100年榕树1颗', '2020-12-19', '2aa425f1ae294bfd967086ba2ec6a9de', '07成交', '已有业务', '广告', '', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-18 16:49:48', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 10:14:51', '', '', '');
INSERT INTO `tbl_tran` VALUES ('9b65c44d0a554044a1f31e79795b7c2b', '40f6cdea0bd34aceb77492a1656d9fb3', '2000000000', '购买商船50艘', '2020-12-16', '80453bc5d0374161a28810c1eedd84ab', '05提案/报价', '已有业务', '广告', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', NULL, '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-23 12:26:23', NULL, NULL, NULL);
INSERT INTO `tbl_tran` VALUES ('bb561f10506b4b4ebddfd74c2ddf469d', '40f6cdea0bd34aceb77492a1656d9fb3', '10000000', '一千万大交易', '2020-12-15', '7dbd0812766e491393a0d0392aff38f5', '07成交', '新业务', '外部介绍', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-14 19:24:56', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 14:17:43', '333', '666', '2020-12-24');
INSERT INTO `tbl_tran` VALUES ('c38807bbe9804eabb524dbcef4955a60', '40f6cdea0bd34aceb77492a1656d9fb3', '50', '皮卡丘皮购买50张', '2020-12-24', 'e7524df76e654ea7bc380eee0882920b', '07成交', '已有业务', '广告', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-14 19:33:30', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-25 10:25:21', '好吃好吃', '漂亮漂亮', '2020-12-23');
INSERT INTO `tbl_tran` VALUES ('e1ec2dcde03d43b092489d3df1df8713', '40f6cdea0bd34aceb77492a1656d9fb3', '', '已成交记录', '', 'b2561763a504442c882c6f4180b001b5', '07成交', '已有业务', '广告', 'dd43fdbc63894cd3a140dc3e7c59877a', '20aa8efe5ee54036a51fe0ad8f6fa5e7', '40f6cdea0bd34aceb77492a1656d9fb3', '2020-12-28 11:33:02', NULL, NULL, '', '', '');

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expectedDate` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('00f6fa11e6b94fa69b03a10e26b69696', '05提案/报价', '', '', '2020-12-23 12:37:33', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('025ed49204784b1191c6b06cdae4bc15', '05提案/报价', '', '', '2020-12-26 12:55:48', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('03a835f7acc14c60a78413d7d5a778f4', '05提案/报价', '566666', '2020-12-29', '2020-12-23 12:28:56', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('057f2f28c3c74e66a274ef8c75279c23', '03价值建议', '', '', '2020-12-26 12:55:39', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('05a1fc98e535477aa3b59a4d0c13c452', '05提案/报价', '', '', '2020-12-23 13:09:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('05c41b6caae544b7b493382fc8fb61e2', '09因竞争丢失关闭', '', '', '2020-12-23 13:21:56', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0723e4c6609d43d98b147b1988ab6a38', '03价值建议', '', '', '2020-12-23 12:36:37', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('080dafe62dd64b4dafa87dde3ba2f1df', '03价值建议', '2000000000', '2020-12-16', '2020-12-23 12:25:42', '40f6cdea0bd34aceb77492a1656d9fb3', '9b65c44d0a554044a1f31e79795b7c2b');
INSERT INTO `tbl_tran_history` VALUES ('083148fe8d9e4a8487910dcf6b6fd190', '08丢失的线索', '566666', '2020-12-29', '2020-12-28 10:35:11', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('09139f2131904136b0b462745bcd4f63', '07成交', '', '', '2020-12-23 13:48:39', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0a20b6fa13734cdfae4c733f45a8f556', '05提案/报价', '30', '2020-12-19', '2020-12-18 16:49:48', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('0ba5986ee61e4713914eb65180a00bd3', '03价值建议', '', '', '2020-12-23 12:37:31', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0c6ecc92aeca4a9b86b8480aa198e6f6', '08丢失的线索', '', '', '2020-12-23 13:12:41', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0c71761f48a1415abf047bf9174f8a83', '06谈判/复审', '', '', '2020-12-26 12:55:44', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0c7d19be6ecb4900bcf5bd33afa9843e', '06谈判/复审', '', '', '2020-12-23 13:18:54', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0dad0c359f7e43edba8d993f88c97eaa', '09因竞争丢失关闭', '30', '2020-12-19', '2020-12-28 10:14:49', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('0e64fb220fdd424bb69302b36ae5e337', '03价值建议', '', '', '2020-12-23 12:39:27', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('0e689172aea142ad9331a0c78e0289da', '05提案/报价', '20000', '2020-12-31', '2020-12-28 15:37:21', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('105396b098c34667b81a574a41feb09e', '03价值建议', '', '', '2020-12-23 12:33:30', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('105df9fda2914233a0f31efaa981c35c', '04确定决策者', '', '', '2020-12-23 12:33:53', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1071febb1268462eaac8ae1efd625b78', '02需求分析', '566666', '2020-12-29', '2020-12-23 12:29:30', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('1178e5aa40dc42b7b29f16a1dba2544c', '06谈判/复审', '30', '2020-12-19', '2020-12-28 10:07:49', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('12462802e1a04711aebae249666290b0', '08丢失的线索', '', '', '2020-12-23 13:21:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('12769f42b7854e9ba43a902d069543f0', '08丢失的线索', '30', '2020-12-19', '2020-12-28 10:08:15', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('12866f6c7b8a467188a96e2b7dd42af3', '06谈判/复审', '2000000000', '2020-12-30', '2020-12-28 11:23:58', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('13772a2f41bb4a6eb67bd8a7c06ed0df', '05提案/报价', '', '', '2020-12-26 12:52:47', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('13e830473f1148eabc12a82bd6b4dbe0', '06谈判/复审', '30', '2020-12-19', '2020-12-28 10:07:42', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('15e724d0cc164215b7422ecc6dd553e1', '07成交', '', '', '2020-12-23 13:46:23', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('16175be7a5894f2ea564e6578c94e795', '05提案/报价', '', '', '2020-12-23 13:31:21', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('167d389bfed04069bbe29e8d79b1da12', '05提案/报价', '', '', '2020-12-23 13:09:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('17e554b15885403f9d2d69ff52b531c4', '02需求分析', '', '', '2020-12-23 13:31:23', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('185110b691ac439a9c6923ebfb26eaa1', '04确定决策者', '', '', '2020-12-26 12:55:39', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('18ac540c2a74423c836f06079297392a', '03价值建议', '', '', '2020-12-23 13:09:44', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('19c5357ab25e4bca885cbb19d0890915', '07成交', '20000', '2020-12-31', '2020-12-28 10:41:59', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('1a36b22c95ea464f907cbeb5959ec129', '05提案/报价', '2000000000', '2020-12-30', '2020-12-28 11:24:56', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('1b74a98720004c5c95766dd8be13b775', '05提案/报价', '', '', '2020-12-23 12:33:34', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1bfb6251bfb747d9bf4ea0b069f48604', '05提案/报价', '', '', '2020-12-23 13:35:53', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1c94157ae74b478eb350d4900fd321dd', '03价值建议', '', '', '2020-12-23 13:46:19', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1c9c299ea6284fb195f56787262044e0', '04确定决策者', '', '', '2020-12-23 13:35:25', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1d836a7dfca745e78e0b386bb2bf3ed4', '05提案/报价', '', '', '2020-12-23 13:47:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1e0d3bacbb06484fb3074529b3d25970', '09因竞争丢失关闭', '', '', '2020-12-23 13:22:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1e37701b78184a15bc916e371dfc287b', '03价值建议', '', '', '2020-12-23 13:48:37', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('1ece03ab90fa4af0a5f9b7c402eeecb2', '06谈判/复审', '', '', '2020-12-26 12:55:35', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('1fb9b1ef0e0243248c65589f101f6c8b', '06谈判/复审', '', '', '2020-12-23 13:49:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2317c25913564abb86189ed11abd037b', '03价值建议', '', '', '2020-12-23 12:34:26', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('28653cc58c7f4bab829c9431a70d3733', '02需求分析', '', '', '2020-12-23 12:37:26', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('29cc8a2e98104c769af32acf988c4bf7', '08丢失的线索', '30', '2020-12-19', '2020-12-28 10:08:13', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('2c58e2f92cd543b8a5075816bed159ed', '08丢失的线索', '', '', '2020-12-23 13:09:56', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2caa8db20d5a4dc5b995c4a734267675', '08丢失的线索', '', '', '2020-12-23 13:46:38', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2ce4224bf14e495e8e8f0884e1b84f53', '04确定决策者', '', '', '2020-12-23 12:39:31', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2d1918560ec74308b0681d493f1af018', '05提案/报价', '', '', '2020-12-26 12:55:59', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('2e4adb1fff3242109ac1c46fd0bb22e1', '03价值建议', '', '', '2020-12-23 12:36:31', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2e6436850ddb4f0abe62366f3b05505f', '04确定决策者', '', '', '2020-12-23 12:33:04', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2ed1b016716c468b8f53c4fd3df70066', '01资质审查', '', '', '2020-12-23 13:31:24', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2f1a4a75a81c496a9ea5d0752deb375f', '03价值建议', '', '', '2020-12-23 12:24:44', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('2f724da3e6a647478b5ff78b628207f3', '04确定决策者', '', '', '2020-12-26 12:55:45', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3054343190904c04b54d35d679d18f32', '03价值建议', '', '', '2020-12-23 13:35:39', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('30711d8a102542778cf6f254012df381', '08丢失的线索', '', '', '2020-12-23 13:49:56', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3082b68c88794bd78a9860420bc4f9bf', '06谈判/复审', '50', '2020-12-24', '2020-12-14 19:33:30', '40f6cdea0bd34aceb77492a1656d9fb3', 'c38807bbe9804eabb524dbcef4955a60');
INSERT INTO `tbl_tran_history` VALUES ('30be56980c474c62b051b3205562efb6', '04确定决策者', '', '', '2020-12-23 12:36:21', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('350703c05855443f929464e992928c79', '07成交', '', '', '2020-12-23 12:43:40', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('350ec999585342689dfde0ab37dff419', '08丢失的线索', '', '', '2020-12-23 13:22:57', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3520aee05f4541beb358c5438510ddbb', '06谈判/复审', '', '', '2020-12-23 13:19:41', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('353e7bc56e684ab3bd7e41deef3311ca', '05提案/报价', '', '', '2020-12-23 13:49:54', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('368a74c270a54456ac1fa7de1e3bbf2f', '02需求分析', '', '', '2020-12-23 12:43:39', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('378e492b91ef4aaa911e444d23f35474', '05提案/报价', '20000', '2020-12-31', '2020-12-28 10:39:48', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('38fdba6e7b0c4256bd0075c719749656', '08丢失的线索', '', '', '2020-12-23 13:18:52', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3b8a4fccae284aafab1b35ee84e33b3d', '05提案/报价', '', '', '2020-12-23 12:33:34', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3bdb14a876e84079b89d6e2d73df8e28', '09因竞争丢失关闭', '', '', '2020-12-23 13:48:40', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3c1ca0b5e11443fd84d9600e537ccdd9', '02需求分析', '', '', '2020-12-23 12:24:18', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3c49b99e27d3454bb27e4e19f89dd4e8', '06谈判/复审', '', '', '2020-12-23 13:09:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3ca1350a31294023a7f7f3b13366fb94', '09因竞争丢失关闭', '', '', '2020-12-23 13:18:53', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3cbd5b71eaf3453f9a7eedfd5890ef45', '05提案/报价', '', '', '2020-12-26 12:55:55', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('3d93a49cff4c428580bc52ec66fdfab3', '09因竞争丢失关闭', '566666', '2020-12-29', '2020-12-23 13:16:59', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('3eabfdf698b04985b3e9515dd759a793', '08丢失的线索', '', '', '2020-12-23 13:09:52', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('3ed85a30a40d4efa8dc91390f0cbe697', '09因竞争丢失关闭', '', '', '2020-12-26 12:55:58', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('3f3070eec711441ba7b518913f7e9ef8', '04确定决策者', '', '', '2020-12-23 13:36:43', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('4070379694904c639457e1faa474dcf0', '04确定决策者', '2000000000', '2020-12-30', '2020-12-28 11:24:57', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('451f690db54843449d1099794270a3e7', '02需求分析', '', '', '2020-12-23 13:50:28', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('45d8724219354b2bbaf2db6e63000468', '08丢失的线索', '566666', '2020-12-29', '2020-12-28 10:31:39', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('460677a3f9b5454a9b9161318e0d75d7', '07成交', '', '', '2020-12-23 13:33:42', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('492121fe400447f9bd7446368455566d', '08丢失的线索', '', '', '2020-12-23 13:18:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('496e4787f4de4a749bff83b6b27f92d4', '08丢失的线索', '', '', '2020-12-23 13:09:49', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('4994a9c008524b088f2f5cc992019667', '07成交', '', '', '2020-12-23 13:36:41', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('4a1d298e3b0149d4b688cdee8f8b29a1', '03价值建议', '', '', '2020-12-23 13:35:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('4b966cb4720f4570b1e76bc64feaa74e', '09因竞争丢失关闭', '', '', '2020-12-26 12:55:38', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('4da14f55dba641a0b63e02f0a0e5db96', '05提案/报价', '2000000000', '2020-12-16', '2020-12-23 12:26:23', '40f6cdea0bd34aceb77492a1656d9fb3', '9b65c44d0a554044a1f31e79795b7c2b');
INSERT INTO `tbl_tran_history` VALUES ('4f3213d25bbb4bf89b6781f564978faf', '05提案/报价', '', '', '2020-12-23 13:20:57', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('4fc882fa86964d61a595acb3fd879af7', '03价值建议', '', '', '2020-12-23 13:51:13', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('50c8626180cc4e4da2a25787c66ef608', '06谈判/复审', '', '', '2020-12-23 13:22:04', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('51b954ac30954e9f893c0f8bb40b7050', '02需求分析', '', '', '2020-12-23 12:32:50', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('52e4e9ec62944defa3b6d95a6256d39e', '04确定决策者', '566666', '2020-12-29', '2020-12-23 12:28:54', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('52e9431aa116465298323249e2f72dac', '06谈判/复审', '30', '2020-12-19', '2020-12-26 12:53:11', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('53b8a857ea674cb7be129e3b855806ee', '04确定决策者', '', '', '2020-12-23 13:46:25', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('554a9f65054d43eea3f8001265da899b', '03价值建议', '', '', '2020-12-23 12:36:33', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('559e197814c9454ebd1feffd8ce52f41', '06谈判/复审', '', '', '2020-12-23 13:36:46', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('57a765eb5eed458db93a4a2586570714', '05提案/报价', '', '', '2020-12-23 12:36:35', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('5a2f9953f0ea40d7908e976c179b9397', '05提案/报价', '566666', '2020-12-29', '2020-12-28 10:35:09', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('5c0fe2b3ced34a328ea65494c59890c9', '09因竞争丢失关闭', '', '', '2020-12-23 13:46:27', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('5c6ded36dd3540bd9b95dd95d17783cd', '08丢失的线索', '20000', '2020-12-31', '2020-12-28 10:39:42', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('5ee2db286e9a43c0ae73b33498ef656c', '07成交', '', '', '2020-12-23 13:47:56', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('5eebe602843c4c479b340543ffa8ff78', '05提案/报价', '', '', '2020-12-23 12:45:15', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('5f7d460bb8514310bfb540a0a3f15dcc', '06谈判/复审', '', '', '2020-12-23 12:36:53', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('5fda03876f8b42799ae6852e112ed987', '02需求分析', '', '', '2020-12-23 12:34:58', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6096e00771b040259d38128006f1b706', '08丢失的线索', '', '', '2020-12-23 13:33:44', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('619b2cb66c2e44cb8292a0fe7218bd85', '03价值建议', '', '', '2020-12-23 12:33:03', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('61aed6b526524af79c82a95df7b72996', '07成交', '', '', '2020-12-26 12:55:34', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('61e8141a8c354131921608ee76c2f0b3', '09因竞争丢失关闭', '', '', '2020-12-23 13:22:52', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('623f9746365f4f61b8163554a303fb48', '09因竞争丢失关闭', '', '', '2020-12-23 13:46:22', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('631daa521c2c4cb0a0380fa03abf6710', '02需求分析', '', '', '2020-12-23 12:36:38', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('64b85b40eddb401a9272b5c886a61052', '07成交', '50', '2020-12-24', '2020-12-25 10:25:16', '40f6cdea0bd34aceb77492a1656d9fb3', 'c38807bbe9804eabb524dbcef4955a60');
INSERT INTO `tbl_tran_history` VALUES ('65c5fd006d064fae9c0778e6ef6b8bca', '03价值建议', '', '', '2020-12-23 13:31:22', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('65e711535fd14fd89148895377cbbf1f', '05提案/报价', '', '', '2020-12-23 13:51:10', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('65f4d22d207d45c2bc5305d834d9d2e6', '04确定决策者', '', '', '2020-12-26 12:56:01', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('660be2e7e9b04654bf089338d84a9b30', '06谈判/复审', '', '', '2020-12-26 12:55:49', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('666b6fe1192c4bb6ab89a67a4462bbb2', '03价值建议', '', '', '2020-12-23 12:32:56', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('67749ff27c5643309cb930db0858678f', '09因竞争丢失关闭', '', '', '2020-12-23 13:09:50', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('67935fb7cbc84bb583bdc1103f45efcd', '09因竞争丢失关闭', '', '', '2020-12-23 13:12:42', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('67b280bbe52b440b9a2b74c0dc343dba', '05提案/报价', '20000', '2020-12-31', '2020-12-28 10:39:41', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('68a3fcb3ff6a4a7f88952584fe8dc05e', '06谈判/复审', '566666', '2020-12-29', '2020-12-23 12:28:57', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('690fb65b6b6747e382ce0e26cacd0038', '09因竞争丢失关闭', '20000', '2020-12-31', '2020-12-28 10:19:21', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('69dbaaa52a394769ba22c3b31ac5f6b2', '07成交', '20000', '2020-12-31', '2020-12-28 10:36:01', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('6a5801b71bbd4f4ba0cbbd2e5a681c99', '06谈判/复审', '20000', '2020-12-31', '2020-12-28 10:07:35', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('6a6825f8d42846cc806589d8152f6385', '06谈判/复审', '', '', '2020-12-23 12:45:18', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6af5b7cec35d48609a3d158b5b1e154f', '04确定决策者', '10000000', '2020-12-15', '2020-12-14 19:24:56', '40f6cdea0bd34aceb77492a1656d9fb3', 'bb561f10506b4b4ebddfd74c2ddf469d');
INSERT INTO `tbl_tran_history` VALUES ('6bfc0c825ce04ee6b37286b88be14943', '07成交', '', '', '2020-12-23 13:51:19', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6cb7a6bcec7f44b0abaf672dd0d6bbfb', '05提案/报价', '', '', '2020-12-23 12:43:37', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6d6141cf190241e3b02f5ee5ff8b30ac', '04确定决策者', '', '', '2020-12-23 13:33:28', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6d6cbc60b724457da25af0ec236ef2b0', '07成交', '', '', '2020-12-23 12:37:42', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6e0c007c6cf040ea8e9023aad48b7d64', '07成交', '', '', '2020-12-23 13:35:27', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('6f1b27d6704844f3ab8bbabee65e9567', '08丢失的线索', '30', '2020-12-19', '2020-12-28 10:07:48', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('70eaa66fddf04691a029fa0437929587', '04确定决策者', '', '', '2020-12-23 13:31:22', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('747ab8ca6c0d47e387bd21073643dde9', '08丢失的线索', '50', '2020-12-24', '2020-12-25 10:25:19', '40f6cdea0bd34aceb77492a1656d9fb3', 'c38807bbe9804eabb524dbcef4955a60');
INSERT INTO `tbl_tran_history` VALUES ('74aa4261528a433e8ed4d32410bb8389', '07成交', '', '', '2020-12-26 12:56:06', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('74ab6fef6c60429c82d81a2a24f8bab3', '08丢失的线索', '566666', '2020-12-29', '2020-12-23 13:16:58', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('7589febec7df4052927bd8a2f7c58f61', '04确定决策者', '', '', '2020-12-23 13:51:15', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('75c8bf0fe426449ebc2146562e7c5b99', '07成交', '', '', '2020-12-23 13:12:40', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('766d6ce96b5443cd9dc618785a0bbe5d', '05提案/报价', '', '', '2020-12-23 13:28:08', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('7b6e252a03e94027803bb056d343bb35', '03价值建议', '566666', '2020-12-29', '2020-12-23 13:15:16', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('7c4c7e8f00824f158d519ad7ce9f3407', '08丢失的线索', '', '', '2020-12-23 13:51:14', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('7d09c7b2aad340309f1c0e54f0ae3c59', '05提案/报价', '', '', '2020-12-23 12:33:50', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('7e526bd7a724419f8c30d7efeb190f6b', '04确定决策者', '', '', '2020-12-23 13:33:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('7ea527b6fe15451ca1afcbab8cc361b6', '06谈判/复审', '20000', '2020-12-31', '2020-12-28 15:37:22', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('7eada87268034f8182b74a91515b0215', '08丢失的线索', '', '', '2020-12-26 12:55:46', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('7ecba1dd5134454f8209683e9b0e6ffe', '07成交', '', '', '2020-12-23 13:49:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('802b836c78a244739e8d328970fff8e1', '06谈判/复审', '', '', '2020-12-23 13:22:51', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('8242ebf6db24426db484207cbe158ffa', '08丢失的线索', '2000000000', '2020-12-30', '2020-12-28 11:25:04', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('82bfdd3219654f758ccb77db690db2b4', '07成交', '30', '2020-12-19', '2020-12-28 10:14:51', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('82c64f5e1b014b5482427261532d1399', '06谈判/复审', '2000000000', '2020-12-30', '2020-12-28 11:25:02', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('839c2bfef7864daa9cd4972bba3d80df', '06谈判/复审', '30', '2020-12-19', '2020-12-28 10:08:12', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('866dde97f77b4e83b4204fef66023843', '08丢失的线索', '', '', '2020-12-23 13:17:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('8697208166b64c30bccc66a54bc5d213', '04确定决策者', '', '', '2020-12-23 13:09:46', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('871047c6772b44d3abf043af17c739c6', '03价值建议', '', '', '2020-12-23 13:36:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('88562cc5802146a3a00c63d1ecd69913', '08丢失的线索', '', '', '2020-12-23 13:19:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('88aac1bf31b0405bb1b9c2c977c08599', '06谈判/复审', '', '', '2020-12-23 13:51:17', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('89bce9563849406db282e812c0ae93e9', '05提案/报价', '23', '2020-12-30', '2020-12-28 14:15:58', '40f6cdea0bd34aceb77492a1656d9fb3', '76e53f01216146ccb571c5fe8b5d13d1');
INSERT INTO `tbl_tran_history` VALUES ('89d91b04fc114673a93b446f02b7c76c', '05提案/报价', '', '', '2020-12-26 12:55:36', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('89f314dafe29491e877f2d13f3a05560', '09因竞争丢失关闭', '', '', '2020-12-23 13:12:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('8d80bc5bd769437b886f6a12979e3ddf', '03价值建议', '', '', '2020-12-23 13:35:07', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('8e12b24ed57348bba9dd26d1ceabd70d', '04确定决策者', '', '', '2020-12-23 13:51:09', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('901b1022d75f4b4c9a69fc62f4eaec61', '04确定决策者', '', '', '2020-12-23 13:48:00', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9088deb52a2d4c79a70902c2eee17574', '09因竞争丢失关闭', '566666', '2020-12-29', '2020-12-23 13:15:19', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('919eaf00933942d2abf1c7ab9341dd25', '08丢失的线索', '', '', '2020-12-26 12:55:54', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('939ab3c608a24f2cb380447d4b313f18', '09因竞争丢失关闭', '', '', '2020-12-23 10:01:37', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('93da22a8e1ba4d9ca63d0be8caddf575', '06谈判/复审', '', '', '2020-12-23 12:36:41', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('94478d23c2974501a98ab05da26d7be5', '01资质审查', '2000000000', '2020-12-16', '2020-12-23 12:25:49', '40f6cdea0bd34aceb77492a1656d9fb3', '9b65c44d0a554044a1f31e79795b7c2b');
INSERT INTO `tbl_tran_history` VALUES ('95f2c7914a66447685a231f8137d4761', '03价值建议', '2000000000', '2020-12-16', '2020-12-23 12:26:08', '40f6cdea0bd34aceb77492a1656d9fb3', '9b65c44d0a554044a1f31e79795b7c2b');
INSERT INTO `tbl_tran_history` VALUES ('96d52adaf2814441aca2903fb6f1efc2', '04确定决策者', '', '', '2020-12-23 12:33:52', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('990c92315e164c51baf10231fb07631a', '07成交', '', '', '2020-12-23 12:36:43', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('999572c593db4465b663a60626677558', '08丢失的线索', '', '', '2020-12-25 10:24:54', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9a0c6057526d469aa6e468f545cd6ae8', '03价值建议', '', '', '2020-12-23 13:35:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9b5f1d933db74e0e8ad9cf70c7c42f2e', '09因竞争丢失关闭', '2000000000', '2020-12-30', '2020-12-28 11:27:11', '40f6cdea0bd34aceb77492a1656d9fb3', '5f33014eb1a541c6b511823e08f38f65');
INSERT INTO `tbl_tran_history` VALUES ('9bf2d247bb8341538558086310f35b5e', '03价值建议', '', '', '2020-12-23 12:40:17', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9c42d15d66844462a0a8c12e40eece6d', '04确定决策者', '', '', '2020-12-26 14:56:56', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9cef0b02c2c2498ca616ff4821575405', '09因竞争丢失关闭', '', '', '2020-12-23 13:36:44', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('9db7a7e1da484100b761aea003cae9a3', '07成交', '30', '2020-12-19', '2020-12-26 12:53:07', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('9e799d0b5d7048888e105c96ff9e716f', '01资质审查', '', '', '2020-12-28 11:35:02', '40f6cdea0bd34aceb77492a1656d9fb3', '8382cda2469c4a81b9c102226555ccb6');
INSERT INTO `tbl_tran_history` VALUES ('9fffcf5a5c3a457db347b5f345bd0344', '07成交', '50', '2020-12-24', '2020-12-25 10:25:21', '40f6cdea0bd34aceb77492a1656d9fb3', 'c38807bbe9804eabb524dbcef4955a60');
INSERT INTO `tbl_tran_history` VALUES ('a0985ce6fff24cacb3b9b67ecf101a99', '03价值建议', '', '', '2020-12-23 13:33:39', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a11242add8234059a0d61065beac48d1', '06谈判/复审', '', '', '2020-12-23 12:37:39', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a17919d6b0004d4d8cd861d91165c529', '04确定决策者', '', '', '2020-12-23 13:48:02', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a20b1efd496a470da095c50a9826983c', '05提案/报价', '', '', '2020-12-23 13:35:26', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a2597aec445c4de989d77bc6389c7f1d', '05提案/报价', '', '', '2020-12-23 12:33:58', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a25c3dd2a20048ffa48ef72aa1622adc', '08丢失的线索', '30', '2020-12-19', '2020-12-28 10:14:50', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('a2d8e5b6f13a47e3bb2c24be43bf98d3', '03价值建议', '', '', '2020-12-23 12:22:58', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a3b92cd9f8e34cf69045b4c3fa6bcdef', '03价值建议', '', '', '2020-12-23 13:51:16', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a463781aa3124dc0a301b55ff203d7e1', '08丢失的线索', '', '', '2020-12-23 13:31:30', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a5114b61ea704e238a87936322d9010a', '08丢失的线索', '', '', '2020-12-23 13:51:11', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a60576cba8c54ce4a5d2f73d21300882', '02需求分析', '', '', '2020-12-23 12:32:52', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a74ef201631f4b39a8a4125a4febb288', '05提案/报价', '', '', '2020-12-23 12:39:16', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a784d37b568f46c38f950fb2a51671f0', '05提案/报价', '566666', '2020-12-29', '2020-12-23 13:16:51', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('a7d124a03b61413d9f73ee321d8f364f', '02需求分析', '', '', '2020-12-23 12:33:27', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a7fdff6c84f747df815f83e47a5e1f02', '07成交', '10000000', '2020-12-15', '2020-12-28 14:17:43', '40f6cdea0bd34aceb77492a1656d9fb3', 'bb561f10506b4b4ebddfd74c2ddf469d');
INSERT INTO `tbl_tran_history` VALUES ('a8322a63cb294c7099f38b1d7c570ca2', '04确定决策者', '', '', '2020-12-23 12:43:36', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a871ce318f9444e4b9798a3485747c4b', '05提案/报价', '', '', '2020-12-23 12:33:51', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a8daff4688cf4affac0ddba83b40bfd0', '09因竞争丢失关闭', '20000', '2020-12-31', '2020-12-28 10:39:48', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('a92a35be722b46bfa9bac8ddadd731b3', '03价值建议', '', '', '2020-12-23 12:32:56', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('a9e7781b02604b84bac8b91c0e510493', '07成交', '', '', '2020-12-28 11:33:02', '40f6cdea0bd34aceb77492a1656d9fb3', 'e1ec2dcde03d43b092489d3df1df8713');
INSERT INTO `tbl_tran_history` VALUES ('aa304d8494d24dc092da84efacd6200b', '04确定决策者', '', '', '2020-12-23 12:23:56', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('acac3303eb5943a6bf5831e343cf8d81', '09因竞争丢失关闭', '', '', '2020-12-23 10:15:08', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('ace88e3af4544446830af877c4f39471', '04确定决策者', '', '', '2020-12-25 10:24:58', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('ad832d39fd1a407198b7247a781262d9', '08丢失的线索', '566666', '2020-12-29', '2020-12-23 13:16:55', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('adf53c68c5bf46c0ab65ff7f00237ee6', '09因竞争丢失关闭', '30', '2020-12-19', '2020-12-28 10:08:14', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('aefd2d2d25ad4b09bfde7add0d652da4', '09因竞争丢失关闭', '', '', '2020-12-23 13:47:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('afc3e28a82f74fcf9f83a88e8b41c752', '09因竞争丢失关闭', '', '', '2020-12-23 13:17:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b0519e57f3164afdb5a0f35d1de3ff55', '06谈判/复审', '20000', '2020-12-31', '2020-12-28 10:39:45', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('b0d1990704d9461694789a583143fd76', '09因竞争丢失关闭', '', '', '2020-12-23 13:35:43', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b2b8147ce2a84b0483d32aba3db19ede', '04确定决策者', '', '', '2020-12-23 12:37:29', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b3249498af9049a1a70b8f2154ef43a5', '09因竞争丢失关闭', '', '', '2020-12-23 13:09:57', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b421ef7ee2764e558f09986e2ae67dd6', '09因竞争丢失关闭', '', '', '2020-12-23 13:33:43', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b69d8480787b4486a1c86a78d843b888', '05提案/报价', '', '', '2020-12-23 13:22:55', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b7829ba52bd3430e8f33a7c8dac1d21e', '08丢失的线索', '', '', '2020-12-23 13:33:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('b883116f13d9497fb1e6b7fce18122aa', '06谈判/复审', '30', '2020-12-19', '2020-12-26 12:53:02', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('b8ebec8d53e842acaab8bec08489900c', '01资质审查', '20000', '2020-12-31', '2020-12-26 15:19:12', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('bc82472eb1d24c938387c571e9b29572', '01资质审查', '', '', '2020-12-23 13:07:53', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('bcdd0d68e3c44ee0b6938aaa3e5678a3', '08丢失的线索', '', '', '2020-12-23 13:46:26', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('bd3c5d72df08487687b2b1960543b3d9', '02需求分析', '', '', '2020-12-23 12:37:32', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('bda5a9123387495a8494610efd70488e', '06谈判/复审', '30', '2020-12-19', '2020-12-28 10:07:53', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('be0947a628ca46f5b3a658a0f52a0c34', '08丢失的线索', '30', '2020-12-19', '2020-12-28 10:07:50', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('bf33901c80e84918a01145a5dd68dfef', '03价值建议', '', '', '2020-12-23 12:39:42', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c0faeb68482d4b76ae6428fef84610b1', '09因竞争丢失关闭', '', '', '2020-12-23 13:51:14', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c11bf7bbbea24b73929da7a69eadcb77', '03价值建议', '', '', '2020-12-23 13:33:36', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c1b31b8db0cd4426914755be04ced71a', '08丢失的线索', '20000', '2020-12-31', '2020-12-28 10:39:39', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('c1f6eeb652e54467870783d0750e479d', '04确定决策者', '', '', '2020-12-23 12:33:31', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c21c072e4d3b4eee9df2afe134efd72b', '08丢失的线索', '', '', '2020-12-23 13:18:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c511c93621c04533924f7d38571d2c4a', '03价值建议', '', '', '2020-12-23 12:33:30', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c524b71baec34a198fc7f11ce2f00ccb', '05提案/报价', '', '', '2020-12-23 13:49:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c64c9677f714418cbd88e6012dba93da', '04确定决策者', '', '', '2020-12-23 12:39:19', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c759ed6e16cd4e9eba54ef1e934e39c1', '09因竞争丢失关闭', '', '', '2020-12-23 13:49:57', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c7b54a99a84c40f1a8fffb92739f28c6', '06谈判/复审', '566666', '2020-12-29', '2020-12-23 13:17:36', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('c8c7190d3cec4a95ac17ca292df7e841', '03价值建议', '', '', '2020-12-23 13:51:08', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('c8e83abb5f4541e7a816ecf79f552158', '08丢失的线索', '', '', '2020-12-23 13:36:42', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('cbc49c5dd2054d588c32cb1ee08531fa', '06谈判/复审', '30', '2020-12-19', '2020-12-28 10:07:44', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('cbfba30448e042839267a68cba0caae6', '08丢失的线索', '', '', '2020-12-23 13:22:07', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('cc2a2b967e3941bb89000a6e9fe1c3c4', '04确定决策者', '20000', '2020-12-31', '2020-12-28 15:37:20', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('cc967bbc6d45427a9bb4175a642dd406', '08丢失的线索', '566666', '2020-12-29', '2020-12-23 13:15:18', '06f5fc056eac41558a964f96daa7f27c', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('cd0aff4731844b0aa1792376a11fd138', '07成交', '20000', '2020-12-31', '2020-12-28 10:39:47', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('cf74772322eb4f96a94224a83a8b9dbc', '04确定决策者', '', '', '2020-12-23 13:51:12', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d0b8dc8c1d09488080fd668063fc86f3', '08丢失的线索', '', '', '2020-12-23 13:47:57', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d0e37779a418476a9de573945f09cdd5', '05提案/报价', '', '', '2020-12-23 13:49:55', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d1e92b35547b4f3caeb9428f98ec74fa', '08丢失的线索', '', '', '2020-12-23 13:46:20', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d2d0ff40c31f4ac193b4581592865508', '06谈判/复审', '', '', '2020-12-23 13:31:18', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d52afa650a2a499fb6906c28b9ca8878', '08丢失的线索', '', '', '2020-12-23 13:20:59', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d55b339d4b524a9b9e75ee91022cc47f', '06谈判/复审', '', '', '2020-12-23 13:35:27', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d5c02716be6e4e9582616ccce02673fe', '06谈判/复审', '', '', '2020-12-23 12:37:34', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d5e5f43214e94e39b88ae329293af737', '08丢失的线索', '', '', '2020-12-23 13:48:39', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d5f8f6a4b1dd4c509641a7e31703b360', '02需求分析', '', '', '2020-12-23 12:39:44', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d61b9816569147b898a06ec94b220021', '05提案/报价', '', '', '2020-12-23 12:39:46', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d6d54204844447ca857c74eb944285fc', '01资质审查', '', '', '2020-12-23 12:37:38', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d6edb9c1a53d466493c25f44c6a67459', '03价值建议', '', '', '2020-12-23 12:46:45', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d7bddacca8ab445b99971cfdf09d2e96', '08丢失的线索', '20000', '2020-12-31', '2020-12-28 10:19:19', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('d7f577787d9b4c15877e8674a0892e3b', '05提案/报价', '', '', '2020-12-23 13:51:17', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('d9dce038c3eb4149ae1e82956c444b96', '01资质审查', '', '', '2020-12-23 12:36:51', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('dc984cc5df8341f59d3171baa6cb9703', '02需求分析', '', '', '2020-12-23 13:33:34', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('def657b33e0043d4bd30fcf2276611f1', '07成交', '', '', '2020-12-23 13:17:42', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e01cf0aee3f34eef8e17b4aa45f455cf', '04确定决策者', '', '', '2020-12-23 13:49:58', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e062daad6c7f4aae8d5bddcb39b04a44', '08丢失的线索', '', '', '2020-12-26 12:55:37', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('e0993a1be16c4455b7c612009fcd2f61', '08丢失的线索', '20000', '2020-12-31', '2020-12-28 10:42:00', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('e25ea515a3c34798800fa5312fd34ebb', '09因竞争丢失关闭', '', '', '2020-12-23 13:20:51', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e2e40c9d569040a6825cddd3535ad9e8', '09因竞争丢失关闭', '', '', '2020-12-23 13:22:48', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e520f3a6757e4d60be9183eef9ab54e3', '04确定决策者', '', '', '2020-12-23 13:33:47', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e5467be6f82c4cb39ad7079614f07df9', '03价值建议', '', '', '2020-12-23 13:12:38', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e63b943a728b491cacd370337ca4f733', '08丢失的线索', '', '', '2020-12-23 13:35:42', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e83aaa5e53dc4ef9bcd140073e2d584d', '05提案/报价', '', '', '2020-12-23 12:36:39', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('e87cdef9f566479b8872b72ad6d5973c', '04确定决策者', '566666', '2020-12-29', '2020-12-23 12:28:50', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('e9f5b313f9894be69dc357a975e52044', '05提案/报价', '10000000', '2020-12-15', '2020-12-28 14:17:31', '40f6cdea0bd34aceb77492a1656d9fb3', 'bb561f10506b4b4ebddfd74c2ddf469d');
INSERT INTO `tbl_tran_history` VALUES ('eb7df3e0598246558c7ccde2ffebee2f', '03价值建议', '', '', '2020-12-23 12:33:52', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('efc27b47fa4948908b2ee8ddf1bd9bec', '06谈判/复审', '', '', '2020-12-26 12:55:53', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('f02da83135a94d9cbf58f3c24c4d6aa3', '03价值建议', '', '', '2020-12-23 12:33:13', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f08145719dad45ffa1898eefb2ed828f', '07成交', '', '', '2020-12-26 12:55:30', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('f0ce7c9632394d40bacef6b056e6464e', '04确定决策者', '', '', '2020-12-26 12:55:47', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f15780dd76e14a6aadb966d38d69eb86', '06谈判/复审', '', '', '2020-12-23 13:17:54', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f19c65cd66db4edebe463f283a0a1ac9', '04确定决策者', '', '', '2020-12-26 12:55:57', '40f6cdea0bd34aceb77492a1656d9fb3', '53ebe8f8162d4830894e46eb91864f48');
INSERT INTO `tbl_tran_history` VALUES ('f306ae365de047d99f30f87f3afbcb2a', '08丢失的线索', '', '', '2020-12-23 13:22:49', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f450197ea8c5468294a81dae216d8488', '05提案/报价', '', '', '2020-12-23 13:35:02', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f75739c8ca624491bd0750890df572e2', '06谈判/复审', '', '', '2020-12-23 13:22:50', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f7e72661e0f84fad99a3e31f8de6e966', '07成交', '', '', '2020-12-23 13:51:18', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f80a0c1721f94b99b094901969b41fe7', '01资质审查', '', '', '2020-12-23 12:25:10', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f89e39b1037a4d9fba1d51534b05dfb8', '05提案/报价', '', '', '2020-12-23 13:46:24', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f8ebc5844184478eae97d2959c8faf1d', '09因竞争丢失关闭', '', '', '2020-12-23 13:19:40', '06f5fc056eac41558a964f96daa7f27c', '28f37bf323ed40fcb3067c532b6399dd');
INSERT INTO `tbl_tran_history` VALUES ('f92e0841d6bc41a89454237ad34c8caa', '04确定决策者', '20000', '2020-12-31', '2020-12-28 10:39:41', '40f6cdea0bd34aceb77492a1656d9fb3', '4a09f07dc2cb4f7384eb6cb256f9a074');
INSERT INTO `tbl_tran_history` VALUES ('fb1ea45383594486a5432289eac55330', '08丢失的线索', '30', '2020-12-19', '2020-12-26 12:53:13', '40f6cdea0bd34aceb77492a1656d9fb3', '9addf791a6ad4de3b068db7d9b335ac3');
INSERT INTO `tbl_tran_history` VALUES ('fd298f353a5d41ef8f2c9fb1bf570aa5', '03价值建议', '566666', '2020-12-29', '2020-12-20 13:25:11', '40f6cdea0bd34aceb77492a1656d9fb3', '6fb31d4a879942fc86832da408d566fa');
INSERT INTO `tbl_tran_history` VALUES ('feb982b1d9e7483882334d22162d337b', '02需求分析', '', '', '2020-12-23 12:36:50', '40f6cdea0bd34aceb77492a1656d9fb3', '28f37bf323ed40fcb3067c532b6399dd');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noteContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editFlag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tranId` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginPwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expireTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lockState` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `allowIps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `editBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '李四', '202cb962ac59075b964b07152d234b70', 'ls@163.com', '2012-11-27 21:50:05', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1', '2018-11-22 12:11:40', '李四', NULL, NULL);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '张三', '202cb962ac59075b964b07152d234b70', 'zs@qq.com', '2022-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1', '2018-11-22 11:37:34', '张三', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
