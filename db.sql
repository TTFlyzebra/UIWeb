-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-03-25 09:56:55
-- 服务器版本： 5.5.62
-- PHP 版本： 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `flyui`
--

-- --------------------------------------------------------

--
-- 表的结构 `fly_about`
--

CREATE TABLE `fly_about` (
  `aboutId` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `aboutText` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_about`
--

INSERT INTO `fly_about` (`aboutId`, `imageurl`, `aboutText`, `status`, `remark`, `edittime`, `userid`, `ip`) VALUES
(1, '/uiweb/uploads/58/a3ee19fdd8c6473532ca9463b90077.jpg', '身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效', 1, NULL, '2019-03-09 08:24:58', 0, '192.168.1.119'),
(2, '/uiweb/uploads/eb/eeb8f691d4836161e6bde902abf265.jpg', '拥有双面的不仅是人生，还有Layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。拥有双面的不仅是人生，还有Layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。', 1, NULL, '2019-03-09 08:25:03', 0, '192.168.1.119'),
(3, '/uiweb/uploads/f9/d546081201d174ffe28d6e5b24207c.jpg', '拥有双面的不仅是人生，还有Layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。', 1, NULL, '2019-03-11 06:06:59', 0, '192.168.1.119'),
(4, 'http://192.168.1.119:801/uiweb/uploads/8c/e959e3095e392fd7f8c63177cfac0a.jpg', '关于我们', 0, NULL, '2019-03-11 02:21:11', 6, '192.168.1.119'),
(5, 'http://192.168.1.119:801/uiweb/uploads/12/993f4446443c2d7f25596512720cdf.jpg', 'test', 0, NULL, '2019-03-11 06:07:22', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_cases`
--

CREATE TABLE `fly_cases` (
  `casesId` int(11) NOT NULL,
  `casesTitle` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `casesText` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_cases`
--

INSERT INTO `fly_cases` (`casesId`, `casesTitle`, `imageurl`, `casesText`, `status`, `remark`, `createtime`, `userid`, `ip`) VALUES
(1, '名牌工厂店', '/uiweb/uploads/8c/e959e3095e392fd7f8c63177cfac0a.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:21:47', 0, '192.168.1.119'),
(2, '测试没试', '/uiweb/uploads/12/993f4446443c2d7f25596512720cdf.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:25:07', 0, '192.168.1.119'),
(3, '纟纟纟x', '/uiweb/uploads/c6/4c0069727708f55646a135eba53c4f.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:38:07', 0, '192.168.1.119'),
(4, 'cccccccccc', '/uiweb/uploads/d8/0f7d89969851465634660e03e4f922.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:49:09', 0, '192.168.1.119'),
(5, 'ccccc', '/uiweb/uploads/4b/86c495bffe7e2f2f0b8d11d30f580d.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:50:22', 0, '192.168.1.119'),
(6, 'bbbb', '/uiweb/uploads/fb/373749569112755e4149c01d7f7346.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。一家工厂企业的商品展示网站，主要以卖高端服饰为主。主要以卖高端服饰为主。主要以卖高端服饰为主。', 1, '', '2019-02-22 09:50:30', 0, '192.168.1.119'),
(7, '一家工厂企业的商品展示一家工厂企业的商品展示', 'http://192.168.1.119:801/uiweb/uploads/c6/4c0069727708f55646a135eba53c4f.jpg', '一家工厂企业的商品展示网站，主要以卖高端服饰为主。', 1, '', '2019-02-22 09:50:40', 6, '192.168.1.119'),
(8, '新闻新闻新闻新闻新闻', 'http://192.168.1.119:801/uiweb/uploads/9f/e51538edbe7cd7ab234da7af1fc7d0.jpg', '新闻新闻新闻新闻新闻新闻新闻新闻新闻新闻新闻新闻新闻', 0, NULL, '2019-03-11 06:07:53', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_cell`
--

CREATE TABLE `fly_cell` (
  `cellId` int(11) NOT NULL,
  `celltypeId` int(11) NOT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `imageurl1` varchar(255) DEFAULT NULL,
  `imageurl2` varchar(255) DEFAULT NULL,
  `textTitle` varchar(255) DEFAULT NULL,
  `textSize` int(11) DEFAULT '24',
  `textColor` char(9) DEFAULT '#FFFFFFFF',
  `textAlign` varchar(10) DEFAULT 'CENTER',
  `textFont` varchar(255) DEFAULT NULL,
  `textTop` int(11) DEFAULT '0',
  `textBottom` int(11) DEFAULT '0',
  `textLeft` int(11) DEFAULT '0',
  `textRight` int(11) DEFAULT '0',
  `packName` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `action` varchar(1024) DEFAULT NULL,
  `flyAction` varchar(1024) DEFAULT NULL,
  `intentFlag` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `extend` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_cell`
--

INSERT INTO `fly_cell` (`cellId`, `celltypeId`, `width`, `height`, `imageurl1`, `imageurl2`, `textTitle`, `textSize`, `textColor`, `textAlign`, `textFont`, `textTop`, `textBottom`, `textLeft`, `textRight`, `packName`, `className`, `action`, `flyAction`, `intentFlag`, `status`, `remark`, `extend`, `edittime`, `userid`, `ip`) VALUES
(15, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/c8/6018220c4ee22e77fc786d0f426418.png', '', '导航', 24, '', '', '', 0, 0, 0, 0, 'com.autonavi.amapauto', 'com.autonavi.amapauto.MainMapActivity', '', 'gps', '0x10200000', 1, '', NULL, '2019-02-28 07:23:59', 0, '192.168.1.119'),
(16, 23, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/0f/87821bfe4d2ceed787c0b7f4520ae3.png', '', '收音机', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.radios', 'com.jancar.radio.RadioActivity', '', 'fm', '0x10200000', 1, '', NULL, '2019-02-28 05:31:30', 0, '192.168.1.119'),
(17, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/b4/5f3074145ee304968b55d10c9d1ed4.png', '', '电话', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.bluetooth.phone', 'com.jancar.bluetooth.phone.view.MainActivity', '', 'btdial', '', 1, '', NULL, '2019-02-28 05:20:49', 0, '192.168.1.119'),
(18, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/ef/260b41ec0675e60869569b84fd52bb.png', '', '手机互连', 24, '', '', '', 0, 0, 0, 0, 'net.easyconn', 'net.easyconn.WelcomeActivity', '', 'elink', '', 1, '', NULL, '2019-02-28 05:21:16', 0, '192.168.1.119'),
(19, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/7b/34563bd1049ce673e11625742926d3.png', '', '视频', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.player.video', 'com.jancar.player.video.VideoActivity', '', 'video', '', 1, '', NULL, '2019-02-28 05:21:41', 0, '192.168.1.119'),
(20, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/27/b48342fb63e9c166be68a33c9534db.png', '', '蓝牙音乐', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.bluetooth.phone', 'com.jancar.bluetooth.phone.view.MusicActivity', '', 'a2dp', '', 1, '', NULL, '2019-02-28 05:22:07', 0, '192.168.1.119'),
(21, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/39/279aab526e8a8555ed6694ef77209a.png', '', '音乐', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.player.music', 'com.jancar.player.music.MusicActivity', '', 'music', '', 1, '', NULL, '2019-02-28 05:22:35', 0, '192.168.1.119'),
(22, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/61/70539390aa7b1008e93213c44443bd.png', '', '图片', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.player.photo', 'com.jancar.player.photo.PhotoActivity', '', 'image', '', 1, '', NULL, '2019-02-28 05:32:33', 0, '192.168.1.119'),
(23, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/ae/c411e7147141d149176ca3ea2e27ab.png', '', '设置', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.settingss', 'com.jancar.settings.view.activity.MainActivity', '', 'setting', '', 1, '', NULL, '2019-02-28 05:18:45', 0, '192.168.1.119'),
(24, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/01/7c0cd91527fd7063c17dd700c2a82b.png', '', '外部输入', 24, '', '', '', 0, 0, 0, 0, 'com.jancar.avin', 'com.jancar.avin.MainActivity', '', 'avin', '', 1, '', NULL, '2019-02-28 05:18:13', 0, '192.168.1.119'),
(25, 1, 212, 317, 'http://192.168.1.119:801/uiweb/uploads/4f/784d6be45e2470d41356cc8cb93cd1.png', '', '应用', 24, '', '', '', 0, 0, 0, 0, 'com.android.launcher3', 'com.android.launcher3.Launcher', '', 'app', '', 1, '', NULL, '2019-02-28 05:17:39', 0, '192.168.1.119'),
(26, 1, 226, 360, 'http://192.168.1.119:801/uiweb/uploads/98/16365f287b4bb1088fb5a6e87422bb.png', '', '收音机', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'fm', '', 1, '', NULL, '2019-02-28 07:28:19', 0, '192.168.1.119'),
(27, 1, 226, 360, 'http://192.168.1.119:801/uiweb/uploads/16/c19411b6378fc65cf9c8748ffdd38e.png', '', '导航', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'gps', '', 1, '', NULL, '2019-02-28 07:28:36', 0, '192.168.1.119'),
(28, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/2a/0e68f37f5dc43997b59fc60cc6012c.png', '', '手机互连', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'elink', '', 1, '', NULL, '2019-02-28 07:28:55', 0, '192.168.1.119'),
(29, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/ad/5a1fcdacaa57c76347a835866af15e.png', '', '蓝牙音乐', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'a2dp', '', 1, '', NULL, '2019-02-28 07:29:13', 0, '192.168.1.119'),
(30, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/c9/b7850a33071914ceaa2cade7a9e947.png', '', '电话', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'btdial', '', 1, '', NULL, '2019-02-28 07:29:41', 0, '192.168.1.119'),
(31, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/a8/08edecfa47a2d2bb59d09fa5878b68.png', '', '音乐', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'music', '', 1, '', NULL, '2019-02-28 07:29:54', 0, '192.168.1.119'),
(32, 1, 226, 360, 'http://192.168.1.119:801/uiweb/uploads/84/2b41d38f193de15aee341fe5565a86.png', '', '视频', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'video', '', 1, '', NULL, '2019-02-28 07:30:06', 0, '192.168.1.119'),
(33, 1, 226, 360, 'http://192.168.1.119:801/uiweb/uploads/41/d435ffe832ac5ae52f17e225b9461e.png', '', '图片', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'image', '', 1, '', NULL, '2019-02-28 07:30:18', 0, '192.168.1.119'),
(34, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/7a/85cfe4d088c35e3825fe2b00c664c2.png', '', '设置', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'setting', '', 1, '', NULL, '2019-02-28 07:30:32', 0, '192.168.1.119'),
(35, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/38/ec79cc2aec48002bbc53a3b5a67f5d.png', '', '应用', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'app', '', 1, '', NULL, '2019-02-28 07:30:50', 0, '192.168.1.119'),
(36, 1, 224, 178, 'http://192.168.1.119:801/uiweb/uploads/d6/4c1e0501ce6c02329fbc8f6c1ae4ff.png', '', '外部输入', 24, '', '', '', 0, 0, 0, 0, '', '', '', 'avin', '', 1, '', NULL, '2019-02-28 07:31:08', 0, '192.168.1.119'),
(37, 25, 262, 240, 'http://192.168.1.119:801/uiweb/uploads/5f/1f811aa95f638f767988a00f01394e.png', '', '', 64, '', '', '', 0, 30, 10, 0, '', '', '', '', '', 1, '', NULL, '2019-03-01 07:41:05', 0, '192.168.1.119'),
(38, 26, 650, 236, 'http://192.168.1.119:801/uiweb/uploads/57/129fe006e2a381c9bf8f43897f8ad0.png', '', '', 24, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-02-28 09:30:48', 0, '192.168.1.119'),
(39, 1, 112, 112, 'http://192.168.1.119:801/uiweb/uploads/25/4df8e5261c6cf929c55282982930ff.png', '', '导航', 22, '', '', '', 0, -50, 0, 0, '', '', '', 'gps', '', 1, '', NULL, '2019-03-01 01:00:22', 0, '192.168.1.119'),
(40, 1, 112, 112, 'http://192.168.1.119:801/uiweb/uploads/30/68a49cd794ad8de5b772758f22a042.png', '', '收音机', 22, '', '', '', 0, -50, 0, 0, '', '', '', 'fm', '', 1, '', NULL, '2019-03-01 01:00:14', 0, '192.168.1.119'),
(41, 1, 112, 112, 'http://192.168.1.119:801/uiweb/uploads/8c/c7d7cb1215ec18e70d53da4767bd37.png', '', '应用', 22, '', '', '', 0, -50, 0, 0, '', '', '', 'app', '', 1, '', NULL, '2019-03-01 01:00:07', 0, '192.168.1.119'),
(42, 1, 112, 112, 'http://192.168.1.119:801/uiweb/uploads/87/9d9fc1e1e0eace983aab1963f9c16a.png', '', '拔号', 22, '', '', '', 0, -50, 0, 0, '', '', '', 'btdial', '', 1, '', NULL, '2019-03-01 01:00:00', 0, '192.168.1.119'),
(43, 1, 112, 112, 'http://192.168.1.119:801/uiweb/uploads/4e/bc1a24ead403511fd0379e8153ee4a.png', '', '蓝牙音乐', 22, '', '', '', 0, -50, 0, 0, '', '', '', 'a2dp', '', 1, '蓝牙音乐', NULL, '2019-03-01 00:59:50', 0, '192.168.1.119'),
(46, 25, 387, 600, '', '', '', 80, '', '', '', 160, 160, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-01 07:41:28', 0, '192.168.1.119'),
(47, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/46/c79fe3d145713998afe5865c61f99f.png', '', '收音机', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'fm', '', 1, '', NULL, '2019-03-01 00:59:37', 0, '192.168.1.119'),
(48, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/43/486861fd73071b856bbb1447ba3267.png', '', '导航', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'gps', '', 1, '', NULL, '2019-03-01 01:20:48', 0, '192.168.1.119'),
(49, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/94/b44dd5837053b7d4f4bb1edcf088ed.png', '', '电话', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'btdial', '', 1, '', NULL, '2019-03-01 01:21:09', 0, '192.168.1.119'),
(50, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/fb/64a713876910c0db1ac700fef4014f.png', '', '手机互联', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'elink', '', 1, '', NULL, '2019-03-01 01:21:18', 0, '192.168.1.119'),
(51, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/18/1f189d48cdd19534a11a2b8b82e6c7.png', '', '蓝牙音乐', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'a2dp', '', 1, '', NULL, '2019-03-01 01:21:28', 0, '192.168.1.119'),
(52, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/df/26e5dd51ff3083c69dd564340c9be7.png', '', '视频', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'video', '', 1, '', NULL, '2019-03-01 01:21:35', 0, '192.168.1.119'),
(53, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/3b/61e5ac2c0600022bd032493591ff73.png', '', '音乐', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'music', '', 1, '', NULL, '2019-03-01 01:21:42', 0, '192.168.1.119'),
(54, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/1a/873420ae313b8241fb4c81478f6a8b.png', '', '设置', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'setting', '', 1, '', NULL, '2019-03-01 01:21:56', 0, '192.168.1.119'),
(55, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/31/922eb99e24bce5aae6ebedcf7426e0.png', '', '处部输入', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'avin', '', 1, '', NULL, '2019-03-01 01:22:04', 0, '192.168.1.119'),
(56, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/29/d48f76b6ebd6fcd1a4b1d993abbaa9.png', '', '应用', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'app', '', 1, '', NULL, '2019-03-01 01:22:10', 0, '192.168.1.119'),
(57, 27, 120, 102, 'http://192.168.1.119:801/uiweb/uploads/f0/ef35a722458f52b8c430e4abd055d5.png', '', '图片', 24, '', '', '', 0, -80, 0, 0, '', '', '', 'image', '', 1, '', NULL, '2019-03-01 01:22:15', 0, '192.168.1.119'),
(65, 1, 370, 260, 'http://192.168.1.119:801/uiweb/uploads/fb/373749569112755e4149c01d7f7346.jpg', '', '测试', 24, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 0, '', NULL, '2019-03-15 06:44:26', 6, '192.168.1.119'),
(66, 25, 406, 272, 'http://192.168.1.119:801/uiweb/uploads/15/22a1b70b85f3dd21b0f9dafbe8f6ac.png', '', '', 64, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 07:13:56', 6, '192.168.1.119'),
(67, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/e9/26949dd5843dcdb9bd9893caf3fd2c.png', '', '电话', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:48:27', 6, '192.168.1.119'),
(68, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/90/88f19c9582ce850cd11933b8a1208d.png', '', '视频', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:48:43', 6, '192.168.1.119'),
(69, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/af/0ffa4e380deeaf581bd4738ea26a1e.png', '', '音乐', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:48:57', 6, '192.168.1.119'),
(70, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/23/a05ed14f5b2d0fec605e4f38d4efe5.png', '', '图片', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:49:11', 6, '192.168.1.119'),
(71, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/62/5beb92cb715f81447ddf02d1e97a0c.png', '', '设置', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:49:25', 6, '192.168.1.119'),
(72, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/bd/7dbae4c9606e19425ee24105c97847.png', '', 'AVIN', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:49:41', 6, '192.168.1.119'),
(73, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/69/e5c58fca385c9d67af06ebc77c8c0c.png', '', '收音机', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:49:55', 6, '192.168.1.119'),
(74, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/a4/0f78d7a2419cadb4f31b77c8f7fb42.png', '', '导航', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:50:09', 6, '192.168.1.119'),
(75, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/05/a16741c726afed1917c8e1b02babf5.png', '', '应用', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:50:20', 6, '192.168.1.119'),
(76, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/f5/e174af144e1336fac615000c8d9faf.png', '', '手机互联', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:50:34', 6, '192.168.1.119'),
(77, 1, 105, 105, 'http://192.168.1.119:801/uiweb/uploads/07/f5f1be53d377245b0a35f5d3a8da13.png', '', '蓝牙音乐', 24, '', '', '', 0, -50, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:50:47', 6, '192.168.1.119'),
(78, 28, 1024, 16, 'http://192.168.1.119:801/uiweb/uploads/40/841f8b970233545b18c849c6908a49.png', 'http://192.168.1.119:801/uiweb/uploads/a9/107fb29ec2972ec649ca6a57fbbaf5.png', '', 24, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-25 05:33:12', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_cellsub`
--

CREATE TABLE `fly_cellsub` (
  `cellsubId` int(11) NOT NULL,
  `cellId` int(11) NOT NULL,
  `celltypeId` int(11) NOT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `imageurl1` varchar(255) DEFAULT NULL,
  `imageurl2` varchar(255) DEFAULT NULL,
  `textTitle` varchar(255) DEFAULT NULL,
  `textSize` int(11) DEFAULT '24',
  `textColor` char(9) DEFAULT '#FFFFFFFF',
  `textAlign` varchar(10) DEFAULT 'CENTER',
  `textFont` varchar(255) DEFAULT NULL,
  `textTop` int(11) DEFAULT '0',
  `textBottom` int(11) DEFAULT '0',
  `textLeft` int(11) DEFAULT '0',
  `textRight` int(11) DEFAULT '0',
  `packName` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `action` varchar(1024) DEFAULT NULL,
  `flyAction` varchar(1024) DEFAULT NULL,
  `intentFlag` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `extend` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_cellsub`
--

INSERT INTO `fly_cellsub` (`cellsubId`, `cellId`, `celltypeId`, `width`, `height`, `imageurl1`, `imageurl2`, `textTitle`, `textSize`, `textColor`, `textAlign`, `textFont`, `textTop`, `textBottom`, `textLeft`, `textRight`, `packName`, `className`, `action`, `flyAction`, `intentFlag`, `status`, `remark`, `extend`, `edittime`, `userid`, `ip`) VALUES
(7, 65, 1, 280, 400, 'http://192.168.1.119:801/uiweb/uploads/d9/0bb9f54b8ca86c80353f9554a104be.jpg', '', '子控件12345', 24, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:17:38', 6, '192.168.1.119'),
(8, 65, 1, 280, 400, 'http://192.168.1.119:801/uiweb/uploads/86/838467119e6ab70cbeea58eddb74a5.jpg', '', '测试子控件', 24, '', '', '', 0, 0, 0, 0, '', '', '', '', '', 1, '', NULL, '2019-03-15 06:17:44', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_celltype`
--

CREATE TABLE `fly_celltype` (
  `celltypeId` int(11) NOT NULL,
  `celltype` int(11) NOT NULL DEFAULT '0',
  `celltypeName` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `remark` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_celltype`
--

INSERT INTO `fly_celltype` (`celltypeId`, `celltype`, `celltypeName`, `imageurl`, `extend`, `remark`, `status`, `edittime`, `userid`, `ip`) VALUES
(1, 1, '通用控件', '/uiweb/uploads/ef/260b41ec0675e60869569b84fd52bb.png', '', '包含图片，文字，点击事件。', 1, '2019-02-28 01:45:13', 0, '192.168.1.119'),
(23, 2, '收音机控件', 'http://192.168.1.119:801/uiweb/uploads/0f/87821bfe4d2ceed787c0b7f4520ae3.png', '', '特殊控件，跟系统平台相关。', 1, '2019-02-28 01:46:34', 0, '192.168.1.119'),
(24, 0, '静态图片', 'http://192.168.1.119:801/uiweb/uploads/37/604a49f3cef26a842dca53f265c4cc.png', '', '只显示图片并且无点击事件。', 1, '2019-02-28 01:45:22', 0, '192.168.1.119'),
(25, 3, '日期控件', 'http://192.168.1.119:801/uiweb/uploads/80/7048235eca8611e36b03c9a943adaf.png', '', '用来显示日期的控件', 1, '2019-03-15 07:05:10', 6, '192.168.1.119'),
(26, 4, '媒体信息控件', 'http://192.168.1.119:801/uiweb/uploads/af/d0a90782db989dbd2bab5dd993a3e2.png', '', '显示媒体播放信息', 1, '2019-03-15 07:06:20', 6, '192.168.1.119'),
(27, 5, '镜像控件', 'http://192.168.1.119:801/uiweb/uploads/51/b013a08f7ad2ff3de49e3b9740cdd0.png', '', '可以生成镜像的图片', 1, '2019-03-15 07:04:08', 6, '192.168.1.119'),
(28, 6, '圆点分页导航条', 'http://192.168.1.119:801/uiweb/uploads/08/107d409667de3c3b17d9b0bd193f06.png', '', '', 1, '2019-03-25 05:31:16', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_history`
--

CREATE TABLE `fly_history` (
  `historyId` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `historyTitle` varchar(255) NOT NULL,
  `historyText` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_history`
--

INSERT INTO `fly_history` (`historyId`, `imageurl`, `historyTitle`, `historyText`, `status`, `remark`, `createtime`, `userid`, `ip`) VALUES
(1, '/uiweb/uploads/c6/035a74237d5db8c5fecf9f27aed033.png', '2018年4月', '我们于华翰科技园成立了', 1, NULL, '2019-03-11 06:06:09', 0, '192.168.1.119'),
(2, '/uiweb/uploads/69/220e370672bda3779f913d88e7d17f.png', '2018年10月', '我们来到了创维创新谷这个美丽的地方', 1, NULL, '2019-03-11 06:06:07', 0, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_news`
--

CREATE TABLE `fly_news` (
  `newsId` int(11) NOT NULL,
  `newsTitle` varchar(255) NOT NULL,
  `newsSort` int(11) NOT NULL DEFAULT '0',
  `imageurl1` varchar(255) DEFAULT NULL,
  `imageurl2` varchar(255) DEFAULT NULL,
  `newsText` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_news`
--

INSERT INTO `fly_news` (`newsId`, `newsTitle`, `newsSort`, `imageurl1`, `imageurl2`, `newsText`, `status`, `remark`, `createtime`, `userid`, `ip`) VALUES
(1, '外交部：5G全球产业链供应链等无法人为割裂或剥离', 1, '/uiweb/uploads/4c/b32fd9b6fae5c378c2c0410e7cf70f.jpg', '/uiweb/uploads/15/4ee5c4d6d4a95003335ae5ebc7e6c9.jpg', '　　“外交部发言人办公室”公众号消息，在2月21日外交部例行记者会上，有记者问：下周，世界移动通讯大会将在巴塞罗那召开，5G技术将成为会议热点话题之一。我们注意到，一段时间以来，围绕中国企业参与有关国家的5G网络建设有不少议论。有人认为中国企业的产品和设备存在安全隐患，应将其排除在5G网络建设之外。你对此有何评论？\r\n　　耿爽：第五代移动通信技术（5G）作为一项前沿科技，不是某个或某几个国家的专属，而是关乎全球经济发展、世界各国利益和人类文明进步的大事。\r\n　　5G技术是全球化大潮下各国交流合作的产物，是国际社会共同的高科技创新成果。它的全球产业链、供应链、价值链高度融合，无法人为割裂或剥离，否则将会影响互利共赢的多边合作，损害开放包容的市场环境，破坏公平、公正、非歧视的国际规则。\r\n　　在全球化时代，没有哪一个国家可以脱离世界独立发展，也没有哪一项技术的开发与应用可以拒绝合作。中方将继续秉持共商共建共享原则，同各方共同把握新一轮科技革命带来的巨大发展机遇，加强包括5G在内的科技交流与合作，努力实现共同发展、互利共赢，为促进全人类福祉作出积极贡献。\r\n　　在这一进程中，我们希望各国都能基于自己的独立判断作出符合自身利益、符合时代潮流的选择。', 1, '', '2019-02-21 10:09:51', 0, '192.168.1.119'),
(3, '物理学家在环形装置内发现“非一般”的光行为', 0, '/uiweb/uploads/8e/466e3e87d66d8a0e5b9c4c9a968aa9.jpg', '', '　　新浪科技讯 北京时间2月22日消息，据国外媒体报道，来自英国的物理学家团队建造了一台环形机器，当光脉冲在里面围绕着彼此旋转时，控制光行为的一般规律不再适用。\r\n\r\n　　在正常情况下，光会展现出某种物理对称性。首先，假设你有一盘记录了光行为的录像带，那么无论是正放还是倒放，你会发现光在两个时间方向上的行为是一样的。这一现象被称为“时间反演对称”。其次，光能以波的形式进行传播，会表现出所谓的“偏振”现象：相对于波的运动而发生的振荡。这种偏振通常保持不变，提供了另一种对称性。\r\n\r\n\r\n　　但是，在这个环形装置内部，光既失去了时间反演对称性，其偏振也发生改变。光波在环形装置内会转圈并相互共振，产生在外界通常不存在的效应。\r\n\r\n　　研究人员已经知道，在特定条件下，当光在光学环形装置内部运行时，会失去时间反演对称性。光波的波峰不会在对称性所要求的位置出现。在1月10日发表于《物理评论快报》（Physical Review Letters）杂志的一篇新论文中，来自英国国家物理实验室（National Physical Laboratory，简称NPL）的研究团队指出，在这一现象发生的同时，光的偏振也会发生改变。\r\n\r\n　　研究团队将细心定时的激光脉冲射入名为“光学环形谐振器”的装置中，光的波峰排列方式没有呈现出时间反演对称性。当光束互相环绕时，只形成了单一时间方向上的模式。与此同时，光失去了垂直偏振——光波不再以严格的上下方式运动，而是形成了椭圆形。\r\n\r\n　　物理学家在一份声明中说，这项研究为光的操纵打开了新的大门，将使研究人员的工作更加精确，并为原子钟和量子计算机等设备中的光学环路提供新的设计。', 1, NULL, '2019-02-22 01:36:12', 0, '192.168.1.119'),
(6, ' 怎么得到 thinkphp 查询结果的返回条数', 0, '/uiweb/uploads/4c/b32fd9b6fae5c378c2c0410e7cf70f.jpg', '', '\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数', 0, NULL, '2019-02-22 04:02:09', 0, '192.168.1.119'),
(7, ' 怎么得到 thinkphp 查询结果的返回条数', 0, '/uiweb/uploads/15/4ee5c4d6d4a95003335ae5ebc7e6c9.jpg', '', '\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数', 0, NULL, '2019-02-22 04:02:16', 0, '192.168.1.119'),
(8, ' 怎么得到 thinkphp 查询结果的返回条数2', 0, '/uiweb/uploads/15/4ee5c4d6d4a95003335ae5ebc7e6c9.jpg', '', '\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数\r\n怎么得到 thinkphp 查询结果的返回条数', 0, NULL, '2019-02-22 04:02:25', 0, '192.168.1.119'),
(12, '测试测试测试测试测试测试测试测试测试测试测wwww', 0, 'http://192.168.1.119:801/uiweb/uploads/8e/466e3e87d66d8a0e5b9c4c9a968aa9.jpg', '', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试1测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试1测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试1测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试1测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试1', 0, NULL, '2019-02-22 07:17:34', 0, '192.168.1.119'),
(13, '1', 0, 'http://192.168.1.119:801/uiweb/uploads/8c/e959e3095e392fd7f8c63177cfac0a.jpg', '', '1', 0, NULL, '2019-03-11 06:11:21', 6, '192.168.1.119'),
(14, '111', 0, 'http://192.168.1.119:801/uiweb/uploads/7e/b83361c57dc762493d937381938176.jpg', 'http://192.168.1.119:801/uiweb/uploads/fb/373749569112755e4149c01d7f7346.jpg', '1', 0, NULL, '2019-03-11 06:13:35', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_page`
--

CREATE TABLE `fly_page` (
  `pageId` int(11) NOT NULL,
  `pageName` varchar(255) NOT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_page`
--

INSERT INTO `fly_page` (`pageId`, `pageName`, `imageurl`, `width`, `height`, `status`, `remark`, `edittime`, `userid`, `ip`) VALUES
(5, '第一页', '', 1024, 600, 1, 'Launcher-AP1', '2019-03-22 01:21:30', 6, '192.168.1.119'),
(6, '第二页', '', 1024, 600, 1, 'Launcher-AP1', '2019-02-27 08:42:36', 0, '192.168.1.119'),
(7, '第三页', '', 1024, 600, 1, 'Launcher-AP1', '2019-02-27 08:42:56', 0, '192.168.1.119'),
(8, '第一页', '', 1024, 600, 1, 'Launcher-AP3', '2019-03-15 06:36:26', 6, '192.168.1.119'),
(9, '第二页', '', 1024, 600, 1, 'Launcher-AP3', '2019-03-15 06:36:32', 6, '192.168.1.119'),
(11, '第一页', '', 1024, 600, 1, 'Launcher-AP4', '2019-03-15 06:36:40', 6, '192.168.1.119'),
(12, '第一页', '', 1024, 600, 1, 'Launcher-AP5', '2019-03-15 06:36:49', 6, '192.168.1.119'),
(13, '第二页', '', 1024, 600, 1, 'Launcher-AP5', '2019-03-15 06:36:55', 6, '192.168.1.119'),
(14, '第一页', '', 1024, 600, 1, 'Launcher-AP6', '2019-03-15 06:37:06', 6, '192.168.1.119'),
(21, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 07:49:43', 6, '192.168.1.119'),
(22, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 08:02:40', 6, '192.168.1.119'),
(23, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 08:03:29', 6, '192.168.1.119'),
(24, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 08:03:35', 6, '192.168.1.119'),
(25, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 08:03:37', 6, '192.168.1.119'),
(26, 'TOP_PAGE', NULL, 1024, 600, 2, NULL, '2019-03-23 08:03:40', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_pagecell`
--

CREATE TABLE `fly_pagecell` (
  `id` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `cellId` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_pagecell`
--

INSERT INTO `fly_pagecell` (`id`, `pageId`, `cellId`, `x`, `y`, `width`, `height`) VALUES
(1, 3, 9, 308, 122, 212, 317),
(2, 3, 9, 783, 129, 212, 317),
(3, 3, 10, 546, 126, 212, 317),
(4, 3, 12, 62, 122, 212, 317),
(5, 4, 9, 55, 143, 212, 317),
(6, 4, 10, 306, 144, 212, 317),
(7, 5, 15, 42, 141, 212, 317),
(8, 5, 17, 526, 141, 212, 317),
(9, 5, 18, 768, 141, 212, 317),
(10, 5, 16, 284, 141, 212, 317),
(11, 6, 19, 42, 141, 212, 317),
(12, 6, 20, 284, 141, 212, 317),
(13, 6, 21, 526, 141, 212, 317),
(14, 6, 22, 768, 141, 212, 317),
(15, 8, 26, 44, 132, 226, 360),
(16, 8, 27, 282, 132, 226, 360),
(17, 8, 28, 522, 132, 224, 178),
(18, 8, 29, 760, 132, 224, 178),
(19, 8, 30, 522, 311, 224, 178),
(20, 8, 31, 760, 311, 224, 178),
(21, 9, 32, 44, 132, 226, 360),
(22, 9, 33, 282, 132, 226, 360),
(23, 9, 34, 522, 132, 224, 178),
(24, 9, 35, 760, 132, 224, 178),
(25, 9, 36, 522, 311, 224, 178),
(26, 9, 30, 760, 311, 224, 178),
(27, 10, 36, 81, 45, 224, 178),
(28, 10, 35, 104, 294, 224, 178),
(29, 10, 35, 104, 294, 224, 178),
(30, 10, 28, 461, 290, 224, 178),
(31, 7, 25, 526, 141, 212, 317),
(32, 7, 23, 42, 141, 212, 317),
(33, 7, 24, 284, 141, 212, 317),
(34, 7, 15, 768, 141, 212, 317),
(35, 11, 37, 41, 121, 262, 240),
(36, 11, 38, 334, 121, 650, 236),
(37, 11, 39, 41, 420, 112, 112),
(38, 11, 40, 248, 420, 112, 112),
(39, 11, 41, 454, 420, 112, 112),
(40, 11, 42, 659, 420, 112, 112),
(41, 11, 43, 866, 420, 112, 112),
(120, 14, 67, 460, 72, 105, 105),
(121, 14, 68, 660, 72, 105, 105),
(122, 14, 69, 860, 72, 105, 105),
(123, 14, 70, 460, 252, 105, 105),
(124, 14, 71, 660, 252, 105, 105),
(125, 14, 72, 860, 252, 105, 105),
(126, 14, 73, 60, 432, 105, 105),
(127, 14, 74, 260, 432, 105, 105),
(128, 14, 75, 460, 432, 105, 105),
(129, 14, 76, 660, 432, 105, 105),
(130, 14, 77, 860, 432, 105, 105),
(131, 14, 66, 27, 86, 406, 272),
(136, 26, 78, 0, 530, 1024, 16),
(139, 12, 47, 387, 121, 120, 102),
(140, 12, 48, 608, 121, 120, 102),
(141, 12, 49, 829, 121, 120, 102),
(142, 12, 50, 387, 349, 120, 102),
(143, 12, 51, 608, 349, 120, 102),
(144, 12, 52, 829, 349, 120, 102),
(145, 13, 53, 387, 121, 120, 102),
(146, 13, 57, 608, 121, 120, 102),
(147, 13, 54, 828, 121, 120, 102),
(148, 13, 55, 387, 349, 120, 102),
(149, 13, 56, 608, 349, 120, 102),
(150, 24, 46, 0, 0, 387, 600),
(151, 24, 78, 0, 530, 1024, 16);

-- --------------------------------------------------------

--
-- 表的结构 `fly_permission`
--

CREATE TABLE `fly_permission` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '权限路径',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '权限描述',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '权限状态',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `userid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

--
-- 转存表中的数据 `fly_permission`
--

INSERT INTO `fly_permission` (`id`, `pid`, `name`, `path`, `description`, `status`, `create_time`, `userid`, `ip`) VALUES
(48, 0, '设置访问权限后台管理模块', '/auth', '分配管理用户权限', 1, 1552027443, 6, '192.168.1.119'),
(49, 48, '权限节点编辑', '/auth/permission', '分配网站的权限节点', 1, 1552030063, 6, '192.168.1.119'),
(50, 49, '显示页面', '/auth/permission/index', '权限节点编辑显示页面', 1, 1552030161, 6, '192.168.1.119'),
(51, 49, '添加权限节点', '/auth/permission/add', '添加权限节点', 1, 1552030183, 6, '192.168.1.119'),
(52, 49, '编辑权限节点', '/auth/permission/edit', '编辑权限节点', 1, 1552030212, 6, '192.168.1.119'),
(53, 49, '删除权限节点', '/auth/permission/del', '删除权限节点', 1, 1552030225, 6, '192.168.1.119'),
(54, 48, '用户权限分配', '/auth/user', '用户权限分配', 1, 1552030271, 6, '192.168.1.119'),
(55, 54, '显示页面', '/auth/user/index', '显示用户列表页面', 1, 1552030383, 6, '192.168.1.119'),
(56, 54, '用户数据操作', '/auth/user/api', '用户数据操作', 1, 1552030411, 6, '192.168.1.119'),
(57, 54, '设置用户角色', '/auth/user/userrole', '设置用户角色', 1, 1552030455, 6, '192.168.1.119'),
(58, 48, '权限角色管理', '/auth/role', '权限角色管理', 1, 1552030591, 6, '192.168.1.119'),
(59, 58, '显示页面', '/auth/role/index', '显示角色列表页面', 1, 1552030647, 6, '192.168.1.119'),
(60, 58, '添加角色页面', '/auth/role/add', '添加角色', 1, 1552030685, 6, '192.168.1.119'),
(61, 58, '修改角色页面', '/auth/role/edit', '修改角色页面', 1, 1552030854, 6, '192.168.1.119'),
(62, 58, '角色数据操作', '/auth/role/api', '角色数据操作', 1, 1552030889, 6, '192.168.1.119'),
(65, 58, '分配角色权限', '/auth/role/rolepermission', '分配角色权限', 1, 1552031297, 6, '192.168.1.119'),
(67, 49, '分配权限页面', '/auth/permission/dispath', '分配权限页面', 1, 1552093401, 6, '192.168.1.119'),
(68, 0, '公司网站数据访问接口', '/api', '网站提供的数据接口', 1, 1552093561, 6, '192.168.1.119'),
(72, 68, '首页', '/api/welcome', 'welcome数据表的访问权限', 1, 1552093909, 6, '192.168.1.119'),
(73, 72, '获取', '/api/welcome/get', '获取数据', 1, 1552093924, 6, '192.168.1.119'),
(74, 72, '添加', '/api/welcome/post', '添加数据', 1, 1552093958, 6, '192.168.1.119'),
(75, 72, '修改', '/api/welcome/put', '修改数据', 1, 1552093975, 6, '192.168.1.119'),
(76, 72, '删除', '/api/welcome/delete', '删除数据', 1, 1552094020, 6, '192.168.1.119'),
(77, 68, '产品', '/api/product', 'product数据表的访问权限', 1, 1552094652, 6, '192.168.1.119'),
(78, 77, '获取', '/api/product/get', 'get', 1, 1552094722, 6, '192.168.1.119'),
(79, 77, '添加', '/api/product/post', 'post', 1, 1552094733, 6, '192.168.1.119'),
(80, 77, '修改', '/api/product/put', 'put', 1, 1552094753, 6, '192.168.1.119'),
(81, 77, '删除', '/api/product/delete', 'delete', 1, 1552094804, 6, '192.168.1.119'),
(82, 68, '新闻', '/api/news', 'news数据表的访问权限', 1, 1552094985, 6, '192.168.1.119'),
(83, 82, '获取', '/api/news/get', 'get', 1, 1552095022, 6, '192.168.1.119'),
(84, 82, '添加', '/api/news/post', 'post', 1, 1552095036, 6, '192.168.1.119'),
(85, 82, '修改', '/api/news/put', 'put', 1, 1552095061, 6, '192.168.1.119'),
(86, 82, '删除', '/api/news/delete', 'delete', 1, 1552095082, 6, '192.168.1.119'),
(87, 68, '案例', '/api/cases', 'cases', 1, 1552095498, 6, '192.168.1.119'),
(88, 87, '获取', '/api/cases/get', 'get', 1, 1552095810, 6, '192.168.1.119'),
(89, 87, '添加', '/api/cases/post', 'post', 1, 1552095826, 6, '192.168.1.119'),
(90, 87, '修改', '/api/cases/put', 'put', 1, 1552095968, 6, '192.168.1.119'),
(91, 87, '删除', '/api/cases/delete', 'delete', 1, 1552095981, 6, '192.168.1.119'),
(92, 68, '关于', '/api/about', 'about', 1, 1552096467, 6, '192.168.1.119'),
(93, 92, '获取', '/api/about/get', 'get', 1, 1552096476, 6, '192.168.1.119'),
(94, 92, '添加', '/api/about/post', 'post', 1, 1552096486, 6, '192.168.1.119'),
(95, 92, '修改', '/api/about/put', 'put', 1, 1552096496, 6, '192.168.1.119'),
(96, 92, '删除', '/api/about/delete', 'delete', 1, 1552096511, 6, '192.168.1.119'),
(97, 68, '招聘', '/api/recruitment', 'recruitment', 1, 1552096545, 6, '192.168.1.119'),
(98, 97, '获取', '/api/recruitment/get', 'get', 1, 1552096566, 6, '192.168.1.119'),
(99, 97, '添加', '/api/recruitment/post', 'post', 1, 1552096581, 6, '192.168.1.119'),
(100, 97, '修改', '/api/recruitment/put', 'put', 1, 1552096606, 6, '192.168.1.119'),
(101, 97, '删除', '/api/recruitment/delete', 'delete', 1, 1552096618, 6, '192.168.1.119'),
(102, 68, '历史', '/api/history', 'history', 1, 1552096655, 6, '192.168.1.119'),
(103, 102, '获取', '/api/history/get', 'get', 1, 1552096715, 6, '192.168.1.119'),
(104, 102, '添加', '/api/history/post', 'post', 1, 1552096726, 6, '192.168.1.119'),
(105, 102, '修改', '/api/history/put', 'put', 1, 1552096745, 6, '192.168.1.119'),
(106, 102, '删除', '/api/history/delete', 'delete', 1, 1552096779, 6, '192.168.1.119'),
(107, 0, '公司网站后台管理页面', '/home', '公司网站后台页面', 1, 1552096912, 6, '192.168.1.119'),
(108, 107, '首页', '/home/welcome', '首页修改后台页面', 1, 1552096943, 6, '192.168.1.119'),
(109, 108, '显示列表', '/home/welcome/index', '显示列表', 1, 1552096990, 6, '192.168.1.119'),
(110, 108, '添加内容', '/home/welcome/add', '添加内容', 1, 1552097017, 6, '192.168.1.119'),
(111, 108, '修改内容', '/home/welcome/edit', '修改内容', 1, 1552097083, 6, '192.168.1.119'),
(112, 107, '产品', '/home/product', '产品修改后台页面', 1, 1552097188, 6, '192.168.1.119'),
(113, 107, '新闻', '/home/news', '新闻修改后台操作页面', 1, 1552097236, 6, '192.168.1.119'),
(114, 112, '显示列表', '/home/product/index', '显示列表', 1, 1552097260, 6, '192.168.1.119'),
(115, 107, '案例', '/home/cases', '案例修改后台操作页面', 1, 1552097302, 6, '192.168.1.119'),
(116, 107, '关于', '/home/about', '关于修改后台操作页面', 1, 1552097326, 6, '192.168.1.119'),
(117, 107, '招聘', '/home/recruitment', '招聘修改后台操作页面', 1, 1552097352, 6, '192.168.1.119'),
(118, 107, '历史', '/home/history', '历史修改后台操作页面', 1, 1552097376, 6, '192.168.1.119'),
(119, 113, '显示列表', '/home/news/index', '显示列表', 1, 1552097409, 6, '192.168.1.119'),
(120, 115, '显示列表', '/home/cases/index', '显示列表', 1, 1552097419, 6, '192.168.1.119'),
(121, 116, '显示列表', '/home/about/index', '显示列表', 1, 1552097428, 6, '192.168.1.119'),
(122, 117, '显示列表', '/home/recruitment/index', '显示列表', 1, 1552097453, 6, '192.168.1.119'),
(123, 118, '显示列表', '/home/history/index', '显示列表', 1, 1552097461, 6, '192.168.1.119'),
(124, 112, '添加内容', '/home/product/add', '添加内容', 1, 1552097480, 6, '192.168.1.119'),
(125, 113, '添加内容', '/home/news/add', '添加内容', 1, 1552097486, 6, '192.168.1.119'),
(126, 115, '添加内容', '/home/cases/add', '添加内容', 1, 1552097492, 6, '192.168.1.119'),
(127, 116, '添加内容', '/home/about/add', '添加内容', 1, 1552097499, 6, '192.168.1.119'),
(128, 117, '添加内容', '/home/recruitment/add', '添加内容', 1, 1552097505, 6, '192.168.1.119'),
(129, 118, '添加内容', '/home/history/add', '添加内容', 1, 1552097513, 6, '192.168.1.119'),
(130, 112, '修改内容', '/home/product/edit', '修改内容', 1, 1552097556, 6, '192.168.1.119'),
(131, 113, '修改内容', '/home/news/edit', '修改内容', 1, 1552097562, 6, '192.168.1.119'),
(132, 115, '修改内容', '/home/cases/edit', '修改内容', 1, 1552097569, 6, '192.168.1.119'),
(133, 116, '修改内容', '/home/about/edit', '修改内容', 1, 1552097577, 6, '192.168.1.119'),
(134, 117, '修改内容', '/home/recruitment/edit', '修改内容', 1, 1552097584, 6, '192.168.1.119'),
(135, 118, '修改内容', '/home/history/edit', '修改内容', 1, 1552097592, 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_product`
--

CREATE TABLE `fly_product` (
  `productId` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `productSort` int(11) NOT NULL,
  `productTitle` varchar(255) NOT NULL,
  `productDetail` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `iconurl` varchar(255) NOT NULL,
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_product`
--

INSERT INTO `fly_product` (`productId`, `imageurl`, `productSort`, `productTitle`, `productDetail`, `status`, `iconurl`, `remark`, `edittime`, `userid`, `ip`) VALUES
(2, '/uiweb/uploads/23/e3cf886844a7287f16c2583dbef583.jpg', 1, '核心板', '核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板核心板', 1, '/uiweb/uploads/21/911649e1292399373950dfa2b9acbf.png', '', '2019-03-01 06:21:46', 0, '192.168.1.119'),
(3, 'http://192.168.1.119:801/uiweb/uploads/13/f8d257805c7dfe62baa69adc8eaaea.jpg', 2, '一体板', '一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板一体板', 1, '/uiweb/uploads/30/c3804c8eeb10fc1021e76a62ebb609.png', '', '2019-03-11 06:05:43', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_recruitment`
--

CREATE TABLE `fly_recruitment` (
  `recruitmentId` int(11) NOT NULL,
  `recruitmentTitle` varchar(255) NOT NULL,
  `recruitmentText` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_recruitment`
--

INSERT INTO `fly_recruitment` (`recruitmentId`, `recruitmentTitle`, `recruitmentText`, `status`, `remark`, `edittime`, `userid`, `ip`) VALUES
(1, 'JAVA 工程师', '1、前端开发及维护工作；\r\n2、有良好的技术基础，熟悉 Web 标准，熟练掌握多种 Web 驾驶技术；\r\n3、掌握行业内流行的类库，Vue.js， React 等主流框架；\r\n4、参与公司驾驶工程的设计、研发；\r\n5、了解不同浏览器之间的差异，移动设备之间的差异。', 1, NULL, '2019-02-23 01:22:19', 0, '192.168.1.119'),
(2, '前端工程师', '1、前端开发及维护工作；\r\n 2、有良好的技术基础，熟悉 Web 标准，熟练掌握多种 Web 驾驶技术； \r\n3、掌握行业内流行的类库，Vue.js， React 等主流框架；\r\n 4、参与公司驾驶工程的设计、研发； \r\n5、了解不同浏览器之间的差异，移动设备之间的差异。', 1, NULL, '2019-03-11 06:06:04', 0, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_role`
--

CREATE TABLE `fly_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父角色id',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '角色状态',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `left_key` int(11) NOT NULL DEFAULT '0' COMMENT '用来组织关系的左值',
  `right_key` int(11) NOT NULL DEFAULT '0' COMMENT '用来组织关系的右值',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '所处层级',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

--
-- 转存表中的数据 `fly_role`
--

INSERT INTO `fly_role` (`id`, `name`, `parent_id`, `description`, `status`, `sort_num`, `left_key`, `right_key`, `level`, `createtime`, `ip`, `userid`) VALUES
(3, '系统管理员', 0, '系统管理员，拥有所有权限。', 1, 0, 13, 14, 1, '2019-03-06 07:24:27', '192.168.1.119', 6),
(8, '公司网站管理员', 0, '负责公司网站内容的修改和编辑', 1, 0, 1, 2, 1, '2019-03-09 02:51:12', '192.168.1.119', 6);

-- --------------------------------------------------------

--
-- 表的结构 `fly_role_permission`
--

CREATE TABLE `fly_role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `permission_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限对应表';

--
-- 转存表中的数据 `fly_role_permission`
--

INSERT INTO `fly_role_permission` (`id`, `role_id`, `permission_id`) VALUES
(292, 3, 48),
(293, 3, 49),
(294, 3, 50),
(295, 3, 51),
(296, 3, 52),
(297, 3, 53),
(298, 3, 67),
(299, 3, 54),
(300, 3, 55),
(301, 3, 56),
(302, 3, 57),
(303, 3, 58),
(304, 3, 59),
(305, 3, 60),
(306, 3, 61),
(307, 3, 62),
(308, 3, 65),
(309, 3, 68),
(310, 3, 72),
(311, 3, 73),
(312, 3, 74),
(313, 3, 75),
(314, 3, 76),
(315, 3, 77),
(316, 3, 78),
(317, 3, 79),
(318, 3, 80),
(319, 3, 81),
(320, 3, 82),
(321, 3, 83),
(322, 3, 84),
(323, 3, 85),
(324, 3, 86),
(325, 3, 87),
(326, 3, 88),
(327, 3, 89),
(328, 3, 90),
(329, 3, 91),
(330, 3, 92),
(331, 3, 93),
(332, 3, 94),
(333, 3, 95),
(334, 3, 96),
(335, 3, 97),
(336, 3, 98),
(337, 3, 99),
(338, 3, 100),
(339, 3, 101),
(340, 3, 102),
(341, 3, 103),
(342, 3, 104),
(343, 3, 105),
(344, 3, 106),
(345, 3, 107),
(346, 3, 108),
(347, 3, 109),
(348, 3, 110),
(349, 3, 111),
(350, 3, 112),
(351, 3, 114),
(352, 3, 124),
(353, 3, 130),
(354, 3, 113),
(355, 3, 119),
(356, 3, 125),
(357, 3, 131),
(358, 3, 115),
(359, 3, 120),
(360, 3, 126),
(361, 3, 132),
(362, 3, 116),
(363, 3, 121),
(364, 3, 127),
(365, 3, 133),
(366, 3, 117),
(367, 3, 122),
(368, 3, 128),
(369, 3, 134),
(370, 3, 118),
(371, 3, 123),
(372, 3, 129),
(373, 3, 135),
(374, 8, 68),
(375, 8, 72),
(376, 8, 73),
(377, 8, 74),
(378, 8, 75),
(379, 8, 76),
(380, 8, 77),
(381, 8, 78),
(382, 8, 79),
(383, 8, 80),
(384, 8, 81),
(385, 8, 82),
(386, 8, 83),
(387, 8, 84),
(388, 8, 85),
(389, 8, 86),
(390, 8, 87),
(391, 8, 88),
(392, 8, 89),
(393, 8, 90),
(394, 8, 91),
(395, 8, 92),
(396, 8, 93),
(397, 8, 94),
(398, 8, 95),
(399, 8, 96),
(400, 8, 97),
(401, 8, 98),
(402, 8, 99),
(403, 8, 100),
(404, 8, 101),
(405, 8, 102),
(406, 8, 103),
(407, 8, 104),
(408, 8, 105),
(409, 8, 106),
(410, 8, 107),
(411, 8, 108),
(412, 8, 109),
(413, 8, 110),
(414, 8, 111),
(415, 8, 112),
(416, 8, 114),
(417, 8, 124),
(418, 8, 130),
(419, 8, 113),
(420, 8, 119),
(421, 8, 125),
(422, 8, 131),
(423, 8, 115),
(424, 8, 120),
(425, 8, 126),
(426, 8, 132),
(427, 8, 116),
(428, 8, 121),
(429, 8, 127),
(430, 8, 133),
(431, 8, 117),
(432, 8, 122),
(433, 8, 128),
(434, 8, 134),
(435, 8, 118),
(436, 8, 123),
(437, 8, 129),
(438, 8, 135);

-- --------------------------------------------------------

--
-- 表的结构 `fly_theme`
--

CREATE TABLE `fly_theme` (
  `themeId` int(11) NOT NULL,
  `themeName` varchar(255) NOT NULL,
  `themeType` int(11) NOT NULL DEFAULT '0',
  `screenWidth` int(11) NOT NULL,
  `screenHeight` int(11) NOT NULL,
  `left` int(11) NOT NULL DEFAULT '0',
  `top` int(11) NOT NULL DEFAULT '0',
  `right` int(11) NOT NULL DEFAULT '0',
  `bottom` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(255) DEFAULT NULL,
  `isMirror` tinyint(1) NOT NULL,
  `animType` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `remark` text,
  `topPageId` int(11) DEFAULT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_theme`
--

INSERT INTO `fly_theme` (`themeId`, `themeName`, `themeType`, `screenWidth`, `screenHeight`, `left`, `top`, `right`, `bottom`, `imageurl`, `isMirror`, `animType`, `status`, `remark`, `topPageId`, `edittime`, `userid`, `ip`) VALUES
(5, 'Launcher-AP1', 0, 1024, 600, 0, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/4c/b32fd9b6fae5c378c2c0410e7cf70f.jpg', 1, 1, 1, '', 21, '2019-03-25 08:34:40', 6, '192.168.1.119'),
(7, 'Launcher-AP3', 0, 1024, 600, 0, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/f8/fc65ab56c952ebccd91be18b9a2d06.png', 1, 1, 1, '', 22, '2019-03-25 08:34:54', 6, '192.168.1.119'),
(12, 'Launcher-AP4', 0, 1024, 600, 0, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/b0/c768931cd086751d854d1847e181cf.png', 0, 0, 1, '', 23, '2019-03-25 08:35:06', 6, '192.168.1.119'),
(13, 'Launcher-AP5', 0, 1024, 600, 296, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/2f/e2f98c6ff84f553cc7c7079b721ad1.png', 0, 2, 1, '', 24, '2019-03-25 09:45:19', 6, '192.168.1.119'),
(14, 'Launcher-AP6', 0, 1024, 600, 0, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/d3/b3bb3a1a9a2ae08b6585c8512d769b.png', 0, 0, 1, '', 25, '2019-03-25 08:35:30', 6, '192.168.1.119'),
(15, 'Music-AP1', 0, 1024, 600, 0, 0, 1024, 600, 'http://192.168.1.119:801/uiweb/uploads/42/e1f50a04f3daaa87b24d9883631db4.png', 1, 1, 1, '', 26, '2019-03-25 08:35:58', 6, '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_themepage`
--

CREATE TABLE `fly_themepage` (
  `id` int(11) NOT NULL,
  `themeId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_themepage`
--

INSERT INTO `fly_themepage` (`id`, `themeId`, `pageId`) VALUES
(1, 6, 1),
(2, 6, 3),
(3, 6, 4),
(9, 5, 5),
(10, 5, 6),
(11, 5, 7),
(12, 12, 11),
(13, 13, 12),
(14, 13, 13),
(26, 7, 8),
(27, 7, 9),
(30, 14, 14),
(32, 15, 5),
(33, 15, 6),
(34, 15, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fly_user`
--

CREATE TABLE `fly_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `fly_user`
--

INSERT INTO `fly_user` (`id`, `user_name`, `password`, `mobile`, `email`, `last_login_time`, `status`, `createtime`, `ip`) VALUES
(5, 'flyzebra', '10e208ffd957f5488f795e555f483af8', '13612121212', '1@qq.com', 1551762134, 1, '0000-00-00 00:00:00', '192.168.1.119'),
(6, 'admin', 'c3284d0f94606de1fd2af172aba15bf3', '13111111111', '2@qq.com', 1551762435, 1, '0000-00-00 00:00:00', '192.168.1.119'),
(7, 'jancar', '10e208ffd957f5488f795e555f483af8', '13111111111', '3@qq.com', 1552028100, 1, '2019-03-08 06:55:00', '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_user_log`
--

CREATE TABLE `fly_user_log` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `tableName` text NOT NULL,
  `data` text NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_user_log`
--

INSERT INTO `fly_user_log` (`id`, `userid`, `event`, `tableName`, `data`, `createtime`, `ip`) VALUES
(1, 6, 'del', 'news', '{\"aboutId\":\"4\",\"status\":0}', '2019-03-11 02:21:11', '192.168.1.119'),
(2, 6, 'add', 'news', '{\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/12\\/993f4446443c2d7f25596512720cdf.jpg\",\"aboutText\":\"test\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-11 02:27:32', '192.168.1.119'),
(3, 6, 'del', 'news', '{\"aboutId\":\"5\",\"status\":0}', '2019-03-11 02:27:38', '192.168.1.119'),
(4, 6, 'del', 'welcome', '{\"welcomeId\":\"4\",\"status\":0}', '2019-03-11 03:22:14', '192.168.1.119'),
(5, 6, 'del', 'product', '{\"productId\":\"3\",\"status\":0}', '2019-03-11 03:22:17', '192.168.1.119'),
(6, 6, 'del', 'news', '{\"newsId\":\"1\",\"status\":0}', '2019-03-11 03:22:21', '192.168.1.119'),
(7, 6, 'del', 'cases', '{\"casesId\":\"1\",\"status\":0}', '2019-03-11 03:22:25', '192.168.1.119'),
(8, 6, 'del', 'about', '{\"aboutId\":\"3\",\"status\":0}', '2019-03-11 03:22:28', '192.168.1.119'),
(9, 6, 'del', 'recruitment', '{\"recruitmentId\":\"2\",\"status\":0}', '2019-03-11 03:22:31', '192.168.1.119'),
(10, 6, 'del', 'history', '{\"historyId\":\"2\",\"status\":0}', '2019-03-11 03:22:34', '192.168.1.119'),
(11, 6, 'del', 'history', '{\"historyId\":\"1\",\"status\":0}', '2019-03-11 05:36:41', '192.168.1.119'),
(12, 6, 'login', '', '', '2019-03-11 05:44:13', '192.168.1.119'),
(13, 6, 'login', '', '', '2019-03-11 05:44:46', '192.168.1.119'),
(14, 6, 'login', '', '', '2019-03-11 05:45:34', '192.168.1.119'),
(15, 6, 'logout', '', '', '2019-03-11 05:45:36', '192.168.1.119'),
(16, 6, 'login', '', '', '2019-03-11 05:45:45', '192.168.1.119'),
(17, 6, 'logout', '', '', '2019-03-11 05:47:13', '192.168.1.119'),
(18, 6, 'login', '', '', '2019-03-11 05:47:21', '192.168.1.119'),
(19, 5, 'login', '', '', '2019-03-11 05:50:12', '192.168.1.119'),
(20, 6, 'logout', '', '', '2019-03-11 05:51:42', '192.168.1.119'),
(21, 6, 'login', '', '', '2019-03-11 05:54:04', '192.168.1.119'),
(22, 6, 'del', 'welcome', '{\"welcomeId\":\"4\",\"status\":1}', '2019-03-11 06:05:04', '192.168.1.119'),
(23, 6, 'del', 'product', '{\"productId\":\"3\",\"status\":1}', '2019-03-11 06:05:43', '192.168.1.119'),
(24, 6, 'del', 'news', '{\"newsId\":\"1\",\"status\":1}', '2019-03-11 06:05:47', '192.168.1.119'),
(25, 6, 'del', 'cases', '{\"casesId\":\"1\",\"status\":1}', '2019-03-11 06:05:53', '192.168.1.119'),
(26, 6, 'del', 'about', '{\"aboutId\":\"5\",\"status\":1}', '2019-03-11 06:06:00', '192.168.1.119'),
(27, 6, 'del', 'recruitment', '{\"recruitmentId\":\"2\",\"status\":1}', '2019-03-11 06:06:04', '192.168.1.119'),
(28, 6, 'del', 'history', '{\"historyId\":\"2\",\"status\":1}', '2019-03-11 06:06:07', '192.168.1.119'),
(29, 6, 'del', 'history', '{\"historyId\":\"1\",\"status\":1}', '2019-03-11 06:06:09', '192.168.1.119'),
(30, 6, 'del', 'about', '{\"aboutId\":\"3\",\"status\":1}', '2019-03-11 06:06:59', '192.168.1.119'),
(31, 6, 'del', 'about', '{\"aboutId\":\"5\",\"status\":0}', '2019-03-11 06:07:22', '192.168.1.119'),
(32, 6, 'add', 'cases', '{\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/9f\\/e51538edbe7cd7ab234da7af1fc7d0.jpg\",\"casesTitle\":\"\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\",\"casesText\":\"\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\\u65b0\\u95fb\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-11 06:07:53', '192.168.1.119'),
(33, 6, 'del', 'cases', '{\"casesId\":\"8\",\"status\":0}', '2019-03-11 06:10:26', '192.168.1.119'),
(34, 6, 'add', 'news', '{\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/8c\\/e959e3095e392fd7f8c63177cfac0a.jpg\",\"imageurl2\":\"\",\"newsTitle\":\"1\",\"newsText\":\"1\",\"ip\":\"192.168.1.119\",\"userid\":6,\"newsId\":1}', '2019-03-11 06:11:21', '192.168.1.119'),
(35, 6, 'del', 'news', '{\"newsId\":\"13\",\"status\":0}', '2019-03-11 06:13:22', '192.168.1.119'),
(36, 6, 'add', 'news', '{\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/7e\\/b83361c57dc762493d937381938176.jpg\",\"imageurl2\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/fb\\/373749569112755e4149c01d7f7346.jpg\",\"newsTitle\":\"111\",\"newsText\":\"1\",\"ip\":\"192.168.1.119\",\"userid\":6,\"newsId\":\"14\"}', '2019-03-11 06:13:35', '192.168.1.119'),
(37, 6, 'del', 'news', '{\"newsId\":\"14\",\"status\":0}', '2019-03-11 06:13:54', '192.168.1.119'),
(38, 6, 'del', 'news', '{\"newsId\":\"12\",\"status\":0}', '2019-03-11 06:17:25', '192.168.1.119'),
(39, 6, 'del', 'news', '{\"newsId\":\"8\",\"status\":0}', '2019-03-11 06:17:25', '192.168.1.119'),
(40, 6, 'del', 'news', '{\"newsId\":\"6\",\"status\":0}', '2019-03-11 06:17:25', '192.168.1.119'),
(41, 6, 'del', 'news', '{\"newsId\":\"7\",\"status\":0}', '2019-03-11 06:17:25', '192.168.1.119'),
(42, 6, 'login', '', '', '2019-03-11 09:03:15', '192.168.1.119'),
(43, 6, 'login', '', '', '2019-03-11 10:05:45', '192.168.1.119'),
(44, 6, 'login', '', '', '2019-03-12 00:44:15', '192.168.1.119'),
(45, 5, 'login', '', '', '2019-03-12 00:56:50', '192.168.1.119'),
(46, 6, 'del', 'cell', '{\"cellId\":\"59\",\"status\":0}', '2019-03-12 01:12:22', '192.168.1.119'),
(47, 6, 'del', 'cell', '{\"cellId\":\"58\",\"status\":0}', '2019-03-12 01:12:22', '192.168.1.119'),
(48, 6, 'login', '', '', '2019-03-12 02:52:32', '192.168.1.119'),
(49, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"\",\"imageurl2\":\"\",\"width\":\"\",\"height\":\"\",\"textTitle\":\"\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"cellId\":\"60\"}', '2019-03-12 05:37:25', '192.168.1.119'),
(50, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"\",\"imageurl2\":\"\",\"width\":\"\",\"height\":\"\",\"textTitle\":\"\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"cellId\":\"61\"}', '2019-03-12 05:37:34', '192.168.1.119'),
(51, 6, 'logout', '', '', '2019-03-12 05:37:37', '192.168.1.119'),
(52, 6, 'login', '', '', '2019-03-12 05:37:44', '192.168.1.119'),
(53, 6, 'del', 'cell', '{\"cellId\":\"61\",\"status\":0}', '2019-03-12 05:37:57', '192.168.1.119'),
(54, 6, 'del', 'cell', '{\"cellId\":\"60\",\"status\":0}', '2019-03-12 05:37:57', '192.168.1.119'),
(55, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"\",\"imageurl2\":\"\",\"width\":\"\",\"height\":\"\",\"textTitle\":\"\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"cellId\":\"62\"}', '2019-03-12 05:39:04', '192.168.1.119'),
(56, 6, 'edit', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/8c\\/e959e3095e392fd7f8c63177cfac0a.jpg\",\"imageurl2\":\"\",\"width\":\"370\",\"height\":\"260\",\"textTitle\":\"\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"62\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-12 05:39:14', '192.168.1.119'),
(57, 6, 'del', 'cell', '{\"cellId\":\"62\",\"status\":0}', '2019-03-12 05:39:17', '192.168.1.119'),
(58, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/fb\\/373749569112755e4149c01d7f7346.jpg\",\"imageurl2\":\"\",\"width\":\"370\",\"height\":\"260\",\"textTitle\":\"\\u6d4b\\u8bd5\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"subcell\":[\"sub1_\",\"sub2_\"],\"sub1_celltypeId\":\"1\",\"sub1_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/f3\\/4b056b9160f370bb4cba56ca4fdc18.png\",\"sub1_imageurl2\":\"\",\"sub1_width\":\"64\",\"sub1_height\":\"64\",\"sub1_textTitle\":\"\\u5b50\\u63a7\\u4ef61\",\"sub1_textSize\":\"\",\"sub1_textColor\":\"\",\"sub1_textFont\":\"\",\"sub1_textLeft\":\"\",\"sub1_textTop\":\"\",\"sub1_textRight\":\"\",\"sub1_textBottom\":\"\",\"sub1_textAlign\":\"\",\"sub1_packName\":\"\",\"sub1_className\":\"\",\"sub1_intentFlag\":\"\",\"sub1_action\":\"\",\"sub1_flyAction\":\"\",\"sub1_remark\":\"\",\"sub2_celltypeId\":\"1\",\"sub2_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/27\\/bab0504c1ffe97b3a0597c47fc4bbf.png\",\"sub2_imageurl2\":\"\",\"sub2_width\":\"64\",\"sub2_height\":\"64\",\"sub2_textTitle\":\"\",\"sub2_textSize\":\"\",\"sub2_textColor\":\"\",\"sub2_textFont\":\"\",\"sub2_textLeft\":\"\",\"sub2_textTop\":\"\",\"sub2_textRight\":\"\",\"sub2_textBottom\":\"\",\"sub2_textAlign\":\"\",\"sub2_packName\":\"\",\"sub2_className\":\"\",\"sub2_intentFlag\":\"\",\"sub2_action\":\"\",\"sub2_flyAction\":\"\",\"sub2_remark\":\"\",\"cellId\":\"65\"}', '2019-03-12 06:51:44', '192.168.1.119'),
(59, 6, 'login', '', '', '2019-03-12 10:12:27', '192.168.1.119'),
(60, 6, 'login', '', '', '2019-03-14 00:38:09', '192.168.1.119'),
(61, 6, 'login', '', '', '2019-03-14 02:21:31', '192.168.1.119'),
(62, 6, 'login', '', '', '2019-03-15 00:40:07', '192.168.1.119'),
(63, 6, 'login', '', '', '2019-03-15 02:36:45', '192.168.1.119'),
(64, 6, 'login', '', '', '2019-03-15 05:52:16', '192.168.1.119'),
(65, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP3\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"1\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/f8\\/fc65ab56c952ebccd91be18b9a2d06.png\",\"remark\":\"\",\"themeId\":\"7\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 05:55:58', '192.168.1.119'),
(66, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP4\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/b0\\/c768931cd086751d854d1847e181cf.png\",\"remark\":\"\",\"themeId\":\"12\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 05:56:04', '192.168.1.119'),
(67, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"0\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 05:56:11', '192.168.1.119'),
(68, 6, 'add', 'theme', '{\"themeName\":\"Launcher-AP6\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"themeId\":\"14\"}', '2019-03-15 05:58:40', '192.168.1.119'),
(69, 6, 'edit', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/fb\\/373749569112755e4149c01d7f7346.jpg\",\"imageurl2\":\"\",\"width\":\"370\",\"height\":\"260\",\"textTitle\":\"\\u6d4b\\u8bd5\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"65\",\"subcell\":[\"sub_1_\",\"sub_2_\"],\"sub_1_celltypeId\":\"1\",\"sub_1_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d9\\/0bb9f54b8ca86c80353f9554a104be.jpg\",\"sub_1_imageurl2\":\"\",\"sub_1_width\":\"280\",\"sub_1_height\":\"400\",\"sub_1_textTitle\":\"\\u5b50\\u63a7\\u4ef61\",\"sub_1_textSize\":\"24\",\"sub_1_textColor\":\"\",\"sub_1_textFont\":\"\",\"sub_1_textLeft\":\"0\",\"sub_1_textTop\":\"0\",\"sub_1_textRight\":\"0\",\"sub_1_textBottom\":\"0\",\"sub_1_textAlign\":\"\",\"sub_1_packName\":\"\",\"sub_1_className\":\"\",\"sub_1_intentFlag\":\"\",\"sub_1_action\":\"\",\"sub_1_flyAction\":\"\",\"sub_1_remark\":\"\",\"sub_2_celltypeId\":\"1\",\"sub_2_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/27\\/bab0504c1ffe97b3a0597c47fc4bbf.png\",\"sub_2_imageurl2\":\"\",\"sub_2_width\":\"64\",\"sub_2_height\":\"64\",\"sub_2_textTitle\":\"\",\"sub_2_textSize\":\"24\",\"sub_2_textColor\":\"\",\"sub_2_textFont\":\"\",\"sub_2_textLeft\":\"0\",\"sub_2_textTop\":\"0\",\"sub_2_textRight\":\"0\",\"sub_2_textBottom\":\"0\",\"sub_2_textAlign\":\"\",\"sub_2_packName\":\"\",\"sub_2_className\":\"\",\"sub_2_intentFlag\":\"\",\"sub_2_action\":\"\",\"sub_2_flyAction\":\"\",\"sub_2_remark\":\"\"}', '2019-03-15 06:13:31', '192.168.1.119'),
(70, 6, 'edit', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/fb\\/373749569112755e4149c01d7f7346.jpg\",\"imageurl2\":\"\",\"width\":\"370\",\"height\":\"260\",\"textTitle\":\"\\u6d4b\\u8bd5\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"65\",\"subcell\":[\"sub_1_\",\"sub_2_\"],\"sub_1_celltypeId\":\"1\",\"sub_1_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d9\\/0bb9f54b8ca86c80353f9554a104be.jpg\",\"sub_1_imageurl2\":\"\",\"sub_1_width\":\"280\",\"sub_1_height\":\"400\",\"sub_1_textTitle\":\"\\u5b50\\u63a7\\u4ef612345\",\"sub_1_textSize\":\"24\",\"sub_1_textColor\":\"\",\"sub_1_textFont\":\"\",\"sub_1_textLeft\":\"0\",\"sub_1_textTop\":\"0\",\"sub_1_textRight\":\"0\",\"sub_1_textBottom\":\"0\",\"sub_1_textAlign\":\"\",\"sub_1_packName\":\"\",\"sub_1_className\":\"\",\"sub_1_intentFlag\":\"\",\"sub_1_action\":\"\",\"sub_1_flyAction\":\"\",\"sub_1_remark\":\"\",\"sub_2_celltypeId\":\"1\",\"sub_2_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/27\\/bab0504c1ffe97b3a0597c47fc4bbf.png\",\"sub_2_imageurl2\":\"\",\"sub_2_width\":\"64\",\"sub_2_height\":\"64\",\"sub_2_textTitle\":\"\",\"sub_2_textSize\":\"24\",\"sub_2_textColor\":\"\",\"sub_2_textFont\":\"\",\"sub_2_textLeft\":\"0\",\"sub_2_textTop\":\"0\",\"sub_2_textRight\":\"0\",\"sub_2_textBottom\":\"0\",\"sub_2_textAlign\":\"\",\"sub_2_packName\":\"\",\"sub_2_className\":\"\",\"sub_2_intentFlag\":\"\",\"sub_2_action\":\"\",\"sub_2_flyAction\":\"\",\"sub_2_remark\":\"\"}', '2019-03-15 06:13:42', '192.168.1.119'),
(71, 6, 'edit', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/fb\\/373749569112755e4149c01d7f7346.jpg\",\"imageurl2\":\"\",\"width\":\"370\",\"height\":\"260\",\"textTitle\":\"\\u6d4b\\u8bd5\",\"textSize\":\"24\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"65\",\"subcell\":[\"sub_1_\",\"sub_2_\"],\"sub_1_celltypeId\":\"1\",\"sub_1_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d9\\/0bb9f54b8ca86c80353f9554a104be.jpg\",\"sub_1_imageurl2\":\"\",\"sub_1_width\":\"280\",\"sub_1_height\":\"400\",\"sub_1_textTitle\":\"\\u5b50\\u63a7\\u4ef612345\",\"sub_1_textSize\":\"24\",\"sub_1_textColor\":\"\",\"sub_1_textFont\":\"\",\"sub_1_textLeft\":\"0\",\"sub_1_textTop\":\"0\",\"sub_1_textRight\":\"0\",\"sub_1_textBottom\":\"0\",\"sub_1_textAlign\":\"\",\"sub_1_packName\":\"\",\"sub_1_className\":\"\",\"sub_1_intentFlag\":\"\",\"sub_1_action\":\"\",\"sub_1_flyAction\":\"\",\"sub_1_remark\":\"\",\"sub_2_celltypeId\":\"1\",\"sub_2_imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/86\\/838467119e6ab70cbeea58eddb74a5.jpg\",\"sub_2_imageurl2\":\"\",\"sub_2_width\":\"280\",\"sub_2_height\":\"400\",\"sub_2_textTitle\":\"\\u6d4b\\u8bd5\\u5b50\\u63a7\\u4ef6\",\"sub_2_textSize\":\"24\",\"sub_2_textColor\":\"\",\"sub_2_textFont\":\"\",\"sub_2_textLeft\":\"0\",\"sub_2_textTop\":\"0\",\"sub_2_textRight\":\"0\",\"sub_2_textBottom\":\"0\",\"sub_2_textAlign\":\"\",\"sub_2_packName\":\"\",\"sub_2_className\":\"\",\"sub_2_intentFlag\":\"\",\"sub_2_action\":\"\",\"sub_2_flyAction\":\"\",\"sub_2_remark\":\"\"}', '2019-03-15 06:14:06', '192.168.1.119'),
(72, 6, 'del', 'cell', '{\"cellId\":\"65\",\"status\":0}', '2019-03-15 06:14:37', '192.168.1.119'),
(73, 6, 'add', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"pageId\":\"14\"}', '2019-03-15 06:36:16', '192.168.1.119'),
(74, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP3\",\"pageId\":\"8\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:36:26', '192.168.1.119'),
(75, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e8c\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP3\",\"pageId\":\"9\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:36:32', '192.168.1.119'),
(76, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP4\",\"pageId\":\"11\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:36:41', '192.168.1.119'),
(77, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP5\",\"pageId\":\"12\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:36:49', '192.168.1.119'),
(78, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e8c\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP5\",\"pageId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:36:55', '192.168.1.119'),
(79, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP6\",\"pageId\":\"14\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 06:37:06', '192.168.1.119'),
(80, 6, 'del', 'cell', '{\"cellId\":\"65\",\"status\":0}', '2019-03-15 06:44:26', '192.168.1.119'),
(81, 6, 'add', 'cell', '{\"celltypeId\":\"25\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/15\\/22a1b70b85f3dd21b0f9dafbe8f6ac.png\",\"imageurl2\":\"\",\"width\":\"406\",\"height\":\"272\",\"textTitle\":\"\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"66\"}', '2019-03-15 06:45:52', '192.168.1.119'),
(82, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/e9\\/26949dd5843dcdb9bd9893caf3fd2c.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u7535\\u8bdd\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"67\"}', '2019-03-15 06:48:27', '192.168.1.119'),
(83, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/90\\/88f19c9582ce850cd11933b8a1208d.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u89c6\\u9891\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"68\"}', '2019-03-15 06:48:43', '192.168.1.119'),
(84, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/af\\/0ffa4e380deeaf581bd4738ea26a1e.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u97f3\\u4e50\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"69\"}', '2019-03-15 06:48:57', '192.168.1.119'),
(85, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/23\\/a05ed14f5b2d0fec605e4f38d4efe5.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u56fe\\u7247\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"70\"}', '2019-03-15 06:49:11', '192.168.1.119'),
(86, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/62\\/5beb92cb715f81447ddf02d1e97a0c.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u8bbe\\u7f6e\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"71\"}', '2019-03-15 06:49:25', '192.168.1.119'),
(87, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/bd\\/7dbae4c9606e19425ee24105c97847.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"AVIN\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"72\"}', '2019-03-15 06:49:42', '192.168.1.119'),
(88, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/69\\/e5c58fca385c9d67af06ebc77c8c0c.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u6536\\u97f3\\u673a\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"73\"}', '2019-03-15 06:49:55', '192.168.1.119'),
(89, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/a4\\/0f78d7a2419cadb4f31b77c8f7fb42.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u5bfc\\u822a\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"74\"}', '2019-03-15 06:50:09', '192.168.1.119'),
(90, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/05\\/a16741c726afed1917c8e1b02babf5.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u5e94\\u7528\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"75\"}', '2019-03-15 06:50:20', '192.168.1.119'),
(91, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/f5\\/e174af144e1336fac615000c8d9faf.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u624b\\u673a\\u4e92\\u8054\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"76\"}', '2019-03-15 06:50:34', '192.168.1.119'),
(92, 6, 'add', 'cell', '{\"celltypeId\":\"1\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/07\\/f5f1be53d377245b0a35f5d3a8da13.png\",\"imageurl2\":\"\",\"width\":\"105\",\"height\":\"105\",\"textTitle\":\"\\u84dd\\u7259\\u97f3\\u4e50\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"-50\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"77\"}', '2019-03-15 06:50:47', '192.168.1.119'),
(93, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u955c\\u50cf\\u63a7\\u4ef6\",\"celltype\":\"5\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/51\\/b013a08f7ad2ff3de49e3b9740cdd0.png\",\"extend\":\"\",\"remark\":\"\\u53ef\\u4ee5\\u751f\\u6210\\u955c\\u50cf\\u7684\\u56fe\\u7247\",\"celltypeId\":\"27\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 07:04:08', '192.168.1.119'),
(94, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u65e5\\u671f\\u63a7\\u4ef6\",\"celltype\":\"3\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/80\\/7048235eca8611e36b03c9a943adaf.png\",\"extend\":\"\",\"remark\":\"\\u7528\\u6765\\u663e\\u793a\\u65e5\\u671f\\u7684\\u63a7\\u4ef6\",\"celltypeId\":\"25\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 07:05:10', '192.168.1.119'),
(95, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5a92\\u4f53\\u4fe1\\u606f\\u63a7\\u4ef6\",\"celltype\":\"4\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/af\\/d0a90782db989dbd2bab5dd993a3e2.png\",\"extend\":\"\",\"remark\":\"\\u663e\\u793a\\u5a92\\u4f53\\u64ad\\u653e\\u4fe1\\u606f\",\"celltypeId\":\"26\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 07:06:20', '192.168.1.119'),
(96, 6, 'edit', 'cell', '{\"celltypeId\":\"25\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/15\\/22a1b70b85f3dd21b0f9dafbe8f6ac.png\",\"imageurl2\":\"\",\"width\":\"406\",\"height\":\"272\",\"textTitle\":\"\",\"textSize\":\"80\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"66\"}', '2019-03-15 07:13:41', '192.168.1.119'),
(97, 6, 'edit', 'cell', '{\"celltypeId\":\"25\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/15\\/22a1b70b85f3dd21b0f9dafbe8f6ac.png\",\"imageurl2\":\"\",\"width\":\"406\",\"height\":\"272\",\"textTitle\":\"\",\"textSize\":\"64\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"0\",\"textTop\":\"0\",\"textRight\":\"0\",\"textBottom\":\"0\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"66\"}', '2019-03-15 07:13:56', '192.168.1.119'),
(98, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP6\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d3\\/b3bb3a1a9a2ae08b6585c8512d769b.png\",\"remark\":\"\",\"themeId\":\"14\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-15 09:50:45', '192.168.1.119'),
(99, 6, 'login', '', '', '2019-03-15 10:02:21', '192.168.1.119'),
(100, 6, 'login', '', '', '2019-03-18 00:40:55', '192.168.1.119'),
(101, 6, 'login', '', '', '2019-03-19 07:01:09', '192.168.1.119'),
(102, 6, 'add', 'theme', '{\"themeName\":\"Music-AP1\",\"width\":\"1024\",\"height\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"themeId\":\"15\"}', '2019-03-19 07:06:18', '192.168.1.119'),
(103, 6, 'add', 'page', '{\"pageName\":\"Music_Menu\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Music-AP1\",\"ip\":\"192.168.1.119\",\"userid\":6,\"pageId\":\"15\"}', '2019-03-19 08:23:03', '192.168.1.119'),
(104, 6, 'login', '', '', '2019-03-20 00:53:05', '192.168.1.119'),
(105, 6, 'login', '', '', '2019-03-20 00:53:33', '192.168.1.119'),
(106, 6, 'login', '', '', '2019-03-20 03:49:22', '192.168.1.119'),
(107, 6, 'login', '', '', '2019-03-21 00:45:08', '192.168.1.119'),
(108, 6, 'login', '', '', '2019-03-22 00:36:49', '192.168.1.119'),
(109, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1920\",\"height\":\"1080\",\"remark\":\"Launcher-AP1\",\"pageId\":\"5\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 01:20:57', '192.168.1.119'),
(110, 6, 'edit', 'page', '{\"pageName\":\"\\u7b2c\\u4e00\\u9875\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher-AP1\",\"pageId\":\"5\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 01:21:30', '192.168.1.119'),
(111, 6, 'edit', 'page', '{\"pageName\":\"Launcher-TOP\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher\",\"pageId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 01:22:06', '192.168.1.119'),
(112, 6, 'edit', 'page', '{\"pageName\":\"Launcher\\u9876\\u90e8\\u9875\\u9762\",\"imageurl\":\"\",\"width\":\"1024\",\"height\":\"600\",\"remark\":\"Launcher\",\"pageId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 01:22:41', '192.168.1.119'),
(113, 6, 'login', '', '', '2019-03-22 06:22:17', '192.168.1.119'),
(114, 6, 'edit', 'theme', '{\"themeName\":\"\\u7b2c\\u4e00\\u9875\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"\",\"remark\":\"\",\"themeId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 06:50:57', '192.168.1.119'),
(115, 6, 'edit', 'theme', '{\"themeName\":\"Music-AP1\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"\",\"remark\":\"\",\"themeId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-22 06:52:34', '192.168.1.119'),
(116, 6, 'del', 'page', '{\"pageId\":\"15\",\"status\":0}', '2019-03-22 07:00:07', '192.168.1.119'),
(117, 6, 'login', '', '', '2019-03-22 09:59:49', '192.168.1.119'),
(118, 6, 'login', '', '', '2019-03-23 00:44:15', '192.168.1.119'),
(119, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"21\"}', '2019-03-23 07:49:44', '192.168.1.119'),
(120, 6, 'edit', 'theme', '{\"themeId\":5,\"themeName\":\"Launcher-AP1\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/4c\\/b32fd9b6fae5c378c2c0410e7cf70f.jpg\",\"isMirror\":1,\"animType\":1,\"status\":1,\"remark\":\"\",\"topPageId\":\"21\"}', '2019-03-23 07:49:44', '192.168.1.119'),
(121, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"22\"}', '2019-03-23 08:02:40', '192.168.1.119'),
(122, 6, 'edit', 'theme', '{\"themeId\":7,\"themeName\":\"Launcher-AP3\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/f8\\/fc65ab56c952ebccd91be18b9a2d06.png\",\"isMirror\":1,\"animType\":1,\"status\":1,\"remark\":\"\",\"topPageId\":\"22\"}', '2019-03-23 08:02:40', '192.168.1.119'),
(123, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"23\"}', '2019-03-23 08:03:29', '192.168.1.119'),
(124, 6, 'edit', 'theme', '{\"themeId\":12,\"themeName\":\"Launcher-AP4\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/b0\\/c768931cd086751d854d1847e181cf.png\",\"isMirror\":0,\"animType\":0,\"status\":1,\"remark\":\"\",\"topPageId\":\"23\"}', '2019-03-23 08:03:29', '192.168.1.119'),
(125, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"24\"}', '2019-03-23 08:03:35', '192.168.1.119'),
(126, 6, 'edit', 'theme', '{\"themeId\":13,\"themeName\":\"Launcher-AP5\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"isMirror\":0,\"animType\":1,\"status\":1,\"remark\":\"\",\"topPageId\":\"24\"}', '2019-03-23 08:03:35', '192.168.1.119'),
(127, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"25\"}', '2019-03-23 08:03:37', '192.168.1.119'),
(128, 6, 'edit', 'theme', '{\"themeId\":14,\"themeName\":\"Launcher-AP6\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d3\\/b3bb3a1a9a2ae08b6585c8512d769b.png\",\"isMirror\":0,\"animType\":0,\"status\":1,\"remark\":\"\",\"topPageId\":\"25\"}', '2019-03-23 08:03:37', '192.168.1.119'),
(129, 6, 'add', 'page', '{\"pageName\":\"TOP_PAGE\",\"status\":2,\"width\":1024,\"height\":600,\"userid\":6,\"ip\":\"192.168.1.119\",\"pageId\":\"26\"}', '2019-03-23 08:03:40', '192.168.1.119'),
(130, 6, 'edit', 'theme', '{\"themeId\":15,\"themeName\":\"Music-AP1\",\"themeType\":null,\"screenWidth\":1024,\"screenHeight\":600,\"x\":0,\"y\":0,\"width\":0,\"height\":0,\"imageurl\":\"\",\"isMirror\":0,\"animType\":0,\"status\":1,\"remark\":\"\",\"topPageId\":\"26\"}', '2019-03-23 08:03:40', '192.168.1.119'),
(131, 6, 'edit', 'theme', '{\"themeName\":\"Music-AP1\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/42\\/e1f50a04f3daaa87b24d9883631db4.png\",\"remark\":\"\",\"themeId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-23 08:04:31', '192.168.1.119'),
(132, 6, 'login', '', '', '2019-03-25 02:00:45', '192.168.1.119'),
(133, 6, 'edit', 'theme', '{\"themeName\":\"Music-AP1\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"isMirror\":\"1\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/42\\/e1f50a04f3daaa87b24d9883631db4.png\",\"remark\":\"\",\"themeId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 02:48:42', '192.168.1.119'),
(134, 6, 'add', 'celltype', '{\"celltypeName\":\"\\u5bfc\\u822a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"\",\"remark\":\"\",\"ip\":\"192.168.1.119\",\"userid\":6,\"celltypeId\":\"28\"}', '2019-03-25 05:25:27', '192.168.1.119'),
(135, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5bfc\\u822a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/08\\/107d409667de3c3b17d9b0bd193f06.png\",\"extend\":\"\",\"remark\":\"\",\"celltypeId\":\"28\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 05:29:47', '192.168.1.119'),
(136, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5706\\u70b9\\u9875\\u9762\\u5bfc\\u822a\\u6307\\u793a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/08\\/107d409667de3c3b17d9b0bd193f06.png\",\"extend\":\"\",\"remark\":\"\",\"celltypeId\":\"28\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 05:30:43', '192.168.1.119'),
(137, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5706\\u70b9\\u9875\\u9762\\u5bfc\\u822a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/08\\/107d409667de3c3b17d9b0bd193f06.png\",\"extend\":\"\",\"remark\":\"\",\"celltypeId\":\"28\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 05:30:56', '192.168.1.119'),
(138, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5706\\u70b9\\u5bfc\\u822a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/08\\/107d409667de3c3b17d9b0bd193f06.png\",\"extend\":\"\",\"remark\":\"\",\"celltypeId\":\"28\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 05:31:04', '192.168.1.119'),
(139, 6, 'edit', 'celltype', '{\"celltypeName\":\"\\u5706\\u70b9\\u5206\\u9875\\u5bfc\\u822a\\u6761\",\"celltype\":\"6\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/08\\/107d409667de3c3b17d9b0bd193f06.png\",\"extend\":\"\",\"remark\":\"\",\"celltypeId\":\"28\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 05:31:16', '192.168.1.119'),
(140, 6, 'add', 'cell', '{\"celltypeId\":\"28\",\"imageurl1\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/40\\/841f8b970233545b18c849c6908a49.png\",\"imageurl2\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/a9\\/107fb29ec2972ec649ca6a57fbbaf5.png\",\"width\":\"1024\",\"height\":\"16\",\"textTitle\":\"\",\"textSize\":\"\",\"textColor\":\"\",\"textFont\":\"\",\"textLeft\":\"\",\"textTop\":\"\",\"textRight\":\"\",\"textBottom\":\"\",\"textAlign\":\"\",\"packName\":\"\",\"className\":\"\",\"intentFlag\":\"\",\"action\":\"\",\"flyAction\":\"\",\"remark\":\"\",\"cellId\":\"78\"}', '2019-03-25 05:33:12', '192.168.1.119'),
(141, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP1\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"1\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/4c\\/b32fd9b6fae5c378c2c0410e7cf70f.jpg\",\"remark\":\"\",\"themeId\":\"5\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:34:40', '192.168.1.119'),
(142, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP3\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"1\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/f8\\/fc65ab56c952ebccd91be18b9a2d06.png\",\"remark\":\"\",\"themeId\":\"7\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:34:54', '192.168.1.119'),
(143, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP4\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/b0\\/c768931cd086751d854d1847e181cf.png\",\"remark\":\"\",\"themeId\":\"12\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:35:06', '192.168.1.119'),
(144, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:35:16', '192.168.1.119'),
(145, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP6\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/d3\\/b3bb3a1a9a2ae08b6585c8512d769b.png\",\"remark\":\"\",\"themeId\":\"14\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:35:30', '192.168.1.119'),
(146, 6, 'edit', 'theme', '{\"themeName\":\"Music-AP1\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"0\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"1\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/42\\/e1f50a04f3daaa87b24d9883631db4.png\",\"remark\":\"\",\"themeId\":\"15\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:35:58', '192.168.1.119'),
(147, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"191\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 08:47:50', '192.168.1.119'),
(148, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"296\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"1\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 09:29:27', '192.168.1.119'),
(149, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"296\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"0\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 09:30:05', '192.168.1.119'),
(150, 6, 'edit', 'theme', '{\"themeName\":\"Launcher-AP5\",\"screenWidth\":\"1024\",\"screenHeight\":\"600\",\"left\":\"296\",\"top\":\"0\",\"right\":\"1024\",\"bottom\":\"600\",\"isMirror\":\"0\",\"animType\":\"2\",\"imageurl\":\"http:\\/\\/192.168.1.119:801\\/uiweb\\/uploads\\/2f\\/e2f98c6ff84f553cc7c7079b721ad1.png\",\"remark\":\"\",\"themeId\":\"13\",\"ip\":\"192.168.1.119\",\"userid\":6}', '2019-03-25 09:45:19', '192.168.1.119');

-- --------------------------------------------------------

--
-- 表的结构 `fly_user_role`
--

CREATE TABLE `fly_user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应关系';

--
-- 转存表中的数据 `fly_user_role`
--

INSERT INTO `fly_user_role` (`id`, `user_id`, `role_id`) VALUES
(18, 6, 3),
(25, 7, 3),
(26, 5, 8);

-- --------------------------------------------------------

--
-- 表的结构 `fly_welcome`
--

CREATE TABLE `fly_welcome` (
  `welcomeId` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `welcomeTitle` varchar(255) DEFAULT NULL,
  `welcomeText` text,
  `welcomeSort` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `userid` int(11) NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fly_welcome`
--

INSERT INTO `fly_welcome` (`welcomeId`, `imageurl`, `welcomeTitle`, `welcomeText`, `welcomeSort`, `status`, `userid`, `edittime`, `ip`) VALUES
(1, 'http://192.168.1.119:801/uiweb/uploads/7e/b83361c57dc762493d937381938176.jpg', '深圳景安驰', '保持驾驶安全永远是第一重要，任何新功能的增加都必须先考虑这个原则。', 1, 1, 6, '2019-03-06 08:11:52', '192.168.1.119'),
(3, '/uiweb/uploads/3b/1b79b7bfda8e8841538b7291782506.jpg', '深圳景安驰', '车载系统不是手机系统的简单移植，手机上的应用大部分也不适合车载系统。', 2, 1, 0, '2019-02-21 07:10:00', '192.168.1.119'),
(4, 'http://192.168.1.119:801/uiweb/uploads/7e/b83361c57dc762493d937381938176.jpg', '深圳景安驰', '车载系统不是手机系统的简单移植，手机上的应用大部分也不适合车载系统。车载系统不是手机系统的简单移植，手机上的应用大部分也不适合车载系统。', 3, 1, 0, '2019-03-11 06:05:04', '192.168.1.119');

--
-- 转储表的索引
--

--
-- 表的索引 `fly_about`
--
ALTER TABLE `fly_about`
  ADD PRIMARY KEY (`aboutId`);

--
-- 表的索引 `fly_cases`
--
ALTER TABLE `fly_cases`
  ADD PRIMARY KEY (`casesId`);

--
-- 表的索引 `fly_cell`
--
ALTER TABLE `fly_cell`
  ADD PRIMARY KEY (`cellId`);

--
-- 表的索引 `fly_cellsub`
--
ALTER TABLE `fly_cellsub`
  ADD PRIMARY KEY (`cellsubId`);

--
-- 表的索引 `fly_celltype`
--
ALTER TABLE `fly_celltype`
  ADD PRIMARY KEY (`celltypeId`);

--
-- 表的索引 `fly_history`
--
ALTER TABLE `fly_history`
  ADD PRIMARY KEY (`historyId`);

--
-- 表的索引 `fly_news`
--
ALTER TABLE `fly_news`
  ADD PRIMARY KEY (`newsId`);

--
-- 表的索引 `fly_page`
--
ALTER TABLE `fly_page`
  ADD PRIMARY KEY (`pageId`);

--
-- 表的索引 `fly_pagecell`
--
ALTER TABLE `fly_pagecell`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_permission`
--
ALTER TABLE `fly_permission`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_product`
--
ALTER TABLE `fly_product`
  ADD PRIMARY KEY (`productId`);

--
-- 表的索引 `fly_recruitment`
--
ALTER TABLE `fly_recruitment`
  ADD PRIMARY KEY (`recruitmentId`);

--
-- 表的索引 `fly_role`
--
ALTER TABLE `fly_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_role_permission`
--
ALTER TABLE `fly_role_permission`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_theme`
--
ALTER TABLE `fly_theme`
  ADD PRIMARY KEY (`themeId`);

--
-- 表的索引 `fly_themepage`
--
ALTER TABLE `fly_themepage`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_user`
--
ALTER TABLE `fly_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- 表的索引 `fly_user_log`
--
ALTER TABLE `fly_user_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_user_role`
--
ALTER TABLE `fly_user_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fly_welcome`
--
ALTER TABLE `fly_welcome`
  ADD PRIMARY KEY (`welcomeId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fly_about`
--
ALTER TABLE `fly_about`
  MODIFY `aboutId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `fly_cases`
--
ALTER TABLE `fly_cases`
  MODIFY `casesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `fly_cell`
--
ALTER TABLE `fly_cell`
  MODIFY `cellId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- 使用表AUTO_INCREMENT `fly_cellsub`
--
ALTER TABLE `fly_cellsub`
  MODIFY `cellsubId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `fly_celltype`
--
ALTER TABLE `fly_celltype`
  MODIFY `celltypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `fly_history`
--
ALTER TABLE `fly_history`
  MODIFY `historyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `fly_news`
--
ALTER TABLE `fly_news`
  MODIFY `newsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `fly_page`
--
ALTER TABLE `fly_page`
  MODIFY `pageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `fly_pagecell`
--
ALTER TABLE `fly_pagecell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- 使用表AUTO_INCREMENT `fly_permission`
--
ALTER TABLE `fly_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- 使用表AUTO_INCREMENT `fly_product`
--
ALTER TABLE `fly_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `fly_recruitment`
--
ALTER TABLE `fly_recruitment`
  MODIFY `recruitmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `fly_role`
--
ALTER TABLE `fly_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `fly_role_permission`
--
ALTER TABLE `fly_role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- 使用表AUTO_INCREMENT `fly_theme`
--
ALTER TABLE `fly_theme`
  MODIFY `themeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `fly_themepage`
--
ALTER TABLE `fly_themepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `fly_user`
--
ALTER TABLE `fly_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `fly_user_log`
--
ALTER TABLE `fly_user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- 使用表AUTO_INCREMENT `fly_user_role`
--
ALTER TABLE `fly_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `fly_welcome`
--
ALTER TABLE `fly_welcome`
  MODIFY `welcomeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
