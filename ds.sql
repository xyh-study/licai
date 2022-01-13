/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.5.56 : Database - licai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`licai` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `licai`;

/*Table structure for table `licai_consume` */

DROP TABLE IF EXISTS `licai_consume`;

CREATE TABLE `licai_consume` (
  `id` varchar(50) NOT NULL,
  `c_type` varchar(50) DEFAULT NULL COMMENT '消费类型',
  `c_money` decimal(10,0) DEFAULT NULL,
  `c_max_money` decimal(10,0) DEFAULT NULL,
  `c_date` datetime DEFAULT NULL,
  `u_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `licai_consume` */

insert  into `licai_consume`(`id`,`c_type`,`c_money`,`c_max_money`,`c_date`,`u_id`) values ('1368541594261004288','食品','15','2000','2021-03-01 20:39:00','1369107397888843776'),('1368541874121744384','家用','20','2000','2021-03-03 20:39:10','1369107397888843776'),('1371276125686603776','食品','15',NULL,'2021-03-15 00:00:00','1369107397888843776'),('1371276184507523072','食品','15',NULL,'2021-03-15 00:00:00','1369107397888843776'),('1371276240665059328','食品','15',NULL,'2021-03-15 00:00:00','1369107397888843776'),('1371276792845180928','手机','10',NULL,'2021-03-15 00:00:00','1369216878350049280'),('1372783169937743872','手机','15',NULL,'2021-03-19 00:00:00','1369216878350049280'),('1372784503319568384','美妆','100',NULL,'2021-03-14 00:00:00','1369568107500544000');

/*Table structure for table `licai_family` */

DROP TABLE IF EXISTS `licai_family`;

CREATE TABLE `licai_family` (
  `id` varchar(50) NOT NULL,
  `f_name` varchar(50) DEFAULT NULL COMMENT '家庭成员名称',
  `u_id` varchar(50) DEFAULT NULL COMMENT '会员账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `licai_family` */

insert  into `licai_family`(`id`,`f_name`,`u_id`) values ('1369107397888843776','小美','1367407052804464640'),('1369216878350049280','小林','1367407052804464640'),('1369568107500544000','小王','1367407052804464640');

/*Table structure for table `licai_family_income` */

DROP TABLE IF EXISTS `licai_family_income`;

CREATE TABLE `licai_family_income` (
  `id` varchar(50) NOT NULL,
  `f_name` varchar(50) DEFAULT NULL COMMENT '收入类型',
  `f_income` decimal(10,0) DEFAULT NULL COMMENT '家庭收入',
  `f_type_money` smallint(6) DEFAULT NULL COMMENT '1代表收入,0代表消费',
  `f_date` datetime DEFAULT NULL,
  `u_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `licai_family_income` */

insert  into `licai_family_income`(`id`,`f_name`,`f_income`,`f_type_money`,`f_date`,`u_id`) values ('1369315071293267968','工资收入','9000',1,'2021-02-28 23:52:15','1369107397888843776'),('1369316039737090048','工资收入','10000',1,'2021-02-27 23:55:31','1369216878350049280'),('1369567197709869056','工资收入','6000',1,'2021-02-01 00:00:00','1369107397888843776'),('1369611778480545792','家用','200',0,'2021-03-02 19:31:18','1369107397888843776'),('1369611778480545793','食品','100',0,'2021-03-03 19:32:05','1369107397888843776'),('1369624476027068416','手机','100',0,'2021-03-10 00:00:00','1369216878350049280'),('1371099020738830336','家用','300',0,'2021-03-09 00:00:00','1369107397888843776'),('1371741015610105856','理财收入','2000',1,'2021-02-16 00:00:00','1369568107500544000'),('1372784285781991424','美妆','300',0,'2021-03-14 00:00:00','1369568107500544000');

/*Table structure for table `licai_user` */

DROP TABLE IF EXISTS `licai_user`;

CREATE TABLE `licai_user` (
  `id` varchar(50) NOT NULL COMMENT 'id',
  `u_name` varchar(50) DEFAULT NULL COMMENT '账号',
  `u_password` varchar(32) DEFAULT NULL COMMENT '密码',
  `u_tel` varchar(20) DEFAULT NULL,
  `u_img` varchar(500) DEFAULT NULL COMMENT '头像',
  `u_stop` smallint(6) DEFAULT NULL COMMENT '禁用',
  `u_isadmin` smallint(6) DEFAULT NULL COMMENT '管理员',
  `u_email` varchar(50) DEFAULT NULL,
  `u_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `licai_user` */

insert  into `licai_user`(`id`,`u_name`,`u_password`,`u_tel`,`u_img`,`u_stop`,`u_isadmin`,`u_email`,`u_desc`) values ('1367027456749740032','admin','e10adc3949ba59abbe56e057f20f883e','18380256578','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2382124539,922770330&fm=26&gp=0.jpg',1,1,'123456@qq.com','熊猫说竞技'),('1367119987944595456','lisi','e10adc3949ba59abbe56e057f20f883e','18380006578','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1332282845,3547126283&fm=26&gp=0.jpg',1,1,'25023434@qq.com','超级霞'),('1367121411881443328','zhangsan','e10adc3949ba59abbe56e057f20f883e','18399006578','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2910462874,64375929&fm=26&gp=0.jpg',1,1,'0209@qq.com','说说爱情'),('1367319689143132160','服务考分kof ','e10adc3949ba59abbe56e057f20f883e','2305840190','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2627486285,714348023&fm=26&gp=0.jpg',1,1,'23987902@sina.com','发觉偶发骄傲'),('1367404739478036480','buzhidao','e10adc3949ba59abbe56e057f20f883e','182972994929','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=244154007,3408945172&fm=26&gp=0.jpg',1,1,'buzhidao@qq.com','不知道行不'),('1367405286847291392','taishengyige','e10adc3949ba59abbe56e057f20f883e','18390279328','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.soutu123.cn%2Felement_origin_min_pic%2F16%2F09%2F13%2F2057d7ea86286ed.jpg%21%2Ffw%2F700%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue&refer=http%3A%2F%2Fpic.soutu123.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617441721&t=e5bd808236645259bdcce1ec79e579b8',0,0,'taishengyige@qq.com','不拍你如何的好'),('1367405916953387008','xiongmaotiantian','25f9e794323b453885f5181f1b624d0b','18328479267','https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2372543626,2764414893&fm=26&gp=0.jpg',1,0,'xiongmaotiantian@163.com','熊猫天天'),('1367407052804464640','yaoliyaoqi','e10adc3949ba59abbe56e057f20f883e','182720947492','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1175571471,2229885055&fm=26&gp=0.jpg',1,0,'yaoliyaoqi@163.com','妖里妖气得很'),('1367726721029513216','大熊之影2','e10adc3949ba59abbe56e057f20f883e','1380437042','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2382410051,369363121&fm=26&gp=0.jpg',1,1,'daxiongzhiying@sohu.com','大熊之影'),('1367727059962830848','有车云我笔随我心','e10adc3949ba59abbe56e057f20f883e','1380470032','https://upload.jianshu.io/users/upload_avatars/23849326/f69211c0-03eb-4077-b912-694e5ca1c718.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',1,1,'youchezhiqiang@163.com','有车云我笔随我心'),('1367727334169649152','苍榆之历史','e10adc3949ba59abbe56e057f20f883e','17802374902','https://upload.jianshu.io/users/upload_avatars/23034476/1a963fac-ae0d-4b77-9c16-d478a78daf13.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',1,1,'cangshu@sina.com','苍榆'),('1367738946322571264','seven_小汤豆','96e79218965eb72c92a549dd5a330112','13804743072','https://upload.jianshu.io/users/upload_avatars/16425144/55e80bc4-4fd3-4890-a1c9-c90d7938e299.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',1,1,'seven@sina.com','seven_小汤豆'),('1367739346211708928','柒情社之美','96e79218965eb72c92a549dd5a330112','1382075903','https://upload.jianshu.io/users/upload_avatars/16535071/a7044302-0bd5-4fc1-89e5-00fe934d1dba.png?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',1,1,'qiqise@126.com','柒情社'),('1367739649019486208','里_拉的里_拉','96e79218965eb72c92a549dd5a330112','1380437907','https://upload.jianshu.io/admin/source_image/1bd6b3bb26b959d8bd7a?imageMogr2/auto-orient/strip|imageView2/1/w/134/h/134/format/webp',1,1,'lials@qq.com','里_拉的里_拉'),('1372569630820147200','shoujishuma','e10adc3949ba59abbe56e057f20f883e','13872937421','https://p6-xg.byteimg.com/img/user-avatar/c350f4748ab85d160550e6489e2d8714~tplv-xg-center-qs:116:116:q75.webp',1,0,'shoujishuma@163.com','手机数码'),('1372569915919572992','kepuji','e10adc3949ba59abbe56e057f20f883e','13389274981','https://p6-xg.byteimg.com/img/pgc-image/cadd29304af24668959a2c3198f18c84~tplv-xg-center-qs:116:116:q75.webp',1,0,'kepuji@183.com','可普及'),('1372570387590029312','kaixin56789','e10adc3949ba59abbe56e057f20f883e','13386039851','https://p6-tt-ipv6.byteimg.com/large/user-avatar/818f950adaee2f5290a330ee414bc4ae',1,0,'kaixin56789@qq.com','kaixin56789'),('1372571238803054592','宇宙观察室','e10adc3949ba59abbe56e057f20f883e','18283892811','https://p3-xg.byteimg.com/img/pgc-image/164a3511a8dc4b639dc16d1e30b829d3~tplv-xg-center-qs:116:116:q75.jpg',1,0,'cksaow@sina.com','宇宙观察室');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
