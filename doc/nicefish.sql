/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.8-MariaDB-log : Database - nicefish
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nicefish` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nicefish`;

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`permission_name`) values (1,'view_permission'),(2,'create_role'),(3,'edit_role'),(4,'view_role'),(5,'del_role'),(6,'assign_permissions_to_role'),(7,'view_permissions_by_role'),(8,'create_users'),(9,'edit_users'),(10,'view_users'),(11,'delete_users'),(12,'assign_users_to_role'),(13,'view_users_by_role'),(14,'add_comment'),(15,'del_comment'),(16,'add_post'),(17,'del_post'),(18,'edit_post');

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `auth_role` */

insert  into `auth_role`(`id`,`role_name`) values (1,'admin');

/*Table structure for table `auth_role_permission` */

DROP TABLE IF EXISTS `auth_role_permission`;

CREATE TABLE `auth_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_role_permission` */

insert  into `auth_role_permission`(`id`,`role_id`,`permission_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18);

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `nick_name` varchar(64) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `password` varchar(1000) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`email`,`mobile`,`nick_name`,`first_name`,`last_name`,`password`,`country`,`create_time`) values (38,'damoqiongqiu@126.com',NULL,'大漠穷秋',NULL,NULL,'$2a$10$kLDm3FQC78y/vhbRppacxegmsDR.wT9XZqAJHfNlny3sixr/N8UqG',NULL,'2019-01-06 11:44:08');

/*Table structure for table `auth_user_role` */

DROP TABLE IF EXISTS `auth_user_role`;

CREATE TABLE `auth_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_role` */

insert  into `auth_user_role`(`id`,`role_id`,`user_id`) values (1,1,38);

/*Table structure for table `blog_comment` */

DROP TABLE IF EXISTS `blog_comment`;

CREATE TABLE `blog_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `CONTENT` text,
  `COMMENT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `COMMENT_IP` varchar(64) DEFAULT NULL COMMENT '评论者的IP地址',
  `P_ID` varchar(64) DEFAULT '-1',
  `USER_ID` int(11) NOT NULL DEFAULT '-1',
  `USER_NAME` varchar(64) DEFAULT NULL,
  `NICK_NAME` varchar(64) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '1' COMMENT '评论状态：0：已删除；1：已发布；2:优质评论；',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `blog_comment` */

insert  into `blog_comment`(`COMMENT_ID`,`POST_ID`,`CONTENT`,`COMMENT_TIME`,`COMMENT_IP`,`P_ID`,`USER_ID`,`USER_NAME`,`NICK_NAME`,`EMAIL`,`STATUS`) values (1,1,'代购肯定是国家重点整治的，特别是国外代购。因为它基本上于走私是同等性质。只是造了个新词，代购！','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(2,1,'想问一下下，那些明星国外都是几百万的买东西，回国的时候。会查吗？要交税吗？','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(3,1,'问题 代购你就代购吧 这点无可厚非 之前没有相关法律 这是法律和定制法律者的疏忽和责任，也是社会的进步过程 最不能理解的还是代购真假混卖','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(4,1,'代购和自购怎么区分 有时候个人出去一次恨不得把一年货买了带回来，这个怎么鉴别','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(5,1,'我朋友圈的代购都活着呢[捂脸]','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(6,1,'我觉得微商才最可怕','2019-01-03 18:33:35',NULL,'-1',38,NULL,NULL,NULL,1),(7,5,'测试评论测试评论测试评论测试评论','2019-04-13 11:19:18',NULL,NULL,38,NULL,NULL,NULL,NULL);

/*Table structure for table `blog_params` */

DROP TABLE IF EXISTS `blog_params`;

CREATE TABLE `blog_params` (
  `PARAM_KEY` varchar(128) NOT NULL,
  `PARAM_VALUE` varchar(2048) NOT NULL,
  `PARAM_DESC` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`PARAM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表。';

/*Data for the table `blog_params` */

insert  into `blog_params`(`PARAM_KEY`,`PARAM_VALUE`,`PARAM_DESC`) values ('COMMENT_PAGE_NUM','10','文章评论每页显示的条数'),('COMMENT_TIME_INTERVAL','3','*分钟内不允许多次发表评论'),('HEAD_IMG_FILE_SIZE_MAX','1','用户头像最大尺寸（M）'),('MAX_COMMENT_SIZE','10000','评论Bean缓存容量'),('MAX_FILE_SIZE','10','写文章上传附件时文件的最大尺寸（M）'),('MNG_POST_MAX_PAGE_SIZE','10','管理后台文章列表最大显示的页码数'),('MNG_POST_PAGE_NUM','20','用户管理后台文章列表每页显示文章的数量'),('POST_COMMENT_NUM','20','文章评论每页显示的条数'),('POST_CONTENT_LEN','140','文章列表显示的缩略内容字符数'),('POST_FILE_SIZE_MAX','50','文章附件单个文件最大尺寸（M）'),('POST_IMG_FILE_SIZE_MAX','1','文章内部图片最大文件尺寸（M）'),('POST_MAX_PAGE_SIZE','10','文章列表最大显示的页码数'),('POST_PAGE_NUM','20','文章列表每页显示文章的数量'),('UPLOAD_FILE_DIR','TOMCAT','上传文件存放的目录');

/*Table structure for table `blog_post` */

DROP TABLE IF EXISTS `blog_post`;

CREATE TABLE `blog_post` (
  `BG_IMG` varchar(256) DEFAULT NULL COMMENT '缩略图链接',
  `POST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_TITLE` varchar(128) NOT NULL,
  `POST_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POST_SUMMARY` varchar(1024) DEFAULT NULL COMMENT '摘要，文章列表页需要使用',
  `POST_CONTENT` text COMMENT '内容',
  `ORIGINAL_URL` varchar(512) DEFAULT NULL COMMENT '原文链接，如果有这个字段，说明是翻译文章',
  `POST_TYPE` int(11) NOT NULL DEFAULT '0' COMMENT '文章的类型，0原创1翻译',
  `LAST_MODIFY_TIME` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `READ_TIMES` int(11) NOT NULL DEFAULT '1' COMMENT '阅读数',
  `LIKED_TIMES` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `COMMENT_TIMES` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `USER_ID` int(11) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `NICK_NAME` varchar(64) DEFAULT NULL,
  `ENABLE_COMMENT` int(11) NOT NULL DEFAULT '1' COMMENT '是否可评论\n            0不可\n            1可',
  `STATUS` int(11) NOT NULL DEFAULT '4' COMMENT '状态：\n            1、已删除\n            2、已归档，已归档的内容禁止评论，文章不可删除\n            3、草稿\n            4、已发布\n            5、精华-->精华文章不可删除\n            6、已推至首页\n            ',
  PRIMARY KEY (`POST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `blog_post` */

insert  into `blog_post`(`BG_IMG`,`POST_ID`,`POST_TITLE`,`POST_TIME`,`POST_SUMMARY`,`POST_CONTENT`,`ORIGINAL_URL`,`POST_TYPE`,`LAST_MODIFY_TIME`,`READ_TIMES`,`LIKED_TIMES`,`COMMENT_TIMES`,`USER_ID`,`EMAIL`,`NICK_NAME`,`ENABLE_COMMENT`,`STATUS`) values (NULL,1,'《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？ ','2019-01-03 13:02:58',NULL,'1月1日，《中华人民共和国电子商务法》（以下简称《电商法》）施行第一天，代购圈里就传出了微信被封号的消息：“打广告要被封”、“朋友圈限流降权”。\r\n\r\n一些代购担心被封号，开始采取英文加漫画的方式来发朋友圈。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n图片来源于网络\r\n\r\n代购群里流传的“买超过一万直接被扣”、“过往记录都被查，直接进局子”等消息，刺激着每个代购的神经。\r\n\r\n选择冒险的人还在国外。\r\n\r\n12月28日飞韩国济州岛，1月1日转机日本东京，1月9号回国。\r\n\r\n2019年跨年、十三天、两个国家，代购同行们都说佳妮“疯了”。\r\n\r\n《电商法》规定，代购需要持有中国和购买国的两方营业执照，偷税漏税的监管和处罚也会大幅度加强，罚款金额上限高达200万元，还要承担刑事责任。\r\n\r\n“敏感期，谁都不敢当出头鸟，但总得有人去试试水”，佳妮说。\r\n\r\n做了四年人肉代购，风险这事儿在她看来是薛定谔的猫，盒子没开，怎么断定是“生”是“死”？盒子里的诱惑太大了，一个月前，佳妮的朋友圈照常开启了刷屏接单模式。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n佳妮的朋友圈\r\n\r\n锌财经询问了多个人肉代购，大部分表示在这段时间选择停飞，即使跨年是商场打折的采购黄金期。这场灰色地带的危险狂欢，在冬天呈现出最后的盛宴。\r\n\r\n“最后一趟！”、“转行清仓！”、“明年涨价！”2018年年末，代购的朋友圈呈现出大萧条来临前的恐慌。\r\n\r\n佳妮心怀忐忑地飞到首尔，和国内紧张的气氛相比，免税店欢欣鼓舞的节日气氛和“人暴多！丝毫没有减少”的景象让她有些意外。\r\n\r\n利益的驱动下，“疯子”并不是少数。\r\n\r\n佳妮在首尔暴走了两天，春节将至，手头上的订单暴增，她全程疯狂采购扫货，甚至无暇发朋友圈。\r\n\r\n《中国进口消费市场报告》显示，以天猫国际为例，中国跨境电商零售进口渗透率从2014年的1.6%迅速攀升至2017年的10.2%。消费者对海外商品的探索欲和需求变大，是催生代购的主要原因。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n2014-2017跨境电商零售进口渗透率\r\n\r\n除了满足国内消费者，代购也形成了一条产业链。对于华人快递、返点公司、小众美妆品牌来说，代购是他们不可或缺的客户。\r\n\r\n新电商法的出台，在整个产业链中炸出一声惊雷。\r\n刀刃舔血\r\n\r\nMCM双肩包、MLB的棒球帽、阿迪的贝壳头，这曾经是代购们过关的标配三件套。而现在为了更像个游客，他们换上太阳帽，蹬上了细高跟。\r\n\r\n“你知道光头和娜姐吗？”佳妮说道，“是上海海关工作人员，我们代购圈里的大魔头。微博、微信等社交平台还有人出售他俩的排班表。”在2017年6月她曾遭遇过一次娜姐的开箱检查。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n海关开箱检查 图片来源于网络\r\n\r\n那阵子是韩国打折季，PRADA、MCM、菲拉格慕等奢侈品牌7折优惠，佳妮带着老公一起去抢购。他们从转盘上取下行李，站上T1航站楼的扶梯，远远看到海关通道挤满了人。\r\n\r\n“今天肯定很严”，她心里咯噔一下。容不得多想，佳妮快速撕下行李托运牌贴在丈夫机票后面，又从背包里翻出宝格丽项链，挂在了脖子上。\r\n\r\n“那天除了帽子没戴，代购三件套我穿了俩。”佳妮把箱子搬上传送带，余光瞥见娜姐紧盯着机器上的显示屏。箱子里有几瓶化妆水和两个海蓝之谜面霜，佳妮知道显示屏上会清楚呈现阴影形态。\r\n\r\n“等一下。”不出意料，娜姐伸手拦下，戴上让代购闻风丧胆的白手套。她搅动箱子翻查着衣物，抽出被压扁的口红盒，在夹层里倒出散落的口红，举起宝格丽的盒子：“项链呢？”佳妮指了指脖子。\r\n\r\n“不可能就这么点东西，你和谁一起来的，没有托运行李吗？”娜姐问。\r\n\r\n“和我老公，他已经出去了。”佳妮撒了个谎，脱了身。\r\n\r\n“贵重的东西在我老公那个托运行李箱里。”佳妮在关口焦急得等待，机场冷气十足，她的衣服被冷汗浸湿了一半。\r\n\r\n二十分钟后，看到丈夫一脸轻松地出来，她的心才终于落了地。\r\n\r\n“我们知道代购不是光明的赚钱方式。”佳妮坦言。\r\n\r\n代购行业伴随着风险。2014年，北京市高级人民法院对多次重审的空姐代购案一锤定音，偷逃税款8万余元，判处3年有期徒刑。2018年，淘宝店主游燕往返香港代购逃税300万元，判刑10年，处罚金550万元……\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n空姐代购案 图片来源于网络\r\n\r\n这些风险，由于概率不高，不少代购还存在着侥幸的心理。\r\n\r\n电商法出台后，持续被曝出的严查新闻，让代购们实实在在慌张了起来。\r\n\r\n很多代购还记得2018年9月28日的“黑色星期五”。那天，上海海关严查浦东机场T2航站楼，被查处代购人数高达100多人。这是场海关再正常不过的通关检查，代购们更愿意用“血洗”、“大屠杀”、“末日”等血腥的词汇来形容这一天。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n9月28日代购罚单 图片来源于网络\r\n\r\n10只唇膏罚款1800、1万护肤品被罚3000，带了178万元手表的男子径直跪在海关办公室……白天直播免税店的代购们，这个晚上开始直播交罚款的长队。\r\n\r\n这次严查，确实让一些代购恐慌。任职于北京德和衡（杭州）律师事务所的王森告诉锌财经，通过这种严查，以及案件式的打击，能够起到震慑作用。\r\n\r\n佳妮也曾经被查到，交过一万多元的罚款。离不开代购收入的人依然在刀刃舔血。\r\n\r\n佳妮提到，有些家庭的收入都靠代购，他们想方设法过海关，“我亲眼看到过一个代购把一堆奢侈品塞到小孩子的婴儿车底，毕竟很少海关会让你抬上婴儿车过检查。”\r\n多米诺骨牌效应\r\n\r\n这次电商法的颁布，影响不只是代购的生意，还将影响上下游的生意。\r\n\r\n“非常焦虑\"，ToWhere全球快递公司创始人Peter Li用一个词形容美国华人快递公司的现状。\r\n\r\n《电商法》还未实施，华人快递及其相关的清关公司就开始采取措施。“大家都担心在法案推行前会出问题，所以在去年12月中旬、下旬，有一部分华人快递公司已经关闭了他们的收货渠道。” Peter Li说。\r\n\r\n代购曾经让华人快递的生意红火起来。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n爆火的华人快递\r\n\r\n“十年前全美只有几家华人快递公司，到了2012年左右就开始遍地开花。不夸张地说，华人快递80%的寄件量都和代购有关。”在 Peter Li眼里，代购是华人快递兴起的重要推手。行业中，代购也有一个独属的业内名词——“买手”。\r\n\r\n美国到中国人肉代购的成本过高，通常通过快递的方式寄件。快递主要有两条途径。第一是通过美国的邮政，会有一个申报的过程，申报后有一定的抽查比率，如果被抽查到金额过高，就需要交关税。\r\n\r\n而另一种，是包关税的华人快递，为了省去被抽查的提心吊胆，代购们几乎都选择了后者。\r\n\r\n这之中，作为连接的华人快递便是大潮驱动下奔涌向前的一环。“其中一个卖轻奢包的客户，每天的寄件量就可以达到300到500个”，Peter Li补充道。\r\n\r\n美国著名华人快递——新干线在洛克菲勒中心发布的业务统计报告显示，该公司2016年从美国向中国投递的包裹比2015年增加37%，2017年较2016年激增143%。\r\n\r\n华人快递的准入门槛很低，大部分都以加盟形式成为大的华人快递公司的代售点。Peter Li说，在他居住的小区里，华人快递遍地都是。“药店、花店开辟出一个柜台，甚至自己家的车库都能成为一个代收点。”\r\n\r\n即便如此，在圣诞、跨年、黑五等旺季依然供不应求、需要排队寄件。“早上九点开门到晚上八点下班，那些工作人员有的时候连午饭都顾不上吃一口。”\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n黑五购物潮 图片来源于网络\r\n\r\n华人快递占据了ToWhere大约30%的业务，在政策紧缩下，Peter Li和身边的许多同行也开始了业务上的伺机调整。“对于买手和百分之百的业务都是华人快递的公司来说，这个调整太难了”，Peter Li表示担忧。\r\n\r\n他提到，现在大部分人在观望，随着风声的收紧，很多代购已经暂停下单，大家都在观察电商法怎么执行，能够执行到什么程度。\r\n\r\n受影响的还包括返点公司。\r\n\r\n韩代的收入高，是因为返点的额度更高。返点，实际上就是回扣，是这个行业里公开的秘密。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n旅游平台上的返点业务\r\n\r\n“代购们不太愿意提返点，就和开店的人不愿意告诉你成本价一个道理”，茗轩说。\r\n\r\n韩国是全世界最大的免税市场，为了争抢客源、促进消费，乐天、新罗、新世界等免税店都提供了不菲的消费佣金，由此催生出了返点行业。返点公司是韩代和免税店之间的桥梁，一边推动购物，一边从中抽成。\r\n\r\n茗轩告诉锌财经，返点公司很喜欢中国代购，因为购买量很多。\r\n\r\n返点公司自成体系，为了客户体验感，有的公司会提供专车接送、代订酒店等一条龙服务，前提是购买金额要达到一定的数额。\r\n\r\n到店，办理金卡，登记返点公司给的团号，每买一个商品，都要核对好小票上的团号。结束购物后将小票挨张拍照，把照片连同银行卡号一起发给返点公司的工作人员，然后等待收款。\r\n\r\n茗轩告诉锌财经，免税店生意不好的时候，会通过提高返点额度来促进消费。高的时候，返点的力度达到30%以上。\r\n\r\n不过，茗轩也觉察到，近期返点的额度在下降，从原先的超过20%，现在只有百分之十几。很多奢侈品的返点只有5%，有的甚至0返点。\r\n\r\n返点公司是代购行业衍生的一条产业链，代购人数的减少势必影响生意。由于返点降低，代购群里已经有人表示要从“韩代”变成“港代”。\r\n\r\n代购大幅减少，对于一些小众品牌可能也并不是好消息。大代购是品牌市场的KOL，这绝不是一句夸张的言论。\r\n\r\n“不同代购朋友圈的图经常是重复的，这些图片有时候都来自同一个大代购。”佳妮说，大代购负责货源，手头的代理商负责售卖。\r\n\r\nB2B2C的模式，已经形成了成熟的产业链。在货品选择上，大代购拥有绝对的话语权。“一个大代购推一个产品，手下几十个代理会一起推，每个代理商还有成百上千个用户。这些产品不火都很难。”\r\n\r\n据了解，一些韩国品牌将市场定位瞄准中国，他们通常会主动找中国代购营销推广，某些品牌在韩国本土还没上架售卖，中国代购们已经和厂商联系接单推广。\r\n\r\n“我第一次听说JM solution蜂蜜面膜，韩国人都不用。”韩国博主“慧敏欧尼”就曾在个人视频上表达了JM solution在中国爆火的困惑。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n韩国博主“慧敏欧尼”的视频截图\r\n\r\n“爆火的除了面膜，还有一些很小众品牌的素颜霜和化妆品。”佳妮告诉锌财经，这些品牌在免税店没有专柜，通常统一摆放在一个柜台里，韩国本土市场也相当少见。\r\n\r\n在佳妮看来这样的品牌并无法长久，但她不得不承认，代购的确是潜藏在消费者朋友圈里的天然导购员。\r\n\r\n让人更为啼笑皆非的是，代购还炒火了不少假洋牌。例如泰国RAY面膜，药监局上显示它的产地在中国广州。还有Voodoo蛇毒面膜，它的备案属性是国产非特殊用途化妆品备案，备注是仅供出口。\r\n黄金时代一去不返\r\n\r\n八年前，徐璐在美国成为一名职业代购，她亲历了国内消费者对海外商品的需求大爆发。\r\n\r\n以化妆品为例，根据中国海关数据显示，2009年中国化妆护肤产品的进口金额为7亿美元左右，到了2017年数值激增到64.5亿美元左右，是09年的9倍之多。\r\n\r\n人肉代购随之兴起，赚差价，拿折扣，飞一趟能赚一两万，月入五六万在代购圈里并不稀奇。\r\n\r\n那时过海关也没什么风险。佳妮回忆道：“四年前刚做代购的时候，几乎没有担心过海关抽查的问题。”\r\n\r\n当年，让代购们闻风丧胆的安检机时常处于未开启状态，松散的检查也构不成太大的威胁。几年来，这是一门高收益、低风险的生意。\r\n\r\n佳妮每趟回来，都推着一个装满货品的行李箱，提着免税店的袋子大摇大摆出关。这个场景放到今天，就像做梦一样不可思议。\r\n\r\n但出于代购数量的增加和海关的严查，代购生意并没那么好做了。\r\n\r\n去年七夕，韩代的数量达到了新的高峰。同年八月，佳妮在韩国遇到了抢购潮。\r\n\r\n通宵排队、打地铺的竞争者们，让免税店的产品供不应求。正是从那时候起，韩国免税店推出了排号限购的饥饿营销，并一直延续使用到今天。\r\n\r\n龚夕也是往返于韩国的代购之一，她经常天没亮就到免税店，凌晨三四点就在免税店门口排队的代购不少，为的是拿到提早十分钟进场的200个排号名额。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n免税店门口排队的代购\r\n\r\n“有次我三点去，没拿到号，第二天就直接在那通宵了。”佳妮介绍，像SK2、CPB等热门品牌专柜限号，早点进去才有机会买到。\r\n\r\n“和我一起的朋友那次鞋都跑掉了，买完了才回去捡鞋，我当时还发了条朋友圈笑话她。”佳妮用自嘲的语气说道。\r\n\r\n代购是体力战，如果飞首尔，免税店结束后她们还会转站东大门，四天三晚的行程，龚夕需要休息两天才能够缓过来。\r\n\r\n回报是可观的。购买者通过返点公司，将能够拿到货物20%—30%的回扣。相当于如果一趟的购买金额为20万，即使是原价卖出，代购也能够到手4-6万的收入。\r\n\r\n但竞争激烈、抢不到货品、数次被罚，也让不少代购萌生退意，正值电商法的推出，他们中不少人选择了转型。\r\n四面楚歌\r\n\r\n11月16日，龚夕拖着两个行李箱快步走出杭州萧山机场，这是《电商法》出台前的最后一次扫货，为了囤积货物她特意比平常多买了点。\r\n\r\n“逛了四天，我整个人都快趴下了，但回程的飞机上完全睡不着，太紧张了。”龚夕很幸运，这一趟没被查，在行李箱的轮子压过安检线的那一刻，突如其来的疲惫感让她打了个寒颤。\r\n\r\n“年关了，都说最近特别严。”龚夕的手机里存了一张照片，是一个巨大白色外壳的机器，“据说是海关最新版扫描机，1月1日起开始使用。”\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n图片来源于网络\r\n\r\n王森提到，海关部门对代购是第一防线的监管罚款，《电商法》的关键实行部门是税务部门，两个部门协调合作需要一定时间磨合。\r\n\r\n目前各个部门的相关措施陆续出台。\r\n\r\n元旦还没到，邮政部门已经跟上了监管的队伍，海关总署决定自2018年11月30日起在全国海关推广使用进出境邮递物品信息化管理系统，通过邮寄的代购之后需要申报进出境物品和记录个人信息。\r\n《电商法》封杀代购，最高罚款200万，代购生意真的凉了吗？\r\n\r\n“太过于频繁地寄东西或者之前被税的纪录都会存档，肯定会被格外盯上”，徐璐忧心忡忡地说。\r\n\r\n茗轩的朋友圈除了人肉代购的商品，也开始夹杂小CK包和胶原蛋白粉的广告，原先和她搭伙儿飞的朋友已经转型做了微商，她最近也开始尝试做国内产品的代理。\r\n\r\n“现在也在下调关税，国内专柜活动力度也很大，有很多产品都比我们买的价格还低了，钱太难赚了…...”茗轩有些无奈。\r\n\r\n王森认为受《电商法》影响最大的将是B端的供应商和大型代购平台。我国跨境电商和进口商相比税率很低，也存在一定的灰色地带。\r\n\r\n所谓的代购危机，在王森看来其实是疏堵结合，“谁能阻止女人买包和化妆品啊？”\r\n\r\n自2018年起我国多次下调进口关税税率，《电商法》新政也将放宽交易额，将单次交易限值由2000元提高至5000元，年度交易限值由每人每年20000元提高至26000元。\r\n\r\n但对于消费欲旺盛的中国人这些依然远远不够。“代购最好主动去申报、如实纳税”，王森说， “不过这样对他们来说就没有利润空间了。”\r\n\r\n大部分代购还在挣扎，有的放弃了原先的廉价航班转而选择价格更高、只能携带一个行李的大韩航空。在他们眼里，它们是被海关抽查的冷门。\r\n\r\n这趟日本、韩国回来，佳妮打算挺进迪拜和欧洲市场改卖藏红花和欧洲品牌的商品，“《电商法》总不可能把代购一棒子全打死吧。只要这个职业在，我就会一直做下去。”','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,2,'MIT数字经济研究：建平台要以“网络效应”为目标 ','2019-01-03 13:03:11',NULL,'MIT数字经济研究计划（MIT INITIATIVE ON THE DIGITAL ECONOMY，MIT IDE）是MIT Sloan管理学院发起的研究项目，旨在研究如何在数字经济时代发展繁荣。MIT教授Michael Scharge在2016年发起了一个IDE研究方向：网络效应，即亚马逊、阿里、Google、Apple、Facebook、Uber、Airbnb等平台的真正成功之道。该研究对今天数字化转型中普遍关注的数字平台建设来说极具价值。\r\n\r\n以下翻译自MICHAEL SCHRAGE于2016年发布的研究概要：《Rethinking Networks: Exploring Strategies For Making Users More Valuable 》。\r\n\r\n随着人、流程和技术之间的相互联系和互操作性的不断增强，“网络效应”作为经济现象和商业机会正变得更加重要。数据驱动的数字经济竞争者，将越来越多地投资于如何最好地创造、培育和变现“网络效应”。\r\n\r\n从技术上讲，经济学家说的“网络效应”，也被称为“网络外部性”，指当产品或服务对用户的价值随着用户数量的增加而增加时，就存在“网络效应”。但这个传统的定义非常不完整，例如使用产品或服务的质量以及用户的质量，对于价值创造的影响来说，与用户数量一样重要甚至更为重要。换句话说，“如何”和“多少”同样重要。\r\n\r\n正如创造了Web2.0术语的媒体企业家Tim O\'Reilly敏锐地观察到的那样，“一个真正的Web 2.0应用程序是人们使用得越多越好。例如，每当有人在网络上建立链接时，谷歌就会变得更聪明；每次有人进行搜索，谷歌就会变得更聪明；每次有人点击广告，它就会变得更聪明；它会根据这些信息立即采取行动，改善其他人的体验。”\r\n\r\n这种设计思路同样适用于浏览亚马逊和Netflix的推荐、利用优步叫车（或驾驶）、寻找或提供Airbnb住宿，以及使用智能手机应用。用户的参与越多，就能迅速产生更高的价值和有价值的体验。创造的价值越多，就会产生更多的用户以及创新的用途。\r\n\r\n这种良性的价值循环同时颠覆和改变了世界各地的产业。价值可以实现指数级增长，但成本只有略微增长。这使得“网络效应”的经济学效应令人信服。\r\n推动创新和价值创造\r\n\r\n围绕“平台”的所有讨论，通过经验观察表明，其最有价值的经济和商业影响来自“网络效应”。数字平台的主要使命很可能是实现“网络效应”，而“平台”可以被视为达到“网络效应”目的的手段和媒体，也应该得到相应的管理。\r\n\r\nMIT数字经济研究计划（IDE）在2016年的初步研究推测，“网络效应”——而不是平台——为数字经济中的创新和价值创造提供了更好、更实用的“组织原则”。投资健康和丰富的“网络效应”组合，这是让企业成功的关键任务。\r\n\r\n这其中最重要的经济学观点是：“网络效应”是把用户变成资产的“资产”，使能它们将赋予用户创造新价值的能力，这个价值主张从一开始就必须明确。 因此，“网络效应”成为对参与者的资本、竞争力、创造力和能力的“真实”投资，无论是人还是机器。 (物联网可以说是下一个伟大的“网络效应”市场。)\r\n让用户变得更好，就会有更好的用户\r\n\r\n“网络效应”不仅仅是为更多的用户创造更多的价值，它还承担让更多的用户对企业和彼此实现更多价值的挑战。网络效应之所以特殊，在于它让贡献者因对网络中的每个人都更有价值，而自身变得更有价值。\r\n\r\n简单地说，让用户更好，就能带来更好的用户。“网络效应”投资理念也是一种重要的设计启发。什么样的工具、技能和技术能让用户“更好”? 数据驱动的建议或创新的应用程序如何使其网络参与更具生产力? 思考和回答这些问题，将吸引和鼓励创新。\r\n\r\n这对于供应商（开发者）侧和用户及客户侧来说同样重要。在双边市场中，让双边都实现“网络效应”，这是IT下一阶段的核心——“创新转型”。例如，优步司机和iPhone应用程序开发商都从改善自身能力的投资中获得收益，而谷歌搜索者和LinkedIn求职者也是类似的情况。影响个人网络表现的数字接入、算法和分析，将同时促进和加速“网络效应”。\r\n评估网络效应的投资回报率\r\n\r\n这从根本上改变了战略投资的视角。在数字经济中，可持续的成功不仅来自于改进产品、服务和用户体验，还来自于推动用户、客户、渠道和供应商的改变。这对营销和创新高管提出了挑战，要求他们明确回答有关评估其“网络效应”投资回报的关键问题：\r\n\r\n如何让用户更容易参与并创建他们认为有价值的“连接”? 如何让自己更容易识别用户参与、贡献和链接的价值? 应该如何（重新）组织自己，以收获“网络效应”的最佳价值，从而显着提升产品的质量、机会和“用户体验”?\r\n\r\n目前还没有“千篇一律”的方法或算法来回答这些问题，但MIT数字经济研究计划（IDE）的工作提供了简单而强大的研究框架，以便有效地开始。例如，“Triple-S”研究框架已被世界各地组织成功的应用，以寻求对“网络效应”进行有益的试验——它要求高管们将“网络效应”分解为三个相互关联的部分: 细分用户、社交化和技能化。\r\nMIT数字经济研究：建平台要以“网络效应”为目标\r\n\r\n（MIT IDE的3S模型，来源：MIT IDE研究概要）\r\n\r\n细分用户。在客户、渠道、开发商、供应商等内部进行特定的“用户细分”识别，这些细分的用户被认为特别重要或非常有价值。例如，对外推荐最多的客户、提出最多创新的供应商、最忠诚的渠道等。“80/20帕累托原则”是一种流行的区分方式，比如哪20%的客户最赚钱、哪20%的供应商制造最多的问题，等等。简而言之，组织希望针对哪些用户、投资哪些用户，并围绕这些用户创建“网络效应”?\r\n\r\n社交化。社交媒体平台的数量和功能，无论在企业的防火墙内外，都令人印象深刻。在 Yammer、Chatter、Sharepoint、LinkedIn、Pinterest、Twitter、YouTube和Yelp等之间，用户可以无限度的选择，他们沟通、协调、自组织和共享高带宽信息的能力不断提高。\r\n\r\n不同的平台引发不同的关系和结果。例如，全球法国化妆品公司丝芙兰（Sephora）发现，其Pinterest社区的贡献者在产品上的花费大约是Facebook粉丝的10倍。关键不在于Pinterest是比Facebook更好的化妆品推广平台，而在于不同的社交媒体平台可能促成不同类型的“网络效应”。组织不仅需要定义他们所希望用户以及用户社区如何分享，他们还必须决定如何衡量他们的“RONE”，即网络效应的回报。\r\n\r\n技能化。技能化是指在用户和用户社区中创建新功能。例如，共享和编辑图像代表了一种超越共享和编辑文本的功能。技能化意味着增强人力资本。例如，谷歌发现其最好和最满意的客户使用了“谷歌分析”，因此该公司于2014年推出了其首个全球MOOC 课程——教授谷歌分析。这就是“让用户更好，就能带来更好的用户”的案例之一。其他公司使用YouTube视频来培训用户或提供应用程序以构建有价值的新用户能力。新能力为补充和/或补充现有的“网络效应”创造了新的机会。\r\n“三”的力量\r\n\r\n这三个主题之间的相互依赖关系是S-Cycle框架（即Triple-S）有效性的核心。将技能化、社会化和细分用户明确地联系起来，提供了一种有效的从启动网络效应到检验网络效应的方法，独立或功能性地管理它们将会导致失败。\r\n\r\n也就是说，细分的用户可以更容易地鼓励他们之间的社交，并针对他们的实际和预期需求定位新技能。社交化的用户允许组织根据需要去识别所要服务的细分用户和/或新技能。技能化鼓励了用户围绕提供的应用和功能，从“自我细分”和“社交化”的方面提供建议与评论。\r\n\r\n从组织上讲，网络效应受企业对用户和客户的细分、社交化及技能化程度的影响，以及对开发人员和供应商的细分、社交化及技能化程度的影响。用户如何分享并社交化最重要的信息和见解？什么样技能和能力让用户对自己、对企业和对彼此更有价值？Triple-S框架提供了一种相对简单、安全和可扩展的方式来研究这些问题。此外，数据驱动的企业可以识别并捕获双边市场中的3S关系：也就是说，企业可以看到“3S”化的客户行为如何影响开发人员实现“3S”化的响应。 反之，他们可以观察到来自开发人员如何利用的“3S”化的网络效应来邀请并激发来自用户和客户的新“用例”。\r\n\r\n这种方法与风险投资家、PayPal联合创始人Peter Thiel在《从0到1》(Zero to One)一书中所观察到的成功的“网络效应”一致：\r\n\r\n“网络效应可能很强大，但除非你的产品对第一批用户来说很有价值，否则你永远不会收获它们。矛盾的是，网络效应企业必须从特别小的市场开始。Facebook最初只有哈佛的学生 ——马克·扎克伯格的第一个产品旨在让所有同学报名参加，而不是吸引所有地球人。这就是为什么成功的网络效应企业很少从MBA类型开始的原因：最初的市场非常小，甚至看起来根本不是商业机会。”\r\n\r\n当然，从技术和架构上来说，网络效应来自企业提供的API（应用程序编程接口）、分析和应用程序。这些直接映射到Triple-S“细分、社交和技能化“的框架中。组织级的挑战也变成了在API、分析和应用程序之间创建良性循环，而不是独立地管理它们。\r\n\r\n这是应该由CNEO（首席网络效应官）领导，还是由“网络效应委员会”(Network Effects Council）监督，还有待商榷。但无可争议的是，“网络效应”的广泛性和超越性要求高管们给予具体而明确的关注。具有讽刺意味但恰当地说，组织使用“网络效应”创造价值的创新性越强，就会变得越有价值。','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,3,'盘点：我国各省市智能制造领域发展规划 ','2019-01-03 13:03:25',NULL,'装备制造业作为国之重器与制造业的基石，在推动《中国制造2025》规划的实施、实现中国制造由大到强的转变中肩负重要使命。据中商产业研究院整理数据显示，2017年中国智能制造行业市场规模为15150亿元，增长率为22.6%，伴随着技术的逐渐完善，应用产业的不断拓展，市场规模将持续增长，预计2019年市场规模将超19000亿元。\r\n\r\n\r\n盘点：我国各省市智能制造领域发展规划\r\n\r\n\r\n广东：2025制造业全面进入智能化制造阶段\r\n\r\n到2025年，广东省制造业综合实力、可持续发展能力显著增强，在全球产业链、价值链中的地位明显提升，全省建成全国智能制造发展示范引领区和具有国际竞争力的智能制造产业集聚区。\r\n\r\n到2025年：全省制造业全面进入智能化制造阶段，基本建成制造强省。制造业水平显著提升，规模以上工业全员劳动生产率提升至25万元/人。自主创新能力明显提升，规模以上工业企业研发投入占主营业务收入的比重达到1.7%以上，安全可控的智能技术产品配套能力和信息化服务能力明显增强。信息化与工业化深度融合，规模以上工业企业信息技术集成应用达到国内领先水平，制造业质量竞争力指数达到86.5。骨干企业国际地位凸显，培育一批年主营业务收入超100亿元、1000亿元的工业企业，涌现一批掌握核心关键技术、拥有自主品牌、开展高层次分工的国际化企业。具有自主知识产权的技术、产品和服务的国际市场份额大幅提高，建成全国智能制造发展示范引领区和具有国际竞争力的智能制造产业集聚区。\r\n上海：(2017-2020)制造业转型升级发展规划\r\n\r\n深入贯彻制造强国、全球科技创新中心建设战略和供给侧结构性改革部署，将智能制造作为“上海制造”向“上海智造”转变的主攻方向，实施智能制造应用“十百千”工程(培育10家引领性智能制造系统解决方案供应商，建设100家示范性智能工厂，带动1000家企业实施智能化转型)，坚持应用牵引、软硬协同、分类施策、政府引导，大力推广智能制造应用新模式，建立智能制造应用新机制，到2020年，力争把上海打造成为全国智能制造应用的高地、核心技术的策源地以及系统解决方案的输出地。\r\n江苏：2020年将建成1000家智能车间\r\n\r\n日前，为加快推动互联网、大数据、人工智能和实体经济深度融合，推进工业经济高质量发展，江苏省印发《关于进一步加快智能制造发展的意见》。目标到2020年，全省建成1000家智能车间，创建50家左右省级智能制造示范工厂，试点创建10家左右省级智能制造示范区。\r\n\r\n根据《意见》要求，要加强领军服务机构建设，进一步提升智能制造专业服务水平——培育壮大系统解决方案供应商。到2020年，江苏省培育形成100家左右国内有影响力的本土化、品牌化智能制造领军服务机构。\r\n重庆：力争2022年智能制造关联产业产值突破400亿元\r\n\r\n近日，重庆印发了发展智能制造实施方案(2019-2022年)，该方案明确了重庆在智能制造方面的目标及任务。\r\n\r\n力争到2020年，全市智能制造取得明显进展，累计推动2500家企业实施智能化改造，建设5个具备国内较强竞争力的工业互联网平台、20个智能工厂和200个数字化车间，创建10个行业级智能制造标杆企业，建设5个智能制造示范园区，68%以上规模工业企业迈入数字化制造阶段，52%以上规模工业企业迈入数字化网络化制造阶段，“两化”融合发展水平指数达到58，智能制造关联产业产值突破300亿元，汽车、电子、装备等有条件、有基础的重点产业智能转型取得明显效果。\r\n\r\n到2022年，全市智能制造进一步发展，累计推动5000家企业实施智能化改造，建设10个具备国内较强竞争力的工业互联网平台、50个智能工厂、500个数字化车间，创建25个行业级智能制造标杆企业，建设12个智能制造示范园区，基本建成覆盖重点行业的工业互联网生态体系，84%以上规模工业企业迈入数字化制造阶段，64%以上规模工业企业迈入数字化网络化制造阶段，“两化”融合发展水平指数达到62，智能制造关联产业产值突破400亿元。\r\n山东：加速企业智能化转型\r\n\r\n根据《规划》到2022年，山东传统制造业重点领域将基本实现数字化制造，条件、基础好的重点产业和重点企业基本实现智能化转型。\r\n\r\n到2022年，山东省传统产业企业数字化研发设计工具普及率要达到72%以上，规模以上工业企业关键工序数控化率达到57%以上，万人机器人数量将达到200台以上，山东省制造业数字化、智能化水平在国内位居前列；智能制造试点示范项目实施前后企业运营成本降低20%，产品研制周期缩短20%，生产效率提高20%，能源利用率提高13%，产品不良品率要大幅度降低。这些具体指标的设置，是经过专家精心测算出来的，不是遥不可及、高不可攀，而是对照目标加快发展，通过全社会的共同努力，既可以达到，又能体现出智能制造发展的质量效益。\r\n安徽：新一代人工智能产业发展规划(2018-2030)\r\n\r\n近期目标。到2020年，人工智能发展环境和基础设施不断完善，重点前沿理论和应用技术进步明显，在产品智能、工业智能和服务智能等重点领域涌现一批优秀企业，集聚一批高水平的领军人才和创新团队，在人工智能平台、智能工业机器人、智能家电、智能装备制造等领域形成特色应用。人工智能产业规模超过150亿元，带动相关产业规模达到1000亿元。\r\n\r\n中期目标。到2025年，重点前沿理论和应用技术在部分领域取得突破，相关技术在智能农业、智能制造、智能医疗、智慧城市等领域得到广泛应用，在智能无人设备、服务机器人等领域确立竞争优势，培育若干具有国际先进水平的人工智能企业和人才团队。人工智能产业规模达到500亿元，带动相关产业规模达到4500亿元。\r\n\r\n远期目标。到2030年，形成技术实力领先、产业优势突出、特色应用引领、软硬发展均衡的产业体系，构建企业规模集聚、成果有效转化、品牌效应显著、配套服务完善、产业良性互动的发展环境，成为全国重要的人工智能产业先行区和战略高地。人工智能产业规模达到1500亿元，带动相关产业规模达到1万亿元。\r\n\r\n智能制造行业作为中国制造业的主要驱动力之一，利好政策的不断出台，行业将持续稳定增长。中商产业研究院研究预测，2019中国智能制造将迎十大发展趋势：\r\n\r\n智能制造发展将持续升温；\r\n\r\n技术纵深程度高的工业场景有望成为“AI+”广泛应用的突破点；\r\n\r\n构建精准数据流闭环将成为打造智能制造生态体系的关键；\r\n\r\n行业及场景的聚焦将引领互联网企业进军工业领域；\r\n\r\n行业级工业互联网平台将率先探索出市场化商业模式；\r\n\r\n工业企业附加值提升关键点将由设备价值挖掘转向用户价值挖掘；\r\n\r\n安全性将成为企业智能化升级决策的重要依据；\r\n\r\n智能制造系统集成发展将深度根植行业；\r\n\r\n超高附加值制造领域将成为增材制造在工业领域的最优切入点；\r\n\r\n汽车、3C等行业将推动数字孪生技术加速普及。','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,4,'移动支付市场竞争将日趋激烈 ','2019-01-03 13:03:31',NULL,' 从移动支付诞生以来，特别是扫二维码方式以后，由于其顺应了方便客户、快捷高效、客户体验好、准入门槛低等特点，客户认知度高而快，使得移动支付迅速普及开来。这种普及速度、覆盖面之广，中国人没有想到，全球包括高度发达的美国更没有想到。\r\n\r\n以支付宝钱包、微信支付为主的移动支付是在移动互联网大潮下，中国最伟大的科技发明。这种发明对传统支付方式乃至传统金融都是颠覆性的。可以这样说，坐在马桶上等任何角落都可以\r\n\r\n完成支付，至今仍然没有看到如此方便的支付方式；乞丐都可以利用二维码讨要，至今为止没有发现比其更普惠的金融。反过来，这也是其能够迅速占领市场，全面普及，被消费者认可的根本性原因。因为他对消费者“太贴心”、太有用、太方便、体验太好。\r\n\r\n虽然监管持续将移动支付定位在小额等限制措施上，不过，移动支付发展速度之快还是让人惊叹。\r\n\r\n数据显示，2018年第三季度，中国第三方支付移动支付市场交易规模达438357.3亿元人民币，环比增长11.52%。增速仍然保持在两位数以上。\r\n\r\n从市场份额来看，支付宝、微信占据了绝大部分份额，而留给包括大型商业银行的空间过小了。支付宝、微信第三季度继续占据移动支付市场绝对份额，达到92.53%，较上一个季度上升0.73%，支付宝53.71%、微信38.82%。其中支付宝显示出强势地位，市场份额从上季度的53.62%上升到53.71%，在保持行业第一的同时份额继续保持上升。\r\n\r\n在这个统计标志中如果包括商业银行手机支付的话，那么其他所有主体市场份额只有7.47%。如果不包括商业银行手机银行数据，那么市场份额是多少，没有看到统计数据。\r\n\r\n商业银行在中国银联组织下，在移动支付市场这几年攻城掠地，成效显著。特别是云闪付扫码支付后，加上坐公交零元活动等，使得云闪付概念快速深入人心，云闪付APP下载大幅度增加，整个商业银行移动支付取得明显进展。对支付宝、微信支付威胁不小，可谓吓他们一大跳。\r\n\r\n从大格局看，正在形成移动支付市场的三足鼎立格局：支付宝、微信支付、云闪付。这是难能可贵的。\r\n\r\n必须认识到支付结算市场的大趋势。整个支付结算市场向移动支付转移是大势所趋，不可逆转。其中移动支付绝不会局限于目前的消费与理财投资、小额便民的“小目标”，而这个目标是监管限制导致的，而不是市场与趋势性形成的。移动支付的大目标是覆盖所有支付结算市场。这就意味着未来移动支付市场竞争会更加激烈。\r\n\r\n这种竞争有三股势力：支付宝微信支付、中国银联为牵头的手机银行、外资移动支付机构。如果外资这股势力目前可以忽略不计的话，那么，前两股势力在移动支付市场未来几乎会刺刀见红般的竞争，这是没有办法回避的。\r\n\r\n通过对支付宝、微信支付、云闪付三种都有扫码支付的共同体验，说实话云闪付无论在客户体验、方便高效、支付场景、C段渗透面、技术要求等方面都有不少提升空间。\r\n\r\n同时，必须看到互联网经济是规模经济，具有先入为主的特点。客户使用惯了支付宝微信支付，你把它夺过来让其使用云闪付，难度确实大一些。\r\n\r\n站在中国银联与商业银行角度看，迅速争夺移动支付市场必须背水一战，已经没有退路。在明显落后情况下，怎么办？怎么追赶？除了从技术上增加客户良好体验以外，关键在于“真正以客户为中心”，怎么讲？\r\n\r\n商业银行与支付宝微信支付在对待客户关于安全问题上一个最大区别是，前者往往以自我安全为第一，把安全的麻烦扔给客户，比如让客户一遍又一遍输入密码，让客户层层设置密码而且还有数字字母特殊符号等不同要求。这不说老年人，就是年轻人也搞晕了。经常使用支付宝微信支付的人都知道，他们是把安全的麻烦事留给内部后台，通过大数据、云计算在后台监督追踪安全问题、处理安全问题，不惊扰客户，把方便简单留给了客户，因此那么多的老太太老大爷都在使用支付宝微信支付。\r\n\r\n因此，中国银联与商业银行竞争移动支付市场份额的第一步是：真正以客户为中心，把其落实到底！','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,5,'日本东北大学开发出写入速度达14纳秒的自旋转移矩磁性随机存储器 ','2019-01-03 13:03:39',NULL,'导读\r\n\r\n    近日，日本东北大学的科研团队成功开发出存储密度达128Mb的自旋转移矩-磁性随机存储器（STT-MRAM），写入速度达14纳秒，可作为物联网和人工智能中用到的缓存使用。它是目前世界上存储密度超过100Mb的嵌入式存储器中写入速度最快的。\r\n\r\n背景\r\n\r\n人类正处于一个“信息大爆炸”的时代。我们平时使用的计算机与电子产品都需要处理大量的信息，那么这些信息（程序与数据）会放在哪里呢？\r\n\r\n答案是：存储器（Memory）。存储器是每一个计算机系统、存储方案与移动设备都在使用的关键部件之一。\r\n\r\n\r\n日本东北大学开发出写入速度达14纳秒的自旋转移矩磁性随机存储器\r\n\r\n（图片来源：IBM研究院）\r\n\r\n\r\n目前，主流的存储器以随机存取存储器（RAM）与闪存（Flash）为代表。RAM 的读写速度快，但无法长时间储存数据，断电时将丢失其存储的数据，具有“易失性”；Flash 能保存数据，在断电条件下也能长久保持数据，具有“非易失性”，但读写速度却不佳。\r\n\r\n近些年，新兴的移动计算、云计算、大型数据中心等，对存储技术都提出了越来越高的要求，例如容量高、速度快、功耗低。\r\n\r\n因此，科学家们希望将 RAM 的速度与 Flash 的非易失性结合起来，探索研发新一代存储器，例如磁性随机存储器(MRAM)、阻变式随机存器(RRAM)。\r\n\r\n作为 MRAM 的二代产品，自旋转移矩-磁性随机存储器（STT-MRAM）近来备受关注。\r\n\r\n\r\n    什么是 STT-MRAM？\r\n\r\n在 STT-MRAM 中，电子的自旋会通过自旋极化电流快速翻转。这种效应是在“磁隧道结(MTJ)”或者“自旋阀”中实现的，STT-MRAM 采用 STT 隧道结（STT-MTJ）。电流流过磁性层时将被极化，形成自旋极化电流。自旋电子将自旋动量传递给自由层的磁矩，使自旋磁性层的磁矩获得自旋动量后改变方向，这个过程称为自旋传输矩。因此，STT-MRAM 是通过自旋电流实现信息写入的。\r\n\r\n\r\n日本东北大学开发出写入速度达14纳秒的自旋转移矩磁性随机存储器\r\n\r\n（图片来源：参考资料【2】）\r\n\r\n\r\nSTT-MRAM 中的数据以磁状态存储，具有天然的抗辐照、高可靠性以及几乎无限的读写次数。与 DRAM 不同，STT-MRAM 不需要功率刷新，而且读出过程也不会破坏所存储的数据，从而在系统级实现了低功耗与低延迟。与现有的 NAND Flash 相比，写入速度快上10万倍，而读取速度则快上接近10倍。而且，STT-MRAM 运行时只需少量电力，不使用时完全不需要电力。\r\n\r\n作为下一代存储技术，STT-MRAM 芯片的尺寸显著缩小，读写速度却大大提升。因此，它特别适合用于移动设备中的嵌入式存储器。特别是，如今物联网与人工智能技术迅猛发展，STT-MRAM 有望发挥更大的作用。\r\n\r\n目前，GlobalFoundries、三星(Samsung)、台积电(TSMC)、联电(UMC)等大型半导体制造工厂都在积极推动 STT-MRAM 走向批量生产。\r\n\r\n创新\r\n\r\n近日，日本东北大学教授 Tetsuo Endoh 领导的科研团队成功开发出存储密度达128Mb的 STT-MRAM，写入速度达14纳秒，可作为嵌入式存储器使用，例如物联网和人工智能中所用的缓存。它是目前世界上存储密度高于100Mb的嵌入式存储器中写入速度最快的，并且将为大容量 STT-MRAM 的量产铺平道路。\r\n\r\n\r\n日本东北大学开发出写入速度达14纳秒的自旋转移矩磁性随机存储器\r\n\r\n（图片来源：东北大学）\r\n\r\n\r\n技术\r\n\r\nSTT-MRAM 目前的容量范围是在 8Mb~40Mb。但是为了让 STT-MRAM 变得更加实用，有必要增加其存储密度。创新集成电子系统中心（CIES）的团队展开了集中开发，用 CMOS 技术将磁性隧道结（MTJs）集成在 STT-MRAM 中 ，提升 STT-MRAM 的存储密度。这样也将显著降低以缓存与嵌入式闪存为代表的嵌入式存储器的功耗。\r\n\r\n磁性隧道结可通过一系列工艺开发来进行小型化处理。为了减小更高密度的 STT-MRAM 所需的存储器尺寸，磁性隧道结可直接通过孔洞来成形加工，这些孔洞就是一些使半导体器件各层之间进行导电连接的小开口。通过采用尺寸缩小的存储单元，研究小组设计出了存储密度达128Mb 的自旋转移矩-磁随机存储器，并制造出了芯片。\r\n\r\n如下图所示：(a）存储密度达128Mb的 STT-MRAM 模型图像 (b) 写入速度与电源电压之间的 Shmoo 图，它展示了在每个速度与电压下，测量到的操作比特率的彩色等级。\r\n\r\n\r\n日本东北大学开发出写入速度达14纳秒的自旋转移矩磁性随机存储器\r\n\r\n（图片来源：东北大学）\r\n\r\n\r\n价值\r\n\r\n在制造出的芯片中，研究人员们测量了子阵列的写入速度。结果，在 1.2V 的低电源电压下，高速操作的速度可达14纳秒。迄今为止，这是世界上存储密度超过 100Mb 的 STT-MRAM 的最快写入速度。\r\n\r\n\r\n','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,6,'在“全知”的人工智能面前，人类还能否保留“无知”的权利？ ','2019-01-03 13:03:46',NULL,'We Need to Save Ignorance From AI\r\n\r\n    在这个“全知”算法的时代里，我们怎样才能选择“不知”？\r\n\r\n    In an age of all-knowing algorithms, how do we choose not to know?\r\n\r\n作者Christina Leuker和Wouter Van Den Bos，系马克斯·普朗克人类发展研究所 (MPI für Bildungsforschung，位于德国柏林的著名社科研究机构) 博士生研究员 (前者) 与研究科学家 (后者)。\r\n正文部分\r\n\r\n在柏林墙倒塌之后，东德公民们均有机会查阅斯塔西 (Stasi，国家安全部)——臭名昭著的东德秘密警察机构——围绕他们个人构建的档案。时至今日，据估计仅有10%的人真的去翻看了自己的“黑材料”。\r\n\r\n2007年，詹姆斯·华生 (James Watson)，脱氧核糖核酸 (DNA) 双螺旋结构的发现人之一，要求医疗机构不要向他提供任何有关其本人载脂蛋白E(ApoE) 基因的信息，该等位基因是阿尔兹海默症（俗称老年痴呆症）的已知风险因素之一。\r\n\r\n民意调查中，大部分人表示即便能知道自己确切的死亡日期，他们也宁愿选择不知道——就连大喜事的未来日期也不想知道。\r\n\r\n上述都是“有意无知” (willful ignorance) 的例子。 苏格拉底可能是说过“未经审视的人生是不值得过的”，霍布斯也许是认为“好奇心是人类的主要欲望”，但也有许多非常古老的故事，教诲我们知道得太多同样危机四伏。从亚当和夏娃偷尝智慧之果，到普罗米修斯窃取火的秘密，这些故事告诉我们，生活需要在选择知道和选择不知之间达到微妙的平衡。\r\n在“全知”的人工智能面前，人类还能否保留“无知”的权利？\r\n\r\n放慢脚步？：硅谷文化将“快速投入实验”视为金科玉律，但在处理我们的个人数据上这恐怕事与愿违。 图源：Frederic Legrand - COMEO/ Shutterstock.com\r\n\r\n但若是一项技术的出现，对这种平衡造成难以预料的改变，并打乱我们何时保持无知的决定，又该怎么办呢？这项技术就在眼前：它叫做人工智能 (AI)。\r\n\r\nAI可以从大数据当中找到规律，再运用相对较少的数据进行比对。例如，只需要分析几条Facebook“喜欢”，就可以预测你的个性、种族和性别。另一种计算机算法号称仅基于他们的照片就可以区分同性恋和异性恋男性，准确率高达81％，区分同性恋和异性恋女性的准确率为71％。一种名为COMPAS（“替代制裁的惩教罪犯管理画像”）的算法，可以从青少年逮捕记录、家庭暴力记录、受教育程度、社会孤立程度和休闲活动当中预测犯罪分子的累犯行为，准确率为65％。\r\n\r\n在上述每一个案例中，结论的性质都与所用数据的性质发生了惊人的背离（即便部分结果的有效性仍在争论中）。 这使得我们很难控制自己所知的信息。在这个领域当中也没有监管条例可以帮助我们选择“不知”：“无知的权利”并不受到保护。\r\n\r\n这就助长了一种“快速行动、横冲直撞” (\"move fast and break things\"，Facebook的老座右铭) 的社会氛围。但是一旦涉及到我们个人隐私的细节，“横冲直撞”真的是我们想做的事吗？\r\n为什么要保护“无知”的权利？\r\n\r\n数十多年来各国政府和立法者们深知，有些潘多拉魔盒最好永远别被打开。与保护个人无知权相关的成文法律，至少可以追溯到上世纪90年代。例如，1997年《欧洲人权和生物医学公约》(The European Convention on Human Rights and Biomedicine) 规定，“每个人都有权知晓任何被采集的个人健康信息。不过，选择不被告知的个人意愿应当得到尊重。”同理，世界医学协会 (World Medical Association) 1995年《患者权利宣言》(Declaration on the Rights of the Patient) 指出“患者有权提出明确要求不被告知[他/他的医学数据]，为保护他人生命安全所需的情况除外。”\r\n\r\n然而，为AI编写无知权法则 (right-to-ignorance laws) 是一个截然不同的话题。虽然医疗数据受到严格监管，但AI所使用的数据往往掌握在恶名在外、不受监管的盈利性科技企业手中。AI处理的数据类型也更广泛，因此任何对应的法律法规都需要更广泛地理解无知权的涵义。心理学上对有意无知的研究，将有助于设计人工智能的无知权法则。但令人惊讶的是，这个话题作为严谨科学探究的主题，长期以来一直遭到忽视；这或许是因为存在一种隐含假设，即刻意回避信息是非理性的。\r\n\r\n然而，最近，心理学家Ralph Hertwig和法律学者Christoph Engel发表了一篇针对有意无知背后动机的分类法 (taxonomy) 研究。他们识别出的各类动机中，有两组在解释面对AI时人对无知的需求上很有帮助。\r\n\r\n第一组动机围绕公正性 (impartiality) 和公平性 (fairness)。简单地说，知识有时会腐蚀判断力，而我们常常选择有意无知作为应对的方式。例如，学术论文的同行评审通常是匿名的。大多数国家的保险公司在将客户录入保险计划前，也不得了解客户健康状况的所有细节；他们只能获知一般而言的风险因素。这种考虑对AI很有帮助，因为AI很容易产出存在高度偏见的信息结果。\r\n\r\n第二组相关动机是情绪管理 (emotional regulation) 和避免后悔 (regret avoidance)。 Hertwig和Engel写道，有意无知可以帮助人们保持他们“所珍视的信念”，并避免“精神上的不适，恐惧和认知失调。”有意无知在人们生活中其实非常常见。大约90％的受访德国人希望避免因“预知死亡和离婚等负面事件”而产生的负面情绪，40％-70％的人同样不想了解正面事件，以帮助保持“来自惊喜和未知的积极情绪”，比如在知道胎儿性别前的兴奋感。\r\n\r\n这些动机可以帮助我们理解在人工智能面前保护无知的必要性。例如，AI的“同性恋雷达” (gaydar) 算法的潜在好处无限接近于零，却在公正性和公平性方面构成巨大的潜在成本。正如《经济学人》所述，“在同性恋仍不为社会所接受或仍属非法的地区，这样算法的存在可能对人身安全构成严重威胁。”同理，NtechLab目前正在开发的种族探测器的所谓好处，与对公正性和公平性造成的负面影响相比显得苍白无力。COMPAS累犯预测软件的使用具有比人为识别更高的准确性，但正如Dressel和Farid在《科学进步》上所述，“（结果）并不像我们想要的那般准确，尤其是当我们从这对被告未来造成的重大影响角度来看时”。预测个人预期寿命的算法，如Aspire Health开发的算法，并不会让客户的情绪调节变得更轻松。\r\n\r\n这些例子说明了识别无知背后个人动机的效用，并展示了“选择知道还是无知”这一问题的复杂问题，特别是当这一问题涉及AI时。对于集体无知 (collective ignorance) 何时能为公众带来好处或符合道德规范，没有现成的答案。理想的方法是单独考虑每个案例，进行风险-收益分析。理想情况下，鉴于辩论的复杂性及其后果的严重性，该分析应当公开进行，囊括不同利益相关者和专家的意见，并考虑所有可能的未来结果，包括最坏场景。\r\n\r\n这一切听起来是非常繁琐——事实上，在大多数情况下这么做可能根本不可行。那么我们该如何大刀阔斧地处理这件需要精细操作的事情呢？\r\n更加完善的数据道德法规\r\n\r\n一种方法是控制机器或对机器设限，让他们在根据已经采集的数据进行分析时只能给出一定类型的推论。例如，我们可以“禁止”司法算法使用种族作为预测变量，或者将性别排除在潜在求职者的预测分析之外。但这种方法存在问题。\r\n\r\n首先，对大公司采用的数据设限，不仅成本昂贵在技术上也存在困难。这将要求这些公司开源他们的算法，而大型政府机构必须不断对它们进行审计。此外，一旦采集了大数据集，就有很多方法可以用迂回的方式推断出“禁忌的知识”。假设使用性别信息来预测肄业率被宣布为非法操作；那么变量“拥有汽车的类型”和“最喜欢的音乐类型”理所当然地会被当作性别的代理变量，执行二阶推断后得到的预测结果，仍与直接用性别进行预测的结果相同。尽管企业可能抱着良好的初衷，但有关性别的推断甚至可能在偶然中被纳入算法。这些二阶推断的存在使算法的审计任务更加艰巨。分析中包含的变量越多，二阶推断发生的可能性就越大。\r\n\r\n保护无知权利的更激进、可能更有效的方法是先一步防止数据被采集。例如，在2017年的一项开创性举措中，德国通过立法，禁止自动驾驶汽车通过种族、年龄和性别识别街道上的人。这意味着汽车永远无法通过这些类别的数据做出其行驶决策——特别是在事故不可避免时采取的应对决策。\r\n在“全知”的人工智能面前，人类还能否保留“无知”的权利？\r\n\r\n“电车难题”：麻省理工学院开设的网站 moralmachine.mit.edu 通过模拟自动驾驶汽车需要做出决策的案例，利用应试者反馈的选择数据，测试人类自身的道德直觉。图源：MIT\r\n\r\n采用同样的思维方式，欧盟在2018年5月生效的新通用数据保护条例（GDPR）中规定，仅允许公司采集和存储最低限度的用户数据，以提供特定的、说明的服务，在数据使用方式上还要征得用户的同意。对数据捕捉的这种限制也可以防止二阶推断的滥用。GDPR路线面临的一个重要阻碍，是企业在决定自身服务目标上有着非常自由的裁决权。例如，现已关闭的Cambridge Analytica的明确目标，是评估用户的个性，因此被其利用并引发大范围争议的Facebook数据集，从技术上讲符合GPDR的指导方针。同理，GPDR虽然专注于数据使用与给定服务之间的一致性，但并未排除我们认为在道德上存在疑问的数据类别，也不会完全阻止企业从数据经纪商处购买特定用途之外的数据，只要企业能够获得用户同意——事实上许多人仅为了相对微薄的激励手段，就同意与企业共享他们的个人数据。研究人员发现，一些麻省理工学院的学生会为了一片比萨饼“出卖”他们朋友的联系方式。显然需要对个人数据的使用设置进一步的限制，但究竟要多少才足够？\r\n\r\n美国社会活动家和程序员Richard Stallman给出了这样的答案：“有太多方法用数据来伤害人们，所以唯一安全的数据库，就是从未被采集过的数据库。”但对数据采集限制得太严重，可能会阻碍技术发展并令我们能从AI中获得的好处大打折扣。\r\n\r\n应该由谁来做出权衡？应该由我们自己来。\r\n我的数据我做主\r\n\r\n在大多数情况下，上述讨论的“数据”实际上是你、我、他这些具体个人的所有物。一直以来我们想都不想就把数据提供给了那些五花八门的App，而从未考虑过对应的后果。事实上，长时间以来我们是如此轻易地交出自己的数据，以至于已经忘记了这些数据首先是我们自己的。将这些数据收回，可以让我们独立做出决定，是否有我们想知道或不想知道的东西。将数据所有权恢复给合法的所有者——我们自己——巧妙地解决了上述讨论中的许多艰难挑战。它避免了制定数据相关的、具有前瞻性的通用指导方针的需要。取而代之的，是数百万人根据他们自己的是非观念，决定如何使用他们自己的数据。我们都可以实时响应企业对数据的不断变化的用途，根据企业对待我们数据的方式给予企业惩罚或奖励。\r\n\r\n对于“还数据于人民”的必要性，计算机科学哲学家Jaron Lanier提出了一条额外的经济论据。他认为，我们有权通过将个人数据出售给大公司，从中获取经济利益。当然这条路线也存在两大问题。首先，它会使数据使用和所有权的道德界限陷入混乱。免费提供数据的意愿本身，就是对特定数据用途的道德完整性的良好试金石；少数族群中有多少人会愿意为了“同性恋雷达”这样的脸部识别App，免费提供他们的数据？要是提供数据可以换来金钱报酬，他们又会如何选择呢？而若数据用途是为了帮助寻找治愈癌症的方法，大多数人都乐于免费提供自己的数据。其次，对个人数据赋予（高昂的）经济价值，可能会迫使人们共享他们的数据，并使数据隐私成为富人的特权。\r\n\r\n而且，光是人们自发的行动是远远不够的；还需要社会机构的集体行动。即使只有一小部分人口共享了他们的敏感数据，仍有可能得出高准确性推论并遭到大多数人的反对。并非所有人都能在做出决定时意识到这一点。为了防止造成不必要的后果，我们需要对该话题开展充分的公开辩论，并建立额外的法律保障。\r\n\r\n《经济学人》的文章中曾写道，世界上最宝贵的资源不再是石油，而是数据。但数据与石油有很大不同。数据是一种无限的资源，由个人所拥有，且最好在没有任何交易性经济价值的前提下进行交换。将利益从石油中剥离，石油市场就会消亡。将利益从数据中剥离，可以作为我们创建和维护道德标准所需的空间的第一步，这些标准可以在AI普及后继续存在，并为管理集体无知铺平道路。换句话说，随着数据成为现代世界最有用的商品之一，它同时也应转变为最“无价”的商品。\r\n\r\n译者：张一苇\r\n\r\n来源：Leuker, Christina, V. Den Bos, Wouter, We Need to Save Ignorance From AI, Nautilus - Numbers/ Artificial Intelligence, Jun. 14th 2018','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,7,' 未来的人类会非男非女吗 ','2019-01-03 13:03:19',NULL,'我特别感谢我们生活在这个时代\r\n\r\n因为这个时代有了互联网\r\n\r\n有了人工智能，有了虚拟现实\r\n\r\n我们可以能用一些术语和\r\n\r\n这个时代的现象\r\n\r\n来解释庄子想讲的东西了\r\n未来的人类会非男非女吗\r\n\r\n我们以前真的很难理解《庄子》，因为没有那么多互联网体验。在互联网时代之前，我们看一篇文章总是从这篇文章的头看到尾，看一本书也是从这本书的开头一直看到结尾。但我们在互联网上的阅读不是这样的。\r\n\r\n互联网上的阅读是，你看着看着，突然看到了一个链接，砰，你又点开了一个新的窗口。\r\n\r\n庄子就是用这样的一个非流程化的、非体系化的、超链接式的方法在讲故事。\r\n\r\n在上一篇文章里，我们讲到尧要把天下让给许由。就像在《未来简史》里面所提到的“从智人到神人”一样，许由可能是那个时代的一个神人。许由在那个时代用一种类似于呼吸、导引、吐纳类的方法，和另一种云端进行了连接，成为了可以和宇宙天地沟通的神人。你如果让他每天出去做实体经济，不如让他在家里面用精神WIFI与天地沟通来得愉快，所以许由不接治理天下的这种做实体经济的事。\r\n\r\n当这个故事刚刚讲到一大段的时候，庄子停了下来，后面的故事不讲了。他开了新的一扇窗，弹出了一个新链接，说到了肩吾和连叔的故事。\r\n未来的人类会非男非女吗\r\n\r\n    “肩吾问于连叔曰：“吾闻言于接舆，大而无当，往而不反。吾惊怖其言。犹河汉而无极也；大有迳庭，不近人情焉。”连叔曰：“其言谓何哉？”曰：“藐姑射之山，有神人居焉。肌肤若冰雪，淖约若处子，不食五谷，吸风饮露，乘云气，御飞龙，而游乎四海之外；其神凝，使物不疵疠而年谷熟。吾以是狂而不信也。””\r\n\r\n肩吾是庄子设想的一个有趣的名字。冯学成老师认为：肩是肩膀的肩，吾就是我，老是把自己扛在肩膀上的人，就是肩吾，这是一个有我的人。连叔，用现在的互联网语言，就是一个超级链接uncle。接舆，也是连接的意思。\r\n\r\n你看见没有？在庄子这里，高人们不叫连叔就叫接舆，全是互联网思维。你是谁不重要，你能链接谁才比较重要。\r\n\r\n肩吾去问连叔说，我曾和接舆聊天，他说的话大话连篇，没有边际，没有尽头，也无法验证，让我有一种恐怖感。为什么会有这种恐怖感呢？因为我接不住，不知道他说了什么，他严重地侮辱了我的智商， 他说的话像银河没有尽头一样，跟一般人的言谈差异甚远，太不近情理了。\r\n\r\n连叔问肩吾说，接舆给你说什么了？肩吾说，接舆跟我说，在遥远的姑射山，住着一位神人，皮肤润白像冰雪，体态柔美如处女，不食五谷，吸清风饮甘露，乘云气驾飞龙，遨游于四海之外......\r\n未来的人类会非男非女吗\r\n\r\n《庄子》设定了一个对话，一个俗人跟一个高级的人，聊到了他和另外一个高级的人聊天的体会。你说姑射山上那个肌肤若冰雪的那个神人，他到底是男的还是女的？我为何这么问呢？因为我判断不了AlphaGo，或者Master，到底是男的还是女的。\r\n\r\n我特别感谢我们生活在这个时代。 因为我们这个时代有了互联网，有了软件硬件，有了操作系统，有了人工智能，还有了VR，我们能够用一些术语和一些在这个时代的现象，来解释庄子想讲的东西。\r\n\r\n庄子跟我们讲的这个故事里的这位神人，肌肤若冰雪。这是一种什么样子的皮肤？半透明状态的，没有温度的才是冰雪。你看现在很多科幻电影里那些穿越时空来到现实生活中的那些人的影像，都是那种半透明的状态。\r\n\r\n我如果把这段故事改编成书，把故事设定在2000后的以色列或者美国，起一个游拉呀，米克呀，或者诺切夫的名字，重新讲一遍这个事儿，您觉得靠不靠谱？\r\n\r\n这个故事可以这么说：有一天，一个来自于未来的人和一个现在的人聊天。这个现在的人说，太恐怖了，你们怎么能够告诉我说，人是有可能不吃饭的呢？你怎么可以告诉我说，人的皮肤可能是半透明的呢？你怎么可以告诉我说这个人可以随时从这里出现又在那里消失了然后又再出现了呢？你怎么可以告诉我说，他既男又女，既非男又非女呢……\r\n未来的人类会非男非女吗\r\n\r\n那些虚拟出来的3D构建的VR美男子、美女子，你很难说TA长的像男的还是像女的。现在有很多真的人也在模仿着那种雌雄同体的样子。现在很多的偶像，我不敢说ＴＡ是男还是女的，因为这样可能会有TA的粉丝来指责我。也许有一天我儿子会问我，爸爸，那个叔叔是不是阿姨？或者说那个阿姨是不是叔叔？其实我认为他们是高级的，是合于道的。在现实生活中ＴＡ还残存着人类的一点点的男性或者女性的基础，但在灵魂上已经接近于非男非女了，这是现代人类在向未来人类，甚至向虚拟人类进化，退化， 变化的一个先兆。\r\n\r\n现在流行的这些中性的人，他们在某种程度上也许是有意，也许是无意地在向一个终极的人类发展方向在变化，这就是姑射山上神人的境界。\r\n\r\n所以不要以为只有来自于硅谷，或者BAT，或者某些人工智能专家、IT界的大佬讨论的问题，才代表着真理。读《庄子》时，如果真的你读懂了庄子在说什么，你会发现庄子和他们说的并没有区别。当你理解了人工智能或者人的形象，只不过是一个在二维、三维或者是四维里的一个投影的时候，你就自然而然的就能够理解这段话到底在说什么了。\r\n\r\n你说我们是不是应该感谢那些之前做了很多互联网思维普及的朋友？他们让广大的劳动人民都理解了VR，让大家都知道了人工智能可能就是我们此生会目睹的人类发展方向。庄子，一个两千多年前的人，居然用他的寓言故事，告诉了我们事情本来就是这样的。你会不会觉得，其实你没有你想象的那么现代，那么超越古人呢？\r\n\r\n再换句话来说，你在梦里面看见的人，有重量吗？你在梦里看见的人，是实实在在的吗？\r\n\r\n试着让自己稍微深吸一口气，跟自己说：今天晚上做梦的时候，我倒要看看，我在梦里看到的人是黑白还是彩色的？是平面的还是立体的？梦里说话，是用普通话还是用方言？\r\n未来的人类会非男非女吗\r\n\r\n我认识一个一心想要向某尼泊尔、不丹的上师学习精神传习方法的女中年，她有一天居然告诉我说，她在梦里用英文和她老师交谈。我说你四级过了吗？她说她还用英文问了一个老师很深刻的问题。我说你问什么了？她说，忘了。\r\n\r\n我说，我也曾经在高考之前，清晰地梦见过高考题。\r\n\r\n今天在入睡之前，一起做一个小小的练习吧，提醒一下自己：今晚我要在梦里花点时间，看看我能看到什么。\r\n\r\n明天告诉我你今晚的梦好么？','test',0,'2019-01-03 13:02:41',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4),(NULL,38,'加拿大研发“反人脸识别”AI，让准确率从100%狂降只剩0.5%','2019-01-11 09:06:10',NULL,'人脸识别的各项应用推陈出新，隐私疑虑却未曾消除。现在有学者研发“抗人脸识别”的 AI，可以让人脸识别系统的准确率，从 100% 直线下降到只剩 0.5%！\n\n这项技术可望应用成为“隐私过滤器”，如果你也是一个重视网络隐私的人，这应该会是你未来的必载神器。\n加拿大研发“反人脸识别”AI，让准确率从100%狂降只剩0.5%\n\n当我们上传照片、视频至社群平台时，算法也抓取我们的信息、位置、友人的数据，让脸部识别系统对我们有更多的了解，并且不断进化。面对网络隐私、数据的安全性问题，多伦多大学成功创建了一种破坏脸部识别系统的算法。\n\n“当脸部识别技术越精准时，个人隐私也成了大问题。”“其中一个能有效打击脸部识别方式，就是反脸部识别算法”负责该计划的多伦多大学教授Parham Aarabi 如此表示。\n\n该算法的特征在于使用了对抗训练（Adversarial training），是一种深度学习技术，让两个人工智能互相对抗。\n\n团队设计了两个神经网络，第一个用于“识别人脸”，第二个则是专门“唱反调”破坏前者的脸部识别任务。这两个网络不断地互相争斗、相互学习，创建了一场持续不断的人工智能军备竞赛。\n\n结果是，唱反调AI 能够知道敌手脸部识别AI，在找寻什么关键部位，并适时动些人眼看不出来的小手脚 ，例如改变眼角，使其不太明显，但却能够完全欺骗敌手，让它无法识别。\n\n团队于脸部数据库 300-W（拥有 600 张包含多种族、照明条件、环境的脸部数据），测试了该系统。他们表示， 新算法可以将脸部识别准确度 100%，毁到只剩 0.5%。\n\n而该算法可以应用在，类似 Instagram 过滤器的工具上。未来团队将希望通过 App 或网站公开提供隐私过滤器。','test',0,'2019-01-14 17:02:28',1,0,0,38,'damoqiongqiu@126.com','大漠穷秋',1,4);

/*Table structure for table `blog_upload` */

DROP TABLE IF EXISTS `blog_upload`;

CREATE TABLE `blog_upload` (
  `UP_ID` varchar(64) NOT NULL,
  `UP_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FILE_NAME` varchar(128) DEFAULT NULL COMMENT '与物理保存的文件名一致',
  `FILE_TYPE` varchar(16) DEFAULT '1' COMMENT '1、图片；\n            2、附件；',
  `FILE_WIDTH` int(11) DEFAULT '0',
  `FILE_HEIGHT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `DISPLAY_ORDER` int(11) DEFAULT '0',
  `USER_ID` varchar(64) DEFAULT '0',
  `FILE_MODULE` int(11) DEFAULT '1' COMMENT '1、metro相关的图片\n            2、文章相关的图片\n            3、图书相关的图片\n            4、小图标\n            5、用户头像\n            ',
  `FILE_DESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传的文件，会员头像、用户头像、门店图片介绍、项目图片介绍等，所有上传的文件都记录在这张表。';

/*Data for the table `blog_upload` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
