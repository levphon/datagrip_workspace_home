/*
 Navicat Premium Data Transfer

 Source Server         : DEV-1.187-SXG
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 10.252.1.187:3306
 Source Schema         : sxgdb

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 11/06/2023 17:06:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_bank_card_sign
-- ----------------------------
DROP TABLE IF EXISTS `api_bank_card_sign`;
CREATE TABLE `api_bank_card_sign`  (
  `Fbind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接入订单号',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fchannel_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Fuser_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接入方客户ID',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Facct_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '持卡人姓名/账户名',
  `Fphone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行卡预留手机号',
  `Fidcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号 加密存储',
  `Fidcard_short` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证 带星缩写',
  `Fbank_code_en` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行英文缩写',
  `Fbank_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行编号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行名称',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定类型 QUICKPAY-快捷绑卡',
  `Fcard_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号(加密存储)',
  `Fcard_no_short` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号 带星缩写',
  `Fcard_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡类型 DEBIT-借记卡 CREDIT-贷记卡',
  `Fcvn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷记卡的CVN 加密存储',
  `Fexpiry_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡有效期',
  `Fchnl_bind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道绑卡ID',
  `Fchnl_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '渠道绑卡状态 NON:无 INIT:待处理 DOING:待短验 BIND_SUCCESS:成功 BIND_FAILURE:失败 TIME_OUT:已过期',
  `Fchnl_rsp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答码描述',
  `Fchnl_rsp_data` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答信息存储',
  `Frequest_count` int(2) NOT NULL DEFAULT 0 COMMENT '请求绑卡次数',
  `Fnotify_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异步通知地址',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fbind_id`) USING BTREE,
  UNIQUE INDEX `api_bank_card_sign_uidx1`(`Forder_id`, `Fpartner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '银行卡签约API对外' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_menu
-- ----------------------------
DROP TABLE IF EXISTS `app_menu`;
CREATE TABLE `app_menu`  (
  `Fid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fapp_native` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT 'APP原生标识 Y-原生 N-非原生',
  `Fapp_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFFICIAL' COMMENT 'APP版本 OFFICIAL-正式版 VERIFY-审核版',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Fsort_num` int(3) NOT NULL DEFAULT 999 COMMENT '排序',
  `Ftitle` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `Ftype` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型 1-内链 2-外链 3-购物车',
  `Furl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址 ',
  `Ficon_src` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon链接地址',
  `Ficon_src_selected` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon链接地址',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `app_menu_idx1`(`Fsort_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'APP菜单栏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `Fchnl_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道订单号',
  `Ftrxid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付单号',
  `Fchnl_trxid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道订单号',
  `Fpartner_id` bigint(20) NOT NULL COMMENT '合作方id',
  `Fpartner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(20) NOT NULL COMMENT '用户id',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `Fshop_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `Fshop_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商渠道号',
  `Fproduct_id` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `Fproduct_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '产品组 如话费、会员、电子卡券',
  `Fproduct_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT '产品类型 如话费(移动、联通、电信)',
  `Forder_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参考ApiCode',
  `Ftrxcode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易号 TrxCode',
  `Fpay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式 ALIPAY-支付宝支付 WECHATPAY-微信支付',
  `Forder_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态 PAYING-支付中 FAILED-支付失败 PAIED-已付款/充值中 RECHARGE_FAILED-充值失败 RECHARGED-充值成功 CLOSED-已关闭 REFUND-已退款 REFUND_FAILED-退款失败',
  `Fchnl_order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道状态',
  `Fsmstitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `Fcharge_acctid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值手机号/帐号',
  `Funit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `Famount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `Freal_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `Forder_num` int(6) NOT NULL DEFAULT 1 COMMENT '订单数量',
  `Fcost` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '成本',
  `Fitem_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片链接',
  `Fremarks` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Fgpid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源方全局标识号',
  `Fsrc_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `Fnotify_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知目的',
  `Frequest_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求流水号',
  `Fvirtual_data` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟类商品JSON',
  `Fpaytime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单支付时间戳',
  `Frsp_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内部应答码',
  `Fchnl_rsp_data` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答JSON',
  `Fchnl_rsp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fchnl_times` int(1) NULL DEFAULT 0 COMMENT '请求通道次数',
  `Fauto_close_time` datetime(0) NULL DEFAULT NULL COMMENT '超时时间',
  `Fverify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `Fverify_advise` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核建议',
  `Fverify_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT '审核状态 NON:无需审核 WAIT:待审核 PASS:审核通过 NOPASS:审核不通过',
  `Fverify_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创单时间',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fext_filed1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拓展字段1 ',
  `Fext_filed2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拓展字段2',
  `Fext_filed3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拓展字段3',
  UNIQUE INDEX `app_order_uidx`(`Forder_id`) USING BTREE,
  INDEX `app_order_idx1`(`Fcust_id`) USING BTREE,
  INDEX `app_order_idx2`(`Fproduct_group`) USING BTREE,
  INDEX `app_order_idx3`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购买服务订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for app_vip_view
-- ----------------------------
DROP TABLE IF EXISTS `app_vip_view`;
CREATE TABLE `app_vip_view`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Fvip_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员ID 0标识非会员',
  `Fview_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专区展示位置或编码 VIP:会员信息 RIGHT:权益 COUPON:优惠券 FUN:吃喝玩乐 WINDOWS:弹窗\r\n',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 VALID:正常 FREEZE:冻结',
  `Fimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标链接',
  `Ftitle` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `Fdesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Fsort_num` int(6) NOT NULL DEFAULT 999999 COMMENT '排序',
  `Ffunc_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转方式 IN：内链 OUT：外链',
  `Flink_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型 SPU:商品 GATEGORY:商品分类 PRODUCT:金融产品 CUSTOM：内置地址 URL：H5链接 VIRTUAL:虚拟产品类型',
  `Flink_type_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型值(自定义链接必填)',
  `Fcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规则描述超文本',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `Fremark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_visit_sum
-- ----------------------------
DROP TABLE IF EXISTS `app_visit_sum`;
CREATE TABLE `app_visit_sum`  (
  `Fobject_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PARTNER:合作方 PRODUCT:产品',
  `Fobject_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象ID',
  `Fobject_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对象名称',
  `Fday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计日期',
  `Fpv` bigint(10) NOT NULL DEFAULT 0 COMMENT 'PV统计数',
  `Fuv` bigint(10) NOT NULL DEFAULT 0 COMMENT 'UV统计数',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `app_visit_sum_uidx1`(`Fobject_type`, `Fobject_id`, `Fday`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问流量统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_visit_uv
-- ----------------------------
DROP TABLE IF EXISTS `app_visit_uv`;
CREATE TABLE `app_visit_uv`  (
  `Fobject_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PARTNER:合作方 PRODUCT:产品',
  `Fobject_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对象ID',
  `Fobject_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对象名称',
  `Fday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '统计日期',
  `Fip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT 'IP',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `app_visit_uv_uidx1`(`Fobject_type`, `Fobject_id`, `Fday`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'UV日记' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_account
-- ----------------------------
DROP TABLE IF EXISTS `at_account`;
CREATE TABLE `at_account`  (
  `Faccount_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户号',
  `Faccount_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名',
  `Faccount_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fbus_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户编号',
  `Fpurpose_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户用途',
  `Fcurrency` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `Famount` decimal(18, 6) NOT NULL COMMENT '余额（单位元）',
  `Fdebit_amount` decimal(18, 6) NOT NULL COMMENT '借方金额（单位元）',
  `Fdebit_num` bigint(10) NOT NULL COMMENT '借方笔数（单位元）',
  `Fcredit_amount` decimal(18, 6) NOT NULL COMMENT '贷方金额（单位元）',
  `Fcredit_num` bigint(10) NOT NULL COMMENT '贷方笔数（单位元）',
  `Fmin` decimal(18, 6) NOT NULL,
  `Fmax` decimal(18, 6) NOT NULL,
  `Fcreate_time` datetime(0) NOT NULL,
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  UNIQUE INDEX `at_account_uidx1`(`Faccount_code`) USING BTREE,
  UNIQUE INDEX `at_account_uidx2`(`Fbus_code`, `Fpurpose_code`, `Fchnl_id`) USING BTREE,
  INDEX `at_account_idx1`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_account_tpl
-- ----------------------------
DROP TABLE IF EXISTS `at_account_tpl`;
CREATE TABLE `at_account_tpl`  (
  `Fpurpose_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途编号',
  `Fpurpose_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途名称',
  `Fgroup_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户组编号',
  `Faccount_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型',
  `Fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID:正常 FREEZE:冻结',
  `Fmin` decimal(18, 6) NOT NULL COMMENT '最小值',
  `Fmax` decimal(18, 6) NOT NULL COMMENT '最大值'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户模版表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_detail
-- ----------------------------
DROP TABLE IF EXISTS `at_detail`;
CREATE TABLE `at_detail`  (
  `Faccount_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户号',
  `Faccount_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名',
  `Faccount_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fbus_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐号业务',
  `Fpurpose_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途号',
  `Ftrx_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Faction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记账动作（发起时记账、失败、成功）',
  `Fcrdr_flag` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '借贷标识',
  `Ftrans_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `Fcurrency` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资金方向',
  `Fpre_amount` decimal(18, 6) NOT NULL COMMENT '变动前余额（单位元）',
  `Famount` decimal(18, 6) NOT NULL COMMENT '变动金额（单位元）',
  `Faccount_time` datetime(0) NOT NULL COMMENT '记账时间',
  `Fentry_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分录号',
  `Freversal_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Y：已冲账 N：未冲账（默认）',
  `Freversal_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '冲账时间',
  `Fori_entry_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原分录号',
  `Fgl_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Y：已核算 N：未核算（默认）',
  `Fabstract_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要信息',
  `Fext_field1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拓展字段1',
  `Fext_field2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拓展字段2',
  INDEX `at_detail_idx1`(`Ftrx_id`) USING BTREE,
  INDEX `at_detail_idx2`(`Faccount_time`) USING BTREE,
  INDEX `at_detail_idx3`(`Faccount_code`) USING BTREE,
  INDEX `at_detail_idx4`(`Fentry_no`) USING BTREE,
  INDEX `at_detail_idx5`(`Fbus_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_journal
-- ----------------------------
DROP TABLE IF EXISTS `at_journal`;
CREATE TABLE `at_journal`  (
  `Faccount_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户号',
  `Faccount_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户名',
  `Faccount_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fbus_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型',
  `Fpurpose_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户用途',
  `Fcurrency` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `Faccount_date` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '切账日期（格式:yyyyMMdd）',
  `Fcredit_balance` decimal(18, 6) NOT NULL COMMENT '贷方今日余额（单位元）',
  `Fdebit_balance` decimal(18, 6) NOT NULL COMMENT '借方今日余额（单位元）',
  `Flast_day_credit_balance` decimal(18, 6) NOT NULL COMMENT '上日贷方余额（单位元）',
  `Flast_day_debit_balance` decimal(18, 6) NOT NULL COMMENT '上日借方余额（单位元）',
  `Fcredit_amount` decimal(18, 6) NOT NULL COMMENT '贷方交易额（单位元）',
  `Fdebit_amount` decimal(18, 6) NOT NULL COMMENT '借方交易额（单位元）',
  `Fcredit_num` bigint(10) NOT NULL COMMENT '贷方交易笔数',
  `Fdebit_num` bigint(10) NOT NULL COMMENT '借方交易笔数',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `at_journal_uidx`(`Faccount_code`, `Faccount_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户日记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_purpose
-- ----------------------------
DROP TABLE IF EXISTS `at_purpose`;
CREATE TABLE `at_purpose`  (
  `Fpurpose_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途编号',
  `Fpurpose_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途名称',
  `Fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fupdate_time` datetime(0) NOT NULL COMMENT '编辑时间',
  UNIQUE INDEX `at_purpose_uidx`(`Fpurpose_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记账用途表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for at_trans_rule
-- ----------------------------
DROP TABLE IF EXISTS `at_trans_rule`;
CREATE TABLE `at_trans_rule`  (
  `Ftrans_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Faction` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fpayer_crdr_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fpayer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付方',
  `Fpayee_crdr_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fpayee` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收方',
  `Fallow_overdraft` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否允许透支 Y-允许 N-不允许',
  `Fremark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `at_trans_rule_uidx`(`Ftrans_type`, `Fpayer_crdr_flag`, `Faction`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登账规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bl_credit_loan
-- ----------------------------
DROP TABLE IF EXISTS `bl_credit_loan`;
CREATE TABLE `bl_credit_loan`  (
  `Forder_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Forgan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '机构编号',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000000000000' COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品ID',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_chnl_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品授信渠道号',
  `Fproduct_chnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品授信渠道名称',
  `Fproduct_credit_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否发起渠道授信 Y-是 N-否',
  `Fproduct_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ICON链接',
  `Fcredit_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信单号',
  `Fcredit_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授信状态 APPLY-申请中 VERFIY-审核中 PASS-通过 NOPASS-不通过 REFUSE-拒绝 INVALID-失效',
  `Fverify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `Fverify_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Fverify_advise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核建议',
  `Flock_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否锁单 Y-锁单 N-未锁',
  `Fverfiy_lock_time` datetime(0) NULL DEFAULT NULL COMMENT '锁单时间',
  `Fverify_lock_timeout` datetime(0) NULL DEFAULT NULL COMMENT '锁单超时时间',
  `Floan_verify_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '用信审核标识 N=不可用信 Y=可用信',
  `Floan_verify_time` datetime(0) NULL DEFAULT NULL COMMENT '用信审核时间',
  `Frisk_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险等级',
  `Fchnl_credit_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '渠道授信额度',
  `Fchnl_cash_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '渠道现金额度',
  `Fchnl_consum_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '渠道消费额度',
  `Fcredit_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '平台授信额度',
  `Fcash_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '平台现金额度',
  `Fconsum_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '平台消费额度',
  `Fnext_pre_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '下期预估额度',
  `Fintegral` int(8) NULL DEFAULT 0 COMMENT '积分',
  `Fopen_acct` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否开户 Y-已开 N-未开',
  `Floan_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '放款状态 NON-无 LOAN_SUCC-放款成功 SETTLE-已结清',
  `Floan_time` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `Fsettle_time` datetime(0) NULL DEFAULT NULL COMMENT '结清时间',
  `Finvalid_day` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过期日期yyyyMMddHHmmss',
  `Flatitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位纬度',
  `Flongitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位经度',
  `Flocation_province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位省份',
  `Flocation_city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位城市',
  `Flocation_district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位县区',
  `Flocation_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位详细地址',
  `Fcredit_bill_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '消费用信标志 Y:已用信 N:未用信',
  `Fcreate_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fcreate_time` datetime(0) NOT NULL,
  `Fmodify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  INDEX `bl_credit_loan_idx1`(`Fcust_id`, `Fproduct_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台授信放款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bl_credit_loan_record
-- ----------------------------
DROP TABLE IF EXISTS `bl_credit_loan_record`;
CREATE TABLE `bl_credit_loan_record`  (
  `Forder_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `Frecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变更记录',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `bl_credit_loan_record_uidx`(`Forder_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台授信记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bl_order_credit
-- ----------------------------
DROP TABLE IF EXISTS `bl_order_credit`;
CREATE TABLE `bl_order_credit`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Forgan_id` bigint(10) NOT NULL COMMENT '机构编号',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(10) NULL DEFAULT NULL COMMENT '客户编号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 APPLY-申请中 SUCC-成功 FAIL-失败 ',
  `Fstatus_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Famount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '申请金额',
  `Fperiod` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款周期 单位月',
  `Floan_usage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款用途',
  `Fcredit_amount` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '授信额度',
  `Fcash_amount` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '现金额度',
  `Fconsum_amount` decimal(12, 2) NULL DEFAULT 0.00 COMMENT '消费额度',
  `Frisk_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险等级',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ICON',
  `Fchannel_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名',
  `Fchnl_rsp_orderid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答单号',
  `Fchnl_rsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fchnl_rsp_data` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答信息存储',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `bl_order_credit_uidx1`(`Forder_id`) USING BTREE,
  UNIQUE INDEX `bl_order_credit_uidx2`(`Fcust_id`, `Fchannel_id`, `Fproduct_id`) USING BTREE,
  INDEX `bl_order_credit_idx1`(`Fcust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '渠道授信订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bl_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `bl_order_goods`;
CREATE TABLE `bl_order_goods`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Frel_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `Fout_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接入单号',
  `Forgan_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000000000000' COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方ID',
  `Fpartner_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名称',
  `Fcust_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `Fcust_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fspu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spuID',
  `Fspu_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spu编码',
  `Fspu_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spu标题',
  `Fsku_id` bigint(20) NULL DEFAULT NULL COMMENT 'skuID',
  `Fsku_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `Fsku_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `Frecovery_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '回收价',
  `Fface_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '面额',
  `Fsales_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价',
  `Fquantity` int(6) NULL DEFAULT 0 COMMENT '数量',
  `Famount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实付金额',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 PAIED-已支付 USED-卡密已核销 REFUND-已退款',
  `Fstatus_explain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Fstage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '步骤状态',
  `Fstage_explain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '步骤状态描述',
  `Fecard_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否创卡 Y-是 N-否',
  `Fecard_time` datetime(0) NULL DEFAULT NULL COMMENT '创卡时间',
  `Fwriteoff_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '核销方式 NON-未核销 OFFLINE-线下发货 ONLINE-线上回收',
  `Fexpress_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线下发货回填快递单号',
  `Fexpress_company` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `Fdelivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `Fdelivery_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `Freceive_addr` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `Fdelivery_notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货推送异步地址',
  `Floan_apply_time` datetime(0) NULL DEFAULT NULL COMMENT '贷款申请时间',
  `Floan_apply_count` int(2) NULL DEFAULT 0 COMMENT '贷款申请次数，用于控制超限，禁用申请',
  `Fcust_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷款客户信息',
  `Floan_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷款信息',
  `Flinkmans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `Fspouse_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶信息',
  `Fwork_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作信息',
  `Fbank_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡信息',
  `Fimages` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影像资料',
  `Fchnl_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `Fchnl_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Fmerchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道商户号',
  `Fchnl_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道申请单号',
  `Fcontract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同号',
  `Fcontract_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同信息',
  `Fwithdraw_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现单号',
  `Fwithdraw_time` datetime(0) NULL DEFAULT NULL COMMENT '提现申请时间',
  `Fcreditor_transfer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转申请信息',
  `Fcreditor_transfer_confirm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转确认信息',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `bl_order_goods_uidx`(`Fout_order_id`, `Fpartner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分期商品订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bl_order_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `bl_order_withdraw`;
CREATE TABLE `bl_order_withdraw`  (
  `Fpay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回收申请单ID',
  `Fout_pay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接入方提现单号',
  `Forgan_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000000000000' COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方ID',
  `Fpartner_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名称',
  `Fcust_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户ID 默认0',
  `Fcust_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '客户手机号 默认0',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Famount` decimal(10, 2) NOT NULL COMMENT '放款/提现金额',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fstatus_explain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Fchnl_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `Fchnl_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Fmerchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道商户号',
  `Fcontract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道合同号',
  `Fchnl_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道放款单号',
  `Fchnl_trx_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道支付单号',
  `Floan_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '放款完成时间',
  `Fnotify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异步通知地址',
  `Freturn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面回调地址',
  `Fecard_id` bigint(20) NULL DEFAULT NULL COMMENT '卡密ID',
  `Fecard_pwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核销卡密',
  `Fbank_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现银行卡',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`Fpay_id`) USING BTREE,
  UNIQUE INDEX `bz_order_withdraw_uidx`(`Fout_pay_id`, `Fpartner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单回收放款申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_advertise
-- ----------------------------
DROP TABLE IF EXISTS `bz_advertise`;
CREATE TABLE `bz_advertise`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `Fregion_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专区广告',
  `Fpic` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Furl_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接类型(OUT_URL:外部链接  IN_URL:内部链接)',
  `Fquery_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询类型(PRODUCT:产品号查询 ARTICLE:文章号查询 )',
  `Fquery_type_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询类型值',
  `Furl` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告地址',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态(VALID:上架 FREEZE:下架)',
  `Fstart_time` datetime(0) NOT NULL COMMENT '开始时间',
  `Fend_time` datetime(0) NOT NULL COMMENT '结束时间',
  `Fclick_count` int(11) NOT NULL DEFAULT 0 COMMENT '点击数（默认0）',
  `Fsort` int(11) NOT NULL COMMENT '排序',
  `Fapp_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFFICIAL' COMMENT 'APP版本 OFFICIAL-正式版 VERIFY-审核版',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_advertise_idx1`(`Fregion_type`) USING BTREE,
  INDEX `bz_advertise_idx2`(`Fsort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_app_store
-- ----------------------------
DROP TABLE IF EXISTS `bz_app_store`;
CREATE TABLE `bz_app_store`  (
  `Fapp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fostype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作系统 IOS ANDROID',
  `Fversion` int(8) NOT NULL COMMENT '版本号',
  `Fversion_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号描述 如x.x.x',
  `Fstate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Fapp_cnname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP中文名',
  `Fapp_enname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP英文名',
  `Fapp_size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP大小,单位MB',
  `Fcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更新内容',
  `Fnecessary` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否强制更新 Y-是 N-否',
  `Fpush_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否启用APP推送 Y-是 N-否',
  `Fdownload_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面下载说明跳转地址',
  `Ficon_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'H5下载页面ICON图标',
  `Fimage_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'H5下载页面图',
  `Fapp_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP下载地址',
  `Fplist_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'plist文件下载地址 IOS 必填',
  `Fcreate_time` datetime(0) NOT NULL,
  `Fcreate_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fmodify_time` datetime(0) NULL DEFAULT NULL,
  `Fmodify_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Fapp_id`) USING BTREE,
  UNIQUE INDEX `bz_app_store_uidx`(`Fapp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'APP 应用管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_area
-- ----------------------------
DROP TABLE IF EXISTS `bz_area`;
CREATE TABLE `bz_area`  (
  `Farea_id` int(11) NOT NULL COMMENT '序号',
  `Farea_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域全称',
  `Fparent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `Fshort_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域简称',
  `Flongitude` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `Flatitude` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `Farea_level` int(11) NULL DEFAULT NULL COMMENT '等级',
  `Fposition` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定位',
  `Fsort` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '排序',
  `Finitial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `Frisk_level` int(11) NULL DEFAULT NULL COMMENT '城市风险等级',
  PRIMARY KEY (`Farea_id`) USING BTREE,
  INDEX `sys_area_uidx`(`Farea_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_assign_user
-- ----------------------------
DROP TABLE IF EXISTS `bz_assign_user`;
CREATE TABLE `bz_assign_user`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Forgan_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属机构',
  `Forgan_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `Fuser_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `Fuser_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `Fuser_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `Fsort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fupdate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '指派用信用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bz_bank_card`;
CREATE TABLE `bz_bank_card`  (
  `Fid` bigint(20) NOT NULL COMMENT 'ID',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定类型 CREDIT-授信绑卡 QUICKPAY-快捷绑卡',
  `Fchannel_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Facct_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '持卡人姓名/账户名',
  `Fphone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行卡预留手机号',
  `Fidcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号 加密存储',
  `Fidcard_short` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证 带星缩写',
  `Fbank_code_en` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行英文缩写',
  `Fbank_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行编号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行名称',
  `Fcard_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号(加密存储)',
  `Fcard_no_short` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号 带星缩写',
  `Fcard_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡类型 DEBIT-借记卡 CREDIT-贷记卡',
  `Fcvn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷记卡的CVN 加密存储',
  `Fexpiry_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡有效期',
  `Fis_default` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否默认 Y-是 N-否',
  `Fchnl_bind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道绑卡ID',
  `Fchnl_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '渠道绑卡状态 NON:无 INIT:待处理 DOING:待短验 BIND_SUCCESS:成功 BIND_FAILURE:失败 TIME_OUT:已过期',
  `Fchnl_rsp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答码描述',
  `Fchnl_rsp_data` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答信息存储',
  `Frequest_count` int(2) NOT NULL DEFAULT 0 COMMENT '请求绑卡次数',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_bank_card_uidx`(`Fchannel_id`, `Fcust_id`, `Fcard_no`) USING BTREE,
  INDEX `bz_bank_card_idx1`(`Fcust_id`) USING BTREE,
  INDEX `bz_bank_card_idx2`(`Fupdate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户银行卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_card_bin
-- ----------------------------
DROP TABLE IF EXISTS `bz_card_bin`;
CREATE TABLE `bz_card_bin`  (
  `Fcardbin_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'cardbin表主键',
  `Fbank_id` bigint(20) NULL DEFAULT NULL COMMENT '银行ID(留空)',
  `Fbank_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发卡行机构代码',
  `Fbank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发卡行名称',
  `Fcardbin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡名',
  `Ftrk_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '磁道信息-磁道',
  `Ftrk_offset` int(4) NULL DEFAULT NULL COMMENT '磁道信息-起始字节',
  `Ftrk_len` int(4) NULL DEFAULT NULL COMMENT '磁道信息-长度',
  `Facc_offset` int(4) NOT NULL COMMENT '主帐号-起始字节',
  `Facc_len` int(4) NULL DEFAULT NULL COMMENT '主帐号-长度',
  `Fcardbin_offset` int(4) NULL DEFAULT NULL COMMENT '发卡行标识-起始字节',
  `Fcardbin_len` int(4) NULL DEFAULT NULL COMMENT '发卡行标识-标识长度',
  `Fcardbin_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发卡行标识-取值',
  `Fcardbin_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡种',
  `Flast_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `bz_bank_bin_uidx`(`Fcardbin_id`) USING BTREE,
  INDEX `id_x1`(`Facc_len`) USING BTREE,
  INDEX `id_x2`(`Fcardbin_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_category_vip
-- ----------------------------
DROP TABLE IF EXISTS `bz_category_vip`;
CREATE TABLE `bz_category_vip`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Ftype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类类型 MALL:商城商品 VIRTUAL:虚拟商品',
  `Fkey` bigint(20) NOT NULL COMMENT '关联分类编号',
  `Fdata` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类会员价格比例json',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_category_vip_Ftype_Fkey_uindex`(`Ftype`, `Fkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类会员价格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_config
-- ----------------------------
DROP TABLE IF EXISTS `bz_config`;
CREATE TABLE `bz_config`  (
  `Fconfig_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `Fconfig_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `Fconfig_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `Fconfig_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `Fconfig_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统内置',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `bz_config_uidx1`(`Fconfig_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_credit_cust_label
-- ----------------------------
DROP TABLE IF EXISTS `bz_credit_cust_label`;
CREATE TABLE `bz_credit_cust_label`  (
  `Fid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fcust_label` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户标签',
  `Fcust_balance` decimal(12, 2) NOT NULL COMMENT '授信额度',
  `Fmin_score` int(6) NULL DEFAULT NULL COMMENT '最低分数',
  `Fmax_score` int(6) NULL DEFAULT NULL COMMENT '最高分数',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_credit_cust_label_idx1`(`Fcust_label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户授信分数标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_credit_cust_quota
-- ----------------------------
DROP TABLE IF EXISTS `bz_credit_cust_quota`;
CREATE TABLE `bz_credit_cust_quota`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fcust_label` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户标签',
  `Fcount` int(3) NOT NULL COMMENT '提额次数',
  `Fbalance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '额度',
  `Fnext_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '下期预估',
  `Fmodify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户提额策略表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_credit_cust_risk
-- ----------------------------
DROP TABLE IF EXISTS `bz_credit_cust_risk`;
CREATE TABLE `bz_credit_cust_risk`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fout_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '查询单号',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(20) NULL DEFAULT NULL COMMENT '客户ID 入库成功后返回写入',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `Fid_card_no` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户身份证',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 SUCC-查询成功 FAIL-查询失败',
  `Fcust_label` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户标签',
  `Fcust_score` int(4) NULL DEFAULT 0 COMMENT '授信分数',
  `Fbalance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '授信额度',
  `Fnext_balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '下期预估授信额度',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `bz_credit_cust_risk_uidx`(`Fout_order_id`, `Fpartner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户风控输出表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_credit_score
-- ----------------------------
DROP TABLE IF EXISTS `bz_credit_score`;
CREATE TABLE `bz_credit_score`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fchnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `Fscore` int(3) NOT NULL DEFAULT 0 COMMENT '分数值',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `bz_credit_score_uidx`(`Fchnl_id`, `Fcust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '授信评分卡记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_credit_score_cust
-- ----------------------------
DROP TABLE IF EXISTS `bz_credit_score_cust`;
CREATE TABLE `bz_credit_score_cust`  (
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户号',
  `Fcust_label` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户标签',
  `Fscore` int(3) NOT NULL COMMENT '分数',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`Fcust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户授信评分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_cust_contacts
-- ----------------------------
DROP TABLE IF EXISTS `bz_cust_contacts`;
CREATE TABLE `bz_cust_contacts`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fcontact_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `Fcontact_phone1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话1',
  `Fcontact_phone2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话2',
  `Fcontact_phone3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话3',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_cust_contacts_idx`(`Fcust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6663 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户通讯录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_cust_sign
-- ----------------------------
DROP TABLE IF EXISTS `bz_cust_sign`;
CREATE TABLE `bz_cust_sign`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcustomer_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `Fsign_data` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到数据',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间,最后签到时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户签到' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_customer
-- ----------------------------
DROP TABLE IF EXISTS `bz_customer`;
CREATE TABLE `bz_customer`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册手机号',
  `Fphone_hit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册手机号撞库',
  `Fnick_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `Forgan_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属机构方编号',
  `Fpartner_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '所属合作方编号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VALID' COMMENT '状态(VALID:正常 FREEZE:冻结)',
  `Fflow` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '流程顺序IDCARD>FACE>INFO>FINISH INFO:基础信息 IDCARD:身份证 FACE:人脸识别 FINISH:完成',
  `Favatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像链接',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `Fgender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '性别 1-男 2-女',
  `Fidcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '身份证 密文',
  `Fidcard_short` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证 缩略',
  `Fstart_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证有效期起始日期',
  `Fend_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证有效期截止日期',
  `Fidcard_addr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证地址',
  `Fidcard_province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证省名称',
  `Fidcard_province_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证省编号',
  `Fidcard_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证城市名称',
  `Fidcard_city_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证城市编号',
  `Fidcard_district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证区县名称',
  `Fidcard_district_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证区县编号',
  `Fnation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `Fbirthday` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日 yyyy-MM-dd',
  `Foffice` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证签发机构',
  `Fidcard_front_img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证正面照片链接',
  `Fidcard_back_img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证反面照片链接',
  `Fface_img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别照片链接',
  `Fface_score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别分数SDK上送',
  `Fface_score_api` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别分数API服务端返回',
  `Fface_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别结果 PASS-通过 NOPASS-不通过',
  `Fface_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸识别结果描述',
  `Flive_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住状况 1:自置商品房 2:租房 3:集体宿舍 4:其他',
  `Flive_province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住省份',
  `Flive_city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住城市',
  `Flive_district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住县区',
  `Flive_addr` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住街道地址',
  `Fcompany` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位名称',
  `Fcompany_province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位省份',
  `Fcompany_city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位城市',
  `Fcompany_district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位县区',
  `Fcompany_addr` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位街道地址',
  `Fcompany_tele` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位电话',
  `Fcompany_position` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位 1:总经理',
  `Feducation` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教育水平 1:专科 2:本科 3:硕士 4:博士及以上 5:初中 6:高中',
  `Fsocial_identity` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社会身份 1:学生 2:在职人员 3:自由职业 4:企业负责人',
  `Fmarriage` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况 1:未婚 2:已婚 3:离异 4:丧偶',
  `Fspouse_idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶身份证',
  `Fspouse_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶姓名',
  `Fspouse_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶手机号',
  `Fspouse_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶工作单位名称',
  `Fcontacts` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人 JsonArray [{\"index\":1,\"phone\":\"\",\"name\":\"\",\"relationship\":\"\"},{...}]  relationship[relatives:亲属 colleague:同事 friend:朋友 classmate:同学]',
  `Fimei` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备IMEI',
  `Fbrand` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备品牌',
  `Fmodel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `Fsystem` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备系统',
  `Fmac` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MAC地址',
  `Fnetwork_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'WIFI 2G 3G 4G 5G',
  `Flatitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位纬度',
  `Flongitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位经度',
  `Flocation_province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位省份',
  `Flocation_city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位城市',
  `Flocation_district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位县区',
  `Flocation_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位详细地址',
  `Fvip_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT 'vip类型 NON-无 YEAR-年卡 HALF_YEAR-半年卡 SEASON-季卡 MONTH-月卡',
  `Fvip_start_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'vip起始时间',
  `Fvip_end_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'vip截止时间',
  `Fblacklist` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否黑名单 Y:是 N:否',
  `Fwhitelist` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否白名单 Y:是 N:否',
  `Fpasswd` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `Flogin_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `Fcontacts_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否获取通讯录 Y-是 N-否',
  `Fidcard_order_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '腾讯云身份证OCR单号',
  `Fface_order_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '腾讯云Face单号',
  `Ftoken_key` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前登录token key，用于踢出登录使用',
  `Fcredit_bill_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '消费用信标志 Y:已用信 N:未用信',
  `Fcreate_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_customer_uidx`(`Fphone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户资料表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_daily_summary
-- ----------------------------
DROP TABLE IF EXISTS `bz_daily_summary`;
CREATE TABLE `bz_daily_summary`  (
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方ID',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型 REGISTER:注册人数',
  `Fday` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期 格式yyyyMMdd',
  `Fval` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '统计值',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `bz_daily_summary_uidx`(`Fpartner_id`, `Ftype`, `Fday`) USING BTREE,
  INDEX `bz_daily_summary_idx1`(`Fday`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合作方日统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `bz_dict_data`;
CREATE TABLE `bz_dict_data`  (
  `Fdict_code` int(10) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `Fdict_sort` int(10) NOT NULL COMMENT '字典排序',
  `Fdict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典标签',
  `Fdict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典键值',
  `Fdict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `Fcss_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性',
  `Flist_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `Fis_default` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `Fstatus` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `bz_dict_data_uidx1`(`Fdict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `bz_dict_type`;
CREATE TABLE `bz_dict_type`  (
  `Fdict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `Fdict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `Fdict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `Fstatus` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `bz_dict_type_uidx1`(`Fdict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_flow_template
-- ----------------------------
DROP TABLE IF EXISTS `bz_flow_template`;
CREATE TABLE `bz_flow_template`  (
  `Fid` int(8) NOT NULL AUTO_INCREMENT,
  `Fflow_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程标识',
  `Fflow_flag_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程标识名称',
  `Fcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `Fcreate_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_flow_template_idx`(`Fflow_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程描述模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_integral_customer
-- ----------------------------
DROP TABLE IF EXISTS `bz_integral_customer`;
CREATE TABLE `bz_integral_customer`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcustomer_id` bigint(20) NOT NULL COMMENT '用户编号',
  `Favaliable_integral` int(11) NULL DEFAULT NULL COMMENT '可用积分',
  `Ftotal_integral` int(11) NULL DEFAULT NULL COMMENT '总获取积分',
  `Fexpire_integral` int(11) NULL DEFAULT NULL COMMENT '过期积分',
  `Fused_integral` int(11) NULL DEFAULT NULL COMMENT '使用积分',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户积分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_integral_detail
-- ----------------------------
DROP TABLE IF EXISTS `bz_integral_detail`;
CREATE TABLE `bz_integral_detail`  (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fcust_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `Frule_id` bigint(20) NULL DEFAULT NULL COMMENT '规则编号',
  `Frule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则类型',
  `Frule_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `Fdirect` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方向(ADD:添加 DEDUCT:扣除)',
  `Fintegral_value` int(11) NULL DEFAULT NULL COMMENT '奖励/扣除积分',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分使用记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `bz_integral_record`;
CREATE TABLE `bz_integral_record`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcust_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `Frule_id` bigint(20) NULL DEFAULT NULL COMMENT '规则编号',
  `Frule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则类型',
  `Fdirect` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方向(ADD:添加 DEDUCT:扣除)',
  `Fintegral_value` int(11) NULL DEFAULT NULL COMMENT '奖励/扣除积分',
  `Fintegral_valid_time` datetime(0) NULL DEFAULT NULL COMMENT '积分失效时间',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_integral_rule
-- ----------------------------
DROP TABLE IF EXISTS `bz_integral_rule`;
CREATE TABLE `bz_integral_rule`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Frule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则类型',
  `Frule_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `Frule_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则关联key',
  `Fdirect` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方向(ADD:添加 DEDUCT:扣除)',
  `Fintegral_value` int(11) NULL DEFAULT NULL COMMENT '奖励/扣除积分',
  `Fintegral_valid_day` int(11) NULL DEFAULT NULL COMMENT '积分有效期',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(VALID:正常 FREEZE:冻结)',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '\'删除标识（N:存在(默认) Y:删除）',
  `Fcreate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '积分规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_label_info
-- ----------------------------
DROP TABLE IF EXISTS `bz_label_info`;
CREATE TABLE `bz_label_info`  (
  `Fid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签类型 GOODS:商品标签',
  `Fwords` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签值',
  `Fsort_num` int(8) NOT NULL COMMENT '排序',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_material
-- ----------------------------
DROP TABLE IF EXISTS `bz_material`;
CREATE TABLE `bz_material`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `Ftype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型（PICTURE:图片,VIDEO:视频）',
  `Fgroup_id` bigint(20) NULL DEFAULT NULL COMMENT '分组ID',
  `Fname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `Furl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '素材链接',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_material_id1`(`Ftype`) USING BTREE,
  INDEX `bz_material_id2`(`Fgroup_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '素材库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_material_group
-- ----------------------------
DROP TABLE IF EXISTS `bz_material_group`;
CREATE TABLE `bz_material_group`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `Fname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分组名',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '素材分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_order_summary
-- ----------------------------
DROP TABLE IF EXISTS `bz_order_summary`;
CREATE TABLE `bz_order_summary`  (
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品ID',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fday` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日期 格式yyyyMMdd',
  `Fhitlib_succ` int(11) NOT NULL DEFAULT 0 COMMENT '撞库成功笔数',
  `Fhitlib_fail` int(11) NOT NULL DEFAULT 0 COMMENT '撞库失败笔数',
  `Fpush_succ` int(11) NOT NULL DEFAULT 0 COMMENT '推送成功笔数',
  `Fpush_fail` int(11) NOT NULL DEFAULT 0 COMMENT '推送失败笔数',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `bz_order_summary_uidx`(`Fproduct_id`, `Fday`) USING BTREE,
  INDEX `bz_order_summary_idx1`(`Fday`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导流订单日统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_organ
-- ----------------------------
DROP TABLE IF EXISTS `bz_organ`;
CREATE TABLE `bz_organ`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `Fcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号 yyMMdd+6位随机数',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态(VALID:正常 FREEZE:冻结)',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `Fremark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_organ_uidx`(`Fcode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_partner
-- ----------------------------
DROP TABLE IF EXISTS `bz_partner`;
CREATE TABLE `bz_partner`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `Fcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号 yyMMdd+6位随机数',
  `Faccount_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户编号 P+Fid',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Fpartner_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方类型 VIP:会员 FLOW:流量 API:api接入',
  `Fcashier_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'IN' COMMENT '内部收银-IN 外部收银-OUT',
  `Fchnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'C000' COMMENT '渠道编号',
  `Fhitlib_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撞库校验渠道',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态(VALID:正常 FREEZE:冻结)',
  `Fapi_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否开通API接入 N-否 Y-是',
  `Furl` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用下载页面URL',
  `Fquota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信额度',
  `Frule_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则设计',
  `Fnode_val` int(9) NOT NULL DEFAULT 0 COMMENT '节点值',
  `Fuser_count` int(9) NOT NULL DEFAULT 0 COMMENT '用户实数',
  `Fuser_count_rule` int(9) NOT NULL DEFAULT 0 COMMENT '用户路由统计数',
  `Fshop_icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商城图标地址',
  `Fshop_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商城名称',
  `Fsms_temp` bigint(20) NULL DEFAULT NULL COMMENT '短信模版编号',
  `Fexecuted_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否被执行名单 Y:是 N:否',
  `Fcontact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `Fcontact_tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Faddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `Fsign_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'MD5' COMMENT '签名类型:MD5,RSA',
  `Fproxypay_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代付通道ID',
  `Fpay_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议支付通道ID',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `Fremark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_partner_uidx`(`Fcode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合作方表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_person_credit
-- ----------------------------
DROP TABLE IF EXISTS `bz_person_credit`;
CREATE TABLE `bz_person_credit`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcust_id` bigint(20) NOT NULL COMMENT '用户编号',
  `Fcust_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `Fchnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '征信源渠道号',
  `Fchnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '征信源渠道名',
  `Fdata_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据类型 TZ-探针 LD-雷达 ',
  `Fdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '征信源数据,json存储',
  `Frsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Frsp_msg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fscore_falg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否分数计算 Y-已计算 N-未计算',
  `Fquery_time` datetime(0) NULL DEFAULT NULL COMMENT '查询时间',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_person_credit_idx`(`Fcust_id`, `Fchnl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '个人征信源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_product
-- ----------------------------
DROP TABLE IF EXISTS `bz_product`;
CREATE TABLE `bz_product`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fchannel_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品通道编号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品通道名称',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品分类 H5：H5外链产品 FORM：表单产品 JOIN：联登下载产品',
  `Fverfiy_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '审核标识 NON-无 CREDIT-授信 LOAN-用信 ALL-全部',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'FREEZE' COMMENT '状态(VALID:上架 FREEZE:下架)',
  `Fis_credit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否授信 N-否 Y-是',
  `Fis_credit_loan` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否发起渠道授信 N-否 Y-是',
  `Frecommend` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '推荐 0-非推荐 1-推荐 主要用于API路由兜底产品',
  `Fname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Fprotocol_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议名称',
  `Fprotocol_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '协议内容',
  `Ficon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ICON图连接',
  `Fimg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `Fquota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额度',
  `Flable` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `Fapply_model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请类型 API H5',
  `Flink` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `Fad_words` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告词',
  `Fexplain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明/描述',
  `Fcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图文内容',
  `Fdaily_limit_num` int(9) NOT NULL DEFAULT 0 COMMENT '日笔数限制',
  `FbeginTime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请起始时间 格式HHmm 如0830 ',
  `FendTime` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请截止时间 格式HHmm 如1900',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识 Y:已经删除 N:未删除',
  `Frepay_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '还款方式 等额本息-LC01 等额本金-LC02',
  `Fbankcard_chnl_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '银行卡签约通道ID',
  `Fbankcard_chnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡签约通道名称',
  `Fquota_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '金融产品额度开通标识 N-无需开通 Y-需开通',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_product_idx1`(`Fchannel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_product_loan
-- ----------------------------
DROP TABLE IF EXISTS `bz_product_loan`;
CREATE TABLE `bz_product_loan`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品ID',
  `Fyear_rate` decimal(8, 6) NOT NULL COMMENT '年利率',
  `Fterm_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '期数单位 DAY-天 MONTH-月',
  `Fterm_type_value` int(3) NOT NULL COMMENT '期数单位值',
  `Fterm` int(3) NOT NULL COMMENT '期数',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_product_loan_uidx`(`Fproduct_id`, `Fyear_rate`, `Fterm_type`, `Fterm_type_value`, `Fterm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '贷款产品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_route
-- ----------------------------
DROP TABLE IF EXISTS `bz_route`;
CREATE TABLE `bz_route`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Frule_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由规则 JsonArray',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_route_idx`(`Fproduct_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '路由' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_route_param
-- ----------------------------
DROP TABLE IF EXISTS `bz_route_param`;
CREATE TABLE `bz_route_param`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Frule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由规则类型 RC002:日限额 RC001:有效期',
  `Fparam_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则值 RC002:数值 RC001:{\"beginTime\":\"yyyy-MM-dd\",\"endTime\":\"yyyy-MM-dd\"}',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_route_param_uidx`(`Fproduct_id`, `Frule_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '路由参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_scene_route
-- ----------------------------
DROP TABLE IF EXISTS `bz_scene_route`;
CREATE TABLE `bz_scene_route`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fscene_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场景号',
  `Fscene_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场景名称',
  `Frule_types` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由规则 JsonArray',
  `Frule_types_force` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '强制路由规则 JsonArray',
  `Fcustom_param_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义算法 格式为 Frule_type:Fparam_data',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_scene_route_idx`(`Fscene_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '场景路由' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_scene_route_param
-- ----------------------------
DROP TABLE IF EXISTS `bz_scene_route_param`;
CREATE TABLE `bz_scene_route_param`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Frule_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由规则类型 SR001:客户白名单 SR002:机构执行名单 SR003:会员规则 SR004:是否强制执行',
  `Frule_type_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由规则类型名称',
  `Fparam_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则值',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_route_param_uidx`(`Frule_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '场景路由参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_secret
-- ----------------------------
DROP TABLE IF EXISTS `bz_secret`;
CREATE TABLE `bz_secret`  (
  `Fsecret_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `Fpurpose` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途（LOCAL:内部使用 API:API接入方密钥 API-SYS:平台密钥）',
  `Faccountid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户号',
  `Faccount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型',
  `Fkey_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密钥类型（DES、AES、MD5、RSA2）',
  `Fpublic_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公钥信息（密文存储(AES)）',
  `Fprivate_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '私钥信息（密文存储(AES)）',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间（即注册时间）',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fsecret_id`) USING BTREE,
  UNIQUE INDEX `bz_secret_uidx`(`Fpurpose`, `Faccountid`, `Faccount_type`, `Fkey_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '密钥表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_serial
-- ----------------------------
DROP TABLE IF EXISTS `bz_serial`;
CREATE TABLE `bz_serial`  (
  `Ftype` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fwidth` bigint(20) NOT NULL,
  `Fstart_sn` bigint(20) NOT NULL,
  `Fnext_sn` bigint(20) NULL DEFAULT NULL,
  `Flast_time` datetime(0) NULL DEFAULT NULL,
  UNIQUE INDEX `bz_serial_uidx`(`Ftype`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '序号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_shop
-- ----------------------------
DROP TABLE IF EXISTS `bz_shop`;
CREATE TABLE `bz_shop`  (
  `Fshop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码（2位对象码+8位序号+2随机）',
  `Fname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺名称',
  `Fshop_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺类型 SELF-自营店  JOIN-加盟店',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID:正常  FREEZE:冻结(默认) NONACTIVATED(未激活)',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `Fsynch_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '同步标识 M-手工录入 S-系统同步',
  `Fchnl_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '渠道ID',
  `Fsynch_period` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步商品周期 单位天',
  `Flast_synch_time` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次同步日期',
  `Flogistics_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货标识 M-手工发货 S-系统发货',
  `Favatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `Fcontact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `Fcontact_tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Fservice_tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服电话',
  `Fprovince` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `Fcity` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `Fdistrict` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `Faddress` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fshop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_sms_order
-- ----------------------------
DROP TABLE IF EXISTS `bz_sms_order`;
CREATE TABLE `bz_sms_order`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Ftemp_id` bigint(20) NULL DEFAULT NULL COMMENT '关联模版编号',
  `Fsend_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `Fsend_result` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送结果(WAIT:等待发送 SUCC:发送成功 FAIL:发送失败)',
  `Fsend_group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送群组(PERSON:个人 BATCH:批量)',
  `Fphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送手机号',
  `Fsend_param` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信发送参数,json',
  `Fbatch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `Fchnl_rsp_data` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答JSON',
  `Fchnl_rsp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答信息',
  `Fcreate_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信发送记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_sms_temp
-- ----------------------------
DROP TABLE IF EXISTS `bz_sms_temp`;
CREATE TABLE `bz_sms_temp`  (
  `Ftemp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Ftemp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信模版编码',
  `Ftemp_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信模版名称',
  `Ftemp_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信模版内容',
  `Fsms_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信类型 NOTIFY-验证码通知 VIP-会员营销',
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道编码',
  `Fchnl_temp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道模版编码',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(正常:VALID,冻结:FREEZE)',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Ftemp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bz_special_page
-- ----------------------------
DROP TABLE IF EXISTS `bz_special_page`;
CREATE TABLE `bz_special_page`  (
  `Fid` int(9) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面名称',
  `Fpath` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面path，包含query参数',
  `Fgroup` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面分组\n字典表special_page_group',
  `Ficon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  `Fsort` int(3) NOT NULL COMMENT '排序',
  `Fcreate_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '特殊页面地址配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_special_region
-- ----------------------------
DROP TABLE IF EXISTS `bz_special_region`;
CREATE TABLE `bz_special_region`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Fregion_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专区类型 ',
  `Fregion_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专区名称',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Ftop` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否置顶 0-否 1-是 默认0；一个专区只有一个置顶',
  `Fdetail_page` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启详情页 0-否 1-是',
  `Fsort` int(6) NOT NULL DEFAULT 0 COMMENT '排序 默认0',
  `Fapp_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFFICIAL' COMMENT 'APP版本 OFFICIAL-正式版 VERIFY-审核版',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_special_area_idx1`(`Fregion_type`) USING BTREE,
  INDEX `bz_special_area_idx2`(`Fsort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '展示专区' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_task_job
-- ----------------------------
DROP TABLE IF EXISTS `bz_task_job`;
CREATE TABLE `bz_task_job`  (
  `Fjob_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `Fjob_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务定义',
  `Fjob_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组定义',
  `Fjob_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `Fjob_state` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `Fcron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间表达式',
  `Fclass_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '映射类名',
  `Fmethod_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名，具体执行动作内容入口',
  `Fjob_update_state` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时任务更新状态（未更新:NOUPDATE(默认) 已更新:UPDATE）',
  `Fproject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属项目名称（定义枚举）',
  `Fcreate_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `Fext_field1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  UNIQUE INDEX `bz_task_job_uidx`(`Fjob_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_vip_cust
-- ----------------------------
DROP TABLE IF EXISTS `bz_vip_cust`;
CREATE TABLE `bz_vip_cust`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Fvip_level` int(2) NOT NULL COMMENT '会员级别',
  `Fvip_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员级别名称',
  `Fvip_card_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员卡号',
  `Fpartner_id` bigint(20) NOT NULL COMMENT '合作方编号',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fvalid_time` datetime(0) NOT NULL COMMENT '生效时间',
  `Finvalid_time` datetime(0) NOT NULL COMMENT '失效时间',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_vip_cust_idx1`(`Fpartner_id`, `Fcust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_vip_price
-- ----------------------------
DROP TABLE IF EXISTS `bz_vip_price`;
CREATE TABLE `bz_vip_price`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Fvip_level` int(2) NOT NULL COMMENT '会员级别',
  `Fvip_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员级别名称',
  `Fvip_desc` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员标题',
  `Fpartner_id` bigint(20) NOT NULL COMMENT '合作方编号',
  `Fprice` decimal(10, 2) NOT NULL COMMENT '价格',
  `Fdiscount_price` decimal(10, 2) NOT NULL COMMENT '折扣价格',
  `Fduration` int(6) NOT NULL COMMENT '时长期间(单位月)',
  `Fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'VALID-正常 FREEZE-冻结',
  `Fis_show` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '是否展示（Y:是,N:否）',
  `Fvip_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道产品号',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `bz_vip_price_idx1`(`Fpartner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员价目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bz_virtual_goods
-- ----------------------------
DROP TABLE IF EXISTS `bz_virtual_goods`;
CREATE TABLE `bz_virtual_goods`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Fparent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父ID',
  `Fshop_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应链编号',
  `Fproduct_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '话费 视频卡券  ',
  `Fproduct_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型 CHINA_MOBLIE:移动 CHINA_TELECOM:电信 CHINA_UNICOM:联通',
  `Fproduct_type_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品类型图',
  `Fproduct_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品号',
  `Fproduct_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品图',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Fsort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `Fface_value` decimal(10, 2) NOT NULL COMMENT '面额  如100',
  `Fprice` decimal(10, 2) NOT NULL COMMENT '售价',
  `Fdata_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ACCT' COMMENT '数据类型 ACCT-账号/手机号  NUM-购买数量',
  `Fdesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `Fcreate_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `bz_virtual_product_uidx`(`Fproduct_type`, `Fproduct_code`, `Fproduct_name`, `Fface_value`) USING BTREE,
  INDEX `bz_virtual_goods_shopid_inx`(`Fshop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '虚拟商品价目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_bill
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill`;
CREATE TABLE `fi_bill`  (
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单号',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联订单号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 WAIT-待还款 OVERDUE:逾期 SETTLE:结清',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品ID',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `Floan_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '借款类型 CASH-备用金 CONSUME-消费分期',
  `Fpartner_id` bigint(10) NULL DEFAULT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(10) NOT NULL COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `Fidcard` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户身份证',
  `Frisk_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '风险等级',
  `Fbank_card_id` bigint(20) NULL DEFAULT NULL COMMENT '银行卡ID',
  `Fbank_bind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡协议绑定ID',
  `Fbank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户行名',
  `Fbank_card_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行卡号',
  `Frepay_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款通道ID',
  `Frepay_chnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '还款通道名称',
  `Frepay_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '还款日(记录下次还款日)',
  `Flast_repay_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '最新还款成功日期',
  `Frepay_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款方式',
  `Fyear_rate` decimal(8, 6) NOT NULL COMMENT '年利率',
  `Fterm_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '周期单位',
  `Fterm` int(3) NOT NULL COMMENT '总期数',
  `Factual_term` int(3) NOT NULL DEFAULT 0 COMMENT '已还期数',
  `Fprincipal_interest` decimal(10, 2) NOT NULL COMMENT '应还总金额',
  `Factual_principal_interest` decimal(10, 2) NOT NULL COMMENT '已还总金额',
  `Fprincipal` decimal(10, 2) NOT NULL COMMENT '应还总本金',
  `Factual_principal` decimal(10, 2) NOT NULL COMMENT '已还本金',
  `Finterest` decimal(10, 2) NOT NULL COMMENT '应还总利息',
  `Factual_interest` decimal(10, 2) NOT NULL COMMENT '已还利息',
  `Fpenalty_interest` decimal(10, 2) NOT NULL COMMENT '应还总罚息',
  `Factual_penalty_interest` decimal(10, 2) NOT NULL COMMENT '已还罚息',
  `Fexpenses` decimal(10, 2) NOT NULL COMMENT '应还总费用',
  `Factual_expenses` decimal(10, 2) NOT NULL COMMENT '应还费用',
  `Fcurrent_overdue_day` int(3) NOT NULL DEFAULT 0 COMMENT '当前逾期天数',
  `Fmax_overdue_day` int(3) NOT NULL DEFAULT 0 COMMENT '历史最大逾期天数',
  `Foverdue_count` int(3) NOT NULL DEFAULT 0 COMMENT '历史逾期次数',
  `Fcancel_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账单取消操作人',
  `Fcancel_time` datetime(0) NULL DEFAULT NULL COMMENT '账单取消时间',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`Fbill_id`) USING BTREE,
  INDEX `fi_repay_bill_idx1`(`Forder_id`) USING BTREE,
  INDEX `fi_repay_bill_idx2`(`Fcust_id`) USING BTREE,
  INDEX `fi_repay_bill_idx3`(`Fcust_phone`) USING BTREE,
  INDEX `fi_repay_bill_idx4`(`Fcreate_time`) USING BTREE,
  INDEX `fi_bill_Fstatus_index`(`Fstatus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单还款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_bill_plan
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill_plan`;
CREATE TABLE `fi_bill_plan`  (
  `Fplan_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款单号',
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单号',
  `Fcust_id` bigint(20) NULL DEFAULT NULL COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 WAIT:待还款 SETTL:结清 OVERDUE:余期',
  `Fpay_action` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '付款标识 N-无付款行为 Y-付款中',
  `Ftotal_term` int(3) NOT NULL COMMENT '总期数',
  `Fterm` int(3) NOT NULL COMMENT '期数',
  `Fbill_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账单日 yyyy-MM-dd',
  `Frepay_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款日 yyyy-MM-dd',
  `Fprincipal_interest` decimal(10, 2) NOT NULL COMMENT '当期应还金额',
  `Factual_principal_interest` decimal(10, 2) NOT NULL COMMENT '当期实还金额',
  `Fprincipal` decimal(10, 2) NOT NULL COMMENT '当期应还本金',
  `Factual_principal` decimal(10, 2) NOT NULL COMMENT '当期实还本金',
  `Finterest` decimal(10, 2) NOT NULL COMMENT '当期应还利息',
  `Factual_interest` decimal(10, 2) NOT NULL COMMENT '当期实还利息',
  `Foverdue_cut_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '逾期日切日期 yyyy-MM-dd',
  `Foverdue_day` int(3) NOT NULL COMMENT '逾期天数',
  `Fpenalty_interest` decimal(10, 2) NOT NULL COMMENT '逾期罚息',
  `Factual_penalty_interest` decimal(10, 2) NOT NULL COMMENT '实还逾期罚息',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fplan_id`) USING BTREE,
  INDEX `fi_bill_plan_idx1`(`Fbill_id`) USING BTREE,
  INDEX `fi_bill_plan_idx2`(`Frepay_day`) USING BTREE,
  INDEX `fi_bill_plan_idx3`(`Fstatus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单还款计划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_bill_plan_pay
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill_plan_pay`;
CREATE TABLE `fi_bill_plan_pay`  (
  `Fpay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付单号',
  `Fplan_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款单号',
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单号',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付状态',
  `Fpay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `Fpay_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式 S-系统代扣 M-手工还款',
  `Fbank_card_id` bigint(20) NULL DEFAULT NULL COMMENT '银行卡ID',
  `Fbank_bind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡协议绑定ID',
  `Fbank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行名称',
  `Fbank_card_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `Ftrx_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台交易单号',
  `Fpay_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道',
  `Fpay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `Fpay_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付备注',
  `Fpay_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付应答码',
  `Fpay_code_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付应答码描述',
  `Fchnl_rsp_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道应答错误描述',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fpay_id`) USING BTREE,
  INDEX `fi_bill_plan_pay_idx1`(`Fplan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单还款计划支付' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_bill_plan_payment
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill_plan_payment`;
CREATE TABLE `fi_bill_plan_payment`  (
  `Fpay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付单号',
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单号',
  `Frepay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款方式 PLAN-按计划 AMOUNT-按金额',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付状态',
  `Fpay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `Fpay_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付类型 S-系统代扣 M-手工还款',
  `Fpay_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式 Y-实扣 N-非实扣',
  `Fbank_card_id` bigint(20) NULL DEFAULT NULL COMMENT '银行卡ID',
  `Fbank_bind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡协议绑定ID',
  `Fbank_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行名称',
  `Fbank_card_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `Ftrx_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台交易单号',
  `Fpay_chnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道',
  `Fpay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `Fpay_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付备注',
  `Fpay_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付应答码',
  `Fpay_code_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付应答码描述',
  `Fchnl_rsp_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道应答错误描述',
  `Fupdate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM' COMMENT '更新人',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fpay_id`) USING BTREE,
  INDEX `fi_bill_plan_payment_idx1`(`Fbill_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单还款支付' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_bill_plan_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill_plan_payment_detail`;
CREATE TABLE `fi_bill_plan_payment_detail`  (
  `Fdetail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付明细单号',
  `Fpay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付单号',
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单号',
  `Fplan_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账单计划号',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Fdetail_id`) USING BTREE,
  INDEX `fi_bill_plan_payment_detail_idx1`(`Fpay_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单还款计划支付明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_bill_remark
-- ----------------------------
DROP TABLE IF EXISTS `fi_bill_remark`;
CREATE TABLE `fi_bill_remark`  (
  `Fbill_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账单编号',
  `Fcust_id` bigint(10) NULL DEFAULT NULL COMMENT '客户Id',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `Fcontent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '摘要',
  `Fupdate_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fbill_id`) USING BTREE,
  INDEX `fi_bill_remark_Fcust_id_index`(`Fcust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账单摘要' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_capital
-- ----------------------------
DROP TABLE IF EXISTS `fi_capital`;
CREATE TABLE `fi_capital`  (
  `Fid` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fchnl_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资方通道ID',
  `Fchnl_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资方通道名称',
  `Fsort` int(6) NOT NULL DEFAULT 0 COMMENT '排序 越大越靠前',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `fi_capitail_idx1`(`Fproduct_id`) USING BTREE,
  INDEX `fi_capitail_idx2`(`Fsort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资方配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_capital_order
-- ----------------------------
DROP TABLE IF EXISTS `fi_capital_order`;
CREATE TABLE `fi_capital_order`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fout_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '受理单号',
  `Forgan_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方ID',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fstatus_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Fstage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段状态',
  `Fstage_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段状态描述',
  `Fcapital_id` bigint(10) NOT NULL COMMENT '资方配置ID',
  `Floan_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单类型 CASH-现金分期 CONSUME-消费分期',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `Fchannel_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Famount` decimal(10, 2) NULL DEFAULT NULL COMMENT '申请金额',
  `Frepay_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '还款方式 等额本息-LC01 等额本金-LC02',
  `Fyear_rate` decimal(8, 6) NULL DEFAULT NULL COMMENT '年利率',
  `Fterm_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '期数单位 DAY-天 MONTH-月',
  `Fterm_type_value` int(3) NULL DEFAULT NULL COMMENT '期数单位值',
  `Fterm` int(3) NULL DEFAULT NULL COMMENT '期数',
  `Fcust_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷款客户信息',
  `Floan_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷款信息',
  `Flinkmans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `Fspouse_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配偶信息',
  `Fwork_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作信息',
  `Fbank_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡信息',
  `Fimages` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影像资料',
  `Fchnl_merchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道商户号',
  `Fchnl_rsp_orderid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答单号',
  `Fchnl_loan_pay_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道放款支付单号',
  `Fchnl_loan_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '通道放款完成时间',
  `Fchnl_rsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fchnl_rsp_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答信息存储',
  `Fchnl_rsp_time` datetime(0) NULL DEFAULT NULL COMMENT '通道应答时间',
  `Fcontract_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同号',
  `Fcontract_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同信息',
  `Floan_apply_time` datetime(0) NULL DEFAULT NULL COMMENT '贷款申请时间',
  `Floan_pay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '放款申请单号',
  `Floan_time` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `Fcreditor_transfer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转申请信息',
  `Fcreditor_transfer_confirm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转确认信息',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  INDEX `fi_capital_order_idx1`(`Fout_order_id`) USING BTREE,
  INDEX `fi_capital_order_idx2`(`Floan_pay_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资方出资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_cash_order
-- ----------------------------
DROP TABLE IF EXISTS `fi_cash_order`;
CREATE TABLE `fi_cash_order`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fbl_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户授信单号',
  `Fcredit_loan_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台授信编号',
  `Fout_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '外部业务单号 ',
  `Floan_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CASH' COMMENT '订单类型 CASH-现金分期 CONSUME-消费分期',
  `Forgan_id` bigint(10) NOT NULL COMMENT '机构编号',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(10) NULL DEFAULT NULL COMMENT '客户编号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fstatus_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Fstage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段状态',
  `Fstage_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段状态描述',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ICON',
  `Fchannel_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名',
  `Famount` decimal(10, 2) NOT NULL COMMENT '申请金额',
  `Fintegral` int(8) NULL DEFAULT NULL COMMENT '使用积分',
  `Fbank_card` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡信息JSON',
  `Fverify_advise` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WAIT' COMMENT '信审结果',
  `Frepay_type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'LC01' COMMENT '还款方式 等额本息-LC01 等额本金-LC02',
  `Fyear_rate` decimal(8, 6) NULL DEFAULT 0.000000 COMMENT '年利率',
  `Fterm_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'DAY' COMMENT '期数单位 DAY-天 MONTH-月',
  `Fterm_type_value` int(3) NULL DEFAULT NULL COMMENT '期数单位值',
  `Fterm` int(3) NULL DEFAULT NULL COMMENT '期数',
  `Fcontract_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同号',
  `Fcontract_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同信息',
  `Floan_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '放款金额',
  `Freceive_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '到账金额',
  `Floan_apply_time` datetime(0) NULL DEFAULT NULL COMMENT '放款申请时间',
  `Floan_date` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `Floan_pay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT '放款申请单号',
  `Fchnl_merchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道商户号',
  `Fchnl_rsp_orderid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答单号',
  `Fchnl_loan_pay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道放款支付单号',
  `Fchnl_loan_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '通道放款完成时间',
  `Fchnl_rsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fchnl_rsp_data` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答信息存储',
  `Fchnl_rsp_time` datetime(0) NULL DEFAULT NULL COMMENT '通道应答时间',
  `Floan_usage` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '借款用途',
  `Fremark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Faccount_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '登账标识  NON-无需登账 SUCC-申请成功登账 FAIL-申请失败回退登账',
  `Faccount_time` datetime(0) NULL DEFAULT NULL COMMENT '登账时间',
  `Fbill_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否创建账单 N-否 Y-是',
  `Fbill_time` datetime(0) NULL DEFAULT NULL COMMENT '账单创建时间',
  `Fcancel_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单取消操作人',
  `Fcancel_time` datetime(0) NULL DEFAULT NULL COMMENT '订单取消时间',
  `Fcreditor_transfer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转申请信息',
  `Fcreditor_transfer_confirm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '债转确认信息',
  `Flatitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位纬度',
  `Flongitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位经度',
  `Flocation_province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位省份',
  `Flocation_city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位城市',
  `Flocation_district` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位县区',
  `Flocation_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位详细地址',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  INDEX `fi_cash_order_idx2`(`Fcust_id`) USING BTREE,
  INDEX `fi_cash_order_idx1`(`Fcreate_time`) USING BTREE,
  INDEX `fi_cash_order_idx3`(`Floan_pay_id`) USING BTREE,
  INDEX `fi_cash_order_idx4`(`Fout_order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '备用金订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_order
-- ----------------------------
DROP TABLE IF EXISTS `fi_order`;
CREATE TABLE `fi_order`  (
  `Flog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流水号/订单号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 WAIT:待审 PASS:通过 NOPASS:未通过',
  `Fpartner_id` bigint(10) NULL DEFAULT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Forgan_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '000000000000' COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `Fsupplier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商 SYSTEM-平台 SZQIAKE-深圳恰客',
  `Fsupplier_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商ID',
  `Fuser_new` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否新用户 Y-是 N-否',
  `Fuser_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户ID，只做存储和客户表无关',
  `Fuser_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fuser_risk_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户风险等级',
  `Fuser_mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fuser_idNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户身份证号',
  `Fident_address_detail` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍地址',
  `Fcompany_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位地址',
  `Fcompany_mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位电话',
  `Fcompany_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `Fcareer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `Femail` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `Fcredit_limit` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '额度(元)',
  `Fcredit_limit_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额度状态 VALID-有效 FREEZE-无效',
  `Fcredit_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信时间',
  `Ffamily_contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭联系人姓名',
  `Ffamily_contact_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭联系人电话',
  `Fother_contact_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他联系人姓名',
  `Fother_contact_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他联系人电话',
  `Fproduct_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `Forder_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态 0待审',
  `Fthird_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号(奥特)',
  `Forder_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号(通道)',
  `Forder_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `Fgoods_count` int(8) NULL DEFAULT NULL COMMENT '订单数量',
  `Fgoods_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `Fgoods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价(元)',
  `Fdown_payment_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '首付金额(元)',
  `Fconsume_installment_times` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '分期期数',
  `Fconsume_installment_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '月供(元)',
  `Fdelivery_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人名字',
  `Fdelivery_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `Fdelivery_by_me` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否本人收货 Y/N',
  `Fdelivery_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `Floan_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '放款状态 NON(默认) SUCC-放款成功   FAIL-放款失败',
  `Floan_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '放款金额',
  `Fimage_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片信息',
  `Ffirst_verify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '初审审核人/执行人用户名',
  `Ffirst_verify_user_nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初审审核人/执行人用户昵称',
  `Ffirst_verify_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'WAIT' COMMENT '初审状态/执行状态 WAIT:待审 LOCK:锁单 PASS:通过 NOPASS:不通过',
  `Ffirst_verify_advise` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初审建议',
  `Ffirst_verify_time` datetime(0) NULL DEFAULT NULL COMMENT '初审审核时间',
  `Ffirst_verify_lock_time` datetime(0) NULL DEFAULT NULL COMMENT '初审锁单时间',
  `Ffirst_verify_lock_timeout` datetime(0) NULL DEFAULT NULL COMMENT '初审锁单超时时间',
  `Fverify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '审核人/执行人用户名',
  `Fverify_user_nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人/执行人用户昵称',
  `Fverify_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态/执行状态 WAIT:待审 LOCK: 锁单 PASS:通过  NOPASS:不通过',
  `Fverify_advise` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核建议',
  `Fverify_condition` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核条件JSON 存储',
  `Fverify_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Fverfiy_lock_time` datetime(0) NULL DEFAULT NULL COMMENT '锁单时间',
  `Fverify_lock_timeout` datetime(0) NULL DEFAULT NULL COMMENT '锁单超时时间',
  `Fverify_push` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核推送标识 S-推送成功 F-推送失败 N-未推送',
  `Fverify_push_time` datetime(0) NULL DEFAULT NULL COMMENT '审核推送时间',
  `Fverify_push_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核推送失败描述',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `Fext_field1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段1',
  `Fext_field2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`Flog_id`) USING BTREE,
  UNIQUE INDEX `fi_order_uidx1`(`Fsupplier_id`, `Forder_no`) USING BTREE,
  INDEX `fi_order_idx1`(`Fuser_mobile`) USING BTREE,
  INDEX `fi_order_idx2`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '金融信审订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_order_record
-- ----------------------------
DROP TABLE IF EXISTS `fi_order_record`;
CREATE TABLE `fi_order_record`  (
  `Flog_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水号/订单号',
  `Frecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变更记录',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Flog_id`) USING BTREE,
  UNIQUE INDEX `fi_order_record_uidx`(`Flog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '金融订单记录表，一单一记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_recover_info
-- ----------------------------
DROP TABLE IF EXISTS `fi_recover_info`;
CREATE TABLE `fi_recover_info`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `Fchnl_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道编号',
  `Fchnl_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道名称',
  `Fbank_chnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡渠道编号',
  `Fbank_chnl_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡渠道名称',
  `Fstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 VALID-正常 FREEZE-冻结',
  `Fcreate_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT 'datetime',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回收配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fi_repay
-- ----------------------------
DROP TABLE IF EXISTS `fi_repay`;
CREATE TABLE `fi_repay`  (
  `Frepay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品单号',
  `Flog_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品单号',
  `Fsupplier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商 SYSTEM-平台 SZQIAKE-深圳恰客',
  `Fsupplier_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商ID',
  `Fuser_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户编号',
  `Fuser_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `Fuser_mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fuser_idNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户身份证',
  `Forder_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号(通道)',
  `Forigin_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信贷单号',
  `Fgoods_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `Fprincipal` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还总本金',
  `Factual_principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '已还本金',
  `Finterest` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还总利息',
  `Factual_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '已还利息',
  `Fpenalty_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还总罚息',
  `Factual_penalty_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '已还罚息',
  `Fexpenses` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还总费用',
  `Factual_expenses` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还费用',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款状态 WAIT:待还款 OVERDUE:逾期 SETTLE:结清',
  `Ftotal_seq` int(3) NULL DEFAULT NULL COMMENT '总期数',
  `Ftran_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '新增时间',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Frepay_id`) USING BTREE,
  UNIQUE INDEX `fi_repay_uidx1`(`Fsupplier_id`, `Forder_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '还款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for fi_repay_item
-- ----------------------------
DROP TABLE IF EXISTS `fi_repay_item`;
CREATE TABLE `fi_repay_item`  (
  `Fitem_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款单号',
  `Frepay_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品单号',
  `Fseq` int(3) NULL DEFAULT NULL COMMENT '期数',
  `Fpay_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应还日期',
  `Fprincipal` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还本金',
  `Factual_principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '实还本金',
  `Finterest` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还利息',
  `Factual_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '实还利息',
  `Fpenalty_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还罚息',
  `Factual_penalty_interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '实还罚息',
  `Fexpenses` decimal(10, 2) NULL DEFAULT NULL COMMENT '应还费用',
  `Factual_expenses` decimal(10, 2) NULL DEFAULT NULL COMMENT '实还费用',
  `Fwaive_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '减免金额',
  `Ffinish_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结清时间',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款状态 WAIT:待还款 OVERDUE:逾期 SETTLE:结清',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fitem_id`) USING BTREE,
  UNIQUE INDEX `fi_repay_item_uidx1`(`Frepay_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '还款计划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mm_func_group
-- ----------------------------
DROP TABLE IF EXISTS `mm_func_group`;
CREATE TABLE `mm_func_group`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Fbackground_image` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `Ffunc_region` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能专区位',
  `Ffunc_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转方式 IN：内链 OUT：外链',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `Ficon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图标',
  `Flink_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接类型 SPU:商品 GATEGORY:商品分类 PRODUCT:金融产品 CUSTOM：内置地址 URL：H5链接',
  `Flink_type_value` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型值(自定义链接必填)',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能名称',
  `Frotate_picture` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图片（最多5张，逗号分隔）',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fenable` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态（N:不启用  Y:启用(默认)）',
  `Fapp_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFFICIAL' COMMENT 'APP版本 OFFICIAL-正式版 VERIFY-审核版',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `Fremark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功能表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mm_func_value
-- ----------------------------
DROP TABLE IF EXISTS `mm_func_value`;
CREATE TABLE `mm_func_value`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Ffunc_group_id` bigint(20) NOT NULL COMMENT '功能编号',
  `Frelation_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联主键',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `mm_func_value_idx`(`Ffunc_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功能值' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mm_home_category
-- ----------------------------
DROP TABLE IF EXISTS `mm_home_category`;
CREATE TABLE `mm_home_category`  (
  `Fcategory_id` bigint(20) NOT NULL COMMENT '编号',
  `Fcategory_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Fsort_num` int(10) NOT NULL COMMENT '显示顺序（默认0）',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  UNIQUE INDEX `mm_home_category_uidx1`(`Fcategory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mm_message
-- ----------------------------
DROP TABLE IF EXISTS `mm_message`;
CREATE TABLE `mm_message`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'GENERAL' COMMENT '消息类型 GENERAL:普通消息',
  `Ftitle` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `Fcontent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `Fbusi_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'TEXT' COMMENT '业务类型  TEXT:文本 ORDER:订单',
  `Fbusi_link` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `Fcust_id` bigint(20) NULL DEFAULT 0 COMMENT '业务类型涉及客户则需回填客户',
  `Fread_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `Fdel_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否删除 Y-是 N-否',
  `Fcreate_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `ms_message_idx1`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mm_region_spu
-- ----------------------------
DROP TABLE IF EXISTS `mm_region_spu`;
CREATE TABLE `mm_region_spu`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型 FOLLOW:猜你喜欢 RECOMMEND:推荐',
  `Fspu_id` bigint(20) NOT NULL COMMENT '编号',
  `Fspu_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID FREEZE',
  `Fsort_num` int(10) NOT NULL COMMENT '显示顺序（默认0）',
  `Fcreate_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `mm_home_spu_uidx1`(`Ftype`, `Fspu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1045 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品按区域类型划分' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_brand
-- ----------------------------
DROP TABLE IF EXISTS `ms_brand`;
CREATE TABLE `ms_brand`  (
  `Fbrand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `Fbrand_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名称',
  `Ficon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `Fletter` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌首字母',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（VALID: 正常 FREEZE:冻结）',
  `Fstory` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌故事',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `ms_brand_uidx`(`Fbrand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_cart
-- ----------------------------
DROP TABLE IF EXISTS `ms_cart`;
CREATE TABLE `ms_cart`  (
  `Fcart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户编号',
  `Fspu_id` bigint(20) NOT NULL COMMENT '产品编号',
  `Fspu_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fsku_id` bigint(20) NOT NULL COMMENT 'SKU 编号',
  `Fsku_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU名称',
  `Fsku_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU',
  `Fspec` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `Fquantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `Fprice` decimal(16, 4) NULL DEFAULT NULL COMMENT '价格（添加到购物车的价格）',
  `Falbum_pics` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '画册图片（取第一张）',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fcart_id`) USING BTREE,
  UNIQUE INDEX `ms_cart_uidx`(`Fcust_id`, `Fspu_id`, `Fsku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_cashier
-- ----------------------------
DROP TABLE IF EXISTS `ms_cashier`;
CREATE TABLE `ms_cashier`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fpay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付类型 BILLPAY:账单支付 ALIPAY:支付宝 WECHATPAY:微信支付 QUICKPAY:快捷支付',
  `Fpay_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付类型名称',
  `Ftrx_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易码',
  `Fchannel_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道码 C004:深圳洽客 C101:支付宝 C102:微信支付',
  `Fchannel_icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道图标',
  `Fproduct_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '金融产品ID',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 VALID:正常  FREEZE:冻结',
  `Fsort_num` int(3) NOT NULL DEFAULT 999 COMMENT '排序',
  `Fcreate_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fmodify_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `ms_cashier`(`Fpay_type`, `Ftrx_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城收银台' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_category
-- ----------------------------
DROP TABLE IF EXISTS `ms_category`;
CREATE TABLE `ms_category`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcategory_id` bigint(20) NULL DEFAULT NULL COMMENT '分类编号',
  `Fcategory_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `Fshop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属门店',
  `Fchnl_category_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道分类编号',
  `Fcalc_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算公式模型，只支持顶级目录的配置',
  `Fgroup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类目分组 虚拟商品:VIRTUAL 普通商品:GENERAL',
  `Fparent_id` bigint(20) NOT NULL COMMENT '父编号(顶级目录:0)',
  `Flevel` int(1) NOT NULL COMMENT '级别分类（0:顶级 1:一级 2:二级)',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `Fkeywords` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `Fnav_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导航栏显示（Y:显示 N:不显示）',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（VALID:正常  FREEZE:冻结）',
  `Fbusiness_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '62' COMMENT '分类业务码',
  `Ficon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `ms_category_idx1`(`Fcategory_id`, `Fshop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 763 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_category_copy1
-- ----------------------------
DROP TABLE IF EXISTS `ms_category_copy1`;
CREATE TABLE `ms_category_copy1`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fcategory_id` bigint(20) NULL DEFAULT NULL COMMENT '分类编号',
  `Fcategory_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `Fshop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属门店',
  `Fchnl_category_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道分类编号',
  `Fcalc_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算公式模型，只支持顶级目录的配置',
  `Fgroup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类目分组 虚拟商品:VIRTUAL 普通商品:GENERAL',
  `Fparent_id` bigint(20) NOT NULL COMMENT '父编号(顶级目录:0)',
  `Flevel` int(1) NOT NULL COMMENT '级别分类（0:顶级 1:一级 2:二级)',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `Fkeywords` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `Fnav_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导航栏显示（Y:显示 N:不显示）',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（VALID:正常  FREEZE:冻结）',
  `Ficon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `ms_category_idx1`(`Fcategory_id`, `Fshop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 762 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_comment
-- ----------------------------
DROP TABLE IF EXISTS `ms_comment`;
CREATE TABLE `ms_comment`  (
  `Fcomment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品编号',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户编号',
  `Ftype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NORMAL' COMMENT 'NORMAL-正常评论（默认），VIRTUAL-虚拟评论',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `Fdetail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单明细号',
  `Fspu_attr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品属性',
  `Fstar` decimal(5, 2) NULL DEFAULT NULL COMMENT '星级（评价星级 0-5星）',
  `Fcontent` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `Freply` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复',
  `Fread_count` int(11) NOT NULL DEFAULT 0 COMMENT '阅读次数（默认0）',
  `Fpics` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片（最多6张）',
  `Fdel_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间（评论时间）',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fcomment_id`) USING BTREE,
  INDEX `ms_comment_idx1`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_cust_address
-- ----------------------------
DROP TABLE IF EXISTS `ms_cust_address`;
CREATE TABLE `ms_cust_address`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户编号',
  `Ftype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'EXPRESS' COMMENT 'EXPRESS：快递物流\r\nVIRTUAL: 虚拟商品',
  `Fcontact_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `Fcontact_tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `Fprovince` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称',
  `Fcity` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称',
  `Fdistrict` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区名称',
  `Faddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `Fis_default` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '默认标识',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '最后操作时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `ms_cust_address_idx2`(`Fcust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户收货地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_ecard
-- ----------------------------
DROP TABLE IF EXISTS `ms_ecard`;
CREATE TABLE `ms_ecard`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Fsource_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'MALL' COMMENT 'MALL-商城订单[ms_order] RIGHTS-权益订单[app_order]',
  `Fcard_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'JD' COMMENT '卡类型',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fdetail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细单号',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户手机号',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 NOT_USED-未使用 USED-已使用',
  `Fsupplier_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `Fsupplier_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `Fcard_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡号',
  `Fpassword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卡密 加密存储',
  `Fcard_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡名称',
  `Finvalid_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失效时间',
  `Fface_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '面值',
  `Frecovery_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '回收价',
  `Fuse_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `Faction_flag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT '卡密核销方式 RECOVERY-回收 OFFLINE-发货 ONLINE-使用',
  `Fwrite_off_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡密核销订单编号',
  `Fdel_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识 Y-是 N-否',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `ms_ecard_Fcard_no_Fpassword_uindex`(`Fcard_no`, `Fpassword`) USING BTREE,
  INDEX `ms_ecard_idx1`(`Forder_id`) USING BTREE,
  INDEX `ms_ecard_idx2`(`Fcust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 320 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_market
-- ----------------------------
DROP TABLE IF EXISTS `ms_market`;
CREATE TABLE `ms_market`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fsku_id` bigint(20) NOT NULL COMMENT '营销的SKU',
  `Fspu_id` bigint(20) NOT NULL COMMENT '营销的SKU所属的商品',
  `Fname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `Ftype` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '营销类型，SECKILL-秒杀，BULK-团购，BARGAIN-砍价',
  `Fstart` datetime(0) NOT NULL COMMENT '营销活动具体开始日期时间',
  `Fend` datetime(0) NOT NULL COMMENT '营销活动具体结束日期时间',
  `Fstart_time` time(0) NULL DEFAULT NULL COMMENT '营销活动开始时间，主要针对秒杀',
  `Fend_time` time(0) NULL DEFAULT NULL COMMENT '营销活动结束日期，主要针对秒杀',
  `Fstock` int(8) NULL DEFAULT NULL COMMENT '库存',
  `Fprice` decimal(16, 4) NOT NULL COMMENT '价格',
  `Fsale_num` int(11) NOT NULL COMMENT '销量',
  `Fconfig` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营销额外配置，如团购的成团人数，成团时间等',
  `Fstatus` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态，ENABLE-营销活动可用，DISABLE-营销活动不可用',
  `Fsort` int(11) NOT NULL DEFAULT 0,
  `Fcreate_time` datetime(0) NOT NULL,
  PRIMARY KEY (`Fid`) USING BTREE,
  INDEX `ms_market_idx1`(`Ftype`) USING BTREE,
  INDEX `ms_market_idx2`(`Fstart_time`) USING BTREE,
  INDEX `ms_market_idx3`(`Fend_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品营销表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_order
-- ----------------------------
DROP TABLE IF EXISTS `ms_order`;
CREATE TABLE `ms_order`  (
  `Forder_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `Fchnl_order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道订单号',
  `Fshop_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家编号',
  `Fshop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家名称',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户编号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fcust_nick_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `Fconsume_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消费类型EXPRESS：快递物流',
  `Fstatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态\r\nPAYING-待付款\r\nWAIT_DELIVER-待发货\r\nWAIT_RECEIVING-待收货\r\nFINISHED-已完成\r\nCANCEL-已取消\r\n',
  `Fbill_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否分期订单 Y-是 N-否',
  `Fecard_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否赠送电子卡 Y-是 N-否',
  `Fvip_buy_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否只允许会员购买 Y-是 N-否',
  `Fmarket_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NON' COMMENT '营销类型\r\nSECKILL-秒杀，\r\nBULK-团购，\r\nBARGAIN-砍价',
  `Fmarket_id` bigint(20) NULL DEFAULT NULL COMMENT '营销编号-非普通订单时必填',
  `Fmarket_extra_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营销拓展Id',
  `Fmarket_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营销状态',
  `Ftotal_amount` decimal(12, 2) NOT NULL COMMENT '订单总金额     500',
  `Ftv_amount` decimal(12, 2) NOT NULL COMMENT '票卷优惠金额(减算)  10',
  `Fmb_amount` decimal(12, 2) NOT NULL COMMENT '会员优惠金额(减算)  10',
  `Fpay_amount` decimal(12, 2) NOT NULL COMMENT '应付金额 490',
  `Fchannel_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款渠道',
  `Ftrx_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易码',
  `Fpay_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式名称',
  `Fpay_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式',
  `Fpay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `Ftrxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款单号',
  `Ftop_trxid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信/支付宝付款单号',
  `Fonly_bill_pay` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否仅适用账单支付Y-是 N-否',
  `Forder_push` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '订单推送 Y-已推送 N-未推送',
  `Forder_push_response` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单推送结果',
  `Fdesc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单描述',
  `Fnote` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `Fauto_close_time` datetime(0) NULL DEFAULT NULL COMMENT '超时时间',
  `Fauto_confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '自动确认时间',
  `Ffinish_time` datetime(0) NULL DEFAULT NULL COMMENT '订单完成时间',
  `Fdelivery_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址 JSON',
  `Fdelivery_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货信息JSON',
  `Ftv_details` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '票卷详情 JSON',
  `Fdelivery_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货标识 PLATFORM-平台发货,SUPPLIER-供应链发货',
  `Fdel_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `ms_order_uidx`(`Forder_id`) USING BTREE,
  INDEX `ms_order_idx1`(`Fcust_id`) USING BTREE,
  INDEX `ms_order_idx2`(`Fstatus`) USING BTREE,
  INDEX `ms_order_idx3`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `ms_order_detail`;
CREATE TABLE `ms_order_detail`  (
  `Fdetail_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '明细单号',
  `Forder_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `Fshop_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家/供应链ID',
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品编号',
  `Fspu_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编码',
  `Fspu_title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `Fspu_category_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类目分组',
  `Fspu_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品单位',
  `Fsku_id` bigint(30) NOT NULL COMMENT 'SKU编号',
  `Fsku_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU名称',
  `Fsku_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU编码',
  `Fspec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格值',
  `Fbill_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否分期订单 Y-是 N-否',
  `Fecard_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否赠送电子卡 Y-是 N-否',
  `Freturn_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否退货 Y-是 N-否',
  `Falbum_pics` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片',
  `Fcost_price` decimal(12, 2) NOT NULL COMMENT '成本价   400',
  `Fmarket_price` decimal(12, 2) NOT NULL COMMENT '市场价格 600',
  `Fsales_price` decimal(12, 2) NOT NULL COMMENT '销售价格 500',
  `Fquantity` int(8) NOT NULL DEFAULT 0 COMMENT '购买数量 1 ',
  `Ftotal_amount` decimal(12, 2) NOT NULL COMMENT '商品总金额 500',
  `Ftv_amount` decimal(12, 2) NOT NULL COMMENT '票卷优惠金额(减算) 10',
  `Fmb_amount` decimal(12, 2) NOT NULL COMMENT '会员优惠金额(减算) 10',
  `Ffreight` decimal(12, 2) NOT NULL COMMENT '运费 (加算)10',
  `Fpay_amount` decimal(12, 2) NOT NULL COMMENT '应付金额 490',
  `Fext_busi_data` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拓展业务数据',
  `Ftv_details` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '票卷优惠明细[ {\"tvId\":\"10\", \"tvName\":\"满500立减10元\"}]',
  `Fmb_details` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员优惠明细 {\"type\":\"MEMBER_PRICE\", \"value\":\"10.00\"}',
  `Fcomment_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '评论标识（Y:已评论 N:未评论(默认)）',
  `Fstatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NON' COMMENT '详情状态',
  `Fcreate_time` datetime(0) NOT NULL,
  `Fupdate_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Fdetail_id`) USING BTREE,
  INDEX `ms_order_detail_idx1`(`Forder_id`) USING BTREE,
  INDEX `ms_order_detail_idx2`(`Fspu_id`, `Fsku_id`) USING BTREE,
  INDEX `ms_order_detail_idx3`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_order_record
-- ----------------------------
DROP TABLE IF EXISTS `ms_order_record`;
CREATE TABLE `ms_order_record`  (
  `Forder_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `Frecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变更记录',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Forder_id`) USING BTREE,
  UNIQUE INDEX `ms_order_record_uidx`(`Forder_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录表，一单一记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_order_return
-- ----------------------------
DROP TABLE IF EXISTS `ms_order_return`;
CREATE TABLE `ms_order_return`  (
  `Freturn_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退货订单号',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fdetail_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '明细编号数组',
  `Forder_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单标题',
  `Fcust_id` bigint(20) NOT NULL COMMENT '客户号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `Forder_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GENERAL:普通商品',
  `Fpay_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原订单支付方式 BILLPAY-账单支付 ALIPAY-支付宝',
  `Frefund_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'REFUND—仅退款\r\nRETURN—退货退款\r\n',
  `Freason` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因',
  `Fproof_pics` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '凭证图片（逗号隔开，最多6张）',
  `Fdescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Freturn_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款人电话',
  `Freturn_quantity` int(10) NOT NULL COMMENT '退货数量',
  `Fintegral_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '积分金额',
  `Fintegral_disburse` int(11) NULL DEFAULT NULL COMMENT '消费积分',
  `Fintegral_income` int(11) NULL DEFAULT NULL COMMENT '可获积分',
  `Freturn_amount` decimal(12, 2) NOT NULL COMMENT '退货金额',
  `Fpromotion_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '促销金额',
  `Fdiscount_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'APPLY—退款申请\r\nCANCEL—退款申请取消\r\nREFUND—退款完成\r\n',
  `Fhandle_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `Fhandle_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'WAIT—待审核\r\nPASS—审核通过\r\nFAIL—审核不通过\r\n',
  `Fhandle_note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `Fhandle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `Freturn_time` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `Fchannel_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款通道ID',
  `Ftrxid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易订单',
  `Ftop_trxid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道交易单号',
  `Fchnl_rsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fdel_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fdetails` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品详情JSONArray',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '申请时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '更新时间',
  UNIQUE INDEX `t_order_return_uidx1`(`Freturn_id`) USING BTREE,
  INDEX `t_order_return_idx1`(`Fcust_id`) USING BTREE,
  INDEX `t_order_return_idx2`(`Fcreate_time`) USING BTREE,
  INDEX `t_order_return_idx3`(`Forder_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单退货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_order_return_record
-- ----------------------------
DROP TABLE IF EXISTS `ms_order_return_record`;
CREATE TABLE `ms_order_return_record`  (
  `Freturn_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退款单号',
  `Frecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变更记录',
  `Fupdate_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`Freturn_id`) USING BTREE,
  UNIQUE INDEX `ms_order_record_uidx`(`Freturn_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退款记录表，一单一记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_seckill_record
-- ----------------------------
DROP TABLE IF EXISTS `ms_seckill_record`;
CREATE TABLE `ms_seckill_record`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fmarket_id` bigint(20) NOT NULL,
  `Fsku_id` bigint(20) NOT NULL COMMENT '营销的SKU',
  `Fspu_id` bigint(20) NOT NULL COMMENT '营销的SKU所属的商品',
  `Fcust_id` bigint(20) NOT NULL COMMENT '购买的客户',
  `Ftype` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '营销类型，SECKILL-秒杀，BULK-团购，BARGAIN-砍价',
  `Fscene` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场次',
  `Fprice` decimal(16, 4) NOT NULL COMMENT '价格',
  `Forder_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Fcreate_time` datetime(0) NOT NULL,
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀销售记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_seckill_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ms_seckill_schedule`;
CREATE TABLE `ms_seckill_schedule`  (
  `Fmarket_id` bigint(20) NOT NULL,
  `Fstart_time` datetime(0) NOT NULL,
  `Fend_time` datetime(0) NOT NULL,
  `Fsku_id` bigint(20) NOT NULL COMMENT '营销的SKU',
  `Fspu_id` bigint(20) NOT NULL COMMENT '营销的SKU所属的商品'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀时间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_sku
-- ----------------------------
DROP TABLE IF EXISTS `ms_sku`;
CREATE TABLE `ms_sku`  (
  `Fsku_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Fsku_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU编号(自定义)',
  `Fsku_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品编号',
  `Fbill_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否允许分期 Y-允许分期  N-不允许，需全额支付',
  `Fecard_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否有电子卡赠送 Y-有 N-否',
  `Fintegration` int(10) NOT NULL DEFAULT 0 COMMENT '赠送积分（默认0）',
  `Fthumb_pics` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品缩略图（单张图片）',
  `Fparam_json` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展参数json',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `Fcost_price` decimal(16, 4) NOT NULL COMMENT '成本价格（默认0）',
  `Fsales_price` decimal(16, 4) NOT NULL COMMENT '销售价格（默认0）',
  `Fmarket_price` decimal(16, 4) NOT NULL COMMENT '市场价格（默认0）',
  `Fmember_price_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员价类型（不开启:NOT 会员价格:MEMBER_PRICE 会员等级折扣:LEVEL_DISCOUNT）',
  `Fmember_price` decimal(16, 4) NULL DEFAULT NULL COMMENT '会员价格',
  `Fspec_value_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格值ID集合(\",\"分隔)',
  `Fenable` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '是否有效（Y:有效(默认) N:失效）',
  `Fdel_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fsku_id`) USING BTREE,
  UNIQUE INDEX `ms_sku_uidx1`(`Fsku_id`) USING BTREE,
  INDEX `ms_sku_idx1`(`Fspu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品SKU表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_spec
-- ----------------------------
DROP TABLE IF EXISTS `ms_spec`;
CREATE TABLE `ms_spec`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格名称',
  `Fdel_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `ms_spec_uidx`(`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `ms_spec_value`;
CREATE TABLE `ms_spec_value`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Fname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格值名称',
  `Fspec_id` bigint(20) NOT NULL COMMENT '规格ID',
  `Fdel_flag` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `ms_spec_value_uidx`(`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 451 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规格值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_spu
-- ----------------------------
DROP TABLE IF EXISTS `ms_spu`;
CREATE TABLE `ms_spu`  (
  `Fspu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `Fspu_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品货号',
  `Fspu_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品标题',
  `Fshop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商家编号',
  `Fis_self` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否自营 Y-自营 N-非自营',
  `Fbill_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否允许分期 Y-允许分期  N-不允许，需全额支付',
  `Fvip_buy_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否只允许会员购买 Y-是 N-否',
  `Fis_show` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '是否展示 Y:展示 N:不展示',
  `Fcategory_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类目分组（普通商品:GENERAL 虚拟商品:VIRTUAL）',
  `Fcategory_id1` bigint(20) NOT NULL COMMENT '商品分类1级',
  `Fcategory_id2` bigint(20) NOT NULL COMMENT '商品分类2级',
  `Fcategory_id3` bigint(20) NOT NULL COMMENT '商品分类3级',
  `Fbrand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌编号',
  `Fbrand_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `Fkeywords` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品关键字',
  `Fkeywords_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品关键字搜索次数',
  `Fgoods_label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标签',
  `Fdetail_title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详情页标题',
  `Fdetail_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详情页描述',
  `Fsort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `Fsaleable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否上架（Y:上架 N:下架）',
  `Fsaleable_patterns` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上下架方式（立刻上下架：IMMEDIATELY 定时上下架：TIMING）',
  `Fsaleable_start_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上架时间',
  `Fsaleable_end_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下架时间',
  `Fspec_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格类型（UNIFIED: 统一规格,MORE:多规格）',
  `Funit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品单位（如: 份、包、件等）',
  `Fprice` decimal(16, 4) NULL DEFAULT NULL COMMENT '销售价格',
  `Fsale_num` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟销量',
  `Fprice_up` decimal(16, 4) NOT NULL COMMENT '最高价',
  `Fprice_down` decimal(16, 4) NULL DEFAULT NULL COMMENT '最低价',
  `Fmember_discounts` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否有会员折扣（Y:是 N:否）',
  `Fpur_limit_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '限购类型（NOT：不限购 THIS_TIME：本次限购 THAT_DAY：当日限购 THIS_MONTH：本月限购 LIFELONG：终身限购）',
  `Fpur_limit_qty` int(3) NULL DEFAULT NULL COMMENT '限购数量',
  `Fmin_pur_qty` int(3) NULL DEFAULT NULL COMMENT '起购数量',
  `Fpur_qty_ops_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '购买数量操作类型（DEFAULT：默认 INC_DEC：递增/减 MULTIPLE：倍增/减）',
  `Fpur_inc_dec_qty` int(3) NULL DEFAULT NULL COMMENT '购买递增/减数量',
  `Fpur_multiple` int(3) NULL DEFAULT NULL COMMENT '购买倍数',
  `Fconsume_patterns` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消费方式（TAKEAWAY：同城外卖 EAT_IN：店内堂食 HELP_YOURSELF：到店自取 EXPRESS：快递物流）',
  `Fpreset_visits` int(10) NOT NULL DEFAULT 0 COMMENT '预设访问量',
  `Fcard_package_id` bigint(20) NULL DEFAULT NULL COMMENT '票券卡包编号',
  `Fconfig_json` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展配置json',
  `Fpacking_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '包装清单',
  `Fafter_service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后服务',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fthumb_pics` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品缩略图（单张图片）',
  `Falbum_pics` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图册（轮播图,最多5张,逗号分割）',
  `Fvideo_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频类型（DEFAULT：默认 TENCENT：腾讯视频）',
  `Fvideo_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `Fvideo_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频封面',
  `Fdescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品描述',
  `Fmd5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键字摘要信息',
  `Fvip_id` bigint(20) NULL DEFAULT NULL COMMENT '会员编号',
  `Fexpire_time` int(11) NULL DEFAULT 0 COMMENT '失效时间 单位:天',
  `Fcreate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`Fspu_id`) USING BTREE,
  UNIQUE INDEX `ms_spu_uidx1`(`Fspu_id`) USING BTREE,
  INDEX `ms_spu_idx1`(`Fcreate_time`) USING BTREE,
  INDEX `ms_spu_idx2`(`Fkeywords_count`) USING BTREE,
  INDEX `ms_spu_idx3`(`Fupdate_time`) USING BTREE,
  INDEX `ms_spu_Fsaleable_index`(`Fsaleable`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1086 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_spu_sku_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `ms_spu_sku_spec_value`;
CREATE TABLE `ms_spu_sku_spec_value`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品id',
  `Fsku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `Fspec_value_id` bigint(20) NOT NULL COMMENT '规格值',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `ms_spu_sku_spec_value_uidx`(`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 624 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品SKU规格值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_spu_spec
-- ----------------------------
DROP TABLE IF EXISTS `ms_spu_spec`;
CREATE TABLE `ms_spu_spec`  (
  `Fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品ID',
  `Fspec_id` bigint(20) NOT NULL COMMENT '规格ID',
  `Fdel_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '删除标识（N:存在(默认) Y:删除）',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`Fid`) USING BTREE,
  UNIQUE INDEX `ms_spu_spec_uidx`(`Fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_stock
-- ----------------------------
DROP TABLE IF EXISTS `ms_stock`;
CREATE TABLE `ms_stock`  (
  `Fspu_id` bigint(20) NOT NULL COMMENT '商品编号',
  `Fsku_id` bigint(20) NOT NULL COMMENT 'Sku编号',
  `Fstock` int(8) NOT NULL DEFAULT 0 COMMENT '库存(默认0)',
  `Fstock_low` int(8) NOT NULL DEFAULT 0 COMMENT '预警库存(默认0)',
  `Fsale` int(11) NOT NULL DEFAULT 0 COMMENT '总销量(默认0)',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `ms_stock_uidx`(`Fspu_id`, `Fsku_id`) USING BTREE,
  INDEX `ms_stock_idx1`(`Fspu_id`) USING BTREE,
  INDEX `ms_stock_idx2`(`Fsku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ms_supplier_record
-- ----------------------------
DROP TABLE IF EXISTS `ms_supplier_record`;
CREATE TABLE `ms_supplier_record`  (
  `Fid` bigint(20) NOT NULL,
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fshop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原供应链ID',
  `Fspu_id` bigint(20) NOT NULL COMMENT '原SPUID',
  `Fspu_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原供应链商品ID',
  `Fsku_id` bigint(20) NOT NULL COMMENT '原SKUID',
  `Fsku_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原供应链SKUID',
  `Fto_shop_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转至新供应链ID',
  `Fto_spu_id` bigint(20) NOT NULL COMMENT '转至SPUID',
  `Fto_spu_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转至供应链商品ID',
  `Fto_sku_id` bigint(20) NOT NULL COMMENT '转至SKUID',
  `Fto_sku_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转至供应链SKUID',
  `Fcreate_user` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '更换供应链发货记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父部门（默认0）',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0:正常  1:冻结）',
  `fixed_number` int(10) NULL DEFAULT NULL COMMENT '部门定员',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0:存在(默认) 1:删除）',
  `create_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `sys_dept_uidx`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户帐号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点（默认:00 系统用户）',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录状态（SUCC:成功(默认) FAIL:失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示信息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  UNIQUE INDEX `sys_logininfor_uidx`(`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 785 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NOT NULL COMMENT '父编号（默认0）',
  `sort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `path_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否为外连（Y:是 N:否(默认)）',
  `menu_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型（M:目录 C:菜单 F:按钮）',
  `visible` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否显示（Y:显示(默认) N:隐藏）',
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0:正常 1:冻结）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识（默认#）',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `sys_menu_uidx`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_menu_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_copy`;
CREATE TABLE `sys_menu_copy`  (
  `menu_id` bigint(20) NULL DEFAULT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `sort_num` int(11) NULL DEFAULT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_frame` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visible` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT NULL COMMENT '业务类型（0:其它(默认) 1:新增 2:修改 3:删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `operator_type` int(2) NULL DEFAULT NULL COMMENT '操作类别（0:其它(默认) 1:后台用户 2:手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求IP',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回参数',
  `status` int(1) NULL DEFAULT NULL COMMENT '操作状态（0:正常(默认) 1:异常）',
  `error_msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  UNIQUE INDEX `sys_oper_log_uidx`(`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1710 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限字符串',
  `account_type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型（00: 运营 10: 代理）',
  `account_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属账户编号（运营默认:0）',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据范围（1:全部数据权限 2:自定数据权限 3:本部门数据权限 4:本部门及以下数据权限）',
  `sort_num` int(10) NOT NULL DEFAULT 0 COMMENT '显示顺序（默认0）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0:正常  1:冻结）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0:存在(默认) 1:删除）',
  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `sys_role_uidx`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
  UNIQUE INDEX `sys_role_men_uidx`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dept_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '部门编号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `account_type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户类型（00: 运营 10: 代理）',
  `account_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属账户编号（运营默认:0）',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帐号状态（0:正常 1:停用）',
  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标识（0:存在(默认)  1:删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `sys_user_uidx`(`user_id`) USING BTREE,
  UNIQUE INDEX `sys_user_uidx1`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  UNIQUE INDEX `sys_user_role_uidx`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_adjust_log
-- ----------------------------
DROP TABLE IF EXISTS `t_adjust_log`;
CREATE TABLE `t_adjust_log`  (
  `Flog_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录id',
  `Fadjust_object` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调账对象 partner-合作方 customer-客户',
  `Fpartner_id` bigint(20) NOT NULL COMMENT '合作方ID',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名称',
  `Fcust_id` bigint(20) NULL DEFAULT 0 COMMENT '客户编号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Ftrans_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登账交易类型',
  `Fproduct_id` bigint(20) NOT NULL COMMENT '产品编号',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `Fchnl_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchnl_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `Famount` decimal(12, 2) NOT NULL COMMENT '金额',
  `Faccount_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '登账标识 NON-未登账 SUCC-登账成功 FAIL-登账失败',
  `Faccount_time` datetime(0) NULL DEFAULT NULL COMMENT '登账时间',
  `Faccount_state_explain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登账状态描述',
  `Fverify_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态（NON:无需审核 WAIT：待审核，PASS：通过，NOPASS：不通过）',
  `Fverify_advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `Fverify_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `Fverify_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fcreate_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `Fmodify_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `Fremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  UNIQUE INDEX `bz_recharge_uidx`(`Flog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调账申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Forgan_id` bigint(10) NOT NULL COMMENT '机构编号',
  `Forgan_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构号',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名',
  `Fpartner_id` bigint(10) NOT NULL COMMENT '合作方编号',
  `Fpartner_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作方号',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名',
  `Fcust_id` bigint(10) NULL DEFAULT NULL COMMENT '客户编号',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PRE:预创单 INFO:资料采集 SIGN:待签约 APPLY:申请 PART:部分完成 FINISH:完成 ABANDON:作废',
  `Fstatus_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `Famount` decimal(18, 6) NOT NULL COMMENT '申请金额',
  `Fperiod` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还款周期 单位月',
  `Floan_usage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款用途',
  `Floan_conditions` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '贷款资料',
  `Fapply_num` int(3) NOT NULL DEFAULT 0 COMMENT '申请数量',
  `Fapply_num_succ` int(3) NOT NULL DEFAULT 0 COMMENT '申请成功数量',
  `Fintegral` int(8) NULL DEFAULT NULL COMMENT '使用积分',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `t_order_uidx`(`Forder_id`) USING BTREE,
  INDEX `t_order_idx2`(`Fcreate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail`  (
  `Fdetail_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `Fbl_order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户授信单号',
  `Fcust_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户号',
  `Fcust_phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Famount` decimal(12, 2) NULL DEFAULT NULL COMMENT '申请金额',
  `Fproduct_id` bigint(10) NOT NULL COMMENT '产品编号',
  `Fproduct_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品类型',
  `Fproduct_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `Fproduct_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ICON',
  `Fchannel_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchannel_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名',
  `Fstatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'WAIT:待申请 APPLY:申请中 SUCC:成功 FAIL:失败',
  `FisNew` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '通道是否新用户 N-老用户 Y-新用户',
  `Fquota` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信额度',
  `Flink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信链接',
  `Fcredit_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授信状态 默认NON:无 VERIFY:审核中 VERIFY_SUCC:审核通过 VERIFY_FAIL:审核失败',
  `Fintegral` int(8) NULL DEFAULT NULL COMMENT '使用积分',
  `Fcontract_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `Floan_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '放款金额/合同金额',
  `Freceive_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '到账金额',
  `Floan_date` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `Frsp_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务应答码',
  `Fchnl_rsp_orderid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答单号',
  `Fchnl_rsp_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答描述',
  `Fchnl_rsp_data` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道应答信息存储',
  `Fchnl_rsp_time` datetime(0) NULL DEFAULT NULL COMMENT '通道应答时间',
  `Fcount_flow` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统计计数流程 NON-未统计 HITLIT-撞库统计 GUIDE_ORDER-导单统计',
  `Fremark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Faccount_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '登账标识  NON-无需登账 SUCC-申请成功登账 FAIL-申请失败回退登账',
  `Faccount_time` datetime(0) NULL DEFAULT NULL COMMENT '登账时间',
  `Fcreate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  UNIQUE INDEX `t_order_detail_uidx`(`Fdetail_id`) USING BTREE,
  INDEX `t_order_idx1`(`Forder_id`) USING BTREE,
  INDEX `t_order_idx2`(`Fcust_id`, `Fchannel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_tran_deal
-- ----------------------------
DROP TABLE IF EXISTS `t_tran_deal`;
CREATE TABLE `t_tran_deal`  (
  `Fdeal_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号（自增）',
  `Fdeal_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理要求（CONFIRM_RESULT:待确认交易结果）',
  `Fmax_deal_times` int(10) NOT NULL COMMENT '最多处理次数',
  `Fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理状态（WAIT_DEAL:待处理 SUCCESS:已处理成功 FAIL:处理失败 DOING:处理中(不用) NO_NEED_DEAL:不需要处理）',
  `Frelate_trans_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联产品（默认:0000）',
  `Frelate_inside_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联交易码（默认:0000）',
  `Ftrxid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `Frelate_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联数据（关联数据:json串）',
  `Fdeal_times` int(10) NOT NULL COMMENT '已处理次数',
  `Fnext_deal_time` datetime(0) NOT NULL COMMENT '下一次处理时间',
  `Fcreate_time` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `Fmodify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `Fnotify_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推送地址',
  `Fext_field1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段1',
  UNIQUE INDEX `t_trx_deal_uidx`(`Fdeal_id`) USING BTREE,
  INDEX `t_trx_deal_idx2`(`Ftrxid`) USING BTREE,
  INDEX `t_trx_deal_idx3`(`Fdeal_type`) USING BTREE,
  INDEX `t_trx_deal_idx1`(`Fnext_deal_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 753035 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '特定交易处理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_trx
-- ----------------------------
DROP TABLE IF EXISTS `t_trx`;
CREATE TABLE `t_trx`  (
  `Ftrxid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易号',
  `Fori_trxid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联原交易号',
  `Fsource` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单业务来源 GOODS:商品购买 ',
  `Forder_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源订单号',
  `Fproduct_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1001' COMMENT '1001:收款',
  `Ftrxcode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型',
  `Forgan_id` bigint(20) NULL DEFAULT 0 COMMENT '机构ID',
  `Forgan_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `Fpartner_id` bigint(10) NULL DEFAULT 0 COMMENT '合作方ID',
  `Fpartner_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合作方名称',
  `Fpartner_acct_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'P0' COMMENT '合作方账号',
  `Fcust_id` bigint(20) NULL DEFAULT NULL COMMENT '客户编码',
  `Fcust_phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `Fcust_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `Fopenid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道客户号 如微信openId,支付宝sellerId',
  `Fapp_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道appId 如支付宝,微信',
  `Fgpid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源方全局标识号（交易请求方设置,回送时必填）',
  `Fstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `Fstate_explain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `Frsp_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统应答码',
  `Fcurrency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CNY' COMMENT '币种',
  `Famount` decimal(18, 6) NOT NULL COMMENT '交易金额',
  `Ffee` decimal(18, 6) NOT NULL DEFAULT 0.000000 COMMENT '交易手续费',
  `Freceive_amount` decimal(18, 6) NULL DEFAULT 0.000000 COMMENT '实际到账金额(用于代付到账)',
  `Fdebit_amount` decimal(18, 6) NULL DEFAULT 0.000000 COMMENT '实际扣账金额(用于代付=交易金额+手续费)',
  `Fchnl_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道号',
  `Fchnl_merid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道商户号',
  `Fchnl_trxid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道交易号',
  `Fchnl_top_trxid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道上游交易号',
  `Fchnl_rsp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答码',
  `Fchnl_rsp_msg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答描述',
  `Fchnl_rsp_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道应答数据',
  `Fpay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `Fnotify_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NON' COMMENT '推送标识（WAIT:等待推送(默认) SUCC:推送成功 FAIL:推送失败）',
  `Fnotify_num` int(2) NOT NULL DEFAULT 0 COMMENT '推送次数',
  `Fnotify_time` datetime(0) NULL DEFAULT NULL COMMENT '推送时间',
  `Fbusiness_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '00' COMMENT '业务标识（默认:00）',
  `Fori_business_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原业务标识',
  `Fexpire_time` datetime(0) NULL DEFAULT NULL COMMENT '交易超时时间',
  `Fsubject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `Fremark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Fbind_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绑卡单号',
  `Fbank_card_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NON' COMMENT '卡类型 NON-无 DEBIT-借记卡 CREDIT-贷记卡',
  `Fbank_card_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易卡号(前六后四)',
  `Fbank_code_en` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开卡行编号',
  `Fbank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开卡行名称',
  `Fidcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `Fpriv_data` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单来源数据',
  `Fis_reversed` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '冲退标识 N-无 Y-已退回(用于代付)',
  `Freverse_time` datetime(0) NULL DEFAULT NULL COMMENT '冲退时间(用于代付)',
  `Faccount_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登账标识',
  `Faccount_time` datetime(0) NULL DEFAULT NULL COMMENT '登账时间',
  `Fnotify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异步通知地址',
  `Fcreate_time` datetime(0) NOT NULL COMMENT '创建时间',
  `Fupdate_time` datetime(0) NOT NULL COMMENT '修改时间',
  `Fext_field1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段1',
  `Fext_field2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段2',
  `Fext_field3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`Ftrxid`) USING BTREE,
  UNIQUE INDEX `t_trx_uidx`(`Ftrxid`) USING BTREE,
  INDEX `t_trx_idx1`(`Forder_id`) USING BTREE,
  INDEX `t_trx_idx2`(`Fcreate_time`) USING BTREE,
  INDEX `t_trx_idx3`(`Fsource`) USING BTREE,
  INDEX `t_trx_idx4`(`Fpartner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交易表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_trx_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_trx_refund`;
CREATE TABLE `t_trx_refund`  (
  `Ftrxid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Frelated_trxid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Famount` decimal(18, 6) NOT NULL,
  `Ffee` decimal(18, 6) NOT NULL,
  `Fstate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Fcreate_time` datetime(0) NOT NULL,
  UNIQUE INDEX `t_trx_refund_uidx`(`Ftrxid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Function structure for nextvals
-- ----------------------------
DROP FUNCTION IF EXISTS `nextvals`;
delimiter ;;
CREATE FUNCTION `nextvals`(n varchar(255),c int)
 RETURNS int(11)
BEGIN
declare _cur bigint(255);  
set _cur =(select Fnext_sn+c from bz_serial where Ftype = n for update);  
update bz_serial set Fnext_sn = _cur  
where Ftype =n ;  
return _cur;  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
