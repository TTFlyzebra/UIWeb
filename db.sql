-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-02-18 10:07:39
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
-- 表的结构 `fly_cell`
--

CREATE TABLE `fly_cell` (
  `cellId` int(11) NOT NULL,
  `celltypeId` int(11) NOT NULL,
  `searchName` varchar(255) DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `imageurl1` varchar(255) DEFAULT NULL,
  `imageurl2` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
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
  `remark` text,
  `extend` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_celltype`
--

CREATE TABLE `fly_celltype` (
  `celltypeId` int(11) NOT NULL,
  `celltype` int(11) NOT NULL DEFAULT '0',
  `celltypename` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `extend1name` varchar(255) DEFAULT NULL,
  `extend2name` varchar(255) DEFAULT NULL,
  `extend3name` varchar(255) DEFAULT NULL,
  `extend4name` varchar(255) DEFAULT NULL,
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_event`
--

CREATE TABLE `fly_event` (
  `eventId` int(11) NOT NULL,
  `eventname` varchar(255) NOT NULL,
  `packname` varchar(255) NOT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `data` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_table`
--

CREATE TABLE `fly_table` (
  `tableId` int(11) NOT NULL,
  `tablename` varchar(255) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_tablecell`
--

CREATE TABLE `fly_tablecell` (
  `tableId` int(11) NOT NULL,
  `cellId` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_template`
--

CREATE TABLE `fly_template` (
  `templateId` int(11) NOT NULL,
  `templatename` varchar(64) NOT NULL,
  `templatetype` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `remark` text,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userid` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fly_user`
--

CREATE TABLE `fly_user` (
  `userid` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` int(11) DEFAULT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `fly_cell`
--
ALTER TABLE `fly_cell`
  ADD PRIMARY KEY (`cellId`),
  ADD KEY `id` (`cellId`),
  ADD KEY `type` (`celltypeId`);

--
-- 表的索引 `fly_celltype`
--
ALTER TABLE `fly_celltype`
  ADD PRIMARY KEY (`celltypeId`),
  ADD KEY `celltypeId` (`celltypeId`);

--
-- 表的索引 `fly_event`
--
ALTER TABLE `fly_event`
  ADD PRIMARY KEY (`eventId`);

--
-- 表的索引 `fly_table`
--
ALTER TABLE `fly_table`
  ADD PRIMARY KEY (`tableId`);

--
-- 表的索引 `fly_tablecell`
--
ALTER TABLE `fly_tablecell`
  ADD KEY `tableId` (`tableId`),
  ADD KEY `cellId` (`cellId`);

--
-- 表的索引 `fly_template`
--
ALTER TABLE `fly_template`
  ADD PRIMARY KEY (`templateId`);

--
-- 表的索引 `fly_user`
--
ALTER TABLE `fly_user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `username` (`username`),
  ADD KEY `userid` (`userid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fly_cell`
--
ALTER TABLE `fly_cell`
  MODIFY `cellId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fly_celltype`
--
ALTER TABLE `fly_celltype`
  MODIFY `celltypeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fly_event`
--
ALTER TABLE `fly_event`
  MODIFY `eventId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fly_table`
--
ALTER TABLE `fly_table`
  MODIFY `tableId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fly_template`
--
ALTER TABLE `fly_template`
  MODIFY `templateId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fly_user`
--
ALTER TABLE `fly_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
