/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : dinner_manange

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-12-30 09:14:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menu_consume_manager`
-- ----------------------------
DROP TABLE IF EXISTS `menu_consume_manager`;
CREATE TABLE `menu_consume_manager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消费id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `user_name` varchar(128) DEFAULT NULL COMMENT '会员姓名',
  `user_phone` varchar(12) DEFAULT NULL COMMENT '会员手机',
  `consum_time` varchar(32) DEFAULT NULL COMMENT '消费时间',
  `people_num` int(11) DEFAULT NULL COMMENT '用餐人数',
  `pay_money` double(10,4) DEFAULT NULL COMMENT '消费金额',
  `discount_money` double(10,4) DEFAULT NULL COMMENT '折扣价',
  `consum_desc` varchar(500) DEFAULT NULL COMMENT '客户需求备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='消费管理';

-- ----------------------------
-- Records of menu_consume_manager
-- ----------------------------
INSERT INTO `menu_consume_manager` VALUES ('30', '1', '测试会员A', '15xxxxxxx5', '2016-12-03', '5', '120.0000', '115.0000', '重辣', 'tk', '2016-12-03 16:09:17', null, null);

-- ----------------------------
-- Table structure for `menu_consum_food_log`
-- ----------------------------
DROP TABLE IF EXISTS `menu_consum_food_log`;
CREATE TABLE `menu_consum_food_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `consum_id` bigint(20) DEFAULT NULL COMMENT '消费id',
  `food_id` bigint(20) DEFAULT NULL COMMENT '点菜',
  `food_name` varchar(100) DEFAULT NULL COMMENT '菜名',
  `food_type_name` varchar(100) DEFAULT NULL COMMENT '菜类',
  `cuisine_name` varchar(64) DEFAULT NULL COMMENT '菜系',
  `note` varchar(500) DEFAULT NULL COMMENT '用户点菜备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消费食物日志记录';

-- ----------------------------
-- Records of menu_consum_food_log
-- ----------------------------

-- ----------------------------
-- Table structure for `menu_cuisine`
-- ----------------------------
DROP TABLE IF EXISTS `menu_cuisine`;
CREATE TABLE `menu_cuisine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cuisine_name` varchar(64) DEFAULT NULL COMMENT '菜系名称',
  `lifecycle` int(1) DEFAULT NULL COMMENT '是否启用',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `modify_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `modify_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜系分类';

-- ----------------------------
-- Records of menu_cuisine
-- ----------------------------
INSERT INTO `menu_cuisine` VALUES ('1', '11', '1', 'tk', '2016-11-01 22:12:42', 'tk', '2016-11-03 21:24:11');
INSERT INTO `menu_cuisine` VALUES ('2', '本帮菜', '1', 'tk', '2016-11-03 21:23:45', null, null);
INSERT INTO `menu_cuisine` VALUES ('3', '川菜', '1', 'tk', '2016-11-03 21:24:06', null, null);

-- ----------------------------
-- Table structure for `menu_food_info`
-- ----------------------------
DROP TABLE IF EXISTS `menu_food_info`;
CREATE TABLE `menu_food_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(64) DEFAULT NULL COMMENT '名称',
  `lifecycle` int(1) DEFAULT NULL COMMENT '是否启用',
  `cuisine_id` bigint(20) DEFAULT NULL COMMENT '所属菜系',
  `type_id` bigint(20) DEFAULT NULL COMMENT '所属菜别',
  `menu_id` varchar(20) DEFAULT NULL COMMENT '编号',
  `price` double(10,4) DEFAULT NULL COMMENT '单价',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `modify_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  `image1` varchar(512) DEFAULT NULL COMMENT '图片1',
  `image2` varchar(512) DEFAULT NULL COMMENT '图片2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜谱';

-- ----------------------------
-- Records of menu_food_info
-- ----------------------------
INSERT INTO `menu_food_info` VALUES ('1', '222', '1', '1', '1', '1', '1.0000', '2016-11-01 22:13:03', 'tk', null, null, null, null);
INSERT INTO `menu_food_info` VALUES ('2', '鱼香肉丝', '1', '3', '1', null, '18.0000', '2016-11-03 22:11:03', 'tk', 'tk', '2016-11-03 22:11:24', null, null);
INSERT INTO `menu_food_info` VALUES ('3', '蚂蚁上树', '1', '2', '1', null, '32.5000', '2016-11-03 22:12:03', 'tk', 'tk', '2016-11-03 22:12:21', null, null);

-- ----------------------------
-- Table structure for `menu_type`
-- ----------------------------
DROP TABLE IF EXISTS `menu_type`;
CREATE TABLE `menu_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `food_type_name` varchar(64) DEFAULT NULL COMMENT '菜类别名',
  `lifecycle` int(1) DEFAULT NULL COMMENT '是否启用(0:停用 1:启用 2:删除)',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `modify_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `modify_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='菜类别';

-- ----------------------------
-- Records of menu_type
-- ----------------------------
INSERT INTO `menu_type` VALUES ('1', '餐厅2', '1', 'tankun', '2016-10-30 21:41:05', null, null);
INSERT INTO `menu_type` VALUES ('3', '测试', '2', 'tankun', '2016-10-31 15:32:42', 'tk', '2016-11-02 22:01:06');

-- ----------------------------
-- Table structure for `menu_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `menu_user_info`;
CREATE TABLE `menu_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(100) DEFAULT NULL COMMENT '会员姓名',
  `sex` char(4) DEFAULT NULL COMMENT '会员性别',
  `group_type` char(1) DEFAULT NULL COMMENT '族群（1:学生 2：工人 3：社会精英 4：其他）',
  `member_type` char(1) DEFAULT NULL COMMENT '会员类型(1:普通 2：黄金 3：白银)',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `registe_time` varchar(32) DEFAULT NULL COMMENT '注册时间',
  `comm_address` varchar(128) DEFAULT NULL COMMENT '常用联系地址',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '更新人',
  `modify_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  `idcard` varchar(64) DEFAULT NULL COMMENT '会员号',
  `user_desc` varchar(524) DEFAULT NULL COMMENT '会员备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='vip管理';

-- ----------------------------
-- Records of menu_user_info
-- ----------------------------
INSERT INTO `menu_user_info` VALUES ('1', '测试会员A', '0', '3', '1', '15xxxxx95', '2016-11-06 19:57:47', '上海', '2016-11-06 19:57:47', 'tk', null, null, null, '暂无');
INSERT INTO `menu_user_info` VALUES ('2', '测试B', '1', '2', '3', '15xxxxx96', '2016-11-06 20:10:29', '测试地址A', '2016-11-06 20:10:29', 'tk', 'tk', '2016-11-06 20:10:41', null, '');

-- ----------------------------
-- Table structure for `system_export_excel_sql`
-- ----------------------------
DROP TABLE IF EXISTS `system_export_excel_sql`;
CREATE TABLE `system_export_excel_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_adminid` int(11) NOT NULL,
  `console_sql` text NOT NULL,
  `count_sql` text NOT NULL,
  `is_handle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_export_excel_sql
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_andorra`
-- ----------------------------
DROP TABLE IF EXISTS `sys_andorra`;
CREATE TABLE `sys_andorra` (
  `id` bigint(11) NOT NULL COMMENT '广告ID',
  `title` varchar(200) DEFAULT NULL COMMENT '广告标题',
  `content` varchar(200) DEFAULT NULL COMMENT '广告内容',
  `type` char(2) DEFAULT NULL COMMENT '广告类型  0为默认文字广告，1为图片广告',
  `adurl` varchar(200) DEFAULT NULL COMMENT '广告图片地址',
  `publisher` varchar(50) DEFAULT NULL COMMENT '广告发布人',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `uptime` datetime DEFAULT NULL COMMENT '修改时间',
  `starttime` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `status` char(2) DEFAULT '0' COMMENT '状态  0为默认未启用，1为启用',
  `tourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_andorra
-- ----------------------------
INSERT INTO `sys_andorra` VALUES ('1', 'df', '<p>sdf</p>', '0', '26302614f4234e708b49e75f553d9578.png', 'dsf', '2014-12-02 01:28:44', '2014-12-02 22:41:05', '2014-12-03', '2014-12-06', '0', 'dsf');
INSERT INTO `sys_andorra` VALUES ('2', 'dddd', '<p>dddd</p>', '1', '286787ecf43449518b92fb3f04361cab.jpg', 'ssss', '2015-04-19 02:58:21', '2015-04-19 02:58:21', '2015-04-01', '2015-03-31', '1', 'dddd');

-- ----------------------------
-- Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('25fe1d44cf064c47b190ff82456ec185', '1111', 'f7177163c833dff4b38fc8d2872f1ec6', '44', '', '2', '', '', '1', '44', '444', '44', '2016-04-14', '2016-04-16', '44', '44', '44@qq.com');
INSERT INTO `sys_app_user` VALUES ('70ecc04782a9410c9cd53ea5392a6938', '此用户名已存在!1111', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '', '', '', '', '', '0', '22', '11@qq.com');
INSERT INTO `sys_app_user` VALUES ('be5b52975e1445d39785bd94be9f7c15', '44', '1679091c5a880faf6fb5e6087eb1b2dc', '66', '', '2', '', '', '1', '66', '66', '66', '2016-04-14', '2016-04-16', '66', '5', '66@qq.com');
INSERT INTO `sys_app_user` VALUES ('c0ef88c8e9464ef7a23896a9c5f237ee', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', '2', '', '', '1', '1', '1', '1', '2016-04-13', '2016-04-13', '1', '1', '144444@qq.com');
INSERT INTO `sys_app_user` VALUES ('c961a9a76116464eac2fac14389d8c2b', '此用户名已33333存在!', '698d51a19d8a121ce581499d7b701668', '3', '', '2', '', '', '1', '3', '1', '1', '2016-04-14', '2016-04-22', '1', '3', '33@qq.com');
INSERT INTO `sys_app_user` VALUES ('e89b3d1d6ad84cfab65e3039bd412c4f', '此用户名已111存在!', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', '2', '', '', '1', '1', '1', '1', '2016-04-06', '2016-04-08', '1', '333', '1@qq.com');
INSERT INTO `sys_app_user` VALUES ('ead1f56708e4409c8d071e0a699e5633', 'a2', 'c4ca4238a0b923820dcc509a6f75849b', '会员乙', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '', '', '', '2015-12-01', '2015-12-24', '1', '12', '978336446@qq.com');
INSERT INTO `sys_app_user` VALUES ('fdc49415600c4beea688bcbbe0d3ff7d', '此用户名已4545存在!', 'c4ca4238a0b923820dcc509a6f75849b', '1', '', '2', '', '', '1', '', '1', '1', '2016-04-07', '2016-04-23', '1', '11', 'wwww@qq.com');

-- ----------------------------
-- Table structure for `sys_createcode`
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('12ef8e75e25b457d889b5f76733973ca', 'menu', 'ConsumFoodLog', 'menu_consum_,fh,ConsumFoodLog', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,11Q313596790consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,11Q313596790food_id,fh,Integer,fh,食物id,fh,是,fh,无,fh,11Q313596790food_name,fh,String,fh,食物名称,fh,是,fh,无,fh,255Q313596790food_type_name,fh,String,fh,菜类,fh,是,fh,无,fh,255Q313596790cuisine_name,fh,String,fh,菜系,fh,是,fh,无,fh,255Q313596790', '2016-10-29 14:09:55', '消费食物日志记录');
INSERT INTO `sys_createcode` VALUES ('38ca258caaa04ef8ac6f4221199ad46f', 'menu', 'ConsumFoodLog', 'menu_consum_food_log,fh,ConsumFoodLog', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,11Q313596790consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,11Q313596790food_id,fh,Integer,fh,食物id,fh,是,fh,无,fh,11Q313596790food_name,fh,String,fh,食物名称,fh,是,fh,无,fh,255Q313596790food_type_name,fh,String,fh,菜类,fh,是,fh,无,fh,255Q313596790cuisine_name,fh,String,fh,菜系,fh,是,fh,无,fh,255Q313596790', '2016-10-29 13:34:22', '消费食物日志记录');
INSERT INTO `sys_createcode` VALUES ('45e625baf85d4dd2ba39590db1e8f4b8', 'menu', 'MenuType', 'menu_type,fh,MenuType', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,20Q313596790food_type_name,fh,String,fh,菜类别名称,fh,是,fh,无,fh,64Q313596790lifecycle,fh,Integer,fh,是否启用(0:停用 1:启用 2:删除),fh,是,fh,无,fh,1Q313596790create_by,fh,String,fh,创建人,fh,是,fh,无,fh,64Q313596790create_time,fh,String,fh,创建时间,fh,是,fh,无,fh,32Q313596790modify_by,fh,String,fh,更新人,fh,是,fh,无,fh,64Q313596790modify_time,fh,String,fh,更新时间,fh,是,fh,无,fh,32Q313596790', '2016-10-29 12:49:49', 'restaurant');
INSERT INTO `sys_createcode` VALUES ('7b9638281b0641e8a070dcd2b6db0d5f', 'menu', 'Cuisine', 'menu_cuisine,fh,Cuisine', 'id,fh,Integer,fh,id,fh,否,fh,无,fh,20Q313596790cuisine_name,fh,String,fh,菜系名称,fh,是,fh,无,fh,64Q313596790lifecycle,fh,Integer,fh,是否启用(0:停用 1:启用 2:删除),fh,是,fh,无,fh,1Q313596790create_by,fh,String,fh,创建人,fh,是,fh,无,fh,64Q313596790create_time,fh,String,fh,创建时间,fh,是,fh,无,fh,32Q313596790modify_by,fh,String,fh,更新人,fh,是,fh,无,fh,255Q313596790modify_time,fh,String,fh,更新时间,fh,是,fh,无,fh,255Q313596790', '2016-10-29 12:56:44', '菜系分类');
INSERT INTO `sys_createcode` VALUES ('969bdf1ce7634e168d415375c972f2c6', 'menu', 'VipUserInfo', 'menu_user_info,fh,VipUserInfo', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,20Q313596790user_name,fh,String,fh,用户姓名,fh,是,fh,无,fh,64Q313596790sex,fh,String,fh,性别,fh,是,fh,无,fh,4Q313596790group_type,fh,Integer,fh,族群（1:学生 2：工人 3：社会精英）,fh,是,fh,无,fh,1Q313596790member_type,fh,Integer,fh,会员类型(1:普通 2：黄金 3：白银),fh,是,fh,无,fh,1Q313596790phone,fh,String,fh,手机号,fh,是,fh,无,fh,12Q313596790registe_time,fh,String,fh,注册时间,fh,是,fh,无,fh,32Q313596790comm_address,fh,String,fh,常用联系地址,fh,是,fh,无,fh,255Q313596790create_time,fh,String,fh,创建时间,fh,是,fh,无,fh,32Q313596790create_by,fh,String,fh,创建人,fh,是,fh,无,fh,64Q313596790modify_by,fh,String,fh,更新人,fh,是,fh,无,fh,255Q313596790modify_time,fh,String,fh,更新时间,fh,是,fh,无,fh,255Q313596790idcard,fh,String,fh,会员号,fh,是,fh,无,fh,255Q313596790user_desc,fh,String,fh,会员信息备注,fh,是,fh,无,fh,255Q313596790', '2016-10-29 13:24:08', 'vip管理');
INSERT INTO `sys_createcode` VALUES ('9ea68865ef5141088e5527601b11b4e0', 'menu', 'ConsumFoodLog', 'menu_consum_,fh,ConsumFoodLog', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,11Q313596790consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,11Q313596790food_id,fh,Integer,fh,食物id,fh,是,fh,无,fh,11Q313596790food_name,fh,String,fh,食物名称,fh,是,fh,无,fh,255Q313596790food_type_name,fh,String,fh,菜类,fh,是,fh,无,fh,255Q313596790cuisine_name,fh,String,fh,菜系,fh,是,fh,无,fh,255Q313596790', '2016-10-29 14:11:20', '消费食物日志记录');
INSERT INTO `sys_createcode` VALUES ('ba522470cf1042e4b5abcdef552ff810', 'menu', 'ConsumeManager', 'menu_consume_manager,fh,ConsumeManager', 'consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,20Q313596790user_id,fh,Integer,fh,会员id,fh,是,fh,无,fh,20Q313596790user_name,fh,String,fh,顾客姓名,fh,是,fh,无,fh,255Q313596790user_phone,fh,String,fh,会员手机,fh,是,fh,无,fh,255Q313596790consum_time,fh,String,fh,消费时间,fh,是,fh,无,fh,255Q313596790people_num,fh,Integer,fh,用餐人数,fh,是,fh,无,fh,11Q313596790pay_money,fh,String,fh,消费金额,fh,是,fh,无,fh,255Q313596790discount_money,fh,String,fh,折扣价,fh,是,fh,无,fh,255Q313596790consum_desc,fh,String,fh,客户需求描述,fh,是,fh,无,fh,255Q313596790', '2016-10-29 13:31:27', '消费管理');
INSERT INTO `sys_createcode` VALUES ('c2e62d67848a462cb6b582a16ac25df9', 'menu', 'ConsumeManager', 'menu_consume_manager,fh,ConsumeManager', 'consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,20Q313596790user_id,fh,Integer,fh,会员id,fh,是,fh,无,fh,20Q313596790user_name,fh,String,fh,顾客姓名,fh,是,fh,无,fh,255Q313596790user_phone,fh,String,fh,会员手机,fh,是,fh,无,fh,255Q313596790consum_time,fh,String,fh,消费时间,fh,是,fh,无,fh,255Q313596790people_num,fh,Integer,fh,用餐人数,fh,是,fh,无,fh,11Q313596790pay_money,fh,String,fh,消费金额,fh,是,fh,无,fh,255Q313596790discount_money,fh,String,fh,折扣价,fh,是,fh,无,fh,255Q313596790consum_desc,fh,String,fh,客户需求描述,fh,是,fh,无,fh,255Q313596790', '2016-11-07 20:50:13', '消费管理');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构');
INSERT INTO `sys_createcode` VALUES ('de141b01a1654378b62ac08c5dc423d9', 'menu', 'ConsumFoodLog', 'menu_consum_food_log,fh,ConsumFoodLog', 'id,fh,Integer,fh,id,fh,是,fh,无,fh,11Q313596790consum_id,fh,Integer,fh,消费id,fh,是,fh,无,fh,11Q313596790food_id,fh,Integer,fh,食物id,fh,是,fh,无,fh,11Q313596790food_name,fh,String,fh,食物名称,fh,是,fh,无,fh,255Q313596790food_type_name,fh,String,fh,菜类,fh,是,fh,无,fh,255Q313596790cuisine_name,fh,String,fh,菜系,fh,是,fh,无,fh,255Q313596790', '2016-10-29 13:34:51', '消费食物日志记录');
INSERT INTO `sys_createcode` VALUES ('e2aae0569e304a3a8e876fbd16ec6a40', 'menu', 'FoodInfo', 'menu_food_info,fh,FoodInfo', 'id,fh,Integer,fh,id,fh,否,fh,无,fh,20Q313596790menu_name,fh,String,fh,名称,fh,是,fh,无,fh,64Q313596790lifecycle,fh,Integer,fh,是否启用(0:停用 1:启用 2:删除),fh,是,fh,无,fh,1Q313596790cuisine_id,fh,Integer,fh,归属菜系,fh,是,fh,无,fh,20Q313596790type_id,fh,Integer,fh,所属菜别,fh,是,fh,无,fh,20Q313596790menu_id,fh,String,fh,编号,fh,是,fh,无,fh,20Q313596790price,fh,String,fh,单价,fh,是,fh,无,fh,255Q313596790create_time,fh,String,fh,创建时间,fh,是,fh,无,fh,32Q313596790create_by,fh,String,fh,创建人,fh,是,fh,无,fh,64Q313596790modify_by,fh,String,fh,更新人,fh,是,fh,无,fh,64Q313596790modify_time,fh,String,fh,更新时间,fh,是,fh,无,fh,32Q313596790image1,fh,String,fh,图片1,fh,是,fh,无,fh,512Q313596790image2,fh,String,fh,图片2,fh,是,fh,无,fh,512Q313596790', '2016-10-29 13:03:11', '菜谱');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理');

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `sys_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `sys_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `sys_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `sys_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `sys_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `sys_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `sys_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for `sys_dictionaries`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('060ac5f4df9440e582a8887ac9de2b11', '粉红', 'pink', 'pink01', '1', 'd428594b0494476aa7338d9061e23ae3', '', '');
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', '1', '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', '3', '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', '2', '0', '课程', '');

-- ----------------------------
-- Table structure for `sys_featured`
-- ----------------------------
DROP TABLE IF EXISTS `sys_featured`;
CREATE TABLE `sys_featured` (
  `id` bigint(11) NOT NULL COMMENT '特别推荐ID',
  `title` varchar(200) DEFAULT NULL COMMENT '特别推荐标题',
  `content` varchar(300) DEFAULT NULL COMMENT '特别推荐内容',
  `url` varchar(300) DEFAULT NULL COMMENT '特别推荐连接地址',
  `heat` char(2) DEFAULT '0' COMMENT '热度  按1 2 3 4 5级',
  `stars` char(2) DEFAULT '0' COMMENT '星级  按1 2 3 4 5级',
  `sequence` int(10) DEFAULT '0' COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `uptime` datetime DEFAULT NULL COMMENT '修改时间',
  `status` char(2) DEFAULT '0' COMMENT '状态 0为未启用，1为启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_featured
-- ----------------------------
INSERT INTO `sys_featured` VALUES ('1', 'sss2', '<p>sss2</p>', 'ssss2', '3', '4', '2', '2014-12-01 22:44:24', '2014-12-01 22:44:36', '0');

-- ----------------------------
-- Table structure for `sys_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('4642244b3f1c472c9a9ec3e416d1670b', '周数据权限', 'to_week', '用户查看周数据权限');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('70bf8aaefd284745ab65e0910ecc90cf', '月数据权限', 'to_month', '用户查看月数据权限');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');

-- ----------------------------
-- Table structure for `sys_fhsms`
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('5a00aaeccb934c9f9139b858a3c7ed49', '1111111', '2', 'zhangnan', 'admin', '2016-05-05 09:35:14', '2', 'c313c9e13be54a91bc0521e9106b8c95');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '2', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('c1811d07fc0749888154599b9b994567', '1111111', '1', 'admin', 'zhangnan', '2016-05-05 09:35:14', '2', 'c313c9e13be54a91bc0521e9106b8c95');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for `sys_gl_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('034546cf9e19448fba0e44256c46351b', '4', '1', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('10fb8ee3ab91417ba91ec53a07e89704', '4', '0', '0', '0', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('8f4c7766385646d79da887512de8f343', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('a87c5c6787874876adf359dc00552466', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('c364b218fb49449c92d3f1561d71297d', '4', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sys_interceptor_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `sys_interceptor_statistics`;
CREATE TABLE `sys_interceptor_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(200) DEFAULT NULL,
  `username` varchar(255) DEFAULT '' COMMENT '访问人姓名',
  `ip` varchar(255) DEFAULT '' COMMENT '访问ip',
  `create_time` datetime DEFAULT NULL COMMENT '访问时间',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名字',
  `request_url` varchar(255) DEFAULT NULL COMMENT '访问地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16493 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_interceptor_statistics
-- ----------------------------
INSERT INTO `sys_interceptor_statistics` VALUES ('13497', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13498', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:04', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13499', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13500', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13501', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:17', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13502', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:18', '接口测试', 'tool/interfaceTest.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13503', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:20', '置二维码', 'tool/goTwoDimensionCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13504', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:22', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13505', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:27', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13506', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:43:40', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13507', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:39', '', 'createCode/deleteAll.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13508', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:39', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13509', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:43', '', 'createCode/deleteAll.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13510', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:43', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13511', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:45', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13512', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:52', '', 'createCode/deleteAll.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13513', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:52', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13514', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:44:55', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13515', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:45:07', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13516', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:45:08', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13517', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:49:49', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13518', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:49:59', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13519', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:50:03', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13520', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:51:51', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13521', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:52:14', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13522', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:52:21', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13523', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:56:44', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13524', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:56:54', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13525', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 12:58:11', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13526', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:03:11', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13527', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:03:21', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13528', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:04:36', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13529', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:24:08', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13530', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:24:17', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13531', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:25:00', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13532', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:25:16', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13533', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:26:15', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13534', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:28:29', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13535', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:31:27', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13536', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:31:37', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13537', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:32:11', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13538', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:34:22', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13539', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:34:32', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13540', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:34:37', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13541', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:34:51', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13542', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 13:35:01', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13543', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:07:24', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13544', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:09:47', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13545', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:09:55', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13546', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:10:05', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13547', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13548', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13549', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:12', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13550', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:12', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13551', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:14', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13552', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:16', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13553', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:20', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13554', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:11:30', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13555', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-29 14:15:50', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13556', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:00', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13557', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:01', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13558', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:14', '会员管理', 'happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13559', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:15', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13560', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:26', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13561', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:28', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13562', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13563', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13564', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:52', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13565', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:52', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13566', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:15:58', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13567', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:01', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13568', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:07', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13569', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:13', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13570', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:15', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13571', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:20', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13572', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:20', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13573', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:20', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13574', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:24', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13575', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:24', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13576', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:24', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13577', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:27', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13578', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:27', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13579', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:27', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13580', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:28', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13581', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:32', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13582', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:32', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13583', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:33', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13584', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:37', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13585', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:40', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13586', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:40', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13587', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:40', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13588', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:42', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13589', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:45', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13590', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:45', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13591', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:46', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13592', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:50', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13593', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:54', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13594', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:16:58', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13595', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:02', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13596', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:03', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13597', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:03', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13598', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:06', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13599', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:06', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13600', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:06', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13601', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:09', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13602', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:09', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13603', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:10', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13604', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:13', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13605', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:13', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13606', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:13', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13607', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:16', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13608', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:16', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13609', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:16', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13610', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:20', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13611', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:20', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13612', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:20', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13613', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:22', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13614', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:22', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13615', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:23', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13616', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:24', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13617', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:26', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13618', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:27', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13619', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:31', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13620', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:31', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13621', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:31', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13622', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:35', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13623', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:35', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13624', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:35', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13625', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:39', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13626', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:39', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13627', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:40', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13628', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:43', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13629', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:43', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13630', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:44', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13631', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:47', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13632', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:47', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13633', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:47', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13634', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:50', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13635', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:50', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13636', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:50', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13637', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:55', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13638', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:55', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13639', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:55', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13640', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:17:56', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13641', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:01', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13642', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:01', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13643', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:02', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13644', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:04', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13645', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:06', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13646', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:09', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13647', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:13', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13648', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:13', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13649', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:13', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13650', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:17', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13651', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:17', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13652', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:18', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13653', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:21', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13654', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:21', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13655', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:21', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13656', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:24', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13657', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:24', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13658', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:25', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13659', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:27', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13660', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:30', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13661', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:33', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13662', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:33', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13663', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:34', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13664', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:35', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13665', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:38', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13666', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:38', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13667', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:38', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13668', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:40', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13669', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:44', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13670', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:44', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13671', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:44', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13672', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:45', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13673', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:48', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13674', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:48', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13675', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:48', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13676', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:49', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13677', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:50', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13678', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:51', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13679', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:52', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13680', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:56', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13681', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:56', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13682', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:56', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13683', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:58', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13684', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:18:59', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13685', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:02', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13686', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:02', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13687', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:02', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13688', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:04', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13689', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:06', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13690', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:09', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13691', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:11', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13692', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:15', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13693', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:19', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13694', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:20', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13695', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:20', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13696', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:22', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13697', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:22', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13698', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:22', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13699', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:25', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13700', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:25', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13701', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:25', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13702', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:26', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13703', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:31', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13704', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:32', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13705', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:33', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13706', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:35', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13707', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:36', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13708', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:38', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13709', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:40', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13710', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:42', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13711', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:44', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13712', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:46', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13713', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:49', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13714', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:50', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13715', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:55', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13716', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:55', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13717', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:55', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13718', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:19:57', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13719', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:03', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13720', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:03', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13721', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:03', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13722', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:06', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13723', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:06', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13724', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:07', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13725', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:09', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13726', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:09', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13727', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:09', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13728', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:10', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13729', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:14', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13730', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:14', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13731', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:15', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13732', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:16', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13733', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:17', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13734', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:18', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13735', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:21', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13736', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:21', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13737', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:21', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13738', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13739', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:25', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13740', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:26', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13741', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:30', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13742', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:30', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13743', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:30', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13744', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:33', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13745', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:59', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13746', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:20:59', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13747', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:21:03', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13748', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:21:05', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13749', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:21:57', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13750', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:21:57', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13751', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:21:58', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13752', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:31', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13753', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:31', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13754', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:34', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13755', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:36', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13756', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:40', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13757', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:41', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13758', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:43', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13759', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:45', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13760', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:45', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13761', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:47', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13762', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:49', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13763', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:50', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13764', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:53', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13765', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:54', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13766', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:54', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13767', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:56', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13768', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:22:57', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13769', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:23:20', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13770', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:23:20', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13771', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:23:34', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13772', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:01', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13773', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:01', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13774', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:02', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13775', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:29', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13776', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:29', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('13777', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:33', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13778', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:42', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13779', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:49', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13780', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:50', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13781', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:52', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13782', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:53', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13783', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:55', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13784', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:57', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13785', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:24:59', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13786', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:00', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13787', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:14', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13788', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13789', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:17', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13790', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:30', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13791', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:31', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13792', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:32', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13793', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:34', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13794', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:35', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13795', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13796', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13797', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:43', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13798', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:46', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13799', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:51', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13800', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:25:52', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13801', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:02', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13802', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:04', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13803', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:04', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13804', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:06', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13805', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:09', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13806', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:10', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13807', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:12', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13808', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13809', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13810', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:19', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13811', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:21', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13812', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:22', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13813', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:25', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13814', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:26', '', 'menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13815', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:26:43', '', 'menutype/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13816', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:37:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13817', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:37:55', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13818', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:37:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13819', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:02', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13820', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:05', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13821', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:06', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13822', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:07', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13823', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:08', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13824', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13825', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13826', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13827', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:17', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13828', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:23', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13829', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:24', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13830', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:24', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13831', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:25', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13832', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:41', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13833', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:41', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13834', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:41', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13835', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:45', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13836', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:48', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13837', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13838', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13839', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:53', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13840', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:54', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13841', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:38:59', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13842', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:00', '', 'role/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13843', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13844', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:04', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13845', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:04', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13846', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:05', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13847', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:07', '', 'menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13848', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:39:14', '', 'menutype/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13849', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:36', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13850', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13851', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13852', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13853', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13854', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:43', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13855', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:44', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13856', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:47', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13857', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:48', '', 'menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13858', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:53', '', 'menutype/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13859', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:54', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13860', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:40:59', '', 'menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13861', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:41:05', '', 'menutype/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13862', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:41:05', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13863', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:41:07', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13864', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:41:11', '', 'menutype/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13865', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:41:11', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13866', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:29', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13867', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:29', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13868', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:30', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13869', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13870', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:34', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13871', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13872', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:35', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13873', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:37', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13874', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:40', '', 'user/goAddU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13875', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:53', '', 'user/hasN.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13876', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:44:59', '', 'user/hasN.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13877', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:18', '', 'user/hasE.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13878', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:20', '', 'user/hasU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13879', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:20', '', 'user/saveU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13880', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:20', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13881', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:26', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13882', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13883', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:45:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13884', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:01', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13885', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:01', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13886', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:03', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13887', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13888', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13889', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13890', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:06', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13891', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:08', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13892', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13893', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13894', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:13', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13895', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:15', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13896', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:15', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13897', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:17', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13898', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:18', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13899', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:19', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13900', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:22', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13901', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:26', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13902', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:27', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13903', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:31', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13904', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:32', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13905', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:35', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13906', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:36', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13907', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:38', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13908', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:40', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13909', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:42', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13910', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:44', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13911', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13912', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13913', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:46:59', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13914', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:00', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13915', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13916', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13917', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13918', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13919', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13920', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:13', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13921', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:15', '图片管理', 'pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13922', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13923', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13924', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:18', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13925', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:18', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13926', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:27', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13927', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:27', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13928', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:29', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13929', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:29', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13930', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:31', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13931', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:38', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13932', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:40', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13933', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:45', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13934', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:55', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13935', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:57', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13936', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:47:59', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13937', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:01', '', 'role/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13938', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:04', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13939', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:06', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13940', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:07', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13941', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:10', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13942', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13943', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:25', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13944', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:27', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13945', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:34', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13946', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:34', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13947', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:34', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13948', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:35', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13949', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:35', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13950', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:36', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13951', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:36', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13952', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:36', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13953', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:36', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13954', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:37', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13955', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:37', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13956', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:38', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13957', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:40', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13958', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:40', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13959', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:44', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13960', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:44', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13961', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:45', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13962', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:47', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13963', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:47', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13964', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:47', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13965', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13966', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13967', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:52', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13968', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:55', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13969', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:56', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13970', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:56', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13971', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:57', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13972', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:58', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13973', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:58', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13974', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:58', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13975', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 21:48:59', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13976', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:05:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13977', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:05:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13978', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:06:00', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13979', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:06:01', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13980', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:06:44', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13981', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:06:47', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13982', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:06:48', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13983', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:09:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13984', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:09:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13985', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:09:57', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('13986', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:09:58', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13987', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:22:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13988', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:22:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13989', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:22:56', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13990', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:26:08', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13991', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:26:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13992', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-30 22:26:10', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13993', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13994', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13995', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:16', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13996', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13997', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('13998', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:43', '用户提现管理', 'userDrawCash/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('13999', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:44', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14000', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:51', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14001', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:44:53', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14002', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:47:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14003', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:47:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14004', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:47:56', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14005', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:06', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14006', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:16', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14007', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:17', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14008', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:19', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14009', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:20', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14010', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:21', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14011', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:23', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14012', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:48:23', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14013', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14014', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14015', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:33', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14016', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:35', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14017', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:35', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14018', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:36', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14019', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:37', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14020', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:41', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14021', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:41', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14022', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:43', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14023', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:45', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14024', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:45', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14025', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:45', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14026', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:46', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14027', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14028', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:49:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14029', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:50:01', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14030', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:52:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14031', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:52:55', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14032', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:53:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14033', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:53:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14034', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:53:47', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14035', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:53:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14036', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:53:58', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14037', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:02', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14038', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14039', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14040', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:09', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14041', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:13', '', 'user/goEditU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14042', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:17', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14043', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:23', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14044', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:24', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14045', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:25', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14046', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14047', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14048', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:41', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14049', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:42', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14050', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:42', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14051', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:43', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14052', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:43', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14053', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:45', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14054', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:45', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14055', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:48', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14056', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:48', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14057', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:49', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14058', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:50', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14059', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:51', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14060', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:51', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14061', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:52', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14062', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 10:54:52', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14063', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:02', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14064', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:02', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14065', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:04', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14066', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:06', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14067', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:09', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14068', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:11', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14069', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:13', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14070', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:13', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14071', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:14', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14072', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:16', '', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14073', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14074', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14075', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:55:56', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14076', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:56:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14077', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:56:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14078', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:56:11', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14079', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:57:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14080', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:57:27', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14081', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:57:29', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14082', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:57:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14083', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:57:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14084', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:58:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14085', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:58:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14086', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:58:13', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14087', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14088', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14089', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14090', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:21', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14091', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:22', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14092', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:24', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14093', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:24', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14094', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:27', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14095', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:28', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14096', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:29', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14097', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:31', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14098', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:33', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14099', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:35', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14100', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:37', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14101', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:45', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14102', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:54', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14103', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:56', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14104', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 10:59:59', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14105', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:02', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14106', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:06', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14107', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:19', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14108', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:23', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14109', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14110', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14111', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:28', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14112', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:29', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14113', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:30', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14114', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:31', '', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14115', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:00:32', '', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14116', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14117', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14118', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14119', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14120', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:12', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14121', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:15', '', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14122', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:01:18', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14123', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:14:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14124', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:14:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14125', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:14:43', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14126', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:14:45', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14127', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:18:41', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14128', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:18:41', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14129', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:19:28', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14130', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:30', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14131', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:30', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14132', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:32', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14133', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:36', '用户提现管理', 'userDrawCash/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14134', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:43', '图片管理', 'pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14135', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:43', '', 'uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('14136', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:43', '', 'uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('14137', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:46', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14138', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:47', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14139', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:47', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14140', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:50', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14141', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:51', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14142', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:51', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14143', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:55', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14144', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:58', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14145', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:58', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14146', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:27:58', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14147', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:01', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14148', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:02', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14149', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:02', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14150', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:04', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14151', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:04', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14152', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:04', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14153', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:06', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14154', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:06', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14155', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:06', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14156', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:09', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14157', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:10', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14158', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:10', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14159', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:12', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14160', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:13', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14161', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:15', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14162', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:17', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14163', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:24', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14164', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:29', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14165', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:29', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14166', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:31', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14167', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:33', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14168', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:35', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14169', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:28:37', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14170', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:19', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14171', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:20', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14172', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14173', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:24', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14174', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:25', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14175', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:26', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14176', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:31', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14177', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:33', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14178', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:37', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14179', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:40', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14180', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:41', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14181', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:44', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14182', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:45', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14183', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:50', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14184', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:50', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14185', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:53', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14186', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:55', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14187', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:29:58', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14188', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:02', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14189', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:08', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14190', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:15', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14191', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:18', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14192', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:27', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14193', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:27', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14194', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:29', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14195', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:31', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14196', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:32', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14197', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:32', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14198', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:32', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14199', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 11:30:32', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14200', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:31:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14201', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:31:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14202', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:31:57', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14203', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:37:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14204', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:37:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14205', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:37:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14206', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:37:09', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14207', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:37:21', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14208', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:44:19', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14209', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:44:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14210', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:44:55', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14211', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:46:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14212', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:46:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14213', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:47:13', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14214', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:49:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14215', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:49:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14216', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:49:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14217', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:49:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14218', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:49:34', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14219', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:51:22', '商户列表', 'alliancebusiness/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14220', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:51:24', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14221', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:51:35', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14222', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:55:23', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14223', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:55:28', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14224', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:59:08', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14225', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:59:08', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14226', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 14:59:13', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14227', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:02:36', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14228', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:02:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14229', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:02:39', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14230', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:03:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14231', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:03:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14232', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:03:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14233', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:03:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14234', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:03:17', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14235', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:14:12', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14236', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:14:13', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14237', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:14:15', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14238', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:16:08', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14239', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:19:16', '', 'menutype/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14240', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:22:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14241', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:22:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14242', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:00', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14243', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:01', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14244', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:07', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14245', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:18', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14246', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:20', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14247', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14248', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:24', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14249', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:26', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14250', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:28', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14251', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:30', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14252', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:31', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14253', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:34', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14254', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:40', '', 'menu/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14255', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:23:43', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14256', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:30:19', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14257', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:30:19', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14258', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:30:24', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14259', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:14', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14260', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14261', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:18', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14262', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:20', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14263', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:21', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14264', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14265', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:25', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14266', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:32', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14267', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14268', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:31:36', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14269', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:19', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14270', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:34', '', 'menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14271', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:39', '', 'menutype/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14272', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:43', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14273', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14274', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 15:32:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14275', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:44:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14276', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:44:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14277', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:44:12', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14278', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:05', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14279', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14280', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14281', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14282', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14283', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14284', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14285', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14286', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14287', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:45:29', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14288', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:24', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14289', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:39', '站内信', 'fhsms/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14290', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:45', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14291', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:45', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14292', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:46', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14293', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14294', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14295', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:48:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14296', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 15:49:16', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14297', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:47:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14298', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:47:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14299', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:47:45', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14300', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:02', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14301', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:02', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14302', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:05', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14303', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:08', '按钮管理', 'fhbutton/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14304', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:08', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14305', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:09', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14306', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:11', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14307', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14308', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14309', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:15', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14310', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:37', '用户提现管理', 'userDrawCash/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14311', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:40', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14312', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:47', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14313', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:47', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14314', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:51', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14315', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:48:53', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14316', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:52:00', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14317', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:52:00', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14318', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:52:04', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14319', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:59:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14320', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:59:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14321', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 16:59:59', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14322', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:01:16', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14323', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:01', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14324', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:01', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14325', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:02', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14326', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:14', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14327', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14328', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14329', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:43', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14330', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:46', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14331', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:05:48', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14332', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:06:06', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14333', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:07:36', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14334', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:07:42', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14335', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14336', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14337', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:09', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14338', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:40', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14339', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:40', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14340', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:43', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14341', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:43', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14342', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:44', '', 'menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14343', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:46', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14344', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:49', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14345', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:52', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14346', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:52', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14347', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:52', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14348', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:53', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14349', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:56', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14350', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:57', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14351', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:57', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14352', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:08:58', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14353', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:01', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14354', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:02', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14355', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:02', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14356', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:04', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14357', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:04', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14358', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:04', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14359', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:07', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14360', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:07', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14361', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:07', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14362', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:10', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14363', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:11', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14364', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:14', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14365', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:14', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14366', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:14', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14367', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:16', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14368', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:16', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14369', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:16', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14370', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:19', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14371', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:19', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14372', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:19', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14373', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:21', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14374', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:21', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14375', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:21', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14376', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14377', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:25', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14378', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:26', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14379', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:26', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14380', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:27', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14381', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:29', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14382', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:30', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14383', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:32', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14384', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:32', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14385', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:32', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14386', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:35', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14387', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:35', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14388', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:35', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14389', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:37', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14390', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:37', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14391', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:37', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14392', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:39', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14393', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:39', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14394', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:40', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14395', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:41', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14396', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:44', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14397', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:44', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14398', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:44', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14399', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:45', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14400', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:48', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14401', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:49', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14402', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:49', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14403', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:51', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14404', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:53', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14405', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:56', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14406', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:56', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14407', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:56', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14408', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:09:58', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14409', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:00', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14410', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:01', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14411', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:01', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14412', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:02', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14413', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:05', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14414', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:05', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14415', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:05', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14416', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:06', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14417', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:07', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14418', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:10', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14419', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:11', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14420', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:11', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14421', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:14', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14422', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:14', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14423', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:14', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14424', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:17', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14425', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:17', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14426', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:17', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14427', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:19', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14428', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:19', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14429', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:19', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14430', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:21', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14431', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:22', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14432', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:22', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14433', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:24', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14434', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:24', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14435', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:24', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14436', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:26', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14437', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:26', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14438', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:26', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14439', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:28', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14440', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:28', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14441', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:29', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14442', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:31', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14443', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:31', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14444', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:31', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14445', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:33', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14446', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:34', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14447', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:34', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14448', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:36', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14449', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:36', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14450', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:36', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14451', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:38', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14452', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:38', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14453', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:38', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14454', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:40', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14455', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:40', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14456', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:40', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14457', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:42', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14458', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:42', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14459', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:42', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14460', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:43', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14461', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:47', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14462', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:48', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14463', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:48', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14464', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:49', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14465', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:52', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14466', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:52', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14467', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:52', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14468', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:53', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14469', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:55', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14470', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:10:57', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14471', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:00', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14472', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:00', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14473', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:00', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14474', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:02', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14475', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:02', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14476', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:02', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14477', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:04', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14478', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:04', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14479', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:05', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14480', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:07', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14481', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:07', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14482', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:07', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14483', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:09', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14484', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:09', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14485', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:09', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14486', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:11', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14487', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:11', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14488', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:11', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14489', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:12', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14490', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:15', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14491', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:16', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14492', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:16', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14493', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:17', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14494', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:20', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14495', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:20', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14496', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:20', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14497', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:23', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14498', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:23', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14499', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:23', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14500', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:25', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14501', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:27', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14502', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:27', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14503', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:28', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14504', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:29', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14505', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:29', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14506', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:31', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14507', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:31', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14508', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:31', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14509', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:33', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14510', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:33', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14511', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:33', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14512', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:35', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14513', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:36', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14514', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:36', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14515', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:37', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14516', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:38', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14517', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:38', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14518', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:40', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14519', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:40', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14520', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:40', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14521', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:41', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14522', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:45', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14523', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:45', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14524', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:45', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14525', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:46', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14526', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:47', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14527', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:51', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14528', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:52', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14529', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:11:55', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14530', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:12:10', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14531', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:12:22', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14532', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:12:39', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14533', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:12:43', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14534', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14535', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:13', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14536', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:15', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14537', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:24', '用户提现管理', 'userDrawCash/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14538', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:26', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14539', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:58', '会员管理', 'happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14540', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:15:59', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14541', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:16:04', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14542', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:16:10', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14543', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:04', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14544', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:07', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14545', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:23', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14546', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:23', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14547', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:25', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14548', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:26', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14549', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:28', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14550', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:31', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14551', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:31', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14552', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:31', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14553', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:34', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14554', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:34', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14555', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:34', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14556', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:36', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14557', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:36', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14558', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:36', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14559', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:38', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14560', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:41', '', 'menu/delete.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14561', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:41', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14562', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:41', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14563', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:44', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14564', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:44', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14565', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:45', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14566', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:17:45', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14567', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14568', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:06', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14569', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:10', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14570', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:11', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14571', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:13', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14572', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:14', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14573', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:47', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14574', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:47', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14575', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:18:50', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14576', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:19:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14577', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:19:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14578', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:19:40', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14579', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:23:25', '会员管理', 'happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14580', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:23:29', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14581', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:30', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14582', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:30', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14583', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:32', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14584', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:36', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14585', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:41', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14586', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:46', '会员管理', 'happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14587', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:27:48', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14588', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14589', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:04', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14590', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:07', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14591', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14592', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14593', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:15', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14594', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:17', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14595', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:17', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14596', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14597', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14598', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:22', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14599', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14600', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14601', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:28', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14602', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:30', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14603', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:34', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14604', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:35', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14605', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:39', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14606', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:40', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14607', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:44', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14608', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:46', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14609', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:48', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14610', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:28:53', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14611', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14612', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14613', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:05', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14614', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:08', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14615', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:12', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14616', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:15', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14617', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:30', '图片管理', 'pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14618', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:31', '', 'uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('14619', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:31', '', 'uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('14620', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:34', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14621', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:34', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14622', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:40', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14623', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:41', '按钮权限', 'buttonrights/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14624', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:44', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14625', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:29:46', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14626', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:03', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14627', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14628', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14629', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:05', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14630', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:12', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14631', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:12', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14632', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:14', '图片管理', 'pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14633', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:14', '', 'uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('14634', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:14', '', 'uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('14635', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:17', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14636', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:19', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14637', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14638', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14639', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:28', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14640', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:31', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14641', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:36', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14642', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:39', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14643', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:44', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14644', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:44', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14645', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:45', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14646', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:49', '图片管理', 'pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14647', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:49', '', 'uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('14648', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:49', '', 'uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('14649', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:51', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14650', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:51', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14651', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14652', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14653', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14654', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:58', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14655', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:59', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14656', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:30:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14657', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:02', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14658', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:03', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14659', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:08', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14660', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:08', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14661', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:09', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14662', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14663', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14664', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:19', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14665', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:19', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14666', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:22', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14667', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:24', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14668', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:25', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14669', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:26', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14670', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:31:28', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14671', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:37:13', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14672', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:37:16', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14673', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:37:42', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14674', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:37:58', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14675', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:37:58', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14676', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:00', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14677', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:04', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14678', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:04', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14679', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:05', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14680', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:07', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14681', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:46', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14682', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:49', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14683', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:51', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14684', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14685', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14686', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:56', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14687', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:38:58', '', 'user/goEditU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14688', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14689', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14690', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:40', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14691', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:45', '', 'user/goEditU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14692', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:56', '', 'user/editU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14693', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:47:56', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14694', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:48:01', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14695', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:48:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14696', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:48:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14697', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:48:10', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14698', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:48:21', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14699', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14700', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14701', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:09', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14702', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:13', '', 'user/goEditU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14703', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:18', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14704', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:18', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14705', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:20', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14706', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:22', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14707', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14708', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14709', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:28', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14710', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14711', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14712', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:34', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14713', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:35', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14714', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:39', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14715', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:40', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14716', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:52:41', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14717', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14718', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14719', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:13', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14720', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14721', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:57', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14722', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:57', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14723', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14724', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:53:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14725', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:00', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14726', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:02', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14727', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:02', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14728', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:04', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14729', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:06', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14730', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:07', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14731', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:11', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14732', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:13', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14733', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:18', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14734', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:19', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14735', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:23', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14736', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:24', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14737', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:27', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14738', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:33', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14739', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:36', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14740', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:44', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14741', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:44', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14742', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:46', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14743', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:52', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14744', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:52', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14745', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:52', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14746', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:52', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14747', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:53', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14748', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:53', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14749', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:53', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14750', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:53', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14751', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:53', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14752', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14753', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14754', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:54', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14755', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:55', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14756', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:55', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14757', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:55', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14758', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:55', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14759', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:56', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14760', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:58', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14761', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:58', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14762', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:58', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14763', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:58', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14764', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:59', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14765', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:59', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14766', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:54:59', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14767', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14768', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14769', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14770', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14771', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14772', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14773', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-10-31 17:56:13', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14774', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:58:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14775', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:58:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14776', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:58:34', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14777', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:59:17', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14778', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 17:59:40', '', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14779', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 18:18:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14780', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 18:18:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14781', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 18:18:32', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14782', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-10-31 18:18:45', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14783', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 21:48:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14784', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 21:48:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14785', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 21:48:55', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14786', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 21:48:56', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14787', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:14', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14788', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14789', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:27', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14790', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14791', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14792', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:56', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14793', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:56', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14794', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:58', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14795', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:49:59', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14796', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:50:13', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14797', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:50:13', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14798', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:51:17', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14799', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:51:31', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14800', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:51:31', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14801', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:00', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14802', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:04', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14803', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:05', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14804', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:07', '菜单管理', 'menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14805', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:07', '', '/menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14806', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:10', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14807', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:23', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14808', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:23', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14809', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:42', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14810', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:43', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14811', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:55', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14812', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:53:55', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14813', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:54:24', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14814', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:54:48', '', 'menu/add.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14815', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:54:48', '', 'menu/');
INSERT INTO `sys_interceptor_statistics` VALUES ('14816', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:54:50', '', 'menu/toAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14817', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:11', '', 'menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14818', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:13', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14819', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:14', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14820', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:17', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14821', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:49', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14822', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:51', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14823', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:54', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14824', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:55:56', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14825', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:00', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14826', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:01', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14827', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:05', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14828', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:11', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14829', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:15', '', 'role/saveMenuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14830', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:47', '', 'role/menuqx.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14831', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14832', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14833', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:56:52', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14834', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:24', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14835', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:24', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14836', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:27', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14837', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:29', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14838', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:38', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14839', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:39', '', 'role/b4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14840', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:42', '', 'role/saveB4Button.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14841', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14842', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:57:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14843', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:58:05', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14844', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:58:06', '', 'user/goAddU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14845', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 21:59:22', '', 'user/goAddU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14846', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:00', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14847', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:00', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14848', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:03', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14849', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:06', '', 'user/goAddU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14850', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14851', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:21', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14852', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:23', '角色(基础权限)', 'role.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14853', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:40', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14854', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:02:41', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14855', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:03:20', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14856', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14857', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:21', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14858', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:23', '系统用户', 'user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14859', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:33', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14860', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14861', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:42', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14862', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:44', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14863', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:46', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14864', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:05:47', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14865', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:06:22', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14866', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:06:26', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14867', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:06:31', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14868', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:06:41', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14869', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14870', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14871', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:12', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14872', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:12', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14873', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14874', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14875', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:14', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14876', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14877', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14878', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14879', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:23', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14880', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:24', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14881', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:28', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14882', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:07:35', '', 'cuisine/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14883', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:32', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14884', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14885', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:34', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14886', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:35', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14887', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:37', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14888', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:42', '', 'cuisine/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14889', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:43', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14890', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:46', '', 'cuisine/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14891', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:51', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14892', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:12:52', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14893', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:03', '', 'foodinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14894', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:03', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14895', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:06', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14896', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:22', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14897', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:22', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14898', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:23', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14899', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:25', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('14900', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-01 22:13:27', '', 'vipuserinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14901', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:23:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14902', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:23:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14903', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:23:42', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14904', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:26:10', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14905', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:27:47', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14906', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:27:48', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14907', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:27:48', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14908', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:27:54', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14909', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:28:56', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14910', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:28:59', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14911', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:17', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14912', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14913', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14914', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14915', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14916', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14917', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:31:36', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14918', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14919', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:33', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14920', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:34', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14921', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:35', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14922', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:44', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14923', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:32:54', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14924', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:33:00', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14925', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:33:11', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14926', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:33:16', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14927', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:33:25', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14928', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:37:34', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14929', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:37:34', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14930', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:37:36', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14931', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:38:02', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14932', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:38:49', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14933', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:38:51', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14934', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:38:51', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14935', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:38:51', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14936', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14937', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:06', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14938', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14939', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:07', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14940', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:27', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14941', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:27', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14942', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:28', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14943', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:39:29', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14944', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:40:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14945', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:40:42', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14946', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:40:43', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14947', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:40:55', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14948', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:41:00', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14949', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:41:00', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14950', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:41:12', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14951', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:17', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14952', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:17', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14953', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:18', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14954', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14955', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:35', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14956', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14957', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:37', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14958', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:46:52', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14959', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:47:17', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14960', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14961', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14962', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:15', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14963', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14964', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14965', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:28', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14966', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:29', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14967', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:41', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14968', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:43', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14969', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:50', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14970', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:48:50', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14971', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:36', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14972', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14973', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:37', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14974', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:38', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14975', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:42', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14976', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:45', '', 'menutype/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14977', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:45', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14978', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:49', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14979', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:49', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14980', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:52', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14981', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:51:55', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14982', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14983', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14984', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:29', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('14985', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:30', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14986', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:44', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14987', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:48', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14988', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:56', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14989', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:53:56', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14990', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:54:00', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14991', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:54:01', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14992', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:54:02', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14993', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14994', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14995', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:51', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14996', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:53', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14997', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:54', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14998', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:54', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('14999', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:54', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15000', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:55', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15001', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:55', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15002', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:55', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15003', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:56:58', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15004', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:00', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15005', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:02', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15006', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:02', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15007', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:03', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15008', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:05', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15009', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:06', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15010', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:18', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15011', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 21:57:33', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15012', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15013', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15014', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15015', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:11', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15016', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:21', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15017', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:22', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15018', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:22', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15019', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:23', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15020', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:23', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15021', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:26', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15022', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:26', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15023', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:27', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15024', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:27', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15025', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:31', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15026', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:32', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15027', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:34', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15028', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:51', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15029', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:52', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15030', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:00:56', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15031', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:00', '', 'menutype/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15032', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:02', '', 'menutype/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15033', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:02', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15034', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:06', '', 'menutype/editStatus.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15035', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:06', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15036', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-02 22:01:09', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15037', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:21:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15038', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:21:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15039', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:21:18', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15040', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:22:41', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15041', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:22:50', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15042', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:19', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15043', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:24', '', 'cuisine/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15044', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:29', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15045', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:45', '', 'cuisine/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15046', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:45', '', 'cuisine/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15047', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:47', '', 'cuisine/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15048', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:50', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15049', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:57', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15050', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:23:59', '', 'cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15051', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:06', '', 'cuisine/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15052', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:06', '', 'cuisine/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15053', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:08', '', 'cuisine/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15054', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:10', '', 'cuisine/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15055', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:11', '', 'cuisine/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15056', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:13', '', 'cuisine/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15057', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:16', '', 'cuisine/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15058', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:21', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15059', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:24:35', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15060', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:27:15', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15061', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:27:41', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15062', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:51:40', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15063', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:51:40', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15064', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:51:41', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15065', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:51:42', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15066', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:54:59', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15067', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:54:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15068', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:55:00', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15069', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:55:01', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15070', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:55:59', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15071', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:56:09', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15072', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:58:14', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15073', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:59:54', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15074', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:59:58', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15075', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:59:59', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15076', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 21:59:59', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15077', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:00:07', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15078', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15079', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15080', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:28', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15081', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:29', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15082', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:46', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15083', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:52', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15084', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:01:55', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15085', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:02:20', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15086', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:02:23', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15087', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:02:26', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15088', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:04:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15089', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:04:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15090', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:04:40', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15091', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:04:40', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15092', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:05:12', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15093', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15094', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15095', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:09', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15096', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:12', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15097', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:38', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15098', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:10:40', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15099', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:03', '', 'foodinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15100', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:03', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15101', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:05', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15102', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:08', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15103', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:09', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15104', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:10', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15105', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:12', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15106', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:15', '', 'foodinfo/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15107', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:15', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15108', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:18', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15109', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:24', '', 'foodinfo/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15110', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:24', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15111', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:11:44', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15112', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:03', '', 'foodinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15113', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:03', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15114', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:14', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15115', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:21', '', 'foodinfo/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15116', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:22', '', 'foodinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15117', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:43', '', 'foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15118', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:50', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15119', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:51', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15120', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:52', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15121', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:55', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15122', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:12:58', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15123', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:14', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15124', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:22', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15125', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:24', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15126', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:25', '', 'vipuserinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15127', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:41', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15128', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:42', '', 'foodinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15129', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:45', '菜系管理', 'cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15130', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:47', '', 'cuisine/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15131', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:49', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15132', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:52', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15133', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-03 22:13:56', '菜谱管理', 'foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15134', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:55:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15135', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:55:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15136', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:55:17', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15137', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:55:27', '', 'vipuserinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15138', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:56:03', '', 'vipuserinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15139', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:57:47', '', 'vipuserinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15140', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:57:47', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15141', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 19:58:19', '', 'vipuserinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15142', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:08:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15143', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:08:25', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15144', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:08:26', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15145', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:08:27', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15146', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15147', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15148', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:05', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15149', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:08', '', 'vipuserinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15150', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:29', '', 'vipuserinfo/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15151', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:30', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15152', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:32', '', 'vipuserinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15153', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:35', '', 'vipuserinfo/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15154', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:35', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15155', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:37', '', 'vipuserinfo/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15156', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:41', '', 'vipuserinfo/edit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15157', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:41', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15158', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:10:50', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15159', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:00', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15160', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:03', '', 'vipuserinfo/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15161', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:13', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15162', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:15', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15163', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:25', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15164', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 20:11:43', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15165', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:26:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15166', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:26:22', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15167', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:26:27', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15168', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:26:29', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15169', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:26:31', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15170', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:37:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15171', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:37:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15172', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:37:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15173', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:37:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15174', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:37:35', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15175', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15176', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15177', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:29', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15178', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:30', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15179', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:32', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15180', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:47', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15181', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:48', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15182', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:48', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15183', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:49', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15184', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15185', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:38:52', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15186', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15187', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15188', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:44', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15189', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:47', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15190', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:49', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15191', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15192', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:55', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15193', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:39:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15194', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:40:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15195', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:40:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15196', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:40:04', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15197', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:40:05', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15198', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-06 21:40:06', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15199', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:31:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15200', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:31:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15201', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:31:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15202', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:31:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15203', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:31:59', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15204', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:41:25', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15205', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:41:27', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15206', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15207', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15208', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:10', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15209', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:19', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15210', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:19', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15211', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15212', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:21', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15213', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:46:24', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15214', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:49:48', '接口测试', 'tool/interfaceTest.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15215', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:49:49', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15216', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:50:02', '', 'createCode/goProductCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15217', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:50:13', '', 'createCode/proCode.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15218', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:50:23', '代码生成', 'createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15219', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:27', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15220', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:27', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15221', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:28', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15222', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:29', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15223', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:29', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15224', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:32', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15225', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15226', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:48', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15227', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:48', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15228', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15229', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:53', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15230', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:55:56', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15231', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15232', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15233', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:20', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15234', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:22', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15235', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:23', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15236', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15237', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15238', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:40', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15239', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:42', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15240', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 20:58:43', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15241', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:00:57', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15242', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:00:57', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15243', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:00:57', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15244', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:00:58', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15245', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:00:59', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15246', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:05:11', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15247', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:05:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15248', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:05:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15249', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:05:12', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15250', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:05:14', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15251', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:08:57', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15252', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:08:57', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15253', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:08:58', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15254', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:08:59', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15255', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:09:00', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15256', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:11:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15257', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:11:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15258', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:11:04', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15259', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:11:06', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15260', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:11:07', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15261', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:12:17', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15262', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:12:17', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15263', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:12:18', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15264', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:12:24', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15265', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:12:25', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15266', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15267', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:35', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15268', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15269', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:37', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15270', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:39', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15271', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15272', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15273', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15274', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:54', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15275', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:14:55', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15276', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:16:24', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15277', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:16:24', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15278', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:16:25', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15279', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:16:26', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15280', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:16:27', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15281', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:14', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15282', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15283', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:15', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15284', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:16', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15285', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:17', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15286', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:51', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15287', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:51', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15288', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15289', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:55', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15290', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:17:57', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15291', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15292', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15293', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15294', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:12', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15295', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:14', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15296', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:32', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15297', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15298', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:33', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15299', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:34', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15300', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:18:35', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15301', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:19:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15302', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:19:06', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15303', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:19:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15304', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:19:07', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15305', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:19:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15306', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:05', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15307', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15308', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15309', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:07', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15310', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15311', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15312', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15313', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:40', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15314', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:41', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15315', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:25:42', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15316', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15317', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:14', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15318', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:14', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15319', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:16', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15320', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:17', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15321', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15322', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15323', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15324', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15325', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:26:35', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15326', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:32', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15327', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15328', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:33', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15329', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15330', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:35', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15331', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15332', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15333', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15334', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:54', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15335', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:27:56', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15336', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15337', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15338', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:16', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15339', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:18', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15340', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:19', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15341', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:53', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15342', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:53', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15343', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:54', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15344', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:55', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15345', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:28:56', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15346', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15347', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15348', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:21', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15349', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:21', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15350', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:23', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15351', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:45', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15352', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:45', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15353', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:46', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15354', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:47', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15355', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:34:49', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15356', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:52:37', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15357', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:52:37', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15358', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:52:38', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15359', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:52:41', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15360', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:52:42', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15361', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:55:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15362', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:55:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15363', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:55:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15364', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:55:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15365', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 21:55:34', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15366', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:05:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15367', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:05:33', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15368', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:05:46', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15369', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:05:47', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15370', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:05:50', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15371', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:08:59', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15372', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:08:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15373', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:09:01', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15374', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:09:08', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15375', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:09:14', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15376', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:09:27', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15377', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:10:33', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15378', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:12:45', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15379', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:12:45', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15380', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:12:45', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15381', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:12:47', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15382', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:12:49', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15383', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15384', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:35', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15385', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15386', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:37', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15387', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:38', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15388', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15389', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15390', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15391', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:54', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15392', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:13:55', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15393', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15394', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:06', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15395', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:07', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15396', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:09', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15397', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:10', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15398', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:13', '', 'consumemanager/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15399', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:15:16', '', 'consumemanager/save.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15400', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-07 22:16:21', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15401', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:53:44', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15402', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:53:44', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15403', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:58:43', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15404', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:58:47', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15405', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:58:52', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15406', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:09', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15407', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15408', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15409', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15410', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15411', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:34', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15412', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 20:59:39', '', 'consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15413', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:36', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15414', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15415', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:37', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15416', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:38', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15417', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:39', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15418', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:59', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15419', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:07:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15420', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:08:00', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15421', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:18:00', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15422', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:18:00', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15423', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:18:11', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15424', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:18:12', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15425', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:20:30', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15426', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:20:30', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15427', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:20:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15428', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:20:32', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15429', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:20:33', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15430', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:21:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15431', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:21:08', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15432', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:21:09', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15433', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:21:10', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15434', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:21:11', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15435', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:01', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15436', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:01', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15437', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:02', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15438', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:03', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15439', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:04', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15440', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:28', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15441', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:28', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15442', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:29', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15443', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:30', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15444', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:23:31', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15445', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15446', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15447', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15448', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:07', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15449', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15450', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:34', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15451', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:34', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15452', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:35', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15453', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:35', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15454', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:24:37', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15455', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15456', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15457', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15458', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:12', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15459', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:14', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15460', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15461', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15462', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:27:59', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15463', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:00', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15464', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:01', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15465', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:13', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15466', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:13', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15467', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:15', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15468', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:19', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15469', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:20', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15470', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15471', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:33', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15472', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:34', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15473', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:35', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15474', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:37', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15475', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15476', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15477', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:51', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15478', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:52', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15479', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:53', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15480', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15481', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15482', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:28:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15483', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15484', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15485', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:03', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15486', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:05', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15487', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:06', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15488', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:21', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15489', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:21', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15490', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:22', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15491', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:24', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15492', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:29:25', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15493', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15494', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:25', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15495', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:26', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15496', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:27', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15497', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:28', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15498', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:46', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15499', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:46', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15500', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:47', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15501', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:48', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15502', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:30:49', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15503', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15504', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:08', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15505', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:08', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15506', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:13', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15507', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:15', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15508', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15509', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:35', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15510', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15511', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:37', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15512', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:38', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15513', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15514', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15515', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15516', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:57', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15517', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:31:58', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15518', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:32:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15519', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:32:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15520', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:32:17', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15521', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:32:18', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15522', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:32:19', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15523', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15524', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15525', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:04', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15526', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:04', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15527', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:05', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15528', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15529', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15530', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:44', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15531', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:45', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15532', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:33:46', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15533', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15534', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15535', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:17', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15536', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:18', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15537', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:19', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15538', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15539', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15540', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:51', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15541', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:52', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15542', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:34:54', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15543', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:23', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15544', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:23', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15545', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:25', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15546', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:26', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15547', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:27', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15548', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:47', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15549', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:47', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15550', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:48', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15551', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:48', '菜类别管理', 'menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15552', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:50', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15553', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:35:51', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15554', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:47:36', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15555', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:47:37', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15556', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:47:42', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15557', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:47:57', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15558', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:48:02', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15559', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:51:08', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15560', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:55:53', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15561', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 21:55:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15562', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:00:34', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15563', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:00:34', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15564', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:00:35', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15565', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:00:37', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15566', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:01:58', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15567', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:01:58', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15568', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:02:05', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15569', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:02:07', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15570', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:02:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15571', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:02:59', '', 'dummy.html');
INSERT INTO `sys_interceptor_statistics` VALUES ('15572', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:13:19', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15573', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:13:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15574', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:13:21', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15575', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:13:21', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15576', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-08 22:13:23', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15577', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 20:58:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15578', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 20:58:10', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15579', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 20:58:11', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15580', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 20:58:13', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15581', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:13:24', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15582', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:13:24', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15583', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:13:25', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15584', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:13:27', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15585', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:13:29', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15586', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:17:56', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15587', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:17:56', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15588', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:17:57', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15589', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:17:58', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15590', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:17:59', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15591', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15592', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15593', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:09', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15594', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:12', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15595', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:24', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15596', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15597', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15598', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15599', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:53', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15600', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:20:55', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15601', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:21:20', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15602', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:21:20', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15603', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:21:21', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15604', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:21:23', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15605', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:21:25', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15606', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:22:42', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15607', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:22:42', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15608', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:22:43', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15609', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:22:44', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15610', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:22:45', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15611', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:07', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15612', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15613', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:09', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15614', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:10', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15615', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:11', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15616', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15617', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:33', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15618', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:34', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15619', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:35', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15620', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:23:37', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15621', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:24:49', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15622', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:24:49', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15623', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:24:50', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15624', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:24:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15625', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:24:52', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15626', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:25:18', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15627', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:25:18', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15628', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:25:19', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15629', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:25:20', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15630', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:25:21', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15631', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:29:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15632', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:29:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15633', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:29:44', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15634', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:29:45', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15635', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:29:47', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15636', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:31:54', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15637', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:33:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15638', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:33:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15639', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:33:55', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15640', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:33:56', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15641', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:33:57', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15642', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:15', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15643', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:15', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15644', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:16', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15645', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:17', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15646', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:18', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15647', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15648', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15649', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15650', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15651', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:35:34', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15652', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:10', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15653', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:11', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15654', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:11', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15655', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:12', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15656', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:13', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15657', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15658', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15659', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:39', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15660', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:39', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15661', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:36:40', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15662', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15663', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:05', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15664', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:06', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15665', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:07', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15666', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15667', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:33', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15668', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:33', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15669', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:36', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15670', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:37', 'vip管理', 'vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15671', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:39', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15672', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:40', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15673', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15674', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15675', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15676', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:54', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15677', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:37:55', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15678', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:41:51', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15679', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:41:51', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15680', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:41:52', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15681', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:41:52', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15682', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:41:53', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15683', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:42:19', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15684', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:42:19', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15685', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:42:20', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15686', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:42:20', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15687', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:42:21', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15688', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:43:43', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15689', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:43:43', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15690', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:43:43', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15691', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:44:06', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15692', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:44:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15693', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:47:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15694', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:47:25', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15695', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:47:26', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15696', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:47:27', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15697', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:47:27', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15698', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:48:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15699', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:48:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15700', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:48:11', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15701', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:48:12', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15702', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:49:26', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15703', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:49:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15704', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:49:26', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15705', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:49:28', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15706', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:49:29', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15707', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:50:03', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15708', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:50:03', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15709', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:50:04', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15710', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:50:05', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15711', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:50:06', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15712', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:51:24', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15713', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:51:24', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15714', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:51:27', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15715', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:51:29', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15716', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:52:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15717', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:52:31', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15718', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:52:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15719', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:52:35', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15720', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:52:36', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15721', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:53:06', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15722', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:53:07', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15723', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:53:07', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15724', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:53:08', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15725', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:53:09', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15726', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:55:09', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15727', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:55:09', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15728', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:55:13', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15729', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:55:14', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15730', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:58:49', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15731', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:58:49', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15732', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:58:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15733', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:58:52', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15734', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:59:41', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15735', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:59:41', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15736', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:59:43', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15737', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 21:59:44', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15738', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:00:25', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15739', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:00:26', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15740', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:00:26', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15741', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:00:57', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15742', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:00:58', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15743', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:01:55', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15744', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:01:55', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15745', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:01:56', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15746', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:01:57', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15747', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:01:58', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15748', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:02:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15749', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:02:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15750', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:02:17', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15751', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:02:18', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15752', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:02:19', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15753', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:03:39', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15754', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:03:39', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15755', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:03:40', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15756', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:03:40', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15757', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:03:41', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15758', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:04:00', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15759', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:04:00', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15760', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:04:01', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15761', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:04:03', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15762', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:04:04', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15763', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:06:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15764', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:06:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15765', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:06:51', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15766', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:06:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15767', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:06:52', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15768', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:08:06', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15769', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:08:57', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15770', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:09:24', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15771', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:12:38', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15772', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:12:38', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15773', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:12:38', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15774', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:12:39', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15775', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:12:40', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15776', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:13:48', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15777', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:13:48', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15778', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:13:49', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15779', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:13:50', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15780', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:13:51', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15781', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:16:35', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15782', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:16:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15783', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:16:37', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15784', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:16:38', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15785', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:16:39', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15786', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:16', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15787', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:16', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15788', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:16', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15789', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:17', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15790', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:18', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15791', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:54', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15792', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:54', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15793', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:55', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15794', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:57', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15795', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15796', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/bootstrap.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15797', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/font-awesome.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15798', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/jquery-ui.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15799', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/datepicker.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15800', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/ui.jqgrid.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15801', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/ace-fonts.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15802', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15803', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/css/ace.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15804', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15805', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('15806', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/js/ace-extra.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15807', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15808', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15809', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:58', '', 'assets/js/ace/elements.scroller.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15810', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.colorpicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15811', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15812', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.wysiwyg.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15813', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.fileinput.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15814', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.typeahead.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15815', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.treeview.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15816', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.spinner.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15817', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.aside.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15818', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/elements.wizard.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15819', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/ace.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15820', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:18:59', '', 'assets/js/ace/ace.touch-drag.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15821', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:01', '', 'assets/js/ace/ace.ajax-content.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15822', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:02', '', 'assets/js/ace/ace.sidebar.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15823', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:04', '', 'assets/js/ace/ace.widget-box.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15824', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:05', '', 'assets/js/ace/ace.settings-rtl.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15825', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:06', '', 'assets/js/ace/ace.submenu-hover.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15826', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:06', '', 'assets/js/ace/ace.settings-skin.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15827', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:06', '', 'assets/js/ace/ace.settings.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15828', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:06', '', 'assets/js/ace/ace.sidebar-scroll-1.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15829', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:06', '', 'assets/js/ace/ace.widget-on-reload.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15830', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/js/ace/elements.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15831', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/js/ace/ace.searchbox-autocomplete.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15832', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/js/ace/ace.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15833', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'docs/assets/js/language/generic.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15834', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'docs/assets/js/rainbow.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15835', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'docs/assets/js/language/css.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15836', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'docs/assets/js/language/html.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15837', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15838', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('15839', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('15840', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('15841', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('15842', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'docs/assets/js/language/javascript.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('15843', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('15844', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:19:07', '', 'assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('15845', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:21:49', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15846', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:21:49', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15847', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:21:50', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15848', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:21:51', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15849', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:21:52', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15850', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:36', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15851', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:36', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15852', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:37', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15853', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:38', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15854', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:39', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15855', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:52', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15856', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:52', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15857', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:53', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15858', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:53', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15859', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:22:54', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15860', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:23:50', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15861', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:23:50', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15862', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:23:51', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15863', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:23:52', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15864', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:23:53', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15865', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:31', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15866', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:32', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15867', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:32', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15868', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:33', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15869', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:35', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15870', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:59', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15871', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:24:59', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15872', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:00', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15873', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:01', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15874', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:02', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15875', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:22', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15876', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:22', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15877', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:23', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15878', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:24', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15879', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:25:25', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15880', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:26:04', '', 'tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15881', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:26:04', '', 'head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15882', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:26:05', '', 'favicon.ico');
INSERT INTO `sys_interceptor_statistics` VALUES ('15883', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:26:07', '会员消费管理', 'consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15884', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-09 22:26:08', '', 'consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15885', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:46:20', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15886', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:46:25', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15887', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:48:40', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15888', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:48:42', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15889', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:48:44', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15890', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:48:45', '', 'restaurant/cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15891', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 10:48:46', '', 'restaurant/foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15892', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:46:18', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15893', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:46:20', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15894', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:46:24', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15895', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:46:25', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15896', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:49:15', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15897', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:49:15', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15898', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:49:17', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15899', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:49:18', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15900', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:52:57', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15901', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:52:58', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15902', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:00', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15903', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:01', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15904', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:50', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15905', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:50', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15906', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:52', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15907', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-14 13:53:53', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15908', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:37', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15909', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:38', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15910', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:40', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15911', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:42', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15912', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:43', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15913', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:09:43', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15914', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:15:54', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15915', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:15:54', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15916', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:15:56', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15917', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:15:57', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15918', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:23:32', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15919', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:29:37', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15920', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:29:37', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15921', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:29:38', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15922', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:29:40', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15923', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:30:15', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15924', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:30:16', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15925', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:30:17', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15926', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:30:18', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15927', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:04', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15928', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:04', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15929', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:05', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15930', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:06', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15931', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:07', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15932', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:34', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15933', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:34', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15934', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:35', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15935', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:31:36', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15936', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:33:37', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15937', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:33:37', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15938', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:33:38', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15939', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:33:39', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15940', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:35:49', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15941', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:35:49', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15942', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:35:50', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15943', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:35:51', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15944', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:36:31', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15945', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:36:31', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15946', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:36:32', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15947', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:36:33', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15948', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:37:33', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15949', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:37:33', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15950', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:37:34', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15951', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:37:36', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15952', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:17', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15953', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:17', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15954', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:19', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15955', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:20', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15956', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:55', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15957', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:55', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15958', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:57', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15959', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:38:58', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15960', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:39:43', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15961', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:39:43', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15962', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:39:45', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15963', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:39:46', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15964', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:40:35', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15965', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:40:35', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15966', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:40:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15967', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:40:37', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15968', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:42:17', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15969', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:42:17', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15970', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:43:58', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15971', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:43:58', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15972', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:44:00', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15973', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:44:01', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15974', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:45:01', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15975', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:49:21', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15976', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:49:21', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15977', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:49:22', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15978', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-21 18:49:23', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15979', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:10:44', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15980', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:10:45', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15981', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:10:47', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15982', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:10:48', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15983', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:10:56', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15984', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:04', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15985', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:08', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15986', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:09', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15987', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:09', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15988', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:12', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15989', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:11:47', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15990', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:17:58', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15991', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:17:58', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15992', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:18:01', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('15993', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:18:03', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('15994', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:18:11', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15995', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:20:15', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('15996', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:21:54', '', 'restaurant/consumemanager/save');
INSERT INTO `sys_interceptor_statistics` VALUES ('15997', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:26:14', '', 'restaurant/consumemanager/save');
INSERT INTO `sys_interceptor_statistics` VALUES ('15998', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:26:44', '', 'restaurant/consumemanager/save');
INSERT INTO `sys_interceptor_statistics` VALUES ('15999', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:28', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16000', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:28', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16001', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:30', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16002', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:31', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16003', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:40', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16004', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:29:53', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16005', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:03', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16006', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:03', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16007', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:06', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16008', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:07', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16009', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:29', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16010', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:35', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16011', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:32:51', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16012', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:34', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16013', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:35', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16014', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:35', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16015', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16016', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16017', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16018', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:33:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16019', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:27', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16020', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:27', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16021', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:30', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16022', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:31', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16023', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:38', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16024', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:34:50', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16025', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:33', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16026', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:33', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16027', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:35', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16028', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:36', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16029', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:41', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16030', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:35:59', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16031', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:36:37', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16032', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:19', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16033', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:19', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16034', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:22', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16035', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:25', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16036', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:27', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16037', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:38:42', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16038', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:39:23', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16039', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:39:24', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16040', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:39:25', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16041', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:39:35', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16042', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:38', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16043', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:38', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16044', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:40', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16045', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:41', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16046', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:43', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16047', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:41:50', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16048', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:45:50', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16049', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:45:50', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16050', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:45:51', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16051', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:45:52', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16052', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:45:54', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16053', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-22 18:46:01', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16054', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:16', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16055', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:16', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16056', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:21', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16057', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:21', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16058', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:32', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16059', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:32', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16060', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:34', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16061', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:34', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16062', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:55', '', 'restaurant/menu/listAllMenu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16063', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:13:56', '', 'restaurant//menu.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16064', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:14:00', '', 'restaurant/menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16065', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:14:05', '', 'restaurant/menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16066', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:14:11', '', 'restaurant/menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16067', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:14:13', '', 'restaurant/menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16068', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-11-29 10:14:14', '', 'restaurant/menu/toEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16069', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:28', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16070', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:28', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16071', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:31', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16072', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:36', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16073', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:41', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16074', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:47', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16075', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:41:49', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16076', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:50', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16077', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:50', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16078', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:52', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16079', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16080', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/bootstrap.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16081', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/jquery-ui.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16082', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/datepicker.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16083', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/font-awesome.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16084', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/ui.jqgrid.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16085', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/ace-fonts.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16086', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16087', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16088', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/ace.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16089', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/js/ace-extra.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16090', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16091', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16092', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:54', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16093', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16094', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.scroller.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16095', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.typeahead.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16096', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.colorpicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16097', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.fileinput.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16098', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.wysiwyg.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16099', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.spinner.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16100', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.treeview.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16101', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.aside.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16102', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.wizard.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16103', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16104', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.ajax-content.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16105', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.touch-drag.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16106', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.sidebar.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16107', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.submenu-hover.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16108', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.settings.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16109', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.settings-rtl.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16110', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.sidebar-scroll-1.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16111', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.widget-box.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16112', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.settings-skin.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16113', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.widget-on-reload.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16114', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.searchbox-autocomplete.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16115', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/elements.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16116', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/ace/ace.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16117', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/docs/assets/js/rainbow.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16118', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/docs/assets/js/language/generic.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16119', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/docs/assets/js/language/css.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16120', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16121', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/docs/assets/js/language/html.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16122', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:55', '', 'restaurant/docs/assets/js/language/javascript.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16123', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16124', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16125', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16126', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16127', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16128', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16129', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16130', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16131', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16132', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16133', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/ace/elements.scroller.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16134', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:56', '', 'restaurant/assets/js/ace/elements.colorpicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16135', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.fileinput.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16136', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.typeahead.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16137', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.wysiwyg.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16138', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.spinner.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16139', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.treeview.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16140', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.wizard.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16141', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/elements.aside.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16142', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:57', '', 'restaurant/assets/js/ace/ace.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16143', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.ajax-content.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16144', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.touch-drag.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16145', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.sidebar.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16146', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.sidebar-scroll-1.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16147', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.submenu-hover.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16148', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.widget-box.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16149', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.settings.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16150', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.settings-rtl.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16151', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.settings-skin.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16152', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.widget-on-reload.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16153', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:58', '', 'restaurant/assets/js/ace/ace.searchbox-autocomplete.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16154', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16155', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16156', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/assets/js/ace/elements.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16157', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/assets/js/ace/ace.onpage-help.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16158', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/docs/assets/js/rainbow.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16159', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/docs/assets/js/language/generic.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16160', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/docs/assets/js/language/html.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16161', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:57:59', '', 'restaurant/docs/assets/js/language/css.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16162', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:58:00', '', 'restaurant/docs/assets/js/language/javascript.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16163', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:58:06', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16164', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 12:58:06', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16165', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:19', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16166', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:19', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16167', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:21', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16168', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16169', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16170', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16171', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16172', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16173', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16174', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16175', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16176', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16177', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16178', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:23', '', 'restaurant/assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16179', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16180', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16181', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16182', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16183', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16184', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:24', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16185', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:25', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16186', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:25', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16187', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:25', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16188', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:28', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16189', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:04:28', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16190', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:05', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16191', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:05', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16192', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:07', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16193', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16194', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16195', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16196', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16197', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16198', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16199', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16200', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16201', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16202', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16203', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16204', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16205', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:09', '', 'restaurant/assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16206', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16207', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16208', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16209', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16210', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16211', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16212', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:10', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16213', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:11', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16214', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:11', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16215', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:30', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16216', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:30', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16217', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:32', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16218', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16219', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16220', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16221', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16222', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16223', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16224', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16225', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16226', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16227', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16228', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16229', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16230', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16231', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16232', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:34', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16233', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:35', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16234', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:35', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16235', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:35', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16236', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:35', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16237', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:35', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16238', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:44', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16239', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:05:44', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16240', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:10', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16241', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:10', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16242', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:12', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16243', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16244', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/user.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16245', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/avatar.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16246', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/avatar2.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16247', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/avatar4.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16248', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/avatar3.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16249', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/avatars/avatar5.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16250', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16251', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16252', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16253', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16254', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:13', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16255', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16256', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/jquery.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16257', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/bootstrap.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16258', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/date-time/bootstrap-datepicker.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16259', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/jqGrid/jquery.jqGrid.src.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16260', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/js/jqGrid/i18n/grid.locale-en.js');
INSERT INTO `sys_interceptor_statistics` VALUES ('16261', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16262', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:14', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16263', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:32', '', 'restaurant/docs/assets/js/themes/sunburst.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16264', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:06:32', '', 'restaurant/assets/css/ace.onpage-help.css');
INSERT INTO `sys_interceptor_statistics` VALUES ('16265', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:09:10', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16266', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:09:10', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16267', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:09:12', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16268', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:09:13', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16269', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:09:15', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16270', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:06', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16271', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:06', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16272', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:08', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16273', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:09', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16274', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:11', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16275', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:25', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16276', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:12:27', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16277', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:13:19', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16278', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:13:19', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16279', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:13:21', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16280', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:13:22', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16281', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:13:24', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16282', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:14:27', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16283', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:14:27', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16284', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:14:28', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16285', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:14:30', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16286', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:14:32', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16287', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:17:19', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16288', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:17:19', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16289', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:17:20', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16290', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:17:28', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16291', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:17:35', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16292', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:18:15', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16293', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:18:17', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16294', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:18:17', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16295', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:18:19', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16296', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:20:52', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16297', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:20:52', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16298', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:20:55', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16299', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:20:58', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16300', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:21:28', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16301', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:21:28', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16302', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:21:30', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16303', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:21:34', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16304', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:22:09', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16305', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:22:09', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16306', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:22:10', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16307', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:22:13', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16308', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:22:24', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16309', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:24:35', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16310', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:24:35', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16311', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:24:36', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16312', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:24:38', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16313', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:24:40', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16314', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:00', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16315', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:00', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16316', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:03', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16317', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:05', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16318', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:14', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16319', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:30', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16320', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:30', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16321', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:32', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16322', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:34', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16323', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:31:36', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16324', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:35:06', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16325', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:35:06', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16326', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:35:08', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16327', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:35:10', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16328', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:36:49', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16329', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:36:49', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16330', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:36:52', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16331', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:36:55', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16332', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:37:04', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16333', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:37:06', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16334', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:31', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16335', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:31', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16336', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:33', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16337', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:35', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16338', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:41', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16339', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:43', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16340', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:38:44', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16341', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:35', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16342', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:35', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16343', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:36', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16344', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:37', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16345', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:38', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16346', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:39:40', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16347', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:40:21', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16348', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:40:21', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16349', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:40:23', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16350', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:40:24', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16351', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:40:25', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16352', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:14', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16353', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:14', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16354', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:15', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16355', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:17', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16356', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:19', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16357', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:48', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16358', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:48', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16359', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:50', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16360', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:51', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16361', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:42:52', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16362', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:54:37', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16363', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:54:38', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16364', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:54:39', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16365', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:54:41', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16366', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:54:43', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16367', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:56:08', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16368', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:56:08', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16369', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:56:13', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16370', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:56:14', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16371', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:56:16', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16372', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:57:41', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16373', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:57:41', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16374', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:57:43', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16375', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:57:48', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16376', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 13:57:49', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16377', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:05:52', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16378', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:05:55', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16379', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:06:43', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16380', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:06:43', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16381', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:06:44', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16382', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:06:46', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16383', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:06:47', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16384', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:09:12', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16385', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:09:12', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16386', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:09:13', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16387', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:09:15', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16388', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:09:16', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16389', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:04', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16390', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:04', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16391', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:06', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16392', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:09', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16393', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:21', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16394', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:23', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16395', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:23', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16396', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:33:25', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16397', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:36:42', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16398', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:36:42', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16399', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:36:44', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16400', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:36:46', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16401', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:37:04', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16402', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:37:13', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16403', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:37:33', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16404', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:37:45', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16405', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:37:58', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16406', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:38:17', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16407', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:38:34', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16408', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:39:48', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16409', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:39:55', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16410', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:40:02', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16411', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:40:09', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16412', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:40:20', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16413', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:40:22', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16414', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:51:50', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16415', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:51:50', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16416', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:51:51', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16417', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 14:51:52', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16418', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 15:04:21', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16419', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 15:04:21', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16420', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 15:04:23', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16421', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 15:04:26', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16422', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:27', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16423', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:27', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16424', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:31', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16425', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:31', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16426', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:33', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16427', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:34', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16428', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:42', '', 'restaurant/consumemanager/deleteAll.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16429', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:42', '', 'restaurant/consumemanager/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16430', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:44', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16431', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:56', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16432', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:56', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16433', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:01:59', '', 'restaurant/user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16434', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:06', '', 'restaurant/user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16435', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:12', '', 'restaurant/user/goEditU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16436', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:27', '', 'restaurant/user/editU.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16437', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:28', '', 'restaurant/user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16438', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:37', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16439', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:02:37', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16440', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:04:51', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16441', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:04:51', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16442', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:16', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16443', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:18', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16444', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:47', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16445', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:47', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16446', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:48', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16447', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:48', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16448', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:05:49', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16449', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:19', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16450', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:21', '', 'restaurant/menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16451', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:31', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16452', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:31', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16453', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:32', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16454', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:34', '', 'restaurant/menutype/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16455', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:58', '', 'restaurant/cuisine/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16456', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:06:59', '', 'restaurant/cuisine/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16457', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:07:18', '', 'restaurant/foodinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16458', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:07:20', '', 'restaurant/foodinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16459', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:07:50', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16460', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:07:52', '', 'restaurant/vipuserinfo/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16461', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:08:07', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16462', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:08:10', '', 'restaurant/consumemanager/goAdd.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16463', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:09:00', '', 'restaurant/consumemanager/findUserByParams');
INSERT INTO `sys_interceptor_statistics` VALUES ('16464', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:09:17', '', 'restaurant/consumemanager/saveCustmer');
INSERT INTO `sys_interceptor_statistics` VALUES ('16465', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:09:25', '', 'restaurant/consumemanager/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16466', 'dc37b4409653436caffea62d070d7f37', 'tk', '0:0:0:0:0:0:0:1', '2016-12-03 16:09:27', '', 'restaurant/consumemanager/goEdit.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16467', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:44', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16468', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:45', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16469', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:49', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16470', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:51', '', 'restaurant/user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16471', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:53', '', 'restaurant/happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16472', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:58', '', 'restaurant/pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16473', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:58', '', 'restaurant/uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16474', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:12:58', '', 'restaurant/uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16475', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:03', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16476', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:12', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16477', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:13', '', 'restaurant/user/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16478', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:14', '', 'restaurant/happuser/listUsers.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16479', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:16', '', 'restaurant/pictures/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16480', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:16', '', 'restaurant/uploadFiles/uploadImgs/20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg');
INSERT INTO `sys_interceptor_statistics` VALUES ('16481', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:16', '', 'restaurant/uploadFiles/uploadImgs/20160125/5e6ba5ad3067482e9a8063b0627ee983.png');
INSERT INTO `sys_interceptor_statistics` VALUES ('16482', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:18', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16483', '11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:18', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16484', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:28', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16485', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:28', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16486', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:31', '', 'restaurant/menutype/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16487', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:33', '', 'restaurant/vipuserinfo/list');
INSERT INTO `sys_interceptor_statistics` VALUES ('16488', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:46', '', 'restaurant/tab.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16489', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:46', '', 'restaurant/head/getList.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16490', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:52', '', 'restaurant/createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16491', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:55', '', 'restaurant/createCode/list.do');
INSERT INTO `sys_interceptor_statistics` VALUES ('16492', '1', 'admin', '0:0:0:0:0:0:0:1', '2016-12-30 09:13:57', '', 'restaurant/createCode/list.do');

-- ----------------------------
-- Table structure for `sys_link`
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接ID',
  `stiename` varchar(100) DEFAULT NULL COMMENT '友情链接网站名称',
  `sitecontent` varchar(200) DEFAULT NULL COMMENT '友情链接网站内容',
  `type` char(2) DEFAULT '0' COMMENT '类型  0为文字连接，1为图片连接',
  `stieurl` varchar(200) DEFAULT NULL COMMENT '图片连接地址',
  `addtime` varchar(50) DEFAULT NULL COMMENT '添加时间',
  `uptime` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `status` char(2) DEFAULT '0' COMMENT '状态  0为未启用，1为启用',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `tourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO `sys_link` VALUES ('1', 'sdfsd2222', '<p>sdfsd222</p>', '1', 'acf1784d058149d3a1b6349f5c89d208.png', '2014-12-02 13:49:59', '2014-12-02 13:53:55', '0', '3', 'sdf222');
INSERT INTO `sys_link` VALUES ('2', 'sdfs', '<p>sdfsdf</p>', '0', '438994ecc7fe42539db7daa2b9b0a9d0.png', '2015-04-19 03:00:49', '2015-04-19 03:00:49', '0', '2', 'sdfsdf');
INSERT INTO `sys_link` VALUES ('3', '水电费水电费', '<p>水电费水电费水电费<br/></p>', '1', '', '2015-06-16 16:23:38', '2015-06-16 16:23:38', '1', '0', '水电费');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', 'pictures/list.do', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '1', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '1', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '6', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '代码生成', 'createCode/list.do', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('49', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '1', '5', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', '站内信', 'fhsms/list.do', '6', '2', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('97', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('98', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('99', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('100', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('101', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('102', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('103', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('104', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('105', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('106', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('107', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('108', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('109', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('110', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('111', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('112', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('113', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('114', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('115', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('116', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('118', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('119', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('120', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('121', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('122', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('123', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('124', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('125', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('126', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('127', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('128', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('129', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('130', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('131', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('132', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('133', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('134', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('135', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('136', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('137', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('139', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('140', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('141', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('142', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('143', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('144', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('145', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('146', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('147', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('148', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('149', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('150', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('151', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('152', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('153', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('154', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('155', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('156', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('157', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('158', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('160', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('161', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('162', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('163', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('164', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('165', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('166', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('167', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('168', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('169', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('170', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('171', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('172', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('173', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('174', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('175', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('176', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('177', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('178', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('179', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('181', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('182', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('183', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('184', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('185', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('186', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('187', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('188', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('189', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('190', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('191', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('192', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('193', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('194', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('195', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('196', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('197', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('198', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('199', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('200', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('253', '餐饮管理', '#', '0', '1.1', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('254', '菜类别管理', 'menutype/list.do', '253', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('255', '菜系管理', 'cuisine/list', '253', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('256', '菜谱管理', 'foodinfo/list', '253', '3', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('257', '会员管理', '#', '0', '1.2', 'menu-icon fa fa-leaf black', '2', '1');
INSERT INTO `sys_menu` VALUES ('258', 'vip管理', 'vipuserinfo/list', '257', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('259', '会员消费管理', 'consumemanager/list', '257', '3', 'menu-icon fa fa-leaf black', '1', '1');

-- ----------------------------
-- Table structure for `sys_news`
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `title` varchar(150) DEFAULT NULL COMMENT '新闻标题',
  `content` text COMMENT '新闻内容',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布人',
  `addtime` varchar(50) DEFAULT NULL COMMENT '发布时间',
  `uptime` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `pip` varchar(50) DEFAULT NULL COMMENT '发布IP',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `sequence` int(10) DEFAULT '0' COMMENT '排序',
  `recommand` char(2) DEFAULT '0' COMMENT '推荐  0默认未推荐，1推荐',
  `status` char(2) DEFAULT '0' COMMENT '状态  0默认未发布，1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_news
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` varchar(500) NOT NULL COMMENT '公告内容',
  `publisher` varchar(50) NOT NULL COMMENT '公告发布人',
  `addtime` datetime NOT NULL COMMENT '公告发布时间',
  `uptime` datetime NOT NULL COMMENT '修改时间',
  `status` char(2) NOT NULL DEFAULT '0' COMMENT '状态  0默认未启用，1启用',
  `sequence` int(10) DEFAULT '0' COMMENT '公告排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_order_pay_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_pay_detail`;
CREATE TABLE `sys_order_pay_detail` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `order_id` int(32) DEFAULT NULL,
  `order_price` decimal(32,2) DEFAULT NULL,
  `coupon_price` decimal(32,2) DEFAULT NULL,
  `group_pay_sn` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(32) DEFAULT NULL,
  `product_type` varchar(32) DEFAULT NULL,
  `create_real_name` varchar(32) DEFAULT NULL,
  `cash_price` decimal(32,2) DEFAULT NULL,
  `plus_time` decimal(10,2) DEFAULT NULL,
  `site_code` varchar(32) DEFAULT NULL,
  `online_price` decimal(32,2) DEFAULT NULL,
  `balance_price` decimal(32,2) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2323 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_order_pay_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '911862709955665456623266090670712463738966743169922158462392500799718223273926', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '43422033463993573283839119378257965444976244249615211514796594002967423615234', '2', '43422033463993573283839119378257965444976244249615211514796594002967423614976', '911862702743865038960621506943417274344501129241919441810728474062315895914496', '911862702743865038960621506943417274344501129241919441810728474062315895914496', '911862702743865038960621506943417274344501129241919441810728474062315895914496');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '498', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('299aca59074d42b79f9b5df80b0d734f', '平台市场部', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '43422040675793990946483703105553154839441858177617928166460620740369750974406', '1', '43422033463993573283839119378257965444976244249615211514796594882508009529094', '43422033463993573283839119378257965444976244249615211514796596008407916371910', '54304707332786879099523241229434863398415390419767803581924321444422180954054', '54304721217271715154263819278074909943425137018741783545539123158986731315142');
INSERT INTO `sys_role` VALUES ('42f9dacfc4b840098961dbb05bca5fce', '家政总经理', '1838199416642394602349189387012920537170661006567043954126389146125620933033984', 'e6ac26f052124b999c81aa6a266fb10d', '1838199416642394602349189387012920537170661006567043954126389146125620933033984', '1838199416642394602349189387012920537170661006567043954126389146125620933033984', '1838199416642394602349189387012920537170661006567043954126389146125620933033984', '1838199416642394602349189387012920537170661006567043954126389146125620933033984');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5d13af7e030c469288dcd5408af5279f', '加盟商管理组', '931791240388612611877710672166602491663383406991206594313391196155288748032', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5d9c5347b9ee4017a80960025b7fc3eb', '专员', '28048697153382562240842991668702502832238765464540806208135066326413606912', 'e6ac26f052124b999c81aa6a266fb10d', '215679573337205118357336120696157045389097155389769312814568172421120', '0', '0', '215679573337205118357336120696157045389102107149926508378863297363968');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '911862709955665456623266090670712463738966743169922158462392500799718223273926', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('6d8737f0bae14caca1133fd3507adcef', '门店员工组', '931791240388612611877710672166602491663383406991206594313391196155288748032', '5d13af7e030c469288dcd5408af5279f', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('7391db8c470d4d629b35f006371dff11', '店长组', '931791240388612611877710672166602491663383406991206594313391196155288748032', '5d13af7e030c469288dcd5408af5279f', '0', '0', '0', '53919893334301279589334030174039261347274288845081199005402748944384');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '498', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('b2b413847c4742f5b200f64a3a9e661a', '市场专员', '15762598695796736', '299aca59074d42b79f9b5df80b0d734f', '0', '0', '0', '15762598695796736');
INSERT INTO `sys_role` VALUES ('be4f3b0fb11147e0b608961381979af8', '陈亮测试', '931791187587276711424229033831821290860958524080572740670258669134794457088', 'e6ac26f052124b999c81aa6a266fb10d', '931790970787500435813991519454296652284519320114779548039382070406695354368', '0', '0', '931790970787500435813991519454296652284519320114779548039382070406695354368');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('da87f8a15f844b4db5fdab03214dc0e3', '加盟商组', '2741097848692452489881306790974249268074346526263617770522357246472721793024', '5d13af7e030c469288dcd5408af5279f', '28048913097856422165967377947364565987540127262276393015546638361964838912', '28048737856557581129487506569611531177383398115854825633595239671535763456', '28048737858203085686808712611766500359940748620837637057092545449207791616', '2741099142769892513112016934990973445016618860846550052469836339446013755392');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '911862709955665456623266090670712463738966743169922158462392500799718223273926', '1', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('dfa9e63aa1f64a6b8b1cd920efad5436', '政委组', '931791240388612611877710672166602491663383406991206594313391196155288748032', '5d13af7e030c469288dcd5408af5279f', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('e3c3065a337348fe96b56db67f956182', '站长', '216799776275610237514377524638576439203965793192630876598728099102720', 'e6ac26f052124b999c81aa6a266fb10d', '215679573337205118357336120696157045389097155389769312814568172421120', '0', '0', '215679573337205118357336120696157045389102107149926508378863297363968');
INSERT INTO `sys_role` VALUES ('e6ac26f052124b999c81aa6a266fb10d', '家政事业部', '216799776275610237514377524638576439203965793192630876598728099102720', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_role_fhbutton`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('071b7473b88246baa2911cd62158ff50', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('14b5c28ea6ae4508b57d2d272ab3d5f1', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('3768e60edd1c4b5c9f1dd861188ae2f9', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('3f25f90e90a842ed8c447b7b8e5a6d69', '3264c8e83d0248bb9e3ea6195b4c0216', '70bf8aaefd284745ab65e0910ecc90cf');
INSERT INTO `sys_role_fhbutton` VALUES ('5fe6e8abf826481a9e5c4d1f9c80dcf7', 'e3c3065a337348fe96b56db67f956182', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('9412d1d05162464c83658c7f89ab03f0', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('96567633dd3548c9b75d28f430adf5a3', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('a1478f27c852459fa9cad04b642f4fb7', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ba6696b8761044618e44c7e02c9ba89e', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('d2dc53c41c2b4297be8fdd25fa9e01b6', '42f9dacfc4b840098961dbb05bca5fce', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('e0ed1f4a9e2742278da1b261e2ebf6cc', '5d9c5347b9ee4017a80960025b7fc3eb', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ec4ad2517e664645a96f682e04b85b3e', 'da87f8a15f844b4db5fdab03214dc0e3', '70bf8aaefd284745ab65e0910ecc90cf');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for `sys_submiturl`
-- ----------------------------
DROP TABLE IF EXISTS `sys_submiturl`;
CREATE TABLE `sys_submiturl` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '网址提交ID',
  `category` char(2) NOT NULL DEFAULT '0' COMMENT '网址类别',
  `urlname` varchar(100) DEFAULT NULL COMMENT '网站名次',
  `proxy` varchar(300) DEFAULT NULL COMMENT '网站代理地址',
  `websiteurl` varchar(300) DEFAULT NULL COMMENT '网站地址',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `status` char(2) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_submiturl
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `bus_id` int(10) DEFAULT NULL COMMENT '关联加盟商id',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2016-12-30 09:13:27', '0:0:0:0:0:0:0:1', '0', '最高统治者', 'default', 'QQ313596790@main.com', '001', '18788888888', null);
INSERT INTO `sys_user` VALUES ('11cb8fa4b5cd45cf81b2e90895a4baa3', 'tankun', 'ecc1eaa492edc9fb3059c75a2d8165419e23a712', '谭坤', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-12-30 09:12:40', '0:0:0:0:0:0:0:1', '0', '', 'default', '15xxx2@163.com', 'tankun01', '15xxxxxxx5', null);

-- ----------------------------
-- Table structure for `sys_user_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('31ca2f51e63f4f57aaa390b1ad35d07a', '22', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('afe7fcb8bcfc4a83a205222f3330ad07', '1', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_zidian`
-- ----------------------------
DROP TABLE IF EXISTS `sys_zidian`;
CREATE TABLE `sys_zidian` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_zidian
-- ----------------------------

-- ----------------------------
-- Table structure for `tableaftersaveattr`
-- ----------------------------
DROP TABLE IF EXISTS `tableaftersaveattr`;
CREATE TABLE `tableaftersaveattr` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `model` varchar(30) NOT NULL COMMENT '表名',
  `text` text NOT NULL COMMENT '表数据',
  `aid` smallint(4) NOT NULL COMMENT '操作的管理员',
  `create_time` int(10) NOT NULL,
  `model_pk` int(11) NOT NULL,
  `action` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=536104 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tableaftersaveattr
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_line`
-- ----------------------------
DROP TABLE IF EXISTS `tb_line`;
CREATE TABLE `tb_line` (
  `LINE_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '名称',
  `LINE_URL` varchar(255) DEFAULT NULL COMMENT '链接',
  `LINE_ROAD` varchar(255) DEFAULT NULL COMMENT '线路',
  `TYPE` varchar(255) DEFAULT NULL COMMENT '类型',
  `LINE_ORDER` int(10) DEFAULT NULL COMMENT '排序',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父类ID',
  PRIMARY KEY (`LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_line
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_pictures`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('b06010340ee54cfab49b8bfbe2387557', '图片', '5e6ba5ad3067482e9a8063b0627ee983.png', '20160125/5e6ba5ad3067482e9a8063b0627ee983.png', '2016-01-25 16:49:44', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('c9f1eca620c94c27bfa7028c66911f41', '图片', '928da750ec8542ceb7b2495f45ea6a9e.jpg', '20160125/928da750ec8542ceb7b2495f45ea6a9e.jpg', '2016-01-25 16:49:44', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for `temp_coupon_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `temp_coupon_mobile`;
CREATE TABLE `temp_coupon_mobile` (
  `mobile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_coupon_mobile
-- ----------------------------

-- ----------------------------
-- Table structure for `temp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `temp_menu`;
CREATE TABLE `temp_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_key` varchar(255) DEFAULT NULL COMMENT 'key值',
  `create_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_menu
-- ----------------------------
INSERT INTO `temp_menu` VALUES ('1', '订单管理', 'order', '2016-02-27 14:53:07', '0');
INSERT INTO `temp_menu` VALUES ('2', '订单列表', 'order:list', '2016-02-27 14:53:36', '1');
INSERT INTO `temp_menu` VALUES ('3', '外包单', 'order:longList', '2016-02-27 15:56:30', '1');
INSERT INTO `temp_menu` VALUES ('4', '财务管理', 'finance', '2016-02-27 15:57:58', '0');
INSERT INTO `temp_menu` VALUES ('5', '对账', 'finance:list', '2016-02-27 15:58:25', '4');
INSERT INTO `temp_menu` VALUES ('6', '退款', 'finance:refund', '2016-02-27 15:58:40', '4');
INSERT INTO `temp_menu` VALUES ('7', '退款测试', 'finance:refund2', '2016-02-27 17:09:48', '6');

-- ----------------------------
-- Table structure for `temp_role`
-- ----------------------------
DROP TABLE IF EXISTS `temp_role`;
CREATE TABLE `temp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_role
-- ----------------------------
INSERT INTO `temp_role` VALUES ('1', '超级管理员', 'admin');
INSERT INTO `temp_role` VALUES ('2', '一般管理员', 'commonadmin');
INSERT INTO `temp_role` VALUES ('3', '会员', 'uiyuan');

-- ----------------------------
-- Table structure for `temp_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `temp_role_user`;
CREATE TABLE `temp_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_role_user
-- ----------------------------
INSERT INTO `temp_role_user` VALUES ('14', '3', '1');

-- ----------------------------
-- Table structure for `temp_user`
-- ----------------------------
DROP TABLE IF EXISTS `temp_user`;
CREATE TABLE `temp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_user
-- ----------------------------
INSERT INTO `temp_user` VALUES ('1', 'admin', '3dded6d52053a8f498bd14d221a4ab81', 'ff5a686310a241af9b119eeac5a99109', '张楠');
INSERT INTO `temp_user` VALUES ('2', '22', '3311', null, null);
INSERT INTO `temp_user` VALUES ('3', '65567', '768567', null, '7856');
INSERT INTO `temp_user` VALUES ('4', '羊肉汤', '也', null, '55');
INSERT INTO `temp_user` VALUES ('5', '流量', 'ii', null, '喝喝');
