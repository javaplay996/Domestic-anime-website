/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - guocnadongmanwanzan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guocnadongmanwanzan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guocnadongmanwanzan`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','upload/config1.jpg'),(2,'轮播图2','upload/config2.jpg'),(3,'轮播图3','upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'zhuangtai_types','动漫状态',1,'完结',NULL,NULL,'2023-02-25 14:42:31'),(2,'zhuangtai_types','动漫状态',2,'连载',NULL,NULL,'2023-02-25 14:42:31'),(3,'dongman_types','国漫先驱类型',1,'国漫先驱类型1',NULL,NULL,'2023-02-25 14:42:31'),(4,'dongman_types','国漫先驱类型',2,'国漫先驱类型2',NULL,NULL,'2023-02-25 14:42:31'),(5,'dongman_types','国漫先驱类型',3,'国漫先驱类型3',NULL,NULL,'2023-02-25 14:42:31'),(6,'dongman_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-02-25 14:42:32'),(7,'zhuangtai_types','动漫类型',1,'完结',NULL,NULL,'2023-02-25 14:42:32'),(8,'zhuangtai_types','动漫类型',2,'连载',NULL,NULL,'2023-02-25 14:42:32'),(9,'guomanzhizui_types','国漫之最类型',1,'国漫之最类型1',NULL,NULL,'2023-02-25 14:42:32'),(10,'guomanzhizui_types','国漫之最类型',2,'国漫之最类型2',NULL,NULL,'2023-02-25 14:42:32'),(11,'guomanzhizui_types','国漫之最类型',3,'国漫之最类型3',NULL,NULL,'2023-02-25 14:42:32'),(12,'guomanzhizui_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2023-02-25 14:42:32'),(13,'lishiyange_types','内容类型',1,'内容类型1',NULL,NULL,'2023-02-25 14:42:32'),(14,'lishiyange_types','内容类型',2,'内容类型2',NULL,NULL,'2023-02-25 14:42:32'),(15,'lishiyange_types','内容类型',3,'内容类型3',NULL,NULL,'2023-02-25 14:42:32'),(16,'zhishuchang_types','知识类型',1,'知识类型1',NULL,NULL,'2023-02-25 14:42:32'),(17,'zhishuchang_types','知识类型',2,'知识类型2',NULL,NULL,'2023-02-25 14:42:32'),(18,'zhishuchang_types','知识类型',3,'知识类型3',NULL,NULL,'2023-02-25 14:42:32'),(19,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2023-02-25 14:42:32'),(20,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2023-02-25 14:42:32'),(21,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2023-02-25 14:42:32'),(22,'sex_types','性别',1,'男',NULL,NULL,'2023-02-25 14:42:32'),(23,'sex_types','性别',2,'女',NULL,NULL,'2023-02-25 14:42:32'),(24,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2023-02-25 14:42:32'),(25,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2023-02-25 14:42:32');

/*Table structure for table `dongman` */

DROP TABLE IF EXISTS `dongman`;

CREATE TABLE `dongman` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `dongman_name` varchar(200) DEFAULT NULL COMMENT '动漫名称 Search111 ',
  `dongman_types` int(11) DEFAULT NULL COMMENT '国漫先驱类型 Search111',
  `dongman_photo` varchar(200) DEFAULT NULL COMMENT '封面',
  `dongman_video` varchar(200) DEFAULT NULL COMMENT '介绍视频',
  `dongman_shijian` varchar(200) DEFAULT NULL COMMENT '更新时间',
  `dongman_faxing` varchar(200) DEFAULT NULL COMMENT '出品公司',
  `dongman_add` varchar(200) DEFAULT NULL COMMENT '地    区',
  `dongman_gs` varchar(200) DEFAULT NULL COMMENT '发行公司',
  `chuchang_time` date DEFAULT NULL COMMENT '发行日期',
  `dongman_sc` varchar(200) DEFAULT NULL COMMENT '单集时长',
  `dongman_jishu` varchar(200) DEFAULT NULL COMMENT '集    数',
  `dongman_daoyan` varchar(200) DEFAULT NULL COMMENT '导    演',
  `zhuangtai_types` int(11) DEFAULT NULL COMMENT '动漫状态 Search111',
  `dongman_content` text COMMENT '动漫详情',
  `dongman_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='国漫先驱';

/*Data for the table `dongman` */

insert  into `dongman`(`id`,`dongman_name`,`dongman_types`,`dongman_photo`,`dongman_video`,`dongman_shijian`,`dongman_faxing`,`dongman_add`,`dongman_gs`,`chuchang_time`,`dongman_sc`,`dongman_jishu`,`dongman_daoyan`,`zhuangtai_types`,`dongman_content`,`dongman_delete`,`insert_time`,`create_time`) values (1,'动漫名称1',1,'upload/dongman1.jpg','upload/video.mp4','更新时间1','出品公司1','地    区1','发行公司1','2023-02-25','单集时长1','集    数1','导    演1',1,'动漫详情1',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,'动漫名称2',2,'upload/dongman2.jpg','upload/video.mp4','更新时间2','出品公司2','地    区2','发行公司2','2023-02-25','单集时长2','集    数2','导    演2',2,'动漫详情2',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,'动漫名称3',2,'upload/dongman3.jpg','upload/video.mp4','更新时间3','出品公司3','地    区3','发行公司3','2023-02-25','单集时长3','集    数3','导    演3',1,'动漫详情3',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,'动漫名称4',3,'upload/dongman4.jpg','upload/video.mp4','更新时间4','出品公司4','地    区4','发行公司4','2023-02-25','单集时长4','集    数4','导    演4',2,'动漫详情4',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,'动漫名称5',1,'upload/dongman5.jpg','upload/video.mp4','更新时间5','出品公司5','地    区5','发行公司5','2023-02-25','单集时长5','集    数5','导    演5',2,'动漫详情5',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,'动漫名称6',1,'upload/dongman6.jpg','upload/video.mp4','更新时间6','出品公司6','地    区6','发行公司6','2023-02-25','单集时长6','集    数6','导    演6',2,'动漫详情6',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,'动漫名称7',3,'upload/dongman7.jpg','upload/video.mp4','更新时间7','出品公司7','地    区7','发行公司7','2023-02-25','单集时长7','集    数7','导    演7',2,'动漫详情7',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,'动漫名称8',1,'upload/dongman8.jpg','upload/video.mp4','更新时间8','出品公司8','地    区8','发行公司8','2023-02-25','单集时长8','集    数8','导    演8',1,'动漫详情8',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,'动漫名称9',3,'upload/dongman9.jpg','upload/video.mp4','更新时间9','出品公司9','地    区9','发行公司9','2023-02-25','单集时长9','集    数9','导    演9',2,'动漫详情9',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,'动漫名称10',1,'upload/dongman10.jpg','upload/video.mp4','更新时间10','出品公司10','地    区10','发行公司10','2023-02-25','单集时长10','集    数10','导    演10',1,'动漫详情10',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,'动漫名称11',1,'upload/dongman11.jpg','upload/video.mp4','更新时间11','出品公司11','地    区11','发行公司11','2023-02-25','单集时长11','集    数11','导    演11',1,'动漫详情11',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,'动漫名称12',3,'upload/dongman12.jpg','upload/video.mp4','更新时间12','出品公司12','地    区12','发行公司12','2023-02-25','单集时长12','集    数12','导    演12',1,'动漫详情12',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,'动漫名称13',2,'upload/dongman13.jpg','upload/video.mp4','更新时间13','出品公司13','地    区13','发行公司13','2023-02-25','单集时长13','集    数13','导    演13',2,'动漫详情13',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,'动漫名称14',1,'upload/dongman14.jpg','upload/video.mp4','更新时间14','出品公司14','地    区14','发行公司14','2023-02-25','单集时长14','集    数14','导    演14',1,'动漫详情14',1,'2023-02-25 14:42:39','2023-02-25 14:42:39');

/*Table structure for table `dongman_collection` */

DROP TABLE IF EXISTS `dongman_collection`;

CREATE TABLE `dongman_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dongman_id` int(11) DEFAULT NULL COMMENT '国漫先驱',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `dongman_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='国漫先驱收藏';

/*Data for the table `dongman_collection` */

insert  into `dongman_collection`(`id`,`dongman_id`,`yonghu_id`,`dongman_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,2,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,4,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,6,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,7,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,8,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,9,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,10,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,11,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,12,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,13,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(15,11,1,1,'2023-02-25 14:54:48','2023-02-25 14:54:48');

/*Table structure for table `dongman_liuyan` */

DROP TABLE IF EXISTS `dongman_liuyan`;

CREATE TABLE `dongman_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dongman_id` int(11) DEFAULT NULL COMMENT '国漫先驱',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `dongman_liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='国漫先驱留言';

/*Data for the table `dongman_liuyan` */

insert  into `dongman_liuyan`(`id`,`dongman_id`,`yonghu_id`,`dongman_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,3,'留言内容1','2023-02-25 14:42:39','回复信息1','2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,2,2,'留言内容2','2023-02-25 14:42:39','回复信息2','2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,3,2,'留言内容3','2023-02-25 14:42:39','回复信息3','2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,4,2,'留言内容4','2023-02-25 14:42:39','回复信息4','2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,5,3,'留言内容5','2023-02-25 14:42:39','回复信息5','2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,6,2,'留言内容6','2023-02-25 14:42:39','回复信息6','2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,7,1,'留言内容7','2023-02-25 14:42:39','回复信息7','2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,8,1,'留言内容8','2023-02-25 14:42:39','回复信息8','2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,9,1,'留言内容9','2023-02-25 14:42:39','回复信息9','2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,10,1,'留言内容10','2023-02-25 14:42:39','回复信息10','2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,11,2,'留言内容11','2023-02-25 14:42:39','回复信息11','2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,12,1,'留言内容12','2023-02-25 14:42:39','回复信息12','2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,13,1,'留言内容13','2023-02-25 14:42:39','回复信息13','2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,14,2,'留言内容14','2023-02-25 14:42:39','回复信息14','2023-02-25 14:42:39','2023-02-25 14:42:39'),(15,14,1,'123123','2023-02-25 14:54:41','2032131','2023-02-25 14:57:00','2023-02-25 14:54:41');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,'发布内容1',434,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,'帖子标题2',1,NULL,'发布内容2',197,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,'帖子标题3',3,NULL,'发布内容3',337,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,'帖子标题4',1,NULL,'发布内容4',312,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,'帖子标题5',1,NULL,'发布内容5',214,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,'帖子标题6',1,NULL,'发布内容6',20,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,'帖子标题7',3,NULL,'发布内容7',115,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,'帖子标题8',2,NULL,'发布内容8',134,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,'帖子标题9',2,NULL,'发布内容9',124,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,'帖子标题10',3,NULL,'发布内容10',260,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,'帖子标题11',1,NULL,'发布内容11',261,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,'帖子标题12',1,NULL,'发布内容12',15,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,'帖子标题13',2,NULL,'发布内容13',392,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,'帖子标题14',2,NULL,'发布内容14',138,1,'2023-02-25 14:42:39','2023-02-25 14:42:39','2023-02-25 14:42:39'),(15,NULL,1,NULL,'111233',14,2,'2023-02-25 14:55:32',NULL,'2023-02-25 14:55:32'),(16,NULL,NULL,1,'132132213231',14,2,'2023-02-25 14:57:12',NULL,'2023-02-25 14:57:12');

/*Table structure for table `guomanzhizui` */

DROP TABLE IF EXISTS `guomanzhizui`;

CREATE TABLE `guomanzhizui` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `guomanzhizui_name` varchar(200) DEFAULT NULL COMMENT '动漫名称 Search111 ',
  `guomanzhizui_types` int(11) DEFAULT NULL COMMENT '国漫之最类型 Search111',
  `guomanzhizui_photo` varchar(200) DEFAULT NULL COMMENT '封面',
  `guomanzhizui_video` varchar(200) DEFAULT NULL COMMENT '介绍视频',
  `guomanzhizui_shijian` varchar(200) DEFAULT NULL COMMENT '更新时间',
  `guomanzhizui_faxing` varchar(200) DEFAULT NULL COMMENT '出品公司',
  `guomanzhizui_add` varchar(200) DEFAULT NULL COMMENT '地    区',
  `guomanzhizui_gs` varchar(200) DEFAULT NULL COMMENT '发行公司',
  `chuchang_time` date DEFAULT NULL COMMENT '发行日期',
  `guomanzhizui_sc` varchar(200) DEFAULT NULL COMMENT '单集时长',
  `guomanzhizui_jishu` varchar(200) DEFAULT NULL COMMENT '集    数',
  `guomanzhizui_daoyan` varchar(200) DEFAULT NULL COMMENT '导    演',
  `zhuangtai_types` int(11) DEFAULT NULL COMMENT '动漫状态 Search111',
  `guomanzhizui_content` text COMMENT '动漫详情',
  `guomanzhizui_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='国漫之最';

/*Data for the table `guomanzhizui` */

insert  into `guomanzhizui`(`id`,`guomanzhizui_name`,`guomanzhizui_types`,`guomanzhizui_photo`,`guomanzhizui_video`,`guomanzhizui_shijian`,`guomanzhizui_faxing`,`guomanzhizui_add`,`guomanzhizui_gs`,`chuchang_time`,`guomanzhizui_sc`,`guomanzhizui_jishu`,`guomanzhizui_daoyan`,`zhuangtai_types`,`guomanzhizui_content`,`guomanzhizui_delete`,`insert_time`,`create_time`) values (1,'动漫名称1',2,'upload/guomanzhizui1.jpg','upload/video.mp4','更新时间1','出品公司1','地    区1','发行公司1','2023-02-25','单集时长1','集    数1','导    演1',2,'动漫详情1',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,'动漫名称2',2,'upload/guomanzhizui2.jpg','upload/video.mp4','更新时间2','出品公司2','地    区2','发行公司2','2023-02-25','单集时长2','集    数2','导    演2',1,'动漫详情2',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,'动漫名称3',3,'upload/guomanzhizui3.jpg','upload/video.mp4','更新时间3','出品公司3','地    区3','发行公司3','2023-02-25','单集时长3','集    数3','导    演3',1,'动漫详情3',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,'动漫名称4',3,'upload/guomanzhizui4.jpg','upload/video.mp4','更新时间4','出品公司4','地    区4','发行公司4','2023-02-25','单集时长4','集    数4','导    演4',2,'动漫详情4',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,'动漫名称5',1,'upload/guomanzhizui5.jpg','upload/video.mp4','更新时间5','出品公司5','地    区5','发行公司5','2023-02-25','单集时长5','集    数5','导    演5',1,'动漫详情5',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,'动漫名称6',1,'upload/guomanzhizui6.jpg','upload/video.mp4','更新时间6','出品公司6','地    区6','发行公司6','2023-02-25','单集时长6','集    数6','导    演6',2,'动漫详情6',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,'动漫名称7',2,'upload/guomanzhizui7.jpg','upload/video.mp4','更新时间7','出品公司7','地    区7','发行公司7','2023-02-25','单集时长7','集    数7','导    演7',1,'动漫详情7',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,'动漫名称8',3,'upload/guomanzhizui8.jpg','upload/video.mp4','更新时间8','出品公司8','地    区8','发行公司8','2023-02-25','单集时长8','集    数8','导    演8',2,'动漫详情8',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,'动漫名称9',2,'upload/guomanzhizui9.jpg','upload/video.mp4','更新时间9','出品公司9','地    区9','发行公司9','2023-02-25','单集时长9','集    数9','导    演9',1,'动漫详情9',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,'动漫名称10',2,'upload/guomanzhizui10.jpg','upload/video.mp4','更新时间10','出品公司10','地    区10','发行公司10','2023-02-25','单集时长10','集    数10','导    演10',2,'动漫详情10',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,'动漫名称11',3,'upload/guomanzhizui11.jpg','upload/video.mp4','更新时间11','出品公司11','地    区11','发行公司11','2023-02-25','单集时长11','集    数11','导    演11',1,'动漫详情11',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,'动漫名称12',3,'upload/guomanzhizui12.jpg','upload/video.mp4','更新时间12','出品公司12','地    区12','发行公司12','2023-02-25','单集时长12','集    数12','导    演12',2,'动漫详情12',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,'动漫名称13',3,'upload/guomanzhizui13.jpg','upload/video.mp4','更新时间13','出品公司13','地    区13','发行公司13','2023-02-25','单集时长13','集    数13','导    演13',2,'动漫详情13',1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,'动漫名称14',2,'upload/guomanzhizui14.jpg','upload/video.mp4','更新时间14','出品公司14','地    区14','发行公司14','2023-02-25','单集时长14','集    数14','导    演14',1,'动漫详情14',1,'2023-02-25 14:42:39','2023-02-25 14:42:39');

/*Table structure for table `guomanzhizui_collection` */

DROP TABLE IF EXISTS `guomanzhizui_collection`;

CREATE TABLE `guomanzhizui_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `guomanzhizui_id` int(11) DEFAULT NULL COMMENT '国漫之最',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `guomanzhizui_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='国漫之最收藏';

/*Data for the table `guomanzhizui_collection` */

insert  into `guomanzhizui_collection`(`id`,`guomanzhizui_id`,`yonghu_id`,`guomanzhizui_collection_types`,`insert_time`,`create_time`) values (1,1,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,2,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,3,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,4,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,5,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,6,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,7,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,8,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,10,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,11,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,12,1,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,13,3,1,'2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,14,2,1,'2023-02-25 14:42:39','2023-02-25 14:42:39');

/*Table structure for table `guomanzhizui_liuyan` */

DROP TABLE IF EXISTS `guomanzhizui_liuyan`;

CREATE TABLE `guomanzhizui_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `guomanzhizui_id` int(11) DEFAULT NULL COMMENT '国漫之最',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `guomanzhizui_liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 listShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='国漫之最留言';

/*Data for the table `guomanzhizui_liuyan` */

insert  into `guomanzhizui_liuyan`(`id`,`guomanzhizui_id`,`yonghu_id`,`guomanzhizui_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2023-02-25 14:42:39','回复信息1','2023-02-25 14:42:39','2023-02-25 14:42:39'),(2,2,2,'留言内容2','2023-02-25 14:42:39','回复信息2','2023-02-25 14:42:39','2023-02-25 14:42:39'),(3,3,3,'留言内容3','2023-02-25 14:42:39','回复信息3','2023-02-25 14:42:39','2023-02-25 14:42:39'),(4,4,2,'留言内容4','2023-02-25 14:42:39','回复信息4','2023-02-25 14:42:39','2023-02-25 14:42:39'),(5,5,3,'留言内容5','2023-02-25 14:42:39','回复信息5','2023-02-25 14:42:39','2023-02-25 14:42:39'),(6,6,2,'留言内容6','2023-02-25 14:42:39','回复信息6','2023-02-25 14:42:39','2023-02-25 14:42:39'),(7,7,2,'留言内容7','2023-02-25 14:42:39','回复信息7','2023-02-25 14:42:39','2023-02-25 14:42:39'),(8,8,1,'留言内容8','2023-02-25 14:42:39','回复信息8','2023-02-25 14:42:39','2023-02-25 14:42:39'),(9,9,1,'留言内容9','2023-02-25 14:42:39','回复信息9','2023-02-25 14:42:39','2023-02-25 14:42:39'),(10,10,1,'留言内容10','2023-02-25 14:42:39','回复信息10','2023-02-25 14:42:39','2023-02-25 14:42:39'),(11,11,2,'留言内容11','2023-02-25 14:42:39','回复信息11','2023-02-25 14:42:39','2023-02-25 14:42:39'),(12,12,2,'留言内容12','2023-02-25 14:42:39','回复信息12','2023-02-25 14:42:39','2023-02-25 14:42:39'),(13,13,3,'留言内容13','2023-02-25 14:42:39','回复信息13','2023-02-25 14:42:39','2023-02-25 14:42:39'),(14,14,2,'留言内容14','2023-02-25 14:42:39','回复信息14','2023-02-25 14:42:39','2023-02-25 14:42:39'),(15,2,1,'123','2023-02-25 14:55:07',NULL,NULL,'2023-02-25 14:55:07');

/*Table structure for table `lishiyange` */

DROP TABLE IF EXISTS `lishiyange`;

CREATE TABLE `lishiyange` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lishiyange_name` varchar(200) DEFAULT NULL COMMENT '标题  Search111 ',
  `lishiyange_types` int(11) DEFAULT NULL COMMENT '内容类型  Search111 ',
  `lishiyange_photo` varchar(200) DEFAULT NULL COMMENT '图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `lishiyange_content` text COMMENT '详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='历史沿革';

/*Data for the table `lishiyange` */

insert  into `lishiyange`(`id`,`lishiyange_name`,`lishiyange_types`,`lishiyange_photo`,`insert_time`,`lishiyange_content`,`create_time`) values (1,'标题1',2,'upload/lishiyange1.jpg','2023-02-25 14:42:39','详情1','2023-02-25 14:42:39'),(2,'标题2',2,'upload/lishiyange2.jpg','2023-02-25 14:42:39','详情2','2023-02-25 14:42:39'),(3,'标题3',1,'upload/lishiyange3.jpg','2023-02-25 14:42:39','详情3','2023-02-25 14:42:39'),(4,'标题4',1,'upload/lishiyange4.jpg','2023-02-25 14:42:39','详情4','2023-02-25 14:42:39'),(5,'标题5',2,'upload/lishiyange5.jpg','2023-02-25 14:42:39','详情5','2023-02-25 14:42:39'),(6,'标题6',3,'upload/lishiyange6.jpg','2023-02-25 14:42:39','详情6','2023-02-25 14:42:39'),(7,'标题7',3,'upload/lishiyange7.jpg','2023-02-25 14:42:39','详情7','2023-02-25 14:42:39'),(8,'标题8',3,'upload/lishiyange8.jpg','2023-02-25 14:42:39','详情8','2023-02-25 14:42:39'),(9,'标题9',2,'upload/lishiyange9.jpg','2023-02-25 14:42:39','详情9','2023-02-25 14:42:39'),(10,'标题10',1,'upload/lishiyange10.jpg','2023-02-25 14:42:39','详情10','2023-02-25 14:42:39'),(11,'标题11',1,'upload/lishiyange11.jpg','2023-02-25 14:42:39','详情11','2023-02-25 14:42:39'),(12,'标题12',2,'upload/lishiyange12.jpg','2023-02-25 14:42:39','详情12','2023-02-25 14:42:39'),(13,'标题13',2,'upload/lishiyange13.jpg','2023-02-25 14:42:39','详情13','2023-02-25 14:42:39'),(14,'标题14',1,'upload/lishiyange14.jpg','2023-02-25 14:42:39','详情14','2023-02-25 14:42:39');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',2,'upload/news1.jpg','2023-02-25 14:42:39','公告详情1','2023-02-25 14:42:39'),(2,'公告标题2',1,'upload/news2.jpg','2023-02-25 14:42:39','公告详情2','2023-02-25 14:42:39'),(3,'公告标题3',3,'upload/news3.jpg','2023-02-25 14:42:39','公告详情3','2023-02-25 14:42:39'),(4,'公告标题4',2,'upload/news4.jpg','2023-02-25 14:42:39','公告详情4','2023-02-25 14:42:39'),(5,'公告标题5',2,'upload/news5.jpg','2023-02-25 14:42:39','公告详情5','2023-02-25 14:42:39'),(6,'公告标题6',2,'upload/news6.jpg','2023-02-25 14:42:39','公告详情6','2023-02-25 14:42:39'),(7,'公告标题7',2,'upload/news7.jpg','2023-02-25 14:42:39','公告详情7','2023-02-25 14:42:39'),(8,'公告标题8',3,'upload/news8.jpg','2023-02-25 14:42:39','公告详情8','2023-02-25 14:42:39'),(9,'公告标题9',2,'upload/news9.jpg','2023-02-25 14:42:39','公告详情9','2023-02-25 14:42:39'),(10,'公告标题10',2,'upload/news10.jpg','2023-02-25 14:42:39','公告详情10','2023-02-25 14:42:39'),(11,'公告标题11',2,'upload/news11.jpg','2023-02-25 14:42:39','公告详情11','2023-02-25 14:42:39'),(12,'公告标题12',1,'upload/news12.jpg','2023-02-25 14:42:39','公告详情12','2023-02-25 14:42:39'),(13,'公告标题13',3,'upload/news13.jpg','2023-02-25 14:42:39','公告详情13','2023-02-25 14:42:39'),(14,'公告标题14',1,'upload/news14.jpg','2023-02-25 14:42:39','公告详情14','2023-02-25 14:42:39');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '学生id',
  `username` varchar(100) NOT NULL COMMENT '学生名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','w1jsfy3rneo5burlvsxwj5txv0k55xo7','2023-02-25 14:51:13','2023-02-25 15:58:32'),(2,1,'a1','yonghu','用户','poh1k0ooreglc6h78dk3r5tvig89ixru','2023-02-25 14:52:26','2023-02-25 15:54:30');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '学生名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2023-02-25 14:42:31');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '头像',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `yonghu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`sex_types`,`yonghu_photo`,`yonghu_id_number`,`yonghu_phone`,`yonghu_email`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1',2,'upload/yonghu1.jpg','410224199010102001','17703786901','1@qq.com',1,'2023-02-25 14:42:39'),(2,'a2','123456','用户姓名2',1,'upload/yonghu2.jpg','410224199010102002','17703786902','2@qq.com',1,'2023-02-25 14:42:39'),(3,'a3','123456','用户姓名3',2,'upload/yonghu3.jpg','410224199010102003','17703786903','3@qq.com',1,'2023-02-25 14:42:39');

/*Table structure for table `zhishuchang` */

DROP TABLE IF EXISTS `zhishuchang`;

CREATE TABLE `zhishuchang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhishuchang_name` varchar(200) DEFAULT NULL COMMENT '知识标题  Search111 ',
  `zhishuchang_types` int(11) DEFAULT NULL COMMENT '知识类型  Search111 ',
  `zhishuchang_photo` varchar(200) DEFAULT NULL COMMENT '知识图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `zhishuchang_content` text COMMENT '知识详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='知识窗';

/*Data for the table `zhishuchang` */

insert  into `zhishuchang`(`id`,`zhishuchang_name`,`zhishuchang_types`,`zhishuchang_photo`,`insert_time`,`zhishuchang_content`,`create_time`) values (1,'知识标题1',2,'upload/zhishuchang1.jpg','2023-02-25 14:42:39','知识详情1','2023-02-25 14:42:39'),(2,'知识标题2',1,'upload/zhishuchang2.jpg','2023-02-25 14:42:39','知识详情2','2023-02-25 14:42:39'),(3,'知识标题3',1,'upload/zhishuchang3.jpg','2023-02-25 14:42:39','知识详情3','2023-02-25 14:42:39'),(4,'知识标题4',3,'upload/zhishuchang4.jpg','2023-02-25 14:42:39','知识详情4','2023-02-25 14:42:39'),(5,'知识标题5',3,'upload/zhishuchang5.jpg','2023-02-25 14:42:39','知识详情5','2023-02-25 14:42:39'),(6,'知识标题6',3,'upload/zhishuchang6.jpg','2023-02-25 14:42:39','知识详情6','2023-02-25 14:42:39'),(7,'知识标题7',1,'upload/zhishuchang7.jpg','2023-02-25 14:42:39','知识详情7','2023-02-25 14:42:39'),(8,'知识标题8',3,'upload/zhishuchang8.jpg','2023-02-25 14:42:39','知识详情8','2023-02-25 14:42:39'),(9,'知识标题9',1,'upload/zhishuchang9.jpg','2023-02-25 14:42:39','知识详情9','2023-02-25 14:42:39'),(10,'知识标题10',1,'upload/zhishuchang10.jpg','2023-02-25 14:42:39','知识详情10','2023-02-25 14:42:39'),(11,'知识标题11',2,'upload/zhishuchang11.jpg','2023-02-25 14:42:39','知识详情11','2023-02-25 14:42:39'),(12,'知识标题12',1,'upload/zhishuchang12.jpg','2023-02-25 14:42:39','知识详情12','2023-02-25 14:42:39'),(13,'知识标题13',1,'upload/zhishuchang13.jpg','2023-02-25 14:42:39','知识详情13','2023-02-25 14:42:39'),(14,'知识标题14',2,'upload/zhishuchang14.jpg','2023-02-25 14:42:39','知识详情14','2023-02-25 14:42:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
