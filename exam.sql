/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 24/07/2018 07:49:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buy_log
-- ----------------------------
DROP TABLE IF EXISTS `buy_log`;
CREATE TABLE `buy_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spending` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_id` bigint(20) NULL DEFAULT NULL,
  `sys_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcssemg8jfxw0bm5wtl2mh5445`(`sys_modify_log_id`) USING BTREE,
  INDEX `FK12i6b6ltmyv3dngtu0dc10jwd`(`resource_id`) USING BTREE,
  INDEX `FKs9cdk2cmebx1j8pl9s2vkd5nn`(`sys_user_id`) USING BTREE,
  CONSTRAINT `FK12i6b6ltmyv3dngtu0dc10jwd` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcssemg8jfxw0bm5wtl2mh5445` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs9cdk2cmebx1j8pl9s2vkd5nn` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy_log
-- ----------------------------
INSERT INTO `buy_log` VALUES (2, 3, NULL, 2, 1);

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` bit(1) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKora5kxj5grea4n8xdk0uv40le`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKcaq6r76cswke5b9fk6fyx3y5w`(`question_id`) USING BTREE,
  CONSTRAINT `FKcaq6r76cswke5b9fk6fyx3y5w` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKora5kxj5grea4n8xdk0uv40le` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 891 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES (1, b'0', '需求分析', NULL, 1);
INSERT INTO `choice` VALUES (2, b'0', '结构设计', NULL, 1);
INSERT INTO `choice` VALUES (3, b'0', '程序编制', NULL, 1);
INSERT INTO `choice` VALUES (4, b'1', '软件维护', NULL, 1);
INSERT INTO `choice` VALUES (5, b'1', '研制', NULL, 2);
INSERT INTO `choice` VALUES (6, b'0', '拷贝', NULL, 2);
INSERT INTO `choice` VALUES (7, b'0', '再生产', NULL, 2);
INSERT INTO `choice` VALUES (8, b'0', '复制', NULL, 2);
INSERT INTO `choice` VALUES (9, b'0', '喷泉模型', NULL, 3);
INSERT INTO `choice` VALUES (10, b'0', '增量模型', NULL, 3);
INSERT INTO `choice` VALUES (11, b'1', '瀑布模型', NULL, 3);
INSERT INTO `choice` VALUES (12, b'0', '螺旋模型', NULL, 3);
INSERT INTO `choice` VALUES (13, b'0', '详细设计', NULL, 4);
INSERT INTO `choice` VALUES (14, b'1', '可行性分析和项目开发计划', NULL, 4);
INSERT INTO `choice` VALUES (15, b'0', '概要设计', NULL, 4);
INSERT INTO `choice` VALUES (16, b'0', '软件测试', NULL, 4);
INSERT INTO `choice` VALUES (17, b'0', '有形', NULL, 5);
INSERT INTO `choice` VALUES (18, b'0', '消耗', NULL, 5);
INSERT INTO `choice` VALUES (19, b'1', '逻辑', NULL, 5);
INSERT INTO `choice` VALUES (20, b'0', '文档', NULL, 5);
INSERT INTO `choice` VALUES (21, b'0', '原型模型', NULL, 6);
INSERT INTO `choice` VALUES (22, b'0', '螺旋模型', NULL, 6);
INSERT INTO `choice` VALUES (23, b'1', '基于知识的智能模型', NULL, 6);
INSERT INTO `choice` VALUES (24, b'0', '喷泉模型', NULL, 6);
INSERT INTO `choice` VALUES (25, b'0', '概要设计', NULL, 7);
INSERT INTO `choice` VALUES (26, b'1', '详细设计', NULL, 7);
INSERT INTO `choice` VALUES (27, b'0', '编码', NULL, 7);
INSERT INTO `choice` VALUES (28, b'0', '测试', NULL, 7);
INSERT INTO `choice` VALUES (29, b'1', '原型模型', NULL, 8);
INSERT INTO `choice` VALUES (30, b'0', '瀑布模型', NULL, 8);
INSERT INTO `choice` VALUES (31, b'0', '基于知识的智能模型', NULL, 8);
INSERT INTO `choice` VALUES (32, b'0', '变换模型', NULL, 8);
INSERT INTO `choice` VALUES (33, b'0', '原型模型', NULL, 9);
INSERT INTO `choice` VALUES (34, b'0', '瀑布模型', NULL, 9);
INSERT INTO `choice` VALUES (35, b'1', '喷泉模型', NULL, 9);
INSERT INTO `choice` VALUES (36, b'0', '螺旋模型', NULL, 9);
INSERT INTO `choice` VALUES (37, b'0', '原型模型', NULL, 10);
INSERT INTO `choice` VALUES (38, b'0', '瀑布模型', NULL, 10);
INSERT INTO `choice` VALUES (39, b'0', '喷泉模型', NULL, 10);
INSERT INTO `choice` VALUES (40, b'1', '螺旋模型', NULL, 10);
INSERT INTO `choice` VALUES (41, b'0', '可修改性', NULL, 11);
INSERT INTO `choice` VALUES (42, b'0', '可靠性', NULL, 11);
INSERT INTO `choice` VALUES (43, b'1', '可适应性', NULL, 11);
INSERT INTO `choice` VALUES (44, b'0', '可重用性', NULL, 11);
INSERT INTO `choice` VALUES (45, b'0', '可移植性', NULL, 12);
INSERT INTO `choice` VALUES (46, b'1', '可重用性', NULL, 12);
INSERT INTO `choice` VALUES (47, b'0', '容错性', NULL, 12);
INSERT INTO `choice` VALUES (48, b'0', '可适应性', NULL, 12);
INSERT INTO `choice` VALUES (49, b'1', '可理解性', NULL, 13);
INSERT INTO `choice` VALUES (50, b'0', '可靠性', NULL, 13);
INSERT INTO `choice` VALUES (51, b'0', '可适应性', NULL, 13);
INSERT INTO `choice` VALUES (52, b'0', '可重用性', NULL, 13);
INSERT INTO `choice` VALUES (53, b'0', '可理解性', NULL, 14);
INSERT INTO `choice` VALUES (54, b'1', '可维护性', NULL, 14);
INSERT INTO `choice` VALUES (55, b'0', '可适应性', NULL, 14);
INSERT INTO `choice` VALUES (56, b'0', '可重用性', NULL, 14);
INSERT INTO `choice` VALUES (57, b'0', '可理解性', NULL, 15);
INSERT INTO `choice` VALUES (58, b'0', '可修改性', NULL, 15);
INSERT INTO `choice` VALUES (59, b'1', '可移植性', NULL, 15);
INSERT INTO `choice` VALUES (60, b'0', '可重用性', NULL, 15);
INSERT INTO `choice` VALUES (61, b'0', '有效性', NULL, 16);
INSERT INTO `choice` VALUES (62, b'0', '可适应性', NULL, 16);
INSERT INTO `choice` VALUES (63, b'0', '正确性', NULL, 16);
INSERT INTO `choice` VALUES (64, b'1', '可靠性', NULL, 16);
INSERT INTO `choice` VALUES (65, b'1', '可修改性', NULL, 17);
INSERT INTO `choice` VALUES (66, b'0', '可适应性', NULL, 17);
INSERT INTO `choice` VALUES (67, b'0', '可维护性', NULL, 17);
INSERT INTO `choice` VALUES (68, b'0', '可移植性', NULL, 17);
INSERT INTO `choice` VALUES (69, b'0', '可理解性', NULL, 18);
INSERT INTO `choice` VALUES (70, b'0', '可互操作性', NULL, 18);
INSERT INTO `choice` VALUES (71, b'1', '可维护性', NULL, 18);
INSERT INTO `choice` VALUES (72, b'0', '可追踪性', NULL, 18);
INSERT INTO `choice` VALUES (73, b'0', '可理解性', NULL, 19);
INSERT INTO `choice` VALUES (74, b'0', '可互操作性', NULL, 19);
INSERT INTO `choice` VALUES (75, b'1', '可追踪性', NULL, 19);
INSERT INTO `choice` VALUES (76, b'0', '可维护性', NULL, 19);
INSERT INTO `choice` VALUES (77, b'0', '有效性', NULL, 20);
INSERT INTO `choice` VALUES (78, b'0', '可互操作性', NULL, 20);
INSERT INTO `choice` VALUES (79, b'0', '可追踪性', NULL, 20);
INSERT INTO `choice` VALUES (80, b'1', '可维护性', NULL, 20);
INSERT INTO `choice` VALUES (81, b'1', '可适应性', NULL, 21);
INSERT INTO `choice` VALUES (82, b'0', '可互操作性', NULL, 21);
INSERT INTO `choice` VALUES (83, b'0', '可追踪性', NULL, 21);
INSERT INTO `choice` VALUES (84, b'0', '有效性', NULL, 21);
INSERT INTO `choice` VALUES (85, b'0', '有效性', NULL, 22);
INSERT INTO `choice` VALUES (86, b'1', '可移植性', NULL, 22);
INSERT INTO `choice` VALUES (87, b'0', '可追踪性', NULL, 22);
INSERT INTO `choice` VALUES (88, b'0', '可靠性', NULL, 22);
INSERT INTO `choice` VALUES (89, b'0', '有效性', NULL, 23);
INSERT INTO `choice` VALUES (90, b'0', '可互操作性', NULL, 23);
INSERT INTO `choice` VALUES (91, b'1', '可靠性', NULL, 23);
INSERT INTO `choice` VALUES (92, b'0', '可追踪性', NULL, 23);
INSERT INTO `choice` VALUES (93, b'0', '组装测试计划', NULL, 24);
INSERT INTO `choice` VALUES (94, b'0', '单元测试计划', NULL, 24);
INSERT INTO `choice` VALUES (95, b'0', '软件总体设计', NULL, 24);
INSERT INTO `choice` VALUES (96, b'1', '验收测试计划', NULL, 24);
INSERT INTO `choice` VALUES (97, b'1', '组装测试计划', NULL, 25);
INSERT INTO `choice` VALUES (98, b'0', '单元测试计划', NULL, 25);
INSERT INTO `choice` VALUES (99, b'0', '初步用户手册', NULL, 25);
INSERT INTO `choice` VALUES (100, b'0', '验收测试计划', NULL, 25);
INSERT INTO `choice` VALUES (101, b'0', '组装测试计划', NULL, 26);
INSERT INTO `choice` VALUES (102, b'1', '单元测试计划', NULL, 26);
INSERT INTO `choice` VALUES (103, b'0', '初步用户手册', NULL, 26);
INSERT INTO `choice` VALUES (104, b'0', '验收测试计划', NULL, 26);
INSERT INTO `choice` VALUES (105, b'0', '组装测试计划', NULL, 27);
INSERT INTO `choice` VALUES (106, b'0', '绘制程序流程图', NULL, 27);
INSERT INTO `choice` VALUES (107, b'1', '单元测试', NULL, 27);
INSERT INTO `choice` VALUES (108, b'0', '验收测试计划', NULL, 27);
INSERT INTO `choice` VALUES (109, b'0', '项目开发总结报告', NULL, 28);
INSERT INTO `choice` VALUES (110, b'0', '验收测试计划', NULL, 28);
INSERT INTO `choice` VALUES (111, b'0', '需求规格说明书', NULL, 28);
INSERT INTO `choice` VALUES (112, b'1', '最终用户手册', NULL, 28);
INSERT INTO `choice` VALUES (113, b'0', '项目开发计划', NULL, 29);
INSERT INTO `choice` VALUES (114, b'0', '可行性分析报告', NULL, 29);
INSERT INTO `choice` VALUES (115, b'1', '需求规格说明书', NULL, 29);
INSERT INTO `choice` VALUES (116, b'0', '设计说明书', NULL, 29);
INSERT INTO `choice` VALUES (117, b'1', '让软件做什么', NULL, 30);
INSERT INTO `choice` VALUES (118, b'0', '要给软件提供哪些信息', NULL, 30);
INSERT INTO `choice` VALUES (119, b'0', '要求软件工作效率怎样', NULL, 30);
INSERT INTO `choice` VALUES (120, b'0', '让软件具有何种结构', NULL, 30);
INSERT INTO `choice` VALUES (121, b'0', '一个输入流或一个输出流', NULL, 31);
INSERT INTO `choice` VALUES (122, b'1', '一个输入流和一个输出流', NULL, 31);
INSERT INTO `choice` VALUES (123, b'0', '一个输入流', NULL, 31);
INSERT INTO `choice` VALUES (124, b'0', '一个输出流', NULL, 31);
INSERT INTO `choice` VALUES (125, b'0', '数据流', NULL, 32);
INSERT INTO `choice` VALUES (126, b'0', '数据存储', NULL, 32);
INSERT INTO `choice` VALUES (127, b'0', '加工', NULL, 32);
INSERT INTO `choice` VALUES (128, b'1', '源点与终点', NULL, 32);
INSERT INTO `choice` VALUES (129, b'0', '细节', NULL, 33);
INSERT INTO `choice` VALUES (130, b'1', '输入与输出', NULL, 33);
INSERT INTO `choice` VALUES (131, b'0', '软件的作用', NULL, 33);
INSERT INTO `choice` VALUES (132, b'0', '绘制的时间', NULL, 33);
INSERT INTO `choice` VALUES (133, b'0', '主要功能', NULL, 34);
INSERT INTO `choice` VALUES (134, b'1', '算法的详细过程', NULL, 34);
INSERT INTO `choice` VALUES (135, b'0', '用户界面和运行环境', NULL, 34);
INSERT INTO `choice` VALUES (136, b'0', '软件性能', NULL, 34);
INSERT INTO `choice` VALUES (137, b'0', '软件设计的依据', NULL, 35);
INSERT INTO `choice` VALUES (138, b'0', '用户与开发人员对软件要做什么的共同理解', NULL, 35);
INSERT INTO `choice` VALUES (139, b'0', '软件验收的依据', NULL, 35);
INSERT INTO `choice` VALUES (140, b'1', '软件可行性研究的依据', NULL, 35);
INSERT INTO `choice` VALUES (141, b'0', '系统的控制流程', NULL, 36);
INSERT INTO `choice` VALUES (142, b'0', '系统的数据结构', NULL, 36);
INSERT INTO `choice` VALUES (143, b'0', '系统的基本加工', NULL, 36);
INSERT INTO `choice` VALUES (144, b'1', '系统的功能', NULL, 36);
INSERT INTO `choice` VALUES (145, b'0', '某些加工的数据接口', NULL, 37);
INSERT INTO `choice` VALUES (146, b'0', '某个加工的特定输入', NULL, 37);
INSERT INTO `choice` VALUES (147, b'0', '某个加工的特定输出', NULL, 37);
INSERT INTO `choice` VALUES (148, b'1', '某些加工的数据接口或某个加工的特定输入输出', NULL, 37);
INSERT INTO `choice` VALUES (149, b'1', '必须一致', NULL, 38);
INSERT INTO `choice` VALUES (150, b'0', '数目必须相等', NULL, 38);
INSERT INTO `choice` VALUES (151, b'0', '名字必须相同', NULL, 38);
INSERT INTO `choice` VALUES (152, b'0', '数目必须不等', NULL, 38);
INSERT INTO `choice` VALUES (153, b'0', '结构化语言', NULL, 39);
INSERT INTO `choice` VALUES (154, b'0', '判定表', NULL, 39);
INSERT INTO `choice` VALUES (155, b'0', '判定树', NULL, 39);
INSERT INTO `choice` VALUES (156, b'1', '流程图', NULL, 39);
INSERT INTO `choice` VALUES (157, b'1', '获得当前系统的物理模型，抽象出当前系统的逻辑模型，建立目标系统的逻辑模型', NULL, 40);
INSERT INTO `choice` VALUES (158, b'0', '获得当前系统的物理模型，抽象出当前系统的逻辑模型，建立目标系统的物理模型', NULL, 40);
INSERT INTO `choice` VALUES (159, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，抽象出目标系统的逻辑模型', NULL, 40);
INSERT INTO `choice` VALUES (160, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，建立目标系统的物理模型', NULL, 40);
INSERT INTO `choice` VALUES (161, b'0', '自底向上逐步抽象', NULL, 41);
INSERT INTO `choice` VALUES (162, b'0', '自底向上逐步分解', NULL, 41);
INSERT INTO `choice` VALUES (163, b'1', '自顶向下逐步分解', NULL, 41);
INSERT INTO `choice` VALUES (164, b'0', '自顶向上抽象', NULL, 41);
INSERT INTO `choice` VALUES (165, b'0', '可行性研究', NULL, 42);
INSERT INTO `choice` VALUES (166, b'1', '需求分析', NULL, 42);
INSERT INTO `choice` VALUES (167, b'0', '软件概要设计', NULL, 42);
INSERT INTO `choice` VALUES (168, b'0', '软件详细设计', NULL, 42);
INSERT INTO `choice` VALUES (169, b'0', '键盘、鼠标、通信端口、网络等设备一有变化，就会产生消息', NULL, 43);
INSERT INTO `choice` VALUES (170, b'1', '操作系统不断向应用程序发送消息，但应用程序不能向操作系统发送消息', NULL, 43);
INSERT INTO `choice` VALUES (171, b'0', '应用程序之间可以相互发送消息', NULL, 43);
INSERT INTO `choice` VALUES (172, b'0', '发送与接收消息的通信机制与传统的子程序调用机制不同', NULL, 43);
INSERT INTO `choice` VALUES (173, b'0', '详细的', NULL, 44);
INSERT INTO `choice` VALUES (174, b'0', '全面的', NULL, 44);
INSERT INTO `choice` VALUES (175, b'1', '简化的、压缩的', NULL, 44);
INSERT INTO `choice` VALUES (176, b'0', '彻底的', NULL, 44);
INSERT INTO `choice` VALUES (177, b'1', '当前运行系统', NULL, 45);
INSERT INTO `choice` VALUES (178, b'0', '当前逻辑模型', NULL, 45);
INSERT INTO `choice` VALUES (179, b'0', '目标系统', NULL, 45);
INSERT INTO `choice` VALUES (180, b'0', '新系统', NULL, 45);
INSERT INTO `choice` VALUES (181, b'0', '逻辑系统', NULL, 46);
INSERT INTO `choice` VALUES (182, b'0', '程序系统', NULL, 46);
INSERT INTO `choice` VALUES (183, b'1', '体系结构', NULL, 46);
INSERT INTO `choice` VALUES (184, b'0', '物理系统', NULL, 46);
INSERT INTO `choice` VALUES (185, b'0', '判定表', NULL, 47);
INSERT INTO `choice` VALUES (186, b'0', 'IPO 图', NULL, 47);
INSERT INTO `choice` VALUES (187, b'0', 'PDL ', NULL, 47);
INSERT INTO `choice` VALUES (188, b'1', 'DFD 图', NULL, 47);
INSERT INTO `choice` VALUES (189, b'0', '过程、子程序和分程序', NULL, 48);
INSERT INTO `choice` VALUES (190, b'1', '顺序、选择和重复', NULL, 48);
INSERT INTO `choice` VALUES (191, b'0', '递归、堆栈和队列', NULL, 48);
INSERT INTO `choice` VALUES (192, b'0', '调用、返回和转移', NULL, 48);
INSERT INTO `choice` VALUES (193, b'0', '不能嵌套使用', NULL, 49);
INSERT INTO `choice` VALUES (194, b'0', '只能用来写简单程序', NULL, 49);
INSERT INTO `choice` VALUES (195, b'0', '已经用硬件实现', NULL, 49);
INSERT INTO `choice` VALUES (196, b'1', '只有一个入口和一个出口', NULL, 49);
INSERT INTO `choice` VALUES (197, b'0', '生存期', NULL, 50);
INSERT INTO `choice` VALUES (198, b'0', '面向对象设计', NULL, 50);
INSERT INTO `choice` VALUES (199, b'0', '面向对象程序设计', NULL, 50);
INSERT INTO `choice` VALUES (200, b'1', '面向对象分析', NULL, 50);
INSERT INTO `choice` VALUES (201, b'1', '需求不确定性高的', NULL, 51);
INSERT INTO `choice` VALUES (202, b'0', '需求确定的', NULL, 51);
INSERT INTO `choice` VALUES (203, b'0', '管理信息', NULL, 51);
INSERT INTO `choice` VALUES (204, b'0', '实时', NULL, 51);
INSERT INTO `choice` VALUES (205, b'1', '自外向内', NULL, 52);
INSERT INTO `choice` VALUES (206, b'0', '自顶向下', NULL, 52);
INSERT INTO `choice` VALUES (207, b'0', '自内向外', NULL, 52);
INSERT INTO `choice` VALUES (208, b'0', '自底向上', NULL, 52);
INSERT INTO `choice` VALUES (209, b'0', '数据流图', NULL, 53);
INSERT INTO `choice` VALUES (210, b'0', '判定表', NULL, 53);
INSERT INTO `choice` VALUES (211, b'1', 'PAD 图', NULL, 53);
INSERT INTO `choice` VALUES (212, b'0', '数据字典', NULL, 53);
INSERT INTO `choice` VALUES (213, b'0', '用户要求', NULL, 54);
INSERT INTO `choice` VALUES (214, b'0', '合理要求', NULL, 54);
INSERT INTO `choice` VALUES (215, b'1', '模糊要求', NULL, 54);
INSERT INTO `choice` VALUES (216, b'0', '对象', NULL, 55);
INSERT INTO `choice` VALUES (217, b'0', '解释', NULL, 55);
INSERT INTO `choice` VALUES (218, b'0', '符号', NULL, 55);
INSERT INTO `choice` VALUES (219, b'1', '描述', NULL, 55);
INSERT INTO `choice` VALUES (220, b'0', '控制流', NULL, 56);
INSERT INTO `choice` VALUES (221, b'0', '信息流', NULL, 56);
INSERT INTO `choice` VALUES (222, b'1', '数据流', NULL, 56);
INSERT INTO `choice` VALUES (223, b'0', '信号流', NULL, 56);
INSERT INTO `choice` VALUES (224, b'1', '数据流图', NULL, 57);
INSERT INTO `choice` VALUES (225, b'0', '数据词典', NULL, 57);
INSERT INTO `choice` VALUES (226, b'0', '结构化英语', NULL, 57);
INSERT INTO `choice` VALUES (227, b'0', '判定树与判定表', NULL, 57);
INSERT INTO `choice` VALUES (228, b'0', '数据流图', NULL, 58);
INSERT INTO `choice` VALUES (229, b'1', '数据词典', NULL, 58);
INSERT INTO `choice` VALUES (230, b'0', '结构化英语', NULL, 58);
INSERT INTO `choice` VALUES (231, b'0', '判定树与判定表', NULL, 58);
INSERT INTO `choice` VALUES (232, b'0', '一对象', NULL, 59);
INSERT INTO `choice` VALUES (233, b'0', '数据结构', NULL, 59);
INSERT INTO `choice` VALUES (234, b'1', '数据流', NULL, 59);
INSERT INTO `choice` VALUES (235, b'0', '控制流', NULL, 59);
INSERT INTO `choice` VALUES (236, b'0', '数据流图', NULL, 60);
INSERT INTO `choice` VALUES (237, b'1', '组织结构图', NULL, 60);
INSERT INTO `choice` VALUES (238, b'0', '数据词典', NULL, 60);
INSERT INTO `choice` VALUES (239, b'0', '结构化语言', NULL, 60);
INSERT INTO `choice` VALUES (240, b'0', '总结', NULL, 61);
INSERT INTO `choice` VALUES (241, b'0', '实践性报告', NULL, 61);
INSERT INTO `choice` VALUES (242, b'1', '需求分析评审', NULL, 61);
INSERT INTO `choice` VALUES (243, b'0', '以上答案都不正确', NULL, 61);
INSERT INTO `choice` VALUES (244, b'0', '结构化语言外层中的顺序结构是一组祈使语句、选择语句、重复语句的顺序排列', NULL, 62);
INSERT INTO `choice` VALUES (245, b'0', '结构化语言外层中的选择结构使用IF-THEN--ELSE-ENDIF 等关键字', NULL, 62);
INSERT INTO `choice` VALUES (246, b'0', '结构化语言的内层可以采用祈使语句的自然语言短语', NULL, 62);
INSERT INTO `choice` VALUES (247, b'1', '结构化语言外层中的重复结构使用CASE-OF-ENDCASE 等关键字', NULL, 62);
INSERT INTO `choice` VALUES (248, b'0', '数据流图', NULL, 63);
INSERT INTO `choice` VALUES (249, b'1', '数据字典', NULL, 63);
INSERT INTO `choice` VALUES (250, b'0', '判定表', NULL, 63);
INSERT INTO `choice` VALUES (251, b'0', '判定树', NULL, 63);
INSERT INTO `choice` VALUES (252, b'0', '对于顺序执行和循环执行的动作，用判定表和判定树', NULL, 64);
INSERT INTO `choice` VALUES (253, b'0', '对于存在多个条件复杂组合的判断问题，用结构化语言描述', NULL, 64);
INSERT INTO `choice` VALUES (254, b'0', '判定表较判定树直观易读，判定树进行逻辑验证较严格', NULL, 64);
INSERT INTO `choice` VALUES (255, b'1', '可将判定表和判定树两者结合起来，先用判定表作底稿，在此基础上产生判定树', NULL, 64);
INSERT INTO `choice` VALUES (256, b'0', '软件设计的依据', NULL, 65);
INSERT INTO `choice` VALUES (257, b'0', '用户与开发人员对软件要做什么的共同理解', NULL, 65);
INSERT INTO `choice` VALUES (258, b'0', '软件验收的依据', NULL, 65);
INSERT INTO `choice` VALUES (259, b'1', '软件可行性研究的依据', NULL, 65);
INSERT INTO `choice` VALUES (260, b'0', '主要功能', NULL, 66);
INSERT INTO `choice` VALUES (261, b'1', '算法的详细过程', NULL, 66);
INSERT INTO `choice` VALUES (262, b'0', '用户界面及运行环境', NULL, 66);
INSERT INTO `choice` VALUES (263, b'0', '软件的性能', NULL, 66);
INSERT INTO `choice` VALUES (264, b'0', '网络图', NULL, 67);
INSERT INTO `choice` VALUES (265, b'0', '实体联系图', NULL, 67);
INSERT INTO `choice` VALUES (266, b'1', '数据字典', NULL, 67);
INSERT INTO `choice` VALUES (267, b'0', '程序流程图', NULL, 67);
INSERT INTO `choice` VALUES (268, b'0', '结构分解', NULL, 68);
INSERT INTO `choice` VALUES (269, b'1', '功能分解', NULL, 68);
INSERT INTO `choice` VALUES (270, b'0', '数据分解', NULL, 68);
INSERT INTO `choice` VALUES (271, b'0', '系统分解', NULL, 68);
INSERT INTO `choice` VALUES (272, b'0', '细节', NULL, 69);
INSERT INTO `choice` VALUES (273, b'1', '输人与输出', NULL, 69);
INSERT INTO `choice` VALUES (274, b'0', '软件的作者', NULL, 69);
INSERT INTO `choice` VALUES (275, b'0', '绘制的时间', NULL, 69);
INSERT INTO `choice` VALUES (276, b'0', '分析结果', NULL, 70);
INSERT INTO `choice` VALUES (277, b'0', '事件', NULL, 70);
INSERT INTO `choice` VALUES (278, b'0', '动作', NULL, 70);
INSERT INTO `choice` VALUES (279, b'1', '数据', NULL, 70);
INSERT INTO `choice` VALUES (280, b'0', '数据流', NULL, 71);
INSERT INTO `choice` VALUES (281, b'0', '数据存储', NULL, 71);
INSERT INTO `choice` VALUES (282, b'0', '加工', NULL, 71);
INSERT INTO `choice` VALUES (283, b'1', '源点与终点', NULL, 71);
INSERT INTO `choice` VALUES (284, b'1', '要让软件做什么', NULL, 72);
INSERT INTO `choice` VALUES (285, b'0', '要给该软件提供哪些信息', NULL, 72);
INSERT INTO `choice` VALUES (286, b'0', '要求软件工作效率怎样', NULL, 72);
INSERT INTO `choice` VALUES (287, b'0', '要让软件具有何种结构', NULL, 72);
INSERT INTO `choice` VALUES (288, b'0', '项目开发计划', NULL, 73);
INSERT INTO `choice` VALUES (289, b'0', '可行性分析报告', NULL, 73);
INSERT INTO `choice` VALUES (290, b'1', '需求规格说明书', NULL, 73);
INSERT INTO `choice` VALUES (291, b'0', '设计说明书', NULL, 73);
INSERT INTO `choice` VALUES (292, b'0', '系统的控制流程', NULL, 74);
INSERT INTO `choice` VALUES (293, b'0', '系统的数据结构', NULL, 74);
INSERT INTO `choice` VALUES (294, b'0', '系统的基本加工', NULL, 74);
INSERT INTO `choice` VALUES (295, b'1', '系统的功能', NULL, 74);
INSERT INTO `choice` VALUES (296, b'1', '获得当前系统的物理模型，抽象出当前系统的逻辑模型，建立目标系统的逻辑模型', NULL, 75);
INSERT INTO `choice` VALUES (297, b'0', '获得当前系统的物理模型，抽象出目标系统的逻辑模型，建立目标系统的物理模型', NULL, 75);
INSERT INTO `choice` VALUES (298, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，抽象出目标系统的逻辑模型', NULL, 75);
INSERT INTO `choice` VALUES (299, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，建立目标系统的物理模型', NULL, 75);
INSERT INTO `choice` VALUES (300, b'0', '结构化语言', NULL, 76);
INSERT INTO `choice` VALUES (301, b'0', '判定树', NULL, 76);
INSERT INTO `choice` VALUES (302, b'0', '判定表', NULL, 76);
INSERT INTO `choice` VALUES (303, b'1', '流程图', NULL, 76);
INSERT INTO `choice` VALUES (304, b'0', '程序流程图', NULL, 77);
INSERT INTO `choice` VALUES (305, b'0', '实体联系图', NULL, 77);
INSERT INTO `choice` VALUES (306, b'1', '数据流图', NULL, 77);
INSERT INTO `choice` VALUES (307, b'0', '结构图', NULL, 77);
INSERT INTO `choice` VALUES (308, b'0', '自底向上逐步抽象', NULL, 78);
INSERT INTO `choice` VALUES (309, b'0', '自底向上逐步分解', NULL, 78);
INSERT INTO `choice` VALUES (310, b'1', '自顶向下逐步分解', NULL, 78);
INSERT INTO `choice` VALUES (311, b'0', '自顶向下逐步抽象', NULL, 78);
INSERT INTO `choice` VALUES (312, b'0', '每个数据流必须用名词或名词短语命名', NULL, 79);
INSERT INTO `choice` VALUES (313, b'0', '每个加工必须有名字，通常是动词短语', NULL, 79);
INSERT INTO `choice` VALUES (314, b'1', '每个数据存储必须用名词或名词短语', NULL, 79);
INSERT INTO `choice` VALUES (315, b'0', '每个数据源点或终点必须有名字', NULL, 79);
INSERT INTO `choice` VALUES (316, b'0', '判定表能够把在什么条件下系统应做什么动作准确无误地表示出来', NULL, 80);
INSERT INTO `choice` VALUES (317, b'1', '判定表能够描述循环的处理特性', NULL, 80);
INSERT INTO `choice` VALUES (318, b'0', '结构化语言同样能够描述循环的处理特性', NULL, 80);
INSERT INTO `choice` VALUES (319, b'0', '判定树是判定表的变形，一般情况下它比判定表更直观，且易于理解和使用', NULL, 80);
INSERT INTO `choice` VALUES (320, b'1', '面向数据结构的分析方法', NULL, 81);
INSERT INTO `choice` VALUES (321, b'0', '面向时序问题的分析方法', NULL, 81);
INSERT INTO `choice` VALUES (322, b'0', '面向事务的分析方法', NULL, 81);
INSERT INTO `choice` VALUES (323, b'1', '数据流图', NULL, 82);
INSERT INTO `choice` VALUES (324, b'0', '数据字典', NULL, 82);
INSERT INTO `choice` VALUES (325, b'0', '判定表', NULL, 82);
INSERT INTO `choice` VALUES (326, b'0', '判定树', NULL, 82);
INSERT INTO `choice` VALUES (327, b'0', '对象', NULL, 83);
INSERT INTO `choice` VALUES (328, b'0', '数据结构', NULL, 83);
INSERT INTO `choice` VALUES (329, b'1', '数据流', NULL, 83);
INSERT INTO `choice` VALUES (330, b'0', '结构图', NULL, 83);
INSERT INTO `choice` VALUES (331, b'0', '层次图', NULL, 84);
INSERT INTO `choice` VALUES (332, b'1', '数据字典', NULL, 84);
INSERT INTO `choice` VALUES (333, b'0', '数据流图', NULL, 84);
INSERT INTO `choice` VALUES (334, b'0', 'IPO 图', NULL, 84);
INSERT INTO `choice` VALUES (335, b'0', 'IPO 图', NULL, 85);
INSERT INTO `choice` VALUES (336, b'1', 'PDL 图', NULL, 85);
INSERT INTO `choice` VALUES (337, b'0', '数据字典', NULL, 85);
INSERT INTO `choice` VALUES (338, b'0', '层次图', NULL, 85);
INSERT INTO `choice` VALUES (339, b'0', '问题分解', NULL, 86);
INSERT INTO `choice` VALUES (340, b'0', '可靠性与安全性要求', NULL, 86);
INSERT INTO `choice` VALUES (341, b'1', '结构化程序设计', NULL, 86);
INSERT INTO `choice` VALUES (342, b'0', '确定逻辑模型', NULL, 86);
INSERT INTO `choice` VALUES (343, b'1', '软件开发工作的基础', NULL, 87);
INSERT INTO `choice` VALUES (344, b'0', '软件生存周期的开始', NULL, 87);
INSERT INTO `choice` VALUES (345, b'0', '由系统分析员单独完成的', NULL, 87);
INSERT INTO `choice` VALUES (346, b'0', '由用户自己单独完成的', NULL, 87);
INSERT INTO `choice` VALUES (347, b'1', '控制流', NULL, 88);
INSERT INTO `choice` VALUES (348, b'0', '数据流', NULL, 88);
INSERT INTO `choice` VALUES (349, b'0', '程序流', NULL, 88);
INSERT INTO `choice` VALUES (350, b'0', '指令流', NULL, 88);
INSERT INTO `choice` VALUES (351, b'0', '互相排斥', NULL, 89);
INSERT INTO `choice` VALUES (352, b'1', '互相补充', NULL, 89);
INSERT INTO `choice` VALUES (353, b'0', '独立使用', NULL, 89);
INSERT INTO `choice` VALUES (354, b'0', '交替使用', NULL, 89);
INSERT INTO `choice` VALUES (355, b'0', '严格定义需求', NULL, 90);
INSERT INTO `choice` VALUES (356, b'0', '划分开发阶段', NULL, 90);
INSERT INTO `choice` VALUES (357, b'1', '提供运行模型', NULL, 90);
INSERT INTO `choice` VALUES (358, b'0', '制定规范文档', NULL, 90);
INSERT INTO `choice` VALUES (359, b'1', '自顶向下逐层分解的分析方法', NULL, 91);
INSERT INTO `choice` VALUES (360, b'0', '自底向上逐层分解的分析方法', NULL, 91);
INSERT INTO `choice` VALUES (361, b'0', '面向对象的分析方法', NULL, 91);
INSERT INTO `choice` VALUES (362, b'0', '以上都不是', NULL, 91);
INSERT INTO `choice` VALUES (363, b'0', '顺序结构', NULL, 92);
INSERT INTO `choice` VALUES (364, b'0', '条件结构', NULL, 92);
INSERT INTO `choice` VALUES (365, b'0', '选择结构', NULL, 92);
INSERT INTO `choice` VALUES (366, b'1', '嵌套结构', NULL, 92);
INSERT INTO `choice` VALUES (367, b'0', 'FD 图', NULL, 93);
INSERT INTO `choice` VALUES (368, b'0', 'PAD 图', NULL, 93);
INSERT INTO `choice` VALUES (369, b'0', 'IPO 图', NULL, 93);
INSERT INTO `choice` VALUES (370, b'1', '数据字典', NULL, 93);
INSERT INTO `choice` VALUES (371, b'0', 'FD 图', NULL, 94);
INSERT INTO `choice` VALUES (372, b'1', 'PAD 图', NULL, 94);
INSERT INTO `choice` VALUES (373, b'0', '结构化英语', NULL, 94);
INSERT INTO `choice` VALUES (374, b'0', '判定表', NULL, 94);
INSERT INTO `choice` VALUES (375, b'0', '对象', NULL, 95);
INSERT INTO `choice` VALUES (376, b'0', '数据流', NULL, 95);
INSERT INTO `choice` VALUES (377, b'1', '数据结构', NULL, 95);
INSERT INTO `choice` VALUES (378, b'0', '控制结构', NULL, 95);
INSERT INTO `choice` VALUES (379, b'0', '分支结构、选择结构和控制结构', NULL, 96);
INSERT INTO `choice` VALUES (380, b'1', '顺序结构、选择结构和循环结构', NULL, 96);
INSERT INTO `choice` VALUES (381, b'0', '顺序结构、分支结构和嵌套结构', NULL, 96);
INSERT INTO `choice` VALUES (382, b'0', '顺序结构、选择结构和重复结构', NULL, 96);
INSERT INTO `choice` VALUES (383, b'0', '原型化方法', NULL, 97);
INSERT INTO `choice` VALUES (384, b'1', '结构化方法', NULL, 97);
INSERT INTO `choice` VALUES (385, b'0', '面向对象方法', NULL, 97);
INSERT INTO `choice` VALUES (386, b'0', '功能分解方法', NULL, 97);
INSERT INTO `choice` VALUES (387, b'0', '功能需求', NULL, 98);
INSERT INTO `choice` VALUES (388, b'0', '非功能需求', NULL, 98);
INSERT INTO `choice` VALUES (389, b'0', '性能需求', NULL, 98);
INSERT INTO `choice` VALUES (390, b'1', '功能需求和非功能需求', NULL, 98);
INSERT INTO `choice` VALUES (391, b'1', '数据流图', NULL, 99);
INSERT INTO `choice` VALUES (392, b'0', '程序框图', NULL, 99);
INSERT INTO `choice` VALUES (393, b'0', '软件结构', NULL, 99);
INSERT INTO `choice` VALUES (394, b'0', '方框图', NULL, 99);
INSERT INTO `choice` VALUES (395, b'1', '是', NULL, 100);
INSERT INTO `choice` VALUES (396, b'0', '否', NULL, 100);
INSERT INTO `choice` VALUES (397, b'1', '是', NULL, 101);
INSERT INTO `choice` VALUES (398, b'0', '否', NULL, 101);
INSERT INTO `choice` VALUES (399, b'0', '是', NULL, 102);
INSERT INTO `choice` VALUES (400, b'1', '否', NULL, 102);
INSERT INTO `choice` VALUES (401, b'0', '是', NULL, 103);
INSERT INTO `choice` VALUES (402, b'1', '否', NULL, 103);
INSERT INTO `choice` VALUES (403, b'0', '是', NULL, 104);
INSERT INTO `choice` VALUES (404, b'1', '否', NULL, 104);
INSERT INTO `choice` VALUES (405, b'0', '是', NULL, 105);
INSERT INTO `choice` VALUES (406, b'1', '否', NULL, 105);
INSERT INTO `choice` VALUES (407, b'0', '是', NULL, 106);
INSERT INTO `choice` VALUES (408, b'1', '否', NULL, 106);
INSERT INTO `choice` VALUES (409, b'0', '是', NULL, 107);
INSERT INTO `choice` VALUES (410, b'1', '否', NULL, 107);
INSERT INTO `choice` VALUES (411, b'1', '是', NULL, 108);
INSERT INTO `choice` VALUES (412, b'0', '否', NULL, 108);
INSERT INTO `choice` VALUES (413, b'1', '是', NULL, 109);
INSERT INTO `choice` VALUES (414, b'0', '否', NULL, 109);
INSERT INTO `choice` VALUES (415, b'1', '建构性测试', NULL, 110);
INSERT INTO `choice` VALUES (416, b'1', '系统测试', NULL, 110);
INSERT INTO `choice` VALUES (417, b'1', '专项测试', NULL, 110);
INSERT INTO `choice` VALUES (418, b'0', '单元测试', NULL, 110);
INSERT INTO `choice` VALUES (419, b'0', '组件测试', NULL, 110);
INSERT INTO `choice` VALUES (420, b'0', '集成测试', NULL, 110);
INSERT INTO `choice` VALUES (421, b'1', '测试用例覆盖', NULL, 111);
INSERT INTO `choice` VALUES (422, b'1', '输入覆盖', NULL, 111);
INSERT INTO `choice` VALUES (423, b'1', '输出覆盖', NULL, 111);
INSERT INTO `choice` VALUES (424, b'0', '分支覆盖', NULL, 111);
INSERT INTO `choice` VALUES (425, b'0', '语句覆盖', NULL, 111);
INSERT INTO `choice` VALUES (426, b'0', '条件覆盖', NULL, 111);
INSERT INTO `choice` VALUES (427, b'1', '分析', NULL, 112);
INSERT INTO `choice` VALUES (428, b'1', '设计', NULL, 112);
INSERT INTO `choice` VALUES (429, b'1', '编码', NULL, 112);
INSERT INTO `choice` VALUES (430, b'1', '测试', NULL, 112);
INSERT INTO `choice` VALUES (431, b'0', '需求调研', NULL, 112);
INSERT INTO `choice` VALUES (432, b'0', '实施', NULL, 112);
INSERT INTO `choice` VALUES (433, b'1', 'alpha 测试需要用户代表参加', NULL, 113);
INSERT INTO `choice` VALUES (434, b'0', 'alpha 测试不需要用户代表参加', NULL, 113);
INSERT INTO `choice` VALUES (435, b'0', 'alpha 测试是系统测试的一种', NULL, 113);
INSERT INTO `choice` VALUES (436, b'1', 'alpha 测试是验收测试的一种', NULL, 113);
INSERT INTO `choice` VALUES (437, b'1', '软件需求分析说明书中定义的所有功能已全部实现， 性能指标全部达到要求。', NULL, 114);
INSERT INTO `choice` VALUES (438, b'1', '所有测试项没有残余一级、二级和三级错误。', NULL, 114);
INSERT INTO `choice` VALUES (439, b'1', '立项审批表、需求分析文档、设计文档和编码实现一致。', NULL, 114);
INSERT INTO `choice` VALUES (440, b'1', '验收测试工件齐全。', NULL, 114);
INSERT INTO `choice` VALUES (441, b'1', '使测试工作顺利进行', NULL, 115);
INSERT INTO `choice` VALUES (442, b'1', '使项目参与人员沟通更舒畅', NULL, 115);
INSERT INTO `choice` VALUES (443, b'1', '使测试工作更加系统化', NULL, 115);
INSERT INTO `choice` VALUES (444, b'0', '软件工程以及软件过程的需要', NULL, 115);
INSERT INTO `choice` VALUES (445, b'0', '软件过程规范化的要求', NULL, 115);
INSERT INTO `choice` VALUES (446, b'0', '控制软件质量', NULL, 115);
INSERT INTO `choice` VALUES (447, b'0', '代码', NULL, 116);
INSERT INTO `choice` VALUES (448, b'1', '模块', NULL, 116);
INSERT INTO `choice` VALUES (449, b'0', '数据库', NULL, 116);
INSERT INTO `choice` VALUES (450, b'0', '界面', NULL, 116);
INSERT INTO `choice` VALUES (451, b'0', '数据库是独立系统，不需要操作系统支持', NULL, 117);
INSERT INTO `choice` VALUES (452, b'0', '数据库技术的根本目标是解决数据库共享问题', NULL, 117);
INSERT INTO `choice` VALUES (453, b'1', '数据库设计指的是数据库管理系统', NULL, 117);
INSERT INTO `choice` VALUES (454, b'0', '在数据库系统中，数据的物理结构必须与逻辑结构一致', NULL, 117);
INSERT INTO `choice` VALUES (455, b'0', '需求解释有错误', NULL, 118);
INSERT INTO `choice` VALUES (456, b'0', '设计说明有误', NULL, 118);
INSERT INTO `choice` VALUES (457, b'0', '软件代码有误', NULL, 118);
INSERT INTO `choice` VALUES (458, b'1', '操作系统有误', NULL, 118);
INSERT INTO `choice` VALUES (459, b'1', '面向数据结构的分析方法', NULL, 119);
INSERT INTO `choice` VALUES (460, b'0', '面向时序问题的分析方法', NULL, 119);
INSERT INTO `choice` VALUES (461, b'0', '面向事务的分析方法', NULL, 119);
INSERT INTO `choice` VALUES (462, b'1', '数据流图', NULL, 120);
INSERT INTO `choice` VALUES (463, b'0', '数据字典', NULL, 120);
INSERT INTO `choice` VALUES (464, b'0', '判定表', NULL, 120);
INSERT INTO `choice` VALUES (465, b'0', '判定树', NULL, 120);
INSERT INTO `choice` VALUES (466, b'0', '对象', NULL, 121);
INSERT INTO `choice` VALUES (467, b'0', '数据结构', NULL, 121);
INSERT INTO `choice` VALUES (468, b'1', '数据流', NULL, 121);
INSERT INTO `choice` VALUES (469, b'0', '结构图', NULL, 121);
INSERT INTO `choice` VALUES (470, b'0', '层次图', NULL, 122);
INSERT INTO `choice` VALUES (471, b'1', '数据字典', NULL, 122);
INSERT INTO `choice` VALUES (472, b'0', '数据流图', NULL, 122);
INSERT INTO `choice` VALUES (473, b'0', 'IPO 图', NULL, 122);
INSERT INTO `choice` VALUES (474, b'0', 'IPO 图', NULL, 123);
INSERT INTO `choice` VALUES (475, b'1', 'PDL 图', NULL, 123);
INSERT INTO `choice` VALUES (476, b'0', '数据字典', NULL, 123);
INSERT INTO `choice` VALUES (477, b'0', '层次图', NULL, 123);
INSERT INTO `choice` VALUES (478, b'0', '问题分解', NULL, 124);
INSERT INTO `choice` VALUES (479, b'0', '可靠性与安全性要求', NULL, 124);
INSERT INTO `choice` VALUES (480, b'1', '结构化程序设计', NULL, 124);
INSERT INTO `choice` VALUES (481, b'0', '确定逻辑模型', NULL, 124);
INSERT INTO `choice` VALUES (482, b'1', '软件开发工作的基础', NULL, 125);
INSERT INTO `choice` VALUES (483, b'0', '软件生存周期的开始', NULL, 125);
INSERT INTO `choice` VALUES (484, b'0', '由系统分析员单独完成的', NULL, 125);
INSERT INTO `choice` VALUES (485, b'0', '由用户自己单独完成的', NULL, 125);
INSERT INTO `choice` VALUES (486, b'1', '控制流', NULL, 126);
INSERT INTO `choice` VALUES (487, b'0', '数据流', NULL, 126);
INSERT INTO `choice` VALUES (488, b'0', '程序流', NULL, 126);
INSERT INTO `choice` VALUES (489, b'0', '指令流', NULL, 126);
INSERT INTO `choice` VALUES (490, b'0', '互相排斥', NULL, 127);
INSERT INTO `choice` VALUES (491, b'1', '互相补充', NULL, 127);
INSERT INTO `choice` VALUES (492, b'0', '独立使用', NULL, 127);
INSERT INTO `choice` VALUES (493, b'0', '交替使用', NULL, 127);
INSERT INTO `choice` VALUES (494, b'0', '严格定义需求', NULL, 128);
INSERT INTO `choice` VALUES (495, b'0', '划分开发阶段', NULL, 128);
INSERT INTO `choice` VALUES (496, b'1', '提供运行模型', NULL, 128);
INSERT INTO `choice` VALUES (497, b'0', '制定规范文档', NULL, 128);
INSERT INTO `choice` VALUES (498, b'1', '自顶向下逐层分解的分析方法', NULL, 129);
INSERT INTO `choice` VALUES (499, b'0', '自底向上逐层分解的分析方法', NULL, 129);
INSERT INTO `choice` VALUES (500, b'0', '面向对象的分析方法', NULL, 129);
INSERT INTO `choice` VALUES (501, b'0', '以上都不是', NULL, 129);
INSERT INTO `choice` VALUES (502, b'0', '顺序结构', NULL, 130);
INSERT INTO `choice` VALUES (503, b'0', '条件结构', NULL, 130);
INSERT INTO `choice` VALUES (504, b'0', '选择结构', NULL, 130);
INSERT INTO `choice` VALUES (505, b'1', '嵌套结构', NULL, 130);
INSERT INTO `choice` VALUES (506, b'1', '是', NULL, 131);
INSERT INTO `choice` VALUES (507, b'0', '否', NULL, 131);
INSERT INTO `choice` VALUES (508, b'0', '是', NULL, 132);
INSERT INTO `choice` VALUES (509, b'1', '否', NULL, 132);
INSERT INTO `choice` VALUES (510, b'0', '是', NULL, 133);
INSERT INTO `choice` VALUES (511, b'1', '否', NULL, 133);
INSERT INTO `choice` VALUES (512, b'1', 'alpha 测试需要用户代表参加', NULL, 134);
INSERT INTO `choice` VALUES (513, b'0', 'alpha 测试不需要用户代表参加', NULL, 134);
INSERT INTO `choice` VALUES (514, b'0', 'alpha 测试是系统测试的一种', NULL, 134);
INSERT INTO `choice` VALUES (515, b'1', 'alpha 测试是验收测试的一种', NULL, 134);
INSERT INTO `choice` VALUES (516, b'1', '软件需求分析说明书中定义的所有功能已全部实现， 性能指标全部达到要求。', NULL, 135);
INSERT INTO `choice` VALUES (517, b'1', '所有测试项没有残余一级、二级和三级错误。', NULL, 135);
INSERT INTO `choice` VALUES (518, b'1', '立项审批表、需求分析文档、设计文档和编码实现一致。', NULL, 135);
INSERT INTO `choice` VALUES (519, b'1', '验收测试工件齐全。', NULL, 135);
INSERT INTO `choice` VALUES (520, b'0', '需求分析', NULL, 136);
INSERT INTO `choice` VALUES (521, b'0', '结构设计', NULL, 136);
INSERT INTO `choice` VALUES (522, b'0', '程序编制', NULL, 136);
INSERT INTO `choice` VALUES (523, b'1', '软件维护', NULL, 136);
INSERT INTO `choice` VALUES (524, b'1', '研制', NULL, 137);
INSERT INTO `choice` VALUES (525, b'0', '拷贝', NULL, 137);
INSERT INTO `choice` VALUES (526, b'0', '再生产', NULL, 137);
INSERT INTO `choice` VALUES (527, b'0', '复制', NULL, 137);
INSERT INTO `choice` VALUES (528, b'0', '喷泉模型', NULL, 138);
INSERT INTO `choice` VALUES (529, b'0', '增量模型', NULL, 138);
INSERT INTO `choice` VALUES (530, b'1', '瀑布模型', NULL, 138);
INSERT INTO `choice` VALUES (531, b'0', '螺旋模型', NULL, 138);
INSERT INTO `choice` VALUES (532, b'0', '详细设计', NULL, 139);
INSERT INTO `choice` VALUES (533, b'1', '可行性分析和项目开发计划', NULL, 139);
INSERT INTO `choice` VALUES (534, b'0', '概要设计', NULL, 139);
INSERT INTO `choice` VALUES (535, b'0', '软件测试', NULL, 139);
INSERT INTO `choice` VALUES (536, b'0', '有形', NULL, 140);
INSERT INTO `choice` VALUES (537, b'0', '消耗', NULL, 140);
INSERT INTO `choice` VALUES (538, b'1', '逻辑', NULL, 140);
INSERT INTO `choice` VALUES (539, b'0', '文档', NULL, 140);
INSERT INTO `choice` VALUES (540, b'0', '原型模型', NULL, 141);
INSERT INTO `choice` VALUES (541, b'0', '螺旋模型', NULL, 141);
INSERT INTO `choice` VALUES (542, b'1', '基于知识的智能模型', NULL, 141);
INSERT INTO `choice` VALUES (543, b'0', '喷泉模型', NULL, 141);
INSERT INTO `choice` VALUES (544, b'0', '概要设计', NULL, 142);
INSERT INTO `choice` VALUES (545, b'1', '详细设计', NULL, 142);
INSERT INTO `choice` VALUES (546, b'0', '编码', NULL, 142);
INSERT INTO `choice` VALUES (547, b'0', '测试', NULL, 142);
INSERT INTO `choice` VALUES (548, b'1', '原型模型', NULL, 143);
INSERT INTO `choice` VALUES (549, b'0', '瀑布模型', NULL, 143);
INSERT INTO `choice` VALUES (550, b'0', '基于知识的智能模型', NULL, 143);
INSERT INTO `choice` VALUES (551, b'0', '变换模型', NULL, 143);
INSERT INTO `choice` VALUES (552, b'0', '原型模型', NULL, 144);
INSERT INTO `choice` VALUES (553, b'0', '瀑布模型', NULL, 144);
INSERT INTO `choice` VALUES (554, b'1', '喷泉模型', NULL, 144);
INSERT INTO `choice` VALUES (555, b'0', '螺旋模型', NULL, 144);
INSERT INTO `choice` VALUES (556, b'0', '原型模型', NULL, 145);
INSERT INTO `choice` VALUES (557, b'0', '瀑布模型', NULL, 145);
INSERT INTO `choice` VALUES (558, b'0', '喷泉模型', NULL, 145);
INSERT INTO `choice` VALUES (559, b'1', '螺旋模型', NULL, 145);
INSERT INTO `choice` VALUES (560, b'0', '可修改性', NULL, 146);
INSERT INTO `choice` VALUES (561, b'0', '可靠性', NULL, 146);
INSERT INTO `choice` VALUES (562, b'1', '可适应性', NULL, 146);
INSERT INTO `choice` VALUES (563, b'0', '可重用性', NULL, 146);
INSERT INTO `choice` VALUES (564, b'0', '可移植性', NULL, 147);
INSERT INTO `choice` VALUES (565, b'1', '可重用性', NULL, 147);
INSERT INTO `choice` VALUES (566, b'0', '容错性', NULL, 147);
INSERT INTO `choice` VALUES (567, b'0', '可适应性', NULL, 147);
INSERT INTO `choice` VALUES (568, b'1', '可理解性', NULL, 148);
INSERT INTO `choice` VALUES (569, b'0', '可靠性', NULL, 148);
INSERT INTO `choice` VALUES (570, b'0', '可适应性', NULL, 148);
INSERT INTO `choice` VALUES (571, b'0', '可重用性', NULL, 148);
INSERT INTO `choice` VALUES (572, b'0', '可理解性', NULL, 149);
INSERT INTO `choice` VALUES (573, b'1', '可维护性', NULL, 149);
INSERT INTO `choice` VALUES (574, b'0', '可适应性', NULL, 149);
INSERT INTO `choice` VALUES (575, b'0', '可重用性', NULL, 149);
INSERT INTO `choice` VALUES (576, b'0', '可理解性', NULL, 150);
INSERT INTO `choice` VALUES (577, b'0', '可修改性', NULL, 150);
INSERT INTO `choice` VALUES (578, b'1', '可移植性', NULL, 150);
INSERT INTO `choice` VALUES (579, b'0', '可重用性', NULL, 150);
INSERT INTO `choice` VALUES (580, b'0', '有效性', NULL, 151);
INSERT INTO `choice` VALUES (581, b'0', '可适应性', NULL, 151);
INSERT INTO `choice` VALUES (582, b'0', '正确性', NULL, 151);
INSERT INTO `choice` VALUES (583, b'1', '可靠性', NULL, 151);
INSERT INTO `choice` VALUES (584, b'1', '可修改性', NULL, 152);
INSERT INTO `choice` VALUES (585, b'0', '可适应性', NULL, 152);
INSERT INTO `choice` VALUES (586, b'0', '可维护性', NULL, 152);
INSERT INTO `choice` VALUES (587, b'0', '可移植性', NULL, 152);
INSERT INTO `choice` VALUES (588, b'0', '可理解性', NULL, 153);
INSERT INTO `choice` VALUES (589, b'0', '可互操作性', NULL, 153);
INSERT INTO `choice` VALUES (590, b'1', '可维护性', NULL, 153);
INSERT INTO `choice` VALUES (591, b'0', '可追踪性', NULL, 153);
INSERT INTO `choice` VALUES (592, b'0', '可理解性', NULL, 154);
INSERT INTO `choice` VALUES (593, b'0', '可互操作性', NULL, 154);
INSERT INTO `choice` VALUES (594, b'1', '可追踪性', NULL, 154);
INSERT INTO `choice` VALUES (595, b'0', '可维护性', NULL, 154);
INSERT INTO `choice` VALUES (596, b'0', '有效性', NULL, 155);
INSERT INTO `choice` VALUES (597, b'0', '可互操作性', NULL, 155);
INSERT INTO `choice` VALUES (598, b'0', '可追踪性', NULL, 155);
INSERT INTO `choice` VALUES (599, b'1', '可维护性', NULL, 155);
INSERT INTO `choice` VALUES (600, b'1', '可适应性', NULL, 156);
INSERT INTO `choice` VALUES (601, b'0', '可互操作性', NULL, 156);
INSERT INTO `choice` VALUES (602, b'0', '可追踪性', NULL, 156);
INSERT INTO `choice` VALUES (603, b'0', '有效性', NULL, 156);
INSERT INTO `choice` VALUES (604, b'0', '有效性', NULL, 157);
INSERT INTO `choice` VALUES (605, b'1', '可移植性', NULL, 157);
INSERT INTO `choice` VALUES (606, b'0', '可追踪性', NULL, 157);
INSERT INTO `choice` VALUES (607, b'0', '可靠性', NULL, 157);
INSERT INTO `choice` VALUES (608, b'0', '有效性', NULL, 158);
INSERT INTO `choice` VALUES (609, b'0', '可互操作性', NULL, 158);
INSERT INTO `choice` VALUES (610, b'1', '可靠性', NULL, 158);
INSERT INTO `choice` VALUES (611, b'0', '可追踪性', NULL, 158);
INSERT INTO `choice` VALUES (612, b'0', '组装测试计划', NULL, 159);
INSERT INTO `choice` VALUES (613, b'0', '单元测试计划', NULL, 159);
INSERT INTO `choice` VALUES (614, b'0', '软件总体设计', NULL, 159);
INSERT INTO `choice` VALUES (615, b'1', '验收测试计划', NULL, 159);
INSERT INTO `choice` VALUES (616, b'1', '组装测试计划', NULL, 160);
INSERT INTO `choice` VALUES (617, b'0', '单元测试计划', NULL, 160);
INSERT INTO `choice` VALUES (618, b'0', '初步用户手册', NULL, 160);
INSERT INTO `choice` VALUES (619, b'0', '验收测试计划', NULL, 160);
INSERT INTO `choice` VALUES (620, b'0', '组装测试计划', NULL, 161);
INSERT INTO `choice` VALUES (621, b'1', '单元测试计划', NULL, 161);
INSERT INTO `choice` VALUES (622, b'0', '初步用户手册', NULL, 161);
INSERT INTO `choice` VALUES (623, b'0', '验收测试计划', NULL, 161);
INSERT INTO `choice` VALUES (624, b'0', '组装测试计划', NULL, 162);
INSERT INTO `choice` VALUES (625, b'0', '绘制程序流程图', NULL, 162);
INSERT INTO `choice` VALUES (626, b'1', '单元测试', NULL, 162);
INSERT INTO `choice` VALUES (627, b'0', '验收测试计划', NULL, 162);
INSERT INTO `choice` VALUES (628, b'0', '项目开发总结报告', NULL, 163);
INSERT INTO `choice` VALUES (629, b'0', '验收测试计划', NULL, 163);
INSERT INTO `choice` VALUES (630, b'0', '需求规格说明书', NULL, 163);
INSERT INTO `choice` VALUES (631, b'1', '最终用户手册', NULL, 163);
INSERT INTO `choice` VALUES (632, b'0', '项目开发计划', NULL, 164);
INSERT INTO `choice` VALUES (633, b'0', '可行性分析报告', NULL, 164);
INSERT INTO `choice` VALUES (634, b'1', '需求规格说明书', NULL, 164);
INSERT INTO `choice` VALUES (635, b'0', '设计说明书', NULL, 164);
INSERT INTO `choice` VALUES (636, b'1', '让软件做什么', NULL, 165);
INSERT INTO `choice` VALUES (637, b'0', '要给软件提供哪些信息', NULL, 165);
INSERT INTO `choice` VALUES (638, b'0', '要求软件工作效率怎样', NULL, 165);
INSERT INTO `choice` VALUES (639, b'0', '让软件具有何种结构', NULL, 165);
INSERT INTO `choice` VALUES (640, b'0', '一个输入流或一个输出流', NULL, 166);
INSERT INTO `choice` VALUES (641, b'1', '一个输入流和一个输出流', NULL, 166);
INSERT INTO `choice` VALUES (642, b'0', '一个输入流', NULL, 166);
INSERT INTO `choice` VALUES (643, b'0', '一个输出流', NULL, 166);
INSERT INTO `choice` VALUES (644, b'0', '数据流', NULL, 167);
INSERT INTO `choice` VALUES (645, b'0', '数据存储', NULL, 167);
INSERT INTO `choice` VALUES (646, b'0', '加工', NULL, 167);
INSERT INTO `choice` VALUES (647, b'1', '源点与终点', NULL, 167);
INSERT INTO `choice` VALUES (648, b'0', '细节', NULL, 168);
INSERT INTO `choice` VALUES (649, b'1', '输入与输出', NULL, 168);
INSERT INTO `choice` VALUES (650, b'0', '软件的作用', NULL, 168);
INSERT INTO `choice` VALUES (651, b'0', '绘制的时间', NULL, 168);
INSERT INTO `choice` VALUES (652, b'0', '主要功能', NULL, 169);
INSERT INTO `choice` VALUES (653, b'1', '算法的详细过程', NULL, 169);
INSERT INTO `choice` VALUES (654, b'0', '用户界面和运行环境', NULL, 169);
INSERT INTO `choice` VALUES (655, b'0', '软件性能', NULL, 169);
INSERT INTO `choice` VALUES (656, b'0', '软件设计的依据', NULL, 170);
INSERT INTO `choice` VALUES (657, b'0', '用户与开发人员对软件要做什么的共同理解', NULL, 170);
INSERT INTO `choice` VALUES (658, b'0', '软件验收的依据', NULL, 170);
INSERT INTO `choice` VALUES (659, b'1', '软件可行性研究的依据', NULL, 170);
INSERT INTO `choice` VALUES (660, b'0', '系统的控制流程', NULL, 171);
INSERT INTO `choice` VALUES (661, b'0', '系统的数据结构', NULL, 171);
INSERT INTO `choice` VALUES (662, b'0', '系统的基本加工', NULL, 171);
INSERT INTO `choice` VALUES (663, b'1', '系统的功能', NULL, 171);
INSERT INTO `choice` VALUES (664, b'0', '某些加工的数据接口', NULL, 172);
INSERT INTO `choice` VALUES (665, b'0', '某个加工的特定输入', NULL, 172);
INSERT INTO `choice` VALUES (666, b'0', '某个加工的特定输出', NULL, 172);
INSERT INTO `choice` VALUES (667, b'1', '某些加工的数据接口或某个加工的特定输入输出', NULL, 172);
INSERT INTO `choice` VALUES (668, b'1', '必须一致', NULL, 173);
INSERT INTO `choice` VALUES (669, b'0', '数目必须相等', NULL, 173);
INSERT INTO `choice` VALUES (670, b'0', '名字必须相同', NULL, 173);
INSERT INTO `choice` VALUES (671, b'0', '数目必须不等', NULL, 173);
INSERT INTO `choice` VALUES (672, b'0', '结构化语言', NULL, 174);
INSERT INTO `choice` VALUES (673, b'0', '判定表', NULL, 174);
INSERT INTO `choice` VALUES (674, b'0', '判定树', NULL, 174);
INSERT INTO `choice` VALUES (675, b'1', '流程图', NULL, 174);
INSERT INTO `choice` VALUES (676, b'1', '获得当前系统的物理模型，抽象出当前系统的逻辑模型，建立目标系统的逻辑模型', NULL, 175);
INSERT INTO `choice` VALUES (677, b'0', '获得当前系统的物理模型，抽象出当前系统的逻辑模型，建立目标系统的物理模型', NULL, 175);
INSERT INTO `choice` VALUES (678, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，抽象出目标系统的逻辑模型', NULL, 175);
INSERT INTO `choice` VALUES (679, b'0', '获得当前系统的逻辑模型，建立当前系统的物理模型，建立目标系统的物理模型', NULL, 175);
INSERT INTO `choice` VALUES (680, b'0', '自底向上逐步抽象', NULL, 176);
INSERT INTO `choice` VALUES (681, b'0', '自底向上逐步分解', NULL, 176);
INSERT INTO `choice` VALUES (682, b'1', '自顶向下逐步分解', NULL, 176);
INSERT INTO `choice` VALUES (683, b'0', '自顶向上抽象', NULL, 176);
INSERT INTO `choice` VALUES (684, b'1', '数据流图', NULL, 177);
INSERT INTO `choice` VALUES (685, b'0', '数据字典', NULL, 177);
INSERT INTO `choice` VALUES (686, b'0', '判定表', NULL, 177);
INSERT INTO `choice` VALUES (687, b'0', '判定树', NULL, 177);
INSERT INTO `choice` VALUES (688, b'0', '对象', NULL, 178);
INSERT INTO `choice` VALUES (689, b'0', '数据结构', NULL, 178);
INSERT INTO `choice` VALUES (690, b'1', '数据流', NULL, 178);
INSERT INTO `choice` VALUES (691, b'0', '结构图', NULL, 178);
INSERT INTO `choice` VALUES (692, b'0', '层次图', NULL, 179);
INSERT INTO `choice` VALUES (693, b'1', '数据字典', NULL, 179);
INSERT INTO `choice` VALUES (694, b'0', '数据流图', NULL, 179);
INSERT INTO `choice` VALUES (695, b'0', 'IPO 图', NULL, 179);
INSERT INTO `choice` VALUES (696, b'0', 'IPO 图', NULL, 180);
INSERT INTO `choice` VALUES (697, b'1', 'PDL 图', NULL, 180);
INSERT INTO `choice` VALUES (698, b'0', '数据字典', NULL, 180);
INSERT INTO `choice` VALUES (699, b'0', '层次图', NULL, 180);
INSERT INTO `choice` VALUES (700, b'0', '问题分解', NULL, 181);
INSERT INTO `choice` VALUES (701, b'0', '可靠性与安全性要求', NULL, 181);
INSERT INTO `choice` VALUES (702, b'1', '结构化程序设计', NULL, 181);
INSERT INTO `choice` VALUES (703, b'0', '确定逻辑模型', NULL, 181);
INSERT INTO `choice` VALUES (704, b'1', '软件开发工作的基础', NULL, 182);
INSERT INTO `choice` VALUES (705, b'0', '软件生存周期的开始', NULL, 182);
INSERT INTO `choice` VALUES (706, b'0', '由系统分析员单独完成的', NULL, 182);
INSERT INTO `choice` VALUES (707, b'0', '由用户自己单独完成的', NULL, 182);
INSERT INTO `choice` VALUES (708, b'1', '控制流', NULL, 183);
INSERT INTO `choice` VALUES (709, b'0', '数据流', NULL, 183);
INSERT INTO `choice` VALUES (710, b'0', '程序流', NULL, 183);
INSERT INTO `choice` VALUES (711, b'0', '指令流', NULL, 183);
INSERT INTO `choice` VALUES (712, b'0', '互相排斥', NULL, 184);
INSERT INTO `choice` VALUES (713, b'1', '互相补充', NULL, 184);
INSERT INTO `choice` VALUES (714, b'0', '独立使用', NULL, 184);
INSERT INTO `choice` VALUES (715, b'0', '交替使用', NULL, 184);
INSERT INTO `choice` VALUES (716, b'0', '严格定义需求', NULL, 185);
INSERT INTO `choice` VALUES (717, b'0', '划分开发阶段', NULL, 185);
INSERT INTO `choice` VALUES (718, b'1', '提供运行模型', NULL, 185);
INSERT INTO `choice` VALUES (719, b'0', '制定规范文档', NULL, 185);
INSERT INTO `choice` VALUES (720, b'1', '自顶向下逐层分解的分析方法', NULL, 186);
INSERT INTO `choice` VALUES (721, b'0', '自底向上逐层分解的分析方法', NULL, 186);
INSERT INTO `choice` VALUES (722, b'0', '面向对象的分析方法', NULL, 186);
INSERT INTO `choice` VALUES (723, b'0', '以上都不是', NULL, 186);
INSERT INTO `choice` VALUES (724, b'0', '顺序结构', NULL, 187);
INSERT INTO `choice` VALUES (725, b'0', '条件结构', NULL, 187);
INSERT INTO `choice` VALUES (726, b'0', '选择结构', NULL, 187);
INSERT INTO `choice` VALUES (727, b'1', '嵌套结构', NULL, 187);
INSERT INTO `choice` VALUES (728, b'0', 'FD 图', NULL, 188);
INSERT INTO `choice` VALUES (729, b'0', 'PAD 图', NULL, 188);
INSERT INTO `choice` VALUES (730, b'0', 'IPO 图', NULL, 188);
INSERT INTO `choice` VALUES (731, b'1', '数据字典', NULL, 188);
INSERT INTO `choice` VALUES (732, b'0', 'FD 图', NULL, 189);
INSERT INTO `choice` VALUES (733, b'1', 'PAD 图', NULL, 189);
INSERT INTO `choice` VALUES (734, b'0', '结构化英语', NULL, 189);
INSERT INTO `choice` VALUES (735, b'0', '判定表', NULL, 189);
INSERT INTO `choice` VALUES (736, b'0', '对象', NULL, 190);
INSERT INTO `choice` VALUES (737, b'0', '数据流', NULL, 190);
INSERT INTO `choice` VALUES (738, b'1', '数据结构', NULL, 190);
INSERT INTO `choice` VALUES (739, b'0', '控制结构', NULL, 190);
INSERT INTO `choice` VALUES (740, b'0', '分支结构、选择结构和控制结构', NULL, 191);
INSERT INTO `choice` VALUES (741, b'1', '顺序结构、选择结构和循环结构', NULL, 191);
INSERT INTO `choice` VALUES (742, b'0', '顺序结构、分支结构和嵌套结构', NULL, 191);
INSERT INTO `choice` VALUES (743, b'0', '顺序结构、选择结构和重复结构', NULL, 191);
INSERT INTO `choice` VALUES (744, b'0', '原型化方法', NULL, 192);
INSERT INTO `choice` VALUES (745, b'1', '结构化方法', NULL, 192);
INSERT INTO `choice` VALUES (746, b'0', '面向对象方法', NULL, 192);
INSERT INTO `choice` VALUES (747, b'0', '功能分解方法', NULL, 192);
INSERT INTO `choice` VALUES (748, b'0', '功能需求', NULL, 193);
INSERT INTO `choice` VALUES (749, b'0', '非功能需求', NULL, 193);
INSERT INTO `choice` VALUES (750, b'0', '性能需求', NULL, 193);
INSERT INTO `choice` VALUES (751, b'1', '功能需求和非功能需求', NULL, 193);
INSERT INTO `choice` VALUES (752, b'1', '当前运行系统', NULL, 194);
INSERT INTO `choice` VALUES (753, b'0', '当前逻辑模型', NULL, 194);
INSERT INTO `choice` VALUES (754, b'0', '目标系统', NULL, 194);
INSERT INTO `choice` VALUES (755, b'0', '新系统', NULL, 194);
INSERT INTO `choice` VALUES (756, b'0', '逻辑系统', NULL, 195);
INSERT INTO `choice` VALUES (757, b'0', '程序系统', NULL, 195);
INSERT INTO `choice` VALUES (758, b'1', '体系结构', NULL, 195);
INSERT INTO `choice` VALUES (759, b'0', '物理系统', NULL, 195);
INSERT INTO `choice` VALUES (760, b'0', '判定表', NULL, 196);
INSERT INTO `choice` VALUES (761, b'0', 'IPO 图', NULL, 196);
INSERT INTO `choice` VALUES (762, b'0', 'PDL ', NULL, 196);
INSERT INTO `choice` VALUES (763, b'1', 'DFD 图', NULL, 196);
INSERT INTO `choice` VALUES (764, b'0', '过程、子程序和分程序', NULL, 197);
INSERT INTO `choice` VALUES (765, b'1', '顺序、选择和重复', NULL, 197);
INSERT INTO `choice` VALUES (766, b'0', '递归、堆栈和队列', NULL, 197);
INSERT INTO `choice` VALUES (767, b'0', '调用、返回和转移', NULL, 197);
INSERT INTO `choice` VALUES (768, b'0', '不能嵌套使用', NULL, 198);
INSERT INTO `choice` VALUES (769, b'0', '只能用来写简单程序', NULL, 198);
INSERT INTO `choice` VALUES (770, b'0', '已经用硬件实现', NULL, 198);
INSERT INTO `choice` VALUES (771, b'1', '只有一个入口和一个出口', NULL, 198);
INSERT INTO `choice` VALUES (772, b'0', '生存期', NULL, 199);
INSERT INTO `choice` VALUES (773, b'0', '面向对象设计', NULL, 199);
INSERT INTO `choice` VALUES (774, b'0', '面向对象程序设计', NULL, 199);
INSERT INTO `choice` VALUES (775, b'1', '面向对象分析', NULL, 199);
INSERT INTO `choice` VALUES (776, b'1', '需求不确定性高的', NULL, 200);
INSERT INTO `choice` VALUES (777, b'0', '需求确定的', NULL, 200);
INSERT INTO `choice` VALUES (778, b'0', '管理信息', NULL, 200);
INSERT INTO `choice` VALUES (779, b'0', '实时', NULL, 200);
INSERT INTO `choice` VALUES (780, b'1', '自外向内', NULL, 201);
INSERT INTO `choice` VALUES (781, b'0', '自顶向下', NULL, 201);
INSERT INTO `choice` VALUES (782, b'0', '自内向外', NULL, 201);
INSERT INTO `choice` VALUES (783, b'0', '自底向上', NULL, 201);
INSERT INTO `choice` VALUES (784, b'0', '数据流图', NULL, 202);
INSERT INTO `choice` VALUES (785, b'0', '判定表', NULL, 202);
INSERT INTO `choice` VALUES (786, b'1', 'PAD 图', NULL, 202);
INSERT INTO `choice` VALUES (787, b'0', '数据字典', NULL, 202);
INSERT INTO `choice` VALUES (788, b'0', '用户要求', NULL, 203);
INSERT INTO `choice` VALUES (789, b'0', '合理要求', NULL, 203);
INSERT INTO `choice` VALUES (790, b'1', '模糊要求', NULL, 203);
INSERT INTO `choice` VALUES (791, b'0', '对象', NULL, 204);
INSERT INTO `choice` VALUES (792, b'0', '解释', NULL, 204);
INSERT INTO `choice` VALUES (793, b'0', '符号', NULL, 204);
INSERT INTO `choice` VALUES (794, b'1', '描述', NULL, 204);
INSERT INTO `choice` VALUES (795, b'0', '控制流', NULL, 205);
INSERT INTO `choice` VALUES (796, b'0', '信息流', NULL, 205);
INSERT INTO `choice` VALUES (797, b'1', '数据流', NULL, 205);
INSERT INTO `choice` VALUES (798, b'0', '信号流', NULL, 205);
INSERT INTO `choice` VALUES (799, b'1', '数据流图', NULL, 206);
INSERT INTO `choice` VALUES (800, b'0', '数据词典', NULL, 206);
INSERT INTO `choice` VALUES (801, b'0', '结构化英语', NULL, 206);
INSERT INTO `choice` VALUES (802, b'0', '判定树与判定表', NULL, 206);
INSERT INTO `choice` VALUES (803, b'0', '数据流图', NULL, 207);
INSERT INTO `choice` VALUES (804, b'1', '数据词典', NULL, 207);
INSERT INTO `choice` VALUES (805, b'0', '结构化英语', NULL, 207);
INSERT INTO `choice` VALUES (806, b'0', '判定树与判定表', NULL, 207);
INSERT INTO `choice` VALUES (807, b'0', '一对象', NULL, 208);
INSERT INTO `choice` VALUES (808, b'0', '数据结构', NULL, 208);
INSERT INTO `choice` VALUES (809, b'1', '数据流', NULL, 208);
INSERT INTO `choice` VALUES (810, b'0', '控制流', NULL, 208);
INSERT INTO `choice` VALUES (811, b'0', '数据流图', NULL, 209);
INSERT INTO `choice` VALUES (812, b'1', '组织结构图', NULL, 209);
INSERT INTO `choice` VALUES (813, b'0', '数据词典', NULL, 209);
INSERT INTO `choice` VALUES (814, b'0', '结构化语言', NULL, 209);
INSERT INTO `choice` VALUES (815, b'0', '总结', NULL, 210);
INSERT INTO `choice` VALUES (816, b'0', '实践性报告', NULL, 210);
INSERT INTO `choice` VALUES (817, b'1', '需求分析评审', NULL, 210);
INSERT INTO `choice` VALUES (818, b'0', '以上答案都不正确', NULL, 210);
INSERT INTO `choice` VALUES (819, b'0', '结构化语言外层中的顺序结构是一组祈使语句、选择语句、重复语句的顺序排列', NULL, 211);
INSERT INTO `choice` VALUES (820, b'0', '结构化语言外层中的选择结构使用IF-THEN--ELSE-ENDIF 等关键字', NULL, 211);
INSERT INTO `choice` VALUES (821, b'0', '结构化语言的内层可以采用祈使语句的自然语言短语', NULL, 211);
INSERT INTO `choice` VALUES (822, b'1', '结构化语言外层中的重复结构使用CASE-OF-ENDCASE 等关键字', NULL, 211);
INSERT INTO `choice` VALUES (823, b'0', '数据流图', NULL, 212);
INSERT INTO `choice` VALUES (824, b'1', '数据字典', NULL, 212);
INSERT INTO `choice` VALUES (825, b'0', '判定表', NULL, 212);
INSERT INTO `choice` VALUES (826, b'0', '判定树', NULL, 212);
INSERT INTO `choice` VALUES (827, b'1', '面向数据结构的分析方法', NULL, 213);
INSERT INTO `choice` VALUES (828, b'0', '面向时序问题的分析方法', NULL, 213);
INSERT INTO `choice` VALUES (829, b'0', '面向事务的分析方法', NULL, 213);
INSERT INTO `choice` VALUES (830, b'1', '数据流图', NULL, 214);
INSERT INTO `choice` VALUES (831, b'0', '数据字典', NULL, 214);
INSERT INTO `choice` VALUES (832, b'0', '判定表', NULL, 214);
INSERT INTO `choice` VALUES (833, b'0', '判定树', NULL, 214);
INSERT INTO `choice` VALUES (834, b'0', '对象', NULL, 215);
INSERT INTO `choice` VALUES (835, b'0', '数据结构', NULL, 215);
INSERT INTO `choice` VALUES (836, b'1', '数据流', NULL, 215);
INSERT INTO `choice` VALUES (837, b'0', '结构图', NULL, 215);
INSERT INTO `choice` VALUES (838, b'0', '层次图', NULL, 216);
INSERT INTO `choice` VALUES (839, b'1', '数据字典', NULL, 216);
INSERT INTO `choice` VALUES (840, b'0', '数据流图', NULL, 216);
INSERT INTO `choice` VALUES (841, b'0', 'IPO 图', NULL, 216);
INSERT INTO `choice` VALUES (842, b'0', 'IPO 图', NULL, 217);
INSERT INTO `choice` VALUES (843, b'1', 'PDL 图', NULL, 217);
INSERT INTO `choice` VALUES (844, b'0', '数据字典', NULL, 217);
INSERT INTO `choice` VALUES (845, b'0', '层次图', NULL, 217);
INSERT INTO `choice` VALUES (846, b'0', '问题分解', NULL, 218);
INSERT INTO `choice` VALUES (847, b'0', '可靠性与安全性要求', NULL, 218);
INSERT INTO `choice` VALUES (848, b'1', '结构化程序设计', NULL, 218);
INSERT INTO `choice` VALUES (849, b'0', '确定逻辑模型', NULL, 218);
INSERT INTO `choice` VALUES (850, b'1', '软件开发工作的基础', NULL, 219);
INSERT INTO `choice` VALUES (851, b'0', '软件生存周期的开始', NULL, 219);
INSERT INTO `choice` VALUES (852, b'0', '由系统分析员单独完成的', NULL, 219);
INSERT INTO `choice` VALUES (853, b'0', '由用户自己单独完成的', NULL, 219);
INSERT INTO `choice` VALUES (854, b'1', '控制流', NULL, 220);
INSERT INTO `choice` VALUES (855, b'0', '数据流', NULL, 220);
INSERT INTO `choice` VALUES (856, b'0', '程序流', NULL, 220);
INSERT INTO `choice` VALUES (857, b'0', '指令流', NULL, 220);
INSERT INTO `choice` VALUES (858, b'0', '互相排斥', NULL, 221);
INSERT INTO `choice` VALUES (859, b'1', '互相补充', NULL, 221);
INSERT INTO `choice` VALUES (860, b'0', '独立使用', NULL, 221);
INSERT INTO `choice` VALUES (861, b'0', '交替使用', NULL, 221);
INSERT INTO `choice` VALUES (862, b'0', '严格定义需求', NULL, 222);
INSERT INTO `choice` VALUES (863, b'0', '划分开发阶段', NULL, 222);
INSERT INTO `choice` VALUES (864, b'1', '提供运行模型', NULL, 222);
INSERT INTO `choice` VALUES (865, b'0', '制定规范文档', NULL, 222);
INSERT INTO `choice` VALUES (866, b'1', '自顶向下逐层分解的分析方法', NULL, 223);
INSERT INTO `choice` VALUES (867, b'0', '自底向上逐层分解的分析方法', NULL, 223);
INSERT INTO `choice` VALUES (868, b'0', '面向对象的分析方法', NULL, 223);
INSERT INTO `choice` VALUES (869, b'0', '以上都不是', NULL, 223);
INSERT INTO `choice` VALUES (870, b'0', '顺序结构', NULL, 224);
INSERT INTO `choice` VALUES (871, b'0', '条件结构', NULL, 224);
INSERT INTO `choice` VALUES (872, b'0', '选择结构', NULL, 224);
INSERT INTO `choice` VALUES (873, b'1', '嵌套结构', NULL, 224);
INSERT INTO `choice` VALUES (874, b'1', '是', NULL, 225);
INSERT INTO `choice` VALUES (875, b'0', '否', NULL, 225);
INSERT INTO `choice` VALUES (876, b'0', '是', NULL, 226);
INSERT INTO `choice` VALUES (877, b'1', '否', NULL, 226);
INSERT INTO `choice` VALUES (878, b'0', '是', NULL, 227);
INSERT INTO `choice` VALUES (879, b'1', '否', NULL, 227);
INSERT INTO `choice` VALUES (880, b'1', 'alpha 测试需要用户代表参加', NULL, 228);
INSERT INTO `choice` VALUES (881, b'0', 'alpha 测试不需要用户代表参加', NULL, 228);
INSERT INTO `choice` VALUES (882, b'0', 'alpha 测试是系统测试的一种', NULL, 228);
INSERT INTO `choice` VALUES (883, b'1', 'alpha 测试是验收测试的一种', NULL, 228);
INSERT INTO `choice` VALUES (884, b'1', '软件需求分析说明书中定义的所有功能已全部实现， 性能指标全部达到要求。', NULL, 229);
INSERT INTO `choice` VALUES (885, b'1', '所有测试项没有残余一级、二级和三级错误。', NULL, 229);
INSERT INTO `choice` VALUES (886, b'1', '立项审批表、需求分析文档、设计文档和编码实现一致。', NULL, 229);
INSERT INTO `choice` VALUES (887, b'1', '验收测试工件齐全。', NULL, 229);
INSERT INTO `choice` VALUES (888, b'0', '杀敌发斯蒂芬', NULL, 230);
INSERT INTO `choice` VALUES (889, b'1', '撒地方', NULL, 230);
INSERT INTO `choice` VALUES (890, b'0', '撒地方', NULL, 230);

-- ----------------------------
-- Table structure for choose_log
-- ----------------------------
DROP TABLE IF EXISTS `choose_log`;
CREATE TABLE `choose_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `correct` bit(1) NULL DEFAULT NULL,
  `display` bit(1) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_id` bigint(20) NULL DEFAULT NULL,
  `question_id` bigint(20) NULL DEFAULT NULL,
  `sys_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbe3wr5xs2u1tlm340f8faq7u4`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKd9jkdpbxb4yrg6dyyeryq6qkn`(`exam_id`) USING BTREE,
  INDEX `FKrwjgh2rt4n3o0l78kpmbr9sea`(`question_id`) USING BTREE,
  INDEX `FKko69awy3aglnjb63lqa6gdpgx`(`sys_user_id`) USING BTREE,
  CONSTRAINT `FKbe3wr5xs2u1tlm340f8faq7u4` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKd9jkdpbxb4yrg6dyyeryq6qkn` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKko69awy3aglnjb63lqa6gdpgx` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrwjgh2rt4n3o0l78kpmbr9sea` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 282 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choose_log
-- ----------------------------
INSERT INTO `choose_log` VALUES (263, b'0', b'1', '297ed65d6375b6420163767e789f0051', 2, 107, 1);
INSERT INTO `choose_log` VALUES (264, b'0', b'1', '297ed65d6375b6420163767e78ae0052', 2, 105, 1);
INSERT INTO `choose_log` VALUES (265, b'0', b'1', '297ed65d6375b6420163767e78c30053', 2, 103, 1);
INSERT INTO `choose_log` VALUES (266, b'0', b'1', '297ed65d6375b6420163767e78db0054', 2, 101, 1);
INSERT INTO `choose_log` VALUES (267, b'0', b'1', '297ed65d6375b6420163767e78ef0055', 2, 108, 1);
INSERT INTO `choose_log` VALUES (268, b'0', b'1', '297ed65d6375b6420163767e78ff0056', 2, 106, 1);
INSERT INTO `choose_log` VALUES (269, b'0', b'1', '297ed65d6375b6420163767e79110057', 2, 104, 1);
INSERT INTO `choose_log` VALUES (270, b'0', b'1', '297ed65d6375b6420163767e791f0058', 2, 102, 1);
INSERT INTO `choose_log` VALUES (271, b'0', b'1', '297ed65d6375b6420163767e792a0059', 2, 100, 1);
INSERT INTO `choose_log` VALUES (272, b'0', b'1', '297ed65d6375b6420163767e7939005a', 2, 109, 1);
INSERT INTO `choose_log` VALUES (273, b'0', b'1', '297ed65d6375b6420163767e794d005b', 2, 118, 1);
INSERT INTO `choose_log` VALUES (274, b'0', b'1', '297ed65d6375b6420163767e795d005c', 2, 116, 1);
INSERT INTO `choose_log` VALUES (275, b'0', b'1', '297ed65d6375b6420163767e796a005d', 2, 117, 1);
INSERT INTO `choose_log` VALUES (276, b'0', b'1', '297ed65d6375b6420163767e797a005e', 2, 114, 1);
INSERT INTO `choose_log` VALUES (277, b'0', b'1', '297ed65d6375b6420163767e7991005f', 2, 112, 1);
INSERT INTO `choose_log` VALUES (278, b'0', b'1', '297ed65d6375b6420163767e79a70060', 2, 110, 1);
INSERT INTO `choose_log` VALUES (279, b'0', b'1', '297ed65d6375b6420163767e79b90061', 2, 115, 1);
INSERT INTO `choose_log` VALUES (280, b'0', b'1', '297ed65d6375b6420163767e79c70062', 2, 113, 1);
INSERT INTO `choose_log` VALUES (281, b'0', b'1', '297ed65d6375b6420163767e7a040063', 2, 111, 1);

-- ----------------------------
-- Table structure for choose_log_choice
-- ----------------------------
DROP TABLE IF EXISTS `choose_log_choice`;
CREATE TABLE `choose_log_choice`  (
  `choose_log_id` bigint(20) NOT NULL,
  `choice_id` bigint(20) NOT NULL,
  INDEX `FK3jq1w97cl4h1aypyf3foe550j`(`choice_id`) USING BTREE,
  INDEX `FKa6kso8x0i6pue0am6fx2xu4n`(`choose_log_id`) USING BTREE,
  CONSTRAINT `FK3jq1w97cl4h1aypyf3foe550j` FOREIGN KEY (`choice_id`) REFERENCES `choice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKa6kso8x0i6pue0am6fx2xu4n` FOREIGN KEY (`choose_log_id`) REFERENCES `choose_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choose_log_choice
-- ----------------------------
INSERT INTO `choose_log_choice` VALUES (279, 441);
INSERT INTO `choose_log_choice` VALUES (281, 423);
INSERT INTO `choose_log_choice` VALUES (281, 425);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exampaper_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKs3w89u0r6161aug3e3pl8me5a`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKgu1g55r10ta31rggduoc93wk7`(`exampaper_id`) USING BTREE,
  CONSTRAINT `FKgu1g55r10ta31rggduoc93wk7` FOREIGN KEY (`exampaper_id`) REFERENCES `exampaper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs3w89u0r6161aug3e3pl8me5a` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (2, '软件评测师考试属于全国计算机技术与软件专业技术资格考试（简称计算机软件资格考试）中的一个中级考试。考试不设学历与资历条件，也不论年龄和专业，考生可根据自己的技术水平选择合适的级别合适的资格，但一次考试只能报考一种资格。考试采用笔试形式，考试实行全国统一大纲、统一试题、统一时间、统一标准、统一证书的考试办法。笔试安排在一天之内。', '2017年软件测试工程师考试', 90, '297ed65d633f5c7301633fe1124e0064', 2);
INSERT INTO `exam` VALUES (3, '计算机技术与软件专业技术资格（水平）考试是原中国计算机软件专业技术资格和水平考试的完善与发展。这是由国家人力资源和社会保障部（原人事部）、工业和信息化部（原信息产业部）领导的国家级考试，其目的是，科学、公正地对全国计算机与软件专业技术人员进行职业资格、专业技术资格认定和专业技术水平测试。', '2016软件工程考试', 60, '297ed65d6375b642016375ebe70b0006', 4);
INSERT INTO `exam` VALUES (4, '2015年软件工程师考试，难度适中', '2015年软件工程师考试', 70, '297ed65d6375b64201637606c9ae0038', 5);
INSERT INTO `exam` VALUES (5, '2018年软件工程考试热身题，难度较为简单', '2018年软件工程考试热身题', 35, '297ed65d6375b6420163760847ad003a', 6);
INSERT INTO `exam` VALUES (6, 'sdasdf', 'test', 120, '297ed65d6375b6420163767b725d0050', 7);

-- ----------------------------
-- Table structure for exam_result
-- ----------------------------
DROP TABLE IF EXISTS `exam_result`;
CREATE TABLE `exam_result`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `all_count` int(11) NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  `wrong_count` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_id` bigint(20) NULL DEFAULT NULL,
  `sys_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKghw4hm4y8vnuyr3ntglja896h`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKmblvyjlk9x7rrm7mvqtbedycc`(`exam_id`) USING BTREE,
  INDEX `FKsfc96jri4p4ukkdaitjt5rk13`(`sys_user_id`) USING BTREE,
  CONSTRAINT `FKghw4hm4y8vnuyr3ntglja896h` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmblvyjlk9x7rrm7mvqtbedycc` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsfc96jri4p4ukkdaitjt5rk13` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_result
-- ----------------------------
INSERT INTO `exam_result` VALUES (10, 19, 0, 19, '297ed65d6375b6420163767e7a0e0064', 2, 1);

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKng1xo9twgmle84dnro9ge6aha`(`sys_modify_log_id`) USING BTREE,
  CONSTRAINT `FKng1xo9twgmle84dnro9ge6aha` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (2, '软件评测师考试属于全国计算机技术与软件专业技术资格考试（简称计算机软件资格考试）中的一个中级考试。考试不设学历与资历条件，也不论年龄和专业，考生可根据自己的技术水平选择合适的级别合适的资格，但一次考试只能报考一种资格。考试采用笔试形式，考试实行全国统一大纲、统一试题、统一时间、统一标准、统一证书的考试办法。笔试安排在一天之内。', '2017年软件测试工程师考试', '297ed65d633f5c7301633fe0ba6c0063');
INSERT INTO `exampaper` VALUES (4, '计算机技术与软件专业技术资格（水平）考试是原中国计算机软件专业技术资格和水平考试的完善与发展。这是由国家人力资源和社会保障部（原人事部）、工业和信息化部（原信息产业部）领导的国家级考试，其目的是，科学、公正地对全国计算机与软件专业技术人员进行职业资格、专业技术资格认定和专业技术水平测试。', '2016软考', '297ed65d6375b642016375eb64b70005');
INSERT INTO `exampaper` VALUES (5, '2015年软件工程师考试,难度适中', '2015年软件工程师考试', '297ed65d6375b642016376067b6f0037');
INSERT INTO `exampaper` VALUES (6, '2018年软件工程考试热身题，难度较为简单', '2018年软件工程考试热身题', '297ed65d6375b6420163760806f50039');
INSERT INTO `exampaper` VALUES (7, 'sdfsadf', 'test', '297ed65d6375b6420163767a90fa004f');

-- ----------------------------
-- Table structure for exampaper_question
-- ----------------------------
DROP TABLE IF EXISTS `exampaper_question`;
CREATE TABLE `exampaper_question`  (
  `exampaper_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  INDEX `FKk4b38m2m0ujfi5jlghbongivo`(`question_id`) USING BTREE,
  INDEX `FKk4wvkjt26iwlvlm2iswf7ojt5`(`exampaper_id`) USING BTREE,
  CONSTRAINT `FKk4b38m2m0ujfi5jlghbongivo` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKk4wvkjt26iwlvlm2iswf7ojt5` FOREIGN KEY (`exampaper_id`) REFERENCES `exampaper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper_question
-- ----------------------------
INSERT INTO `exampaper_question` VALUES (2, 100);
INSERT INTO `exampaper_question` VALUES (2, 101);
INSERT INTO `exampaper_question` VALUES (2, 102);
INSERT INTO `exampaper_question` VALUES (2, 103);
INSERT INTO `exampaper_question` VALUES (2, 104);
INSERT INTO `exampaper_question` VALUES (2, 105);
INSERT INTO `exampaper_question` VALUES (2, 106);
INSERT INTO `exampaper_question` VALUES (2, 107);
INSERT INTO `exampaper_question` VALUES (2, 108);
INSERT INTO `exampaper_question` VALUES (2, 109);
INSERT INTO `exampaper_question` VALUES (2, 110);
INSERT INTO `exampaper_question` VALUES (2, 111);
INSERT INTO `exampaper_question` VALUES (2, 112);
INSERT INTO `exampaper_question` VALUES (2, 113);
INSERT INTO `exampaper_question` VALUES (2, 114);
INSERT INTO `exampaper_question` VALUES (2, 115);
INSERT INTO `exampaper_question` VALUES (2, 116);
INSERT INTO `exampaper_question` VALUES (2, 117);
INSERT INTO `exampaper_question` VALUES (2, 118);
INSERT INTO `exampaper_question` VALUES (4, 136);
INSERT INTO `exampaper_question` VALUES (4, 137);
INSERT INTO `exampaper_question` VALUES (4, 138);
INSERT INTO `exampaper_question` VALUES (4, 139);
INSERT INTO `exampaper_question` VALUES (4, 140);
INSERT INTO `exampaper_question` VALUES (4, 141);
INSERT INTO `exampaper_question` VALUES (4, 142);
INSERT INTO `exampaper_question` VALUES (4, 143);
INSERT INTO `exampaper_question` VALUES (4, 144);
INSERT INTO `exampaper_question` VALUES (4, 145);
INSERT INTO `exampaper_question` VALUES (4, 146);
INSERT INTO `exampaper_question` VALUES (4, 147);
INSERT INTO `exampaper_question` VALUES (4, 148);
INSERT INTO `exampaper_question` VALUES (4, 149);
INSERT INTO `exampaper_question` VALUES (4, 150);
INSERT INTO `exampaper_question` VALUES (4, 151);
INSERT INTO `exampaper_question` VALUES (4, 152);
INSERT INTO `exampaper_question` VALUES (4, 153);
INSERT INTO `exampaper_question` VALUES (4, 154);
INSERT INTO `exampaper_question` VALUES (4, 155);
INSERT INTO `exampaper_question` VALUES (4, 156);
INSERT INTO `exampaper_question` VALUES (4, 157);
INSERT INTO `exampaper_question` VALUES (4, 158);
INSERT INTO `exampaper_question` VALUES (4, 159);
INSERT INTO `exampaper_question` VALUES (4, 160);
INSERT INTO `exampaper_question` VALUES (4, 161);
INSERT INTO `exampaper_question` VALUES (4, 162);
INSERT INTO `exampaper_question` VALUES (4, 163);
INSERT INTO `exampaper_question` VALUES (4, 164);
INSERT INTO `exampaper_question` VALUES (4, 165);
INSERT INTO `exampaper_question` VALUES (4, 166);
INSERT INTO `exampaper_question` VALUES (4, 167);
INSERT INTO `exampaper_question` VALUES (4, 168);
INSERT INTO `exampaper_question` VALUES (4, 169);
INSERT INTO `exampaper_question` VALUES (4, 170);
INSERT INTO `exampaper_question` VALUES (4, 171);
INSERT INTO `exampaper_question` VALUES (4, 172);
INSERT INTO `exampaper_question` VALUES (4, 173);
INSERT INTO `exampaper_question` VALUES (4, 174);
INSERT INTO `exampaper_question` VALUES (4, 175);
INSERT INTO `exampaper_question` VALUES (4, 176);
INSERT INTO `exampaper_question` VALUES (5, 177);
INSERT INTO `exampaper_question` VALUES (5, 178);
INSERT INTO `exampaper_question` VALUES (5, 179);
INSERT INTO `exampaper_question` VALUES (5, 180);
INSERT INTO `exampaper_question` VALUES (5, 181);
INSERT INTO `exampaper_question` VALUES (5, 182);
INSERT INTO `exampaper_question` VALUES (5, 183);
INSERT INTO `exampaper_question` VALUES (5, 184);
INSERT INTO `exampaper_question` VALUES (5, 185);
INSERT INTO `exampaper_question` VALUES (5, 186);
INSERT INTO `exampaper_question` VALUES (5, 187);
INSERT INTO `exampaper_question` VALUES (5, 188);
INSERT INTO `exampaper_question` VALUES (5, 189);
INSERT INTO `exampaper_question` VALUES (5, 190);
INSERT INTO `exampaper_question` VALUES (5, 191);
INSERT INTO `exampaper_question` VALUES (5, 192);
INSERT INTO `exampaper_question` VALUES (5, 193);
INSERT INTO `exampaper_question` VALUES (6, 194);
INSERT INTO `exampaper_question` VALUES (6, 195);
INSERT INTO `exampaper_question` VALUES (6, 196);
INSERT INTO `exampaper_question` VALUES (6, 197);
INSERT INTO `exampaper_question` VALUES (6, 198);
INSERT INTO `exampaper_question` VALUES (6, 199);
INSERT INTO `exampaper_question` VALUES (6, 200);
INSERT INTO `exampaper_question` VALUES (6, 201);
INSERT INTO `exampaper_question` VALUES (6, 202);
INSERT INTO `exampaper_question` VALUES (6, 203);
INSERT INTO `exampaper_question` VALUES (6, 204);
INSERT INTO `exampaper_question` VALUES (6, 205);
INSERT INTO `exampaper_question` VALUES (6, 206);
INSERT INTO `exampaper_question` VALUES (6, 207);
INSERT INTO `exampaper_question` VALUES (6, 208);
INSERT INTO `exampaper_question` VALUES (6, 209);
INSERT INTO `exampaper_question` VALUES (6, 210);
INSERT INTO `exampaper_question` VALUES (6, 211);
INSERT INTO `exampaper_question` VALUES (6, 212);
INSERT INTO `exampaper_question` VALUES (7, 213);
INSERT INTO `exampaper_question` VALUES (7, 214);
INSERT INTO `exampaper_question` VALUES (7, 215);
INSERT INTO `exampaper_question` VALUES (7, 216);
INSERT INTO `exampaper_question` VALUES (7, 217);
INSERT INTO `exampaper_question` VALUES (7, 218);
INSERT INTO `exampaper_question` VALUES (7, 219);
INSERT INTO `exampaper_question` VALUES (7, 220);
INSERT INTO `exampaper_question` VALUES (7, 221);
INSERT INTO `exampaper_question` VALUES (7, 222);
INSERT INTO `exampaper_question` VALUES (7, 223);
INSERT INTO `exampaper_question` VALUES (7, 224);
INSERT INTO `exampaper_question` VALUES (7, 225);
INSERT INTO `exampaper_question` VALUES (7, 226);
INSERT INTO `exampaper_question` VALUES (7, 227);
INSERT INTO `exampaper_question` VALUES (7, 228);
INSERT INTO `exampaper_question` VALUES (7, 229);
INSERT INTO `exampaper_question` VALUES (7, 230);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKay4vfw8w9sg4dqr9gd48nv7ey`(`sys_modify_log_id`) USING BTREE,
  CONSTRAINT `FKay4vfw8w9sg4dqr9gd48nv7ey` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '软件生命周期一般包括：软件开发期和软件运行期，下述（  ）不是软件开发期所应包含的内容。', '单选', NULL);
INSERT INTO `question` VALUES (2, '软件是一种逻辑产品，它的开发主要是（）', '单选', NULL);
INSERT INTO `question` VALUES (3, '以文档作为驱动，适合于软件需求很明确的软件项目的生存周期模型是（）', '单选', NULL);
INSERT INTO `question` VALUES (4, '在软件生存周期中， （  ）阶段必须要回答的问题是“要解决的问题是做什么？” 。', '单选', NULL);
INSERT INTO `question` VALUES (5, '软件产品与物质产品有很大区别，软件产品是一种（ ）产品', '单选', NULL);
INSERT INTO `question` VALUES (6, '（）把瀑布模型和专家系统结合在一起，在开发的各个阶段上都利用相应的专家系统来帮助软件人员完成开发工作。', '单选', NULL);
INSERT INTO `question` VALUES (7, '（）阶段是为每个模块完成的功能进行具体的描述，要把功能描述转变为精确的、结构化的过程描述。', '单选', NULL);
INSERT INTO `question` VALUES (8, '下列软件开发模型中，适合于那些不能预先确切定义需求的软件系统的开发的模型是（ ）。', '单选', NULL);
INSERT INTO `question` VALUES (9, '下列软件开发模型中，以面向对象的软件开发方法为基础，以用户的需求为动力，以对象来驱动的模型是（）。', '单选', NULL);
INSERT INTO `question` VALUES (10, '下列软件开发模型中，支持需求不明确，特别是大型软件系统的开发，并支持多种软件开发方法的模型是（）。', '单选', NULL);
INSERT INTO `question` VALUES (11, '软件特性中，使软件在不同的系统约束条件下，使用户需求得到满足的难易程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (12, '软件特性中，一个软件能再次用于其他相关应用的程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (13, '软件特性中，（）是指系统具有清晰的结构，能直接反映问题的需求的程度。', '单选', NULL);
INSERT INTO `question` VALUES (14, '软件特性中，软件产品交付使用后，在实现改正潜伏的错误、改进性能、适应环境变化等方面工作的难易程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (15, '软件特性中，软件从一个计算机系统或环境移植到另一个上去的难易程度指的是（） .', '单选', NULL);
INSERT INTO `question` VALUES (16, '软件特性中，在给定的时间间隔内，程序成功运行的概率指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (17, '软件特性中，允许对软件进行修改而不增加其复杂性指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (18, '软件特性中，多个软件元素相互通讯并协同完成任务的能力指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (19, '软件特性中，根据软件需求对软件设计、程序进行正向追踪，或根据程序、软件设计对软件需求进行逆向追踪的能力指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (20, '软件的可修改性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (21, '软件的可移植性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (22, '软件的可理解性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (23, '在软件工程的原则中，抽象、信息隐藏、模块化和局部化的原则支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (24, '下列选项中，属于需求分析阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (25, '下列选项中，属于概要设计阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (26, '下列选项中，属于详细设计阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (27, '下列选项中，属于实现阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (28, '下列选项中，在验收测试结束时，必须提交给用户的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (29, '需求分析最终结果是产生（ ）', '单选', NULL);
INSERT INTO `question` VALUES (30, '需求分析中，开发人员要从用户那里解决的最重要的问题是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (31, 'FD 中的每个加工至少有（ ）', '单选', NULL);
INSERT INTO `question` VALUES (32, '数据字典总，一般不出现的条目是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (33, '分层数据流图是一种比较严格又易于理解的描述方式，它的顶层图描述了系统的（ ）', '单选', NULL);
INSERT INTO `question` VALUES (34, '需求规格说明书的内容不应包括对（ ）的描述。', '单选', NULL);
INSERT INTO `question` VALUES (35, '需求规格说明书的作用不应包括（ ）', '单选', NULL);
INSERT INTO `question` VALUES (36, 'SA 方法用DFD 描述（ ）', '单选', NULL);
INSERT INTO `question` VALUES (37, '一个局部数据存储当它作为（ ）时，就把他画出来。', '单选', NULL);
INSERT INTO `question` VALUES (38, '对于分层的DFD，父图与子图的平衡指子图的输入、输出数据流同父图相应加工的输入、输出数据流（ ）', '单选', NULL);
INSERT INTO `question` VALUES (39, '需求分析阶段不适用于描述加工逻辑的工具是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (40, 'SA 方法的分析步骤是首先调查了解当前系统的工作流程，然后（ ）', '单选', NULL);
INSERT INTO `question` VALUES (41, 'SA 方法的基本思想是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (42, '初步用户手册在（ ）阶段编写', '单选', NULL);
INSERT INTO `question` VALUES (43, '下面关于面向对象方法中消息的叙述，不正确的是______ 。', '单选', NULL);
INSERT INTO `question` VALUES (44, '可行性研究要进行一次_____ 需求分析。', '单选', NULL);
INSERT INTO `question` VALUES (45, '系统流程图用于可行性分析中的_____ 的描述。', '单选', NULL);
INSERT INTO `question` VALUES (46, '系统流程图是描述_____ 的工具。', '单选', NULL);
INSERT INTO `question` VALUES (47, '_______ 工具在软件详细设计过程中不采用。', '单选', NULL);
INSERT INTO `question` VALUES (48, '程序的三种基本控制结构是', '单选', NULL);
INSERT INTO `question` VALUES (49, '程序的三种基本控制结构的共同特点是', '单选', NULL);
INSERT INTO `question` VALUES (50, '软件开发过程中，抽取和整理用户需求并建立问题域精确模型的过程叫', '单选', NULL);
INSERT INTO `question` VALUES (51, '原型化方法是用户和设计者之间执行的一种交互构成，适用于______ 系统。', '单选', NULL);
INSERT INTO `question` VALUES (52, '原型化方法是一种_______ 型的设计过程。', '单选', NULL);
INSERT INTO `question` VALUES (53, '进行需求分析可使用多种工具，但( ) 是不适用的。', '单选', NULL);
INSERT INTO `question` VALUES (54, '需求分析阶段研究的对象是软件项目的( )。', '单选', NULL);
INSERT INTO `question` VALUES (55, '数据字典的任务是对于数据流图中出现的所有被命名的数据元素，在数据字典中作为一个词条加以定义，使得每一个图形元素的名字都有一个确切的( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (56, '在数据流图中，有名字及方向的成分是( )。', '单选', NULL);
INSERT INTO `question` VALUES (57, '在结构化分析方法中，用以表达系统内数据的运动情况的工具有( )', '单选', NULL);
INSERT INTO `question` VALUES (58, '在结构化分析方法中，用以表达系统内数据的运动情况的工具有( )', '单选', NULL);
INSERT INTO `question` VALUES (59, '结构化分析方法(SA) 是一种面向( ) 的需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (60, '描述结构化系统分析方法的工具不包括( )', '单选', NULL);
INSERT INTO `question` VALUES (61, '软件需求分析阶段的工作，可以分成以下四个方面：对问题的识别、分析与综合、制定规格说明以及( )。', '单选', NULL);
INSERT INTO `question` VALUES (62, '以下说法错误的是( )。', '单选', NULL);
INSERT INTO `question` VALUES (63, '结构化分析方法使用的描述工具( )定义了数据流图中每一个图形元素。', '单选', NULL);
INSERT INTO `question` VALUES (64, '下列说法正确的是( )。', '单选', NULL);
INSERT INTO `question` VALUES (65, '需求规格说明书的作用不应包括( )。', '单选', NULL);
INSERT INTO `question` VALUES (66, '软件需求规格说明书的内容不应包括对( )的描述。', '单选', NULL);
INSERT INTO `question` VALUES (67, '在结构化分析方法(SA) 中，与数据流图配合使用的是( )。', '单选', NULL);
INSERT INTO `question` VALUES (68, '通过( )可以完成数据流图的细化。', '单选', NULL);
INSERT INTO `question` VALUES (69, '分层DFD 是一种比较严格又易于理解的描述方式，它的顶层图描述了系统的( )。', '单选', NULL);
INSERT INTO `question` VALUES (70, '数据存储和数据流都是( ) 仅仅所处的状态不同。', '单选', NULL);
INSERT INTO `question` VALUES (71, '数据字典中，一般不包括下列选项中的( ) 条目。', '单选', NULL);
INSERT INTO `question` VALUES (72, '在软件需求分析中，开发人员要从用户那里解决的最重要的问题是( )。', '单选', NULL);
INSERT INTO `question` VALUES (73, '需求分析最终结果是产生( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (74, 'SA 方法用DFD 描述( )。', '单选', NULL);
INSERT INTO `question` VALUES (75, 'SA 方法的分析步骤是首先调查了解当前系统的工作流程，然后( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (76, '需求分析阶段不适于描述加工逻辑的工具是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (77, '结构化分析方法(SA) 最为常见的图形工具是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (78, 'sA 方法的基本思想是( )。', '单选', NULL);
INSERT INTO `question` VALUES (79, '下面错误的说法是( )。', '单选', NULL);
INSERT INTO `question` VALUES (80, '下面错误的说法是( )。', '单选', NULL);
INSERT INTO `question` VALUES (81, '常用的需求分析方法有面向数据流的结构化分析方法， ( )，面向对象的分析方法等。', '单选', NULL);
INSERT INTO `question` VALUES (82, '结构化分析方法使用的描述工具( )描述系统由哪几部分组成，各部分之间有什么联系等等。', '单选', NULL);
INSERT INTO `question` VALUES (83, '结构化分析方法(sA) 是一种面向( )需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (84, '需求分析中，对算法的简单描述记录在( ) 中。', '单选', NULL);
INSERT INTO `question` VALUES (85, '数据流图和( )共同构成系统的逻辑模型。', '单选', NULL);
INSERT INTO `question` VALUES (86, '在下面的叙述中， ( )不是软件需求分析的任务。', '单选', NULL);
INSERT INTO `question` VALUES (87, '需求分析是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (88, '结构化分析方法是一种预先严格定义需求的方法，它在实施时强调的是分析对象的( )。', '单选', NULL);
INSERT INTO `question` VALUES (89, '软件开发常使用的两种基本方法是结构化和原型化方法，在实际应用中，它们之间的关系常表现为( )。', '单选', NULL);
INSERT INTO `question` VALUES (90, '结构化生命周期方法具有各种特征，下列各种叙述中， ( )不是结构化方法的特征。', '单选', NULL);
INSERT INTO `question` VALUES (91, 'SA 方法是一种( )。', '单选', NULL);
INSERT INTO `question` VALUES (92, '结构化程序流程图中一般包括三种基本结构，下述结构中( ) 不属于其基本结构。', '单选', NULL);
INSERT INTO `question` VALUES (93, '结构化分析方法以数据流图、()和加工说明等描述工具，即用直观的图和简洁语言来描述软件系统模型。', '单选', NULL);
INSERT INTO `question` VALUES (94, '结构化分析(SA) 是软件开发需求分析阶段所使用的方法， ( )不是SA 所使用的工具。', '单选', NULL);
INSERT INTO `question` VALUES (95, 'Jackson 设计方法是由英国的M ． Jackson 所提出的。它是一种面向( )的软件设计方法。', '单选', NULL);
INSERT INTO `question` VALUES (96, '软件设计中，Jackson方法是一种面向数据结构的设计方法，它将数据结构表示为三种基本结构，分别为( )。', '单选', NULL);
INSERT INTO `question` VALUES (97, '软件工程方法是在实践中不断发展的方法，而早期的软件工程方法是指( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (98, '软件需求分析一般应确定的是用户对软件的( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (99, '数据字典是对数据定义信息的集合，它所定义的对象都包含于( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (100, '单元测试通常应该先进行“人工走查”，再以白盒法为主， 辅以黑盒法进行动态测试。', '判断', NULL);
INSERT INTO `question` VALUES (101, '功能测试是系统测试的主要内容， 检查系统的功能、性能是否与需求规格说明相同。', '判断', NULL);
INSERT INTO `question` VALUES (102, '测试只要做到语句覆盖和分支覆盖，就可以发现程序中的所有错误。', '判断', NULL);
INSERT INTO `question` VALUES (103, '代码评审是检查源代码是否达到模块设计的要求。', '判断', NULL);
INSERT INTO `question` VALUES (104, '测试人员在测试过程中发现一处问题，如果问题影响不大，而自己又可以修改，应立即将此问题正确修改，以加快、提高开发的进程。', '判断', NULL);
INSERT INTO `question` VALUES (105, '负载测试是验证要检验的系统的能力最高能达到什么程度', '判断', NULL);
INSERT INTO `question` VALUES (106, '集成测试计划在需求分析阶段末提交。', '判断', NULL);
INSERT INTO `question` VALUES (107, '系统测试计划不需要同行审批。', '判断', NULL);
INSERT INTO `question` VALUES (108, '测试中应该对有效和无效、期望和不期望的输入都要测试。', '判断', NULL);
INSERT INTO `question` VALUES (109, '软件质量管理即QM 由QA和QC构成，软件测试属于QC的核心工作内容。', '判断', NULL);
INSERT INTO `question` VALUES (110, '以测试的形态分测试可以分为：', '多选', NULL);
INSERT INTO `question` VALUES (111, '选出属于黑盒测试方法的选项', '多选', NULL);
INSERT INTO `question` VALUES (112, '典型的瀑布模型的四个阶段是：', '多选', NULL);
INSERT INTO `question` VALUES (113, '下列关于alpha 测试的描述中正确的是：', '多选', NULL);
INSERT INTO `question` VALUES (114, '软件验收测试的合格通过准则是：', '多选', NULL);
INSERT INTO `question` VALUES (115, '编写测试计划的目的是：', '多选', NULL);
INSERT INTO `question` VALUES (116, '单元测试对象是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (117, '下列说法正确的是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (118, '下列哪个不属于软件缺陷产生的原因（ ）', '单选', NULL);
INSERT INTO `question` VALUES (119, '常用的需求分析方法有面向数据流的结构化分析方法， ( )，面向对象的分析方法等。', '单选', NULL);
INSERT INTO `question` VALUES (120, '结构化分析方法使用的描述工具( )描述系统由哪几部分组成，各部分之间有什么联系等等。', '单选', NULL);
INSERT INTO `question` VALUES (121, '结构化分析方法(sA) 是一种面向( )需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (122, '需求分析中，对算法的简单描述记录在( ) 中。', '单选', NULL);
INSERT INTO `question` VALUES (123, '数据流图和( )共同构成系统的逻辑模型。', '单选', NULL);
INSERT INTO `question` VALUES (124, '在下面的叙述中， ( )不是软件需求分析的任务。', '单选', NULL);
INSERT INTO `question` VALUES (125, '需求分析是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (126, '结构化分析方法是一种预先严格定义需求的方法，它在实施时强调的是分析对象的( )。', '单选', NULL);
INSERT INTO `question` VALUES (127, '软件开发常使用的两种基本方法是结构化和原型化方法，在实际应用中，它们之间的关系常表现为( )。', '单选', NULL);
INSERT INTO `question` VALUES (128, '结构化生命周期方法具有各种特征，下列各种叙述中， ( )不是结构化方法的特征。', '单选', NULL);
INSERT INTO `question` VALUES (129, 'SA 方法是一种( )。', '单选', NULL);
INSERT INTO `question` VALUES (130, '结构化程序流程图中一般包括三种基本结构，下述结构中( ) 不属于其基本结构。', '单选', NULL);
INSERT INTO `question` VALUES (131, '功能测试是系统测试的主要内容， 检查系统的功能、性能是否与需求规格说明相同。', '判断', NULL);
INSERT INTO `question` VALUES (132, '测试只要做到语句覆盖和分支覆盖，就可以发现程序中的所有错误。', '判断', NULL);
INSERT INTO `question` VALUES (133, '代码评审是检查源代码是否达到模块设计的要求。', '判断', NULL);
INSERT INTO `question` VALUES (134, '下列关于alpha 测试的描述中正确的是：', '多选', NULL);
INSERT INTO `question` VALUES (135, '软件验收测试的合格通过准则是：', '多选', NULL);
INSERT INTO `question` VALUES (136, '软件生命周期一般包括：软件开发期和软件运行期，下述（  ）不是软件开发期所应包含的内容。', '单选', NULL);
INSERT INTO `question` VALUES (137, '软件是一种逻辑产品，它的开发主要是（）', '单选', NULL);
INSERT INTO `question` VALUES (138, '以文档作为驱动，适合于软件需求很明确的软件项目的生存周期模型是（）', '单选', NULL);
INSERT INTO `question` VALUES (139, '在软件生存周期中， （  ）阶段必须要回答的问题是“要解决的问题是做什么？” 。', '单选', NULL);
INSERT INTO `question` VALUES (140, '软件产品与物质产品有很大区别，软件产品是一种（ ）产品', '单选', NULL);
INSERT INTO `question` VALUES (141, '（）把瀑布模型和专家系统结合在一起，在开发的各个阶段上都利用相应的专家系统来帮助软件人员完成开发工作。', '单选', NULL);
INSERT INTO `question` VALUES (142, '（）阶段是为每个模块完成的功能进行具体的描述，要把功能描述转变为精确的、结构化的过程描述。', '单选', NULL);
INSERT INTO `question` VALUES (143, '下列软件开发模型中，适合于那些不能预先确切定义需求的软件系统的开发的模型是（ ）。', '单选', NULL);
INSERT INTO `question` VALUES (144, '下列软件开发模型中，以面向对象的软件开发方法为基础，以用户的需求为动力，以对象来驱动的模型是（）。', '单选', NULL);
INSERT INTO `question` VALUES (145, '下列软件开发模型中，支持需求不明确，特别是大型软件系统的开发，并支持多种软件开发方法的模型是（）。', '单选', NULL);
INSERT INTO `question` VALUES (146, '软件特性中，使软件在不同的系统约束条件下，使用户需求得到满足的难易程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (147, '软件特性中，一个软件能再次用于其他相关应用的程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (148, '软件特性中，（）是指系统具有清晰的结构，能直接反映问题的需求的程度。', '单选', NULL);
INSERT INTO `question` VALUES (149, '软件特性中，软件产品交付使用后，在实现改正潜伏的错误、改进性能、适应环境变化等方面工作的难易程度称为（）。', '单选', NULL);
INSERT INTO `question` VALUES (150, '软件特性中，软件从一个计算机系统或环境移植到另一个上去的难易程度指的是（） .', '单选', NULL);
INSERT INTO `question` VALUES (151, '软件特性中，在给定的时间间隔内，程序成功运行的概率指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (152, '软件特性中，允许对软件进行修改而不增加其复杂性指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (153, '软件特性中，多个软件元素相互通讯并协同完成任务的能力指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (154, '软件特性中，根据软件需求对软件设计、程序进行正向追踪，或根据程序、软件设计对软件需求进行逆向追踪的能力指的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (155, '软件的可修改性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (156, '软件的可移植性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (157, '软件的可理解性支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (158, '在软件工程的原则中，抽象、信息隐藏、模块化和局部化的原则支持软件的（）。', '单选', NULL);
INSERT INTO `question` VALUES (159, '下列选项中，属于需求分析阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (160, '下列选项中，属于概要设计阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (161, '下列选项中，属于详细设计阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (162, '下列选项中，属于实现阶段的任务的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (163, '下列选项中，在验收测试结束时，必须提交给用户的是（）。', '单选', NULL);
INSERT INTO `question` VALUES (164, '需求分析最终结果是产生（ ）', '单选', NULL);
INSERT INTO `question` VALUES (165, '需求分析中，开发人员要从用户那里解决的最重要的问题是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (166, 'FD 中的每个加工至少有（ ）', '单选', NULL);
INSERT INTO `question` VALUES (167, '数据字典总，一般不出现的条目是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (168, '分层数据流图是一种比较严格又易于理解的描述方式，它的顶层图描述了系统的（ ）', '单选', NULL);
INSERT INTO `question` VALUES (169, '需求规格说明书的内容不应包括对（ ）的描述。', '单选', NULL);
INSERT INTO `question` VALUES (170, '需求规格说明书的作用不应包括（ ）', '单选', NULL);
INSERT INTO `question` VALUES (171, 'SA 方法用DFD 描述（ ）', '单选', NULL);
INSERT INTO `question` VALUES (172, '一个局部数据存储当它作为（ ）时，就把他画出来。', '单选', NULL);
INSERT INTO `question` VALUES (173, '对于分层的DFD，父图与子图的平衡指子图的输入、输出数据流同父图相应加工的输入、输出数据流（ ）', '单选', NULL);
INSERT INTO `question` VALUES (174, '需求分析阶段不适用于描述加工逻辑的工具是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (175, 'SA 方法的分析步骤是首先调查了解当前系统的工作流程，然后（ ）', '单选', NULL);
INSERT INTO `question` VALUES (176, 'SA 方法的基本思想是（ ）', '单选', NULL);
INSERT INTO `question` VALUES (177, '结构化分析方法使用的描述工具( )描述系统由哪几部分组成，各部分之间有什么联系等等。', '单选', NULL);
INSERT INTO `question` VALUES (178, '结构化分析方法(sA) 是一种面向( )需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (179, '需求分析中，对算法的简单描述记录在( ) 中。', '单选', NULL);
INSERT INTO `question` VALUES (180, '数据流图和( )共同构成系统的逻辑模型。', '单选', NULL);
INSERT INTO `question` VALUES (181, '在下面的叙述中， ( )不是软件需求分析的任务。', '单选', NULL);
INSERT INTO `question` VALUES (182, '需求分析是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (183, '结构化分析方法是一种预先严格定义需求的方法，它在实施时强调的是分析对象的( )。', '单选', NULL);
INSERT INTO `question` VALUES (184, '软件开发常使用的两种基本方法是结构化和原型化方法，在实际应用中，它们之间的关系常表现为( )。', '单选', NULL);
INSERT INTO `question` VALUES (185, '结构化生命周期方法具有各种特征，下列各种叙述中， ( )不是结构化方法的特征。', '单选', NULL);
INSERT INTO `question` VALUES (186, 'SA 方法是一种( )。', '单选', NULL);
INSERT INTO `question` VALUES (187, '结构化程序流程图中一般包括三种基本结构，下述结构中( ) 不属于其基本结构。', '单选', NULL);
INSERT INTO `question` VALUES (188, '结构化分析方法以数据流图、()和加工说明等描述工具，即用直观的图和简洁语言来描述软件系统模型。', '单选', NULL);
INSERT INTO `question` VALUES (189, '结构化分析(SA) 是软件开发需求分析阶段所使用的方法， ( )不是SA 所使用的工具。', '单选', NULL);
INSERT INTO `question` VALUES (190, 'Jackson 设计方法是由英国的M ． Jackson 所提出的。它是一种面向( )的软件设计方法。', '单选', NULL);
INSERT INTO `question` VALUES (191, '软件设计中，Jackson方法是一种面向数据结构的设计方法，它将数据结构表示为三种基本结构，分别为( )。', '单选', NULL);
INSERT INTO `question` VALUES (192, '软件工程方法是在实践中不断发展的方法，而早期的软件工程方法是指( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (193, '软件需求分析一般应确定的是用户对软件的( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (194, '系统流程图用于可行性分析中的_____ 的描述。', '单选', NULL);
INSERT INTO `question` VALUES (195, '系统流程图是描述_____ 的工具。', '单选', NULL);
INSERT INTO `question` VALUES (196, '_______ 工具在软件详细设计过程中不采用。', '单选', NULL);
INSERT INTO `question` VALUES (197, '程序的三种基本控制结构是', '单选', NULL);
INSERT INTO `question` VALUES (198, '程序的三种基本控制结构的共同特点是', '单选', NULL);
INSERT INTO `question` VALUES (199, '软件开发过程中，抽取和整理用户需求并建立问题域精确模型的过程叫', '单选', NULL);
INSERT INTO `question` VALUES (200, '原型化方法是用户和设计者之间执行的一种交互构成，适用于______ 系统。', '单选', NULL);
INSERT INTO `question` VALUES (201, '原型化方法是一种_______ 型的设计过程。', '单选', NULL);
INSERT INTO `question` VALUES (202, '进行需求分析可使用多种工具，但( ) 是不适用的。', '单选', NULL);
INSERT INTO `question` VALUES (203, '需求分析阶段研究的对象是软件项目的( )。', '单选', NULL);
INSERT INTO `question` VALUES (204, '数据字典的任务是对于数据流图中出现的所有被命名的数据元素，在数据字典中作为一个词条加以定义，使得每一个图形元素的名字都有一个确切的( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (205, '在数据流图中，有名字及方向的成分是( )。', '单选', NULL);
INSERT INTO `question` VALUES (206, '在结构化分析方法中，用以表达系统内数据的运动情况的工具有( )', '单选', NULL);
INSERT INTO `question` VALUES (207, '在结构化分析方法中，用以表达系统内数据的运动情况的工具有( )', '单选', NULL);
INSERT INTO `question` VALUES (208, '结构化分析方法(SA) 是一种面向( ) 的需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (209, '描述结构化系统分析方法的工具不包括( )', '单选', NULL);
INSERT INTO `question` VALUES (210, '软件需求分析阶段的工作，可以分成以下四个方面：对问题的识别、分析与综合、制定规格说明以及( )。', '单选', NULL);
INSERT INTO `question` VALUES (211, '以下说法错误的是( )。', '单选', NULL);
INSERT INTO `question` VALUES (212, '结构化分析方法使用的描述工具( )定义了数据流图中每一个图形元素。', '单选', NULL);
INSERT INTO `question` VALUES (213, '常用的需求分析方法有面向数据流的结构化分析方法， ( )，面向对象的分析方法等。', '单选', NULL);
INSERT INTO `question` VALUES (214, '结构化分析方法使用的描述工具( )描述系统由哪几部分组成，各部分之间有什么联系等等。', '单选', NULL);
INSERT INTO `question` VALUES (215, '结构化分析方法(sA) 是一种面向( )需求分析方法。', '单选', NULL);
INSERT INTO `question` VALUES (216, '需求分析中，对算法的简单描述记录在( ) 中。', '单选', NULL);
INSERT INTO `question` VALUES (217, '数据流图和( )共同构成系统的逻辑模型。', '单选', NULL);
INSERT INTO `question` VALUES (218, '在下面的叙述中， ( )不是软件需求分析的任务。', '单选', NULL);
INSERT INTO `question` VALUES (219, '需求分析是( ) 。', '单选', NULL);
INSERT INTO `question` VALUES (220, '结构化分析方法是一种预先严格定义需求的方法，它在实施时强调的是分析对象的( )。', '单选', NULL);
INSERT INTO `question` VALUES (221, '软件开发常使用的两种基本方法是结构化和原型化方法，在实际应用中，它们之间的关系常表现为( )。', '单选', NULL);
INSERT INTO `question` VALUES (222, '结构化生命周期方法具有各种特征，下列各种叙述中， ( )不是结构化方法的特征。', '单选', NULL);
INSERT INTO `question` VALUES (223, 'SA 方法是一种( )。', '单选', NULL);
INSERT INTO `question` VALUES (224, '结构化程序流程图中一般包括三种基本结构，下述结构中( ) 不属于其基本结构。', '单选', NULL);
INSERT INTO `question` VALUES (225, '功能测试是系统测试的主要内容， 检查系统的功能、性能是否与需求规格说明相同。', '判断', NULL);
INSERT INTO `question` VALUES (226, '测试只要做到语句覆盖和分支覆盖，就可以发现程序中的所有错误。', '判断', NULL);
INSERT INTO `question` VALUES (227, '代码评审是检查源代码是否达到模块设计的要求。', '判断', NULL);
INSERT INTO `question` VALUES (228, '下列关于alpha 测试的描述中正确的是：', '多选', NULL);
INSERT INTO `question` VALUES (229, '软件验收测试的合格通过准则是：', '多选', NULL);
INSERT INTO `question` VALUES (230, '2018年5月19日08:56:25', '单选', NULL);

-- ----------------------------
-- Table structure for question_comment
-- ----------------------------
DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE `question_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_user_id` bigint(20) NULL DEFAULT NULL,
  `question_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKnbclmldxx1ekypdsx51yk5elj`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKpta4ftl7id85v2dh7dmgm92s1`(`sys_user_id`) USING BTREE,
  INDEX `FKgatho66t7ix04m6dothg6jaqh`(`question_id`) USING BTREE,
  CONSTRAINT `FKgatho66t7ix04m6dothg6jaqh` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKnbclmldxx1ekypdsx51yk5elj` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpta4ftl7id85v2dh7dmgm92s1` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_comment
-- ----------------------------
INSERT INTO `question_comment` VALUES (1, 'α测试是由一个用户在开发环境下进行的测试，也可以是公司内部的用户在模拟实际操作环境下进行的测试。α测试的目的是评价软件产品的FLURPS(即功能、局域化、可用性、可靠性、性能和支持)。尤其注重产品的界面和特色。α测试可以从软件产品编码结束之时开始，或在模块(子系统)测试完成之后开始，也可以在确认测试过程中产品达到一定的稳定和可靠程度之后再开始。α测试即为非正式验收测试。', 0, '297ed65d63691757016369266dc8003c', 1, 113);
INSERT INTO `question_comment` VALUES (2, '我觉得这题很不错', 0, '297ed65d6375b642016375f0d9bb0031', 1, 173);
INSERT INTO `question_comment` VALUES (3, '确实可以，马克了', 0, '297ed65d6375b642016375f1fa870032', 1, 173);
INSERT INTO `question_comment` VALUES (4, 'fasdfds', 0, '297ed65d6375b6420163767eb90d0065', 1, 107);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `download_times` int(11) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsf89nrl55f0mv60lb0h3q5puo`(`sys_modify_log_id`) USING BTREE,
  CONSTRAINT `FKsf89nrl55f0mv60lb0h3q5puo` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '软件工程考试题库，内容丰富，值得下载', 1, '软件工程考试题库.pdf', 'E:\\uploadFile\\2018-05-08\\80fec00c6e9d497d915402e18f1b2dd9.pdf', 2689830, '2016年软考资料', 5, '297ed65d633f5c7301633fc6a83f0061');
INSERT INTO `resource` VALUES (2, '计算机专业认证在线考试系统毕业论文', 1, '谭国炜 - 计算机专业认证在线考试系统.doc', 'E:\\uploadFile\\2018-05-19\\4ce3805edb45410abc95c9be59313e5f.doc', 2697216, '学习资料', 3, '297ed65d6375b642016375b8d3980000');
INSERT INTO `resource` VALUES (3, '2018测试工程师复习资料，保证看完过后能够通过考试', 0, 'test.txt', 'E:\\uploadFile\\2018-05-19\\43bbb3beb6ae465485aa67810efa14a8.txt', 722, '2018测试工程师复习资料', 20, '297ed65d6375b642016376020bab0036');

-- ----------------------------
-- Table structure for resource_comment
-- ----------------------------
DROP TABLE IF EXISTS `resource_comment`;
CREATE TABLE `resource_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good` int(11) NULL DEFAULT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys_user_id` bigint(20) NULL DEFAULT NULL,
  `resource_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKihw7oqex136l0tk6wgpf0d5m8`(`sys_modify_log_id`) USING BTREE,
  INDEX `FKs1pikn2qx5ynr061cxwpq8tja`(`sys_user_id`) USING BTREE,
  INDEX `FK1vlpq2ayslqal3gfec9pims09`(`resource_id`) USING BTREE,
  CONSTRAINT `FK1vlpq2ayslqal3gfec9pims09` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKihw7oqex136l0tk6wgpf0d5m8` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs1pikn2qx5ynr061cxwpq8tja` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_comment
-- ----------------------------
INSERT INTO `resource_comment` VALUES (1, '真的不错啊！点赞！', 5, '297ed65d633f5c7301633fc817bc0062', 1, 1);
INSERT INTO `resource_comment` VALUES (2, '好东西，推荐大家下载', 1, '297ed65d6375b642016375b934a70001', 2, 2);
INSERT INTO `resource_comment` VALUES (3, '顶起来，让更多人看到', 1, '297ed65d6375b642016375bb48b50002', 2, 2);
INSERT INTO `resource_comment` VALUES (4, '确实不错，值得下载', 0, '297ed65d6375b642016375bbf3f10003', 1, 2);
INSERT INTO `resource_comment` VALUES (5, '太贵了', 0, '297ed65d6375b642016376732ef5004e', 1, 3);

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES (1, 'ROLE_USER');
INSERT INTO `sys_authority` VALUES (2, 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_modify_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_modify_log`;
CREATE TABLE `sys_modify_log`  (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `creator_user_id` bigint(20) NULL DEFAULT NULL,
  `modifier_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbg0pwtscsj4egh12km766fj82`(`creator_user_id`) USING BTREE,
  INDEX `FK5b3q5jivjywq0heg9jruu8kpv`(`modifier_user_id`) USING BTREE,
  CONSTRAINT `FK5b3q5jivjywq0heg9jruu8kpv` FOREIGN KEY (`modifier_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbg0pwtscsj4egh12km766fj82` FOREIGN KEY (`creator_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_modify_log
-- ----------------------------
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633f5ce03b0000', '2018-05-08 18:47:21', '2018-05-08 18:48:35', NULL, 1);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47f5c0003', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47f720004', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47f8a0005', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47fa40006', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47fc10007', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47fd40008', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc47ff20009', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48006000a', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4801f000b', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4803f000c', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48051000d', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48065000e', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48076000f', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4808c0010', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc480a20011', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc480b60012', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc480d20013', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc480e50014', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc480ff0015', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481150016', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4812a0017', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4813d0018', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481500019', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48161001a', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48171001b', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48183001c', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48195001d', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481a5001e', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481b3001f', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481c30020', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481d30021', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481e30022', '2018-05-08 20:40:32', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc481fa0023', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4820a0024', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482190025', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482290026', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4823c0027', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482570028', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4826b0029', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4827f002a', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48294002b', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482af002c', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482c2002d', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482d4002e', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482e6002f', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc482f70030', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483060031', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483140032', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483260033', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483390034', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4834c0035', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483590036', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483670037', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483750038', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483840039', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48394003a', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483a6003b', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483b5003c', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483c4003d', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483d4003e', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483e2003f', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc483f00040', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484010041', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484100042', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484200043', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484300044', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4843d0045', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484480046', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484540047', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484610048', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4846c0049', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48478004a', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc48488004b', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484a6004c', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484b8004d', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484c7004e', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484d5004f', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484e30050', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484f00051', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc484fd0052', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4850a0053', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4851a0054', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4852e0055', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4853f0056', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc485510057', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4856f0058', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4857f0059', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4858e005a', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc4859e005b', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc485ad005c', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc485ba005d', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc485c8005e', '2018-05-08 20:40:33', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc485d7005f', '2018-05-08 20:40:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc486010060', '2018-05-08 20:40:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc6a83f0061', '2018-05-08 20:42:53', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fc817bc0062', '2018-05-08 20:44:27', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe0ba6c0063', '2018-05-08 21:11:22', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe1124e0064', '2018-05-08 21:11:44', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326010065', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326100066', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3261c0067', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326290068', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326350069', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe32642006a', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3264e006b', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3265b006c', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe32669006d', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe32677006e', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe32684006f', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3268f0070', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3269c0071', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326b10072', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326c60073', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326d70074', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326e60075', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe326f30076', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe327060077', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d633f5c7301633fe3270e0078', '2018-05-08 21:14:01', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6358a673016358ac7bdb0000', '2018-05-13 16:44:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddab10000', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddc1a0001', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddc3a0002', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddc5f0003', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddc820004', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddcb50005', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddcf30006', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddd240007', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddd480008', '2018-05-16 21:22:34', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddd880009', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691dddbb000a', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691dde05000b', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691dde46000c', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691dde9c000d', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddef4000e', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddf1e000f', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddf620010', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddf860011', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddfbc0012', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163691ddfd90013', '2018-05-16 21:22:35', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bb840014', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bb9c0015', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bbb20016', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bbc60017', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bbdc0018', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bbf20019', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc0b001a', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc1f001b', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc32001c', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc47001d', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc5a001e', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc73001f', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bc8f0020', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bca90021', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bccf0022', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bcf10023', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bd140024', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bd3d0025', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bd630026', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6369175701636921bd6d0027', '2018-05-16 21:26:48', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692346fc0028', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347110029', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234726002a', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234738002b', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234748002c', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234757002d', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234766002e', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234774002f', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347850030', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347990031', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347af0032', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347c10033', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347d60034', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692347eb0035', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692348090036', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692348230037', '2018-05-16 21:28:29', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692348430038', '2018-05-16 21:28:30', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d636917570163692348580039', '2018-05-16 21:28:30', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234869003a', '2018-05-16 21:28:30', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369234870003b', '2018-05-16 21:28:30', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d63691757016369266dc8003c', '2018-05-16 21:31:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a05620000', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a05e80001', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a06120002', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a063a0003', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a066f0004', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a06960005', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a06c40006', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a06e90007', '2018-05-19 01:09:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a070d0008', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a07350009', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a0755000a', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a0772000b', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a079b000c', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a07bc000d', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a07eb000e', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743a0826000f', '2018-05-19 01:09:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743ed9eb0010', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743eda080011', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743eda290012', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743eda4a0013', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743eda690014', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743eda880015', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edaa40016', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edac40017', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edae00018', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb010019', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb1e001a', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb40001b', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb59001c', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb73001d', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edb92001e', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edbac001f', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edbd00020', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edbed0021', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edc1e0022', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d637438800163743edc2d0023', '2018-05-19 01:14:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375b8d3980000', '2018-05-19 08:07:17', NULL, 2, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375b934a70001', '2018-05-19 08:07:41', NULL, 2, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375bb48b50002', '2018-05-19 08:09:58', NULL, 2, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375bbf3f10003', '2018-05-19 08:10:42', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375eb64b70005', '2018-05-19 09:02:31', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ebe70b0006', '2018-05-19 09:03:04', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82700007', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee828b0008', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82a50009', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82b7000a', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82cc000b', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82e2000c', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee82fc000d', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee8318000e', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee832f000f', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83430010', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83550011', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee836b0012', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee837e0013', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee839e0014', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83b50015', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83cb0016', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83e00017', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee83f60018', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee840b0019', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee8421001a', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee8449001b', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee8463001c', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee847b001d', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee848f001e', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee84a1001f', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee84b30020', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee84c70021', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee84dd0022', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee84f30023', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85080024', '2018-05-19 09:05:55', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee852d0025', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85480026', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85850027', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee859e0028', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85b00029', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85be002a', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85cd002b', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85dc002c', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85ea002d', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee85fa002e', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee860e002f', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ee861b0030', '2018-05-19 09:05:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375f0d9bb0031', '2018-05-19 09:08:28', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375f1fa870032', '2018-05-19 09:09:42', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375f8920f0033', '2018-05-19 09:16:54', NULL, NULL, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016375ff4a310035', '2018-05-19 09:24:15', NULL, NULL, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016376020bab0036', '2018-05-19 09:27:15', NULL, 5, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016376067b6f0037', '2018-05-19 09:32:06', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b64201637606c9ae0038', '2018-05-19 09:32:26', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163760806f50039', '2018-05-19 09:33:47', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163760847ad003a', '2018-05-19 09:34:04', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4f7e003b', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4f9f003c', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4fb7003d', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4fcb003e', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4fd8003f', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4fe70040', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d4ff30041', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50000042', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d500f0043', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d501f0044', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50370045', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50470046', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50550047', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50620048', '2018-05-19 11:06:56', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d506f0049', '2018-05-19 11:06:57', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d507e004a', '2018-05-19 11:06:57', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d508e004b', '2018-05-19 11:06:57', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50a4004c', '2018-05-19 11:06:57', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163765d50b8004d', '2018-05-19 11:06:57', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b642016376732ef5004e', '2018-05-19 11:30:50', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767a90fa004f', '2018-05-19 11:38:54', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767b725d0050', '2018-05-19 11:39:51', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e789f0051', '2018-05-19 11:43:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e78ae0052', '2018-05-19 11:43:09', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e78c30053', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e78db0054', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e78ef0055', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e78ff0056', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e79110057', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e791f0058', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e792a0059', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e7939005a', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e794d005b', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e795d005c', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e796a005d', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e797a005e', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e7991005f', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e79a70060', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e79b90061', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e79c70062', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e7a040063', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767e7a0e0064', '2018-05-19 11:43:10', NULL, 1, NULL);
INSERT INTO `sys_modify_log` VALUES ('297ed65d6375b6420163767eb90d0065', '2018-05-19 11:43:26', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sys_modify_log_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_51bvuyvihefoh4kp5syh2jpi4`(`username`) USING BTREE,
  INDEX `FK1t8pwpc3yb6t82lxf8fuhg57v`(`sys_modify_log_id`) USING BTREE,
  CONSTRAINT `FK1t8pwpc3yb6t82lxf8fuhg57v` FOREIGN KEY (`sys_modify_log_id`) REFERENCES `sys_modify_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 7, '管理员', 'dcf09e6d079709b5d62074e324502ba2', 'admin', '297ed65d633f5c7301633f5ce03b0000');
INSERT INTO `sys_user` VALUES (2, 15, '普通用户', 'bdcb720afeae6b349340aad16301294c', 'ares', '297ed65d6358a673016358ac7bdb0000');
INSERT INTO `sys_user` VALUES (3, 10, '长沙学院', 'ac0a164a749fabe17f3bd0b5b6ad1be0', 'ccsu', '297ed65d6375b642016375f8920f0033');
INSERT INTO `sys_user` VALUES (5, 10, 'dsvdsv', '1416f11e0d589d5a0bbcc1b40d1a1c77', 'wanadfsx', '297ed65d6375b642016375ff4a310035');

-- ----------------------------
-- Table structure for sys_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE `sys_user_authority`  (
  `sys_user_id` bigint(20) NOT NULL,
  `sys_authority_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`sys_user_id`, `sys_authority_id`) USING BTREE,
  INDEX `FKirc9pj303j5m5dge3mc73qxwx`(`sys_authority_id`) USING BTREE,
  CONSTRAINT `FKirc9pj303j5m5dge3mc73qxwx` FOREIGN KEY (`sys_authority_id`) REFERENCES `sys_authority` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKltbltvkiwjdr7ctmpsd7srnm9` FOREIGN KEY (`sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_authority
-- ----------------------------
INSERT INTO `sys_user_authority` VALUES (1, 1);
INSERT INTO `sys_user_authority` VALUES (2, 1);
INSERT INTO `sys_user_authority` VALUES (3, 1);
INSERT INTO `sys_user_authority` VALUES (5, 1);
INSERT INTO `sys_user_authority` VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;
