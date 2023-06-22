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

 Date: 21/06/2023 10:10:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of bz_config
-- ----------------------------
INSERT INTO `bz_config` VALUES (1, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-06-06 11:33:00', 'admin', '2022-06-06 11:33:00', 'WEB密码');
INSERT INTO `bz_config` VALUES (101, '时间限制内最大发送次数', 'SMS_LIMIT_COUNT', '5', 'SMS', 'admin', '2022-06-06 11:33:00', 'admin', '2022-06-06 11:33:00', '短信配置');
INSERT INTO `bz_config` VALUES (102, '重复发送时间限制，单位分钟', 'SMS_LIMIT_TIME', '30', 'SMS', 'admin', '2022-06-06 11:33:00', 'admin', '2022-06-06 11:33:00', '短信配置');
INSERT INTO `bz_config` VALUES (103, '验证有效期,单位分钟', 'SMS_VALID_TIME', '5', 'SMS', 'admin', '2022-06-06 11:33:00', 'admin', '2022-06-06 11:33:00', '短信配置');
INSERT INTO `bz_config` VALUES (104, '时间限制内最大活检次数', 'FACE_LIMIT_COUNT', '5', 'FACE', 'admin', '2022-06-06 11:33:00', 'admin', '2022-06-06 11:33:00', '人脸活检配置');
INSERT INTO `bz_config` VALUES (110, '合作方导流H5地址', 'GUIDE_H5', 'https://www.sanrixing.com', 'Y', 'admin', '2022-06-27 15:38:51', 'admin', NULL, NULL);
INSERT INTO `bz_config` VALUES (111, '合作方独立下载页地址', 'GUIDE_API', 'https://www.sanrixing.com', 'Y', 'admin', '2022-06-27 15:40:05', NULL, NULL, NULL);
INSERT INTO `bz_config` VALUES (112, '商城订单关闭时间,单位分钟', 'MS_ORDER_CLOSE_TIME', '120', 'MS_ORDER', 'admin', '2022-06-30 19:04:05', NULL, NULL, '商城订单配置');
INSERT INTO `bz_config` VALUES (113, '商城订单确认时间,单位天', 'MS_ORDER_CONFIRM_TIME', '1', 'MS_ORDER', 'admin', '2022-06-30 19:05:09', NULL, NULL, '商城订单配置');
INSERT INTO `bz_config` VALUES (114, '金融订单锁单超时时间,单位分钟', 'FI_ORDER_LOCK_TIMEOUT', '60', 'FINANCE', 'admin', '2022-07-04 18:39:56', NULL, NULL, '金融订单配置');
INSERT INTO `bz_config` VALUES (115, '客户卡密查询有效期,单位分钟', 'CUST_ECARD_TIME', '120', 'CUST_ECARD', 'admin', '2022-08-26 10:16:19', 'admin', '2022-08-26 10:16:19', '礼包卡密配置');
INSERT INTO `bz_config` VALUES (116, '商城订单定时关闭时间(补偿),单位天', 'MS_ORDER_TASK_CLOSE_TIME', '2', 'MS_ORDER', 'admin', '2022-09-03 10:20:09', 'admin', '2022-09-03 10:20:09', '商城订单配置');
INSERT INTO `bz_config` VALUES (117, '售价加收百分比', 'SALE_CALC_RATE_FIVE', '5', 'SALE_CALC', 'admin', '2022-09-23 17:01:57', 'admin', '2022-09-23 17:01:57', '售价加收百分比');
INSERT INTO `bz_config` VALUES (118, '库存预警值', 'STOCK_LOW', '5', 'STOCK_LOW', 'admin', '2022-09-23 19:35:09', 'admin', '2022-09-23 19:35:09', '库存预警值');
INSERT INTO `bz_config` VALUES (119, '会员购买完成跳转链接', 'SUCC_URL', 'http://xxx.sanrixing.com/member', 'VIP_PAY_JUMP_URL', 'admin', '2022-11-01 15:01:14', 'admin', '2022-11-01 15:01:14', '购买完成跳转链接');
INSERT INTO `bz_config` VALUES (120, '会员购买失败跳转链接', 'FAIL_URL', 'http://xxx.sanrixing.com/pay-result?orderSource=VIP_BUY&state=N', 'VIP_PAY_JUMP_URL', 'admin', '2022-11-01 15:01:14', 'admin', '2022-11-01 15:01:14', '购买失败跳转链接');
INSERT INTO `bz_config` VALUES (121, '备用金借款配置', 'PETTY_CASH_VIEW', '[{amount: 5000,integral:800},{amount: 10000,integral:1000},{amount: 20000,integral:1500}]', 'CASH_BILL', 'admin', '2023-01-03 18:09:00', NULL, NULL, '备用金借款金额可选借款金额及积分配置');
INSERT INTO `bz_config` VALUES (122, '平台授信下次允许申请天数', 'CREDIT_LOAN_ALLOW_DAY', '15', 'CREDIT_LOAN', 'admin', '2023-01-06 14:28:12', NULL, NULL, '平台授信配置');
INSERT INTO `bz_config` VALUES (123, '平台授信审核锁单超时时间,单位分', 'CREDIT_LOAN_LOCK_TIMEOUT', '30', 'CREDIT_LOAN', 'admin', '2023-01-06 14:30:42', 'admin', NULL, '平台授信配置');
INSERT INTO `bz_config` VALUES (124, '账单逾期罚息利率', 'BILL_OVERDUE_RATE', '0.001', 'Y', 'admin', '2023-02-27 20:43:44', 'admin', NULL, '账单逾期罚息');
INSERT INTO `bz_config` VALUES (125, 'ios广告开关', 'IOS_AD_ENABLE', 'false', 'AD_ENABLE', 'SYSTEM', '2023-03-03 10:36:55', 'SYSTEM', '2023-03-03 10:37:01', 'true打开,false关闭');
INSERT INTO `bz_config` VALUES (126, '安卓广告开关', 'ANDROID_AD_ENABLE', 'false', 'AD_ENABLE', 'SYSTEM', '2023-03-03 10:36:55', 'SYSTEM', '2023-03-03 10:37:01', 'true打开,false关闭');
INSERT INTO `bz_config` VALUES (127, '账单逾期罚息利率封顶', 'BILL_OVERDUE_RATE_MAX', '0.1', 'Y', 'admin', '2023-02-27 20:43:44', 'admin', NULL, '账单逾期罚息利率封顶');
INSERT INTO `bz_config` VALUES (128, '平台授信消费有效期(天)', 'CONSUME_INVALID_DAY', '90', 'Y', 'admin', '2023-03-27 12:05:48', NULL, NULL, '平台授信自动审核');
INSERT INTO `bz_config` VALUES (129, '平台授信下次允许消费天数', 'CONSUME_ALLOW_DAY', '15', 'Y', 'SYSTEM', '2023-03-30 13:49:57', 'SYSTEM', '2023-03-30 13:49:57', NULL);
INSERT INTO `bz_config` VALUES (130, '卡密回收H5链接', 'CARD_RECOVERY_H5_URL', 'http://xxx.sanrixing/h5/retrieve', 'Y', 'SYSTEM', '2023-04-06 14:27:01', 'admin', '2023-04-06 14:27:01', '卡密回收H5业务');
INSERT INTO `bz_config` VALUES (131, '账单到期还款提醒天数', 'DUE_REPAYMENT_DAY', '1', 'Y', 'SYSTEM', '2023-04-10 10:36:46', NULL, NULL, '到期还款天数前');
INSERT INTO `bz_config` VALUES (132, '账单逾期提醒天数', 'OVERDUE_REMINDER_DAY', '7', 'Y', 'SYSTEM', '2023-04-10 10:36:46', NULL, NULL, '逾期还款天数内');
INSERT INTO `bz_config` VALUES (133, '消费用信拒绝取消可继续申请等级', 'CREDIT_BILL_REPEAT_LABEL', 'A1,A2,A3', 'Y', 'SYSTEM', '2023-04-17 13:59:37', NULL, NULL, '该等级,消费分期取消拒绝后可重复申请');
INSERT INTO `bz_config` VALUES (134, '消费用信下期预估额度', 'CREDIT_BILL_NEXT_AMOUNT', '2000', 'Y', 'SYSTEM', '2023-04-22 14:20:41', NULL, NULL, '消费用信下期预估额度');
INSERT INTO `bz_config` VALUES (135, '协议支付绑卡成功跳转地址', 'BIND_CARD_RETURN_URL', 'http://xxx.sanrixing', 'Y', 'admin', '2023-05-10 21:05:31', 'admin', NULL, '协议支付绑卡成功跳转地址');
INSERT INTO `bz_config` VALUES (136, '消费用信拒绝重复申请最大次数', 'CREDIT_BILL_REPEAT_MAX', '2', 'Y', 'SYSTEM', '2023-05-18 23:04:27', NULL, NULL, '超过该次数,用信拒绝申请');
INSERT INTO `bz_config` VALUES (137, '苹果APP版本', 'APP_VERSION_IOS', 'OFFICIAL', 'Y', 'admin', '2023-05-29 14:10:04', 'admin', NULL, 'OFFICIAL-正式版；VERIFY-审核版');
INSERT INTO `bz_config` VALUES (138, '安卓APP版本', 'APP_VERSION_ANDROID', 'OFFICIAL', 'Y', 'admin', '2023-05-29 14:11:16', 'admin', NULL, 'OFFICIAL-正式版；VERIFY-审核版');

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
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bz_dict_data
-- ----------------------------
INSERT INTO `bz_dict_data` VALUES (1, 0, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '性别男');
INSERT INTO `bz_dict_data` VALUES (2, 1, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '性别女');
INSERT INTO `bz_dict_data` VALUES (3, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '显示菜单');
INSERT INTO `bz_dict_data` VALUES (4, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '隐藏菜单');
INSERT INTO `bz_dict_data` VALUES (5, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '正常状态');
INSERT INTO `bz_dict_data` VALUES (6, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '停用状态');
INSERT INTO `bz_dict_data` VALUES (7, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '正常状态');
INSERT INTO `bz_dict_data` VALUES (8, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '停用状态');
INSERT INTO `bz_dict_data` VALUES (9, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '默认分组');
INSERT INTO `bz_dict_data` VALUES (10, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '系统分组');
INSERT INTO `bz_dict_data` VALUES (11, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '系统默认是');
INSERT INTO `bz_dict_data` VALUES (12, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '系统默认否');
INSERT INTO `bz_dict_data` VALUES (13, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '通知');
INSERT INTO `bz_dict_data` VALUES (14, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '公告');
INSERT INTO `bz_dict_data` VALUES (15, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '正常状态');
INSERT INTO `bz_dict_data` VALUES (16, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '关闭状态');
INSERT INTO `bz_dict_data` VALUES (17, 10, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '新增操作');
INSERT INTO `bz_dict_data` VALUES (18, 20, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '修改操作');
INSERT INTO `bz_dict_data` VALUES (19, 30, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '删除操作');
INSERT INTO `bz_dict_data` VALUES (20, 40, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '授权操作');
INSERT INTO `bz_dict_data` VALUES (21, 50, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '导出操作');
INSERT INTO `bz_dict_data` VALUES (22, 60, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '导入操作');
INSERT INTO `bz_dict_data` VALUES (23, 70, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '强退操作');
INSERT INTO `bz_dict_data` VALUES (24, 80, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '生成操作');
INSERT INTO `bz_dict_data` VALUES (25, 90, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '清空操作');
INSERT INTO `bz_dict_data` VALUES (26, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '正常状态');
INSERT INTO `bz_dict_data` VALUES (27, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-08-03 15:10:44', NULL, NULL, '停用状态');
INSERT INTO `bz_dict_data` VALUES (28, 0, '正常', 'VALID', 'business_status', NULL, NULL, NULL, '0', 'admin', '2021-08-03 15:23:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (29, 10, '冻结', 'FREEZE', 'business_status', NULL, NULL, NULL, '0', 'admin', '2021-08-03 15:23:22', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (30, 0, '运营', '00', 'account_type', NULL, NULL, NULL, '0', 'admin', '2021-08-03 16:07:53', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (59, 20, '授信专区', 'REGISTER', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-06-17 22:33:19', 'admin', '2022-06-17 22:35:59', NULL);
INSERT INTO `bz_dict_data` VALUES (60, 10, '首页专区', 'HOME', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-06-17 22:35:54', 'admin', '2022-09-22 10:44:53', NULL);
INSERT INTO `bz_dict_data` VALUES (64, 10, 'H5方式', 'H5', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-06-17 23:07:01', 'admin', '2022-06-17 23:09:09', NULL);
INSERT INTO `bz_dict_data` VALUES (65, 30, '表单方式', 'FORM', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-06-17 23:08:20', 'admin', '2022-06-17 23:09:27', NULL);
INSERT INTO `bz_dict_data` VALUES (66, 20, '联登方式', 'JOIN', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-06-17 23:08:54', 'admin', '2022-06-17 23:09:20', NULL);
INSERT INTO `bz_dict_data` VALUES (67, 0, '待实名', 'IDCARD', 'credit_status', NULL, NULL, NULL, '0', 'admin', '2022-06-18 21:43:00', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (68, 10, '待补充基础信息', 'INFO', 'credit_status', NULL, NULL, NULL, '0', 'admin', '2022-06-18 21:43:28', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (69, 20, '已授信', 'FINISH', 'credit_status', NULL, NULL, NULL, '0', 'admin', '2022-06-18 21:43:42', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (70, 0, '待处理', 'WAIT', 'order_product_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:22:42', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (71, 10, '申请中', 'APPLY', 'order_product_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:22:56', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (72, 20, '申请成功', 'SUCC', 'order_product_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:23:36', 'admin', '2022-06-19 11:23:59', NULL);
INSERT INTO `bz_dict_data` VALUES (73, 40, '申请失败', 'FAIL', 'order_product_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:23:54', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (74, 0, '预创单', 'PRE', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:29:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (75, 10, '资料采集', 'INFO', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:29:25', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (76, 20, '待签约', 'SIGN', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:29:40', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (77, 30, '申请', 'APPLY', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:29:55', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (78, 40, '部分完成', 'PART', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:30:07', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (79, 50, '完成', 'FINISH', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:30:20', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (80, 60, '作废', 'ABANDON', 'order_status', NULL, NULL, NULL, '0', 'admin', '2022-06-19 11:30:34', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (82, 10, '待审核', 'WAIT', 'review_status', NULL, NULL, NULL, '0', 'admin', '2022-07-06 21:37:51', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (83, 20, '审核通过', 'PASS', 'review_status', NULL, NULL, NULL, '0', 'admin', '2022-07-06 21:38:03', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (84, 30, '审核不通过', 'NOPASS', 'review_status', NULL, NULL, NULL, '0', 'admin', '2022-07-06 21:38:15', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (85, 40, '锁单中', 'LOCK', 'review_status', NULL, NULL, NULL, '0', 'admin', '2022-07-06 21:39:18', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (86, 0, '无人接听', 'noAnswer', 'telephone_verify', NULL, NULL, NULL, '0', 'admin', '2022-07-10 18:30:24', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (87, 10, '本人接听', 'iAnswer', 'telephone_verify', NULL, NULL, NULL, '0', 'admin', '2022-07-10 18:31:11', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (88, 20, '空号/停机', 'blankNumber', 'telephone_verify', NULL, NULL, NULL, '0', 'admin', '2022-07-10 18:31:40', 'admin', '2022-07-10 18:31:47', NULL);
INSERT INTO `bz_dict_data` VALUES (89, 10, '本次限购', 'THIS_TIME', 'pur_limit_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:49:48', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (90, 20, '当日限购', 'THAT_DAY', 'pur_limit_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:50:18', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (91, 30, '本月限购', 'THIS_MONTH', 'pur_limit_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:50:26', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (92, 40, '终身限购', 'LIFELONG', 'pur_limit_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:50:35', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (94, 0, '不限购', 'NOT', 'pur_limit_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:54:02', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (95, 0, '默认', 'DEFAULT', 'pur_qty_ops_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:55:15', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (96, 10, '递增/减', 'INCREMRNT', 'pur_qty_ops_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:55:24', 'admin', '2022-08-05 18:56:57', NULL);
INSERT INTO `bz_dict_data` VALUES (97, 30, '倍增/减', 'MULTIPLE', 'pur_qty_ops_type', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:55:53', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (98, 0, '立刻上架', 'IMMEDIATELY', 'saleable_patterns', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:57:57', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (99, 10, '每天定时上下架（小时）', 'TIMING', 'saleable_patterns', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:58:07', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (100, 0, '上架', 'Y', 'shelf_status', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:59:47', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (101, 10, '下架', 'N', 'shelf_status', NULL, NULL, NULL, '0', 'admin', '2022-08-05 18:59:52', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (102, 10, '热门推荐', 'RECOMMEND', 'goods-area', NULL, NULL, NULL, '0', 'admin', '2022-08-08 12:06:47', 'admin', '2022-08-08 12:07:26', NULL);
INSERT INTO `bz_dict_data` VALUES (103, 0, '猜你喜欢', 'FOLLOW', 'goods-area', NULL, NULL, NULL, '0', 'admin', '2022-08-08 12:07:15', 'admin', '2022-08-08 12:07:30', NULL);
INSERT INTO `bz_dict_data` VALUES (104, 20, '新品推荐', 'NEW', 'goods-area', NULL, NULL, NULL, '0', 'admin', '2022-08-08 12:07:48', 'admin', '2022-08-08 12:08:02', NULL);
INSERT INTO `bz_dict_data` VALUES (105, 30, '首页-中间', 'HOME_MIDDLE', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-08-08 17:07:19', 'admin', '2022-11-29 22:09:51', NULL);
INSERT INTO `bz_dict_data` VALUES (108, 40, '首页-弹框', 'HOME_POPUP', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-08-08 17:49:27', 'admin', '2022-11-29 22:10:05', NULL);
INSERT INTO `bz_dict_data` VALUES (109, 0, '乐享信用', 'C008', 'channel', NULL, NULL, NULL, '0', 'admin', '2022-08-10 11:50:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (110, 70, '我的-广告位', 'MY', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-08-13 20:48:36', 'admin', '2022-11-29 22:16:12', NULL);
INSERT INTO `bz_dict_data` VALUES (111, 90, '额度页中部-广告位', 'MY_QUOTA', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-08-15 21:21:34', 'admin', '2022-11-29 22:21:59', NULL);
INSERT INTO `bz_dict_data` VALUES (112, 10, '分期支付', 'BILLPAY', 'pay_product_type', NULL, NULL, NULL, '0', 'admin', '2022-08-21 21:50:55', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (113, 20, '支付宝支付', 'ALIPAY', 'pay_product_type', NULL, NULL, NULL, '0', 'admin', '2022-08-21 21:51:09', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (114, 30, '微信支付', 'WECHATPAY', 'pay_product_type', NULL, NULL, NULL, '0', 'admin', '2022-08-21 21:51:21', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (115, 40, '快捷支付', 'QUICKPAY', 'pay_product_type', NULL, NULL, NULL, '0', 'admin', '2022-08-21 21:51:34', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (116, 10, '待审核', 'WAIT', 'verify_status', NULL, NULL, NULL, '0', 'admin', '2022-08-26 11:25:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (117, 20, '审核通过', 'PASS', 'verify_status', NULL, NULL, NULL, '0', 'admin', '2022-08-26 11:31:11', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (118, 30, '审核不通过', 'NOPASS', 'verify_status', NULL, NULL, NULL, '0', 'admin', '2022-08-26 11:31:24', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (120, 50, '购物页-顶部', 'INSTALLMENT_PRODUCT', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-09-22 10:48:41', 'admin', '2022-11-29 22:14:25', NULL);
INSERT INTO `bz_dict_data` VALUES (121, 60, '购物页-中部', 'INSTALLMENT_WELFARE', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-09-22 10:49:12', 'admin', '2022-11-29 22:14:53', NULL);
INSERT INTO `bz_dict_data` VALUES (122, 10, '加收百分之5', 'RATE_FIVE', 'SALE_CALC', NULL, NULL, NULL, '0', 'admin', '2022-09-23 19:39:08', 'admin', '2022-09-23 19:39:08', NULL);
INSERT INTO `bz_dict_data` VALUES (123, 10, '洽客', 'C004', 'channel', NULL, NULL, NULL, '0', 'admin', '2022-08-10 11:50:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (124, 20, '中闽', 'C006', 'channel', NULL, NULL, NULL, '0', 'admin', '2022-08-10 11:50:10', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (125, 10, '首页-顶部', 'HOME_TOP', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-10-14 17:45:46', 'admin', '2022-11-29 22:10:20', NULL);
INSERT INTO `bz_dict_data` VALUES (126, 100, '现金借钱页-广告位', 'BORROW', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-10-16 20:05:24', 'admin', '2022-11-29 22:22:12', NULL);
INSERT INTO `bz_dict_data` VALUES (127, 70, '现金借款引导专区', 'GUIDE_LOAN_PRODUCT', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-10-18 10:44:08', 'admin', '2022-10-18 10:50:00', NULL);
INSERT INTO `bz_dict_data` VALUES (128, 110, '会员页-广告位', 'MEMBER', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-10-29 17:35:25', 'admin', '2022-11-29 22:22:27', NULL);
INSERT INTO `bz_dict_data` VALUES (129, 10, '会员信息', 'VIP', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-11-13 00:23:47', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (130, 20, '会员权益', 'RIGHT', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-11-13 00:24:01', 'admin', '2022-11-13 00:24:06', NULL);
INSERT INTO `bz_dict_data` VALUES (131, 30, '优惠券', 'COUPON', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-11-13 00:24:23', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (132, 40, '吃喝玩乐', 'FUN', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-11-13 00:24:41', 'admin', '2022-11-13 00:26:05', NULL);
INSERT INTO `bz_dict_data` VALUES (133, 50, '省钱弹框', 'WINDOWS', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-11-13 00:25:54', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (134, 10, 'APP首页', 'APP_HOME', 'icon_position', NULL, NULL, NULL, '0', 'admin', '2022-11-22 16:47:25', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (135, 20, '商城首页', 'SHOP_HOME', 'icon_position', NULL, NULL, NULL, '0', 'admin', '2022-11-22 16:47:42', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (136, 20, '首页-bannar', 'HOME_BANNAR', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-11-24 21:37:28', 'admin', '2022-11-29 22:09:41', NULL);
INSERT INTO `bz_dict_data` VALUES (137, 15, '首页-主产品-专区', 'HOME_MAIN_PRODUCT', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-11-29 11:30:43', 'admin', '2022-11-29 11:59:17', NULL);
INSERT INTO `bz_dict_data` VALUES (138, 90, '联登引导产品', 'GUIDE_JOIN_PRODUCT', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-11-29 11:31:05', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (139, 100, '全流程引导产品', 'GUIDE_WHOLE_PRODUCT', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-11-29 11:31:44', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (140, 30, '推荐专区', 'HOT', 'special-area', NULL, NULL, NULL, '0', 'admin', '2022-11-29 11:50:03', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (141, 80, '礼包页-中部', 'GIFTBAG', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2022-11-29 22:21:10', 'admin', '2022-11-29 22:33:04', NULL);
INSERT INTO `bz_dict_data` VALUES (142, 30, '我的页面', 'MY', 'icon_position', NULL, NULL, NULL, '0', 'admin', '2022-11-29 22:24:58', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (143, 40, '礼包分期页面', 'GIFTBAG', 'icon_position', NULL, NULL, NULL, '0', 'admin', '2022-11-29 22:25:24', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (144, 20, '列表/内容', 'LIST_CONTENT', 'special_page_group', NULL, NULL, NULL, '0', 'admin', '2022-12-14 16:33:28', 'admin', '2022-12-14 16:33:50', NULL);
INSERT INTO `bz_dict_data` VALUES (145, 10, '菜单', 'MENU', 'special_page_group', NULL, NULL, NULL, '0', 'admin', '2022-12-14 16:33:41', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (146, 40, '联登全流程', 'JOIN_WHOLE', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-12-28 16:38:58', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (147, 50, '洽客现金分期', 'CASH_LOAN', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-12-28 16:40:53', 'admin', '2023-02-27 10:05:34', NULL);
INSERT INTO `bz_dict_data` VALUES (148, 60, '随心购备用金', 'CASH_LOAN_SXG', 'product_type', NULL, NULL, NULL, '0', 'admin', '2022-12-28 16:41:08', 'admin', '2023-02-21 20:19:12', NULL);
INSERT INTO `bz_dict_data` VALUES (149, 25, '话费充值', 'RECHARGE', 'member_district', NULL, NULL, NULL, '0', 'admin', '2022-12-28 21:43:58', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (150, 10, '普通商品', 'GENERAL', 'category_group', NULL, NULL, NULL, '0', 'admin', '2023-02-07 21:07:51', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (151, 20, '虚拟商品', 'VIRTUAL', 'category_group', NULL, NULL, NULL, '0', 'admin', '2023-02-07 21:08:14', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (152, 30, '卡券', 'ECARD', 'category_group', NULL, NULL, NULL, '0', 'admin', '2023-02-07 21:08:32', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (153, 10, '未核销', 'NON', 'writeoff_type', NULL, NULL, NULL, '0', 'admin', '2023-02-15 21:18:57', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (154, 20, '线下发货', 'OFFLINE', 'writeoff_type', NULL, NULL, NULL, '0', 'admin', '2023-02-15 21:19:13', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (155, 30, '线上回收', 'ONLINE', 'writeoff_type', NULL, NULL, NULL, '0', 'admin', '2023-02-15 21:19:26', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (158, 10, '申请中', 'APPLY', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:57:22', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (159, 20, '申请补件', 'APPLY_SUPPLEMENT', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:57:36', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (160, 30, '申请待审', 'APPLY_VERIFY', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:57:47', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (161, 40, '申请不通过', 'APPLY_FAIL', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:58:05', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (162, 50, '放款申请', 'CASH_APPLY', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:58:19', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (163, 60, '放款待审', 'CASH_VERIFY', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:58:32', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (164, 70, '放款成功', 'CASH_SUCC', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:58:46', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (165, 80, '放款失败', 'CASH_FAIL', 'cash_loan_status', NULL, NULL, NULL, '0', 'admin', '2023-02-25 19:59:03', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (166, 0, '易宝支付', 'C103', 'bank_card_channel', NULL, NULL, NULL, '0', 'admin', '2023-02-27 09:58:44', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (167, 70, '随心购钱包分期(通融)', 'CASH_LOAN_SELF', 'product_type', NULL, NULL, NULL, '0', 'admin', '2023-02-27 10:03:25', 'admin', '2023-02-27 10:03:34', NULL);
INSERT INTO `bz_dict_data` VALUES (168, 0, '通融小额贷', 'C011', 'capital_channel', NULL, NULL, NULL, '0', 'admin', '2023-02-27 10:04:59', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (169, 50, '我的额度', 'MY_QUOTA', 'icon_position', NULL, NULL, NULL, '0', 'admin', '2023-03-11 14:47:31', 'admin', '2023-03-11 14:47:46', NULL);
INSERT INTO `bz_dict_data` VALUES (170, 10, '现金分期(洽客直联)', 'CASH_LOAN', 'cash_loan_type', NULL, NULL, NULL, '0', 'admin', '2023-03-13 20:09:39', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (171, 5, '现金分期(随心购备用金2)', 'CASH_LOAN_SXG', 'cash_loan_type', NULL, NULL, NULL, '0', 'admin', '2023-03-13 20:10:00', 'admin', '2023-03-13 20:10:27', NULL);
INSERT INTO `bz_dict_data` VALUES (172, 0, '现金分期(随心购备用金3)', 'CASH_LOAN_SELF', 'cash_loan_type', NULL, NULL, NULL, '0', 'admin', '2023-03-13 20:10:18', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (173, 1, '新颜', 'C012', 'CREDIT_SCORE_RULE', NULL, NULL, NULL, '0', 'admin', '2023-03-24 19:35:56', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (174, 0, 'hetu.company', 'Y', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:04:32', 'admin', '2023-05-05 18:06:29', '是否开通对公业务Y-开通 N-关闭');
INSERT INTO `bz_dict_data` VALUES (175, 1, 'hetu.productId.company', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:06:17', NULL, NULL, '受托对公产品ID');
INSERT INTO `bz_dict_data` VALUES (176, 2, 'hetu.cnapsCode', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:07:02', 'admin', '2023-05-05 18:07:17', '大行行号');
INSERT INTO `bz_dict_data` VALUES (177, 3, 'hetu.bankNo', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:07:59', NULL, NULL, '开户行号');
INSERT INTO `bz_dict_data` VALUES (178, 4, 'hetu.bankName', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:08:18', NULL, NULL, '开户行名');
INSERT INTO `bz_dict_data` VALUES (179, 5, 'hetu.accountName', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:08:41', NULL, NULL, '账户名');
INSERT INTO `bz_dict_data` VALUES (180, 6, 'hetu.bankCardNo', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:09:08', NULL, NULL, '账号');
INSERT INTO `bz_dict_data` VALUES (181, 7, 'hetu.identificationNum', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:09:39', NULL, NULL, '证件号:营业执照');
INSERT INTO `bz_dict_data` VALUES (182, 8, 'hetu.mobile', '', 'HETU_PARAM', NULL, NULL, NULL, '0', 'admin', '2023-05-05 18:09:39', NULL, NULL, '开户预留手机号码');
INSERT INTO `bz_dict_data` VALUES (183, 20, '平台会员', '1', 'vip_partner', NULL, NULL, NULL, '0', 'admin', '2023-05-17 22:11:22', 'admin', '2023-05-17 22:13:38', NULL);
INSERT INTO `bz_dict_data` VALUES (184, 10, '万恒会员', '2', 'vip_partner', NULL, NULL, NULL, '0', 'admin', '2023-05-17 22:11:36', NULL, NULL, NULL);
INSERT INTO `bz_dict_data` VALUES (185, 0, '及未券包', '9', 'vip_partner', NULL, NULL, NULL, '0', 'admin', '2023-05-17 22:12:39', 'admin', '2023-05-17 22:13:31', NULL);
INSERT INTO `bz_dict_data` VALUES (186, 0, 'batch_pay_time', '8,14,21', 'bill_repay_not_request', NULL, NULL, NULL, '0', 'admin', '2023-05-29 15:11:22', 'admin', '2023-05-29 15:12:58', '批扣时间段');
INSERT INTO `bz_dict_data` VALUES (187, 0, 'not_before_time', '5', 'bill_repay_not_request', NULL, NULL, NULL, '0', 'admin', '2023-05-29 15:11:54', 'admin', '2023-05-29 15:13:30', '禁止发起前时间');
INSERT INTO `bz_dict_data` VALUES (188, 0, 'not_after_time', '30', 'bill_repay_not_request', NULL, NULL, NULL, '0', 'admin', '2023-05-29 15:12:06', 'admin', '2023-05-29 15:13:45', '禁止发起后时间');
INSERT INTO `bz_dict_data` VALUES (189, 0, 'SINGLE', '1', 'API_BILL_MERCHANT', NULL, NULL, NULL, '0', 'admin', '2023-06-16 17:31:41', 'admin', '2023-06-16 18:51:31', '单笔最大金额');
INSERT INTO `bz_dict_data` VALUES (190, 0, 'DAY_LIMIT', '0', 'API_BILL_MERCHANT', NULL, NULL, NULL, '0', 'admin', '2023-06-16 17:32:24', 'admin', '2023-06-16 18:52:09', '单日限额');
INSERT INTO `bz_dict_data` VALUES (191, 35, '首页专享福利', 'HOME_WELFARE', 'advert_position', NULL, NULL, NULL, '0', 'admin', '2023-06-18 10:52:22', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bz_dict_type
-- ----------------------------
INSERT INTO `bz_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '用户性别列表');
INSERT INTO `bz_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '菜单状态列表');
INSERT INTO `bz_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '系统开关列表');
INSERT INTO `bz_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '任务状态列表');
INSERT INTO `bz_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '任务分组列表');
INSERT INTO `bz_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '系统是否列表');
INSERT INTO `bz_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '通知类型列表');
INSERT INTO `bz_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '通知状态列表');
INSERT INTO `bz_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '操作类型列表');
INSERT INTO `bz_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-08-03 15:07:37', NULL, NULL, '登录状态列表');
INSERT INTO `bz_dict_type` VALUES (11, '业务状态', 'business_status', '0', 'admin', '2021-08-03 15:22:40', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (12, '账户类型', 'account_type', '0', 'admin', '2021-08-03 16:07:18', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (20, '产品专区', 'special-area', '0', 'admin', '2022-06-17 22:32:49', 'admin', '2022-11-29 11:30:08', 'h5专区模块');
INSERT INTO `bz_dict_type` VALUES (21, '产品类型', 'product_type', '0', 'admin', '2022-06-17 23:06:43', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (22, '授信状态', 'credit_status', '0', 'admin', '2022-06-18 21:42:40', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (23, '订单状态', 'order_product_status', '0', 'admin', '2022-06-19 11:20:35', 'admin', '2022-06-19 11:27:26', NULL);
INSERT INTO `bz_dict_type` VALUES (24, '订单状态', 'order_status', '0', 'admin', '2022-06-19 11:28:46', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (25, '审单状态', 'review_status', '0', 'admin', '2022-07-06 21:37:34', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (26, '审核电核', 'telephone_verify', '0', 'admin', '2022-07-10 18:29:16', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (27, '购买数量操作类型', 'pur_limit_type', '0', 'admin', '2022-08-05 18:48:46', 'admin', '2022-08-05 18:54:44', NULL);
INSERT INTO `bz_dict_type` VALUES (28, '限购类型', 'pur_qty_ops_type', '0', 'admin', '2022-08-05 18:51:53', 'admin', '2022-08-05 18:54:54', NULL);
INSERT INTO `bz_dict_type` VALUES (29, '上下架方式', 'saleable_patterns', '0', 'admin', '2022-08-05 18:57:38', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (30, '上下架', 'shelf_status', '0', 'admin', '2022-08-05 18:59:16', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (31, '商品专区', 'goods-area', '0', 'admin', '2022-08-08 12:06:22', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (32, '广告位', 'advert_position', '0', 'admin', '2022-08-08 17:06:43', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (33, '产品渠道', 'channel', '0', 'admin', '2022-08-10 11:49:57', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (34, '支付产品类型', 'pay_product_type', '0', 'admin', '2022-08-21 21:50:32', 'admin', '2022-08-22 00:42:55', NULL);
INSERT INTO `bz_dict_type` VALUES (35, '审核状态', 'verify_status', '0', 'admin', '2022-08-26 11:24:48', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (36, '售价算法', 'SALE_CALC', '0', 'admin', '2022-09-23 19:38:06', 'admin', '2022-09-23 19:38:06', NULL);
INSERT INTO `bz_dict_type` VALUES (37, '会员专区', 'member_district', '0', 'admin', '2022-11-13 00:23:28', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (38, 'icon展示位', 'icon_position', '0', 'admin', '2022-11-22 16:45:35', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (39, '特殊页面分组', 'special_page_group', '0', 'system', '2022-12-13 15:38:28', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (40, '分类组', 'category_group', '0', 'admin', '2023-02-07 21:06:23', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (41, '核销方式', 'writeoff_type', '0', 'admin', '2023-02-15 21:18:40', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (42, '备用金订单状态', 'cash_loan_status', '0', 'admin', '2023-02-25 19:57:05', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (43, '银行卡通道', 'bank_card_channel', '0', 'admin', '2023-02-27 09:58:15', NULL, NULL, '');
INSERT INTO `bz_dict_type` VALUES (44, '资方渠道', 'capital_channel', '0', 'admin', '2023-02-27 10:04:27', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (45, '现金分期', 'cash_loan_type', '0', 'admin', '2023-03-13 20:08:14', 'admin', '2023-03-13 20:08:41', NULL);
INSERT INTO `bz_dict_type` VALUES (46, '授信计分规则', 'CREDIT_SCORE_RULE', '0', 'admin', '2023-03-24 19:35:12', NULL, NULL, '用于授信计分');
INSERT INTO `bz_dict_type` VALUES (47, '合图对公业务', 'HETU_PARAM', '0', 'admin', '2023-05-05 18:02:31', NULL, NULL, '合图对公业务参数');
INSERT INTO `bz_dict_type` VALUES (48, '会员合作方', 'vip_partner', '0', 'admin', '2023-05-17 22:10:49', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (49, '手工扣款禁止发起时间', 'bill_repay_not_request', '0', 'admin', '2023-05-29 15:10:55', NULL, NULL, NULL);
INSERT INTO `bz_dict_type` VALUES (50, '分期输出测试商户管控', 'API_BILL_MERCHANT', '0', 'admin', '2023-06-16 17:31:15', NULL, NULL, NULL);

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
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '总部', 0, NULL, NULL, NULL, '0', NULL, '0', 'system', '2022-06-10 11:00:31', 'system', '2022-06-10 11:00:31', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '运营部', 0, NULL, NULL, NULL, '0', NULL, '0', 'system', '2022-06-10 11:00:31', 'system', '2022-06-10 11:00:31', NULL);
INSERT INTO `sys_dept` VALUES (3, 2, '0,1', '合作方', 0, NULL, NULL, NULL, '0', NULL, '0', 'system', '2022-06-10 11:00:31', 'system', '2022-06-10 11:00:31', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1386 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', 'system', NULL, '1', 'M', '0', '0', '#', 'system', 'admin', '2021-12-24 18:06:50', 'admin', '2021-12-24 18:06:50', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 10, 'user', 'user', 'system/user/index', '1', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-12-24 18:12:42', 'admin', '2021-12-24 18:12:42', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 20, 'role', 'role', 'system/role/index', '1', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-12-24 18:12:42', 'admin', '2021-12-24 18:12:42', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 30, 'menu', 'menu', 'system/menu/index', '1', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-12-24 18:12:42', 'admin', '2021-12-24 18:12:42', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 40, 'dept', 'dept', 'system/dept/index', '1', 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2021-12-24 18:12:42', 'admin', '2022-05-24 16:31:40', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '字典管理', 1, 60, 'dict', 'dict', 'system/dict/index', '1', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-12-24 18:12:42', 'admin', '2021-12-24 18:12:42', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (105, '参数设置', 1, 70, 'config', 'config', 'system/config/index', '1', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-12-24 18:12:42', 'admin', '2021-12-24 18:12:42', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (106, '日志管理', 1, 90, 'log', 'log', 'system/log/index', '1', 'M', '0', '0', '#', 'log', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (200, '操作日志', 106, 1, 'operlog', 'operlog', 'monitor/operlog/index', '1', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (201, '登录日志', 106, 2, 'logininfor', 'logininfor', 'monitor/logininfor/index', '1', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', '1', 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', '1', 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', '1', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', '1', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', '1', 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', '1', 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', '1', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', '1', 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', '1', 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', '1', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', '1', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', '1', 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', '1', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', '1', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', '1', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', '1', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', '1', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', '1', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', '1', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', '1', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1021, '字典查询', 104, 1, '#', '#', '', '1', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1022, '字典新增', 104, 2, '#', '#', '', '1', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1023, '字典修改', 104, 3, '#', '#', '', '1', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1024, '字典删除', 104, 4, '#', '#', '', '1', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1025, '字典导出', 104, 5, '#', '#', '', '1', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1026, '参数查询', 105, 1, '#', '#', '', '1', 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1027, '参数新增', 105, 2, '#', '#', '', '1', 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1028, '参数修改', 105, 3, '#', '#', '', '1', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1029, '参数删除', 105, 4, '#', '#', '', '1', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1030, '参数导出', 105, 5, '#', '#', '', '1', 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-12-24 18:23:35', 'admin', '2021-12-24 18:23:35', '');
INSERT INTO `sys_menu` VALUES (1031, '操作查询', 200, 1, '#', '#', '', '1', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1032, '操作删除', 200, 2, '#', '#', '', '1', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1033, '日志导出', 200, 3, '#', '#', '', '1', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1034, '登录查询', 201, 1, '#', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1035, '登录删除', 201, 2, '#', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1036, '日志导出', 201, 3, '#', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-01-24 11:46:21', 'admin', '2022-01-24 11:46:21', '');
INSERT INTO `sys_menu` VALUES (1102, '素材管理', 0, 30, 'material', 'material', NULL, '1', 'M', '0', '0', NULL, 'all', 'admin', '2022-05-24 16:37:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1103, '素材库', 1102, 10, 'library', 'materialLibrary', 'material/library/index', '1', 'C', '0', '0', NULL, 'color', 'admin', '2022-05-24 17:39:54', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1114, '产品管理', 0, 70, 'product', 'product', NULL, '1', 'M', '0', '0', '', 'product', 'admin', '2022-05-25 11:27:31', 'admin', '2023-02-28 15:06:16', NULL);
INSERT INTO `sys_menu` VALUES (1115, '导流产品列表', 1114, 20, 'list', 'productList', 'product/product/index', '1', 'C', '0', '0', 'business:product:list', 'categoryproducts', 'admin', '2022-05-25 11:28:36', 'admin', '2023-02-28 15:07:35', NULL);
INSERT INTO `sys_menu` VALUES (1118, '详情', 1115, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'product:product:query', NULL, 'admin', '2022-05-25 11:29:25', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1119, '导流产品新增', 1114, 21, 'add', 'productAdd', 'product/product/add', '1', 'C', '1', '0', 'product:product:add', NULL, 'admin', '2022-05-25 12:16:54', 'admin', '2023-02-28 15:08:22', NULL);
INSERT INTO `sys_menu` VALUES (1120, '导流产品编辑', 1114, 20, 'edit/:id', 'productEdit', 'product/product/edit', '1', 'C', '1', '0', 'product:product:edit', NULL, 'admin', '2022-05-25 12:17:49', 'admin', '2023-02-28 15:08:32', NULL);
INSERT INTO `sys_menu` VALUES (1122, '广告管理', 1261, 10, 'xad', 'advertiseList', 'material/advertise/index', '1', 'C', '0', '0', 'info:advertise:list', 'ad-list', 'admin', '2022-05-25 17:56:09', 'admin', '2023-03-06 18:30:44', NULL);
INSERT INTO `sys_menu` VALUES (1123, '新增', 1122, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'information:xadber:add', NULL, 'admin', '2022-05-25 18:00:23', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1124, '编辑', 1122, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'information:xadber:edit', NULL, 'admin', '2022-05-25 18:00:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1125, '删除', 1122, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'information:xadber:remove', NULL, 'admin', '2022-05-25 18:00:58', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1126, '详情', 1122, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'information:xadber:query', NULL, 'admin', '2022-05-25 18:01:19', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1135, '备用金用信管理', 0, 130, 'instalment/cash', 'instalment', NULL, '1', 'M', '0', '0', '', 'order-list', 'admin', '2022-05-25 20:22:13', 'admin', '2023-03-19 11:52:06', NULL);
INSERT INTO `sys_menu` VALUES (1141, '客户信息管理', 0, 140, 'customer', 'customer', NULL, '1', 'M', '0', '0', '', 'customer', 'admin', '2022-06-17 22:41:34', 'admin', '2022-11-22 15:54:03', NULL);
INSERT INTO `sys_menu` VALUES (1142, '客户列表', 1141, 10, 'list', 'customerList', 'customer/customer/index', '1', 'C', '0', '0', 'customer:customer:list', 'list', 'admin', '2022-06-17 22:53:34', 'admin', '2022-06-17 22:57:20', NULL);
INSERT INTO `sys_menu` VALUES (1143, '产品专区配置', 1114, 30, 'special', 'productSpecial', 'product/special/index', '1', 'C', '0', '0', 'business:specialregion:list', 'all', 'admin', '2022-06-18 15:02:34', 'admin', '2023-02-28 15:08:27', NULL);
INSERT INTO `sys_menu` VALUES (1144, '新增', 1143, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:specialregion:add', NULL, 'admin', '2022-06-18 15:03:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1145, '编辑', 1143, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:specialregion:edit', NULL, 'admin', '2022-06-18 15:04:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1146, '删除', 1143, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:specialregion:remove', NULL, 'admin', '2022-06-18 15:04:18', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1147, '详情', 1143, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:specialregion:query', NULL, 'admin', '2022-06-18 15:04:37', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1150, '报表管理', 0, 150, 'report', 'report', NULL, '1', 'M', '0', '0', '', 'excel', 'admin', '2022-06-19 20:21:03', 'admin', '2022-11-22 15:54:09', NULL);
INSERT INTO `sys_menu` VALUES (1151, '注册日报表', 1150, 10, 'day-register', 'dayRegiterReport', 'report/dayRegister', '1', 'C', '0', '0', 'report:dailySummary:list', 'list', 'admin', '2022-06-19 20:22:58', 'admin', '2022-06-19 22:22:40', NULL);
INSERT INTO `sys_menu` VALUES (1152, '合作方管理', 0, 20, 'partner', 'partner', NULL, '1', 'M', '0', '0', '', 'partner', 'admin', '2022-06-19 20:54:35', 'admin', '2022-11-21 22:39:26', NULL);
INSERT INTO `sys_menu` VALUES (1153, '合作方导流', 1152, 10, 'list', 'partnerList', 'partner/partner/index', '1', 'C', '0', '0', 'business:partner:list', 'list', 'admin', '2022-06-19 20:55:19', 'admin', '2023-03-02 19:50:07', NULL);
INSERT INTO `sys_menu` VALUES (1154, '新增', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:add', NULL, 'admin', '2022-06-19 20:55:37', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1155, '编辑', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:edit', NULL, 'admin', '2022-06-19 20:55:58', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1156, '详情', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:query', NULL, 'admin', '2022-06-19 20:56:13', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1157, '状态变更', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:change', NULL, 'admin', '2022-06-19 20:57:50', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1158, 'API开通/关闭', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:apiFlag', NULL, 'admin', '2022-06-19 20:58:24', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1159, 'api密钥查看', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:appsecret', NULL, 'admin', '2022-06-19 20:58:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1160, 'api密钥重置', 1153, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:appsecret', NULL, 'admin', '2022-06-19 20:59:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1161, '人脸识别日报表', 1150, 20, 'face-recognition', 'dayFaceRecognition', 'report/dayFaceRecognition', '1', 'C', '0', '0', 'report:dailySummary:list', 'customer', 'admin', '2022-07-06 18:03:49', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1162, '待审核列表', 1135, 20, 'manual-review', 'manualReviewList', 'order/instalment/reviewList', '1', 'C', '0', '0', 'finance:order:list', 'eye-open', 'admin', '2022-07-06 18:06:32', 'admin', '2022-07-06 21:58:57', NULL);
INSERT INTO `sys_menu` VALUES (1163, '详情', 1162, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:info', NULL, 'admin', '2022-07-06 18:06:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1164, '取单', 1162, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:lock', NULL, 'admin', '2022-07-06 18:07:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1165, '审核处理', 1135, 10, 'review-process', 'reviewProcess', 'order/instalment/reviewProcess', '1', 'C', '0', '0', 'finance:order:info', 'checkbox', 'admin', '2022-07-06 20:57:23', 'admin', '2022-07-07 21:51:33', NULL);
INSERT INTO `sys_menu` VALUES (1166, '审核', 1165, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:verify', NULL, 'admin', '2022-07-06 20:57:51', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1167, '已处理列表', 1135, 30, 'review-processed', 'processedList', 'order/instalment/reviewProcessed', '1', 'C', '0', '0', 'finance:order:list', 'sign', 'admin', '2022-07-06 21:10:11', 'admin', '2022-07-06 21:59:05', NULL);
INSERT INTO `sys_menu` VALUES (1168, '审核中列表', 1135, 40, 'in-review', 'inReview', 'order/instalment/inReview', '1', 'C', '0', '0', 'finance:order:list', 'lock', 'admin', '2022-07-06 21:12:07', 'admin', '2022-07-06 21:59:10', NULL);
INSERT INTO `sys_menu` VALUES (1169, '解单', 1168, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:unlock', NULL, 'admin', '2022-07-06 21:12:49', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1170, '手工补推送', 1167, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:verifypush', NULL, 'admin', '2022-07-06 21:15:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1174, '还款计划列表', 1135, 50, 'repayment', 'repaymentList', 'order/instalment/repayment', '1', 'C', '0', '0', 'finance:bill:list', 'withdrawal-order', 'admin', '2022-07-29 10:54:56', 'admin', '2023-03-21 20:22:41', NULL);
INSERT INTO `sys_menu` VALUES (1175, '详情', 1174, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:bill:info', NULL, 'admin', '2022-07-29 10:55:16', 'admin', '2023-03-21 20:22:55', NULL);
INSERT INTO `sys_menu` VALUES (1176, '商城商品管理', 0, 60, 'goods', 'goods', NULL, '1', 'M', '0', '0', '', 'goods', 'admin', '2022-08-03 11:19:02', 'admin', '2022-11-21 22:52:34', NULL);
INSERT INTO `sys_menu` VALUES (1177, '商品分类', 1176, 10, 'category', 'goodsCategory', 'goods/category/index', '1', 'C', '0', '0', 'mall:category:list', 'goods-category', 'admin', '2022-08-03 11:21:11', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1178, '新增', 1177, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:category:add', NULL, 'admin', '2022-08-03 11:21:28', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1179, '编辑', 1177, 20, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:category:edit', NULL, 'admin', '2022-08-03 11:21:44', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1180, '删除', 1177, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:brand:remove', NULL, 'admin', '2022-08-03 11:22:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1181, '详情', 1177, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:category:query', NULL, 'admin', '2022-08-03 11:22:15', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1182, '商品列表', 1176, 30, 'goods', 'goodsList', 'goods/goods/index', '1', 'C', '0', '0', 'mall:spu:list', 'list', 'admin', '2022-08-03 11:31:35', 'admin', '2022-08-03 11:34:18', NULL);
INSERT INTO `sys_menu` VALUES (1183, '商品规格', 1176, 20, 'spec', 'goodsSpec', 'goods/spec/index', '1', 'C', '0', '0', 'mall:spec:list', 'attribute-category', 'admin', '2022-08-03 11:36:02', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1184, '商品品牌', 1176, 5, 'brand', 'goodsBrand', 'goods/brand/index', '1', 'C', '0', '0', 'mall:brand:list', 'brand', 'admin', '2022-08-03 11:42:39', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1185, '新增', 1184, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:brand:add', NULL, 'admin', '2022-08-03 11:42:57', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1186, '编辑', 1184, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:brand:edit', NULL, 'admin', '2022-08-03 11:43:13', 'admin', '2022-08-03 11:43:37', NULL);
INSERT INTO `sys_menu` VALUES (1187, '删除', 1184, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:brand:remove', NULL, 'admin', '2022-08-03 11:43:29', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1188, '详情', 1184, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:brand:query', NULL, 'admin', '2022-08-03 11:43:53', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1189, '详情', 1183, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spec:query', NULL, 'admin', '2022-08-03 11:44:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1190, '新增', 1183, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spec:add', NULL, 'admin', '2022-08-03 11:44:58', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1191, '编辑', 1183, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spec:edit', NULL, 'admin', '2022-08-03 11:45:13', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1192, '删除', 1183, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spec:remove', NULL, 'admin', '2022-08-03 11:45:26', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1195, '删除', 1182, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spu:remove', NULL, 'admin', '2022-08-05 15:48:58', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1196, '上下架', 1182, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'ms:spu:edit', NULL, 'admin', '2022-08-05 15:49:23', 'admin', '2023-04-13 18:04:09', NULL);
INSERT INTO `sys_menu` VALUES (1197, '库存管理', 1182, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:spu:skuStock', NULL, 'admin', '2022-08-05 15:49:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1198, '新增商品', 1176, 100, 'goods-add', 'goodsAdd', 'goods/goods/add_edit', '1', 'C', '1', '0', 'mall:spu:add', NULL, 'admin', '2022-08-05 17:26:06', 'admin', '2022-08-05 17:28:05', NULL);
INSERT INTO `sys_menu` VALUES (1199, '编辑商品', 1176, 100, 'goods-edit/:goodsId', 'goodsEdit', 'goods/goods/add_edit', '1', 'C', '1', '0', 'mall:spu:edit', NULL, 'admin', '2022-08-05 17:28:00', 'admin', '2022-08-05 17:31:19', NULL);
INSERT INTO `sys_menu` VALUES (1200, '商城功能管理', 0, 50, 'shopping', 'shopping', NULL, '1', 'M', '0', '0', '', 'shopping', 'admin', '2022-08-08 11:29:28', 'admin', '2022-11-21 22:52:19', NULL);
INSERT INTO `sys_menu` VALUES (1201, 'icon类专区', 1261, 20, 'special', 'funcGroup', 'shopping/special/index', '1', 'C', '0', '0', 'mall:funcGroup:list', 'goods-category', 'admin', '2022-08-08 11:31:06', 'admin', '2023-03-06 20:13:59', NULL);
INSERT INTO `sys_menu` VALUES (1202, '新增', 1201, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:funcGroup:add', NULL, 'admin', '2022-08-08 11:31:21', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1203, '编辑', 1201, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:funcGroup:edit', NULL, 'admin', '2022-08-08 11:31:37', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1204, '删除', 1201, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:funcGroup:remove', NULL, 'admin', '2022-08-08 11:31:55', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1205, '详情', 1201, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:funcGroup:query', NULL, 'admin', '2022-08-08 11:32:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1206, '商品专区', 1200, 20, 'goods-area', 'goods-area', 'shopping/goodsArea/index', '1', 'C', '0', '0', 'mall:regionSpu:list', 'goods', 'admin', '2022-08-08 11:59:08', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1207, '新增', 1206, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:regionSpu:add', NULL, 'admin', '2022-08-08 11:59:27', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1208, '编辑', 1206, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:regionSpu:edit', NULL, 'admin', '2022-08-08 11:59:46', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1209, '删除', 1206, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:regionSpu:remove', NULL, 'admin', '2022-08-08 11:59:59', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1210, '详情', 1206, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:regionSpu:query', NULL, 'admin', '2022-08-08 12:00:21', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1211, '标签管理', 1200, 30, 'tag', 'shoppingTag', 'shopping/tag/index', '1', 'C', '0', '0', 'business:labelinfo:list', 'brand-recommend', 'admin', '2022-08-19 20:41:50', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1212, '消息中心', 1261, 40, 'notice', 'shoppingNotice', 'shopping/notice/index', '1', 'C', '0', '0', 'mall:message:list', 'notice', 'admin', '2022-08-19 20:43:33', 'admin', '2023-03-06 20:13:28', NULL);
INSERT INTO `sys_menu` VALUES (1213, '支付产品', 1200, 50, 'pay-product', 'payProduct', 'shopping/payProduct/index', '1', 'C', '0', '0', 'mall:cashier:list', 'product', 'admin', '2022-08-19 20:44:52', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1214, '新增', 1211, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:labelinfo:add', NULL, 'admin', '2022-08-19 20:46:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1215, '编辑', 1211, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:labelinfo:edit', NULL, 'admin', '2022-08-19 20:47:23', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1216, '删除', 1211, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:labelinfo:remove', NULL, 'admin', '2022-08-19 20:48:59', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1217, '新增', 1212, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:message:add', NULL, 'admin', '2022-08-19 20:50:14', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1218, '编辑', 1212, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:message:edit', NULL, 'admin', '2022-08-19 20:51:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1219, '删除', 1212, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'nall:message::remove', NULL, 'admin', '2022-08-19 20:52:10', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1220, '新增', 1213, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:cashier:add', NULL, 'admin', '2022-08-19 20:53:02', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1221, '编辑', 1213, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:cashier:edit', NULL, 'admin', '2022-08-19 20:53:22', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1222, '删除', 1213, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:cashier:remove', NULL, 'admin', '2022-08-19 20:53:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1223, '详情', 1212, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:message:query', NULL, 'admin', '2022-08-19 20:54:52', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1224, '商城订单管理', 0, 90, 'order', 'order', NULL, '1', 'M', '0', '0', '', 'order', 'admin', '2022-08-25 15:35:32', 'admin', '2022-11-21 22:53:33', NULL);
INSERT INTO `sys_menu` VALUES (1225, '订单列表', 1224, 10, 'order', 'orderList', 'order/order/index', '1', 'C', '0', '0', 'mall:order:list', 'order-list', 'admin', '2022-08-25 15:36:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1228, '订单详情', 1224, 20, 'order-detail/:orderId', 'goodsOrderDetail', 'order/order/detail', '1', 'C', '1', '0', 'mall:order:detail', 'account-detail', 'admin', '2022-08-25 21:17:20', 'admin', '2022-08-25 21:50:05', NULL);
INSERT INTO `sys_menu` VALUES (1229, '全额待推送', 1224, 30, 'full-amount-push', 'PushOrderList', 'order/order/pushList', '1', 'C', '0', '0', 'mall:order:list', 'skill', 'admin', '2022-08-26 10:33:37', 'admin', '2022-08-26 10:53:38', NULL);
INSERT INTO `sys_menu` VALUES (1230, '退款订单', 1224, 40, 'refund', 'RefundOrderList', 'order/refund/index', '1', 'C', '0', '0', 'mall:orderreturn:list', 'return-goods', 'admin', '2022-08-26 10:46:14', 'admin', '2022-08-26 10:54:29', NULL);
INSERT INTO `sys_menu` VALUES (1231, '审核', 1230, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:orderreturn:verify', NULL, 'admin', '2022-08-26 10:47:05', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1232, '底部菜单导航', 1261, 60, 'tabbar', 'shoppingTabbar', 'shopping/tabbar/index', '1', 'C', '0', '0', 'business:appmenu:list', 'goods-category', 'admin', '2022-08-26 17:28:25', 'admin', '2022-08-26 17:36:56', NULL);
INSERT INTO `sys_menu` VALUES (1233, '挂起', 1230, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:orderreturn:handup', NULL, 'admin', '2022-08-28 12:05:36', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1234, '模板信息设置', 1200, 45, 'template', 'shppingTemplate', 'shopping/template/index', '1', 'C', '0', '0', 'business:flowtemplate:list', 'code', 'admin', '2022-08-31 11:12:43', 'admin', '2022-08-31 11:20:56', NULL);
INSERT INTO `sys_menu` VALUES (1235, '新增', 1234, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:flowtemplate:add', NULL, 'admin', '2022-08-31 11:13:36', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1236, '编辑', 1234, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:flowtemplate:edit', NULL, 'admin', '2022-08-31 11:13:55', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1237, '删除', 1234, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:flowtemplate:remove', NULL, 'admin', '2022-08-31 11:14:18', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1238, '商家管理', 1176, 2, 'business', 'business', 'goods/business/index', '1', 'C', '0', '0', 'business:shop:list', 'store', 'admin', '2022-09-23 15:18:10', 'admin', '2022-09-23 15:18:23', NULL);
INSERT INTO `sys_menu` VALUES (1239, '新增', 1238, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:shop:add', NULL, 'admin', '2022-09-26 18:42:51', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1240, '编辑', 1238, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:shop:edit', NULL, 'admin', '2022-09-26 18:43:13', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1241, '删除', 1238, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:shop:remove', NULL, 'admin', '2022-09-26 18:43:24', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1242, '手工同步', 1238, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:shop:pull', NULL, 'admin', '2022-09-26 18:44:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1243, '会员业务管理', 0, 80, 'member', 'member', NULL, '1', 'M', '0', '0', '', 'partenr-level', 'admin', '2022-11-05 20:14:12', 'admin', '2022-11-21 22:53:16', NULL);
INSERT INTO `sys_menu` VALUES (1244, '会员定价配置', 1243, 10, 'sale-price', 'memberSalePrice', 'member/salePrice', '1', 'C', '0', '0', 'business:vipprice:list', 'withdrawal-order', 'admin', '2022-11-05 21:26:37', 'admin', '2022-11-21 23:47:30', NULL);
INSERT INTO `sys_menu` VALUES (1245, '配置（新增）', 1244, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:vipprice:add', NULL, 'admin', '2022-11-05 21:31:40', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1246, '配置（编辑）', 1244, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:vipprice:edit', NULL, 'admin', '2022-11-05 21:32:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1247, '删除', 1244, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:vipprice:remove', NULL, 'admin', '2022-11-05 21:32:19', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1248, '权益商品配置', 1243, 20, 'equity-goods', 'equityGoods', 'member/equityGoods', '1', 'C', '0', '0', 'virtual:goods:list', 'product', 'admin', '2022-11-06 16:47:42', 'admin', '2022-11-12 01:15:48', NULL);
INSERT INTO `sys_menu` VALUES (1249, '权益商品查询', 1243, 30, 'goods-list', 'equityGoodsList', 'member/equityGoodsList', '1', 'C', '0', '0', 'virtual:goods:list', 'list', 'admin', '2022-11-12 01:16:43', 'admin', '2022-11-12 01:22:58', NULL);
INSERT INTO `sys_menu` VALUES (1250, '会员专区配置', 1243, 40, 'district', 'memberDistrict', 'member/district', '1', 'C', '0', '0', 'virtual:vipview:list', 'all', 'admin', '2022-11-12 23:56:04', 'admin', '2022-11-21 23:47:43', NULL);
INSERT INTO `sys_menu` VALUES (1253, '会员名单列表', 1243, 5, 'list', 'memberList', 'member/list', '1', 'C', '0', '0', 'customer:vip:list', 'partner-list', 'admin', '2022-11-15 21:58:56', 'admin', '2022-11-21 23:47:15', NULL);
INSERT INTO `sys_menu` VALUES (1254, 'APP管理', 1, 80, 'softwareVersion', 'softwareVersionList', 'system/softwareVersion/index', '1', 'C', '0', '0', 'business:appstore:list', 'product', 'admin', '2022-11-18 19:30:11', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1255, '详情', 1254, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:appstore:info', NULL, 'admin', '2022-11-18 19:31:25', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1256, '新增', 1254, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:appstore:add', NULL, 'admin', '2022-11-18 19:31:48', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1257, '编辑', 1254, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:appstore:edit', NULL, 'admin', '2022-11-18 19:32:53', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1258, '删除', 1254, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:appstore:remove', NULL, 'admin', '2022-11-18 19:33:07', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1259, '上/下架', 1254, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:appstore:change', NULL, 'admin', '2022-11-18 19:33:07', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1260, '删除', 1115, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:product:remove', NULL, 'admin', '2022-11-21 20:45:32', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1261, 'APP页面管理', 0, 40, 'appView', 'appView', NULL, '1', 'M', '0', '0', '', 'material', 'admin', '2022-11-21 22:42:12', 'admin', '2022-11-21 22:52:09', NULL);
INSERT INTO `sys_menu` VALUES (1262, '导流订单管理', 0, 100, 'diversion-order', 'diversion-order', NULL, '1', 'M', '0', '0', '', 'Inventory-list', 'admin', '2022-11-21 23:00:20', 'admin', '2022-11-21 23:00:28', NULL);
INSERT INTO `sys_menu` VALUES (1263, '表单订单列表', 1262, 10, 'form', 'diversionFormOrderList', 'order/diversion/form', '1', 'C', '0', '0', 'order:info:list', 'list', 'admin', '2022-11-21 23:28:15', 'admin', '2022-11-21 23:28:50', NULL);
INSERT INTO `sys_menu` VALUES (1264, '联登订单列表', 1262, 20, 'join', 'diversionJoinOrderList', 'order/diversion/join', '1', 'C', '0', '0', 'order:info:list', 'list', 'admin', '2022-11-21 23:36:07', 'admin', '2022-11-21 23:38:30', NULL);
INSERT INTO `sys_menu` VALUES (1265, '全流程联登订单', 1262, 30, 'whole-join', 'diversionWholeJoinOrderList', 'order/diversion/wholeJoin', '1', 'C', '0', '0', 'order:info:list', 'list', 'admin', '2022-11-21 23:42:17', 'admin', '2022-11-21 23:44:19', NULL);
INSERT INTO `sys_menu` VALUES (1266, '详情', 1263, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'order:info:query', NULL, 'admin', '2022-11-21 23:44:42', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1267, '详情', 1264, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'order:info:query', NULL, 'admin', '2022-11-21 23:44:51', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1268, '详情', 1265, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'order:info:query', NULL, 'admin', '2022-11-21 23:45:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1269, '会员订单管理', 0, 110, 'member-order', 'memberOrder', NULL, '1', 'M', '0', '0', NULL, 'partner-list', 'admin', '2022-11-21 23:51:44', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1270, '会员支付订单', 1269, 10, 'buy-list', 'memberBuyList', 'order/member/buy', '1', 'C', '0', '0', 'virtual:apporder:list', 'list', 'admin', '2022-11-21 23:53:31', 'admin', '2023-02-27 16:12:46', NULL);
INSERT INTO `sys_menu` VALUES (1271, '权益订单列表', 1269, 20, 'quity-list', 'memberQuityList', 'order/member/quity', '1', 'C', '0', '0', 'virtual:apporder:list', 'list', 'admin', '2022-11-21 23:55:15', 'admin', '2023-02-27 16:13:32', NULL);
INSERT INTO `sys_menu` VALUES (1272, '退款订单', 1269, 30, 'return-list', 'memberReturnList', 'order/member/return', '1', 'C', '0', '0', 'virtual:apporder:list', 'list', 'admin', '2022-11-21 23:57:41', 'admin', '2023-02-27 16:13:53', NULL);
INSERT INTO `sys_menu` VALUES (1273, '审核', 1272, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'virtual:apporder:verify', NULL, 'admin', '2022-11-21 23:58:19', 'admin', '2022-11-21 23:58:35', NULL);
INSERT INTO `sys_menu` VALUES (1274, '金融订单管理', 0, 120, 'finance-order', 'financeOrder', NULL, '1', 'M', '0', '0', '', 'attribute-category', 'admin', '2022-11-22 15:11:18', 'admin', '2023-03-19 11:02:00', NULL);
INSERT INTO `sys_menu` VALUES (1275, '授信订单列表', 1274, 10, 'credit', 'financeCreditOrder', 'order/finance/credit', '1', 'C', '0', '0', 'customer:info:list', 'list', 'admin', '2022-11-22 15:14:22', 'admin', '2022-11-22 15:56:59', NULL);
INSERT INTO `sys_menu` VALUES (1276, '分期支付订单', 1274, 20, 'installment-pay', 'installmentPayOrder', 'order/finance/installmentPay', '1', 'C', '0', '0', 'finance:order:list', 'list', 'admin', '2022-11-22 15:46:46', 'admin', '2022-11-22 15:56:44', NULL);
INSERT INTO `sys_menu` VALUES (1277, '备用金订单', 1274, 30, 'cash-loan', 'cashLoanOrder', 'order/finance/cashloan', '1', 'C', '0', '0', 'finance:cashorder:list', 'list', 'admin', '2022-11-22 15:59:26', 'admin', '2023-03-20 10:11:05', NULL);
INSERT INTO `sys_menu` VALUES (1278, '日访问报表', 1150, 30, 'visit', 'dayVisitReport', 'report/dayVisit', '1', 'C', '0', '0', 'report:visitsum:list', 'eye-open', 'admin', '2022-11-26 23:33:45', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1279, '产品日报表', 1150, 40, 'day-product', 'DayProductReport', 'report/dayProduct', '1', 'C', '0', '0', 'report:orderSummary:list', 'categoryproducts', 'admin', '2022-11-26 23:34:22', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1280, '会员折扣配置', 1243, 15, 'discount', 'memberDiscount', 'member/discount', '1', 'C', '0', '0', 'business:category:vip:list', 'integral-log', 'admin', '2022-12-12 14:59:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1281, '新增', 1280, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:category:vip:add', NULL, 'admin', '2022-12-12 15:00:05', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1282, '编辑', 1280, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:category:vip:edit', NULL, 'admin', '2022-12-12 15:00:21', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1283, '删除', 1280, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:category:vip:remove', NULL, 'admin', '2022-12-12 15:00:38', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1284, 'APP页面列表', 1261, 50, 'list', 'AppViewList', 'shopping/appView/index', '1', 'C', '0', '0', 'info:specialPage:list', 'attribute-category', 'admin', '2022-12-14 16:00:55', 'admin', '2023-03-06 20:13:40', NULL);
INSERT INTO `sys_menu` VALUES (1285, '新增', 1284, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'info:specialpage:add', NULL, 'admin', '2022-12-14 16:18:33', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1286, '编辑', 1284, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'info:specialpage:edit', NULL, 'admin', '2022-12-14 16:18:50', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1287, '删除', 1284, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'info:specialpage:remove', NULL, 'admin', '2022-12-14 16:19:09', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1288, '会员弹框路由配置', 1243, 60, 'popup-rules', 'memberPopupRules', 'member/popupRules', '1', 'C', '0', '0', NULL, 'setting', 'admin', '2022-12-16 21:11:54', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1289, '被执行合作方', 1288, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:partner:change', NULL, 'admin', '2022-12-16 21:13:26', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1290, '平台授信列表', 1311, 60, 'credit', 'customerCreditConsume', 'customer/creditConsume/index', '1', 'C', '0', '0', 'customer:creditloan:list', 'eye-open', 'admin', '2022-12-26 15:27:56', 'admin', '2023-03-19 11:30:20', NULL);
INSERT INTO `sys_menu` VALUES (1291, '详情', 1290, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:detail', NULL, 'admin', '2022-12-26 15:28:19', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1292, '审核', 1290, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:verify', NULL, 'admin', '2022-12-26 15:28:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1293, '授信待审核列表', 1311, 40, 'reditReviewList', 'CreditReviewProcessConsume', 'customer/creditConsume/reviewList', '1', 'C', '0', '0', 'customer:creditloan:list', 'eye-open', 'admin', '2023-01-09 21:08:21', 'admin', '2023-03-30 13:06:19', NULL);
INSERT INTO `sys_menu` VALUES (1294, '授信审核处理', 1311, 30, 'credit-review-process', 'CreditReviewProcessConsume', 'customer/creditConsume/reviewProcess', '1', 'C', '0', '0', 'customer:creditloan:list', 'checkbox', 'admin', '2023-01-09 21:15:49', 'admin', '2023-03-19 11:29:57', NULL);
INSERT INTO `sys_menu` VALUES (1295, '取单', 1293, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:lock', NULL, 'admin', '2023-01-09 22:02:17', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1296, '授信审核中列表', 1311, 50, 'in-review', 'creditInReviewConsume', 'customer/creditConsume/inReview', '1', 'C', '0', '0', 'customer:creditloan:list', 'lock', 'admin', '2023-01-09 22:19:17', 'admin', '2023-03-19 11:30:12', NULL);
INSERT INTO `sys_menu` VALUES (1297, '解除锁单', 1296, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:unlock', NULL, 'admin', '2023-01-09 22:21:12', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1303, '回收订单管理', 0, 115, 'recovery', 'recovery', NULL, '1', 'M', '0', '0', NULL, 'trx-list', 'admin', '2023-02-15 19:35:16', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1304, '卡密订单', 1303, 10, 'cdkey', 'recoverycdkey', 'recovery/cdkey/index', '1', 'C', '0', '0', 'business:blordergoods:list', 'list', 'admin', '2023-02-15 19:36:45', 'admin', '2023-02-15 19:37:58', NULL);
INSERT INTO `sys_menu` VALUES (1305, '发货', 1304, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:blordergoods:deliver', NULL, 'admin', '2023-02-15 19:38:26', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1306, '重置', 1304, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:blordergoods:reset', NULL, 'admin', '2023-02-15 19:38:50', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1307, '放款申请', 1303, 20, 'loan-apply', 'recoveryLoanApply', 'recovery/loanApply/index', '1', 'C', '0', '0', 'business:blorderwithdraw:list', 'list', 'admin', '2023-02-16 17:12:42', 'admin', '2023-02-16 17:13:00', NULL);
INSERT INTO `sys_menu` VALUES (1308, '金融产品', 1114, 10, 'product-finance', 'financeProductList', 'product/finance/index', '1', 'C', '0', '0', 'business:product:list', 'product', 'admin', '2023-02-28 15:07:30', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1309, '金融产品新增', 1114, 10, 'finance/add', 'financeProductAdd', 'product/finance/add', '1', 'C', '1', '0', 'product:product:add', NULL, 'admin', '2023-02-28 15:08:07', 'admin', '2023-02-28 15:09:25', NULL);
INSERT INTO `sys_menu` VALUES (1310, '金融产品编辑', 1114, 10, 'finance/edit/:id', 'financeProductEdit', 'product/finance/edit', '1', 'C', '1', '0', 'product:product:edit', NULL, 'admin', '2023-02-28 15:09:15', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1311, '消费分期授信管理', 0, 145, 'credit-review/consume', 'CreditReviewConsume', NULL, '1', 'M', '0', '0', '', 'account-list', 'admin', '2023-02-28 15:35:35', 'admin', '2023-03-19 11:25:50', NULL);
INSERT INTO `sys_menu` VALUES (1312, '还款账单', 1274, 40, 'repayBill', 'repayBill', 'order/finance/repaybill', '1', 'C', '0', '0', 'finance:bill:list', 'account-detail', 'admin', '2023-02-28 15:38:13', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1313, '合作方商户', 1152, 20, 'merchant', 'partnerMerchant', 'partner/merchant/index', '1', 'C', '0', '0', 'partner:merchant:list', 'partner-list', 'admin', '2023-03-02 19:46:13', 'admin', '2023-03-02 19:50:17', NULL);
INSERT INTO `sys_menu` VALUES (1314, '新增', 1313, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'partner:merchant:add', NULL, 'admin', '2023-03-02 19:46:45', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1315, '编辑', 1313, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'partner:merchant:edit', NULL, 'admin', '2023-03-02 19:47:08', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1316, '状态变更', 1313, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'partner:merchant:edit', NULL, 'admin', '2023-03-02 19:47:27', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1317, 'api密钥', 1313, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'partner:merchant:appsecret', NULL, 'admin', '2023-03-02 19:47:45', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1318, '渠道授信记录', 1294, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:credit:list', NULL, 'admin', '2023-03-06 22:36:47', 'admin', '2023-03-06 22:50:04', NULL);
INSERT INTO `sys_menu` VALUES (1319, '授信信息详情', 1294, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:detail', NULL, 'admin', '2023-03-06 22:49:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1320, '通讯录', 1294, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:contacts:list', NULL, 'admin', '2023-03-06 22:50:53', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1321, '积分查询', 1294, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:integral:info', NULL, 'admin', '2023-03-06 22:52:32', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1322, '积分明细查询', 1294, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'integral:detail:list', NULL, 'admin', '2023-03-07 01:58:26', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1323, '消费分期订单', 1274, 35, 'installment-order', 'consume', 'order/finance/installmentOrder', '1', 'C', '0', '0', 'finance:cashorder:list', 'list', 'admin', '2023-03-19 10:34:19', 'admin', '2023-03-20 10:11:38', NULL);
INSERT INTO `sys_menu` VALUES (1324, '备用金授信管理', 0, 145, 'credit-review/cash', 'CreditReview', NULL, '1', 'M', '0', '0', '', 'account-list', 'admin', '2023-02-28 15:35:35', 'admin', '2023-03-19 11:03:38', NULL);
INSERT INTO `sys_menu` VALUES (1325, '授信审核处理', 1324, 30, 'credit-review-process', 'CreditReviewProcess', 'customer/credit/reviewProcess', '1', 'C', '0', '0', 'customer:creditloan:list', 'checkbox', 'admin', '2023-01-09 21:15:49', 'admin', '2023-03-06 22:49:00', NULL);
INSERT INTO `sys_menu` VALUES (1326, '授信待审核列表', 1324, 40, 'reditReviewList', 'CreditReviewProcess', 'customer/credit/reviewList', '1', 'C', '0', '0', 'customer:creditloan:list', 'eye-open', 'admin', '2023-01-09 21:08:21', 'admin', '2023-03-30 13:05:20', NULL);
INSERT INTO `sys_menu` VALUES (1327, '授信审核中列表', 1324, 50, 'in-review', 'creditInReview', 'customer/credit/inReview', '1', 'C', '0', '0', 'customer:creditloan:list', 'lock', 'admin', '2023-01-09 22:19:17', 'admin', '2023-01-10 10:43:18', NULL);
INSERT INTO `sys_menu` VALUES (1328, '备用金授信列表', 1324, 60, 'credit', 'customerCredit', 'customer/credit/index', '1', 'C', '0', '0', 'customer:creditloan:list', 'eye-open', 'admin', '2022-12-26 15:27:56', 'admin', '2023-03-19 23:51:42', NULL);
INSERT INTO `sys_menu` VALUES (1329, '详情', 1328, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:detail', NULL, 'admin', '2022-12-26 15:28:19', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1330, '审核', 1328, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:verify', NULL, 'admin', '2022-12-26 15:28:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1331, '渠道授信记录', 1325, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:credit:list', NULL, 'admin', '2023-03-06 22:36:47', 'admin', '2023-03-06 22:50:04', NULL);
INSERT INTO `sys_menu` VALUES (1332, '授信信息详情', 1325, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:detail', NULL, 'admin', '2023-03-06 22:49:34', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1333, '通讯录', 1325, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:contacts:list', NULL, 'admin', '2023-03-06 22:50:53', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1334, '积分查询', 1325, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:integral:info', NULL, 'admin', '2023-03-06 22:52:32', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1335, '积分明细查询', 1325, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'integral:detail:list', NULL, 'admin', '2023-03-07 01:58:26', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1336, '取单', 1326, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:lock', NULL, 'admin', '2023-01-09 22:02:17', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1337, '解除锁单', 1327, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:creditloan:unlock', NULL, 'admin', '2023-01-09 22:21:12', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1338, '消费分期用信管理', 0, 130, 'instalment/consume', 'instalmentConsume', NULL, '1', 'M', '0', '0', '', 'order-list', 'admin', '2022-05-25 20:22:13', 'admin', '2023-03-19 11:52:26', NULL);
INSERT INTO `sys_menu` VALUES (1339, '待终审列表', 1338, 20, 'manual-review', 'manualReviewListConsume', 'order/instalmentConsume/reviewList', '1', 'C', '0', '0', 'finance:order:list', 'eye-open', 'admin', '2022-07-06 18:06:32', 'admin', '2023-04-18 19:24:34', NULL);
INSERT INTO `sys_menu` VALUES (1340, '终审处理', 1338, 10, 'review-process', 'reviewProcessConsume', 'order/instalmentConsume/reviewProcess', '1', 'C', '0', '0', 'finance:order:info', 'checkbox', 'admin', '2022-07-06 20:57:23', 'admin', '2023-04-18 19:22:05', NULL);
INSERT INTO `sys_menu` VALUES (1341, '已处理列表', 1338, 40, 'review-processed', 'processedListConsume', 'order/instalmentConsume/reviewProcessed', '1', 'C', '0', '0', 'finance:order:list', 'sign', 'admin', '2022-07-06 21:10:11', 'admin', '2023-04-18 19:31:01', NULL);
INSERT INTO `sys_menu` VALUES (1342, '终审中列表', 1338, 30, 'in-review', 'inReviewConsume', 'order/instalmentConsume/inReview', '1', 'C', '0', '0', 'finance:order:list', 'lock', 'admin', '2022-07-06 21:12:07', 'admin', '2023-04-18 19:31:14', NULL);
INSERT INTO `sys_menu` VALUES (1343, '还款计划列表', 1338, 50, 'repayment', 'repaymentListConsume', 'order/instalmentConsume/repayment', '1', 'C', '0', '0', 'finance:repay:list', 'withdrawal-order', 'admin', '2022-07-29 10:54:56', 'admin', '2023-03-19 11:53:12', NULL);
INSERT INTO `sys_menu` VALUES (1345, '详情', 1339, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:info', NULL, 'admin', '2022-07-06 18:06:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1346, '取单', 1339, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:lock', NULL, 'admin', '2022-07-06 18:07:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1347, '手工补推送', 1341, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:verifypush', NULL, 'admin', '2022-07-06 21:15:03', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1348, '审核', 1340, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:verify', NULL, 'admin', '2022-07-06 20:57:51', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1349, '解单', 1342, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:unlock', NULL, 'admin', '2022-07-06 21:12:49', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1350, '详情', 1343, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:item:items', NULL, 'admin', '2022-07-29 10:55:16', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1351, '详情', 1277, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:cashorder:info', NULL, 'admin', '2023-03-20 10:11:24', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1352, '详情', 1323, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:cashorder:info', NULL, 'admin', '2023-03-20 10:11:48', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1353, '产品信息（查询用）', 1277, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:product:list', NULL, 'admin', '2023-03-20 11:33:18', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1354, '产品信息（查询用）', 1323, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:product:list', NULL, 'admin', '2023-03-20 11:34:07', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1355, '状态变更', 1142, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'customer:info:update', NULL, 'admin', '2023-03-27 21:21:52', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1356, '平台待发货', 1224, 8, 'delivery', 'DeliverOrderList', 'order/order/delivery', '1', 'C', '0', '0', 'mall:order:list', 'delivered', 'admin', '2023-03-27 21:22:39', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1357, '退款详情', 1230, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'mall:orderreturn:detail', NULL, 'admin', '2023-04-06 16:19:32', 'admin', '2023-04-06 16:47:51', NULL);
INSERT INTO `sys_menu` VALUES (1358, '还款计划', 1312, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:bill:plan:info', NULL, 'admin', '2023-04-06 16:55:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1359, '详情', 1182, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'ms:spu:query', NULL, 'admin', '2023-04-13 17:54:52', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1360, '规格信息', 1182, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'ms:spec:list', NULL, 'admin', '2023-04-13 17:55:17', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1361, '账单取消', 1343, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:bill:cancel', NULL, 'admin', '2023-04-14 14:16:01', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1362, '导出', 1312, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:bill:export', NULL, 'admin', '2023-04-14 14:17:42', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1363, '债务信息', 1304, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:blordergoods:transfer', NULL, 'admin', '2023-04-18 10:27:54', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1364, '债权信息', 1277, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:cashorder:transfer', NULL, 'admin', '2023-04-18 19:14:22', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1365, '初审处理', 1338, 5, 'tentative-audit', 'TenTativeReviewProcessConsume', 'order/instalmentConsume/tentativeReviewProcess', '1', 'C', '0', '0', 'finance:order:info', 'checkbox', 'admin', '2023-04-18 19:21:45', 'admin', '2023-04-18 20:08:51', NULL);
INSERT INTO `sys_menu` VALUES (1366, '审核', 1365, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:firstverify', NULL, 'admin', '2023-04-18 19:24:17', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1367, '待初审列表', 1338, 8, 'tentative-audit-list', 'TenTativeManualReviewListConsume', 'order/instalmentConsume/tentativeReviewList', '1', 'C', '0', '0', 'finance:order:firstlist', 'eye-open', 'admin', '2023-04-18 19:28:26', 'admin', '2023-04-18 20:17:59', NULL);
INSERT INTO `sys_menu` VALUES (1368, '详情', 1367, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:info', NULL, 'admin', '2023-04-18 19:29:15', 'admin', '2023-04-18 19:29:36', NULL);
INSERT INTO `sys_menu` VALUES (1369, '锁单', 1367, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:firstlock', NULL, 'admin', '2023-04-18 19:30:28', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1370, '初审中列表', 1338, 8, 'tentative-inaudit', 'TenTativeInReviewConsume', 'order/instalmentConsume/tentativeInReview', '1', 'C', '0', '0', 'finance:order:firstlist', 'lock', 'admin', '2023-04-18 19:37:12', 'admin', '2023-04-18 20:15:35', NULL);
INSERT INTO `sys_menu` VALUES (1373, '解单', 1370, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:order:firstunlock', NULL, 'admin', '2023-04-18 19:54:15', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1374, '联系人借款', 1365, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:cashorder:count', NULL, 'admin', '2023-04-23 20:50:20', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1375, '联系人借款', 1340, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'finance:cashorder:count', NULL, 'admin', '2023-04-23 20:50:41', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1376, '导出', 1304, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:blordergoods:export', NULL, 'admin', '2023-04-27 11:08:47', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1377, '导出', 1307, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'business:blorderwithdraw:export', NULL, 'admin', '2023-04-27 11:09:08', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1378, '资方出资列表', 1274, 32, 'contribution', 'ContributionList', 'order/finance/contribution', '1', 'C', '0', '0', 'finance:capital:list', 'list', 'admin', '2023-05-18 16:30:31', 'admin', '2023-05-18 16:53:29', NULL);
INSERT INTO `sys_menu` VALUES (1379, '合作方充值', 1152, 30, 'recharge', 'partnerRecharge', 'partner/recharge/index', '1', 'C', '0', '0', 'account:adjust:list', 'adjustment', 'admin', '2023-05-18 17:02:27', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1380, '账户查询', 1313, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'account:partner:query', NULL, 'admin', '2023-05-18 19:08:00', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1381, '额度申请审核列表', 1311, 60, 'quota-adjust', 'quotaAdjust', 'customer/quotaAjust/index', '1', 'C', '0', '0', 'account:adjust:list', 'list', 'admin', '2023-05-26 11:35:16', 'admin', '2023-05-26 14:13:50', NULL);
INSERT INTO `sys_menu` VALUES (1382, '页面配置', 1261, 70, 'setting', 'shoppingSetting', 'shopping/setting/index', '1', 'C', '0', '0', 'system:config:list', 'setting', 'admin', '2023-05-28 21:02:01', 'admin', '2023-05-28 21:09:11', NULL);
INSERT INTO `sys_menu` VALUES (1383, '输出订单管理', 0, 105, 'output-order', 'outputOrder', NULL, '1', 'M', '0', '0', '', 'order-list', 'admin', '2023-06-20 15:34:37', 'admin', '2023-06-20 15:36:58', NULL);
INSERT INTO `sys_menu` VALUES (1384, '输出订单列表', 1383, 10, 'list', 'outputOrderList', 'order/output/index', '1', 'C', '0', '0', 'api:billorder:list', 'list', 'admin', '2023-06-20 15:35:32', 'admin', '2023-06-20 15:45:20', NULL);
INSERT INTO `sys_menu` VALUES (1385, '详情', 1384, 10, NULL, NULL, NULL, '1', 'F', '0', '0', 'api:billorder:detail', NULL, 'admin', '2023-06-20 15:37:37', 'admin', '2023-06-20 15:45:33', NULL);

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
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'super_admin', '0', '0', NULL, 0, '0', '0', 'system', '2022-05-19 12:00:00', 'system', '2022-05-19 12:00:00', '屏蔽');
INSERT INTO `sys_role` VALUES (2, '运营管理员', 'operation_admin', '00', '0', NULL, 0, '0', '0', 'system', '2022-05-19 12:00:00', 'admin', '2023-04-06 16:53:54', NULL);
INSERT INTO `sys_role` VALUES (51, '合作商', 'partner', '00', '0', NULL, 0, '0', '0', 'admin', '2022-06-20 11:37:02', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (52, '备用金审核人员', 'jiang888', '00', '0', NULL, 0, '0', '0', 'admin', '2022-07-22 12:10:23', 'admin', '2023-03-20 11:13:10', NULL);

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
-- Records of sys_role_dept
-- ----------------------------

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
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 200);
INSERT INTO `sys_role_menu` VALUES (2, 201);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1102);
INSERT INTO `sys_role_menu` VALUES (2, 1103);
INSERT INTO `sys_role_menu` VALUES (2, 1114);
INSERT INTO `sys_role_menu` VALUES (2, 1115);
INSERT INTO `sys_role_menu` VALUES (2, 1118);
INSERT INTO `sys_role_menu` VALUES (2, 1119);
INSERT INTO `sys_role_menu` VALUES (2, 1120);
INSERT INTO `sys_role_menu` VALUES (2, 1122);
INSERT INTO `sys_role_menu` VALUES (2, 1123);
INSERT INTO `sys_role_menu` VALUES (2, 1124);
INSERT INTO `sys_role_menu` VALUES (2, 1125);
INSERT INTO `sys_role_menu` VALUES (2, 1126);
INSERT INTO `sys_role_menu` VALUES (2, 1135);
INSERT INTO `sys_role_menu` VALUES (2, 1141);
INSERT INTO `sys_role_menu` VALUES (2, 1142);
INSERT INTO `sys_role_menu` VALUES (2, 1143);
INSERT INTO `sys_role_menu` VALUES (2, 1144);
INSERT INTO `sys_role_menu` VALUES (2, 1145);
INSERT INTO `sys_role_menu` VALUES (2, 1146);
INSERT INTO `sys_role_menu` VALUES (2, 1147);
INSERT INTO `sys_role_menu` VALUES (2, 1150);
INSERT INTO `sys_role_menu` VALUES (2, 1151);
INSERT INTO `sys_role_menu` VALUES (2, 1152);
INSERT INTO `sys_role_menu` VALUES (2, 1153);
INSERT INTO `sys_role_menu` VALUES (2, 1154);
INSERT INTO `sys_role_menu` VALUES (2, 1155);
INSERT INTO `sys_role_menu` VALUES (2, 1156);
INSERT INTO `sys_role_menu` VALUES (2, 1157);
INSERT INTO `sys_role_menu` VALUES (2, 1158);
INSERT INTO `sys_role_menu` VALUES (2, 1159);
INSERT INTO `sys_role_menu` VALUES (2, 1160);
INSERT INTO `sys_role_menu` VALUES (2, 1161);
INSERT INTO `sys_role_menu` VALUES (2, 1162);
INSERT INTO `sys_role_menu` VALUES (2, 1163);
INSERT INTO `sys_role_menu` VALUES (2, 1164);
INSERT INTO `sys_role_menu` VALUES (2, 1165);
INSERT INTO `sys_role_menu` VALUES (2, 1166);
INSERT INTO `sys_role_menu` VALUES (2, 1167);
INSERT INTO `sys_role_menu` VALUES (2, 1168);
INSERT INTO `sys_role_menu` VALUES (2, 1169);
INSERT INTO `sys_role_menu` VALUES (2, 1170);
INSERT INTO `sys_role_menu` VALUES (2, 1174);
INSERT INTO `sys_role_menu` VALUES (2, 1175);
INSERT INTO `sys_role_menu` VALUES (2, 1176);
INSERT INTO `sys_role_menu` VALUES (2, 1177);
INSERT INTO `sys_role_menu` VALUES (2, 1178);
INSERT INTO `sys_role_menu` VALUES (2, 1179);
INSERT INTO `sys_role_menu` VALUES (2, 1180);
INSERT INTO `sys_role_menu` VALUES (2, 1181);
INSERT INTO `sys_role_menu` VALUES (2, 1182);
INSERT INTO `sys_role_menu` VALUES (2, 1183);
INSERT INTO `sys_role_menu` VALUES (2, 1184);
INSERT INTO `sys_role_menu` VALUES (2, 1185);
INSERT INTO `sys_role_menu` VALUES (2, 1186);
INSERT INTO `sys_role_menu` VALUES (2, 1187);
INSERT INTO `sys_role_menu` VALUES (2, 1188);
INSERT INTO `sys_role_menu` VALUES (2, 1189);
INSERT INTO `sys_role_menu` VALUES (2, 1190);
INSERT INTO `sys_role_menu` VALUES (2, 1191);
INSERT INTO `sys_role_menu` VALUES (2, 1192);
INSERT INTO `sys_role_menu` VALUES (2, 1195);
INSERT INTO `sys_role_menu` VALUES (2, 1196);
INSERT INTO `sys_role_menu` VALUES (2, 1197);
INSERT INTO `sys_role_menu` VALUES (2, 1198);
INSERT INTO `sys_role_menu` VALUES (2, 1199);
INSERT INTO `sys_role_menu` VALUES (2, 1200);
INSERT INTO `sys_role_menu` VALUES (2, 1201);
INSERT INTO `sys_role_menu` VALUES (2, 1202);
INSERT INTO `sys_role_menu` VALUES (2, 1203);
INSERT INTO `sys_role_menu` VALUES (2, 1204);
INSERT INTO `sys_role_menu` VALUES (2, 1205);
INSERT INTO `sys_role_menu` VALUES (2, 1206);
INSERT INTO `sys_role_menu` VALUES (2, 1207);
INSERT INTO `sys_role_menu` VALUES (2, 1208);
INSERT INTO `sys_role_menu` VALUES (2, 1209);
INSERT INTO `sys_role_menu` VALUES (2, 1210);
INSERT INTO `sys_role_menu` VALUES (2, 1211);
INSERT INTO `sys_role_menu` VALUES (2, 1212);
INSERT INTO `sys_role_menu` VALUES (2, 1213);
INSERT INTO `sys_role_menu` VALUES (2, 1214);
INSERT INTO `sys_role_menu` VALUES (2, 1215);
INSERT INTO `sys_role_menu` VALUES (2, 1216);
INSERT INTO `sys_role_menu` VALUES (2, 1217);
INSERT INTO `sys_role_menu` VALUES (2, 1218);
INSERT INTO `sys_role_menu` VALUES (2, 1219);
INSERT INTO `sys_role_menu` VALUES (2, 1220);
INSERT INTO `sys_role_menu` VALUES (2, 1221);
INSERT INTO `sys_role_menu` VALUES (2, 1222);
INSERT INTO `sys_role_menu` VALUES (2, 1223);
INSERT INTO `sys_role_menu` VALUES (2, 1224);
INSERT INTO `sys_role_menu` VALUES (2, 1225);
INSERT INTO `sys_role_menu` VALUES (2, 1228);
INSERT INTO `sys_role_menu` VALUES (2, 1229);
INSERT INTO `sys_role_menu` VALUES (2, 1230);
INSERT INTO `sys_role_menu` VALUES (2, 1231);
INSERT INTO `sys_role_menu` VALUES (2, 1232);
INSERT INTO `sys_role_menu` VALUES (2, 1233);
INSERT INTO `sys_role_menu` VALUES (2, 1234);
INSERT INTO `sys_role_menu` VALUES (2, 1235);
INSERT INTO `sys_role_menu` VALUES (2, 1236);
INSERT INTO `sys_role_menu` VALUES (2, 1237);
INSERT INTO `sys_role_menu` VALUES (2, 1238);
INSERT INTO `sys_role_menu` VALUES (2, 1239);
INSERT INTO `sys_role_menu` VALUES (2, 1240);
INSERT INTO `sys_role_menu` VALUES (2, 1241);
INSERT INTO `sys_role_menu` VALUES (2, 1242);
INSERT INTO `sys_role_menu` VALUES (2, 1243);
INSERT INTO `sys_role_menu` VALUES (2, 1244);
INSERT INTO `sys_role_menu` VALUES (2, 1245);
INSERT INTO `sys_role_menu` VALUES (2, 1246);
INSERT INTO `sys_role_menu` VALUES (2, 1247);
INSERT INTO `sys_role_menu` VALUES (2, 1248);
INSERT INTO `sys_role_menu` VALUES (2, 1249);
INSERT INTO `sys_role_menu` VALUES (2, 1250);
INSERT INTO `sys_role_menu` VALUES (2, 1253);
INSERT INTO `sys_role_menu` VALUES (2, 1254);
INSERT INTO `sys_role_menu` VALUES (2, 1255);
INSERT INTO `sys_role_menu` VALUES (2, 1256);
INSERT INTO `sys_role_menu` VALUES (2, 1257);
INSERT INTO `sys_role_menu` VALUES (2, 1258);
INSERT INTO `sys_role_menu` VALUES (2, 1259);
INSERT INTO `sys_role_menu` VALUES (2, 1260);
INSERT INTO `sys_role_menu` VALUES (2, 1261);
INSERT INTO `sys_role_menu` VALUES (2, 1262);
INSERT INTO `sys_role_menu` VALUES (2, 1263);
INSERT INTO `sys_role_menu` VALUES (2, 1264);
INSERT INTO `sys_role_menu` VALUES (2, 1265);
INSERT INTO `sys_role_menu` VALUES (2, 1266);
INSERT INTO `sys_role_menu` VALUES (2, 1267);
INSERT INTO `sys_role_menu` VALUES (2, 1268);
INSERT INTO `sys_role_menu` VALUES (2, 1269);
INSERT INTO `sys_role_menu` VALUES (2, 1270);
INSERT INTO `sys_role_menu` VALUES (2, 1271);
INSERT INTO `sys_role_menu` VALUES (2, 1272);
INSERT INTO `sys_role_menu` VALUES (2, 1273);
INSERT INTO `sys_role_menu` VALUES (2, 1274);
INSERT INTO `sys_role_menu` VALUES (2, 1275);
INSERT INTO `sys_role_menu` VALUES (2, 1276);
INSERT INTO `sys_role_menu` VALUES (2, 1277);
INSERT INTO `sys_role_menu` VALUES (2, 1278);
INSERT INTO `sys_role_menu` VALUES (2, 1279);
INSERT INTO `sys_role_menu` VALUES (2, 1280);
INSERT INTO `sys_role_menu` VALUES (2, 1281);
INSERT INTO `sys_role_menu` VALUES (2, 1282);
INSERT INTO `sys_role_menu` VALUES (2, 1283);
INSERT INTO `sys_role_menu` VALUES (2, 1284);
INSERT INTO `sys_role_menu` VALUES (2, 1285);
INSERT INTO `sys_role_menu` VALUES (2, 1286);
INSERT INTO `sys_role_menu` VALUES (2, 1287);
INSERT INTO `sys_role_menu` VALUES (2, 1288);
INSERT INTO `sys_role_menu` VALUES (2, 1289);
INSERT INTO `sys_role_menu` VALUES (2, 1290);
INSERT INTO `sys_role_menu` VALUES (2, 1291);
INSERT INTO `sys_role_menu` VALUES (2, 1292);
INSERT INTO `sys_role_menu` VALUES (2, 1293);
INSERT INTO `sys_role_menu` VALUES (2, 1294);
INSERT INTO `sys_role_menu` VALUES (2, 1295);
INSERT INTO `sys_role_menu` VALUES (2, 1296);
INSERT INTO `sys_role_menu` VALUES (2, 1297);
INSERT INTO `sys_role_menu` VALUES (2, 1303);
INSERT INTO `sys_role_menu` VALUES (2, 1304);
INSERT INTO `sys_role_menu` VALUES (2, 1305);
INSERT INTO `sys_role_menu` VALUES (2, 1306);
INSERT INTO `sys_role_menu` VALUES (2, 1307);
INSERT INTO `sys_role_menu` VALUES (2, 1308);
INSERT INTO `sys_role_menu` VALUES (2, 1309);
INSERT INTO `sys_role_menu` VALUES (2, 1310);
INSERT INTO `sys_role_menu` VALUES (2, 1311);
INSERT INTO `sys_role_menu` VALUES (2, 1312);
INSERT INTO `sys_role_menu` VALUES (2, 1318);
INSERT INTO `sys_role_menu` VALUES (2, 1319);
INSERT INTO `sys_role_menu` VALUES (2, 1320);
INSERT INTO `sys_role_menu` VALUES (2, 1321);
INSERT INTO `sys_role_menu` VALUES (2, 1322);
INSERT INTO `sys_role_menu` VALUES (2, 1323);
INSERT INTO `sys_role_menu` VALUES (2, 1351);
INSERT INTO `sys_role_menu` VALUES (2, 1352);
INSERT INTO `sys_role_menu` VALUES (2, 1353);
INSERT INTO `sys_role_menu` VALUES (2, 1354);
INSERT INTO `sys_role_menu` VALUES (2, 1355);
INSERT INTO `sys_role_menu` VALUES (2, 1357);
INSERT INTO `sys_role_menu` VALUES (2, 1358);
INSERT INTO `sys_role_menu` VALUES (51, 1150);
INSERT INTO `sys_role_menu` VALUES (51, 1151);
INSERT INTO `sys_role_menu` VALUES (52, 1135);
INSERT INTO `sys_role_menu` VALUES (52, 1162);
INSERT INTO `sys_role_menu` VALUES (52, 1163);
INSERT INTO `sys_role_menu` VALUES (52, 1164);
INSERT INTO `sys_role_menu` VALUES (52, 1165);
INSERT INTO `sys_role_menu` VALUES (52, 1166);
INSERT INTO `sys_role_menu` VALUES (52, 1167);
INSERT INTO `sys_role_menu` VALUES (52, 1168);
INSERT INTO `sys_role_menu` VALUES (52, 1169);
INSERT INTO `sys_role_menu` VALUES (52, 1170);
INSERT INTO `sys_role_menu` VALUES (52, 1174);
INSERT INTO `sys_role_menu` VALUES (52, 1175);
INSERT INTO `sys_role_menu` VALUES (52, 1269);
INSERT INTO `sys_role_menu` VALUES (52, 1272);
INSERT INTO `sys_role_menu` VALUES (52, 1273);
INSERT INTO `sys_role_menu` VALUES (52, 1274);
INSERT INTO `sys_role_menu` VALUES (52, 1277);
INSERT INTO `sys_role_menu` VALUES (52, 1324);
INSERT INTO `sys_role_menu` VALUES (52, 1325);
INSERT INTO `sys_role_menu` VALUES (52, 1326);
INSERT INTO `sys_role_menu` VALUES (52, 1327);
INSERT INTO `sys_role_menu` VALUES (52, 1328);
INSERT INTO `sys_role_menu` VALUES (52, 1329);
INSERT INTO `sys_role_menu` VALUES (52, 1330);
INSERT INTO `sys_role_menu` VALUES (52, 1331);
INSERT INTO `sys_role_menu` VALUES (52, 1332);
INSERT INTO `sys_role_menu` VALUES (52, 1333);
INSERT INTO `sys_role_menu` VALUES (52, 1334);
INSERT INTO `sys_role_menu` VALUES (52, 1335);
INSERT INTO `sys_role_menu` VALUES (52, 1336);
INSERT INTO `sys_role_menu` VALUES (52, 1337);
INSERT INTO `sys_role_menu` VALUES (52, 1351);

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
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', 'admin', '0', '0', NULL, NULL, '/profile/avatar/20211117/fc4c6164-ddda-48ec-8593-5e669bb50eb1.jpeg', '$2a$10$sLkmVT3OlhgNhR0VGDN5DuEkEa6bFhH5P.Z2VcdXOHi9Rn2F9bHf.', '0', '0', NULL, NULL, 'system', '2022-05-19 12:00:00', 'system', '2022-05-19 12:00:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 0, '1111', '1111', '00', '0', '1111', '1111@1111.com', NULL, '$2a$10$IDCgzfd0GKGYHzBYQ0k6Lubxjp0KpSaOFx3WR/3ipieJvnTHqC9jq', '0', '1', NULL, NULL, 'admin', '2022-07-26 20:43:47', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 0, 'ot888', 'ot888', '00', '0', NULL, '112233@qq.com', NULL, '$2a$10$u5AznLssdh60GfzxyaiNkO8AoneljNdOleuWjSo0/uvmvMH9B.MkG', '0', '1', NULL, NULL, 'admin', '2022-07-26 20:46:48', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 0, 'jiang888', 'jiang888', '00', '0', NULL, '123456@qq.com', NULL, '$2a$10$CuwADoizWgBpEfmxM1OucOZloSeif2HCyWinFmyrCvOdgcjKr32uy', '0', '0', NULL, NULL, 'admin', '2023-01-14 10:14:17', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 3, '13800138001', '商户测试', '11', '5', '13800138001', NULL, NULL, '$2a$10$ejxmWRCWL.Q85e/07oUtru6zva7fFHfcMIW5/3zqNojA4CtrAk1Em', '0', '0', NULL, NULL, 'admin', '2023-02-01 14:18:56', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (7, 3, '13434340000', '测试合作方', '11', '6', '13434346670', NULL, NULL, '$2a$10$8o/eF8Odxzdp9QzV.Zb6OePDZa8nCWmMnKsRUYmFL9HUcgVjHSEfu', '0', '0', NULL, NULL, 'admin', '2023-02-01 19:57:38', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 3, '13800138022', '商户测试2', '11', '8', '13800138022', NULL, NULL, '$2a$10$XY59j3oWsKk7J4EwkMf7w.ZN9OE9uJbcXePzY8AtTHvxOb1fqF99K', '0', '0', NULL, NULL, 'admin', '2023-02-03 14:25:40', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10, 0, '13800138000', '测试运营', '00', '0', '13800138000', '402825410@qq.com', NULL, '$2a$10$edYjUzvBho1Dhe/qaMEpketWnLTeC6XYI9fx5vH9LeF4q98p3Ftce', '0', '0', NULL, NULL, 'admin', '2023-03-15 14:59:02', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 3, '13800138003', '及未券包', '11', '9', '13800138003', NULL, NULL, '$2a$10$k8CTAwwO4cJ.mNT58kiQy.dl23ecLqyWkbsSKL21n4BzaAoypzSD.', '0', '0', NULL, NULL, 'admin', '2023-04-05 13:43:50', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 3, '13800138004', '导流测试合作方', '11', '10', '13800138004', NULL, NULL, '$2a$10$uO4ViJNyHP1JPKWKkl6x8.c0V6J5JZjp0bXGmoc8/qf1d1i0pRBQ6', '0', '0', NULL, NULL, 'admin', '2023-05-23 14:14:48', NULL, NULL, NULL);

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
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 52);
INSERT INTO `sys_user_role` VALUES (3, 52);
INSERT INTO `sys_user_role` VALUES (4, 52);
INSERT INTO `sys_user_role` VALUES (6, 3);
INSERT INTO `sys_user_role` VALUES (7, 3);
INSERT INTO `sys_user_role` VALUES (9, 3);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (11, 3);
INSERT INTO `sys_user_role` VALUES (12, 3);

SET FOREIGN_KEY_CHECKS = 1;
