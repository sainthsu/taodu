-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2013 at 01:12 PM
-- Server version: 5.5.34-0ubuntu0.12.04.1
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `taodu`
--

CREATE TABLE IF NOT EXISTS `sp_content_item` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL ,
  `sp_id` varchar(200) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pro_id` (`pro_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=1;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_activity`
--

CREATE TABLE IF NOT EXISTS `taodu_activity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `pic` text NOT NULL,
  `thumb` text NOT NULL,
  `link` text NOT NULL,
  `intro` varchar(200) NOT NULL,
  `click` int(8) NOT NULL DEFAULT '0',
  `post_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10000 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_banner`
--

CREATE TABLE IF NOT EXISTS `taodu_banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `cat` tinyint(5) NOT NULL DEFAULT '0',
  `pic` text NOT NULL,
  `link` text NOT NULL,
  `rank` tinyint(3) NOT NULL DEFAULT '10',
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `remark` text,
  `target` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10000 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_collect`
--

CREATE TABLE IF NOT EXISTS `taodu_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_iid` varchar(16) NOT NULL DEFAULT '0',
  `nick` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `cat` int(3) NOT NULL,
  `price` float NOT NULL,
  `nprice` float NOT NULL,
  `item_url` varchar(500) DEFAULT NULL,
  `pic_url` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `commission_rate` varchar(10) NOT NULL DEFAULT '0',
  `commission` float NOT NULL DEFAULT '0',
  `volume` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_iid` (`num_iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=80088 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_event`
--

CREATE TABLE IF NOT EXISTS `taodu_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(130) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1：签到；2：抽奖；3：分享；4：报名商品；5：兑换商品；6：其他',
  `description` varchar(300) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10001 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_exchange`
--

CREATE TABLE IF NOT EXISTS `taodu_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `pro_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `real_name` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `qq` int(11) NOT NULL,
  `postcode` int(6) NOT NULL,
  `address` text NOT NULL,
  `date` datetime NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：处理中；1：已发货；2：联系资料错误；3：已兑换完；',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10000 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_flink`
--

CREATE TABLE IF NOT EXISTS `taodu_flink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` text NOT NULL,
  `rank` int(3) NOT NULL DEFAULT '50',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `mini_logo` varchar(255) NOT NULL,
  `big_logo` varchar(255) NOT NULL,
  `wangwang` varchar(150) NOT NULL,
  `token` varchar(255) NOT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_group`
--

CREATE TABLE IF NOT EXISTS `taodu_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(2) NOT NULL DEFAULT '1',
  `style` int(2) NOT NULL DEFAULT '1',
  `num` int(2) NOT NULL DEFAULT '5',
  `title` varchar(40) NOT NULL DEFAULT '0',
  `price` varchar(40) NOT NULL,
  `intro` varchar(300) NOT NULL,
  `pro_list` varchar(300) NOT NULL,
  `pic` text NOT NULL,
  `types` varchar(200) NOT NULL,
  `rec_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10000 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_pro`
--

CREATE TABLE IF NOT EXISTS `taodu_pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `cat` int(3) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `shop_type` tinyint(1) NOT NULL DEFAULT '1',
  `rec_type` tinyint(1) NOT NULL DEFAULT '0',
  `oprice` float NOT NULL,
  `nprice` float NOT NULL,
  `pic` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `ischeck` tinyint(1) NOT NULL DEFAULT '0',
  `is_collect` tinyint(1) NOT NULL DEFAULT '0',
  `rank` int(5) NOT NULL DEFAULT '500',
  `reason` text,
  `fail_reason` text,
  `rec_pic` text,
  `seller_nick` varchar(50) NOT NULL,
  `num` int(5) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `iid` varchar(20) DEFAULT NULL,
  `discount` float NOT NULL DEFAULT '0',
  `volume` int(11) NOT NULL DEFAULT '0',
  `post_date` date DEFAULT NULL,
  `carriage` tinyint(1) NOT NULL DEFAULT '0',
  `app_link` varchar(500) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iid` (`iid`),
  KEY `ischeck` (`ischeck`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=80049 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_procat`
--

CREATE TABLE IF NOT EXISTS `taodu_procat` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `rank` int(3) NOT NULL DEFAULT '50',
  `thumb` varchar(500) DEFAULT NULL,
  `cids` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_shop`
--

CREATE TABLE IF NOT EXISTS `taodu_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `cat` int(3) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `nick` varchar(150) NOT NULL,
  `discount` float DEFAULT '9',
  `intro` text NOT NULL,
  `tip` varchar(200) DEFAULT NULL,
  `click` int(8) NOT NULL DEFAULT '0',
  `link` varchar(550) NOT NULL,
  `rec_type` tinyint(1) DEFAULT '0',
  `shop_type` tinyint(1) DEFAULT '1',
  `thumb` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10000 ;

-- --------------------------------------------------------

--
-- Table structure for table `beauty_new_shop` shop table for baidu seo
--

CREATE TABLE IF NOT EXISTS `beauty_newshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `shop_type` varchar(10) DEFAULT 'tao',
  `cid` int(3) NOT NULL DEFAULT '0',
  `catName` varchar(64) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `nick` text NOT NULL,
  `collect` int(11) DEFAULT '0',
  `rate` int(11) DEFAULT '0',
  `goodRate` float DEFAULT '0',
  `intro` text NOT NULL,
  `tip` varchar(200) DEFAULT NULL,
  `click` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `beauty_shoppro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `oprice` varchar(50) NOT NULL,
  `nprice` float NOT NULL,
  `pic` varchar(200) NOT NULL,
  `seller_nick` varchar(50) DEFAULT NULL,
  `iid` varchar(20) DEFAULT NULL,
  `volume` int(11) NOT NULL DEFAULT '200',
  `carriage` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(256),
  PRIMARY KEY (`id`),
  UNIQUE KEY `iid` (`iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;
-- --------------------------------------------------------

--
-- Table structure for table `taodu_shopcat`
--

CREATE TABLE IF NOT EXISTS `taodu_shopcat` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `rank` int(3) NOT NULL DEFAULT '50',
  `thumb` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_sign`
--

CREATE TABLE IF NOT EXISTS `taodu_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `sign_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10001 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_user`
--

CREATE TABLE IF NOT EXISTS `taodu_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taobao_uid` varchar(15) DEFAULT NULL,
  `taobao_nick` varchar(150) DEFAULT NULL,
  `username` varchar(150) NOT NULL COMMENT '加过密的淘宝昵称',
  `realname` varchar(30) DEFAULT NULL,
  `alipay` varchar(30) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `phone` varchar(12) NOT NULL DEFAULT '18888888888',
  `email` varchar(150) DEFAULT NULL,
  `postcode` int(6) DEFAULT NULL,
  `address` text,
  `pid` int(8) NOT NULL DEFAULT '88888888',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int(11) DEFAULT NULL,
  `shop_url` varchar(300) DEFAULT NULL,
  `from_uid` int(11) NOT NULL DEFAULT '0',
  `login_times` int(11) NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `sign_times` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到次数',
  `last_sign` date DEFAULT NULL COMMENT '最后签到时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=100001 ;

-- --------------------------------------------------------

--
-- Table structure for table `taodu_uz`
--

CREATE TABLE IF NOT EXISTS `taodu_uz` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `page_str` varchar(100) NOT NULL,
  `iid_start` varchar(200) NOT NULL,
  `iid_end` varchar(200) NOT NULL,
  `title_start` varchar(200) NOT NULL,
  `title_end` varchar(200) NOT NULL,
  `pic_start` varchar(200) NOT NULL,
  `pic_end` varchar(200) NOT NULL,
  `zone_start` varchar(200) NOT NULL,
  `zone_end` varchar(200) NOT NULL,
  `pro_start` varchar(200) NOT NULL,
  `pro_end` varchar(200) NOT NULL,
  `oprice_start` varchar(200) NOT NULL,
  `oprice_end` varchar(200) NOT NULL,
  `nprice_start` varchar(200) NOT NULL,
  `nprice_end` varchar(200) NOT NULL,
  `remark_start` varchar(200) DEFAULT NULL,
  `remark_end` varchar(200) DEFAULT NULL,
  `isstart_start` varchar(200) DEFAULT NULL,
  `isstart_end` varchar(200) DEFAULT NULL,
  `volume_start` varchar(200) DEFAULT NULL,
  `volume_end` varchar(200) DEFAULT NULL,
  `starttime_start` varchar(200) DEFAULT NULL,
  `starttime_end` varchar(200) DEFAULT NULL,
  `shoptype_start` varchar(200) DEFAULT NULL,
  `shoptype_end` varchar(200) DEFAULT NULL,
  `like_start` varchar(200) DEFAULT NULL,
  `like_end` varchar(200) DEFAULT NULL,
  `diy_start` varchar(200) DEFAULT NULL,
  `diy_end` varchar(200) DEFAULT NULL,
  `diy_column` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
