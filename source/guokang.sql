/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : guokang

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-01-22 13:58:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ecs_account_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_account_log`;
CREATE TABLE `ecs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_account_other_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_account_other_log`;
CREATE TABLE `ecs_account_other_log` (
  `user_id` mediumint(8) NOT NULL,
  `order_id` mediumint(8) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_type` varchar(20) NOT NULL,
  `pay_time` varchar(10) NOT NULL,
  `change_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_account_other_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_ad
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad`;
CREATE TABLE `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad
-- ----------------------------
INSERT INTO `ecs_ad` VALUES ('1', '1', '0', '国康恒大年金险', '', '1516067665751559785.jpg', '1516032000', '1576425600', '', '', '', '6', '1');
INSERT INTO `ecs_ad` VALUES ('2', '1', '0', '国康恒大年金险1', '', '1516074639593859271.jpg', '1516032000', '1550160000', '', '', '', '1', '1');
INSERT INTO `ecs_ad` VALUES ('3', '1', '0', '国康恒大年金险2', '', '1516072943430943720.jpg', '1516032000', '1550160000', '', '', '', '2', '1');
INSERT INTO `ecs_ad` VALUES ('4', '3', '0', '一分钟快速了解国康', '', '1516181631773911275.jpg', '1516118400', '1550246400', '', '', '', '0', '1');
INSERT INTO `ecs_ad` VALUES ('5', '4', '0', '产品中心', '', '1516258933346182311.jpg', '1516204800', '1581868800', '', '', '', '0', '1');
INSERT INTO `ecs_ad` VALUES ('6', '5', '0', '页面右下角', 'index.php', '1516325748342744474.jpg', '1516291200', '1581955200', '', '', '', '0', '1');
INSERT INTO `ecs_ad` VALUES ('7', '6', '0', '新闻详情', '', '1516346453340453827.jpg', '1516291200', '1581955200', '', '', '', '0', '1');
INSERT INTO `ecs_ad` VALUES ('8', '7', '0', '新闻列表', '', '1516346665617173166.jpg', '1516291200', '1581955200', '', '', '', '0', '1');
INSERT INTO `ecs_ad` VALUES ('9', '8', '0', '品牌体系列表', '', '1516351426745506195.jpg', '1516291200', '1581955200', '', '', '', '0', '1');

-- ----------------------------
-- Table structure for ecs_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_action`;
CREATE TABLE `ecs_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(20) NOT NULL DEFAULT '',
  `relevance` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`action_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_action
-- ----------------------------
INSERT INTO `ecs_admin_action` VALUES ('1', '0', 'goods', '');
INSERT INTO `ecs_admin_action` VALUES ('2', '0', 'cms_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('3', '0', 'users_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('4', '0', 'priv_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('5', '0', 'sys_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('6', '0', 'order_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('7', '0', 'promotion', '');
INSERT INTO `ecs_admin_action` VALUES ('8', '0', 'email', '');
INSERT INTO `ecs_admin_action` VALUES ('9', '0', 'templates_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('10', '0', 'db_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('11', '0', 'sms_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('12', '0', 'lead_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('13', '0', 'certificate_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('21', '1', 'goods_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('22', '1', 'remove_back', '');
INSERT INTO `ecs_admin_action` VALUES ('23', '1', 'cat_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('24', '1', 'cat_drop', 'cat_manage');
INSERT INTO `ecs_admin_action` VALUES ('25', '1', 'attr_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('26', '1', 'brand_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('27', '1', 'comment_priv', '');
INSERT INTO `ecs_admin_action` VALUES ('84', '1', 'tag_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('30', '2', 'article_cat', '');
INSERT INTO `ecs_admin_action` VALUES ('31', '2', 'article_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('32', '2', 'shopinfo_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('33', '2', 'shophelp_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('34', '2', 'vote_priv', '');
INSERT INTO `ecs_admin_action` VALUES ('35', '7', 'topic_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('74', '4', 'template_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('73', '3', 'feedback_priv', '');
INSERT INTO `ecs_admin_action` VALUES ('38', '3', 'integrate_users', '');
INSERT INTO `ecs_admin_action` VALUES ('39', '3', 'sync_users', 'integrate_users');
INSERT INTO `ecs_admin_action` VALUES ('40', '3', 'users_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('41', '3', 'users_drop', 'users_manage');
INSERT INTO `ecs_admin_action` VALUES ('42', '3', 'user_rank', '');
INSERT INTO `ecs_admin_action` VALUES ('85', '3', 'surplus_manage', 'account_manage');
INSERT INTO `ecs_admin_action` VALUES ('43', '4', 'admin_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('44', '4', 'admin_drop', 'admin_manage');
INSERT INTO `ecs_admin_action` VALUES ('45', '4', 'allot_priv', 'admin_manage');
INSERT INTO `ecs_admin_action` VALUES ('46', '4', 'logs_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('47', '4', 'logs_drop', 'logs_manage');
INSERT INTO `ecs_admin_action` VALUES ('48', '5', 'shop_config', '');
INSERT INTO `ecs_admin_action` VALUES ('49', '5', 'ship_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('50', '5', 'payment', '');
INSERT INTO `ecs_admin_action` VALUES ('51', '5', 'shiparea_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('52', '5', 'area_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('53', '6', 'order_os_edit', '');
INSERT INTO `ecs_admin_action` VALUES ('54', '6', 'order_ps_edit', 'order_os_edit');
INSERT INTO `ecs_admin_action` VALUES ('55', '6', 'order_ss_edit', 'order_os_edit');
INSERT INTO `ecs_admin_action` VALUES ('56', '6', 'order_edit', 'order_os_edit');
INSERT INTO `ecs_admin_action` VALUES ('57', '6', 'order_view', '');
INSERT INTO `ecs_admin_action` VALUES ('58', '6', 'order_view_finished', '');
INSERT INTO `ecs_admin_action` VALUES ('59', '6', 'repay_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('60', '6', 'booking', '');
INSERT INTO `ecs_admin_action` VALUES ('61', '6', 'sale_order_stats', '');
INSERT INTO `ecs_admin_action` VALUES ('62', '6', 'client_flow_stats', '');
INSERT INTO `ecs_admin_action` VALUES ('78', '7', 'snatch_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('83', '7', 'ad_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('80', '7', 'gift_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('81', '7', 'card_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('70', '1', 'goods_type', '');
INSERT INTO `ecs_admin_action` VALUES ('82', '7', 'pack', '');
INSERT INTO `ecs_admin_action` VALUES ('79', '7', 'bonus_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('75', '5', 'friendlink', '');
INSERT INTO `ecs_admin_action` VALUES ('76', '5', 'db_backup', '');
INSERT INTO `ecs_admin_action` VALUES ('77', '5', 'db_renew', 'db_backup');
INSERT INTO `ecs_admin_action` VALUES ('86', '4', 'agency_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('87', '3', 'account_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('88', '5', 'flash_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('89', '5', 'navigator', '');
INSERT INTO `ecs_admin_action` VALUES ('90', '7', 'auction', '');
INSERT INTO `ecs_admin_action` VALUES ('91', '7', 'group_by', '');
INSERT INTO `ecs_admin_action` VALUES ('92', '7', 'favourable', '');
INSERT INTO `ecs_admin_action` VALUES ('93', '7', 'whole_sale', '');
INSERT INTO `ecs_admin_action` VALUES ('94', '1', 'goods_auto', '');
INSERT INTO `ecs_admin_action` VALUES ('95', '2', 'article_auto', '');
INSERT INTO `ecs_admin_action` VALUES ('96', '5', 'cron', '');
INSERT INTO `ecs_admin_action` VALUES ('97', '5', 'affiliate', '');
INSERT INTO `ecs_admin_action` VALUES ('98', '5', 'affiliate_ck', '');
INSERT INTO `ecs_admin_action` VALUES ('99', '8', 'attention_list', '');
INSERT INTO `ecs_admin_action` VALUES ('100', '8', 'email_list', '');
INSERT INTO `ecs_admin_action` VALUES ('101', '8', 'magazine_list', '');
INSERT INTO `ecs_admin_action` VALUES ('102', '8', 'view_sendlist', '');
INSERT INTO `ecs_admin_action` VALUES ('103', '1', 'virualcard', '');
INSERT INTO `ecs_admin_action` VALUES ('104', '7', 'package_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('105', '1', 'picture_batch', '');
INSERT INTO `ecs_admin_action` VALUES ('106', '1', 'goods_export', '');
INSERT INTO `ecs_admin_action` VALUES ('107', '1', 'goods_batch', '');
INSERT INTO `ecs_admin_action` VALUES ('108', '1', 'gen_goods_script', '');
INSERT INTO `ecs_admin_action` VALUES ('109', '5', 'sitemap', '');
INSERT INTO `ecs_admin_action` VALUES ('110', '5', 'file_priv', '');
INSERT INTO `ecs_admin_action` VALUES ('111', '5', 'file_check', '');
INSERT INTO `ecs_admin_action` VALUES ('112', '9', 'template_select', '');
INSERT INTO `ecs_admin_action` VALUES ('113', '9', 'template_setup', '');
INSERT INTO `ecs_admin_action` VALUES ('114', '9', 'library_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('115', '9', 'lang_edit', '');
INSERT INTO `ecs_admin_action` VALUES ('116', '9', 'backup_setting', '');
INSERT INTO `ecs_admin_action` VALUES ('117', '9', 'mail_template', '');
INSERT INTO `ecs_admin_action` VALUES ('118', '10', 'db_backup', '');
INSERT INTO `ecs_admin_action` VALUES ('119', '10', 'db_renew', '');
INSERT INTO `ecs_admin_action` VALUES ('120', '10', 'db_optimize', '');
INSERT INTO `ecs_admin_action` VALUES ('121', '10', 'sql_query', '');
INSERT INTO `ecs_admin_action` VALUES ('122', '10', 'convert', '');
INSERT INTO `ecs_admin_action` VALUES ('124', '11', 'sms_send', '');
INSERT INTO `ecs_admin_action` VALUES ('125', '11', 'sms_sign', '');
INSERT INTO `ecs_admin_action` VALUES ('128', '7', 'exchange_goods', '');
INSERT INTO `ecs_admin_action` VALUES ('129', '6', 'delivery_view', '');
INSERT INTO `ecs_admin_action` VALUES ('130', '6', 'back_view', '');
INSERT INTO `ecs_admin_action` VALUES ('131', '5', 'reg_fields', '');
INSERT INTO `ecs_admin_action` VALUES ('132', '5', 'shop_authorized', '');
INSERT INTO `ecs_admin_action` VALUES ('133', '5', 'webcollect_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('134', '4', 'suppliers_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('135', '4', 'role_manage', '');
INSERT INTO `ecs_admin_action` VALUES ('140', '12', 'banner_mobile', '');
INSERT INTO `ecs_admin_action` VALUES ('141', '12', 'lead', '');
INSERT INTO `ecs_admin_action` VALUES ('142', '12', 'mobile_setting', '');
INSERT INTO `ecs_admin_action` VALUES ('143', '12', 'h5_setting', '');
INSERT INTO `ecs_admin_action` VALUES ('144', '12', 'leancloud', '');
INSERT INTO `ecs_admin_action` VALUES ('145', '12', 'wxa_setting', '');
INSERT INTO `ecs_admin_action` VALUES ('150', '13', 'certificate', '');
INSERT INTO `ecs_admin_action` VALUES ('151', '13', 'service_market', '');
INSERT INTO `ecs_admin_action` VALUES ('152', '13', 'sms_resource', '');
INSERT INTO `ecs_admin_action` VALUES ('153', '13', 'logistic_tracking', '');

-- ----------------------------
-- Table structure for ecs_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_log`;
CREATE TABLE `ecs_admin_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_log
-- ----------------------------
INSERT INTO `ecs_admin_log` VALUES ('1', '1516014028', '1', '编辑地区: 中国', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('2', '1516067457', '1', '添加广告位置: 首页轮播图', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('3', '1516067665', '1', '添加广告: 国康恒大年金险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('4', '1516072924', '1', '添加广告: 国康恒大年金险1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('5', '1516072943', '1', '添加广告: 国康恒大年金险2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('6', '1516074610', '1', '编辑广告: 国康恒大年金险1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('7', '1516074639', '1', '编辑广告: 国康恒大年金险1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('8', '1516075988', '1', '编辑广告位置: 首页轮播图', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('9', '1516076054', '1', '编辑广告位置: 首页轮播图', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('10', '1516085519', '1', '编辑商店设置: ', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('11', '1516086776', '1', '添加文章分类: 全部产品', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('12', '1516086863', '1', '添加商品分类: 全部产品', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('13', '1516087195', '1', '删除商品分类: ', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('14', '1516087286', '1', '添加商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('15', '1516087300', '1', '添加商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('16', '1516087317', '1', '添加商品分类: 私人医生会员', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('17', '1516087330', '1', '添加商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('18', '1516087339', '1', '添加商品分类: 全国全球名医转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('19', '1516087354', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('20', '1516087362', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('21', '1516087369', '1', '编辑商品分类: 私人医生会员', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('22', '1516087375', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('23', '1516087381', '1', '编辑商品分类: 全国全球名医转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('24', '1516087660', '1', '编辑商品分类: 全部产品', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('25', '1516087668', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('26', '1516087677', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('27', '1516087683', '1', '编辑商品分类: 私人医生会员', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('28', '1516087688', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('29', '1516087694', '1', '编辑商品分类: 全国全球名医转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('30', '1516088415', '1', '添加广告位置: 首页中部轮播图', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('31', '1516093235', '1', '添加文章分类: 首页促销', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('32', '1516093283', '1', '编辑文章分类: 首页促销', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('33', '1516093362', '1', '添加文章: 12周年庆全场6折', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('34', '1516093396', '1', '添加文章: 12周年庆全场6折2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('35', '1516093414', '1', '添加文章: 12周年庆全场6折3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('36', '1516093432', '1', '添加文章: 12周年庆全场6折4', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('37', '1516095774', '1', '编辑文章分类: 首页促销活动', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('38', '1516100832', '1', '删除商品类型: 书', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('39', '1516100835', '1', '删除商品类型: 音乐', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('40', '1516100837', '1', '删除商品类型: 电影', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('41', '1516100839', '1', '删除商品类型: 手机', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('42', '1516100841', '1', '删除商品类型: 笔记本电脑', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('43', '1516100842', '1', '删除商品类型: 数码相机', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('44', '1516100844', '1', '删除商品类型: 数码摄像机', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('45', '1516100846', '1', '删除商品类型: 化妆品', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('46', '1516100849', '1', '删除商品类型: 精品手机', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('47', '1516100906', '1', '添加属性: 重疾', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('48', '1516100974', '1', '编辑属性: 类型', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('49', '1516101052', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('50', '1516101579', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('51', '1516101721', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('52', '1516101931', '1', '删除商品分类: 全部产品', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('53', '1516102139', '1', '编辑属性: 类型', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('54', '1516102161', '1', '编辑属性: 类型', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('55', '1516103514', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('56', '1516103522', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('57', '1516103613', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('58', '1516103875', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('59', '1516103947', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('60', '1516104073', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('61', '1516104722', '1', '编辑商品分类: 全国全球名医转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('62', '1516104842', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('63', '1516153979', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('64', '1516154090', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('65', '1516154228', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('66', '1516154282', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('67', '1516156180', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('68', '1516156230', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('69', '1516156279', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('70', '1516156765', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('71', '1516156808', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('72', '1516156847', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('73', '1516157098', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('74', '1516157142', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('75', '1516157182', '1', '添加商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('76', '1516157533', '1', '添加会员账号: 招商信诺客户徐女士', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('77', '1516157822', '1', '添加文章分类: 企业新闻', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('78', '1516157833', '1', '添加文章分类: 健康资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('79', '1516157842', '1', '添加文章分类: 保险资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('80', '1516157953', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('81', '1516157995', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易交易', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('82', '1516161846', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('83', '1516161875', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易交易2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('84', '1516161897', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('85', '1516161927', '1', '添加文章: 热烈祝贺国康企业客户——阅文集团于香港联合交易交易3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('86', '1516161958', '1', '编辑文章: 3热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('87', '1516161967', '1', '编辑文章: 3热烈祝贺国康企业客户——阅文集团于香港联合交易交易3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('88', '1516161975', '1', '编辑文章: 2热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('89', '1516161984', '1', '编辑文章: 2热烈祝贺国康企业客户——阅文集团于香港联合交易交易2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('90', '1516162058', '1', '添加文章分类: 了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('91', '1516162141', '1', '添加文章: 一分钟了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('92', '1516168366', '1', '编辑友情链接: ECSHOP 网上商店管理系统', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('93', '1516174260', '1', '添加文章分类: 集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('94', '1516174319', '1', '添加文章: 集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('95', '1516181538', '1', '添加广告位置: 了解国康-集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('96', '1516181631', '1', '添加广告: 一分钟快速了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('97', '1516181643', '1', '编辑广告: 一分钟快速了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('98', '1516181762', '1', '编辑广告位置: 了解国康-集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('99', '1516188564', '1', '编辑文章分类: 集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('100', '1516188921', '1', '编辑文章分类: 集团简介', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('101', '1516189154', '1', '添加文章分类: 董事长致词', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('102', '1516189227', '1', '添加文章分类: 管理团队', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('103', '1516189257', '1', '添加文章分类: 企业文化', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('104', '1516189301', '1', '添加文章分类: 企业荣誉', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('105', '1516189344', '1', '添加文章分类: 发展大事记', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('106', '1516189376', '1', '添加文章分类: 联系我们', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('107', '1516190332', '1', '添加文章: 董事长致辞', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('108', '1516190358', '1', '编辑文章分类: 董事长致词', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('109', '1516191164', '1', '添加文章: 管理团队', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('110', '1516191378', '1', '编辑文章分类: 管理团队', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('111', '1516191472', '1', '编辑文章: 管理团队', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('112', '1516191636', '1', '编辑文章分类: 企业文化', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('113', '1516191886', '1', '添加文章: 企业文化', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('114', '1516192078', '1', '编辑文章: 企业文化', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('115', '1516192377', '1', '编辑文章分类: 企业荣誉', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('116', '1516192993', '1', '添加文章: 发展大记事', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('117', '1516193017', '1', '编辑文章分类: 发展大事记', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('118', '1516193060', '1', '编辑文章分类: 企业荣誉', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('119', '1516193258', '1', '编辑文章: 发展大记事', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('120', '1516193499', '1', '添加文章: 联系我们', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('121', '1516193519', '1', '编辑文章分类: 联系我们', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('122', '1516193961', '1', '编辑文章: 联系我们', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('123', '1516194458', '1', '编辑文章: 国康总部', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('124', '1516195661', '1', '添加文章: 团队会员证团队会员证团队会员证团队会员证团队会...', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('125', '1516195993', '1', '添加文章: 团队会员证团队会员证团队会员证团队会员证团队会1...', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('126', '1516196018', '1', '添加文章: 团队会员证团队会员证团队会员证团队会员证团队会2...', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('127', '1516240812', '1', '编辑文章: 联系我们', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('128', '1516240987', '1', '编辑文章: 企业荣誉', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('129', '1516241016', '1', '编辑文章: 企业荣誉1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('130', '1516241031', '1', '编辑文章: 企业荣誉2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('131', '1516241122', '1', '编辑文章分类: 企业荣誉', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('132', '1516243757', '1', '删除商品类型: 保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('133', '1516243803', '1', '添加属性: 健康险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('134', '1516243858', '1', '编辑商品分类: 健康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('135', '1516243895', '1', '编辑属性: 健康险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('136', '1516244319', '1', '编辑属性: 健康险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('137', '1516244535', '1', '编辑属性: 健康险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('138', '1516247573', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('139', '1516247849', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('140', '1516247902', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('141', '1516247928', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('142', '1516247956', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('143', '1516247978', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('144', '1516255515', '1', '添加属性: 养老险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('145', '1516255535', '1', '编辑属性: 养老险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('146', '1516255600', '1', '添加属性: 全球转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('147', '1516255645', '1', '添加属性: 保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('148', '1516255699', '1', '添加属性: 私人医生', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('149', '1516255768', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('150', '1516255899', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('151', '1516255912', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('152', '1516255923', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('153', '1516255938', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('154', '1516256145', '1', '编辑商品分类: 养老保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('155', '1516256156', '1', '编辑商品分类: 私人医生会员', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('156', '1516256164', '1', '编辑商品分类: 中医推拿   保健理疗', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('157', '1516256173', '1', '编辑商品分类: 全国全球名医转诊', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('158', '1516258804', '1', '编辑广告位置: 了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('159', '1516258860', '1', '添加广告位置: 产品中心', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('160', '1516258933', '1', '添加广告: 产品中心', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('161', '1516259129', '1', '编辑广告: 产品中心', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('162', '1516259140', '1', '编辑广告: 一分钟快速了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('163', '1516259207', '1', '编辑广告: 产品中心', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('164', '1516259214', '1', '编辑广告: 一分钟快速了解国康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('165', '1516268776', '1', '添加商品分类: 重大疾病', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('166', '1516268799', '1', '添加商品分类: 意外保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('167', '1516325690', '1', '添加广告位置: 页面右下角', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('168', '1516325748', '1', '添加广告: 页面右下角', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('169', '1516332888', '1', '添加文章分类: 新闻资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('170', '1516332925', '1', '编辑文章分类: 企业新闻', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('171', '1516332936', '1', '编辑文章分类: 健康资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('172', '1516332945', '1', '编辑文章分类: 保险资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('173', '1516332996', '1', '编辑文章分类: 新闻资讯', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('174', '1516346339', '1', '添加广告位置: 新闻详情', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('175', '1516346453', '1', '添加广告: 新闻详情', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('176', '1516346634', '1', '添加广告位置: 新闻列表', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('177', '1516346665', '1', '添加广告: 新闻列表', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('178', '1516349621', '1', '添加文章分类: 品牌体系', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('179', '1516349705', '1', '添加文章分类: 国康健康', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('180', '1516349727', '1', '添加文章分类: 国康保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('181', '1516349754', '1', '添加文章分类: 医朋', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('182', '1516349773', '1', '添加文章分类: 康管家', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('183', '1516350415', '1', '添加文章: 国康健康重大疾病保险计划', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('184', '1516350452', '1', '添加文章: 国康健康重大疾病保险计划1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('185', '1516350525', '1', '添加文章: 国康健康重大疾病保险计划2', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('186', '1516350541', '1', '编辑文章: 国康健康重大疾病保险计划0', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('187', '1516350558', '1', '编辑文章: 国康健康重大疾病保险计划1', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('188', '1516350594', '1', '添加文章: 国康健康重大疾病保险计划3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('189', '1516350604', '1', '编辑文章: 国康健康重大疾病保险计划3', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('190', '1516350639', '1', '添加文章: 国康健康重大疾病保险计划4', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('191', '1516350665', '1', '添加文章: 国康健康重大疾病保险计划5', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('192', '1516351393', '1', '添加广告位置: 品牌体系列表', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('193', '1516351426', '1', '添加广告: 品牌体系列表', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('194', '1516353585', '1', '添加文章分类: 优质资源', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('195', '1516353606', '1', '添加文章分类: 专家', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('196', '1516353651', '1', '添加文章分类: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('197', '1516353665', '1', '添加文章分类: 外科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('198', '1516353682', '1', '添加文章分类: 妇产科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('199', '1516353709', '1', '添加文章分类: 皮肤科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('200', '1516353740', '1', '编辑文章分类: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('201', '1516353890', '1', '添加文章: 李文慧  教授', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('202', '1516413825', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('203', '1516413838', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('204', '1516413850', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('205', '1516413863', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('206', '1516413875', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('207', '1516413889', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('208', '1516413901', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('209', '1516413913', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('210', '1516413924', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('211', '1516413936', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('212', '1516413948', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('213', '1516413961', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('214', '1516415010', '1', '添加文章分类: 常见问题', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('215', '1516415044', '1', '编辑文章分类: 企业新闻', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('216', '1516415583', '1', '添加文章: 如何开具发票？', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('217', '1516416555', '1', '编辑商店设置: ', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('218', '1516420069', '1', '编辑用户评论: 回复', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('219', '1516431349', '1', '添加文章分类: 保险案例', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('220', '1516431580', '1', '添加文章: 黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('221', '1516432189', '1', '添加文章: 1黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('222', '1516435093', '1', '编辑商品: 国康恒大万年金保险', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('223', '1516449010', '1', '添加: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('224', '1516449933', '1', '编辑: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('225', '1516449972', '1', '编辑: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('226', '1516450017', '1', '添加: 外壳', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('227', '1516450044', '1', '编辑: 外科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('228', '1516450059', '1', '删除商品分类: ', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('229', '1516450068', '1', '编辑: 内科', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('230', '1516453746', '1', '添加文章: ', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('231', '1516590196', '1', '编辑文章: 测试', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('232', '1516590916', '1', '添加: 邱嘎嘎', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('233', '1516591527', '1', '编辑: 邱嘎嘎0', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('234', '1516591534', '1', '编辑: 邱嘎嘎', '127.0.0.1');
INSERT INTO `ecs_admin_log` VALUES ('235', '1516592902', '1', '编辑: 邱嘎嘎', '127.0.0.1');

-- ----------------------------
-- Table structure for ecs_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_message`;
CREATE TABLE `ecs_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(11) unsigned NOT NULL DEFAULT '0',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_message
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ecs_admin_user`;
CREATE TABLE `ecs_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `ec_salt` varchar(10) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `role_id` smallint(5) DEFAULT NULL,
  `passport_uid` varchar(20) DEFAULT NULL,
  `yq_create_time` smallint(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_admin_user
-- ----------------------------
INSERT INTO `ecs_admin_user` VALUES ('1', 'admin', '', '336ddee103bb21645fc8b3d50b47e308', '9099', '1516010800', '1516585818', '127.0.0.1', 'all', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit,店铺二维码|lead.php?act=list,服务市场|service_market.php', '', '0', '0', null, null, null, null);
INSERT INTO `ecs_admin_user` VALUES ('2', '88171101845370', '88171101845370', 'shopex', null, '1516010803', '0', '', 'all', '商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit,店铺二维码|lead.php?act=list,服务市场|service_market.php', '', '0', '0', null, null, '88171101845370', '32767');

-- ----------------------------
-- Table structure for ecs_adsense
-- ----------------------------
DROP TABLE IF EXISTS `ecs_adsense`;
CREATE TABLE `ecs_adsense` (
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `from_ad` (`from_ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_adsense
-- ----------------------------
INSERT INTO `ecs_adsense` VALUES ('1', '本站', '6');
INSERT INTO `ecs_adsense` VALUES ('3', '本站', '2');
INSERT INTO `ecs_adsense` VALUES ('2', '本站', '1');

-- ----------------------------
-- Table structure for ecs_ad_custom
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_custom`;
CREATE TABLE `ecs_ad_custom` (
  `ad_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ad_name` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `ad_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_custom
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `ecs_ad_position`;
CREATE TABLE `ecs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_ad_position
-- ----------------------------
INSERT INTO `ecs_ad_position` VALUES ('1', '首页轮播图', '710', '381', '首页头部轮播图', '{foreach from=$ads item=ad}\r\n <div class=\"swiper-slide\">{$ad}</div >\r\n{/foreach}\r\n');
INSERT INTO `ecs_ad_position` VALUES ('2', '首页中部轮播图', '300', '145', '首页中部轮播图', '<tr><td>{$ad}</td></tr>\r\n{foreach from=$ads item=ad}\r\n<div class=\"floatl\">\r\n	<ul>\r\n		<li>\r\n			<p class=\"pwTitle\">12周年庆全场6折</p>\r\n	        </li>\r\n	        <li>\r\n			<p class=\"pwcontent\">国康12周年庆，全场6折</p>\r\n		</li>\r\n		<li>\r\n			<div class=\"pwBtn\">\r\n				<a href=\"###\">查看详情</a>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n{/foreach}');
INSERT INTO `ecs_ad_position` VALUES ('3', '了解国康', '1', '1', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `ecs_ad_position` VALUES ('4', '产品中心', '1', '1', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `ecs_ad_position` VALUES ('5', '页面右下角', '360', '222', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `ecs_ad_position` VALUES ('6', '新闻详情', '1', '1', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `ecs_ad_position` VALUES ('7', '新闻列表', '1', '1', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `ecs_ad_position` VALUES ('8', '品牌体系列表', '1', '1', '', '<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');

-- ----------------------------
-- Table structure for ecs_affiliate_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_affiliate_log`;
CREATE TABLE `ecs_affiliate_log` (
  `log_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) NOT NULL,
  `time` int(10) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(10) NOT NULL DEFAULT '0',
  `separate_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_affiliate_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_agency
-- ----------------------------
DROP TABLE IF EXISTS `ecs_agency`;
CREATE TABLE `ecs_agency` (
  `agency_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL,
  PRIMARY KEY (`agency_id`),
  KEY `agency_name` (`agency_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_agency
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_area_region
-- ----------------------------
DROP TABLE IF EXISTS `ecs_area_region`;
CREATE TABLE `ecs_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_area_region
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_article
-- ----------------------------
DROP TABLE IF EXISTS `ecs_article`;
CREATE TABLE `ecs_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '',
  `author_email` varchar(60) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_article
-- ----------------------------
INSERT INTO `ecs_article` VALUES ('1', '2', '免责条款', '', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('2', '2', '隐私保护', '', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('3', '2', '咨询热点', '', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('4', '2', '联系我们', '', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('5', '2', '公司简介', '', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('6', '-1', '用户协议', '请在 文章管理》文章列表》用户协议 修改', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('80', '-2', '关于我们', '请在 文章管理》文章列表》关于我们 修改', '', '', '', '0', '1', '1516010800', '', '0', '', null);
INSERT INTO `ecs_article` VALUES ('81', '5', '12周年庆全场6折1', '', '', '', '', '1', '1', '1516093362', '', '0', 'http://', '国康12周年庆，全场6折');
INSERT INTO `ecs_article` VALUES ('82', '5', '12周年庆全场6折2', '', '', '', '', '1', '1', '1516093396', '', '0', 'http://', '国康12周年庆，全场6折');
INSERT INTO `ecs_article` VALUES ('83', '5', '12周年庆全场6折3', '', '', '', '', '1', '1', '1516093414', '', '0', 'http://', '国康12周年庆，全场6折');
INSERT INTO `ecs_article` VALUES ('84', '5', '12周年庆全场6折4', '', '', '', '', '1', '1', '1516093432', '', '0', 'http://', '国康12周年庆，全场6折');
INSERT INTO `ecs_article` VALUES ('85', '6', '热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！', '', '', '', '', '1', '1', '1516157953', 'data/article/1516157953403261552.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('86', '6', '热烈祝贺国康企业客户——阅文集团于香港联合交易交易', '', '', '', '', '1', '1', '1516157995', 'data/article/1516157995370522751.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('87', '7', '2热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！2', '', '', '', '', '1', '1', '1516161846', 'data/article/1516161846889255267.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('88', '7', '2热烈祝贺国康企业客户——阅文集团于香港联合交易交易2', '', '', '', '', '1', '1', '1516161875', 'data/article/1516161875434139891.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('89', '8', '3热烈祝贺国康企业客户——阅文集团于香港联合交易所主板成功上市！3', '', '', '', '', '1', '1', '1516161897', 'data/article/1516161897583705943.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('90', '8', '3热烈祝贺国康企业客户——阅文集团于香港联合交易交易3', '', '', '', '', '1', '1', '1516161927', 'data/article/1516161927512764906.jpg', '1', 'http://', '2017年11月8日，国康企业客户——中国最大的网上文学平台阅文集团（股权代码：00772）在香港联交所主板挂牌上市，开盘爆涨63.64%，万众瞩目的国内文学第一股终于来临！');
INSERT INTO `ecs_article` VALUES ('91', '9', '一分钟了解国康', '', '', '', '', '1', '1', '1516162141', 'data/article/1516162141482529128.jpg', '1', 'http://jq22com.qiniudn.com/jq22-sp.mp4', '国康私人医生集团是私人医生服务领导品牌');
INSERT INTO `ecs_article` VALUES ('92', '10', '集团简介', '<p>&nbsp;国康人从2005年公司成立之时，一直坚持不懈，致力于改变中国医疗健康领域&ldquo;看病难、误诊误治高发、以药养医、医患对立、没有持续跟踪服务、缺失健康守门人&rdquo;的落后状态，致力于应对国人慢性病蔓延、重疾爆发的危机局面，为中国人的健康服务。国康引入&ldquo;保健＋转诊&rdquo;的西方家庭医生制度，结合中央首长保健体系和中医养生体系，形成了业界一流的&ldquo;健康管理体系&rdquo;、&ldquo;就医和大病治疗体系&rdquo;以及&ldquo;健康保险网络医院和快捷理赔体系&rdquo;等三大核心系统，打造了一个全国最专业的线上和线下相结合的&ldquo;国康私人医生&rdquo;平台，受到华为等全国500强企业和企业家群体的认同和信赖。</p>\r\n<p>国康是一家轻资产、重服务的公司，由&ldquo;专科医生＋全科医生＋健康管理师＋临床护士&rdquo;组成的专业团队是我们最大的资产。我们的员工的奉献精神以及对客户服务的激情超越了大多数其他同类机构。这是我们成功的一个重要因素。</p>', '', '', '', '0', '1', '1516174319', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('93', '11', '董事长致辞', '<p>&nbsp;国康人从2005年公司成立之时，一直坚持不懈，致力于改变中国医疗健康领域&ldquo;看病难、误诊误治高发、以药养医、医患对立、没有持续跟踪服务、缺失健康守门人&rdquo;的落后状态，致力于应对国人慢性病蔓延、重疾爆发的危机局面，为中国人的健康服务。国康引入&ldquo;保健＋转诊&rdquo;的西方家庭医生制度，结合中央首长保健体系和中医养生体系，形成了业界一流的&ldquo;健康管理体系&rdquo;、&ldquo;就医和大病治疗体系&rdquo;以及&ldquo;健康保险网络医院和快捷理赔体系&rdquo;等三大核心系统，打造了一个全国最专业的线上和线下相结合的&ldquo;国康私人医生&rdquo;平台，受到华为等全国500强企业和企业家群体的认同和信赖。</p>\r\n<p>国康是一家轻资产、重服务的公司，由&ldquo;专科医生＋全科医生＋健康管理师＋临床护士&rdquo;组成的专业团队是我们最大的资产。我们的员工的奉献精神以及对客户服务的激情超越了大多数其他同类机构。这是我们成功的一个重要因素。</p>', '', '', '', '0', '1', '1516190332', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('94', '12', '管理团队', '<p><img src=\"/guokang/source/ecshop/images/upload/Image/knowPerson.jpg\" width=\"750\" height=\"340\" alt=\"\" />&nbsp;</p>\r\n<p><span style=\"font-size: xx-large;\">杨华山</span>&nbsp; <span style=\"font-size: large;\">国康创始人、董事长兼CEO</span></p>\r\n<p>国人通信集团（纳斯达克上市企业）创始人、原总裁</p>\r\n<p>深圳市企业家协会副会长</p>\r\n<p>阿拉善SEE生态协会会员</p>', '', '', '', '0', '1', '1516191164', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('95', '13', '企业文化', '<p><img src=\"/guokang/source/ecshop/images/upload/Image/cultrueKnow01.jpg\" width=\"750\" height=\"200\" alt=\"\" />&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">我们的使命</span></p>\r\n<p>&nbsp;</p>\r\n<p>为国人健康服务，让中国人享有高水准的健康生活</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">我们的愿景</span></p>\r\n<p>&nbsp;</p>\r\n<p>成为最受尊敬的医疗健康服务公司</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">我们的价值观</span></p>\r\n<p>&nbsp;</p>\r\n<p>健康生活 阳光人生</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">我们的服务</span></p>\r\n<p>&nbsp;</p>\r\n<p>爱与温暖 专业科学</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">我们的经营观</span></p>\r\n<p>&nbsp;</p>\r\n<p>致力于追求全体员工物质与精神的幸福，为中国和谐发展做出贡献</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"/guokang/source/ecshop/images/upload/Image/cultrueKnow02.jpg\" width=\"750\" height=\"200\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">国康服务</span></p>\r\n<p>&nbsp;</p>\r\n<p>以客为尊 爱与温暖 专业科学 最高标准&nbsp; 职业道德 值得信赖</p>', '', '', '', '0', '1', '1516191886', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('96', '15', '发展大记事', '<p><span style=\"font-size: x-large;\">&nbsp;2005/10&nbsp;</span> &nbsp; &nbsp;国康注册成为国内首家专业健康管理公司</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"/guokang/source/ecshop/images/upload/Image/develop.jpg\" width=\"358\" height=\"149\" alt=\"\" /></p>', '', '', '', '0', '1', '1516192993', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('97', '16', '联系我们', '<p>&nbsp;公司：深圳市国康健康管理服务有限公司</p>\r\n<p>Shenzhen Guokang Health Management Service Co. Ltd.</p>\r\n<p>地址：深圳市南山区科技中二路深圳软件园二期14栋204</p>\r\n<p>全国统一私人医生专线：400 6788 500</p>', '', '', '', '0', '1', '1516193499', 'data/article/1516193961297636776.jpg', '2', 'http://', '国康总部');
INSERT INTO `ecs_article` VALUES ('98', '14', '企业荣誉', '', '', '', '', '0', '1', '1516195661', 'data/article/1516195661759494554.jpg', '1', 'http://', '团队会员证团队会员证团队会员证团队会员证团队会...');
INSERT INTO `ecs_article` VALUES ('99', '14', '企业荣誉1', '', '', '', '', '0', '1', '1516195993', 'data/article/1516195993306505770.jpg', '1', 'http://', '团队会员证团队会员证团队会员证团队会员证团队会1...');
INSERT INTO `ecs_article` VALUES ('100', '14', '企业荣誉2', '', '', '', '', '0', '1', '1516196018', 'data/article/1516196018380019077.jpg', '1', 'http://', '团队会员证团队会员证团队会员证团队会员证团队会2...');
INSERT INTO `ecs_article` VALUES ('101', '19', '国康健康重大疾病保险计划0', '', '', '', '', '0', '1', '1516350415', 'data/article/1516350415911335402.jpg', '1', 'http://', ' 国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('102', '19', '国康健康重大疾病保险计划1', '', '', '', '', '0', '1', '1516350452', 'data/article/1516350452513120927.jpg', '1', 'http://', ' 国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('103', '20', '国康健康重大疾病保险计划2', '', '', '', '', '0', '1', '1516350525', 'data/article/1516350525755298009.jpg', '1', 'http://', '国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('104', '20', '国康健康重大疾病保险计划3', '', '', '', '', '0', '1', '1516350594', 'data/article/1516350604476750046.jpg', '1', 'http://', '国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('105', '21', '国康健康重大疾病保险计划4', '', '', '', '', '0', '1', '1516350639', 'data/article/1516350639123495138.jpg', '1', 'http://', '国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('106', '22', '国康健康重大疾病保险计划5', '', '', '', '', '0', '1', '1516350665', 'data/article/1516350665814966081.jpg', '1', 'http://', '国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划国康健康重大疾病保险计划,国康健康重大疾国康健康重大疾病保险计划...');
INSERT INTO `ecs_article` VALUES ('108', '29', '如何开具发票？', '<p>1.请在下单时选择&ldquo;我要开发票&rdquo;并填写相关信息。开具增&nbsp; 值税专用发票需在下单时填写增票资质信息。温馨提示：请确保增票资质信息与贵司税务登记证信息一致，避免因开票信息错误给贵司带来损失。</p>\r\n<p>2.增值税专用发票开具内容为明细。</p>', '', '', '', '0', '1', '1516415583', '', '0', 'http://', '');
INSERT INTO `ecs_article` VALUES ('109', '30', '黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性', '<p>&nbsp;黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性</p>', '', '', '', '0', '1', '1516431580', 'data/article/1516431580281894111.jpg', '2', 'http://', '');
INSERT INTO `ecs_article` VALUES ('110', '30', '1黄女士在国内某三甲医院查出左乳房肿块,进过穿刺活检，确诊为癌症阳性', '', '', '', '', '0', '1', '1516432189', 'data/article/1516432189396937443.jpg', '1', 'http://', '');
INSERT INTO `ecs_article` VALUES ('111', '5', '测试', '', '', '', '', '0', '0', '1516453746', '', '0', 'http://', '');

-- ----------------------------
-- Table structure for ecs_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `ecs_article_cat`;
CREATE TABLE `ecs_article_cat` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_article_cat
-- ----------------------------
INSERT INTO `ecs_article_cat` VALUES ('1', '系统分类', '2', '', '系统保留分类', '50', '1', '0', null);
INSERT INTO `ecs_article_cat` VALUES ('2', '网店信息', '3', '', '网店信息分类', '50', '0', '1', null);
INSERT INTO `ecs_article_cat` VALUES ('3', '网店帮助分类', '4', '', '网店帮助分类', '50', '0', '1', null);
INSERT INTO `ecs_article_cat` VALUES ('5', '首页促销活动', '1', '', '首页头部轮播图下', '1', '0', '0', null);
INSERT INTO `ecs_article_cat` VALUES ('6', '企业新闻', '1', '', '', '50', '0', '17', '');
INSERT INTO `ecs_article_cat` VALUES ('7', '健康资讯', '1', '', '', '50', '0', '17', '');
INSERT INTO `ecs_article_cat` VALUES ('8', '保险资讯', '1', '', '', '50', '0', '17', '');
INSERT INTO `ecs_article_cat` VALUES ('9', '了解国康', '1', '', '', '50', '0', '0', null);
INSERT INTO `ecs_article_cat` VALUES ('10', '集团简介', '1', '', '', '1', '0', '9', 'about.php?tpl=knowOne&id=92');
INSERT INTO `ecs_article_cat` VALUES ('11', '董事长致词', '1', '', '', '2', '0', '9', 'about.php?tpl=knowTwo&id=93');
INSERT INTO `ecs_article_cat` VALUES ('12', '管理团队', '1', '', '', '3', '0', '9', 'about.php?tpl=knowThree&id=94');
INSERT INTO `ecs_article_cat` VALUES ('13', '企业文化', '1', '', '', '4', '0', '9', 'about.php?tpl=knowFour&id=95');
INSERT INTO `ecs_article_cat` VALUES ('14', '企业荣誉', '1', '', '', '5', '0', '9', 'about.php?tpl=knowfive&id=98');
INSERT INTO `ecs_article_cat` VALUES ('15', '发展大事记', '1', '', '', '6', '0', '9', 'about.php?tpl=knowSix&id=96');
INSERT INTO `ecs_article_cat` VALUES ('16', '联系我们', '1', '', '', '7', '0', '9', 'about.php?tpl=knowSeven&id=97');
INSERT INTO `ecs_article_cat` VALUES ('17', '新闻资讯', '1', '', '', '50', '0', '0', '');
INSERT INTO `ecs_article_cat` VALUES ('18', '品牌体系', '1', '', '', '50', '0', '0', '');
INSERT INTO `ecs_article_cat` VALUES ('19', '国康健康', '1', '', '', '1', '0', '18', '');
INSERT INTO `ecs_article_cat` VALUES ('20', '国康保险', '1', '', '', '2', '0', '18', '');
INSERT INTO `ecs_article_cat` VALUES ('21', '医朋', '1', '', '', '3', '0', '18', '');
INSERT INTO `ecs_article_cat` VALUES ('22', '康管家', '1', '', '', '4', '0', '18', '');
INSERT INTO `ecs_article_cat` VALUES ('23', '优质资源', '1', '', '', '50', '0', '0', '');
INSERT INTO `ecs_article_cat` VALUES ('29', '常见问题', '1', '', '', '50', '0', '0', '');
INSERT INTO `ecs_article_cat` VALUES ('30', '保险案例', '1', '', '', '50', '0', '0', '');

-- ----------------------------
-- Table structure for ecs_attribute
-- ----------------------------
DROP TABLE IF EXISTS `ecs_attribute`;
CREATE TABLE `ecs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_attribute
-- ----------------------------
INSERT INTO `ecs_attribute` VALUES ('216', '11', '私人医生', '1', '2', '重大疾病\r\n意外险', '0', '0', '0', '0');
INSERT INTO `ecs_attribute` VALUES ('215', '11', '保健理疗', '1', '2', '重大疾病\r\n意外险', '0', '0', '0', '0');
INSERT INTO `ecs_attribute` VALUES ('214', '11', '全球转诊', '1', '2', '重大疾病\r\n意外险', '0', '0', '0', '0');
INSERT INTO `ecs_attribute` VALUES ('213', '11', '养老险', '1', '2', '重大疾病\r\n意外险', '0', '0', '0', '0');
INSERT INTO `ecs_attribute` VALUES ('212', '11', '健康险', '1', '2', '重大疾病\r\n意外险', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for ecs_auction_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_auction_log`;
CREATE TABLE `ecs_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `act_id` (`act_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_auction_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_auto_manage
-- ----------------------------
DROP TABLE IF EXISTS `ecs_auto_manage`;
CREATE TABLE `ecs_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_auto_manage
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_back_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_back_goods`;
CREATE TABLE `ecs_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `back_id` mediumint(8) unsigned DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  PRIMARY KEY (`rec_id`),
  KEY `back_id` (`back_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_back_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_back_order
-- ----------------------------
DROP TABLE IF EXISTS `ecs_back_order`;
CREATE TABLE `ecs_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `return_time` int(10) unsigned DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_back_order
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_bonus_type
-- ----------------------------
DROP TABLE IF EXISTS `ecs_bonus_type`;
CREATE TABLE `ecs_bonus_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `send_start_date` int(11) NOT NULL DEFAULT '0',
  `send_end_date` int(11) NOT NULL DEFAULT '0',
  `use_start_date` int(11) NOT NULL DEFAULT '0',
  `use_end_date` int(11) NOT NULL DEFAULT '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_bonus_type
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_booking_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_booking_goods`;
CREATE TABLE `ecs_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_desc` varchar(255) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `booking_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_dispose` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dispose_user` varchar(30) NOT NULL DEFAULT '',
  `dispose_time` int(10) unsigned NOT NULL DEFAULT '0',
  `dispose_note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_booking_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_brand
-- ----------------------------
DROP TABLE IF EXISTS `ecs_brand`;
CREATE TABLE `ecs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_brand
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_callback_status
-- ----------------------------
DROP TABLE IF EXISTS `ecs_callback_status`;
CREATE TABLE `ecs_callback_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(50) DEFAULT '',
  `type` varchar(100) DEFAULT NULL,
  `status` enum('true','false','running') DEFAULT 'false',
  `type_id` varchar(50) DEFAULT NULL,
  `date_time` int(11) DEFAULT NULL,
  `data` text,
  `disabled` enum('true','false') DEFAULT 'false',
  `times` tinyint(4) DEFAULT '0',
  `method` varchar(100) NOT NULL,
  `http_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_type_type_id` (`type`,`type_id`) USING BTREE,
  KEY `date_time` (`date_time`),
  KEY `ind_status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_callback_status
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_card
-- ----------------------------
DROP TABLE IF EXISTS `ecs_card`;
CREATE TABLE `ecs_card` (
  `card_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_img` varchar(255) NOT NULL DEFAULT '',
  `card_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `card_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_card
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_cart
-- ----------------------------
DROP TABLE IF EXISTS `ecs_cart`;
CREATE TABLE `ecs_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_cart
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_category
-- ----------------------------
DROP TABLE IF EXISTS `ecs_category`;
CREATE TABLE `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name2` varchar(90) DEFAULT NULL,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_category
-- ----------------------------
INSERT INTO `ecs_category` VALUES ('2', '健康保险', '健康保险', '', '高品质的生活保障<br/>\r\n有温度的保险服务', '0', '2', '', '', '1', '', '1', '0', '212');
INSERT INTO `ecs_category` VALUES ('3', '养老保险', '养老保险', '', '高品质的生活保障</br>\r\n有温度的保险服务', '0', '3', '', '', '0', '', '1', '0', '213');
INSERT INTO `ecs_category` VALUES ('4', '私人医生会员', '私人医生会员', '', '', '0', '4', '', '', '0', '', '1', '0', '216');
INSERT INTO `ecs_category` VALUES ('5', '保健理疗', '中医推拿   保健理疗', '', '高品质的生活保障<br/>\r\n有温度的保险服务', '0', '5', '', '', '0', '', '1', '0', '215');
INSERT INTO `ecs_category` VALUES ('6', '全球转诊', '全国全球名医转诊', '', '高品质的生活保障<br/>\r\n有温度的保险服务', '0', '6', '', '', '0', '', '1', '0', '214');
INSERT INTO `ecs_category` VALUES ('7', null, '重大疾病', '', '', '2', '1', '', '', '0', '', '1', '0', '212');
INSERT INTO `ecs_category` VALUES ('8', null, '意外保险', '', '', '2', '2', '', '', '0', '', '1', '0', '212');

-- ----------------------------
-- Table structure for ecs_cat_recommend
-- ----------------------------
DROP TABLE IF EXISTS `ecs_cat_recommend`;
CREATE TABLE `ecs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`,`recommend_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_cat_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_cert
-- ----------------------------
DROP TABLE IF EXISTS `ecs_cert`;
CREATE TABLE `ecs_cert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` tinyint(4) NOT NULL COMMENT '配置id',
  `file` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cert_config_id_index` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_cert
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_coincidence
-- ----------------------------
DROP TABLE IF EXISTS `ecs_coincidence`;
CREATE TABLE `ecs_coincidence` (
  `type_id` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_coincidence
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_collect_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_collect_goods`;
CREATE TABLE `ecs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_collect_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_comment
-- ----------------------------
DROP TABLE IF EXISTS `ecs_comment`;
CREATE TABLE `ecs_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_comment
-- ----------------------------
INSERT INTO `ecs_comment` VALUES ('1', '0', '1', '', '招商信诺客户徐女士', '很好!', '3', '1516093362', '127.0.0.1', '1', '0', '1');
INSERT INTO `ecs_comment` VALUES ('2', '0', '1', '', 'admin', '感谢您对国康的支持！', '0', '1516420069', '127.0.0.1', '0', '1', '0');
INSERT INTO `ecs_comment` VALUES ('3', '0', '1', '', '哈哈', '产品不错啊', '5', '1516420069', '127.0.0.1', '1', '0', '2');
INSERT INTO `ecs_comment` VALUES ('4', '0', '1', '', 'admin', '感谢您对国康的支持！', '0', '1516420069', '127.0.0.1', '0', '3', '0');

-- ----------------------------
-- Table structure for ecs_config
-- ----------------------------
DROP TABLE IF EXISTS `ecs_config`;
CREATE TABLE `ecs_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_config
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_crons
-- ----------------------------
DROP TABLE IF EXISTS `ecs_crons`;
CREATE TABLE `ecs_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL DEFAULT '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `run_once` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip` varchar(100) NOT NULL DEFAULT '',
  `alow_files` varchar(255) NOT NULL,
  PRIMARY KEY (`cron_id`),
  KEY `nextime` (`nextime`),
  KEY `enable` (`enable`),
  KEY `cron_code` (`cron_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_crons
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_delivery_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_delivery_goods`;
CREATE TABLE `ecs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `extension_code` varchar(30) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  PRIMARY KEY (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_delivery_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_delivery_order
-- ----------------------------
DROP TABLE IF EXISTS `ecs_delivery_order`;
CREATE TABLE `ecs_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_delivery_order
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_device
-- ----------------------------
DROP TABLE IF EXISTS `ecs_device`;
CREATE TABLE `ecs_device` (
  `user_id` int(11) NOT NULL,
  `device_id` varchar(200) NOT NULL COMMENT '设备id',
  `device_type` varchar(200) NOT NULL COMMENT '设备类型',
  `platform_type` varchar(200) NOT NULL COMMENT '平台类型',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '推送开关 0:关闭 1:开启 默认开启',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `device_user_id_unique` (`user_id`),
  KEY `device_device_id_index` (`device_id`),
  KEY `device_device_type_index` (`device_type`),
  KEY `device_platform_type_index` (`platform_type`),
  KEY `device_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_device
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_doctor
-- ----------------------------
DROP TABLE IF EXISTS `ecs_doctor`;
CREATE TABLE `ecs_doctor` (
  `doctor_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `add_time` int(11) NOT NULL,
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `province` int(255) DEFAULT NULL,
  `city` int(255) DEFAULT NULL,
  `area` int(255) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_doctor
-- ----------------------------
INSERT INTO `ecs_doctor` VALUES ('1', '1', '邱嘎嘎', '<p>&nbsp;撒飞洒发三个四个撒飞洒发三个四个撒飞洒发三个四个撒飞洒发三个四个撒飞洒发三个四个撒飞洒发三个四个</p>', '1', '1516590916', 'data/doctor/1516590916215905021.jpg', '撒飞洒发三个四个', '20', '231', '2389');

-- ----------------------------
-- Table structure for ecs_doctor_cat
-- ----------------------------
DROP TABLE IF EXISTS `ecs_doctor_cat`;
CREATE TABLE `ecs_doctor_cat` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) NOT NULL DEFAULT '50',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `cat_link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_doctor_cat
-- ----------------------------
INSERT INTO `ecs_doctor_cat` VALUES ('1', '内科', '1', '', '', '1', '0', '0', '');

-- ----------------------------
-- Table structure for ecs_email_list
-- ----------------------------
DROP TABLE IF EXISTS `ecs_email_list`;
CREATE TABLE `ecs_email_list` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_email_list
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_email_sendlist
-- ----------------------------
DROP TABLE IF EXISTS `ecs_email_sendlist`;
CREATE TABLE `ecs_email_sendlist` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `template_id` mediumint(8) NOT NULL,
  `email_content` text NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `pri` tinyint(10) NOT NULL,
  `last_send` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_email_sendlist
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_error_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_error_log`;
CREATE TABLE `ecs_error_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_exchange_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_exchange_goods`;
CREATE TABLE `ecs_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_exchange_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_favourable_activity
-- ----------------------------
DROP TABLE IF EXISTS `ecs_favourable_activity`;
CREATE TABLE `ecs_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_favourable_activity
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ecs_feedback`;
CREATE TABLE `ecs_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ecs_friend_link`;
CREATE TABLE `ecs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  `show_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`show_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_friend_link
-- ----------------------------
INSERT INTO `ecs_friend_link` VALUES ('1', 'ECSHOP 网上商店管理系统', 'http://www.ecshop.com/', 'http://www.ecshop.com/images/logo/ecshop_logo.gif', '50');
INSERT INTO `ecs_friend_link` VALUES ('2', '买否网', 'http://www.maifou.net/', '', '51');
INSERT INTO `ecs_friend_link` VALUES ('3', '免费开独立网店', 'http://www.wdwd.com/', '', '52');

-- ----------------------------
-- Table structure for ecs_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `virtual_sales` smallint(5) unsigned NOT NULL DEFAULT '0',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `member_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价',
  `no_member_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '非会员价',
  `vip_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '贵宾价',
  `return_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返现金额',
  `agree_num` varchar(255) DEFAULT '' COMMENT '顾客满意度',
  `user_num` int(11) DEFAULT '0' COMMENT '顾客投票数',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods
-- ----------------------------
INSERT INTO `ecs_goods` VALUES ('1', '2', 'ECS000000', '国康恒大万年金保险', '+', '106', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/1_thumb_G_1516153979781.jpg', 'images/201801/goods_img/1_G_1516153979834.jpg', 'images/201801/source_img/1_G_1516153979782.jpg', '1', '', '1', '1', '0', '6', '1516153979', '1', '0', '0', '0', '1', '0', '0', '1516435093', '11', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '98.9', '10086');
INSERT INTO `ecs_goods` VALUES ('2', '2', 'ECS000002', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/2_thumb_G_1516154228943.jpg', 'images/201801/goods_img/2_G_1516154228029.jpg', 'images/201801/source_img/2_G_1516154228125.jpg', '1', '', '1', '1', '0', '6', '1516154228', '2', '0', '0', '0', '1', '0', '0', '1516413838', '11', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('3', '2', 'ECS000003', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/3_thumb_G_1516154282233.jpg', 'images/201801/goods_img/3_G_1516154282670.jpg', 'images/201801/source_img/3_G_1516154282775.jpg', '1', '', '1', '1', '0', '6', '1516154282', '3', '0', '0', '0', '1', '0', '0', '1516413850', '11', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('4', '3', 'ECS000004', '国康恒大万年金保险', '+', '1', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/4_thumb_G_1516156180121.jpg', 'images/201801/goods_img/4_G_1516156180406.jpg', 'images/201801/source_img/4_G_1516156180141.jpg', '1', '', '1', '1', '0', '6', '1516156180', '1', '0', '0', '0', '1', '0', '0', '1516413863', '11', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('5', '3', 'ECS000005', '国康恒大万年金保险', '+', '1', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/5_thumb_G_1516156230282.jpg', 'images/201801/goods_img/5_G_1516156230689.jpg', 'images/201801/source_img/5_G_1516156230286.jpg', '1', '', '1', '1', '0', '6', '1516156230', '2', '0', '0', '0', '1', '0', '0', '1516413875', '11', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('6', '3', 'ECS000006', '国康恒大万年金保险', '+', '1', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/6_thumb_G_1516156279655.jpg', 'images/201801/goods_img/6_G_1516156279875.jpg', 'images/201801/source_img/6_G_1516156279187.jpg', '1', '', '1', '1', '0', '6', '1516156279', '3', '0', '0', '0', '1', '0', '0', '1516413889', '0', '', '-1', '-1', '0', null, '600.00', '1229.00', '600.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('7', '6', 'ECS000007', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/7_thumb_G_1516156765997.jpg', 'images/201801/goods_img/7_G_1516156765047.jpg', 'images/201801/source_img/7_G_1516156765818.jpg', '1', '', '1', '1', '0', '6', '1516156765', '1', '0', '0', '0', '1', '0', '0', '1516413901', '0', '', '-1', '-1', '0', null, '600.00', '1229.00', '1229.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('8', '6', 'ECS000008', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/8_thumb_G_1516156808430.jpg', 'images/201801/goods_img/8_G_1516156808089.jpg', 'images/201801/source_img/8_G_1516156808701.jpg', '1', '', '1', '1', '0', '6', '1516156808', '2', '0', '0', '0', '1', '0', '0', '1516413913', '0', '', '-1', '-1', '0', null, '600.00', '1229.00', '1229.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('9', '6', 'ECS000009', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/9_thumb_G_1516156847364.jpg', 'images/201801/goods_img/9_G_1516156847450.jpg', 'images/201801/source_img/9_G_1516156847652.jpg', '1', '', '1', '1', '0', '6', '1516156847', '3', '0', '0', '0', '1', '0', '0', '1516413924', '0', '', '-1', '-1', '0', null, '600.00', '1229.00', '1229.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('10', '5', 'ECS000010', '国康恒大万年金保险', '+', '16', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/10_thumb_G_1516157098659.jpg', 'images/201801/goods_img/10_G_1516157098133.jpg', 'images/201801/source_img/10_G_1516157098751.jpg', '1', '', '1', '1', '0', '6', '1516157098', '1', '0', '0', '0', '1', '0', '0', '1516413936', '0', '', '-1', '-1', '0', null, '600.00', '1229.00', '1229.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('11', '5', 'ECS000011', '国康恒大万年金保险', '+', '0', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/11_thumb_G_1516157142607.jpg', 'images/201801/goods_img/11_G_1516157142431.jpg', 'images/201801/source_img/11_G_1516157142594.jpg', '1', '', '1', '1', '0', '6', '1516157142', '2', '0', '0', '0', '1', '0', '0', '1516413948', '0', '', '-1', '-1', '0', null, '600.00', '2000.00', '1229.00', '10.00', '', '0');
INSERT INTO `ecs_goods` VALUES ('12', '5', 'ECS000012', '国康恒大万年金保险', '+', '1', '0', '', '1', '0.000', '2000.00', '0', '600.00', '0.00', '0', '0', '1', '', '30种重大疾病(含癌症)，住院/手术安排就诊服务', '', 'images/201801/thumb_img/12_thumb_G_1516157182642.jpg', 'images/201801/goods_img/12_G_1516157182646.jpg', 'images/201801/source_img/12_G_1516157182513.jpg', '1', '', '1', '1', '0', '6', '1516157182', '3', '0', '0', '0', '1', '0', '0', '1516413961', '0', '', '-1', '-1', '0', null, '600.00', '2000.00', '600.00', '30.00', '', '0');

-- ----------------------------
-- Table structure for ecs_goods_activity
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_activity`;
CREATE TABLE `ecs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_activity
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_goods_article
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_article`;
CREATE TABLE `ecs_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`article_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_article
-- ----------------------------
INSERT INTO `ecs_goods_article` VALUES ('1', '109', '0');
INSERT INTO `ecs_goods_article` VALUES ('1', '110', '0');
INSERT INTO `ecs_goods_article` VALUES ('2', '109', '0');
INSERT INTO `ecs_goods_article` VALUES ('2', '110', '0');
INSERT INTO `ecs_goods_article` VALUES ('3', '109', '0');
INSERT INTO `ecs_goods_article` VALUES ('3', '110', '0');

-- ----------------------------
-- Table structure for ecs_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_attr`;
CREATE TABLE `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_attr
-- ----------------------------
INSERT INTO `ecs_goods_attr` VALUES ('20', '5', '213', '意外险', '');
INSERT INTO `ecs_goods_attr` VALUES ('19', '4', '213', '重大疾病', '');
INSERT INTO `ecs_goods_attr` VALUES ('18', '3', '212', '意外险', '');
INSERT INTO `ecs_goods_attr` VALUES ('17', '3', '212', '重大疾病', '');
INSERT INTO `ecs_goods_attr` VALUES ('16', '2', '212', '意外险', '');
INSERT INTO `ecs_goods_attr` VALUES ('15', '2', '212', '重大疾病', '');
INSERT INTO `ecs_goods_attr` VALUES ('14', '1', '212', '意外险', '');
INSERT INTO `ecs_goods_attr` VALUES ('13', '1', '212', '重大疾病', '');

-- ----------------------------
-- Table structure for ecs_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_cat`;
CREATE TABLE `ecs_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_cat
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_gallery`;
CREATE TABLE `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_gallery
-- ----------------------------
INSERT INTO `ecs_goods_gallery` VALUES ('1', '1', 'images/201801/goods_img/1_P_1516153979920.jpg', '', 'images/201801/thumb_img/1_thumb_P_1516153979646.jpg', 'images/201801/source_img/1_P_1516153979049.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('2', '2', 'images/201801/goods_img/2_P_1516154228056.jpg', '', 'images/201801/thumb_img/2_thumb_P_1516154228796.jpg', 'images/201801/source_img/2_P_1516154228727.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('3', '3', 'images/201801/goods_img/3_P_1516154282780.jpg', '', 'images/201801/thumb_img/3_thumb_P_1516154282766.jpg', 'images/201801/source_img/3_P_1516154282234.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('4', '4', 'images/201801/goods_img/4_P_1516156180954.jpg', '', 'images/201801/thumb_img/4_thumb_P_1516156180291.jpg', 'images/201801/source_img/4_P_1516156180624.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('5', '5', 'images/201801/goods_img/5_P_1516156230037.jpg', '', 'images/201801/thumb_img/5_thumb_P_1516156230729.jpg', 'images/201801/source_img/5_P_1516156230923.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('6', '6', 'images/201801/goods_img/6_P_1516156279940.jpg', '', 'images/201801/thumb_img/6_thumb_P_1516156279430.jpg', 'images/201801/source_img/6_P_1516156279660.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('7', '7', 'images/201801/goods_img/7_P_1516156765879.jpg', '', 'images/201801/thumb_img/7_thumb_P_1516156765178.jpg', 'images/201801/source_img/7_P_1516156765170.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('8', '8', 'images/201801/goods_img/8_P_1516156808558.jpg', '', 'images/201801/thumb_img/8_thumb_P_1516156808529.jpg', 'images/201801/source_img/8_P_1516156808411.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('9', '9', 'images/201801/goods_img/9_P_1516156847493.jpg', '', 'images/201801/thumb_img/9_thumb_P_1516156847171.jpg', 'images/201801/source_img/9_P_1516156847241.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('10', '10', 'images/201801/goods_img/10_P_1516157098836.jpg', '', 'images/201801/thumb_img/10_thumb_P_1516157098314.jpg', 'images/201801/source_img/10_P_1516157098732.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('11', '11', 'images/201801/goods_img/11_P_1516157142654.jpg', '', 'images/201801/thumb_img/11_thumb_P_1516157142991.jpg', 'images/201801/source_img/11_P_1516157142972.jpg');
INSERT INTO `ecs_goods_gallery` VALUES ('12', '12', 'images/201801/goods_img/12_P_1516157182579.jpg', '', 'images/201801/thumb_img/12_thumb_P_1516157182730.jpg', 'images/201801/source_img/12_P_1516157182473.jpg');

-- ----------------------------
-- Table structure for ecs_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `ecs_goods_type`;
CREATE TABLE `ecs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_goods_type
-- ----------------------------
INSERT INTO `ecs_goods_type` VALUES ('11', '保险', '1', '');

-- ----------------------------
-- Table structure for ecs_group_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_group_goods`;
CREATE TABLE `ecs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_group_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_keywords
-- ----------------------------
DROP TABLE IF EXISTS `ecs_keywords`;
CREATE TABLE `ecs_keywords` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(90) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_link_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_link_goods`;
CREATE TABLE `ecs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_double` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`link_goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_link_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_mail_templates
-- ----------------------------
DROP TABLE IF EXISTS `ecs_mail_templates`;
CREATE TABLE `ecs_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(30) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_subject` varchar(200) NOT NULL DEFAULT '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL DEFAULT '0',
  `last_send` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_mail_templates
-- ----------------------------
INSERT INTO `ecs_mail_templates` VALUES ('1', 'send_password', '1', '密码找回', '{$user_name}您好！<br>\n<br>\n您已经进行了密码重置的操作，请点击以下链接(或者复制到您的浏览器):<br>\n<br>\n<a href=\"{$reset_email}\" target=\"_blank\">{$reset_email}</a><br>\n<br>\n以确认您的新密码重置操作！<br>\n<br>\n{$shop_name}<br>\n{$send_date}', '1194824789', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('2', 'order_confirm', '0', '订单确认通知', '亲爱的{$order.consignee}，你好！ \n\n我们已经收到您于 {$order.formated_add_time} 提交的订单，该订单编号为：{$order.order_sn} 请记住这个编号以便日后的查询。\n\n{$shop_name}\n{$sent_date}\n\n\n', '1158226370', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('3', 'deliver_notice', '1', '发货通知', '亲爱的{$order.consignee}。你好！</br></br>\n\n您的订单{$order.order_sn}已于{$send_time}按照您预定的配送方式给您发货了。</br>\n</br>\n{if $order.invoice_no}发货单号是{$order.invoice_no}。</br>{/if}\n</br>\n在您收到货物之后请点击下面的链接确认您已经收到货物：</br>\n<a href=\"{$confirm_url}\" target=\"_blank\">{$confirm_url}</a></br></br>\n如果您还没有收到货物可以点击以下链接给我们留言：</br></br>\n<a href=\"{$send_msg_url}\" target=\"_blank\">{$send_msg_url}</a></br>\n<br>\n再次感谢您对我们的支持。欢迎您的再次光临。 <br>\n<br>\n{$shop_name} </br>\n{$send_date}', '1194823291', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('4', 'order_cancel', '0', '订单取消', '亲爱的{$order.consignee}，你好！ \n\n您的编号为：{$order.order_sn}的订单已取消。\n\n{$shop_name}\n{$send_date}', '1156491130', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('5', 'order_invalid', '0', '订单无效', '亲爱的{$order.consignee}，你好！\n\n您的编号为：{$order.order_sn}的订单无效。\n\n{$shop_name}\n{$send_date}', '1156491164', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('6', 'send_bonus', '0', '发红包', '亲爱的{$user_name}您好！\n\n恭喜您获得了{$count}个红包，金额{if $count > 1}分别{/if}为{$money}\n\n{$shop_name}\n{$send_date}\n', '1156491184', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('7', 'group_buy', '1', '团购商品', '亲爱的{$consignee}，您好！<br>\n<br>\n您于{$order_time}在本店参加团购商品活动，所购买的商品名称为：{$goods_name}，数量：{$goods_number}，订单号为：{$order_sn}，订单金额为：{$order_amount}<br>\n<br>\n此团购商品现在已到结束日期，并达到最低价格，您现在可以对该订单付款。<br>\n<br>\n请点击下面的链接：<br>\n<a href=\"{$shop_url}\" target=\"_blank\">{$shop_url}</a><br>\n<br>\n请尽快登录到用户中心，查看您的订单详情信息。 <br>\n<br>\n{$shop_name} <br>\n<br>\n{$send_date}', '1194824668', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('8', 'register_validate', '1', '邮件验证', '{$user_name}您好！<br><br>\r\n\r\n这封邮件是 {$shop_name} 发送的。你收到这封邮件是为了验证你注册邮件地址是否有效。如果您已经通过验证了，请忽略这封邮件。<br>\r\n请点击以下链接(或者复制到您的浏览器)来验证你的邮件地址:<br>\r\n<a href=\"{$validate_email}\" target=\"_blank\">{$validate_email}</a><br><br>\r\n\r\n{$shop_name}<br>\r\n{$send_date}', '1162201031', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('9', 'virtual_card', '0', '虚拟卡片', '亲爱的{$order.consignee}\r\n你好！您的订单{$order.order_sn}中{$goods.goods_name} 商品的详细信息如下:\r\n{foreach from=$virtual_card item=card}\r\n{if $card.card_sn}卡号：{$card.card_sn}{/if}{if $card.card_password}卡片密码：{$card.card_password}{/if}{if $card.end_date}截至日期：{$card.end_date}{/if}\r\n{/foreach}\r\n再次感谢您对我们的支持。欢迎您的再次光临。\r\n\r\n{$shop_name} \r\n{$send_date}', '1162201031', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('10', 'attention_list', '0', '关注商品', '亲爱的{$user_name}您好~\n\n您关注的商品 : {$goods_name} 最近已经更新,请您查看最新的商品信息\n\n{$goods_url}\r\n\r\n{$shop_name} \r\n{$send_date}', '1183851073', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('11', 'remind_of_new_order', '0', '新订单通知', '亲爱的店长，您好：\n   快来看看吧，又有新订单了。\n    订单号:{$order.order_sn} \n 订单金额:{$order.order_amount}，\n 用户购买商品:{foreach from=$goods_list item=goods_data}{$goods_data.goods_name}(货号:{$goods_data.goods_sn})    {/foreach} \n\n 收货人:{$order.consignee}， \n 收货人地址:{$order.address}，\n 收货人电话:{$order.tel} {$order.mobile}, \n 配送方式:{$order.shipping_name}(费用:{$order.shipping_fee}), \n 付款方式:{$order.pay_name}(费用:{$order.pay_fee})。\n\n               系统提醒\n               {$send_date}', '1196239170', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('12', 'goods_booking', '1', '缺货回复', '亲爱的{$user_name}。你好！</br></br>{$dispose_note}</br></br>您提交的缺货商品链接为</br></br><a href=\"{$goods_link}\" target=\"_blank\">{$goods_name}</a></br><br>{$shop_name} </br>{$send_date}', '0', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('13', 'user_message', '1', '留言回复', '亲爱的{$user_name}。你好！</br></br>对您的留言：</br>{$message_content}</br></br>店主作了如下回复：</br>{$message_note}</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}', '0', '0', 'template');
INSERT INTO `ecs_mail_templates` VALUES ('14', 'recomment', '1', '用户评论回复', '亲爱的{$user_name}。你好！</br></br>对您的评论：</br>“{$comment}”</br></br>店主作了如下回复：</br>“{$recomment}”</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}', '0', '0', 'template');

-- ----------------------------
-- Table structure for ecs_member_price
-- ----------------------------
DROP TABLE IF EXISTS `ecs_member_price`;
CREATE TABLE `ecs_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) NOT NULL DEFAULT '0',
  `user_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_id`),
  KEY `goods_id` (`goods_id`,`user_rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_nav
-- ----------------------------
DROP TABLE IF EXISTS `ecs_nav`;
CREATE TABLE `ecs_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_nav
-- ----------------------------
INSERT INTO `ecs_nav` VALUES ('13', '', '0', '了解国康', '1', '7', '1', 'about.php?tpl=knowOne&id=92', 'middle');
INSERT INTO `ecs_nav` VALUES ('2', 'c', '2', '产品中心', '1', '2', '1', 'category.php?id=2', 'middle');
INSERT INTO `ecs_nav` VALUES ('3', null, null, '解决方案', '1', '3', '1', 'http://127.0.0.1/guokang/source/ecshop/index.php', 'middle');
INSERT INTO `ecs_nav` VALUES ('4', '', '0', '优质资源', '1', '4', '1', 'resource.php?id=25', 'middle');
INSERT INTO `ecs_nav` VALUES ('5', null, null, '服务体系', '1', '4', '1', 'http://127.0.0.1/guokang/source/ecshop/index.php', 'middle');
INSERT INTO `ecs_nav` VALUES ('17', 'a', '1', '内科', '0', '20', '0', 'article_cat.php?id=1', 'middle');
INSERT INTO `ecs_nav` VALUES ('7', 'c', '0', '全部产品', '0', '8', '0', 'category.php?id=1', 'middle');
INSERT INTO `ecs_nav` VALUES ('8', 'c', '2', '健康保险', '0', '10', '0', 'category.php?id=2', 'middle');
INSERT INTO `ecs_nav` VALUES ('9', 'c', '3', '养老保险', '0', '12', '0', 'category.php?id=3', 'middle');
INSERT INTO `ecs_nav` VALUES ('10', 'c', '4', '私人医生会员', '0', '14', '0', 'category.php?id=4', 'middle');
INSERT INTO `ecs_nav` VALUES ('11', 'c', '5', '中医推拿   保健理疗', '0', '16', '0', 'category.php?id=5', 'middle');
INSERT INTO `ecs_nav` VALUES ('12', 'c', '6', '全国全球名医转诊', '0', '18', '0', 'category.php?id=6', 'middle');
INSERT INTO `ecs_nav` VALUES ('14', 'a', '6', '新闻资讯', '1', '6', '1', 'article_cat.php?id=6', 'middle');
INSERT INTO `ecs_nav` VALUES ('15', 'a', '6', '企业新闻', '0', '6', '1', 'article_cat.php?id=6', 'middle');
INSERT INTO `ecs_nav` VALUES ('16', '', '0', '品牌体系', '1', '5', '1', 'brand_news.php?id=19', 'middle');

-- ----------------------------
-- Table structure for ecs_order_action
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_action`;
CREATE TABLE `ecs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_user` varchar(30) NOT NULL DEFAULT '',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_place` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_action
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_goods`;
CREATE TABLE `ecs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对接erp专用，商品优惠金额',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_info
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_info`;
CREATE TABLE `ecs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_discount_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对接erp专用，商品优惠总金额',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) NOT NULL,
  `callback_status` enum('true','false') DEFAULT 'true',
  `lastmodify` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_info
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_order_review
-- ----------------------------
DROP TABLE IF EXISTS `ecs_order_review`;
CREATE TABLE `ecs_order_review` (
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  UNIQUE KEY `order_review_user_id_order_id_goods_id_unique` (`user_id`,`order_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_order_review
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_pack
-- ----------------------------
DROP TABLE IF EXISTS `ecs_pack`;
CREATE TABLE `ecs_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `pack_img` varchar(255) NOT NULL DEFAULT '',
  `pack_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pack_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pack_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_pack
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_package_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecs_package_goods`;
CREATE TABLE `ecs_package_goods` (
  `package_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`,`goods_id`,`admin_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_package_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_payment
-- ----------------------------
DROP TABLE IF EXISTS `ecs_payment`;
CREATE TABLE `ecs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_payment
-- ----------------------------
INSERT INTO `ecs_payment` VALUES ('1', 'yunqi', '<font color=\"#FF0000\">天工收银</font>', '0', '<font color=\"#FF0000\">天工收银是上海商派2015年正式推出的专业集成支付平台，致力于为各类用户提供融合、便捷、安全的场景支付服务。</font>', '0', 'a:0:{}', '1', '0', '1');

-- ----------------------------
-- Table structure for ecs_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_pay_log`;
CREATE TABLE `ecs_pay_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_plugins
-- ----------------------------
DROP TABLE IF EXISTS `ecs_plugins`;
CREATE TABLE `ecs_plugins` (
  `code` varchar(30) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `library` varchar(255) NOT NULL DEFAULT '',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `install_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_products
-- ----------------------------
DROP TABLE IF EXISTS `ecs_products`;
CREATE TABLE `ecs_products` (
  `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_attr` varchar(50) DEFAULT NULL,
  `product_sn` varchar(60) DEFAULT NULL,
  `product_number` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_products
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_push
-- ----------------------------
DROP TABLE IF EXISTS `ecs_push`;
CREATE TABLE `ecs_push` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `photo` varchar(200) DEFAULT NULL COMMENT '图片',
  `objectId` varchar(200) DEFAULT NULL COMMENT 'leancloud返回的objectId',
  `link` varchar(200) DEFAULT NULL COMMENT '链接',
  `platform` tinyint(4) NOT NULL DEFAULT '3' COMMENT '平台类型',
  `push_type` tinyint(4) DEFAULT '0' COMMENT '任务类型 1 定时任务 0 即时推送',
  `message_type` tinyint(4) DEFAULT '1' COMMENT '消息类型 1　系统消息 ２ 物流消息',
  `isPush` tinyint(4) DEFAULT '0' COMMENT '定时任务是否已经推送',
  `push_at` timestamp NULL DEFAULT NULL COMMENT '定时推送时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0:关闭 1:开启 默认开启',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_user_id_index` (`user_id`),
  KEY `push_title_index` (`title`),
  KEY `push_content_index` (`content`),
  KEY `push_photo_index` (`photo`),
  KEY `push_objectid_index` (`objectId`),
  KEY `push_link_index` (`link`),
  KEY `push_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_push
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_region
-- ----------------------------
DROP TABLE IF EXISTS `ecs_region`;
CREATE TABLE `ecs_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4044 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_region
-- ----------------------------
INSERT INTO `ecs_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `ecs_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `ecs_region` VALUES ('3', '1', '天津', '1', '0');
INSERT INTO `ecs_region` VALUES ('4', '1', '河北省', '1', '0');
INSERT INTO `ecs_region` VALUES ('5', '1', '山西省', '1', '0');
INSERT INTO `ecs_region` VALUES ('6', '1', '内蒙古自治区', '1', '0');
INSERT INTO `ecs_region` VALUES ('7', '1', '辽宁省', '1', '0');
INSERT INTO `ecs_region` VALUES ('8', '1', '吉林省', '1', '0');
INSERT INTO `ecs_region` VALUES ('9', '1', '黑龙江省', '1', '0');
INSERT INTO `ecs_region` VALUES ('10', '1', '上海', '1', '0');
INSERT INTO `ecs_region` VALUES ('11', '1', '江苏省', '1', '0');
INSERT INTO `ecs_region` VALUES ('12', '1', '浙江省', '1', '0');
INSERT INTO `ecs_region` VALUES ('13', '1', '安徽省', '1', '0');
INSERT INTO `ecs_region` VALUES ('14', '1', '福建省', '1', '0');
INSERT INTO `ecs_region` VALUES ('15', '1', '江西省', '1', '0');
INSERT INTO `ecs_region` VALUES ('16', '1', '山东省', '1', '0');
INSERT INTO `ecs_region` VALUES ('17', '1', '河南省', '1', '0');
INSERT INTO `ecs_region` VALUES ('18', '1', '湖北省', '1', '0');
INSERT INTO `ecs_region` VALUES ('19', '1', '湖南省', '1', '0');
INSERT INTO `ecs_region` VALUES ('20', '1', '广东省', '1', '0');
INSERT INTO `ecs_region` VALUES ('21', '1', '广西壮族自治区', '1', '0');
INSERT INTO `ecs_region` VALUES ('22', '1', '海南省', '1', '0');
INSERT INTO `ecs_region` VALUES ('23', '1', '重庆', '1', '0');
INSERT INTO `ecs_region` VALUES ('24', '1', '四川省', '1', '0');
INSERT INTO `ecs_region` VALUES ('25', '1', '贵州省', '1', '0');
INSERT INTO `ecs_region` VALUES ('26', '1', '云南省', '1', '0');
INSERT INTO `ecs_region` VALUES ('27', '1', '西藏自治区', '1', '0');
INSERT INTO `ecs_region` VALUES ('28', '1', '陕西省', '1', '0');
INSERT INTO `ecs_region` VALUES ('29', '1', '甘肃省', '1', '0');
INSERT INTO `ecs_region` VALUES ('30', '1', '青海省', '1', '0');
INSERT INTO `ecs_region` VALUES ('31', '1', '宁夏回族自治区', '1', '0');
INSERT INTO `ecs_region` VALUES ('32', '1', '新疆维吾尔自治区', '1', '0');
INSERT INTO `ecs_region` VALUES ('33', '1', '台湾', '1', '0');
INSERT INTO `ecs_region` VALUES ('34', '1', '香港特别行政区', '1', '0');
INSERT INTO `ecs_region` VALUES ('35', '1', '澳门特别行政区', '1', '0');
INSERT INTO `ecs_region` VALUES ('36', '1', '海外', '1', '0');
INSERT INTO `ecs_region` VALUES ('37', '2', '北京市', '2', '0');
INSERT INTO `ecs_region` VALUES ('38', '3', '天津市', '2', '0');
INSERT INTO `ecs_region` VALUES ('39', '4', '石家庄市', '2', '0');
INSERT INTO `ecs_region` VALUES ('40', '4', '唐山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('41', '4', '秦皇岛市', '2', '0');
INSERT INTO `ecs_region` VALUES ('42', '4', '邯郸市', '2', '0');
INSERT INTO `ecs_region` VALUES ('43', '4', '邢台市', '2', '0');
INSERT INTO `ecs_region` VALUES ('44', '4', '保定市', '2', '0');
INSERT INTO `ecs_region` VALUES ('45', '4', '张家口市', '2', '0');
INSERT INTO `ecs_region` VALUES ('46', '4', '承德市', '2', '0');
INSERT INTO `ecs_region` VALUES ('47', '4', '沧州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('48', '4', '廊坊市', '2', '0');
INSERT INTO `ecs_region` VALUES ('49', '4', '衡水市', '2', '0');
INSERT INTO `ecs_region` VALUES ('50', '5', '太原市', '2', '0');
INSERT INTO `ecs_region` VALUES ('51', '5', '大同市', '2', '0');
INSERT INTO `ecs_region` VALUES ('52', '5', '阳泉市', '2', '0');
INSERT INTO `ecs_region` VALUES ('53', '5', '长治市', '2', '0');
INSERT INTO `ecs_region` VALUES ('54', '5', '晋城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('55', '5', '朔州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('56', '5', '晋中市', '2', '0');
INSERT INTO `ecs_region` VALUES ('57', '5', '运城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('58', '5', '忻州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('59', '5', '临汾市', '2', '0');
INSERT INTO `ecs_region` VALUES ('60', '5', '吕梁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('61', '6', '呼和浩特市', '2', '0');
INSERT INTO `ecs_region` VALUES ('62', '6', '包头市', '2', '0');
INSERT INTO `ecs_region` VALUES ('63', '6', '乌海市', '2', '0');
INSERT INTO `ecs_region` VALUES ('64', '6', '赤峰市', '2', '0');
INSERT INTO `ecs_region` VALUES ('65', '6', '通辽市', '2', '0');
INSERT INTO `ecs_region` VALUES ('66', '6', '鄂尔多斯市', '2', '0');
INSERT INTO `ecs_region` VALUES ('67', '6', '呼伦贝尔市', '2', '0');
INSERT INTO `ecs_region` VALUES ('68', '6', '巴彦淖尔市', '2', '0');
INSERT INTO `ecs_region` VALUES ('69', '6', '乌兰察布市', '2', '0');
INSERT INTO `ecs_region` VALUES ('70', '6', '兴安盟', '2', '0');
INSERT INTO `ecs_region` VALUES ('71', '6', '锡林郭勒盟', '2', '0');
INSERT INTO `ecs_region` VALUES ('72', '6', '阿拉善盟', '2', '0');
INSERT INTO `ecs_region` VALUES ('73', '7', '沈阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('74', '7', '大连市', '2', '0');
INSERT INTO `ecs_region` VALUES ('75', '7', '鞍山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('76', '7', '抚顺市', '2', '0');
INSERT INTO `ecs_region` VALUES ('77', '7', '本溪市', '2', '0');
INSERT INTO `ecs_region` VALUES ('78', '7', '丹东市', '2', '0');
INSERT INTO `ecs_region` VALUES ('79', '7', '锦州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('80', '7', '营口市', '2', '0');
INSERT INTO `ecs_region` VALUES ('81', '7', '阜新市', '2', '0');
INSERT INTO `ecs_region` VALUES ('82', '7', '辽阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('83', '7', '盘锦市', '2', '0');
INSERT INTO `ecs_region` VALUES ('84', '7', '铁岭市', '2', '0');
INSERT INTO `ecs_region` VALUES ('85', '7', '朝阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('86', '7', '葫芦岛市', '2', '0');
INSERT INTO `ecs_region` VALUES ('87', '8', '长春市', '2', '0');
INSERT INTO `ecs_region` VALUES ('88', '8', '吉林市', '2', '0');
INSERT INTO `ecs_region` VALUES ('89', '8', '四平市', '2', '0');
INSERT INTO `ecs_region` VALUES ('90', '8', '辽源市', '2', '0');
INSERT INTO `ecs_region` VALUES ('91', '8', '通化市', '2', '0');
INSERT INTO `ecs_region` VALUES ('92', '8', '白山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('93', '8', '松原市', '2', '0');
INSERT INTO `ecs_region` VALUES ('94', '8', '白城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('95', '8', '延边朝鲜族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('96', '9', '哈尔滨市', '2', '0');
INSERT INTO `ecs_region` VALUES ('97', '9', '齐齐哈尔市', '2', '0');
INSERT INTO `ecs_region` VALUES ('98', '9', '鸡西市', '2', '0');
INSERT INTO `ecs_region` VALUES ('99', '9', '鹤岗市', '2', '0');
INSERT INTO `ecs_region` VALUES ('100', '9', '双鸭山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('101', '9', '大庆市', '2', '0');
INSERT INTO `ecs_region` VALUES ('102', '9', '伊春市', '2', '0');
INSERT INTO `ecs_region` VALUES ('103', '9', '佳木斯市', '2', '0');
INSERT INTO `ecs_region` VALUES ('104', '9', '七台河市', '2', '0');
INSERT INTO `ecs_region` VALUES ('105', '9', '牡丹江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('106', '9', '黑河市', '2', '0');
INSERT INTO `ecs_region` VALUES ('107', '9', '绥化市', '2', '0');
INSERT INTO `ecs_region` VALUES ('108', '9', '大兴安岭地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('109', '10', '上海市', '2', '0');
INSERT INTO `ecs_region` VALUES ('110', '11', '南京市', '2', '0');
INSERT INTO `ecs_region` VALUES ('111', '11', '无锡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('112', '11', '徐州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('113', '11', '常州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('114', '11', '苏州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('115', '11', '南通市', '2', '0');
INSERT INTO `ecs_region` VALUES ('116', '11', '连云港市', '2', '0');
INSERT INTO `ecs_region` VALUES ('117', '11', '淮安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('118', '11', '盐城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('119', '11', '扬州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('120', '11', '镇江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('121', '11', '泰州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('122', '11', '宿迁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('123', '12', '杭州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('124', '12', '宁波市', '2', '0');
INSERT INTO `ecs_region` VALUES ('125', '12', '温州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('126', '12', '嘉兴市', '2', '0');
INSERT INTO `ecs_region` VALUES ('127', '12', '湖州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('128', '12', '绍兴市', '2', '0');
INSERT INTO `ecs_region` VALUES ('129', '12', '金华市', '2', '0');
INSERT INTO `ecs_region` VALUES ('130', '12', '衢州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('131', '12', '舟山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('132', '12', '台州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('133', '12', '丽水市', '2', '0');
INSERT INTO `ecs_region` VALUES ('134', '13', '合肥市', '2', '0');
INSERT INTO `ecs_region` VALUES ('135', '13', '芜湖市', '2', '0');
INSERT INTO `ecs_region` VALUES ('136', '13', '蚌埠市', '2', '0');
INSERT INTO `ecs_region` VALUES ('137', '13', '淮南市', '2', '0');
INSERT INTO `ecs_region` VALUES ('138', '13', '马鞍山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('139', '13', '淮北市', '2', '0');
INSERT INTO `ecs_region` VALUES ('140', '13', '铜陵市', '2', '0');
INSERT INTO `ecs_region` VALUES ('141', '13', '安庆市', '2', '0');
INSERT INTO `ecs_region` VALUES ('142', '13', '黄山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('143', '13', '滁州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('144', '13', '阜阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('145', '13', '宿州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('146', '13', '六安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('147', '13', '亳州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('148', '13', '池州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('149', '13', '宣城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('150', '14', '福州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('151', '14', '厦门市', '2', '0');
INSERT INTO `ecs_region` VALUES ('152', '14', '莆田市', '2', '0');
INSERT INTO `ecs_region` VALUES ('153', '14', '三明市', '2', '0');
INSERT INTO `ecs_region` VALUES ('154', '14', '泉州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('155', '14', '漳州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('156', '14', '南平市', '2', '0');
INSERT INTO `ecs_region` VALUES ('157', '14', '龙岩市', '2', '0');
INSERT INTO `ecs_region` VALUES ('158', '14', '宁德市', '2', '0');
INSERT INTO `ecs_region` VALUES ('159', '15', '南昌市', '2', '0');
INSERT INTO `ecs_region` VALUES ('160', '15', '景德镇市', '2', '0');
INSERT INTO `ecs_region` VALUES ('161', '15', '萍乡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('162', '15', '九江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('163', '15', '新余市', '2', '0');
INSERT INTO `ecs_region` VALUES ('164', '15', '鹰潭市', '2', '0');
INSERT INTO `ecs_region` VALUES ('165', '15', '赣州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('166', '15', '吉安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('167', '15', '宜春市', '2', '0');
INSERT INTO `ecs_region` VALUES ('168', '15', '抚州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('169', '15', '上饶市', '2', '0');
INSERT INTO `ecs_region` VALUES ('170', '16', '济南市', '2', '0');
INSERT INTO `ecs_region` VALUES ('171', '16', '青岛市', '2', '0');
INSERT INTO `ecs_region` VALUES ('172', '16', '淄博市', '2', '0');
INSERT INTO `ecs_region` VALUES ('173', '16', '枣庄市', '2', '0');
INSERT INTO `ecs_region` VALUES ('174', '16', '东营市', '2', '0');
INSERT INTO `ecs_region` VALUES ('175', '16', '烟台市', '2', '0');
INSERT INTO `ecs_region` VALUES ('176', '16', '潍坊市', '2', '0');
INSERT INTO `ecs_region` VALUES ('177', '16', '济宁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('178', '16', '泰安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('179', '16', '威海市', '2', '0');
INSERT INTO `ecs_region` VALUES ('180', '16', '日照市', '2', '0');
INSERT INTO `ecs_region` VALUES ('181', '16', '莱芜市', '2', '0');
INSERT INTO `ecs_region` VALUES ('182', '16', '临沂市', '2', '0');
INSERT INTO `ecs_region` VALUES ('183', '16', '德州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('184', '16', '聊城市', '2', '0');
INSERT INTO `ecs_region` VALUES ('185', '16', '滨州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('186', '16', '菏泽市', '2', '0');
INSERT INTO `ecs_region` VALUES ('187', '17', '郑州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('188', '17', '开封市', '2', '0');
INSERT INTO `ecs_region` VALUES ('189', '17', '洛阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('190', '17', '平顶山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('191', '17', '安阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('192', '17', '鹤壁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('193', '17', '新乡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('194', '17', '焦作市', '2', '0');
INSERT INTO `ecs_region` VALUES ('195', '17', '濮阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('196', '17', '许昌市', '2', '0');
INSERT INTO `ecs_region` VALUES ('197', '17', '漯河市', '2', '0');
INSERT INTO `ecs_region` VALUES ('198', '17', '三门峡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('199', '17', '南阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('200', '17', '商丘市', '2', '0');
INSERT INTO `ecs_region` VALUES ('201', '17', '信阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('202', '17', '周口市', '2', '0');
INSERT INTO `ecs_region` VALUES ('203', '17', '驻马店市', '2', '0');
INSERT INTO `ecs_region` VALUES ('204', '18', '武汉市', '2', '0');
INSERT INTO `ecs_region` VALUES ('205', '18', '黄石市', '2', '0');
INSERT INTO `ecs_region` VALUES ('206', '18', '十堰市', '2', '0');
INSERT INTO `ecs_region` VALUES ('207', '18', '宜昌市', '2', '0');
INSERT INTO `ecs_region` VALUES ('208', '18', '襄阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('209', '18', '鄂州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('210', '18', '荆门市', '2', '0');
INSERT INTO `ecs_region` VALUES ('211', '18', '孝感市', '2', '0');
INSERT INTO `ecs_region` VALUES ('212', '18', '荆州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('213', '18', '黄冈市', '2', '0');
INSERT INTO `ecs_region` VALUES ('214', '18', '咸宁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('215', '18', '随州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('216', '18', '恩施土家族苗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('217', '19', '长沙市', '2', '0');
INSERT INTO `ecs_region` VALUES ('218', '19', '株洲市', '2', '0');
INSERT INTO `ecs_region` VALUES ('219', '19', '湘潭市', '2', '0');
INSERT INTO `ecs_region` VALUES ('220', '19', '衡阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('221', '19', '邵阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('222', '19', '岳阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('223', '19', '常德市', '2', '0');
INSERT INTO `ecs_region` VALUES ('224', '19', '张家界市', '2', '0');
INSERT INTO `ecs_region` VALUES ('225', '19', '益阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('226', '19', '郴州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('227', '19', '永州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('228', '19', '怀化市', '2', '0');
INSERT INTO `ecs_region` VALUES ('229', '19', '娄底市', '2', '0');
INSERT INTO `ecs_region` VALUES ('230', '19', '湘西土家族苗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('231', '20', '广州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('232', '20', '韶关市', '2', '0');
INSERT INTO `ecs_region` VALUES ('233', '20', '深圳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('234', '20', '珠海市', '2', '0');
INSERT INTO `ecs_region` VALUES ('235', '20', '汕头市', '2', '0');
INSERT INTO `ecs_region` VALUES ('236', '20', '佛山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('237', '20', '江门市', '2', '0');
INSERT INTO `ecs_region` VALUES ('238', '20', '湛江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('239', '20', '茂名市', '2', '0');
INSERT INTO `ecs_region` VALUES ('240', '20', '肇庆市', '2', '0');
INSERT INTO `ecs_region` VALUES ('241', '20', '惠州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('242', '20', '梅州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('243', '20', '汕尾市', '2', '0');
INSERT INTO `ecs_region` VALUES ('244', '20', '河源市', '2', '0');
INSERT INTO `ecs_region` VALUES ('245', '20', '阳江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('246', '20', '清远市', '2', '0');
INSERT INTO `ecs_region` VALUES ('247', '20', '东莞市', '2', '0');
INSERT INTO `ecs_region` VALUES ('248', '20', '中山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('249', '20', '东沙群岛', '2', '0');
INSERT INTO `ecs_region` VALUES ('250', '20', '潮州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('251', '20', '揭阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('252', '20', '云浮市', '2', '0');
INSERT INTO `ecs_region` VALUES ('253', '21', '南宁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('254', '21', '柳州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('255', '21', '桂林市', '2', '0');
INSERT INTO `ecs_region` VALUES ('256', '21', '梧州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('257', '21', '北海市', '2', '0');
INSERT INTO `ecs_region` VALUES ('258', '21', '防城港市', '2', '0');
INSERT INTO `ecs_region` VALUES ('259', '21', '钦州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('260', '21', '贵港市', '2', '0');
INSERT INTO `ecs_region` VALUES ('261', '21', '玉林市', '2', '0');
INSERT INTO `ecs_region` VALUES ('262', '21', '百色市', '2', '0');
INSERT INTO `ecs_region` VALUES ('263', '21', '贺州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('264', '21', '河池市', '2', '0');
INSERT INTO `ecs_region` VALUES ('265', '21', '来宾市', '2', '0');
INSERT INTO `ecs_region` VALUES ('266', '21', '崇左市', '2', '0');
INSERT INTO `ecs_region` VALUES ('267', '22', '海口市', '2', '0');
INSERT INTO `ecs_region` VALUES ('268', '22', '三亚市', '2', '0');
INSERT INTO `ecs_region` VALUES ('269', '22', '三沙市', '2', '0');
INSERT INTO `ecs_region` VALUES ('270', '23', '重庆市', '2', '0');
INSERT INTO `ecs_region` VALUES ('271', '24', '成都市', '2', '0');
INSERT INTO `ecs_region` VALUES ('272', '24', '自贡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('273', '24', '攀枝花市', '2', '0');
INSERT INTO `ecs_region` VALUES ('274', '24', '泸州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('275', '24', '德阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('276', '24', '绵阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('277', '24', '广元市', '2', '0');
INSERT INTO `ecs_region` VALUES ('278', '24', '遂宁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('279', '24', '内江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('280', '24', '乐山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('281', '24', '南充市', '2', '0');
INSERT INTO `ecs_region` VALUES ('282', '24', '眉山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('283', '24', '宜宾市', '2', '0');
INSERT INTO `ecs_region` VALUES ('284', '24', '广安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('285', '24', '达州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('286', '24', '雅安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('287', '24', '巴中市', '2', '0');
INSERT INTO `ecs_region` VALUES ('288', '24', '资阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('289', '24', '阿坝藏族羌族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('290', '24', '甘孜藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('291', '24', '凉山彝族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('292', '25', '贵阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('293', '25', '六盘水市', '2', '0');
INSERT INTO `ecs_region` VALUES ('294', '25', '遵义市', '2', '0');
INSERT INTO `ecs_region` VALUES ('295', '25', '安顺市', '2', '0');
INSERT INTO `ecs_region` VALUES ('296', '25', '铜仁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('297', '25', '黔西南布依族苗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('298', '25', '毕节市', '2', '0');
INSERT INTO `ecs_region` VALUES ('299', '25', '黔东南苗族侗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('300', '25', '黔南布依族苗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('301', '26', '昆明市', '2', '0');
INSERT INTO `ecs_region` VALUES ('302', '26', '曲靖市', '2', '0');
INSERT INTO `ecs_region` VALUES ('303', '26', '玉溪市', '2', '0');
INSERT INTO `ecs_region` VALUES ('304', '26', '保山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('305', '26', '昭通市', '2', '0');
INSERT INTO `ecs_region` VALUES ('306', '26', '丽江市', '2', '0');
INSERT INTO `ecs_region` VALUES ('307', '26', '普洱市', '2', '0');
INSERT INTO `ecs_region` VALUES ('308', '26', '临沧市', '2', '0');
INSERT INTO `ecs_region` VALUES ('309', '26', '楚雄彝族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('310', '26', '红河哈尼族彝族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('311', '26', '文山壮族苗族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('312', '26', '西双版纳傣族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('313', '26', '大理白族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('314', '26', '德宏傣族景颇族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('315', '26', '怒江傈僳族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('316', '26', '迪庆藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('317', '27', '拉萨市', '2', '0');
INSERT INTO `ecs_region` VALUES ('318', '27', '昌都市', '2', '0');
INSERT INTO `ecs_region` VALUES ('319', '27', '山南地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('320', '27', '日喀则市', '2', '0');
INSERT INTO `ecs_region` VALUES ('321', '27', '那曲地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('322', '27', '阿里地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('323', '27', '林芝市', '2', '0');
INSERT INTO `ecs_region` VALUES ('324', '28', '西安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('325', '28', '铜川市', '2', '0');
INSERT INTO `ecs_region` VALUES ('326', '28', '宝鸡市', '2', '0');
INSERT INTO `ecs_region` VALUES ('327', '28', '咸阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('328', '28', '渭南市', '2', '0');
INSERT INTO `ecs_region` VALUES ('329', '28', '延安市', '2', '0');
INSERT INTO `ecs_region` VALUES ('330', '28', '汉中市', '2', '0');
INSERT INTO `ecs_region` VALUES ('331', '28', '榆林市', '2', '0');
INSERT INTO `ecs_region` VALUES ('332', '28', '安康市', '2', '0');
INSERT INTO `ecs_region` VALUES ('333', '28', '商洛市', '2', '0');
INSERT INTO `ecs_region` VALUES ('334', '29', '兰州市', '2', '0');
INSERT INTO `ecs_region` VALUES ('335', '29', '嘉峪关市', '2', '0');
INSERT INTO `ecs_region` VALUES ('336', '29', '金昌市', '2', '0');
INSERT INTO `ecs_region` VALUES ('337', '29', '白银市', '2', '0');
INSERT INTO `ecs_region` VALUES ('338', '29', '天水市', '2', '0');
INSERT INTO `ecs_region` VALUES ('339', '29', '武威市', '2', '0');
INSERT INTO `ecs_region` VALUES ('340', '29', '张掖市', '2', '0');
INSERT INTO `ecs_region` VALUES ('341', '29', '平凉市', '2', '0');
INSERT INTO `ecs_region` VALUES ('342', '29', '酒泉市', '2', '0');
INSERT INTO `ecs_region` VALUES ('343', '29', '庆阳市', '2', '0');
INSERT INTO `ecs_region` VALUES ('344', '29', '定西市', '2', '0');
INSERT INTO `ecs_region` VALUES ('345', '29', '陇南市', '2', '0');
INSERT INTO `ecs_region` VALUES ('346', '29', '临夏回族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('347', '29', '甘南藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('348', '30', '西宁市', '2', '0');
INSERT INTO `ecs_region` VALUES ('349', '30', '海东市', '2', '0');
INSERT INTO `ecs_region` VALUES ('350', '30', '海北藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('351', '30', '黄南藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('352', '30', '海南藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('353', '30', '果洛藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('354', '30', '玉树藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('355', '30', '海西蒙古族藏族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('356', '31', '银川市', '2', '0');
INSERT INTO `ecs_region` VALUES ('357', '31', '石嘴山市', '2', '0');
INSERT INTO `ecs_region` VALUES ('358', '31', '吴忠市', '2', '0');
INSERT INTO `ecs_region` VALUES ('359', '31', '固原市', '2', '0');
INSERT INTO `ecs_region` VALUES ('360', '31', '中卫市', '2', '0');
INSERT INTO `ecs_region` VALUES ('361', '32', '乌鲁木齐市', '2', '0');
INSERT INTO `ecs_region` VALUES ('362', '32', '克拉玛依市', '2', '0');
INSERT INTO `ecs_region` VALUES ('363', '32', '吐鲁番市', '2', '0');
INSERT INTO `ecs_region` VALUES ('364', '32', '哈密地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('365', '32', '昌吉回族自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('366', '32', '博尔塔拉蒙古自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('367', '32', '巴音郭楞蒙古自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('368', '32', '阿克苏地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('369', '32', '克孜勒苏柯尔克孜自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('370', '32', '喀什地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('371', '32', '和田地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('372', '32', '伊犁哈萨克自治州', '2', '0');
INSERT INTO `ecs_region` VALUES ('373', '32', '塔城地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('374', '32', '阿勒泰地区', '2', '0');
INSERT INTO `ecs_region` VALUES ('375', '33', '台北市', '2', '0');
INSERT INTO `ecs_region` VALUES ('376', '33', '高雄市', '2', '0');
INSERT INTO `ecs_region` VALUES ('377', '33', '台南市', '2', '0');
INSERT INTO `ecs_region` VALUES ('378', '33', '台中市', '2', '0');
INSERT INTO `ecs_region` VALUES ('379', '33', '金门县', '2', '0');
INSERT INTO `ecs_region` VALUES ('380', '33', '南投县', '2', '0');
INSERT INTO `ecs_region` VALUES ('381', '33', '基隆市', '2', '0');
INSERT INTO `ecs_region` VALUES ('382', '33', '新竹市', '2', '0');
INSERT INTO `ecs_region` VALUES ('383', '33', '嘉义市', '2', '0');
INSERT INTO `ecs_region` VALUES ('384', '33', '新北市', '2', '0');
INSERT INTO `ecs_region` VALUES ('385', '33', '宜兰县', '2', '0');
INSERT INTO `ecs_region` VALUES ('386', '33', '新竹县', '2', '0');
INSERT INTO `ecs_region` VALUES ('387', '33', '桃园县', '2', '0');
INSERT INTO `ecs_region` VALUES ('388', '33', '苗栗县', '2', '0');
INSERT INTO `ecs_region` VALUES ('389', '33', '彰化县', '2', '0');
INSERT INTO `ecs_region` VALUES ('390', '33', '嘉义县', '2', '0');
INSERT INTO `ecs_region` VALUES ('391', '33', '云林县', '2', '0');
INSERT INTO `ecs_region` VALUES ('392', '33', '屏东县', '2', '0');
INSERT INTO `ecs_region` VALUES ('393', '33', '台东县', '2', '0');
INSERT INTO `ecs_region` VALUES ('394', '33', '花莲县', '2', '0');
INSERT INTO `ecs_region` VALUES ('395', '33', '澎湖县', '2', '0');
INSERT INTO `ecs_region` VALUES ('396', '33', '连江县', '2', '0');
INSERT INTO `ecs_region` VALUES ('397', '34', '香港岛', '2', '0');
INSERT INTO `ecs_region` VALUES ('398', '34', '九龙', '2', '0');
INSERT INTO `ecs_region` VALUES ('399', '34', '新界', '2', '0');
INSERT INTO `ecs_region` VALUES ('400', '35', '澳门半岛', '2', '0');
INSERT INTO `ecs_region` VALUES ('401', '35', '离岛', '2', '0');
INSERT INTO `ecs_region` VALUES ('402', '36', '海外', '2', '0');
INSERT INTO `ecs_region` VALUES ('403', '37', '东城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('404', '37', '西城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('405', '37', '崇文区', '3', '0');
INSERT INTO `ecs_region` VALUES ('406', '37', '宣武区', '3', '0');
INSERT INTO `ecs_region` VALUES ('407', '37', '朝阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('408', '37', '丰台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('409', '37', '石景山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('410', '37', '海淀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('411', '37', '门头沟区', '3', '0');
INSERT INTO `ecs_region` VALUES ('412', '37', '房山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('413', '37', '通州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('414', '37', '顺义区', '3', '0');
INSERT INTO `ecs_region` VALUES ('415', '37', '昌平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('416', '37', '大兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('417', '37', '怀柔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('418', '37', '平谷区', '3', '0');
INSERT INTO `ecs_region` VALUES ('419', '37', '密云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('420', '37', '延庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('421', '37', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('422', '38', '和平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('423', '38', '河东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('424', '38', '河西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('425', '38', '南开区', '3', '0');
INSERT INTO `ecs_region` VALUES ('426', '38', '河北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('427', '38', '红桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('428', '38', '塘沽区', '3', '0');
INSERT INTO `ecs_region` VALUES ('429', '38', '汉沽区', '3', '0');
INSERT INTO `ecs_region` VALUES ('430', '38', '大港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('431', '38', '东丽区', '3', '0');
INSERT INTO `ecs_region` VALUES ('432', '38', '西青区', '3', '0');
INSERT INTO `ecs_region` VALUES ('433', '38', '津南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('434', '38', '北辰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('435', '38', '武清区', '3', '0');
INSERT INTO `ecs_region` VALUES ('436', '38', '宝坻区', '3', '0');
INSERT INTO `ecs_region` VALUES ('437', '38', '滨海新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('438', '38', '宁河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('439', '38', '静海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('440', '38', '蓟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('441', '38', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('442', '39', '长安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('443', '39', '桥东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('444', '39', '桥西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('445', '39', '新华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('446', '39', '井陉矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('447', '39', '裕华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('448', '39', '井陉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('449', '39', '正定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('450', '39', '栾城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('451', '39', '行唐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('452', '39', '灵寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('453', '39', '高邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('454', '39', '深泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('455', '39', '赞皇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('456', '39', '无极县', '3', '0');
INSERT INTO `ecs_region` VALUES ('457', '39', '平山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('458', '39', '元氏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('459', '39', '赵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('460', '39', '辛集市', '3', '0');
INSERT INTO `ecs_region` VALUES ('461', '39', '藁城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('462', '39', '晋州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('463', '39', '新乐市', '3', '0');
INSERT INTO `ecs_region` VALUES ('464', '39', '鹿泉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('465', '39', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('466', '40', '路南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('467', '40', '路北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('468', '40', '古冶区', '3', '0');
INSERT INTO `ecs_region` VALUES ('469', '40', '开平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('470', '40', '丰南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('471', '40', '丰润区', '3', '0');
INSERT INTO `ecs_region` VALUES ('472', '40', '滦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('473', '40', '滦南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('474', '40', '乐亭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('475', '40', '迁西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('476', '40', '玉田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('477', '40', '曹妃甸区', '3', '0');
INSERT INTO `ecs_region` VALUES ('478', '40', '遵化市', '3', '0');
INSERT INTO `ecs_region` VALUES ('479', '40', '迁安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('480', '40', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('481', '41', '海港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('482', '41', '山海关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('483', '41', '北戴河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('484', '41', '青龙满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('485', '41', '昌黎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('486', '41', '抚宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('487', '41', '卢龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('488', '41', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('489', '41', '经济技术开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('490', '42', '邯山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('491', '42', '丛台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('492', '42', '复兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('493', '42', '峰峰矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('494', '42', '邯郸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('495', '42', '临漳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('496', '42', '成安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('497', '42', '大名县', '3', '0');
INSERT INTO `ecs_region` VALUES ('498', '42', '涉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('499', '42', '磁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('500', '42', '肥乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('501', '42', '永年县', '3', '0');
INSERT INTO `ecs_region` VALUES ('502', '42', '邱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('503', '42', '鸡泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('504', '42', '广平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('505', '42', '馆陶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('506', '42', '魏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('507', '42', '曲周县', '3', '0');
INSERT INTO `ecs_region` VALUES ('508', '42', '武安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('509', '42', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('510', '43', '桥东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('511', '43', '桥西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('512', '43', '邢台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('513', '43', '临城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('514', '43', '内丘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('515', '43', '柏乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('516', '43', '隆尧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('517', '43', '任县', '3', '0');
INSERT INTO `ecs_region` VALUES ('518', '43', '南和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('519', '43', '宁晋县', '3', '0');
INSERT INTO `ecs_region` VALUES ('520', '43', '巨鹿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('521', '43', '新河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('522', '43', '广宗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('523', '43', '平乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('524', '43', '威县', '3', '0');
INSERT INTO `ecs_region` VALUES ('525', '43', '清河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('526', '43', '临西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('527', '43', '南宫市', '3', '0');
INSERT INTO `ecs_region` VALUES ('528', '43', '沙河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('529', '43', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('530', '44', '新市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('531', '44', '北市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('532', '44', '南市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('533', '44', '满城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('534', '44', '清苑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('535', '44', '涞水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('536', '44', '阜平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('537', '44', '徐水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('538', '44', '定兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('539', '44', '唐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('540', '44', '高阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('541', '44', '容城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('542', '44', '涞源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('543', '44', '望都县', '3', '0');
INSERT INTO `ecs_region` VALUES ('544', '44', '安新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('545', '44', '易县', '3', '0');
INSERT INTO `ecs_region` VALUES ('546', '44', '曲阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('547', '44', '蠡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('548', '44', '顺平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('549', '44', '博野县', '3', '0');
INSERT INTO `ecs_region` VALUES ('550', '44', '雄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('551', '44', '涿州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('552', '44', '定州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('553', '44', '安国市', '3', '0');
INSERT INTO `ecs_region` VALUES ('554', '44', '高碑店市', '3', '0');
INSERT INTO `ecs_region` VALUES ('555', '44', '高开区', '3', '0');
INSERT INTO `ecs_region` VALUES ('556', '44', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('557', '45', '桥东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('558', '45', '桥西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('559', '45', '宣化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('560', '45', '下花园区', '3', '0');
INSERT INTO `ecs_region` VALUES ('561', '45', '宣化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('562', '45', '张北县', '3', '0');
INSERT INTO `ecs_region` VALUES ('563', '45', '康保县', '3', '0');
INSERT INTO `ecs_region` VALUES ('564', '45', '沽源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('565', '45', '尚义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('566', '45', '蔚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('567', '45', '阳原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('568', '45', '怀安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('569', '45', '万全县', '3', '0');
INSERT INTO `ecs_region` VALUES ('570', '45', '怀来县', '3', '0');
INSERT INTO `ecs_region` VALUES ('571', '45', '涿鹿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('572', '45', '赤城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('573', '45', '崇礼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('574', '45', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('575', '46', '双桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('576', '46', '双滦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('577', '46', '鹰手营子矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('578', '46', '承德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('579', '46', '兴隆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('580', '46', '平泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('581', '46', '滦平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('582', '46', '隆化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('583', '46', '丰宁满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('584', '46', '宽城满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('585', '46', '围场满族蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('586', '46', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('587', '47', '新华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('588', '47', '运河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('589', '47', '沧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('590', '47', '青县', '3', '0');
INSERT INTO `ecs_region` VALUES ('591', '47', '东光县', '3', '0');
INSERT INTO `ecs_region` VALUES ('592', '47', '海兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('593', '47', '盐山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('594', '47', '肃宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('595', '47', '南皮县', '3', '0');
INSERT INTO `ecs_region` VALUES ('596', '47', '吴桥县', '3', '0');
INSERT INTO `ecs_region` VALUES ('597', '47', '献县', '3', '0');
INSERT INTO `ecs_region` VALUES ('598', '47', '孟村回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('599', '47', '泊头市', '3', '0');
INSERT INTO `ecs_region` VALUES ('600', '47', '任丘市', '3', '0');
INSERT INTO `ecs_region` VALUES ('601', '47', '黄骅市', '3', '0');
INSERT INTO `ecs_region` VALUES ('602', '47', '河间市', '3', '0');
INSERT INTO `ecs_region` VALUES ('603', '47', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('604', '48', '安次区', '3', '0');
INSERT INTO `ecs_region` VALUES ('605', '48', '广阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('606', '48', '固安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('607', '48', '永清县', '3', '0');
INSERT INTO `ecs_region` VALUES ('608', '48', '香河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('609', '48', '大城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('610', '48', '文安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('611', '48', '大厂回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('612', '48', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('613', '48', '燕郊经济技术开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('614', '48', '霸州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('615', '48', '三河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('616', '48', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('617', '49', '桃城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('618', '49', '枣强县', '3', '0');
INSERT INTO `ecs_region` VALUES ('619', '49', '武邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('620', '49', '武强县', '3', '0');
INSERT INTO `ecs_region` VALUES ('621', '49', '饶阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('622', '49', '安平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('623', '49', '故城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('624', '49', '景县', '3', '0');
INSERT INTO `ecs_region` VALUES ('625', '49', '阜城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('626', '49', '冀州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('627', '49', '深州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('628', '49', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('629', '50', '小店区', '3', '0');
INSERT INTO `ecs_region` VALUES ('630', '50', '迎泽区', '3', '0');
INSERT INTO `ecs_region` VALUES ('631', '50', '杏花岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('632', '50', '尖草坪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('633', '50', '万柏林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('634', '50', '晋源区', '3', '0');
INSERT INTO `ecs_region` VALUES ('635', '50', '清徐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('636', '50', '阳曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('637', '50', '娄烦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('638', '50', '古交市', '3', '0');
INSERT INTO `ecs_region` VALUES ('639', '50', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('640', '51', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('641', '51', '矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('642', '51', '南郊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('643', '51', '新荣区', '3', '0');
INSERT INTO `ecs_region` VALUES ('644', '51', '阳高县', '3', '0');
INSERT INTO `ecs_region` VALUES ('645', '51', '天镇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('646', '51', '广灵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('647', '51', '灵丘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('648', '51', '浑源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('649', '51', '左云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('650', '51', '大同县', '3', '0');
INSERT INTO `ecs_region` VALUES ('651', '51', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('652', '52', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('653', '52', '矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('654', '52', '郊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('655', '52', '平定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('656', '52', '盂县', '3', '0');
INSERT INTO `ecs_region` VALUES ('657', '52', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('658', '53', '长治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('659', '53', '襄垣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('660', '53', '屯留县', '3', '0');
INSERT INTO `ecs_region` VALUES ('661', '53', '平顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('662', '53', '黎城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('663', '53', '壶关县', '3', '0');
INSERT INTO `ecs_region` VALUES ('664', '53', '长子县', '3', '0');
INSERT INTO `ecs_region` VALUES ('665', '53', '武乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('666', '53', '沁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('667', '53', '沁源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('668', '53', '潞城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('669', '53', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('670', '53', '郊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('671', '53', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('672', '53', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('673', '54', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('674', '54', '沁水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('675', '54', '阳城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('676', '54', '陵川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('677', '54', '泽州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('678', '54', '高平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('679', '54', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('680', '55', '朔城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('681', '55', '平鲁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('682', '55', '山阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('683', '55', '应县', '3', '0');
INSERT INTO `ecs_region` VALUES ('684', '55', '右玉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('685', '55', '怀仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('686', '55', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('687', '56', '榆次区', '3', '0');
INSERT INTO `ecs_region` VALUES ('688', '56', '榆社县', '3', '0');
INSERT INTO `ecs_region` VALUES ('689', '56', '左权县', '3', '0');
INSERT INTO `ecs_region` VALUES ('690', '56', '和顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('691', '56', '昔阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('692', '56', '寿阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('693', '56', '太谷县', '3', '0');
INSERT INTO `ecs_region` VALUES ('694', '56', '祁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('695', '56', '平遥县', '3', '0');
INSERT INTO `ecs_region` VALUES ('696', '56', '灵石县', '3', '0');
INSERT INTO `ecs_region` VALUES ('697', '56', '介休市', '3', '0');
INSERT INTO `ecs_region` VALUES ('698', '56', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('699', '57', '盐湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('700', '57', '临猗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('701', '57', '万荣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('702', '57', '闻喜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('703', '57', '稷山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('704', '57', '新绛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('705', '57', '绛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('706', '57', '垣曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('707', '57', '夏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('708', '57', '平陆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('709', '57', '芮城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('710', '57', '永济市', '3', '0');
INSERT INTO `ecs_region` VALUES ('711', '57', '河津市', '3', '0');
INSERT INTO `ecs_region` VALUES ('712', '57', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('713', '58', '忻府区', '3', '0');
INSERT INTO `ecs_region` VALUES ('714', '58', '定襄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('715', '58', '五台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('716', '58', '代县', '3', '0');
INSERT INTO `ecs_region` VALUES ('717', '58', '繁峙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('718', '58', '宁武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('719', '58', '静乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('720', '58', '神池县', '3', '0');
INSERT INTO `ecs_region` VALUES ('721', '58', '五寨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('722', '58', '岢岚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('723', '58', '河曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('724', '58', '保德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('725', '58', '偏关县', '3', '0');
INSERT INTO `ecs_region` VALUES ('726', '58', '原平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('727', '58', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('728', '59', '尧都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('729', '59', '曲沃县', '3', '0');
INSERT INTO `ecs_region` VALUES ('730', '59', '翼城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('731', '59', '襄汾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('732', '59', '洪洞县', '3', '0');
INSERT INTO `ecs_region` VALUES ('733', '59', '古县', '3', '0');
INSERT INTO `ecs_region` VALUES ('734', '59', '安泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('735', '59', '浮山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('736', '59', '吉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('737', '59', '乡宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('738', '59', '大宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('739', '59', '隰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('740', '59', '永和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('741', '59', '蒲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('742', '59', '汾西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('743', '59', '侯马市', '3', '0');
INSERT INTO `ecs_region` VALUES ('744', '59', '霍州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('745', '59', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('746', '60', '离石区', '3', '0');
INSERT INTO `ecs_region` VALUES ('747', '60', '文水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('748', '60', '交城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('749', '60', '兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('750', '60', '临县', '3', '0');
INSERT INTO `ecs_region` VALUES ('751', '60', '柳林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('752', '60', '石楼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('753', '60', '岚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('754', '60', '方山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('755', '60', '中阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('756', '60', '交口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('757', '60', '孝义市', '3', '0');
INSERT INTO `ecs_region` VALUES ('758', '60', '汾阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('759', '60', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('760', '61', '新城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('761', '61', '回民区', '3', '0');
INSERT INTO `ecs_region` VALUES ('762', '61', '玉泉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('763', '61', '赛罕区', '3', '0');
INSERT INTO `ecs_region` VALUES ('764', '61', '土默特左旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('765', '61', '托克托县', '3', '0');
INSERT INTO `ecs_region` VALUES ('766', '61', '和林格尔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('767', '61', '清水河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('768', '61', '武川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('769', '61', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('770', '62', '东河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('771', '62', '昆都仑区', '3', '0');
INSERT INTO `ecs_region` VALUES ('772', '62', '青山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('773', '62', '石拐区', '3', '0');
INSERT INTO `ecs_region` VALUES ('774', '62', '白云鄂博矿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('775', '62', '九原区', '3', '0');
INSERT INTO `ecs_region` VALUES ('776', '62', '土默特右旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('777', '62', '固阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('778', '62', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('779', '62', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('780', '63', '海勃湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('781', '63', '海南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('782', '63', '乌达区', '3', '0');
INSERT INTO `ecs_region` VALUES ('783', '63', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('784', '64', '红山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('785', '64', '元宝山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('786', '64', '松山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('787', '64', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('788', '64', '巴林左旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('789', '64', '巴林右旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('790', '64', '林西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('791', '64', '克什克腾旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('792', '64', '翁牛特旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('793', '64', '喀喇沁旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('794', '64', '宁城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('795', '64', '敖汉旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('796', '64', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('797', '65', '科尔沁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('798', '65', '科尔沁左翼中旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('799', '65', '科尔沁左翼后旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('800', '65', '开鲁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('801', '65', '库伦旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('802', '65', '奈曼旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('803', '65', '扎鲁特旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('804', '65', '霍林郭勒市', '3', '0');
INSERT INTO `ecs_region` VALUES ('805', '65', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('806', '66', '东胜区', '3', '0');
INSERT INTO `ecs_region` VALUES ('807', '66', '达拉特旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('808', '66', '准格尔旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('809', '66', '鄂托克前旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('810', '66', '鄂托克旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('811', '66', '杭锦旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('812', '66', '乌审旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('813', '66', '伊金霍洛旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('814', '66', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('815', '67', '海拉尔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('816', '67', '扎赉诺尔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('817', '67', '阿荣旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('818', '67', '莫力达瓦达斡尔族自治旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('819', '67', '鄂伦春自治旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('820', '67', '鄂温克族自治旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('821', '67', '陈巴尔虎旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('822', '67', '新巴尔虎左旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('823', '67', '新巴尔虎右旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('824', '67', '满洲里市', '3', '0');
INSERT INTO `ecs_region` VALUES ('825', '67', '牙克石市', '3', '0');
INSERT INTO `ecs_region` VALUES ('826', '67', '扎兰屯市', '3', '0');
INSERT INTO `ecs_region` VALUES ('827', '67', '额尔古纳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('828', '67', '根河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('829', '67', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('830', '68', '临河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('831', '68', '五原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('832', '68', '磴口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('833', '68', '乌拉特前旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('834', '68', '乌拉特中旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('835', '68', '乌拉特后旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('836', '68', '杭锦后旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('837', '68', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('838', '69', '集宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('839', '69', '卓资县', '3', '0');
INSERT INTO `ecs_region` VALUES ('840', '69', '化德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('841', '69', '商都县', '3', '0');
INSERT INTO `ecs_region` VALUES ('842', '69', '兴和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('843', '69', '凉城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('844', '69', '察哈尔右翼前旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('845', '69', '察哈尔右翼中旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('846', '69', '察哈尔右翼后旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('847', '69', '四子王旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('848', '69', '丰镇市', '3', '0');
INSERT INTO `ecs_region` VALUES ('849', '69', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('850', '70', '乌兰浩特市', '3', '0');
INSERT INTO `ecs_region` VALUES ('851', '70', '阿尔山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('852', '70', '科尔沁右翼前旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('853', '70', '科尔沁右翼中旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('854', '70', '扎赉特旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('855', '70', '突泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('856', '70', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('857', '71', '二连浩特市', '3', '0');
INSERT INTO `ecs_region` VALUES ('858', '71', '锡林浩特市', '3', '0');
INSERT INTO `ecs_region` VALUES ('859', '71', '阿巴嘎旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('860', '71', '苏尼特左旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('861', '71', '苏尼特右旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('862', '71', '东乌珠穆沁旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('863', '71', '西乌珠穆沁旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('864', '71', '太仆寺旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('865', '71', '镶黄旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('866', '71', '正镶白旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('867', '71', '正蓝旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('868', '71', '多伦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('869', '71', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('870', '72', '阿拉善左旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('871', '72', '阿拉善右旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('872', '72', '额济纳旗', '3', '0');
INSERT INTO `ecs_region` VALUES ('873', '72', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('874', '73', '和平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('875', '73', '沈河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('876', '73', '大东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('877', '73', '皇姑区', '3', '0');
INSERT INTO `ecs_region` VALUES ('878', '73', '铁西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('879', '73', '苏家屯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('880', '73', '浑南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('881', '73', '新城子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('882', '73', '于洪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('883', '73', '辽中县', '3', '0');
INSERT INTO `ecs_region` VALUES ('884', '73', '康平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('885', '73', '法库县', '3', '0');
INSERT INTO `ecs_region` VALUES ('886', '73', '新民市', '3', '0');
INSERT INTO `ecs_region` VALUES ('887', '73', '浑南新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('888', '73', '张士开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('889', '73', '沈北新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('890', '73', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('891', '74', '中山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('892', '74', '西岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('893', '74', '沙河口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('894', '74', '甘井子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('895', '74', '旅顺口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('896', '74', '金州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('897', '74', '长海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('898', '74', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('899', '74', '瓦房店市', '3', '0');
INSERT INTO `ecs_region` VALUES ('900', '74', '普兰店市', '3', '0');
INSERT INTO `ecs_region` VALUES ('901', '74', '庄河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('902', '74', '岭前区', '3', '0');
INSERT INTO `ecs_region` VALUES ('903', '74', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('904', '75', '铁东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('905', '75', '铁西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('906', '75', '立山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('907', '75', '千山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('908', '75', '台安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('909', '75', '岫岩满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('910', '75', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('911', '75', '海城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('912', '75', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('913', '76', '新抚区', '3', '0');
INSERT INTO `ecs_region` VALUES ('914', '76', '东洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('915', '76', '望花区', '3', '0');
INSERT INTO `ecs_region` VALUES ('916', '76', '顺城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('917', '76', '抚顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('918', '76', '新宾满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('919', '76', '清原满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('920', '76', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('921', '77', '平山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('922', '77', '溪湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('923', '77', '明山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('924', '77', '南芬区', '3', '0');
INSERT INTO `ecs_region` VALUES ('925', '77', '本溪满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('926', '77', '桓仁满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('927', '77', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('928', '78', '元宝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('929', '78', '振兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('930', '78', '振安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('931', '78', '宽甸满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('932', '78', '东港市', '3', '0');
INSERT INTO `ecs_region` VALUES ('933', '78', '凤城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('934', '78', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('935', '79', '古塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('936', '79', '凌河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('937', '79', '太和区', '3', '0');
INSERT INTO `ecs_region` VALUES ('938', '79', '黑山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('939', '79', '义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('940', '79', '凌海市', '3', '0');
INSERT INTO `ecs_region` VALUES ('941', '79', '北镇市', '3', '0');
INSERT INTO `ecs_region` VALUES ('942', '79', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('943', '80', '站前区', '3', '0');
INSERT INTO `ecs_region` VALUES ('944', '80', '西市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('945', '80', '鲅鱼圈区', '3', '0');
INSERT INTO `ecs_region` VALUES ('946', '80', '老边区', '3', '0');
INSERT INTO `ecs_region` VALUES ('947', '80', '盖州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('948', '80', '大石桥市', '3', '0');
INSERT INTO `ecs_region` VALUES ('949', '80', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('950', '81', '海州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('951', '81', '新邱区', '3', '0');
INSERT INTO `ecs_region` VALUES ('952', '81', '太平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('953', '81', '清河门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('954', '81', '细河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('955', '81', '阜新蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('956', '81', '彰武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('957', '81', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('958', '82', '白塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('959', '82', '文圣区', '3', '0');
INSERT INTO `ecs_region` VALUES ('960', '82', '宏伟区', '3', '0');
INSERT INTO `ecs_region` VALUES ('961', '82', '弓长岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('962', '82', '太子河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('963', '82', '辽阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('964', '82', '灯塔市', '3', '0');
INSERT INTO `ecs_region` VALUES ('965', '82', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('966', '83', '双台子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('967', '83', '兴隆台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('968', '83', '大洼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('969', '83', '盘山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('970', '83', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('971', '84', '银州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('972', '84', '清河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('973', '84', '铁岭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('974', '84', '西丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('975', '84', '昌图县', '3', '0');
INSERT INTO `ecs_region` VALUES ('976', '84', '调兵山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('977', '84', '开原市', '3', '0');
INSERT INTO `ecs_region` VALUES ('978', '84', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('979', '85', '双塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('980', '85', '龙城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('981', '85', '朝阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('982', '85', '建平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('983', '85', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('984', '85', '北票市', '3', '0');
INSERT INTO `ecs_region` VALUES ('985', '85', '凌源市', '3', '0');
INSERT INTO `ecs_region` VALUES ('986', '85', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('987', '86', '连山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('988', '86', '龙港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('989', '86', '南票区', '3', '0');
INSERT INTO `ecs_region` VALUES ('990', '86', '绥中县', '3', '0');
INSERT INTO `ecs_region` VALUES ('991', '86', '建昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('992', '86', '兴城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('993', '86', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('994', '87', '南关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('995', '87', '宽城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('996', '87', '朝阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('997', '87', '二道区', '3', '0');
INSERT INTO `ecs_region` VALUES ('998', '87', '绿园区', '3', '0');
INSERT INTO `ecs_region` VALUES ('999', '87', '双阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1000', '87', '农安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1001', '87', '九台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1002', '87', '榆树市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1003', '87', '德惠市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1004', '87', '高新技术产业开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1005', '87', '汽车产业开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1006', '87', '经济技术开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1007', '87', '净月旅游开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1008', '87', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1009', '88', '昌邑区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1010', '88', '龙潭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1011', '88', '船营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1012', '88', '丰满区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1013', '88', '永吉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1014', '88', '蛟河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1015', '88', '桦甸市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1016', '88', '舒兰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1017', '88', '磐石市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1018', '88', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1019', '89', '铁西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1020', '89', '铁东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1021', '89', '梨树县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1022', '89', '伊通满族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1023', '89', '公主岭市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1024', '89', '双辽市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1025', '89', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1026', '90', '龙山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1027', '90', '西安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1028', '90', '东丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1029', '90', '东辽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1030', '90', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1031', '91', '东昌区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1032', '91', '二道江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1033', '91', '通化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1034', '91', '辉南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1035', '91', '柳河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1036', '91', '梅河口市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1037', '91', '集安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1038', '91', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1039', '92', '浑江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1040', '92', '抚松县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1041', '92', '靖宇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1042', '92', '长白朝鲜族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1043', '92', '江源区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1044', '92', '临江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1045', '92', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1046', '93', '宁江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1047', '93', '前郭尔罗斯蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1048', '93', '长岭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1049', '93', '乾安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1050', '93', '扶余市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1051', '93', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1052', '94', '洮北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1053', '94', '镇赉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1054', '94', '通榆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1055', '94', '洮南市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1056', '94', '大安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1057', '94', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1058', '95', '延吉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1059', '95', '图们市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1060', '95', '敦化市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1061', '95', '珲春市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1062', '95', '龙井市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1063', '95', '和龙市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1064', '95', '汪清县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1065', '95', '安图县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1066', '95', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1067', '96', '道里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1068', '96', '南岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1069', '96', '道外区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1070', '96', '香坊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1071', '96', '动力区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1072', '96', '平房区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1073', '96', '松北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1074', '96', '呼兰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1075', '96', '依兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1076', '96', '方正县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1077', '96', '宾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1078', '96', '巴彦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1079', '96', '木兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1080', '96', '通河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1081', '96', '延寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1082', '96', '阿城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1083', '96', '双城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1084', '96', '尚志市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1085', '96', '五常市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1086', '96', '阿城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1087', '96', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1088', '97', '龙沙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1089', '97', '建华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1090', '97', '铁锋区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1091', '97', '昂昂溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1092', '97', '富拉尔基区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1093', '97', '碾子山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1094', '97', '梅里斯达斡尔族区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1095', '97', '龙江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1096', '97', '依安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1097', '97', '泰来县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1098', '97', '甘南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1099', '97', '富裕县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1100', '97', '克山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1101', '97', '克东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1102', '97', '拜泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1103', '97', '讷河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1104', '97', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1105', '98', '鸡冠区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1106', '98', '恒山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1107', '98', '滴道区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1108', '98', '梨树区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1109', '98', '城子河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1110', '98', '麻山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1111', '98', '鸡东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1112', '98', '虎林市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1113', '98', '密山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1114', '98', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1115', '99', '向阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1116', '99', '工农区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1117', '99', '南山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1118', '99', '兴安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1119', '99', '东山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1120', '99', '兴山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1121', '99', '萝北县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1122', '99', '绥滨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1123', '99', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1124', '100', '尖山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1125', '100', '岭东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1126', '100', '四方台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1127', '100', '宝山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1128', '100', '集贤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1129', '100', '友谊县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1130', '100', '宝清县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1131', '100', '饶河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1132', '100', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1133', '101', '萨尔图区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1134', '101', '龙凤区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1135', '101', '让胡路区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1136', '101', '红岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1137', '101', '大同区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1138', '101', '肇州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1139', '101', '肇源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1140', '101', '林甸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1141', '101', '杜尔伯特蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1142', '101', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1143', '102', '伊春区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1144', '102', '南岔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1145', '102', '友好区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1146', '102', '西林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1147', '102', '翠峦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1148', '102', '新青区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1149', '102', '美溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1150', '102', '金山屯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1151', '102', '五营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1152', '102', '乌马河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1153', '102', '汤旺河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1154', '102', '带岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1155', '102', '乌伊岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1156', '102', '红星区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1157', '102', '上甘岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1158', '102', '嘉荫县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1159', '102', '铁力市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1160', '102', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1161', '103', '永红区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1162', '103', '向阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1163', '103', '前进区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1164', '103', '东风区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1165', '103', '郊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1166', '103', '桦南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1167', '103', '桦川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1168', '103', '汤原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1169', '103', '抚远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1170', '103', '同江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1171', '103', '富锦市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1172', '103', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1173', '104', '新兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1174', '104', '桃山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1175', '104', '茄子河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1176', '104', '勃利县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1177', '104', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1178', '105', '东安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1179', '105', '阳明区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1180', '105', '爱民区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1181', '105', '西安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1182', '105', '东宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1183', '105', '林口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1184', '105', '绥芬河市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1185', '105', '海林市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1186', '105', '宁安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1187', '105', '穆棱市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1188', '105', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1189', '106', '爱辉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1190', '106', '嫩江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1191', '106', '逊克县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1192', '106', '孙吴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1193', '106', '北安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1194', '106', '五大连池市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1195', '106', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1196', '107', '北林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1197', '107', '望奎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1198', '107', '兰西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1199', '107', '青冈县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1200', '107', '庆安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1201', '107', '明水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1202', '107', '绥棱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1203', '107', '安达市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1204', '107', '肇东市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1205', '107', '海伦市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1206', '107', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1207', '108', '松岭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1208', '108', '新林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1209', '108', '呼中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1210', '108', '呼玛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1211', '108', '塔河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1212', '108', '漠河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1213', '108', '加格达奇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1214', '108', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1215', '109', '黄浦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1216', '109', '卢湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1217', '109', '徐汇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1218', '109', '长宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1219', '109', '静安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1220', '109', '普陀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1221', '109', '闸北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1222', '109', '虹口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1223', '109', '杨浦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1224', '109', '闵行区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1225', '109', '宝山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1226', '109', '嘉定区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1227', '109', '浦东新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1228', '109', '金山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1229', '109', '松江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1230', '109', '青浦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1231', '109', '南汇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1232', '109', '奉贤区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1233', '109', '川沙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1234', '109', '崇明县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1235', '109', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1236', '110', '玄武区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1237', '110', '白下区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1238', '110', '秦淮区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1239', '110', '建邺区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1240', '110', '鼓楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1241', '110', '下关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1242', '110', '浦口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1243', '110', '栖霞区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1244', '110', '雨花台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1245', '110', '江宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1246', '110', '六合区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1247', '110', '溧水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1248', '110', '高淳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1249', '110', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1250', '111', '崇安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1251', '111', '南长区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1252', '111', '北塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1253', '111', '锡山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1254', '111', '惠山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1255', '111', '滨湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1256', '111', '江阴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1257', '111', '宜兴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1258', '111', '新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1259', '111', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1260', '112', '鼓楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1261', '112', '云龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1262', '112', '九里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1263', '112', '贾汪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1264', '112', '泉山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1265', '112', '丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1266', '112', '沛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1267', '112', '铜山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1268', '112', '睢宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1269', '112', '新沂市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1270', '112', '邳州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1271', '112', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1272', '113', '天宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1273', '113', '钟楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1274', '113', '戚墅堰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1275', '113', '新北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1276', '113', '武进区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1277', '113', '溧阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1278', '113', '金坛市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1279', '113', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1280', '114', '沧浪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1281', '114', '平江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1282', '114', '金阊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1283', '114', '虎丘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1284', '114', '吴中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1285', '114', '相城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1286', '114', '姑苏区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1287', '114', '常熟市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1288', '114', '张家港市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1289', '114', '昆山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1290', '114', '吴江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1291', '114', '太仓市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1292', '114', '新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1293', '114', '园区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1294', '114', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1295', '115', '崇川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1296', '115', '港闸区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1297', '115', '通州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1298', '115', '海安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1299', '115', '如东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1300', '115', '启东市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1301', '115', '如皋市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1302', '115', '通州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1303', '115', '海门市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1304', '115', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1305', '115', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1306', '116', '连云区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1307', '116', '新浦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1308', '116', '海州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1309', '116', '赣榆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1310', '116', '东海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1311', '116', '灌云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1312', '116', '灌南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1313', '116', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1314', '117', '清河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1315', '117', '淮安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1316', '117', '淮阴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1317', '117', '清浦区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1318', '117', '涟水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1319', '117', '洪泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1320', '117', '盱眙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1321', '117', '金湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1322', '117', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1323', '118', '亭湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1324', '118', '盐都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1325', '118', '响水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1326', '118', '滨海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1327', '118', '阜宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1328', '118', '射阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1329', '118', '建湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1330', '118', '东台市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1331', '118', '大丰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1332', '118', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1333', '119', '广陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1334', '119', '邗江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1335', '119', '维扬区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1336', '119', '宝应县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1337', '119', '仪征市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1338', '119', '高邮市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1339', '119', '江都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1340', '119', '经济开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1341', '119', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1342', '120', '京口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1343', '120', '润州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1344', '120', '丹徒区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1345', '120', '丹阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1346', '120', '扬中市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1347', '120', '句容市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1348', '120', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1349', '121', '海陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1350', '121', '高港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1351', '121', '兴化市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1352', '121', '靖江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1353', '121', '泰兴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1354', '121', '姜堰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1355', '121', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1356', '122', '宿城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1357', '122', '宿豫区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1358', '122', '沭阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1359', '122', '泗阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1360', '122', '泗洪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1361', '122', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1362', '123', '上城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1363', '123', '下城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1364', '123', '江干区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1365', '123', '拱墅区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1366', '123', '西湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1367', '123', '滨江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1368', '123', '萧山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1369', '123', '余杭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1370', '123', '桐庐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1371', '123', '淳安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1372', '123', '建德市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1373', '123', '富阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1374', '123', '临安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1375', '123', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1376', '124', '海曙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1377', '124', '江东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1378', '124', '江北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1379', '124', '北仑区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1380', '124', '镇海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1381', '124', '鄞州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1382', '124', '象山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1383', '124', '宁海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1384', '124', '余姚市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1385', '124', '慈溪市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1386', '124', '奉化市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1387', '124', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1388', '125', '鹿城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1389', '125', '龙湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1390', '125', '瓯海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1391', '125', '洞头县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1392', '125', '永嘉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1393', '125', '平阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1394', '125', '苍南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1395', '125', '文成县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1396', '125', '泰顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1397', '125', '瑞安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1398', '125', '乐清市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1399', '125', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1400', '126', '南湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1401', '126', '秀洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1402', '126', '嘉善县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1403', '126', '海盐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1404', '126', '海宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1405', '126', '平湖市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1406', '126', '桐乡市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1407', '126', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1408', '127', '吴兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1409', '127', '南浔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1410', '127', '德清县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1411', '127', '长兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1412', '127', '安吉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1413', '127', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1414', '128', '越城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1415', '128', '柯桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1416', '128', '新昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1417', '128', '诸暨市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1418', '128', '上虞区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1419', '128', '嵊州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1420', '128', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1421', '129', '婺城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1422', '129', '金东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1423', '129', '武义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1424', '129', '浦江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1425', '129', '磐安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1426', '129', '兰溪市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1427', '129', '义乌市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1428', '129', '东阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1429', '129', '永康市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1430', '129', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1431', '130', '柯城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1432', '130', '衢江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1433', '130', '常山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1434', '130', '开化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1435', '130', '龙游县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1436', '130', '江山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1437', '130', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1438', '131', '定海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1439', '131', '普陀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1440', '131', '岱山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1441', '131', '嵊泗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1442', '131', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1443', '132', '椒江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1444', '132', '黄岩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1445', '132', '路桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1446', '132', '玉环县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1447', '132', '三门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1448', '132', '天台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1449', '132', '仙居县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1450', '132', '温岭市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1451', '132', '临海市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1452', '132', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1453', '133', '莲都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1454', '133', '青田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1455', '133', '缙云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1456', '133', '遂昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1457', '133', '松阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1458', '133', '云和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1459', '133', '庆元县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1460', '133', '景宁畲族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1461', '133', '龙泉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1462', '133', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1463', '134', '瑶海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1464', '134', '庐阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1465', '134', '蜀山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1466', '134', '包河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1467', '134', '长丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1468', '134', '肥东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1469', '134', '肥西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1470', '134', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1471', '134', '中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1472', '134', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1473', '135', '镜湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1474', '135', '弋江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1475', '135', '鸠江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1476', '135', '三山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1477', '135', '芜湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1478', '135', '繁昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1479', '135', '南陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1480', '135', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1481', '136', '龙子湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1482', '136', '蚌山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1483', '136', '禹会区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1484', '136', '淮上区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1485', '136', '怀远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1486', '136', '五河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1487', '136', '固镇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1488', '136', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1489', '137', '大通区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1490', '137', '田家庵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1491', '137', '谢家集区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1492', '137', '八公山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1493', '137', '潘集区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1494', '137', '凤台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1495', '137', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1496', '138', '金家庄区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1497', '138', '花山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1498', '138', '雨山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1499', '138', '博望区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1500', '138', '当涂县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1501', '138', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1502', '139', '杜集区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1503', '139', '相山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1504', '139', '烈山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1505', '139', '濉溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1506', '139', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1507', '140', '铜官山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1508', '140', '狮子山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1509', '140', '郊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1510', '140', '铜陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1511', '140', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1512', '141', '迎江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1513', '141', '大观区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1514', '141', '宜秀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1515', '141', '怀宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1516', '141', '枞阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1517', '141', '潜山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1518', '141', '太湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1519', '141', '宿松县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1520', '141', '望江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1521', '141', '岳西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1522', '141', '桐城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1523', '141', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1524', '142', '屯溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1525', '142', '黄山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1526', '142', '徽州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1527', '142', '歙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1528', '142', '休宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1529', '142', '黟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1530', '142', '祁门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1531', '142', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1532', '143', '琅琊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1533', '143', '南谯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1534', '143', '来安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1535', '143', '全椒县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1536', '143', '定远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1537', '143', '凤阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1538', '143', '天长市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1539', '143', '明光市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1540', '143', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1541', '144', '颍州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1542', '144', '颍东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1543', '144', '颍泉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1544', '144', '临泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1545', '144', '太和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1546', '144', '阜南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1547', '144', '颍上县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1548', '144', '界首市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1549', '144', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1550', '145', '埇桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1551', '145', '砀山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1552', '145', '萧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1553', '145', '灵璧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1554', '145', '泗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1555', '145', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1556', '134', '巢湖市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1557', '134', '居巢区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1558', '134', '庐江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1559', '135', '无为县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1560', '138', '含山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1561', '138', '和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1562', '146', '金安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1563', '146', '裕安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1564', '146', '寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1565', '146', '霍邱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1566', '146', '舒城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1567', '146', '金寨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1568', '146', '霍山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1569', '146', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1570', '147', '谯城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1571', '147', '涡阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1572', '147', '蒙城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1573', '147', '利辛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1574', '147', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1575', '148', '贵池区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1576', '148', '东至县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1577', '148', '石台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1578', '148', '青阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1579', '148', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1580', '149', '宣州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1581', '149', '郎溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1582', '149', '广德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1583', '149', '泾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1584', '149', '绩溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1585', '149', '旌德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1586', '149', '宁国市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1587', '149', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1588', '150', '鼓楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1589', '150', '台江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1590', '150', '仓山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1591', '150', '马尾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1592', '150', '晋安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1593', '150', '闽侯县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1594', '150', '连江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1595', '150', '罗源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1596', '150', '闽清县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1597', '150', '永泰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1598', '150', '平潭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1599', '150', '福清市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1600', '150', '长乐市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1601', '150', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1602', '151', '思明区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1603', '151', '海沧区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1604', '151', '湖里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1605', '151', '集美区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1606', '151', '同安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1607', '151', '翔安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1608', '151', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1609', '152', '城厢区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1610', '152', '涵江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1611', '152', '荔城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1612', '152', '秀屿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1613', '152', '仙游县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1614', '152', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1615', '153', '梅列区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1616', '153', '三元区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1617', '153', '明溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1618', '153', '清流县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1619', '153', '宁化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1620', '153', '大田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1621', '153', '尤溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1622', '153', '沙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1623', '153', '将乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1624', '153', '泰宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1625', '153', '建宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1626', '153', '永安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1627', '153', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1628', '154', '鲤城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1629', '154', '丰泽区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1630', '154', '洛江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1631', '154', '泉港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1632', '154', '惠安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1633', '154', '安溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1634', '154', '永春县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1635', '154', '德化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1636', '154', '金门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1637', '154', '石狮市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1638', '154', '晋江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1639', '154', '南安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1640', '154', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1641', '155', '芗城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1642', '155', '龙文区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1643', '155', '云霄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1644', '155', '漳浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1645', '155', '诏安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1646', '155', '长泰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1647', '155', '东山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1648', '155', '南靖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1649', '155', '平和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1650', '155', '华安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1651', '155', '龙海市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1652', '155', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1653', '156', '延平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1654', '156', '顺昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1655', '156', '浦城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1656', '156', '光泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1657', '156', '松溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1658', '156', '政和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1659', '156', '邵武市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1660', '156', '武夷山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1661', '156', '建瓯市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1662', '156', '建阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1663', '156', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1664', '157', '新罗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1665', '157', '长汀县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1666', '157', '永定区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1667', '157', '上杭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1668', '157', '武平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1669', '157', '连城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1670', '157', '漳平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1671', '157', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1672', '158', '蕉城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1673', '158', '霞浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1674', '158', '古田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1675', '158', '屏南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1676', '158', '寿宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1677', '158', '周宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1678', '158', '柘荣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1679', '158', '福安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1680', '158', '福鼎市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1681', '158', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1682', '159', '东湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1683', '159', '西湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1684', '159', '青云谱区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1685', '159', '湾里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1686', '159', '青山湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1687', '159', '南昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1688', '159', '新建县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1689', '159', '安义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1690', '159', '进贤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1691', '159', '红谷滩新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1692', '159', '经济技术开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1693', '159', '昌北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1694', '159', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1695', '160', '昌江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1696', '160', '珠山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1697', '160', '浮梁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1698', '160', '乐平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1699', '160', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1700', '161', '安源区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1701', '161', '湘东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1702', '161', '莲花县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1703', '161', '上栗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1704', '161', '芦溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1705', '161', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1706', '162', '庐山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1707', '162', '浔阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1708', '162', '九江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1709', '162', '武宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1710', '162', '修水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1711', '162', '永修县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1712', '162', '德安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1713', '162', '星子县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1714', '162', '都昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1715', '162', '湖口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1716', '162', '彭泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1717', '162', '瑞昌市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1718', '162', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1719', '162', '共青城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1720', '163', '渝水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1721', '163', '分宜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1722', '163', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1723', '164', '月湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1724', '164', '余江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1725', '164', '贵溪市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1726', '164', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1727', '165', '章贡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1728', '165', '赣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1729', '165', '信丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1730', '165', '大余县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1731', '165', '上犹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1732', '165', '崇义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1733', '165', '安远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1734', '165', '龙南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1735', '165', '定南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1736', '165', '全南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1737', '165', '宁都县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1738', '165', '于都县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1739', '165', '兴国县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1740', '165', '会昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1741', '165', '寻乌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1742', '165', '石城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1743', '165', '黄金区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1744', '165', '瑞金市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1745', '165', '南康区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1746', '165', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1747', '166', '吉州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1748', '166', '青原区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1749', '166', '吉安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1750', '166', '吉水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1751', '166', '峡江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1752', '166', '新干县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1753', '166', '永丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1754', '166', '泰和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1755', '166', '遂川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1756', '166', '万安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1757', '166', '安福县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1758', '166', '永新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1759', '166', '井冈山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1760', '166', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1761', '167', '袁州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1762', '167', '奉新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1763', '167', '万载县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1764', '167', '上高县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1765', '167', '宜丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1766', '167', '靖安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1767', '167', '铜鼓县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1768', '167', '丰城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1769', '167', '樟树市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1770', '167', '高安市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1771', '167', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1772', '168', '临川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1773', '168', '南城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1774', '168', '黎川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1775', '168', '南丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1776', '168', '崇仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1777', '168', '乐安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1778', '168', '宜黄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1779', '168', '金溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1780', '168', '资溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1781', '168', '东乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1782', '168', '广昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1783', '168', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1784', '169', '信州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1785', '169', '上饶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1786', '169', '广丰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1787', '169', '玉山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1788', '169', '铅山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1789', '169', '横峰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1790', '169', '弋阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1791', '169', '余干县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1792', '169', '鄱阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1793', '169', '万年县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1794', '169', '婺源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1795', '169', '德兴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1796', '169', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1797', '170', '历下区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1798', '170', '市中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1799', '170', '槐荫区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1800', '170', '天桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1801', '170', '历城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1802', '170', '长清区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1803', '170', '平阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1804', '170', '济阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1805', '170', '商河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1806', '170', '章丘市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1807', '170', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1808', '171', '市南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1809', '171', '市北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1810', '171', '四方区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1811', '171', '黄岛区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1812', '171', '崂山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1813', '171', '李沧区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1814', '171', '城阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1815', '171', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1816', '171', '胶州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1817', '171', '即墨市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1818', '171', '平度市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1819', '171', '胶南市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1820', '171', '莱西市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1821', '171', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1822', '172', '淄川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1823', '172', '张店区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1824', '172', '博山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1825', '172', '临淄区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1826', '172', '周村区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1827', '172', '桓台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1828', '172', '高青县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1829', '172', '沂源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1830', '172', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1831', '173', '市中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1832', '173', '薛城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1833', '173', '峄城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1834', '173', '台儿庄区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1835', '173', '山亭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1836', '173', '滕州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1837', '173', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1838', '174', '东营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1839', '174', '河口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1840', '174', '垦利县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1841', '174', '利津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1842', '174', '广饶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1843', '174', '西城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1844', '174', '东城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1845', '174', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1846', '175', '芝罘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1847', '175', '福山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1848', '175', '牟平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1849', '175', '莱山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1850', '175', '长岛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1851', '175', '龙口市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1852', '175', '莱阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1853', '175', '莱州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1854', '175', '蓬莱市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1855', '175', '招远市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1856', '175', '栖霞市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1857', '175', '海阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1858', '175', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1859', '176', '潍城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1860', '176', '寒亭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1861', '176', '坊子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1862', '176', '奎文区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1863', '176', '临朐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1864', '176', '昌乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1865', '176', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1866', '176', '青州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1867', '176', '诸城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1868', '176', '寿光市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1869', '176', '安丘市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1870', '176', '高密市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1871', '176', '昌邑市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1872', '176', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1873', '177', '市中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1874', '177', '任城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1875', '177', '微山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1876', '177', '鱼台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1877', '177', '金乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1878', '177', '嘉祥县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1879', '177', '汶上县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1880', '177', '泗水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1881', '177', '梁山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1882', '177', '曲阜市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1883', '177', '兖州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1884', '177', '邹城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1885', '177', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1886', '178', '泰山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1887', '178', '岱岳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1888', '178', '宁阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1889', '178', '东平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1890', '178', '新泰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1891', '178', '肥城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1892', '178', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1893', '179', '环翠区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1894', '179', '文登区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1895', '179', '荣成市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1896', '179', '乳山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1897', '179', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1898', '180', '东港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1899', '180', '岚山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1900', '180', '五莲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1901', '180', '莒县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1902', '180', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1903', '181', '莱城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1904', '181', '钢城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1905', '181', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1906', '182', '兰山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1907', '182', '罗庄区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1908', '182', '河东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1909', '182', '沂南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1910', '182', '郯城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1911', '182', '沂水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1912', '182', '兰陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1913', '182', '费县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1914', '182', '平邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1915', '182', '莒南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1916', '182', '蒙阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1917', '182', '临沭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1918', '182', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1919', '183', '德城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1920', '183', '陵城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1921', '183', '宁津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1922', '183', '庆云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1923', '183', '临邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1924', '183', '齐河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1925', '183', '平原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1926', '183', '夏津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1927', '183', '武城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1928', '183', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1929', '183', '乐陵市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1930', '183', '禹城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1931', '183', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1932', '184', '东昌府区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1933', '184', '阳谷县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1934', '184', '莘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1935', '184', '茌平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1936', '184', '东阿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1937', '184', '冠县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1938', '184', '高唐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1939', '184', '临清市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1940', '184', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1941', '185', '滨城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1942', '185', '惠民县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1943', '185', '阳信县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1944', '185', '无棣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1945', '185', '沾化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1946', '185', '博兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1947', '185', '邹平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1948', '185', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1949', '186', '牡丹区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1950', '186', '曹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1951', '186', '单县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1952', '186', '成武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1953', '186', '巨野县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1954', '186', '郓城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1955', '186', '鄄城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1956', '186', '定陶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1957', '186', '东明县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1958', '186', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1959', '187', '中原区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1960', '187', '二七区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1961', '187', '管城回族区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1962', '187', '金水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1963', '187', '上街区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1964', '187', '惠济区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1965', '187', '中牟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1966', '187', '巩义市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1967', '187', '荥阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1968', '187', '新密市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1969', '187', '新郑市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1970', '187', '登封市', '3', '0');
INSERT INTO `ecs_region` VALUES ('1971', '187', '郑东新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1972', '187', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1973', '187', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1974', '188', '龙亭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1975', '188', '顺河回族区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1976', '188', '鼓楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1977', '188', '禹王台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1978', '188', '金明区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1979', '188', '杞县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1980', '188', '通许县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1981', '188', '尉氏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1982', '188', '祥符区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1983', '188', '兰考县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1984', '188', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1985', '189', '老城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1986', '189', '西工区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1987', '189', '瀍河回族区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1988', '189', '涧西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1989', '189', '吉利区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1990', '189', '洛龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('1991', '189', '孟津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1992', '189', '新安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1993', '189', '栾川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1994', '189', '嵩县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1995', '189', '汝阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1996', '189', '宜阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1997', '189', '洛宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1998', '189', '伊川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('1999', '189', '偃师市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2000', '190', '新华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2001', '190', '卫东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2002', '190', '石龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2003', '190', '湛河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2004', '190', '宝丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2005', '190', '叶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2006', '190', '鲁山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2007', '190', '郏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2008', '190', '舞钢市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2009', '190', '汝州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2010', '190', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2011', '191', '文峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2012', '191', '北关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2013', '191', '殷都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2014', '191', '龙安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2015', '191', '安阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2016', '191', '汤阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2017', '191', '滑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2018', '191', '内黄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2019', '191', '林州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2020', '191', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2021', '192', '鹤山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2022', '192', '山城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2023', '192', '淇滨区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2024', '192', '浚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2025', '192', '淇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2026', '192', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2027', '193', '红旗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2028', '193', '卫滨区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2029', '193', '凤泉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2030', '193', '牧野区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2031', '193', '新乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2032', '193', '获嘉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2033', '193', '原阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2034', '193', '延津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2035', '193', '封丘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2036', '193', '长垣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2037', '193', '卫辉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2038', '193', '辉县市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2039', '193', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2040', '194', '解放区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2041', '194', '中站区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2042', '194', '马村区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2043', '194', '山阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2044', '194', '修武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2045', '194', '博爱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2046', '194', '武陟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2047', '194', '温县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2048', '194', '沁阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2049', '194', '孟州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2050', '194', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2051', '195', '华龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2052', '195', '清丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2053', '195', '南乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2054', '195', '范县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2055', '195', '台前县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2056', '195', '濮阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2057', '195', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2058', '196', '魏都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2059', '196', '许昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2060', '196', '鄢陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2061', '196', '襄城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2062', '196', '禹州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2063', '196', '长葛市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2064', '196', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2065', '197', '源汇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2066', '197', '郾城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2067', '197', '召陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2068', '197', '舞阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2069', '197', '临颍县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2070', '197', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2071', '198', '湖滨区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2072', '198', '渑池县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2073', '198', '陕州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2074', '198', '卢氏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2075', '198', '义马市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2076', '198', '灵宝市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2077', '198', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2078', '199', '宛城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2079', '199', '卧龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2080', '199', '南召县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2081', '199', '方城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2082', '199', '西峡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2083', '199', '镇平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2084', '199', '内乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2085', '199', '淅川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2086', '199', '社旗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2087', '199', '唐河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2088', '199', '新野县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2089', '199', '桐柏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2090', '199', '邓州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2091', '199', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2092', '200', '梁园区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2093', '200', '睢阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2094', '200', '民权县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2095', '200', '睢县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2096', '200', '宁陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2097', '200', '柘城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2098', '200', '虞城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2099', '200', '夏邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2100', '200', '永城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2101', '200', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2102', '201', '浉河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2103', '201', '平桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2104', '201', '罗山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2105', '201', '光山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2106', '201', '新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2107', '201', '商城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2108', '201', '固始县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2109', '201', '潢川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2110', '201', '淮滨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2111', '201', '息县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2112', '201', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2113', '202', '川汇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2114', '202', '扶沟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2115', '202', '西华县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2116', '202', '商水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2117', '202', '沈丘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2118', '202', '郸城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2119', '202', '淮阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2120', '202', '太康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2121', '202', '鹿邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2122', '202', '项城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2123', '202', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2124', '203', '驿城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2125', '203', '西平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2126', '203', '上蔡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2127', '203', '平舆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2128', '203', '正阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2129', '203', '确山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2130', '203', '泌阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2131', '203', '汝南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2132', '203', '遂平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2133', '203', '新蔡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2134', '203', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2135', '204', '江岸区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2136', '204', '江汉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2137', '204', '硚口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2138', '204', '汉阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2139', '204', '武昌区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2140', '204', '青山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2141', '204', '洪山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2142', '204', '东西湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2143', '204', '汉南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2144', '204', '蔡甸区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2145', '204', '江夏区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2146', '204', '黄陂区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2147', '204', '新洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2148', '204', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2149', '205', '黄石港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2150', '205', '西塞山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2151', '205', '下陆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2152', '205', '铁山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2153', '205', '阳新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2154', '205', '大冶市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2155', '205', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2156', '206', '茅箭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2157', '206', '张湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2158', '206', '郧阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2159', '206', '郧西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2160', '206', '竹山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2161', '206', '竹溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2162', '206', '房县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2163', '206', '丹江口市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2164', '206', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2165', '206', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2166', '207', '西陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2167', '207', '伍家岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2168', '207', '点军区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2169', '207', '猇亭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2170', '207', '夷陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2171', '207', '远安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2172', '207', '兴山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2173', '207', '秭归县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2174', '207', '长阳土家族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2175', '207', '五峰土家族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2176', '207', '葛洲坝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2177', '207', '开发区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2178', '207', '宜都市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2179', '207', '当阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2180', '207', '枝江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2181', '207', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2182', '208', '襄城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2183', '208', '樊城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2184', '208', '襄州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2185', '208', '南漳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2186', '208', '谷城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2187', '208', '保康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2188', '208', '老河口市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2189', '208', '枣阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2190', '208', '宜城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2191', '208', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2192', '209', '梁子湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2193', '209', '华容区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2194', '209', '鄂城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2195', '209', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2196', '210', '东宝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2197', '210', '掇刀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2198', '210', '京山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2199', '210', '沙洋县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2200', '210', '钟祥市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2201', '210', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2202', '211', '孝南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2203', '211', '孝昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2204', '211', '大悟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2205', '211', '云梦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2206', '211', '应城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2207', '211', '安陆市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2208', '211', '汉川市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2209', '211', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2210', '212', '沙市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2211', '212', '荆州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2212', '212', '公安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2213', '212', '监利县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2214', '212', '江陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2215', '212', '石首市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2216', '212', '洪湖市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2217', '212', '松滋市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2218', '212', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2219', '213', '黄州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2220', '213', '团风县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2221', '213', '红安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2222', '213', '罗田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2223', '213', '英山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2224', '213', '浠水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2225', '213', '蕲春县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2226', '213', '黄梅县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2227', '213', '麻城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2228', '213', '武穴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2229', '213', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2230', '214', '咸安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2231', '214', '嘉鱼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2232', '214', '通城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2233', '214', '崇阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2234', '214', '通山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2235', '214', '赤壁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2236', '214', '温泉城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2237', '214', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2238', '215', '曾都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2239', '215', '随县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2240', '215', '广水市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2241', '215', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2242', '216', '恩施市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2243', '216', '利川市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2244', '216', '建始县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2245', '216', '巴东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2246', '216', '宣恩县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2247', '216', '咸丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2248', '216', '来凤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2249', '216', '鹤峰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2250', '216', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2251', '217', '芙蓉区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2252', '217', '天心区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2253', '217', '岳麓区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2254', '217', '开福区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2255', '217', '雨花区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2256', '217', '长沙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2257', '217', '望城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2258', '217', '宁乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2259', '217', '浏阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2260', '217', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2261', '218', '荷塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2262', '218', '芦淞区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2263', '218', '石峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2264', '218', '天元区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2265', '218', '株洲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2266', '218', '攸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2267', '218', '茶陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2268', '218', '炎陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2269', '218', '醴陵市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2270', '218', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2271', '219', '雨湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2272', '219', '岳塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2273', '219', '湘潭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2274', '219', '湘乡市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2275', '219', '韶山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2276', '219', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2277', '220', '珠晖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2278', '220', '雁峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2279', '220', '石鼓区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2280', '220', '蒸湘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2281', '220', '南岳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2282', '220', '衡阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2283', '220', '衡南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2284', '220', '衡山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2285', '220', '衡东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2286', '220', '祁东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2287', '220', '耒阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2288', '220', '常宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2289', '220', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2290', '221', '双清区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2291', '221', '大祥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2292', '221', '北塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2293', '221', '邵东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2294', '221', '新邵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2295', '221', '邵阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2296', '221', '隆回县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2297', '221', '洞口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2298', '221', '绥宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2299', '221', '新宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2300', '221', '城步苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2301', '221', '武冈市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2302', '221', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2303', '222', '岳阳楼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2304', '222', '云溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2305', '222', '君山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2306', '222', '岳阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2307', '222', '华容县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2308', '222', '湘阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2309', '222', '平江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2310', '222', '汨罗市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2311', '222', '临湘市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2312', '222', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2313', '223', '武陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2314', '223', '鼎城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2315', '223', '安乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2316', '223', '汉寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2317', '223', '澧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2318', '223', '临澧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2319', '223', '桃源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2320', '223', '石门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2321', '223', '津市市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2322', '223', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2323', '224', '永定区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2324', '224', '武陵源区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2325', '224', '慈利县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2326', '224', '桑植县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2327', '224', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2328', '225', '资阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2329', '225', '赫山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2330', '225', '南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2331', '225', '桃江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2332', '225', '安化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2333', '225', '沅江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2334', '225', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2335', '226', '北湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2336', '226', '苏仙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2337', '226', '桂阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2338', '226', '宜章县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2339', '226', '永兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2340', '226', '嘉禾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2341', '226', '临武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2342', '226', '汝城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2343', '226', '桂东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2344', '226', '安仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2345', '226', '资兴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2346', '226', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2347', '227', '零陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2348', '227', '冷水滩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2349', '227', '祁阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2350', '227', '东安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2351', '227', '双牌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2352', '227', '道县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2353', '227', '江永县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2354', '227', '宁远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2355', '227', '蓝山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2356', '227', '新田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2357', '227', '江华瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2358', '227', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2359', '228', '鹤城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2360', '228', '中方县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2361', '228', '沅陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2362', '228', '辰溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2363', '228', '溆浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2364', '228', '会同县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2365', '228', '麻阳苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2366', '228', '新晃侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2367', '228', '芷江侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2368', '228', '靖州苗族侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2369', '228', '通道侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2370', '228', '洪江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2371', '228', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2372', '229', '娄星区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2373', '229', '双峰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2374', '229', '新化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2375', '229', '冷水江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2376', '229', '涟源市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2377', '229', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2378', '230', '吉首市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2379', '230', '泸溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2380', '230', '凤凰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2381', '230', '花垣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2382', '230', '保靖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2383', '230', '古丈县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2384', '230', '永顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2385', '230', '龙山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2386', '230', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2387', '231', '荔湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2388', '231', '越秀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2389', '231', '海珠区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2390', '231', '天河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2391', '231', '白云区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2392', '231', '黄埔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2393', '231', '番禺区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2394', '231', '花都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2395', '231', '南沙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2396', '231', '萝岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2397', '231', '增城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2398', '231', '从化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2399', '231', '东山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2400', '231', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2401', '232', '武江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2402', '232', '浈江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2403', '232', '曲江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2404', '232', '始兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2405', '232', '仁化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2406', '232', '翁源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2407', '232', '乳源瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2408', '232', '新丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2409', '232', '乐昌市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2410', '232', '南雄市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2411', '232', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2412', '233', '罗湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2413', '233', '福田区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2414', '233', '南山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2415', '233', '宝安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2416', '233', '龙岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2417', '233', '盐田区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2418', '233', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2419', '233', '光明新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2420', '233', '坪山新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2421', '233', '大鹏新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2422', '233', '龙华新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2423', '234', '香洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2424', '234', '斗门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2425', '234', '金湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2426', '234', '金唐区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2427', '234', '南湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2428', '234', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2429', '235', '龙湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2430', '235', '金平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2431', '235', '濠江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2432', '235', '潮阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2433', '235', '潮南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2434', '235', '澄海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2435', '235', '南澳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2436', '235', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2437', '236', '禅城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2438', '236', '南海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2439', '236', '顺德区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2440', '236', '三水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2441', '236', '高明区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2442', '236', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2443', '237', '蓬江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2444', '237', '江海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2445', '237', '新会区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2446', '237', '台山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2447', '237', '开平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2448', '237', '鹤山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2449', '237', '恩平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2450', '237', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2451', '238', '赤坎区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2452', '238', '霞山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2453', '238', '坡头区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2454', '238', '麻章区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2455', '238', '遂溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2456', '238', '徐闻县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2457', '238', '廉江市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2458', '238', '雷州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2459', '238', '吴川市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2460', '238', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2461', '239', '茂南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2462', '239', '电白区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2463', '239', '电白县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2464', '239', '高州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2465', '239', '化州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2466', '239', '信宜市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2467', '239', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2468', '240', '端州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2469', '240', '鼎湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2470', '240', '广宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2471', '240', '怀集县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2472', '240', '封开县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2473', '240', '德庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2474', '240', '高要市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2475', '240', '四会市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2476', '240', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2477', '241', '惠城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2478', '241', '惠阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2479', '241', '博罗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2480', '241', '惠东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2481', '241', '龙门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2482', '241', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2483', '242', '梅江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2484', '242', '梅县区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2485', '242', '大埔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2486', '242', '丰顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2487', '242', '五华县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2488', '242', '平远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2489', '242', '蕉岭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2490', '242', '兴宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2491', '242', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2492', '243', '城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2493', '243', '海丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2494', '243', '陆河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2495', '243', '陆丰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2496', '243', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2497', '244', '源城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2498', '244', '紫金县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2499', '244', '龙川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2500', '244', '连平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2501', '244', '和平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2502', '244', '东源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2503', '244', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2504', '245', '江城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2505', '245', '阳西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2506', '245', '阳东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2507', '245', '阳春市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2508', '245', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2509', '246', '清城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2510', '246', '佛冈县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2511', '246', '阳山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2512', '246', '连山壮族瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2513', '246', '连南瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2514', '246', '清新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2515', '246', '英德市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2516', '246', '连州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2517', '246', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2518', '250', '湘桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2519', '250', '潮安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2520', '250', '饶平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2521', '250', '枫溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2522', '250', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2523', '251', '榕城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2524', '251', '揭东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2525', '251', '揭西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2526', '251', '惠来县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2527', '251', '普宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2528', '251', '东山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2529', '251', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2530', '252', '云城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2531', '252', '新兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2532', '252', '郁南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2533', '252', '云安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2534', '252', '罗定市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2535', '252', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2536', '253', '兴宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2537', '253', '青秀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2538', '253', '江南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2539', '253', '西乡塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2540', '253', '良庆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2541', '253', '邕宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2542', '253', '武鸣区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2543', '253', '隆安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2544', '253', '马山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2545', '253', '上林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2546', '253', '宾阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2547', '253', '横县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2548', '253', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2549', '254', '城中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2550', '254', '鱼峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2551', '254', '柳南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2552', '254', '柳北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2553', '254', '柳江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2554', '254', '柳城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2555', '254', '鹿寨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2556', '254', '融安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2557', '254', '融水苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2558', '254', '三江侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2559', '254', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2560', '255', '秀峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2561', '255', '叠彩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2562', '255', '象山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2563', '255', '七星区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2564', '255', '雁山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2565', '255', '阳朔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2566', '255', '临桂区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2567', '255', '灵川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2568', '255', '全州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2569', '255', '兴安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2570', '255', '永福县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2571', '255', '灌阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2572', '255', '龙胜各族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2573', '255', '资源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2574', '255', '平乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2575', '255', '荔浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2576', '255', '恭城瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2577', '255', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2578', '256', '万秀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2579', '256', '蝶山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2580', '256', '长洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2581', '256', '龙圩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2582', '256', '苍梧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2583', '256', '藤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2584', '256', '蒙山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2585', '256', '岑溪市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2586', '256', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2587', '257', '海城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2588', '257', '银海区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2589', '257', '铁山港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2590', '257', '合浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2591', '257', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2592', '258', '港口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2593', '258', '防城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2594', '258', '上思县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2595', '258', '东兴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2596', '258', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2597', '259', '钦南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2598', '259', '钦北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2599', '259', '灵山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2600', '259', '浦北县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2601', '259', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2602', '260', '港北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2603', '260', '港南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2604', '260', '覃塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2605', '260', '平南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2606', '260', '桂平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2607', '260', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2608', '261', '玉州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2609', '261', '福绵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2610', '261', '容县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2611', '261', '陆川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2612', '261', '博白县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2613', '261', '兴业县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2614', '261', '北流市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2615', '261', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2616', '262', '右江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2617', '262', '田阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2618', '262', '田东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2619', '262', '平果县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2620', '262', '德保县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2621', '262', '靖西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2622', '262', '那坡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2623', '262', '凌云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2624', '262', '乐业县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2625', '262', '田林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2626', '262', '西林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2627', '262', '隆林各族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2628', '262', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2629', '263', '八步区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2630', '263', '平桂管理区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2631', '263', '昭平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2632', '263', '钟山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2633', '263', '富川瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2634', '263', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2635', '264', '金城江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2636', '264', '南丹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2637', '264', '天峨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2638', '264', '凤山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2639', '264', '东兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2640', '264', '罗城仫佬族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2641', '264', '环江毛南族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2642', '264', '巴马瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2643', '264', '都安瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2644', '264', '大化瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2645', '264', '宜州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2646', '264', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2647', '265', '兴宾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2648', '265', '忻城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2649', '265', '象州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2650', '265', '武宣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2651', '265', '金秀瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2652', '265', '合山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2653', '265', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2654', '266', '江州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2655', '266', '扶绥县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2656', '266', '宁明县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2657', '266', '龙州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2658', '266', '大新县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2659', '266', '天等县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2660', '266', '凭祥市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2661', '266', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2662', '267', '秀英区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2663', '267', '龙华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2664', '267', '琼山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2665', '267', '美兰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2666', '267', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2667', '269', '西沙群岛', '3', '0');
INSERT INTO `ecs_region` VALUES ('2668', '269', '南沙群岛', '3', '0');
INSERT INTO `ecs_region` VALUES ('2669', '269', '中沙群岛的岛礁及其海域', '3', '0');
INSERT INTO `ecs_region` VALUES ('2670', '189', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2671', '189', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2672', '270', '万州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2673', '270', '涪陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2674', '270', '渝中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2675', '270', '大渡口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2676', '270', '江北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2677', '270', '沙坪坝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2678', '270', '九龙坡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2679', '270', '南岸区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2680', '270', '北碚区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2681', '270', '万盛区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2682', '270', '双桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2683', '270', '渝北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2684', '270', '巴南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2685', '270', '黔江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2686', '270', '长寿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2687', '270', '綦江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2688', '270', '潼南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2689', '270', '铜梁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2690', '270', '大足区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2691', '270', '荣昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2692', '270', '璧山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2693', '270', '梁平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2694', '270', '城口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2695', '270', '丰都县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2696', '270', '垫江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2697', '270', '武隆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2698', '270', '忠县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2699', '270', '开县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2700', '270', '云阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2701', '270', '奉节县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2702', '270', '巫山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2703', '270', '巫溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2704', '270', '石柱土家族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2705', '270', '秀山土家族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2706', '270', '酉阳土家族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2707', '270', '彭水苗族土家族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2708', '270', '江津区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2709', '270', '合川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2710', '270', '永川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2711', '270', '南川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2712', '270', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2713', '271', '锦江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2714', '271', '青羊区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2715', '271', '金牛区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2716', '271', '武侯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2717', '271', '成华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2718', '271', '龙泉驿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2719', '271', '青白江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2720', '271', '新都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2721', '271', '温江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2722', '271', '金堂县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2723', '271', '双流县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2724', '271', '郫县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2725', '271', '大邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2726', '271', '蒲江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2727', '271', '新津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2728', '271', '都江堰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2729', '271', '彭州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2730', '271', '邛崃市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2731', '271', '崇州市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2732', '271', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2733', '272', '自流井区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2734', '272', '贡井区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2735', '272', '大安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2736', '272', '沿滩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2737', '272', '荣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2738', '272', '富顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2739', '272', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2740', '273', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2741', '273', '西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2742', '273', '仁和区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2743', '273', '米易县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2744', '273', '盐边县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2745', '273', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2746', '274', '江阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2747', '274', '纳溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2748', '274', '龙马潭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2749', '274', '泸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2750', '274', '合江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2751', '274', '叙永县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2752', '274', '古蔺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2753', '274', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2754', '275', '旌阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2755', '275', '中江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2756', '275', '罗江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2757', '275', '广汉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2758', '275', '什邡市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2759', '275', '绵竹市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2760', '275', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2761', '276', '涪城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2762', '276', '游仙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2763', '276', '三台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2764', '276', '盐亭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2765', '276', '安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2766', '276', '梓潼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2767', '276', '北川羌族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2768', '276', '平武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2769', '276', '高新区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2770', '276', '江油市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2771', '276', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2772', '277', '利州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2773', '277', '昭化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2774', '277', '朝天区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2775', '277', '旺苍县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2776', '277', '青川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2777', '277', '剑阁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2778', '277', '苍溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2779', '277', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2780', '278', '船山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2781', '278', '安居区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2782', '278', '蓬溪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2783', '278', '射洪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2784', '278', '大英县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2785', '278', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2786', '279', '市中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2787', '279', '东兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2788', '279', '威远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2789', '279', '资中县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2790', '279', '隆昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2791', '279', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2792', '280', '市中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2793', '280', '沙湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2794', '280', '五通桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2795', '280', '金口河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2796', '280', '犍为县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2797', '280', '井研县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2798', '280', '夹江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2799', '280', '沐川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2800', '280', '峨边彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2801', '280', '马边彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2802', '280', '峨眉山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2803', '280', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2804', '281', '顺庆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2805', '281', '高坪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2806', '281', '嘉陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2807', '281', '南部县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2808', '281', '营山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2809', '281', '蓬安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2810', '281', '仪陇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2811', '281', '西充县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2812', '281', '阆中市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2813', '281', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2814', '282', '东坡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2815', '282', '仁寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2816', '282', '彭山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2817', '282', '洪雅县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2818', '282', '丹棱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2819', '282', '青神县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2820', '282', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2821', '283', '翠屏区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2822', '283', '宜宾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2823', '283', '南溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2824', '283', '江安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2825', '283', '长宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2826', '283', '高县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2827', '283', '珙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2828', '283', '筠连县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2829', '283', '兴文县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2830', '283', '屏山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2831', '283', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2832', '284', '广安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2833', '284', '前锋区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2834', '284', '岳池县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2835', '284', '武胜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2836', '284', '邻水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2837', '284', '华蓥市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2838', '284', '市辖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2839', '284', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2840', '285', '通川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2841', '285', '达川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2842', '285', '宣汉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2843', '285', '开江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2844', '285', '大竹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2845', '285', '渠县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2846', '285', '万源市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2847', '285', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2848', '286', '雨城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2849', '286', '名山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2850', '286', '荥经县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2851', '286', '汉源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2852', '286', '石棉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2853', '286', '天全县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2854', '286', '芦山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2855', '286', '宝兴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2856', '286', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2857', '287', '巴州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2858', '287', '恩阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2859', '287', '通江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2860', '287', '南江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2861', '287', '平昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2862', '287', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2863', '288', '雁江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2864', '288', '安岳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2865', '288', '乐至县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2866', '288', '简阳市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2867', '288', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2868', '289', '汶川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2869', '289', '理县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2870', '289', '茂县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2871', '289', '松潘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2872', '289', '九寨沟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2873', '289', '金川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2874', '289', '小金县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2875', '289', '黑水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2876', '289', '马尔康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2877', '289', '壤塘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2878', '289', '阿坝县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2879', '289', '若尔盖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2880', '289', '红原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2881', '289', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2882', '290', '康定市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2883', '290', '泸定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2884', '290', '丹巴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2885', '290', '九龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2886', '290', '雅江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2887', '290', '道孚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2888', '290', '炉霍县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2889', '290', '甘孜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2890', '290', '新龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2891', '290', '德格县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2892', '290', '白玉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2893', '290', '石渠县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2894', '290', '色达县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2895', '290', '理塘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2896', '290', '巴塘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2897', '290', '乡城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2898', '290', '稻城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2899', '290', '得荣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2900', '290', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2901', '291', '西昌市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2902', '291', '木里藏族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2903', '291', '盐源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2904', '291', '德昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2905', '291', '会理县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2906', '291', '会东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2907', '291', '宁南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2908', '291', '普格县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2909', '291', '布拖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2910', '291', '金阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2911', '291', '昭觉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2912', '291', '喜德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2913', '291', '冕宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2914', '291', '越西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2915', '291', '甘洛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2916', '291', '美姑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2917', '291', '雷波县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2918', '291', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2919', '292', '南明区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2920', '292', '云岩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2921', '292', '花溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2922', '292', '乌当区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2923', '292', '白云区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2924', '292', '小河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2925', '292', '开阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2926', '292', '息烽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2927', '292', '修文县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2928', '292', '观山湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2929', '292', '清镇市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2930', '292', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2931', '293', '钟山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2932', '293', '六枝特区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2933', '293', '水城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2934', '293', '盘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2935', '293', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2936', '294', '红花岗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2937', '294', '汇川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2938', '294', '遵义县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2939', '294', '桐梓县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2940', '294', '绥阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2941', '294', '正安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2942', '294', '道真仡佬族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2943', '294', '务川仡佬族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2944', '294', '凤冈县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2945', '294', '湄潭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2946', '294', '余庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2947', '294', '习水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2948', '294', '赤水市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2949', '294', '仁怀市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2950', '294', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2951', '295', '西秀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2952', '295', '平坝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2953', '295', '普定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2954', '295', '镇宁布依族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2955', '295', '关岭布依族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2956', '295', '紫云苗族布依族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2957', '295', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2958', '296', '碧江区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2959', '296', '江口县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2960', '296', '玉屏侗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2961', '296', '石阡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2962', '296', '思南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2963', '296', '印江土家族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2964', '296', '德江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2965', '296', '沿河土家族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2966', '296', '松桃苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2967', '296', '万山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2968', '296', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2969', '297', '兴义市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2970', '297', '兴仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2971', '297', '普安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2972', '297', '晴隆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2973', '297', '贞丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2974', '297', '望谟县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2975', '297', '册亨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2976', '297', '安龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2977', '297', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2978', '298', '七星关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2979', '298', '大方县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2980', '298', '黔西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2981', '298', '金沙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2982', '298', '织金县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2983', '298', '纳雍县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2984', '298', '威宁彝族回族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2985', '298', '赫章县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2986', '298', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('2987', '299', '凯里市', '3', '0');
INSERT INTO `ecs_region` VALUES ('2988', '299', '黄平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2989', '299', '施秉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2990', '299', '三穗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2991', '299', '镇远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2992', '299', '岑巩县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2993', '299', '天柱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2994', '299', '锦屏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2995', '299', '剑河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2996', '299', '台江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2997', '299', '黎平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2998', '299', '榕江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('2999', '299', '从江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3000', '299', '雷山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3001', '299', '麻江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3002', '299', '丹寨县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3003', '299', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3004', '300', '都匀市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3005', '300', '福泉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3006', '300', '荔波县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3007', '300', '贵定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3008', '300', '瓮安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3009', '300', '独山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3010', '300', '平塘县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3011', '300', '罗甸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3012', '300', '长顺县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3013', '300', '龙里县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3014', '300', '惠水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3015', '300', '三都水族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3016', '300', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3017', '301', '五华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3018', '301', '盘龙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3019', '301', '官渡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3020', '301', '西山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3021', '301', '东川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3022', '301', '呈贡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3023', '301', '晋宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3024', '301', '富民县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3025', '301', '宜良县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3026', '301', '石林彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3027', '301', '嵩明县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3028', '301', '禄劝彝族苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3029', '301', '寻甸回族彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3030', '301', '安宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3031', '301', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3032', '302', '麒麟区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3033', '302', '马龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3034', '302', '陆良县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3035', '302', '师宗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3036', '302', '罗平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3037', '302', '富源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3038', '302', '会泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3039', '302', '沾益县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3040', '302', '宣威市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3041', '302', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3042', '303', '红塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3043', '303', '江川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3044', '303', '澄江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3045', '303', '通海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3046', '303', '华宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3047', '303', '易门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3048', '303', '峨山彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3049', '303', '新平彝族傣族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3050', '303', '元江哈尼族彝族傣族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3051', '303', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3052', '304', '隆阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3053', '304', '施甸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3054', '304', '腾冲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3055', '304', '龙陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3056', '304', '昌宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3057', '304', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3058', '305', '昭阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3059', '305', '鲁甸县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3060', '305', '巧家县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3061', '305', '盐津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3062', '305', '大关县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3063', '305', '永善县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3064', '305', '绥江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3065', '305', '镇雄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3066', '305', '彝良县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3067', '305', '威信县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3068', '305', '水富县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3069', '305', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3070', '306', '古城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3071', '306', '玉龙纳西族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3072', '306', '永胜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3073', '306', '华坪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3074', '306', '宁蒗彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3075', '306', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3076', '307', '思茅区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3077', '307', '宁洱哈尼族彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3078', '307', '墨江哈尼族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3079', '307', '景东彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3080', '307', '景谷傣族彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3081', '307', '镇沅彝族哈尼族拉祜族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3082', '307', '江城哈尼族彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3083', '307', '孟连傣族拉祜族佤族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3084', '307', '澜沧拉祜族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3085', '307', '西盟佤族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3086', '307', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3087', '308', '临翔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3088', '308', '凤庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3089', '308', '云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3090', '308', '永德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3091', '308', '镇康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3092', '308', '双江拉祜族佤族布朗族傣族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3093', '308', '耿马傣族佤族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3094', '308', '沧源佤族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3095', '308', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3096', '309', '楚雄市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3097', '309', '双柏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3098', '309', '牟定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3099', '309', '南华县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3100', '309', '姚安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3101', '309', '大姚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3102', '309', '永仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3103', '309', '元谋县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3104', '309', '武定县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3105', '309', '禄丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3106', '309', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3107', '310', '个旧市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3108', '310', '开远市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3109', '310', '蒙自市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3110', '310', '屏边苗族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3111', '310', '建水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3112', '310', '石屏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3113', '310', '弥勒市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3114', '310', '泸西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3115', '310', '元阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3116', '310', '红河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3117', '310', '金平苗族瑶族傣族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3118', '310', '绿春县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3119', '310', '河口瑶族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3120', '310', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3121', '311', '文山市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3122', '311', '砚山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3123', '311', '西畴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3124', '311', '麻栗坡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3125', '311', '马关县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3126', '311', '丘北县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3127', '311', '广南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3128', '311', '富宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3129', '311', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3130', '312', '景洪市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3131', '312', '勐海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3132', '312', '勐腊县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3133', '312', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3134', '313', '大理市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3135', '313', '漾濞彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3136', '313', '祥云县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3137', '313', '宾川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3138', '313', '弥渡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3139', '313', '南涧彝族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3140', '313', '巍山彝族回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3141', '313', '永平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3142', '313', '云龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3143', '313', '洱源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3144', '313', '剑川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3145', '313', '鹤庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3146', '313', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3147', '314', '瑞丽市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3148', '314', '芒市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3149', '314', '梁河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3150', '314', '盈江县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3151', '314', '陇川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3152', '314', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3153', '315', '泸水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3154', '315', '福贡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3155', '315', '贡山独龙族怒族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3156', '315', '兰坪白族普米族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3157', '315', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3158', '316', '香格里拉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3159', '316', '德钦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3160', '316', '维西傈僳族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3161', '316', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3162', '317', '城关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3163', '317', '林周县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3164', '317', '当雄县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3165', '317', '尼木县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3166', '317', '曲水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3167', '317', '堆龙德庆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3168', '317', '达孜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3169', '317', '墨竹工卡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3170', '317', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3171', '318', '卡若区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3172', '318', '江达县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3173', '318', '贡觉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3174', '318', '类乌齐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3175', '318', '丁青县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3176', '318', '察雅县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3177', '318', '八宿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3178', '318', '左贡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3179', '318', '芒康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3180', '318', '洛隆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3181', '318', '边坝县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3182', '318', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3183', '319', '乃东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3184', '319', '扎囊县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3185', '319', '贡嘎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3186', '319', '桑日县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3187', '319', '琼结县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3188', '319', '曲松县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3189', '319', '措美县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3190', '319', '洛扎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3191', '319', '加查县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3192', '319', '隆子县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3193', '319', '错那县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3194', '319', '浪卡子县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3195', '319', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3196', '320', '桑珠孜区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3197', '320', '南木林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3198', '320', '江孜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3199', '320', '定日县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3200', '320', '萨迦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3201', '320', '拉孜县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3202', '320', '昂仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3203', '320', '谢通门县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3204', '320', '白朗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3205', '320', '仁布县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3206', '320', '康马县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3207', '320', '定结县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3208', '320', '仲巴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3209', '320', '亚东县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3210', '320', '吉隆县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3211', '320', '聂拉木县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3212', '320', '萨嘎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3213', '320', '岗巴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3214', '320', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3215', '321', '那曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3216', '321', '嘉黎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3217', '321', '比如县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3218', '321', '聂荣县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3219', '321', '安多县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3220', '321', '申扎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3221', '321', '索县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3222', '321', '班戈县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3223', '321', '巴青县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3224', '321', '尼玛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3225', '321', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3226', '321', '双湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3227', '322', '普兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3228', '322', '札达县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3229', '322', '噶尔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3230', '322', '日土县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3231', '322', '革吉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3232', '322', '改则县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3233', '322', '措勤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3234', '322', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3235', '323', '巴宜区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3236', '323', '工布江达县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3237', '323', '米林县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3238', '323', '墨脱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3239', '323', '波密县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3240', '323', '察隅县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3241', '323', '朗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3242', '323', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3243', '324', '新城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3244', '324', '碑林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3245', '324', '莲湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3246', '324', '灞桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3247', '324', '未央区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3248', '324', '雁塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3249', '324', '阎良区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3250', '324', '临潼区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3251', '324', '长安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3252', '324', '蓝田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3253', '324', '周至县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3254', '324', '户县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3255', '324', '高陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3256', '324', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3257', '325', '王益区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3258', '325', '印台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3259', '325', '耀州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3260', '325', '宜君县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3261', '325', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3262', '326', '渭滨区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3263', '326', '金台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3264', '326', '陈仓区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3265', '326', '凤翔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3266', '326', '岐山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3267', '326', '扶风县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3268', '326', '眉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3269', '326', '陇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3270', '326', '千阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3271', '326', '麟游县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3272', '326', '凤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3273', '326', '太白县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3274', '326', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3275', '327', '秦都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3276', '327', '杨陵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3277', '327', '渭城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3278', '327', '三原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3279', '327', '泾阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3280', '327', '乾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3281', '327', '礼泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3282', '327', '永寿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3283', '327', '彬县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3284', '327', '长武县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3285', '327', '旬邑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3286', '327', '淳化县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3287', '327', '武功县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3288', '327', '兴平市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3289', '327', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3290', '328', '临渭区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3291', '328', '华县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3292', '328', '潼关县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3293', '328', '大荔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3294', '328', '合阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3295', '328', '澄城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3296', '328', '蒲城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3297', '328', '白水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3298', '328', '富平县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3299', '328', '韩城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3300', '328', '华阴市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3301', '328', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3302', '329', '宝塔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3303', '329', '延长县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3304', '329', '延川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3305', '329', '子长县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3306', '329', '安塞县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3307', '329', '志丹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3308', '329', '吴起县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3309', '329', '甘泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3310', '329', '富县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3311', '329', '洛川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3312', '329', '宜川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3313', '329', '黄龙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3314', '329', '黄陵县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3315', '329', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3316', '330', '汉台区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3317', '330', '南郑县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3318', '330', '城固县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3319', '330', '洋县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3320', '330', '西乡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3321', '330', '勉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3322', '330', '宁强县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3323', '330', '略阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3324', '330', '镇巴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3325', '330', '留坝县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3326', '330', '佛坪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3327', '330', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3328', '331', '榆阳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3329', '331', '神木县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3330', '331', '府谷县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3331', '331', '横山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3332', '331', '靖边县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3333', '331', '定边县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3334', '331', '绥德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3335', '331', '米脂县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3336', '331', '佳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3337', '331', '吴堡县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3338', '331', '清涧县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3339', '331', '子洲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3340', '331', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3341', '332', '汉滨区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3342', '332', '汉阴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3343', '332', '石泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3344', '332', '宁陕县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3345', '332', '紫阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3346', '332', '岚皋县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3347', '332', '平利县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3348', '332', '镇坪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3349', '332', '旬阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3350', '332', '白河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3351', '332', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3352', '333', '商州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3353', '333', '洛南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3354', '333', '丹凤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3355', '333', '商南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3356', '333', '山阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3357', '333', '镇安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3358', '333', '柞水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3359', '333', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3360', '334', '城关区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3361', '334', '七里河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3362', '334', '西固区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3363', '334', '安宁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3364', '334', '红古区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3365', '334', '永登县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3366', '334', '皋兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3367', '334', '榆中县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3368', '334', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3369', '336', '金川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3370', '336', '永昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3371', '336', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3372', '337', '白银区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3373', '337', '平川区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3374', '337', '靖远县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3375', '337', '会宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3376', '337', '景泰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3377', '337', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3378', '338', '秦州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3379', '338', '麦积区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3380', '338', '清水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3381', '338', '秦安县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3382', '338', '甘谷县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3383', '338', '武山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3384', '338', '张家川回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3385', '338', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3386', '339', '凉州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3387', '339', '民勤县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3388', '339', '古浪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3389', '339', '天祝藏族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3390', '339', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3391', '340', '甘州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3392', '340', '肃南裕固族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3393', '340', '民乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3394', '340', '临泽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3395', '340', '高台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3396', '340', '山丹县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3397', '340', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3398', '341', '崆峒区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3399', '341', '泾川县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3400', '341', '灵台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3401', '341', '崇信县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3402', '341', '华亭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3403', '341', '庄浪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3404', '341', '静宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3405', '341', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3406', '342', '肃州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3407', '342', '金塔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3408', '342', '瓜州县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3409', '342', '肃北蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3410', '342', '阿克塞哈萨克族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3411', '342', '玉门市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3412', '342', '敦煌市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3413', '342', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3414', '343', '西峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3415', '343', '庆城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3416', '343', '环县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3417', '343', '华池县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3418', '343', '合水县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3419', '343', '正宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3420', '343', '宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3421', '343', '镇原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3422', '343', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3423', '344', '安定区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3424', '344', '通渭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3425', '344', '陇西县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3426', '344', '渭源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3427', '344', '临洮县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3428', '344', '漳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3429', '344', '岷县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3430', '344', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3431', '345', '武都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3432', '345', '成县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3433', '345', '文县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3434', '345', '宕昌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3435', '345', '康县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3436', '345', '西和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3437', '345', '礼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3438', '345', '徽县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3439', '345', '两当县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3440', '345', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3441', '346', '临夏市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3442', '346', '临夏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3443', '346', '康乐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3444', '346', '永靖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3445', '346', '广河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3446', '346', '和政县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3447', '346', '东乡族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3448', '346', '积石山保安族东乡族撒拉族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3449', '346', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3450', '347', '合作市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3451', '347', '临潭县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3452', '347', '卓尼县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3453', '347', '舟曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3454', '347', '迭部县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3455', '347', '玛曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3456', '347', '碌曲县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3457', '347', '夏河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3458', '347', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3459', '348', '城东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3460', '348', '城中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3461', '348', '城西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3462', '348', '城北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3463', '348', '大通回族土族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3464', '348', '湟中县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3465', '348', '湟源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3466', '348', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3467', '349', '平安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3468', '349', '民和回族土族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3469', '349', '乐都区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3470', '349', '互助土族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3471', '349', '化隆回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3472', '349', '循化撒拉族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3473', '349', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3474', '350', '门源回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3475', '350', '祁连县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3476', '350', '海晏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3477', '350', '刚察县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3478', '350', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3479', '351', '同仁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3480', '351', '尖扎县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3481', '351', '泽库县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3482', '351', '河南蒙古族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3483', '351', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3484', '352', '共和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3485', '352', '同德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3486', '352', '贵德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3487', '352', '兴海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3488', '352', '贵南县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3489', '352', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3490', '353', '玛沁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3491', '353', '班玛县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3492', '353', '甘德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3493', '353', '达日县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3494', '353', '久治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3495', '353', '玛多县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3496', '353', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3497', '354', '玉树市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3498', '354', '杂多县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3499', '354', '称多县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3500', '354', '治多县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3501', '354', '囊谦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3502', '354', '曲麻莱县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3503', '354', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3504', '355', '格尔木市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3505', '355', '德令哈市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3506', '355', '乌兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3507', '355', '都兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3508', '355', '天峻县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3509', '355', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3510', '356', '兴庆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3511', '356', '西夏区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3512', '356', '金凤区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3513', '356', '永宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3514', '356', '贺兰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3515', '356', '灵武市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3516', '356', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3517', '357', '大武口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3518', '357', '惠农区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3519', '357', '平罗县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3520', '357', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3521', '358', '利通区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3522', '358', '红寺堡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3523', '358', '盐池县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3524', '358', '同心县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3525', '358', '青铜峡市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3526', '358', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3527', '359', '原州区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3528', '359', '西吉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3529', '359', '隆德县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3530', '359', '泾源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3531', '359', '彭阳县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3532', '359', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3533', '360', '沙坡头区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3534', '360', '中宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3535', '360', '海原县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3536', '360', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3537', '361', '天山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3538', '361', '沙依巴克区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3539', '361', '新市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3540', '361', '水磨沟区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3541', '361', '头屯河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3542', '361', '达坂城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3543', '361', '东山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3544', '361', '米东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3545', '361', '乌鲁木齐县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3546', '361', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3547', '362', '独山子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3548', '362', '克拉玛依区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3549', '362', '白碱滩区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3550', '362', '乌尔禾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3551', '362', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3552', '363', '高昌区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3553', '363', '鄯善县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3554', '363', '托克逊县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3555', '363', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3556', '364', '哈密市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3557', '364', '巴里坤哈萨克自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3558', '364', '伊吾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3559', '364', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3560', '365', '昌吉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3561', '365', '阜康市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3562', '365', '米泉市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3563', '365', '呼图壁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3564', '365', '玛纳斯县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3565', '365', '奇台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3566', '365', '吉木萨尔县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3567', '365', '木垒哈萨克自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3568', '365', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3569', '366', '博乐市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3570', '366', '阿拉山口市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3571', '366', '精河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3572', '366', '温泉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3573', '366', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3574', '367', '库尔勒市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3575', '367', '轮台县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3576', '367', '尉犁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3577', '367', '若羌县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3578', '367', '且末县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3579', '367', '焉耆回族自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3580', '367', '和静县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3581', '367', '和硕县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3582', '367', '博湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3583', '367', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3584', '368', '阿克苏市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3585', '368', '温宿县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3586', '368', '库车县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3587', '368', '沙雅县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3588', '368', '新和县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3589', '368', '拜城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3590', '368', '乌什县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3591', '368', '阿瓦提县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3592', '368', '柯坪县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3593', '368', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3594', '369', '阿图什市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3595', '369', '阿克陶县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3596', '369', '阿合奇县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3597', '369', '乌恰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3598', '369', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3599', '370', '喀什市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3600', '370', '疏附县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3601', '370', '疏勒县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3602', '370', '英吉沙县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3603', '370', '泽普县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3604', '370', '莎车县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3605', '370', '叶城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3606', '370', '麦盖提县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3607', '370', '岳普湖县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3608', '370', '伽师县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3609', '370', '巴楚县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3610', '370', '塔什库尔干塔吉克自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3611', '370', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3612', '371', '和田市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3613', '371', '和田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3614', '371', '墨玉县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3615', '371', '皮山县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3616', '371', '洛浦县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3617', '371', '策勒县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3618', '371', '于田县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3619', '371', '民丰县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3620', '371', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3621', '372', '伊宁市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3622', '372', '奎屯市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3623', '372', '伊宁县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3624', '372', '察布查尔锡伯自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3625', '372', '霍城县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3626', '372', '巩留县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3627', '372', '新源县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3628', '372', '昭苏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3629', '372', '特克斯县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3630', '372', '尼勒克县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3631', '372', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3632', '373', '塔城市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3633', '373', '乌苏市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3634', '373', '额敏县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3635', '373', '沙湾县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3636', '373', '托里县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3637', '373', '裕民县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3638', '373', '和布克赛尔蒙古自治县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3639', '373', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3640', '374', '阿勒泰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3641', '374', '布尔津县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3642', '374', '富蕴县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3643', '374', '福海县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3644', '374', '哈巴河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3645', '374', '青河县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3646', '374', '吉木乃县', '3', '0');
INSERT INTO `ecs_region` VALUES ('3647', '374', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3648', '375', '中正区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3649', '375', '大同区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3650', '375', '中山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3651', '375', '松山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3652', '375', '大安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3653', '375', '万华区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3654', '375', '信义区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3655', '375', '士林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3656', '375', '北投区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3657', '375', '内湖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3658', '375', '南港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3659', '375', '文山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3660', '375', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3661', '376', '新兴区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3662', '376', '前金区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3663', '376', '芩雅区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3664', '376', '盐埕区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3665', '376', '鼓山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3666', '376', '旗津区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3667', '376', '前镇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3668', '376', '三民区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3669', '376', '左营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3670', '376', '楠梓区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3671', '376', '小港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3672', '376', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3673', '376', '苓雅区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3674', '376', '仁武区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3675', '376', '大社区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3676', '376', '冈山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3677', '376', '路竹区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3678', '376', '阿莲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3679', '376', '田寮区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3680', '376', '燕巢区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3681', '376', '桥头区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3682', '376', '梓官区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3683', '376', '弥陀区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3684', '376', '永安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3685', '376', '湖内区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3686', '376', '凤山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3687', '376', '大寮区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3688', '376', '林园区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3689', '376', '鸟松区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3690', '376', '大树区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3691', '376', '旗山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3692', '376', '美浓区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3693', '376', '六龟区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3694', '376', '内门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3695', '376', '杉林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3696', '376', '甲仙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3697', '376', '桃源区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3698', '376', '那玛夏区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3699', '376', '茂林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3700', '376', '茄萣区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3701', '377', '中西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3702', '377', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3703', '377', '南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3704', '377', '北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3705', '377', '安平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3706', '377', '安南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3707', '377', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3708', '377', '永康区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3709', '377', '归仁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3710', '377', '新化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3711', '377', '左镇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3712', '377', '玉井区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3713', '377', '楠西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3714', '377', '南化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3715', '377', '仁德区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3716', '377', '关庙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3717', '377', '龙崎区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3718', '377', '官田区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3719', '377', '麻豆区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3720', '377', '佳里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3721', '377', '西港区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3722', '377', '七股区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3723', '377', '将军区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3724', '377', '学甲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3725', '377', '北门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3726', '377', '新营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3727', '377', '后壁区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3728', '377', '白河区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3729', '377', '东山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3730', '377', '六甲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3731', '377', '下营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3732', '377', '柳营区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3733', '377', '盐水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3734', '377', '善化区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3735', '377', '大内区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3736', '377', '山上区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3737', '377', '新市区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3738', '377', '安定区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3739', '378', '中区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3740', '378', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3741', '378', '南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3742', '378', '西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3743', '378', '北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3744', '378', '北屯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3745', '378', '西屯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3746', '378', '南屯区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3747', '378', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3748', '378', '太平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3749', '378', '大里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3750', '378', '雾峰区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3751', '378', '乌日区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3752', '378', '丰原区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3753', '378', '后里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3754', '378', '石冈区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3755', '378', '东势区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3756', '378', '和平区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3757', '378', '新社区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3758', '378', '潭子区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3759', '378', '大雅区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3760', '378', '神冈区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3761', '378', '大肚区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3762', '378', '沙鹿区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3763', '378', '龙井区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3764', '378', '梧栖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3765', '378', '清水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3766', '378', '大甲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3767', '378', '外埔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3768', '378', '大安区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3769', '379', '金沙镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3770', '379', '金湖镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3771', '379', '金宁乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3772', '379', '金城镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3773', '379', '烈屿乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3774', '379', '乌坵乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3775', '380', '南投市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3776', '380', '中寮乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3777', '380', '草屯镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3778', '380', '国姓乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3779', '380', '埔里镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3780', '380', '仁爱乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3781', '380', '名间乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3782', '380', '集集镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3783', '380', '水里乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3784', '380', '鱼池乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3785', '380', '信义乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3786', '380', '竹山镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3787', '380', '鹿谷乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3788', '381', '仁爱区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3789', '381', '信义区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3790', '381', '中正区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3791', '381', '中山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3792', '381', '安乐区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3793', '381', '暖暖区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3794', '381', '七堵区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3795', '381', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3796', '382', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3797', '382', '北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3798', '382', '香山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3799', '382', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3800', '383', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3801', '383', '西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3802', '383', '其它区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3803', '384', '万里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3804', '384', '金山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3805', '384', '板桥区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3806', '384', '汐止区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3807', '384', '深坑区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3808', '384', '石碇区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3809', '384', '瑞芳区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3810', '384', '平溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3811', '384', '双溪区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3812', '384', '贡寮区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3813', '384', '新店区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3814', '384', '坪林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3815', '384', '乌来区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3816', '384', '永和区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3817', '384', '中和区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3818', '384', '土城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3819', '384', '三峡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3820', '384', '树林区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3821', '384', '莺歌区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3822', '384', '三重区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3823', '384', '新庄区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3824', '384', '泰山区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3825', '384', '林口区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3826', '384', '芦洲区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3827', '384', '五股区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3828', '384', '八里区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3829', '384', '淡水区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3830', '384', '三芝区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3831', '384', '石门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('3832', '385', '宜兰市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3833', '385', '头城镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3834', '385', '礁溪乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3835', '385', '壮围乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3836', '385', '员山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3837', '385', '罗东镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3838', '385', '三星乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3839', '385', '大同乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3840', '385', '五结乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3841', '385', '冬山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3842', '385', '苏澳镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3843', '385', '南澳乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3844', '385', '钓鱼台', '3', '0');
INSERT INTO `ecs_region` VALUES ('3845', '386', '竹北市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3846', '386', '湖口乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3847', '386', '新丰乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3848', '386', '新埔镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3849', '386', '关西镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3850', '386', '芎林乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3851', '386', '宝山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3852', '386', '竹东镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3853', '386', '五峰乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3854', '386', '横山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3855', '386', '尖石乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3856', '386', '北埔乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3857', '386', '峨眉乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3858', '387', '中坜市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3859', '387', '平镇市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3860', '387', '龙潭乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3861', '387', '杨梅市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3862', '387', '新屋乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3863', '387', '观音乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3864', '387', '桃园市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3865', '387', '龟山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3866', '387', '八德市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3867', '387', '大溪镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3868', '387', '复兴乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3869', '387', '大园乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3870', '387', '芦竹乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3871', '388', '竹南镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3872', '388', '头份镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3873', '388', '三湾乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3874', '388', '南庄乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3875', '388', '狮潭乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3876', '388', '后龙镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3877', '388', '通霄镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3878', '388', '苑里镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3879', '388', '苗栗市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3880', '388', '造桥乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3881', '388', '头屋乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3882', '388', '公馆乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3883', '388', '大湖乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3884', '388', '泰安乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3885', '388', '铜锣乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3886', '388', '三义乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3887', '388', '西湖乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3888', '388', '卓兰镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3889', '389', '彰化市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3890', '389', '芬园乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3891', '389', '花坛乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3892', '389', '秀水乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3893', '389', '鹿港镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3894', '389', '福兴乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3895', '389', '线西乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3896', '389', '和美镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3897', '389', '伸港乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3898', '389', '员林镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3899', '389', '社头乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3900', '389', '永靖乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3901', '389', '埔心乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3902', '389', '溪湖镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3903', '389', '大村乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3904', '389', '埔盐乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3905', '389', '田中镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3906', '389', '北斗镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3907', '389', '田尾乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3908', '389', '埤头乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3909', '389', '溪州乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3910', '389', '竹塘乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3911', '389', '二林镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3912', '389', '大城乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3913', '389', '芳苑乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3914', '389', '二水乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3915', '390', '番路乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3916', '390', '梅山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3917', '390', '竹崎乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3918', '390', '阿里山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3919', '390', '中埔乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3920', '390', '大埔乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3921', '390', '水上乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3922', '390', '鹿草乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3923', '390', '太保市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3924', '390', '朴子市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3925', '390', '东石乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3926', '390', '六脚乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3927', '390', '新港乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3928', '390', '民雄乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3929', '390', '大林镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3930', '390', '溪口乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3931', '390', '义竹乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3932', '390', '布袋镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3933', '391', '斗南镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3934', '391', '大埤乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3935', '391', '虎尾镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3936', '391', '土库镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3937', '391', '褒忠乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3938', '391', '东势乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3939', '391', '台西乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3940', '391', '仑背乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3941', '391', '麦寮乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3942', '391', '斗六市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3943', '391', '林内乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3944', '391', '古坑乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3945', '391', '莿桐乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3946', '391', '西螺镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3947', '391', '二仑乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3948', '391', '北港镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3949', '391', '水林乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3950', '391', '口湖乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3951', '391', '四湖乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3952', '391', '元长乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3953', '392', '屏东市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3954', '392', '三地门乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3955', '392', '雾台乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3956', '392', '玛家乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3957', '392', '九如乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3958', '392', '里港乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3959', '392', '高树乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3960', '392', '盐埔乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3961', '392', '长治乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3962', '392', '麟洛乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3963', '392', '竹田乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3964', '392', '内埔乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3965', '392', '万丹乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3966', '392', '潮州镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3967', '392', '泰武乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3968', '392', '来义乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3969', '392', '万峦乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3970', '392', '崁顶乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3971', '392', '新埤乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3972', '392', '南州乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3973', '392', '林边乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3974', '392', '东港镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3975', '392', '琉球乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3976', '392', '佳冬乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3977', '392', '新园乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3978', '392', '枋寮乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3979', '392', '枋山乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3980', '392', '春日乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3981', '392', '狮子乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3982', '392', '车城乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3983', '392', '牡丹乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3984', '392', '恒春镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3985', '392', '满州乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3986', '393', '台东市', '3', '0');
INSERT INTO `ecs_region` VALUES ('3987', '393', '绿岛乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3988', '393', '兰屿乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3989', '393', '延平乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3990', '393', '卑南乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3991', '393', '鹿野乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3992', '393', '关山镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3993', '393', '海端乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3994', '393', '池上乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3995', '393', '东河乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3996', '393', '成功镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('3997', '393', '长滨乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3998', '393', '金峰乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('3999', '393', '大武乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4000', '393', '达仁乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4001', '393', '太麻里乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4002', '394', '花莲市', '3', '0');
INSERT INTO `ecs_region` VALUES ('4003', '394', '新城乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4004', '394', '太鲁阁', '3', '0');
INSERT INTO `ecs_region` VALUES ('4005', '394', '秀林乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4006', '394', '吉安乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4007', '394', '寿丰乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4008', '394', '凤林镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('4009', '394', '光复乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4010', '394', '丰滨乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4011', '394', '瑞穗乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4012', '394', '万荣乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4013', '394', '玉里镇', '3', '0');
INSERT INTO `ecs_region` VALUES ('4014', '394', '卓溪乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4015', '394', '富里乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4016', '395', '马公市', '3', '0');
INSERT INTO `ecs_region` VALUES ('4017', '395', '西屿乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4018', '395', '望安乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4019', '395', '七美乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4020', '395', '白沙乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4021', '395', '湖西乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4022', '396', '南竿乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4023', '396', '北竿乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4024', '396', '莒光乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4025', '396', '东引乡', '3', '0');
INSERT INTO `ecs_region` VALUES ('4026', '397', '中西区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4027', '397', '湾仔', '3', '0');
INSERT INTO `ecs_region` VALUES ('4028', '397', '东区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4029', '397', '南区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4030', '398', '九龙城区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4031', '398', '油尖旺区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4032', '398', '深水埗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4033', '398', '黄大仙区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4034', '398', '观塘区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4035', '399', '北区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4036', '399', '大埔区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4037', '399', '沙田区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4038', '399', '西贡区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4039', '399', '元朗区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4040', '399', '屯门区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4041', '399', '荃湾区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4042', '399', '葵青区', '3', '0');
INSERT INTO `ecs_region` VALUES ('4043', '399', '离岛区', '3', '0');

-- ----------------------------
-- Table structure for ecs_reg_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `ecs_reg_extend_info`;
CREATE TABLE `ecs_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_reg_extend_info
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_reg_fields
-- ----------------------------
DROP TABLE IF EXISTS `ecs_reg_fields`;
CREATE TABLE `ecs_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_need` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_reg_fields
-- ----------------------------
INSERT INTO `ecs_reg_fields` VALUES ('2', 'QQ', '0', '1', '1', '0');
INSERT INTO `ecs_reg_fields` VALUES ('3', '办公电话', '0', '1', '1', '0');
INSERT INTO `ecs_reg_fields` VALUES ('4', '家庭电话', '0', '1', '1', '0');
INSERT INTO `ecs_reg_fields` VALUES ('5', '手机', '0', '1', '1', '1');
INSERT INTO `ecs_reg_fields` VALUES ('6', '密码找回问题', '0', '1', '1', '0');

-- ----------------------------
-- Table structure for ecs_role
-- ----------------------------
DROP TABLE IF EXISTS `ecs_role`;
CREATE TABLE `ecs_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY (`role_id`),
  KEY `user_name` (`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_role
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_searchengine
-- ----------------------------
DROP TABLE IF EXISTS `ecs_searchengine`;
CREATE TABLE `ecs_searchengine` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_searchengine
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_search_history
-- ----------------------------
DROP TABLE IF EXISTS `ecs_search_history`;
CREATE TABLE `ecs_search_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` char(50) NOT NULL,
  `count` int(11) NOT NULL,
  `type` enum('goods','store') NOT NULL,
  `store_id` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_search_history
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ecs_sessions`;
CREATE TABLE `ecs_sessions` (
  `sesskey` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_sessions
-- ----------------------------
INSERT INTO `ecs_sessions` VALUES ('71471775237174c8d7140c3196990028', '1516600789', '0', '1', '127.0.0.1', '0', '0', '0.00', '0', 'a:5:{s:12:\"captcha_word\";s:16:\"NTAyMWEzOTYzYQ==\";s:10:\"admin_name\";s:5:\"admin\";s:11:\"action_list\";s:3:\"all\";s:10:\"last_check\";i:1516600642;s:12:\"suppliers_id\";s:1:\"0\";}');
INSERT INTO `ecs_sessions` VALUES ('6150e30a1705cf1ce1291345ff2a074d', '1516600763', '0', '1', '127.0.0.1', '0', '0', '0.00', '0', 'a:5:{s:12:\"captcha_word\";s:16:\"MjI3YjM2YjlhYg==\";s:10:\"admin_name\";s:5:\"admin\";s:11:\"action_list\";s:3:\"all\";s:10:\"last_check\";i:1516600705;s:12:\"suppliers_id\";s:1:\"0\";}');

-- ----------------------------
-- Table structure for ecs_sessions_data
-- ----------------------------
DROP TABLE IF EXISTS `ecs_sessions_data`;
CREATE TABLE `ecs_sessions_data` (
  `sesskey` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_sessions_data
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_shipping
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shipping`;
CREATE TABLE `ecs_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '',
  `insure` varchar(10) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) DEFAULT NULL,
  `config_lable` text,
  `print_model` tinyint(1) DEFAULT '0',
  `shipping_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_id`),
  KEY `shipping_code` (`shipping_code`,`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_shipping_area
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shipping_area`;
CREATE TABLE `ecs_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `configure` text NOT NULL,
  PRIMARY KEY (`shipping_area_id`),
  KEY `shipping_id` (`shipping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shipping_area
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_shop_bind
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shop_bind`;
CREATE TABLE `ecs_shop_bind` (
  `shop_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `node_id` varchar(32) DEFAULT NULL COMMENT '节点',
  `node_type` varchar(128) DEFAULT NULL COMMENT '节点类型',
  `status` enum('bind','unbind') DEFAULT NULL COMMENT '状态',
  `app_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shop_bind
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_shop_config
-- ----------------------------
DROP TABLE IF EXISTS `ecs_shop_config`;
CREATE TABLE `ecs_shop_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `store_range` varchar(255) NOT NULL DEFAULT '',
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=907 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_shop_config
-- ----------------------------
INSERT INTO `ecs_shop_config` VALUES ('1', '0', 'shop_info', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('2', '0', 'basic', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('3', '0', 'display', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('4', '0', 'shopping_flow', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('5', '0', 'smtp', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('6', '0', 'hidden', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('7', '0', 'goods', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('8', '0', 'sms', 'group', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('101', '1', 'shop_name', 'text', '', '', '国康', '1');
INSERT INTO `ecs_shop_config` VALUES ('102', '1', 'shop_title', 'text', '', '', '国康', '1');
INSERT INTO `ecs_shop_config` VALUES ('103', '1', 'shop_desc', 'text', '', '', '国康', '1');
INSERT INTO `ecs_shop_config` VALUES ('104', '1', 'shop_keywords', 'text', '', '', '国康', '1');
INSERT INTO `ecs_shop_config` VALUES ('105', '1', 'shop_country', 'manual', '', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('106', '1', 'shop_province', 'manual', '', '', '2', '1');
INSERT INTO `ecs_shop_config` VALUES ('107', '1', 'shop_city', 'manual', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('108', '1', 'shop_address', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('109', '1', 'qq', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('110', '1', 'ww', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('111', '1', 'skype', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('112', '1', 'ym', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('113', '1', 'msn', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('114', '1', 'service_email', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('115', '1', 'service_phone', 'text', '', '', '4008002000', '1');
INSERT INTO `ecs_shop_config` VALUES ('116', '1', 'shop_closed', 'select', '0,1', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('117', '1', 'close_comment', 'textarea', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('118', '1', 'shop_logo', 'file', '', '../themes/{$template}/images/', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('119', '1', 'licensed', 'select', '0,1', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('120', '1', 'user_notice', 'textarea', '', '', '用户中心公告！', '1');
INSERT INTO `ecs_shop_config` VALUES ('121', '1', 'shop_notice', 'textarea', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('122', '1', 'shop_reg_closed', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('201', '2', 'lang', 'manual', '', '', 'zh_cn', '1');
INSERT INTO `ecs_shop_config` VALUES ('202', '2', 'icp_number', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('203', '2', 'icp_file', 'file', '', '../cert/', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('204', '2', 'watermark', 'file', '', '../images/', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('205', '2', 'watermark_place', 'select', '0,1,2,3,4,5', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('206', '2', 'watermark_alpha', 'text', '', '', '65', '1');
INSERT INTO `ecs_shop_config` VALUES ('207', '2', 'use_storage', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('208', '2', 'market_price_rate', 'text', '', '', '1.2', '1');
INSERT INTO `ecs_shop_config` VALUES ('209', '2', 'rewrite', 'select', '0,1,2', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('210', '2', 'integral_name', 'text', '', '', '积分', '1');
INSERT INTO `ecs_shop_config` VALUES ('211', '2', 'integral_scale', 'text', '', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('212', '2', 'integral_percent', 'text', '', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('213', '2', 'sn_prefix', 'text', '', '', 'ECS', '1');
INSERT INTO `ecs_shop_config` VALUES ('214', '2', 'comment_check', 'select', '0,1', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('215', '2', 'no_picture', 'file', '', '../images/', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('218', '2', 'stats_code', 'textarea', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('219', '2', 'cache_time', 'text', '', '', '3600', '1');
INSERT INTO `ecs_shop_config` VALUES ('220', '2', 'register_points', 'text', '', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('221', '2', 'enable_gzip', 'select', '0,1', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('222', '2', 'top10_time', 'select', '0,1,2,3,4', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('223', '2', 'timezone', 'options', '-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12', '', '8', '1');
INSERT INTO `ecs_shop_config` VALUES ('224', '2', 'upload_size_limit', 'options', '-1,0,64,128,256,512,1024,2048,4096', '', '64', '1');
INSERT INTO `ecs_shop_config` VALUES ('226', '2', 'cron_method', 'select', '0,1', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('227', '2', 'comment_factor', 'select', '0,1,2,3', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('228', '2', 'enable_order_check', 'select', '0,1', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('229', '2', 'default_storage', 'text', '', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('230', '2', 'bgcolor', 'text', '', '', '#FFFFFF', '1');
INSERT INTO `ecs_shop_config` VALUES ('231', '2', 'visit_stats', 'select', 'on,off', '', 'on', '1');
INSERT INTO `ecs_shop_config` VALUES ('232', '2', 'send_mail_on', 'select', 'on,off', '', 'off', '1');
INSERT INTO `ecs_shop_config` VALUES ('233', '2', 'auto_generate_gallery', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('234', '2', 'retain_original_img', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('235', '2', 'member_email_validate', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('236', '2', 'message_board', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('239', '2', 'certificate_id', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('240', '2', 'token', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('241', '2', 'certi', 'hidden', '', '', 'http://service.shopex.cn/openapi/api.php', '1');
INSERT INTO `ecs_shop_config` VALUES ('242', '2', 'send_verify_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('243', '2', 'ent_id', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('244', '2', 'ent_ac', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('245', '2', 'ent_sign', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('246', '2', 'ent_email', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('247', '2', 'logistics_trace', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('301', '3', 'date_format', 'hidden', '', '', 'Y-m-d', '1');
INSERT INTO `ecs_shop_config` VALUES ('302', '3', 'time_format', 'text', '', '', 'Y-m-d H:i:s', '1');
INSERT INTO `ecs_shop_config` VALUES ('303', '3', 'currency_format', 'text', '', '', '￥%s元', '1');
INSERT INTO `ecs_shop_config` VALUES ('304', '3', 'thumb_width', 'text', '', '', '100', '1');
INSERT INTO `ecs_shop_config` VALUES ('305', '3', 'thumb_height', 'text', '', '', '100', '1');
INSERT INTO `ecs_shop_config` VALUES ('306', '3', 'image_width', 'text', '', '', '230', '1');
INSERT INTO `ecs_shop_config` VALUES ('307', '3', 'image_height', 'text', '', '', '230', '1');
INSERT INTO `ecs_shop_config` VALUES ('312', '3', 'top_number', 'text', '', '', '10', '1');
INSERT INTO `ecs_shop_config` VALUES ('313', '3', 'history_number', 'text', '', '', '5', '1');
INSERT INTO `ecs_shop_config` VALUES ('314', '3', 'comments_number', 'text', '', '', '5', '1');
INSERT INTO `ecs_shop_config` VALUES ('315', '3', 'bought_goods', 'text', '', '', '3', '1');
INSERT INTO `ecs_shop_config` VALUES ('316', '3', 'article_number', 'text', '', '', '8', '1');
INSERT INTO `ecs_shop_config` VALUES ('317', '3', 'goods_name_length', 'text', '', '', '7', '1');
INSERT INTO `ecs_shop_config` VALUES ('318', '3', 'price_format', 'select', '0,1,2,3,4,5', '', '5', '1');
INSERT INTO `ecs_shop_config` VALUES ('319', '3', 'page_size', 'text', '', '', '10', '1');
INSERT INTO `ecs_shop_config` VALUES ('320', '3', 'sort_order_type', 'select', '0,1,2', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('321', '3', 'sort_order_method', 'select', '0,1', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('322', '3', 'show_order_type', 'select', '0,1,2', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('323', '3', 'attr_related_number', 'text', '', '', '5', '1');
INSERT INTO `ecs_shop_config` VALUES ('324', '3', 'goods_gallery_number', 'text', '', '', '5', '1');
INSERT INTO `ecs_shop_config` VALUES ('325', '3', 'article_title_length', 'text', '', '', '16', '1');
INSERT INTO `ecs_shop_config` VALUES ('326', '3', 'name_of_region_1', 'text', '', '', '国家', '1');
INSERT INTO `ecs_shop_config` VALUES ('327', '3', 'name_of_region_2', 'text', '', '', '省', '1');
INSERT INTO `ecs_shop_config` VALUES ('328', '3', 'name_of_region_3', 'text', '', '', '市', '1');
INSERT INTO `ecs_shop_config` VALUES ('329', '3', 'name_of_region_4', 'text', '', '', '区', '1');
INSERT INTO `ecs_shop_config` VALUES ('330', '3', 'search_keywords', 'text', '', '', '', '0');
INSERT INTO `ecs_shop_config` VALUES ('332', '3', 'related_goods_number', 'text', '', '', '4', '1');
INSERT INTO `ecs_shop_config` VALUES ('333', '3', 'help_open', 'select', '0,1', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('334', '3', 'article_page_size', 'text', '', '', '10', '1');
INSERT INTO `ecs_shop_config` VALUES ('335', '3', 'page_style', 'select', '0,1', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('336', '3', 'recommend_order', 'select', '0,1', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('337', '3', 'index_ad', 'hidden', '', '', 'sys', '1');
INSERT INTO `ecs_shop_config` VALUES ('401', '4', 'can_invoice', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('402', '4', 'use_integral', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('403', '4', 'use_bonus', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('404', '4', 'use_surplus', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('405', '4', 'use_how_oos', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('406', '4', 'send_confirm_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('407', '4', 'send_ship_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('408', '4', 'send_cancel_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('409', '4', 'send_invalid_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('410', '4', 'order_pay_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('411', '4', 'order_unpay_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('412', '4', 'order_ship_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('413', '4', 'order_receive_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('414', '4', 'order_unship_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('415', '4', 'order_return_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('416', '4', 'order_invalid_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('417', '4', 'order_cancel_note', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('418', '4', 'invoice_content', 'textarea', '', '', 'demo', '1');
INSERT INTO `ecs_shop_config` VALUES ('419', '4', 'anonymous_buy', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('420', '4', 'min_goods_amount', 'text', '', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('421', '4', 'one_step_buy', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('422', '4', 'invoice_type', 'manual', '', '', 'a:2:{s:4:\"type\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}s:4:\"rate\";a:3:{i:0;d:1;i:1;d:1.5;i:2;d:0;}}', '1');
INSERT INTO `ecs_shop_config` VALUES ('423', '4', 'stock_dec_time', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('424', '4', 'cart_confirm', 'options', '1,2,3,4', '', '3', '0');
INSERT INTO `ecs_shop_config` VALUES ('425', '4', 'send_service_email', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('426', '4', 'show_goods_in_cart', 'select', '1,2,3', '', '3', '1');
INSERT INTO `ecs_shop_config` VALUES ('427', '4', 'show_attr_in_cart', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('501', '5', 'smtp_host', 'text', '', '', 'localhost', '1');
INSERT INTO `ecs_shop_config` VALUES ('502', '5', 'smtp_port', 'text', '', '', '25', '1');
INSERT INTO `ecs_shop_config` VALUES ('503', '5', 'smtp_user', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('504', '5', 'smtp_pass', 'password', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('505', '5', 'smtp_mail', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('506', '5', 'mail_charset', 'select', 'UTF8,GB2312,BIG5', '', 'UTF8', '1');
INSERT INTO `ecs_shop_config` VALUES ('507', '5', 'mail_service', 'select', '0,1', '', '0', '0');
INSERT INTO `ecs_shop_config` VALUES ('508', '5', 'smtp_ssl', 'select', '0,1', '', '0', '0');
INSERT INTO `ecs_shop_config` VALUES ('601', '6', 'integrate_code', 'hidden', '', '', 'ecshop', '1');
INSERT INTO `ecs_shop_config` VALUES ('602', '6', 'integrate_config', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('603', '6', 'hash_code', 'hidden', '', '', '7acc1ca770223389fca1fdc8b96c2100', '1');
INSERT INTO `ecs_shop_config` VALUES ('604', '6', 'template', 'hidden', '', '', 'default', '1');
INSERT INTO `ecs_shop_config` VALUES ('605', '6', 'install_date', 'hidden', '', '', '1516010801', '1');
INSERT INTO `ecs_shop_config` VALUES ('606', '6', 'ecs_version', 'hidden', '', '', 'v3.6.0', '1');
INSERT INTO `ecs_shop_config` VALUES ('607', '6', 'sms_user_name', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('608', '6', 'sms_password', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('609', '6', 'sms_auth_str', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('610', '6', 'sms_domain', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('611', '6', 'sms_count', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('612', '6', 'sms_total_money', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('613', '6', 'sms_balance', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('614', '6', 'sms_last_request', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('616', '6', 'affiliate', 'hidden', '', '', 'a:3:{s:6:\"config\";a:7:{s:6:\"expire\";d:24;s:11:\"expire_unit\";s:4:\"hour\";s:11:\"separate_by\";i:0;s:15:\"level_point_all\";s:2:\"5%\";s:15:\"level_money_all\";s:2:\"1%\";s:18:\"level_register_all\";i:2;s:17:\"level_register_up\";i:60;}s:4:\"item\";a:4:{i:0;a:2:{s:11:\"level_point\";s:3:\"60%\";s:11:\"level_money\";s:3:\"60%\";}i:1;a:2:{s:11:\"level_point\";s:3:\"30%\";s:11:\"level_money\";s:3:\"30%\";}i:2;a:2:{s:11:\"level_point\";s:2:\"7%\";s:11:\"level_money\";s:2:\"7%\";}i:3;a:2:{s:11:\"level_point\";s:2:\"3%\";s:11:\"level_money\";s:2:\"3%\";}}s:2:\"on\";i:1;}', '1');
INSERT INTO `ecs_shop_config` VALUES ('617', '6', 'captcha', 'hidden', '', '', '12', '1');
INSERT INTO `ecs_shop_config` VALUES ('618', '6', 'captcha_width', 'hidden', '', '', '100', '1');
INSERT INTO `ecs_shop_config` VALUES ('619', '6', 'captcha_height', 'hidden', '', '', '20', '1');
INSERT INTO `ecs_shop_config` VALUES ('620', '6', 'sitemap', 'hidden', '', '', 'a:6:{s:19:\"homepage_changefreq\";s:6:\"hourly\";s:17:\"homepage_priority\";s:3:\"0.9\";s:19:\"category_changefreq\";s:6:\"hourly\";s:17:\"category_priority\";s:3:\"0.8\";s:18:\"content_changefreq\";s:6:\"weekly\";s:16:\"content_priority\";s:3:\"0.7\";}', '0');
INSERT INTO `ecs_shop_config` VALUES ('621', '6', 'points_rule', 'hidden', '', '', '', '0');
INSERT INTO `ecs_shop_config` VALUES ('622', '6', 'flash_theme', 'hidden', '', '', 'dynfocus', '1');
INSERT INTO `ecs_shop_config` VALUES ('623', '6', 'stylename', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('701', '7', 'show_goodssn', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('702', '7', 'show_brand', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('703', '7', 'show_goodsweight', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('704', '7', 'show_goodsnumber', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('705', '7', 'show_addtime', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('706', '7', 'goodsattr_style', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('707', '7', 'show_marketprice', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('801', '8', 'sms_shop_mobile', 'text', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('802', '8', 'sms_order_placed', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('803', '8', 'sms_order_payed', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('804', '8', 'sms_order_payed_to_customer', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('805', '8', 'sms_order_shipped', 'select', '1,0', '', '0', '1');
INSERT INTO `ecs_shop_config` VALUES ('806', '2', 'snlist_code', 'hidden', '', '', '{\"erp\":\"goods_1109\",\"fy\":\"goods_1137\",\"taodali\":\"goods_1103\",\"HDT\":\"goods_1500\"}', '1');
INSERT INTO `ecs_shop_config` VALUES ('903', '2', 'message_check', 'select', '1,0', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('904', '0', 'showerpPanel', 'hidden', '', '', '1', '1');
INSERT INTO `ecs_shop_config` VALUES ('905', '2', 'certificate', 'hidden', '', '', 'a:4:{s:15:\"use_yunqi_login\";b:1;s:12:\"passport_uid\";s:14:\"88171101845370\";s:10:\"yunqi_code\";s:32:\"8ccb9f4ff4ee3fa43016659ace3649fd\";s:15:\"yunqiexp_active\";b:1;}', '1');
INSERT INTO `ecs_shop_config` VALUES ('906', '2', 'snlist', 'hidden', '', '', '{\"0\":\"goods_1966\",\"time\":\"2018-01-15\"}', '1');
INSERT INTO `ecs_shop_config` VALUES ('248', '2', 'sms_sign', 'hidden', '', '', '', '1');
INSERT INTO `ecs_shop_config` VALUES ('249', '2', 'default_sms_sign', 'hidden', '', '', '', '1');

-- ----------------------------
-- Table structure for ecs_snatch_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_snatch_log`;
CREATE TABLE `ecs_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `snatch_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bid_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `snatch_id` (`snatch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_snatch_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_sns
-- ----------------------------
DROP TABLE IF EXISTS `ecs_sns`;
CREATE TABLE `ecs_sns` (
  `user_id` int(11) NOT NULL,
  `open_id` varchar(255) NOT NULL,
  `vendor` tinyint(4) NOT NULL COMMENT '第三方平台类型',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `sns_user_id_unique` (`user_id`),
  KEY `sns_open_id_index` (`open_id`),
  KEY `sns_vendor_index` (`vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_sns
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_stats
-- ----------------------------
DROP TABLE IF EXISTS `ecs_stats`;
CREATE TABLE `ecs_stats` (
  `access_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `visit_times` smallint(5) unsigned NOT NULL DEFAULT '1',
  `browser` varchar(60) NOT NULL DEFAULT '',
  `system` varchar(20) NOT NULL DEFAULT '',
  `language` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(30) NOT NULL DEFAULT '',
  `referer_domain` varchar(100) NOT NULL DEFAULT '',
  `referer_path` varchar(200) NOT NULL DEFAULT '',
  `access_url` varchar(255) NOT NULL DEFAULT '',
  KEY `access_time` (`access_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_stats
-- ----------------------------
INSERT INTO `ecs_stats` VALUES ('1516010801', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/install/index.php?lang=zh_cn&step=setting_ui&ui=', '/guokang/source/ecshop/yunqi_check.php');
INSERT INTO `ecs_stats` VALUES ('1516064899', '127.0.0.1', '2', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516064922', '127.0.0.1', '3', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516067073', '127.0.0.1', '4', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516067858', '127.0.0.1', '5', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516067977', '127.0.0.1', '6', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516068041', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516068148', '127.0.0.1', '2', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516068151', '127.0.0.1', '3', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516068726', '127.0.0.1', '4', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516068728', '127.0.0.1', '5', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516082022', '127.0.0.1', '6', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516082133', '127.0.0.1', '7', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516082238', '127.0.0.1', '8', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516093293', '127.0.0.1', '9', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516101922', '127.0.0.1', '10', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516151335', '127.0.0.1', '11', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516151368', '127.0.0.1', '12', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516153292', '127.0.0.1', '13', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516157648', '127.0.0.1', '14', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/ecshop/', '/ecshop/source/ecshop/user.php');
INSERT INTO `ecs_stats` VALUES ('1516158276', '127.0.0.1', '15', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516160179', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516168139', '127.0.0.1', '2', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/ecshop/user.php', '/ecshop/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516168617', '127.0.0.1', '3', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516171138', '127.0.0.1', '4', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516171166', '127.0.0.1', '5', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/ecshop/source/ecshop/index.php', '/ecshop/source/ecshop/user.php');
INSERT INTO `ecs_stats` VALUES ('1516171279', '127.0.0.1', '6', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516172074', '127.0.0.1', '7', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/ecshop/source/ecshop/article.php');
INSERT INTO `ecs_stats` VALUES ('1516172947', '127.0.0.1', '9', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516174395', '127.0.0.1', '11', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516180694', '127.0.0.1', '12', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/index.php', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516180715', '127.0.0.1', '14', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/index.php', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516181713', '127.0.0.1', '16', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/index.php', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516188026', '127.0.0.1', '17', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/about.php?tpl=knowOne&id=92', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516192759', '127.0.0.1', '19', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/about.php?tpl=knowFour&id=95&cat_id=13', '/guokang/source/ecshop/about.php');
INSERT INTO `ecs_stats` VALUES ('1516237726', '127.0.0.1', '20', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516247644', '127.0.0.1', '21', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/about.php?tpl=knowOne&id=92', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516255775', '127.0.0.1', '23', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/about.php?tpl=knowOne&id=92', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516256426', '127.0.0.1', '25', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/about.php?tpl=knowOne&id=92', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516324679', '127.0.0.1', '26', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516326396', '127.0.0.1', '28', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/category.php?id=2&cid=3', '/guokang/source/ecshop/category.php');
INSERT INTO `ecs_stats` VALUES ('1516330796', '127.0.0.1', '29', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/category.php?id=2&cid=3', '/guokang/source/ecshop/category.php');
INSERT INTO `ecs_stats` VALUES ('1516340944', '127.0.0.1', '30', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/article_cat.php?id=8', '/guokang/source/ecshop/article_cat.php');
INSERT INTO `ecs_stats` VALUES ('1516343354', '127.0.0.1', '32', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/article_cat.php?id=8', '/guokang/source/ecshop/article_cat.php');
INSERT INTO `ecs_stats` VALUES ('1516410741', '127.0.0.1', '33', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516418021', '127.0.0.1', '34', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/goods.php');
INSERT INTO `ecs_stats` VALUES ('1516420799', '127.0.0.1', '36', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/goods.php');
INSERT INTO `ecs_stats` VALUES ('1516427546', '127.0.0.1', '37', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/goods.php');
INSERT INTO `ecs_stats` VALUES ('1516433527', '127.0.0.1', '39', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/goods.php');
INSERT INTO `ecs_stats` VALUES ('1516440120', '127.0.0.1', '1', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516454048', '127.0.0.1', '40', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', '', '', '/guokang/source/ecshop/goods.php');
INSERT INTO `ecs_stats` VALUES ('1516583891', '127.0.0.1', '41', 'Safari 537.36', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516585803', '127.0.0.1', '1', 'FireFox 57.0', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/', '/guokang/source/ecshop/index.php');
INSERT INTO `ecs_stats` VALUES ('1516591600', '127.0.0.1', '2', 'FireFox 57.0', 'Windows NT', 'zh-CN,zh', 'LAN', 'http://127.0.0.1', '/guokang/source/ecshop/admin/article.php?act=list', '/guokang/source/ecshop/article.php');

-- ----------------------------
-- Table structure for ecs_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `ecs_suppliers`;
CREATE TABLE `ecs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_name` varchar(255) DEFAULT NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_suppliers
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_tag
-- ----------------------------
DROP TABLE IF EXISTS `ecs_tag`;
CREATE TABLE `ecs_tag` (
  `tag_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_words` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_template
-- ----------------------------
DROP TABLE IF EXISTS `ecs_template`;
CREATE TABLE `ecs_template` (
  `filename` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(40) NOT NULL DEFAULT '',
  `library` varchar(40) NOT NULL DEFAULT '',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `remarks` varchar(30) NOT NULL DEFAULT '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_template
-- ----------------------------
INSERT INTO `ecs_template` VALUES ('index', '', '/library/brands.lbi', '0', '0', '11', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/auction.lbi', '0', '0', '3', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/group_buy.lbi', '0', '0', '3', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/recommend_promotion.lbi', '0', '0', '4', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/recommend_hot.lbi', '0', '0', '10', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/recommend_new.lbi', '0', '0', '10', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('index', '', '/library/recommend_best.lbi', '0', '0', '10', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '左边区域', '/library/category_tree.lbi', '1', '0', '0', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '右边区域', '/library/recommend_best.lbi', '0', '0', '5', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '右边区域', '/library/goods_list.lbi', '1', '0', '0', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '右边区域', '/library/pages.lbi', '2', '0', '0', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '左边区域', '/library/cart.lbi', '0', '0', '0', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '左边区域', '/library/price_grade.lbi', '3', '0', '0', '0', 'default', '');
INSERT INTO `ecs_template` VALUES ('category', '左边区域', '/library/filter_attr.lbi', '2', '0', '0', '0', 'default', '');

-- ----------------------------
-- Table structure for ecs_topic
-- ----------------------------
DROP TABLE IF EXISTS `ecs_topic`;
CREATE TABLE `ecs_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) DEFAULT NULL,
  `title_pic` varchar(255) DEFAULT NULL,
  `base_style` char(6) DEFAULT NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_topic
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_users
-- ----------------------------
DROP TABLE IF EXISTS `ecs_users`;
CREATE TABLE `ecs_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_special` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ec_salt` varchar(10) DEFAULT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '0',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(60) NOT NULL,
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `office_phone` varchar(20) NOT NULL,
  `home_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_line` decimal(10,2) unsigned NOT NULL,
  `passwd_question` varchar(50) DEFAULT NULL,
  `passwd_answer` varchar(255) DEFAULT NULL,
  `open_face` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_users
-- ----------------------------
INSERT INTO `ecs_users` VALUES ('1', 'aiok88st@163.com', '招商信诺客户徐女士', 'e10adc3949ba59abbe56e057f20f883e', '', '', '2', '2018-01-15', '0.00', '0.00', '0', '0', '0', '1516157533', '0', '0000-00-00 00:00:00', '', '0', '0', '0', null, '0', '0', '0', '', '', '', '', '', '', '0', '1000.00', null, null, null);

-- ----------------------------
-- Table structure for ecs_user_account
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_account`;
CREATE TABLE `ecs_user_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `paid_time` int(10) NOT NULL DEFAULT '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL DEFAULT '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_paid` (`is_paid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_address`;
CREATE TABLE `ecs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) NOT NULL DEFAULT '0',
  `province` smallint(5) NOT NULL DEFAULT '0',
  `city` smallint(5) NOT NULL DEFAULT '0',
  `district` smallint(5) NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_user_bonus
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_bonus`;
CREATE TABLE `ecs_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_sn` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `used_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bonus_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_user_feed
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_feed`;
CREATE TABLE `ecs_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `feed_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_feed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_feed
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_rank`;
CREATE TABLE `ecs_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_price` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `special_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_rank
-- ----------------------------
INSERT INTO `ecs_user_rank` VALUES ('1', '注册用户', '0', '10000', '100', '1', '0');

-- ----------------------------
-- Table structure for ecs_user_reg_status
-- ----------------------------
DROP TABLE IF EXISTS `ecs_user_reg_status`;
CREATE TABLE `ecs_user_reg_status` (
  `user_id` int(11) NOT NULL,
  `is_completed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_user_reg_status
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_version
-- ----------------------------
DROP TABLE IF EXISTS `ecs_version`;
CREATE TABLE `ecs_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `platform` tinyint(4) NOT NULL DEFAULT '3',
  `version` char(50) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `content` char(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_version
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_virtual_card
-- ----------------------------
DROP TABLE IF EXISTS `ecs_virtual_card`;
CREATE TABLE `ecs_virtual_card` (
  `card_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `card_sn` varchar(60) NOT NULL DEFAULT '',
  `card_password` varchar(60) NOT NULL DEFAULT '',
  `add_date` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `is_saled` tinyint(1) NOT NULL DEFAULT '0',
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `crc32` varchar(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`),
  KEY `goods_id` (`goods_id`),
  KEY `car_sn` (`card_sn`),
  KEY `is_saled` (`is_saled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_virtual_card
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_volume_price
-- ----------------------------
DROP TABLE IF EXISTS `ecs_volume_price`;
CREATE TABLE `ecs_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_type`,`goods_id`,`volume_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_volume_price
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_vote
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote`;
CREATE TABLE `ecs_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(250) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote_log`;
CREATE TABLE `ecs_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `ecs_vote_option`;
CREATE TABLE `ecs_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(250) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for ecs_wholesale
-- ----------------------------
DROP TABLE IF EXISTS `ecs_wholesale`;
CREATE TABLE `ecs_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_wholesale
-- ----------------------------
