-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 14 2018 г., 19:53
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `deltaEvo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `delta_active_users`
--

CREATE TABLE `delta_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about last user action.';

--
-- Дамп данных таблицы `delta_active_users`
--

INSERT INTO `delta_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('96eep2r10u0orig2i1cg54amm3', 1, 'admin', 1520009408, '2', NULL),
('s6mfj00eq88jrffvatnaido960', 1, 'admin', 1521046259, '78', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_active_user_locks`
--

CREATE TABLE `delta_active_user_locks` (
  `id` int(10) NOT NULL,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about locked elements.';

--
-- Дамп данных таблицы `delta_active_user_locks`
--

INSERT INTO `delta_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(297, 's6mfj00eq88jrffvatnaido960', 1, 4, 11, 1520851720),
(285, 's6mfj00eq88jrffvatnaido960', 1, 5, 13, 1520846692),
(303, 's6mfj00eq88jrffvatnaido960', 1, 3, 9, 1521034446),
(320, 's6mfj00eq88jrffvatnaido960', 1, 3, 11, 1521046259);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_active_user_sessions`
--

CREATE TABLE `delta_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about valid user sessions.';

--
-- Дамп данных таблицы `delta_active_user_sessions`
--

INSERT INTO `delta_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('s6mfj00eq88jrffvatnaido960', 1, 1521046259, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_categories`
--

CREATE TABLE `delta_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';

--
-- Дамп данных таблицы `delta_categories`
--

INSERT INTO `delta_categories` (`id`, `category`, `rank`) VALUES
(1, 'Js', 0),
(2, 'Manager and Admin', 0),
(3, 'Content', 0),
(4, 'Navigation', 0),
(5, 'TEST', 0),
(6, 'ADMIN', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_documentgroup_names`
--

CREATE TABLE `delta_documentgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_document_groups`
--

CREATE TABLE `delta_document_groups` (
  `id` int(10) NOT NULL,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_event_log`
--

CREATE TABLE `delta_event_log` (
  `id` int(11) NOT NULL,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';

--
-- Дамп данных таблицы `delta_event_log`
--

INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1515080010, 3, 0, 1, 'Parser / Incorrect number of templates returned fr', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Incorrect number of templates returned from database</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[3] <a href=\"http://evolution/catalog.html\" target=\"_blank\">Каталог</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/manager/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-04 18:33:30</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0063 s (5 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0340 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0404 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6412734985352 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->_getTemplateCodeFromDB</strong>(4)<br />manager/includes/document.parser.class.inc.php on line 2832</td>\n	</tr>\n</table>\n'),
(2, 0, 1515149406, 3, 0, 1, 'Plugin - test / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Illegal string offset \'fields\'</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>167</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>			if ($a[$type][$field] == $b[$type][$field]) {\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/_page_2_f3_v3_v5_f7_v8_v9__f9_v8-12_sort_price_asc_v9fgDg65f-hj.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[3] <a href=\"http://evolution/catalog/\" target=\"_blank\">Каталог</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 13:50:06</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0168 s (44 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1626 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1794 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6405258178711 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->sortGoods</strong>(array $var1, \'menuindex\', \'ASC\')<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 13</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>uasort</strong>(array $var1, Closure $var2)<br />vendor/delta/catalog/c.php on line 172</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->{closure}</strong>(3, 4)<br /> on line </td>\n	</tr>\n</table>\n'),
(3, 0, 1515150877, 3, 0, 1, 'Plugin - test / Execution of a query to the databa', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 2</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT pagetitle, parent, alias, id, isfolder, content, menuindex  \n				FROM  `deltaEvo`.`delta_site_content` WHERE id =  </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 14:14:37</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0049 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0453 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0503 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 9</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />vendor/delta/catalog/c.php on line 123</td>\n	</tr>\n</table>\n'),
(4, 0, 1515150965, 3, 0, 1, 'Plugin - test / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for dDocumentParser::getArrayData(), called in D:\\OpenServer\\OpenServer\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1787) : eval()\'d code on line 11 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>230</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getArrayData ($what){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 14:16:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0050 s (9 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0650 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0701 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->getArrayData</strong>()<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 11</td>\n	</tr>\n</table>\n'),
(5, 0, 1515151671, 3, 0, 1, 'Plugin - test / Execution of a query to the databa', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 2</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT pagetitle, parent, alias, id, isfolder, content, menuindex  \n				FROM  `deltaEvo`.`delta_site_content` WHERE id =  </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 14:27:51</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0042 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0512 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0554 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 9</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />vendor/delta/catalog/c.php on line 124</td>\n	</tr>\n</table>\n'),
(6, 0, 1515152230, 3, 0, 1, 'Plugin - test / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Object of class dDocumentParser could not be converted to string</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>RECOVERABLE ERROR[4096]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>217</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>				return ($$this-&gt;catsIDS);\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 14:37:10</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0040 s (12 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0593 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0633 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->sortIt</strong>(\'cats\', \'menuindex\', \'DESC\')<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 11</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>dDocumentParser->selectTarget</strong>(\'cats\')<br />vendor/delta/catalog/c.php on line 158</td>\n	</tr>\n</table>\n'),
(7, 0, 1515152676, 3, 0, 1, 'Plugin - test / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 2 for dDocumentParser::selectTarget(), called in D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php on line 245 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>217</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	public function selectTarget ($what , &amp;$ids){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 14:44:36</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0041 s (12 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0545 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0586 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1787</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->getArrayData</strong>(\'cats\')<br />manager/includes/document.parser.class.inc.php(1787) : eval()\'d code on line 14</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>dDocumentParser->selectTarget</strong>(\'cats\')<br />vendor/delta/catalog/c.php on line 245</td>\n	</tr>\n</table>\n'),
(8, 0, 1515163331, 3, 0, 1, 'Snippet - DLT_CATALOG / Execution of a query to th', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'AND published = \'1\' AND deleted = \'0\' AND isfolder = \'1\'\' at line 1</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT id FROM `deltaEvo`.`delta_site_content` WHERE parent= AND published = \'1\' AND deleted = \'0\' AND isfolder = \'1\'  </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/_jgkfdgh.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-01-05 17:42:11</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0034 s (5 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1186 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1220 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6408615112305 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(\'DLT_CATALOG\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>dDocumentParser->getCatFromID</strong>(NULL)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 5</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->select</strong>(\'id\', string $var2, string $var3)<br />vendor/delta/catalog/c.php on line 60</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 173</td>\n	</tr>\n</table>\n'),
(9, 0, 1517843133, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Object of class catalog_c could not be converted to string</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>RECOVERABLE ERROR[4096]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>D:\\OpenServer\\OpenServer\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>305</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>			echo $innerCats ;\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/televizory-i-media/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[6] <a href=\"http://evolution/catalog/televizory-i-media/\" target=\"_blank\">Телевизоры и медиа</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:05:33</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0129 s (26 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1587 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1716 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.64111328125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getGoodsFromCats</strong>(6, \'\', \'\', \'1\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 17</td>\n	</tr>\n</table>\n'),
(10, 0, 1517843205, 3, 0, 1, 'Snippet - DLT_CATALOG / Execution of a query to th', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')  AND pd.visible > 0 GROUP BY pd.id_product\' at line 2</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM v_product_dir_and_option `pd`\n				WHERE  pd.id_sc IN ()  AND pd.visible > 0 GROUP BY pd.id_product </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/televizory-i-media/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[6] <a href=\"http://evolution/catalog/televizory-i-media/\" target=\"_blank\">Телевизоры и медиа</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:06:45</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0050 s (26 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0449 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0499 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.64111328125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getGoodsFromCats</strong>(6, \'\', \'\', \'1\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 17</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />vendor/delta/catalog/c.php on line 332</td>\n	</tr>\n</table>\n'),
(11, 0, 1517843207, 3, 0, 1, 'Snippet - DLT_CATALOG / Execution of a query to th', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')  AND pd.visible > 0 GROUP BY pd.id_product\' at line 2</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM v_product_dir_and_option `pd`\n				WHERE  pd.id_sc IN ()  AND pd.visible > 0 GROUP BY pd.id_product </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/televizory-i-media/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[6] <a href=\"http://evolution/catalog/televizory-i-media/\" target=\"_blank\">Телевизоры и медиа</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:06:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0076 s (26 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0537 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0613 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>3.64111328125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getGoodsFromCats</strong>(6, \'\', \'\', \'1\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 17</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />vendor/delta/catalog/c.php on line 332</td>\n	</tr>\n</table>\n'),
(12, 0, 1517843208, 3, 0, 1, 'Snippet - DLT_CATALOG / Execution of a query to th', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')  AND pd.visible > 0 GROUP BY pd.id_product\' at line 2</h3><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">SQL &gt; <span id=\"sqlHolder\">SELECT * FROM v_product_dir_and_option `pd`\n				WHERE  pd.id_sc IN ()  AND pd.visible > 0 GROUP BY pd.id_product </span></div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/televizory-i-media/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[6] <a href=\"http://evolution/catalog/televizory-i-media/\" target=\"_blank\">Телевизоры и медиа</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:06:48</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0056 s (26 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0423 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0478 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.64111328125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getGoodsFromCats</strong>(6, \'\', \'\', \'1\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 17</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->query</strong>(string $var1)<br />vendor/delta/catalog/c.php on line 332</td>\n	</tr>\n</table>\n'),
(13, 0, 1517846200, 3, 0, 1, 'Snippet - DLT_CATALOG / `Array` is not numeric and', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`Array` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:56:40</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0064 s (22 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0609 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0673 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->renderAll</strong>(\'test_cat\', \'cats\', \'print\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 14</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->makeUrl</strong>(array $var1)<br />vendor/delta/catalog/cRender.php on line 44</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(14, 0, 1517846280, 3, 0, 1, 'Snippet - DLT_CATALOG / `` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:58:00</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0072 s (28 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0514 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0586 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->renderAll</strong>(\'test_good\', \'goods\', \'print\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 19</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->makeUrl</strong>(NULL)<br />vendor/delta/catalog/cRender.php on line 44</td>\n	</tr>\n</table>\n'),
(15, 0, 1517846314, 3, 0, 1, 'Snippet - DLT_CATALOG / `` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[4] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/\" target=\"_blank\">Компьютеры и периферия</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-05 18:58:34</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0067 s (28 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0620 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0687 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6410293579102 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 134</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->renderAll</strong>(\'test_good\', \'goods\', \'print\')<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 19</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->makeUrl</strong>(NULL)<br />vendor/delta/catalog/cRender.php on line 47</td>\n	</tr>\n</table>\n'),
(16, 0, 1518191901, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(17, 0, 1519637863, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(18, 0, 1519637863, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
(19, 0, 1519748286, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : in_array() expects parameter 2 to be array, string given</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>89</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>		if (!in_array($data , $this-&gt;{$type})){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-27 19:18:06</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0197 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0586 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0783 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8680877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->set</strong>(2)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->push</strong>(2, \'goodsIDS\')<br />vendor/delta/catalog/c.php on line 74</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>in_array</strong>(2, 223)<br />vendor/delta/catalog/c.php on line 89</td>\n	</tr>\n</table>\n'),
(20, 0, 1519748501, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : in_array() expects parameter 2 to be array, string given</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>89</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>		if (!in_array($data , $this-&gt;{$type})){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-27 19:21:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0042 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0645 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0688 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8678741455078 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->set</strong>(2)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->push</strong>(2, \'goodsIDS\')<br />vendor/delta/catalog/c.php on line 74</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>in_array</strong>(2, \'========1к\')<br />vendor/delta/catalog/c.php on line 89</td>\n	</tr>\n</table>\n'),
(21, 0, 1519750218, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 31 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-27 19:50:18</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0049 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0419 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0469 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8680877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 31</td>\n	</tr>\n</table>\n'),
(22, 0, 1519750376, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 31 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-27 19:52:56</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0106 s (29 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1453 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1559 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8680877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 31</td>\n	</tr>\n</table>\n'),
(23, 0, 1519750988, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:03:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0031 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0287 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0318 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6180877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 407</td>\n	</tr>\n</table>\n'),
(24, 0, 1519751008, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:03:28</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0027 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0317 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0344 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6180877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 407</td>\n	</tr>\n</table>\n'),
(25, 0, 1519751009, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:03:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0029 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0302 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0331 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6180877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 407</td>\n	</tr>\n</table>\n'),
(26, 0, 1519751124, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:05:24</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0028 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0291 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0319 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(27, 0, 1519751125, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:05:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0469 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0492 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(28, 0, 1519751131, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:05:31</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0419 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0442 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(29, 0, 1519751131, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:05:31</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0459 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0481 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(30, 0, 1519751179, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:06:19</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0280 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0304 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(31, 0, 1519751179, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:06:19</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0469 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0494 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(32, 0, 1519751179, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:06:19</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0324 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0347 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(33, 0, 1519751180, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:06:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0268 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0291 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(34, 0, 1519751180, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:06:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0031 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0297 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0328 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(35, 0, 1519751522, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:12:02</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0127 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0307 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0434 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(36, 0, 1519751523, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:12:03</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0021 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0262 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0283 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 125</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(37, 0, 1519751552, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:12:32</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0285 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0309 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(38, 0, 1519751582, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:02</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0020 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0277 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0297 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(39, 0, 1519751583, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:03</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0020 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0320 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0340 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(40, 0, 1519751591, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:11</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0308 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0331 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(41, 0, 1519751596, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:16</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0293 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0317 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(42, 0, 1519751596, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:16</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0265 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0288 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(43, 0, 1519751600, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0021 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0275 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0296 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(44, 0, 1519751601, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:21</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0029 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0540 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0568 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(45, 0, 1519751608, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:28</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0287 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0311 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(46, 0, 1519751609, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0259 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0281 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(47, 0, 1519751609, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0519 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0544 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(48, 0, 1519751609, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:29</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0266 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0288 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(49, 0, 1519751627, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0027 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0313 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0340 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(50, 0, 1519751627, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0025 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0268 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0293 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(51, 0, 1519751627, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0020 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0260 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0280 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(52, 0, 1519751627, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0277 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0303 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(53, 0, 1519751627, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:47</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0286 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0307 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(54, 0, 1519751636, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:56</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0288 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0312 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6177520751953 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(55, 0, 1519751638, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:58</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0021 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0469 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0489 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(56, 0, 1519751638, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:13:58</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0456 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0481 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(57, 0, 1519751642, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:14:02</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0028 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0302 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0330 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6177520751953 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(58, 0, 1519751761, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:01</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0021 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0332 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0353 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(59, 0, 1519751761, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:01</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0299 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0322 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(60, 0, 1519751761, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:01</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0122 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0258 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0380 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(61, 0, 1519751763, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:03</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0357 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0384 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(62, 0, 1519751764, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:04</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0284 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0310 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(63, 0, 1519751764, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:04</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0064 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0362 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0426 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(64, 0, 1519751765, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-27 20:16:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0037 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0308 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0345 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6173095703125 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(65, 0, 1519811712, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 12:55:12</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0847 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0873 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6180114746094 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(66, 0, 1519813519, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:25:19</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0344 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0366 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(67, 0, 1519813520, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:25:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0337 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0360 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(68, 0, 1519813520, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:25:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0279 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0303 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(69, 0, 1519813520, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:25:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0021 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0275 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0296 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(70, 0, 1519813520, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:25:20</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0020 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0310 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0330 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(71, 0, 1519813567, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:07</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0600 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0622 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(72, 0, 1519813567, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:07</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0309 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0333 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(73, 0, 1519813567, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:07</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0028 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0262 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0290 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(74, 0, 1519813567, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:07</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0268 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0293 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(75, 0, 1519813567, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:07</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0025 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0256 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0282 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(76, 0, 1519813568, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0256 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0278 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(77, 0, 1519813568, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0293 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0317 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(78, 0, 1519813568, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0128 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0272 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0400 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(79, 0, 1519813568, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0026 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0310 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0336 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(80, 0, 1519813568, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:26:08</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0038 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0295 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0333 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6175689697266 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(81, 0, 1519813696, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:28:16</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0019 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0331 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0350 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6180877685547 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(82, 0, 1519813778, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:38</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0272 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0295 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(83, 0, 1519813779, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:39</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0287 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0309 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(84, 0, 1519813779, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:39</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0017 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0274 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0292 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(85, 0, 1519813780, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:40</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0018 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0384 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0402 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(86, 0, 1519813781, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0023 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0423 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0446 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(87, 0, 1519813781, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0455 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0477 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(88, 0, 1519813781, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0022 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0576 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0598 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(89, 0, 1519813781, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:41</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0019 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0250 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0269 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6178436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(90, 0, 1519813791, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:29:51</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0024 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0535 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0559 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(91, 0, 1519813811, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:30:11</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0020 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0279 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0299 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(92, 0, 1519813812, 3, 0, 1, 'Parser / `7testcable.html` is not numeric and may ', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><h3 style=\"color:red\">`7testcable.html` is not numeric and may not be passed to makeUrl()</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:30:12</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0017 s (2 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0352 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0370 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DocumentParser->getDocumentIdentifier</strong>(\'alias\')<br />manager/includes/document.parser.class.inc.php on line 2636</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->urlXParams</strong>(string $var1)<br />vendor/delta/DocumentParser.php on line 126</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>catalog_c->getFields</strong>(1)<br />vendor/delta/DocumentParser.php on line 80</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->makeUrl</strong>(\'7testcable.html\')<br />vendor/delta/catalog/c.php on line 402</td>\n	</tr>\n</table>\n'),
(93, 0, 1519814015, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 31 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:33:35</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0063 s (16 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0482 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0545 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8678436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 31</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(94, 0, 1519814193, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 31 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:36:33</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0094 s (30 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1599 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1693 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8678436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 31</td>\n	</tr>\n</table>\n'),
(95, 0, 1519814194, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 32 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:36:34</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0053 s (17 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0499 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0553 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8678436279297 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 32</td>\n	</tr>\n</table>\n'),
(96, 0, 1519814230, 3, 0, 1, 'Snippet - DLT_CATALOG / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : Missing argument 1 for catalog_c::getFields(), called in C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1832) : eval()\'d code on line 32 and defined</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\c.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>389</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	function getFields ($id){\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>DLT_CATALOG</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[7] <a href=\"http://evolution/catalog/kompyutery-i-periferiya/kabeli/\" target=\"_blank\">Кабели</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-02-28 13:37:10</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0094 s (31 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1262 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1356 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>2.1176300048828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->getFields</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 32</td>\n	</tr>\n</table>\n'),
(97, 0, 1519915874, 3, 0, 1, 'Plugin - test / PHP Parse Error', '<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : syntax error, unexpected \'=\'</div><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\"><br />\n<b>Parse error</b>:  syntax error, unexpected \'=\' in <b>C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1787) : eval()\'d code</b> on line <b>1</b><br />\n</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>PARSING ERROR[4]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\manager\\includes\\document.parser.class.inc.php(1787) : eval()\'d code</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>Plugin</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Plugin</td>\n		<td>test(OnWebPagePrerender)</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/catalog</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[3] <a href=\"http://evolution/catalog/\" target=\"_blank\">Каталог</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-01 17:51:14</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0099 s (27 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1085 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1183 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8677749633789 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->invokeEvent</strong>(\'OnWebPagePrerender\', array $var2)<br />manager/includes/document.parser.class.inc.php on line 866</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalPlugin</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 5317</td>\n	</tr>\n</table>\n'),
(98, 0, 1520845618, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) .htaccess'),
(99, 0, 1520845618, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
(100, 0, 1520852001, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : array_key_exists(): The first argument should be either a string or an integer</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\RQ.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>        if (array_key_exists($feild, self::$P)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-12 13:53:21</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0057 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0533 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0590 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6166458129883 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->updateGoods</strong>(1)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 11</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>RQ::P</strong>()<br />vendor/delta/catalog/cAdmin.php on line 32</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>array_key_exists</strong>(\'\', array $var2)<br />vendor/delta/RQ.php on line 64</td>\n	</tr>\n</table>\n'),
(101, 0, 1520853299, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : array_key_exists(): The first argument should be either a string or an integer</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\RQ.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>        if (array_key_exists($feild, self::$P)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-12 14:14:59</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0040 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0696 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0736 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6166458129883 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->updateGoods</strong>(1)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 11</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>RQ::P</strong>()<br />vendor/delta/catalog/cAdmin.php on line 32</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>array_key_exists</strong>(\'\', array $var2)<br />vendor/delta/RQ.php on line 64</td>\n	</tr>\n</table>\n'),
(102, 0, 1520853302, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : array_key_exists(): The first argument should be either a string or an integer</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\RQ.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>        if (array_key_exists($feild, self::$P)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-12 14:15:02</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0067 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0518 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0585 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6166458129883 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->updateGoods</strong>(1)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 11</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>RQ::P</strong>()<br />vendor/delta/catalog/cAdmin.php on line 32</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>array_key_exists</strong>(\'\', array $var2)<br />vendor/delta/RQ.php on line 64</td>\n	</tr>\n</table>\n'),
(103, 0, 1521023121, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : array_key_exists(): The first argument should be either a string or an integer</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\RQ.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>64</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>        if (array_key_exists($feild, self::$P)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 13:25:21</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0052 s (15 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.1072 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.1124 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.6166534423828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->updateGoods</strong>(1)<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 11</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>RQ::P</strong>()<br />vendor/delta/catalog/cAdmin.php on line 32</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>array_key_exists</strong>(\'\', array $var2)<br />vendor/delta/RQ.php on line 64</td>\n	</tr>\n</table>\n'),
(104, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_03ebfa538265d2062cfd6d21dcd709f8.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0044 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0635 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0679 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n'),
(105, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_d8bcb732baa40d9c02f45839ddf7be12.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0069 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0718 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0787 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n'),
(106, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_1ab9025b53156ccf768b4399accd7993.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0064 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0568 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0632 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n');
INSERT INTO `delta_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(107, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_db74d2017d1e7a0c4e57ab1ce35b9d3f.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0035 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0492 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0527 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n'),
(108, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_dc6acde2b0ae942c60e55601e7733b21.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0040 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0640 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0680 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n'),
(109, 0, 1521044125, 3, 0, 1, 'Snippet - admAJX / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style=\"color:red\">&laquo; Evo Parse Error &raquo;</h2><div style=\"font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;\">Error : move_uploaded_file(C:/OSPanel/domains/Evolution/upload/1521044125_2e50c652a6dd38702214893bfce61919.jpg): failed to open stream: No such file or directory</div>\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>File</td>\n		<td>C:\\OSPanel\\domains\\Evolution\\vendor\\delta\\catalog\\cAdmin.php</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Line</td>\n		<td>70</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Source</td>\n		<td>	           if (move_uploaded_file($_FILES[0][\'tmp_name\'], $_SERVER[\'DOCUMENT_ROOT\'].\'/upload/\'.$newfileName)) {\r\n</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current Snippet</td>\n		<td>admAJX</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://evolution/ajax/adm/?event=uploadimages</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Resource</td>\n		<td>[18] <a href=\"http://evolution/ajax/adm/\" target=\"_blank\">adm</a></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Referer</td>\n		<td>http://evolution/catalog/kompyutery-i-periferiya/kabeli/testcable.html</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Current time</td>\n		<td>2018-03-14 19:15:25</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0037 s (14 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>0.0514 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>0.0551 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.8650741577148 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->executeParser</strong>()<br />index.php on line 129</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2737</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2861</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->parseDocumentSource</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 805</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippets</strong>(\'[[admAJX]]\')<br />manager/includes/document.parser.class.inc.php on line 2587</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DeltaDocumentParser->_get_snip_result</strong>(\'admAJX\')<br />manager/includes/document.parser.class.inc.php on line 1895</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>DeltaDocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1984</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1832</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>catalog_c->uploadimages</strong>()<br />manager/includes/document.parser.class.inc.php(1832) : eval()\'d code on line 25</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>move_uploaded_file</strong>(string $var1, string $var2)<br />vendor/delta/catalog/cAdmin.php on line 70</td>\n	</tr>\n</table>\n');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_manager_log`
--

CREATE TABLE `delta_manager_log` (
  `id` int(10) NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';

--
-- Дамп данных таблицы `delta_manager_log`
--

INSERT INTO `delta_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1515157080, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(2, 1515157081, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(3, 1515158845, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(4, 1515159010, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(5, 1515159011, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(6, 1515159029, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(7, 1515159033, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(8, 1515159221, 1, 'admin', 79, '-', 'head', 'Saving Chunk (HTML Snippet)'),
(9, 1515159221, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(10, 1515159313, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(11, 1515159313, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(12, 1515159323, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(13, 1515159504, 1, 'admin', 79, '-', 'header', 'Saving Chunk (HTML Snippet)'),
(14, 1515159504, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(15, 1515159507, 1, 'admin', 97, '3', 'header Копия', 'Duplicate Chunk (HTML Snippet)'),
(16, 1515159507, 1, 'admin', 78, '4', 'header Копия', 'Editing Chunk (HTML Snippet)'),
(17, 1515159648, 1, 'admin', 79, '4', 'header Копия', 'Saving Chunk (HTML Snippet)'),
(18, 1515159648, 1, 'admin', 78, '4', 'header Копия', 'Editing Chunk (HTML Snippet)'),
(19, 1515159657, 1, 'admin', 79, '4', 'header Копия', 'Saving Chunk (HTML Snippet)'),
(20, 1515159657, 1, 'admin', 78, '4', 'header Копия', 'Editing Chunk (HTML Snippet)'),
(21, 1515159684, 1, 'admin', 79, '4', 'topmenu', 'Saving Chunk (HTML Snippet)'),
(22, 1515159684, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(23, 1515159705, 1, 'admin', 79, '4', 'topmenu', 'Saving Chunk (HTML Snippet)'),
(24, 1515159705, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(25, 1515159728, 1, 'admin', 97, '4', 'topmenu Копия', 'Duplicate Chunk (HTML Snippet)'),
(26, 1515159728, 1, 'admin', 78, '5', 'topmenu Копия', 'Editing Chunk (HTML Snippet)'),
(27, 1515159858, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(28, 1515159858, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(29, 1515159889, 1, 'admin', 79, '5', 'slider', 'Saving Chunk (HTML Snippet)'),
(30, 1515159889, 1, 'admin', 78, '5', 'slider', 'Editing Chunk (HTML Snippet)'),
(31, 1515159894, 1, 'admin', 97, '5', 'slider Копия', 'Duplicate Chunk (HTML Snippet)'),
(32, 1515159894, 1, 'admin', 78, '6', 'slider Копия', 'Editing Chunk (HTML Snippet)'),
(33, 1515160127, 1, 'admin', 79, '6', 'scripts', 'Saving Chunk (HTML Snippet)'),
(34, 1515160127, 1, 'admin', 78, '6', 'scripts', 'Editing Chunk (HTML Snippet)'),
(35, 1515160133, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(36, 1515160136, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(37, 1515160510, 1, 'admin', 78, '5', 'slider', 'Editing Chunk (HTML Snippet)'),
(38, 1515160644, 1, 'admin', 79, '5', 'slider', 'Saving Chunk (HTML Snippet)'),
(39, 1515160644, 1, 'admin', 78, '5', 'slider', 'Editing Chunk (HTML Snippet)'),
(40, 1515161401, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(41, 1515161404, 1, 'admin', 79, '3', 'header', 'Saving Chunk (HTML Snippet)'),
(42, 1515161404, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(43, 1515161426, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(44, 1515161690, 1, 'admin', 79, '4', 'topmenu', 'Saving Chunk (HTML Snippet)'),
(45, 1515161690, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(46, 1515161692, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(47, 1515161692, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(48, 1515161702, 1, 'admin', 79, '3', 'header', 'Saving Chunk (HTML Snippet)'),
(49, 1515161702, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(50, 1515161748, 1, 'admin', 79, '3', 'header', 'Saving Chunk (HTML Snippet)'),
(51, 1515161748, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(52, 1515161834, 1, 'admin', 79, '3', 'header', 'Saving Chunk (HTML Snippet)'),
(53, 1515161834, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(54, 1515162164, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(55, 1515162174, 1, 'admin', 79, '4', 'topmenu', 'Saving Chunk (HTML Snippet)'),
(56, 1515162174, 1, 'admin', 78, '4', 'topmenu', 'Editing Chunk (HTML Snippet)'),
(57, 1515162466, 1, 'admin', 97, '4', 'topmenu Копия', 'Duplicate Chunk (HTML Snippet)'),
(58, 1515162466, 1, 'admin', 78, '7', 'topmenu Копия', 'Editing Chunk (HTML Snippet)'),
(59, 1515162478, 1, 'admin', 79, '7', 'footer', 'Saving Chunk (HTML Snippet)'),
(60, 1515162478, 1, 'admin', 78, '7', 'footer', 'Editing Chunk (HTML Snippet)'),
(61, 1515162579, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(62, 1515162579, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(63, 1515162593, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(64, 1515162593, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(65, 1515162711, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(66, 1515163110, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(67, 1515163244, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(68, 1515163244, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(69, 1515163324, 1, 'admin', 24, '-', 'DLT_CATALOG', 'Saving Snippet'),
(70, 1515163324, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(71, 1515163357, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(72, 1515163358, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(73, 1515164106, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(74, 1515164106, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(75, 1515164249, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(76, 1515164382, 1, 'admin', 79, '-', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(77, 1515164382, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(78, 1515164394, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(79, 1515164432, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(80, 1515164432, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(81, 1515164444, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(82, 1515164444, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(83, 1515164468, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(84, 1515164468, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(85, 1515164908, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(86, 1515164908, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(87, 1515164913, 1, 'admin', 79, '8', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(88, 1515164913, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(89, 1515164926, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(90, 1515164926, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(91, 1515165020, 1, 'admin', 79, '8', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(92, 1515165021, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(93, 1515165101, 1, 'admin', 79, '8', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(94, 1515165101, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(95, 1515165315, 1, 'admin', 79, '8', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(96, 1515165315, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(97, 1515166058, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(98, 1515166058, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(99, 1515166117, 1, 'admin', 79, '8', 'test_cat', 'Saving Chunk (HTML Snippet)'),
(100, 1515166117, 1, 'admin', 78, '8', 'test_cat', 'Editing Chunk (HTML Snippet)'),
(101, 1515166445, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(102, 1515166445, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(103, 1515166465, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(104, 1515166465, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(105, 1515166814, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(106, 1515166814, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(107, 1515166958, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(108, 1515166958, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(109, 1515167041, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(110, 1515167041, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(111, 1515167161, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(112, 1515167161, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(113, 1515167174, 1, 'admin', 97, '8', 'test_cat Копия', 'Duplicate Chunk (HTML Snippet)'),
(114, 1515167174, 1, 'admin', 78, '9', 'test_cat Копия', 'Editing Chunk (HTML Snippet)'),
(115, 1515167177, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(116, 1515167177, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(117, 1515167226, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(118, 1515167226, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(119, 1515167228, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(120, 1515167311, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(121, 1515167311, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(122, 1515167749, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(123, 1515167749, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(124, 1515167792, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(125, 1515167792, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(126, 1515167822, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(127, 1515167822, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(128, 1515167871, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(129, 1515167871, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(130, 1515487867, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(131, 1515487895, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(132, 1515488327, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(133, 1515489311, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(134, 1515489311, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(135, 1515489591, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(136, 1515489591, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(137, 1515489883, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(138, 1515489883, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(139, 1515489922, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(140, 1515489922, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(141, 1515489960, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(142, 1515489960, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(143, 1515490876, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(144, 1515490876, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(145, 1515490971, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(146, 1515490971, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(147, 1515491009, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(148, 1515491009, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(149, 1515491018, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(150, 1515491018, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(151, 1515491637, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(152, 1515491637, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(153, 1515491661, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(154, 1515491661, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(155, 1515491710, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(156, 1515491710, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(157, 1517584488, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(158, 1517584501, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(159, 1517584955, 1, 'admin', 101, '-', 'Новый плагин', 'Create new plugin'),
(160, 1517585165, 1, 'admin', 103, '-', 'syncSnippets', 'Saving plugin'),
(161, 1517585166, 1, 'admin', 76, '-', '-', 'Element management'),
(162, 1517585168, 1, 'admin', 102, '12', 'syncSnippets', 'Edit plugin'),
(163, 1517585499, 1, 'admin', 103, '12', 'syncSnippets', 'Saving plugin'),
(164, 1517585499, 1, 'admin', 76, '-', '-', 'Element management'),
(165, 1517585516, 1, 'admin', 102, '12', 'syncSnippets', 'Edit plugin'),
(166, 1517585532, 1, 'admin', 103, '12', 'syncSnippets', 'Saving plugin'),
(167, 1517585532, 1, 'admin', 102, '12', 'syncSnippets', 'Edit plugin'),
(168, 1517839227, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(169, 1517839314, 1, 'admin', 27, '6', 'Телевизоры и медиа', 'Editing resource'),
(170, 1517843556, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(171, 1517843652, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(172, 1517843652, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(173, 1517846789, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(174, 1517846789, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(175, 1517846914, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(176, 1517846914, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(177, 1517847541, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(178, 1517847581, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(179, 1517847581, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(180, 1517847590, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(181, 1517847590, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(182, 1517848196, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(183, 1518191900, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(184, 1518191912, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(185, 1518191916, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(186, 1518191921, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(187, 1518191922, 1, 'admin', 76, '-', '-', 'Element management'),
(188, 1518192102, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(189, 1518192114, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(190, 1518192117, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(191, 1518192117, 1, 'admin', 76, '-', '-', 'Element management'),
(192, 1518192189, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(193, 1518192212, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(194, 1518192238, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(195, 1518193056, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(196, 1518193108, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(197, 1518193108, 1, 'admin', 76, '-', '-', 'Element management'),
(198, 1518193111, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(199, 1518193113, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(200, 1518193113, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(201, 1518193384, 1, 'admin', 79, '9', 'test_good', 'Saving Chunk (HTML Snippet)'),
(202, 1518193384, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(203, 1519637863, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(204, 1519643835, 1, 'admin', 17, '-', '-', 'Editing settings'),
(205, 1519643845, 1, 'admin', 30, '-', '-', 'Saving settings'),
(206, 1519650446, 1, 'admin', 102, '12', 'syncSnippets', 'Edit plugin'),
(207, 1519751087, 1, 'admin', 76, '-', '-', 'Element management'),
(208, 1519751090, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(209, 1519751105, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(210, 1519751106, 1, 'admin', 76, '-', '-', 'Element management'),
(211, 1519751109, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(212, 1519751113, 1, 'admin', 97, '9', 'test_good Копия', 'Duplicate Chunk (HTML Snippet)'),
(213, 1519751113, 1, 'admin', 78, '10', 'test_good Копия', 'Editing Chunk (HTML Snippet)'),
(214, 1519751121, 1, 'admin', 79, '10', 'test_card', 'Saving Chunk (HTML Snippet)'),
(215, 1519751122, 1, 'admin', 76, '-', '-', 'Element management'),
(216, 1519751161, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(217, 1519751177, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(218, 1519751177, 1, 'admin', 76, '-', '-', 'Element management'),
(219, 1519751182, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(220, 1519751184, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(221, 1519751184, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(222, 1519813746, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(223, 1519813777, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(224, 1519813777, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(225, 1519813789, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(226, 1519813789, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(227, 1519813810, 1, 'admin', 24, '10', 'DLT_CATALOG', 'Saving Snippet'),
(228, 1519813810, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(229, 1519831362, 1, 'admin', 22, '10', 'DLT_CATALOG', 'Editing Snippet'),
(230, 1519831366, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(231, 1519831930, 1, 'admin', 79, '-', '{{edit_product}}', 'Saving Chunk (HTML Snippet)'),
(232, 1519831930, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(233, 1519832057, 1, 'admin', 79, '11', '{{edit_product}}', 'Saving Chunk (HTML Snippet)'),
(234, 1519832057, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(235, 1519832095, 1, 'admin', 79, '11', '{{edit_product}}', 'Saving Chunk (HTML Snippet)'),
(236, 1519832095, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(237, 1519832119, 1, 'admin', 79, '11', '{{edit_product}}', 'Saving Chunk (HTML Snippet)'),
(238, 1519832119, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(239, 1519832920, 1, 'admin', 79, '11', '{{edit_product}}', 'Saving Chunk (HTML Snippet)'),
(240, 1519832920, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(241, 1519832926, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(242, 1519832939, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(243, 1519832939, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(244, 1519832959, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(245, 1519832959, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(246, 1519832969, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(247, 1519832972, 1, 'admin', 78, '11', '{{edit_product}}', 'Editing Chunk (HTML Snippet)'),
(248, 1519832978, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(249, 1519832978, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(250, 1519832981, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(251, 1519832981, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(252, 1519833027, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(253, 1519833027, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(254, 1519833040, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(255, 1519833040, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(256, 1519833073, 1, 'admin', 78, '6', 'scripts', 'Editing Chunk (HTML Snippet)'),
(257, 1519833082, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(258, 1519833106, 1, 'admin', 78, '3', 'header', 'Editing Chunk (HTML Snippet)'),
(259, 1519833108, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(260, 1519833128, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(261, 1519833129, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(262, 1519833331, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(263, 1519833331, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(264, 1519834005, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(265, 1519834005, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(266, 1519834705, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(267, 1519834705, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(268, 1519835963, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(269, 1519835964, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(270, 1519898272, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(271, 1519899314, 1, 'admin', 78, '2', 'head', 'Editing Chunk (HTML Snippet)'),
(272, 1519905748, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(273, 1519906376, 1, 'admin', 27, '8', 'Компьютеры', 'Editing resource'),
(274, 1519906406, 1, 'admin', 27, '7', 'Кабели', 'Editing resource'),
(275, 1519906438, 1, 'admin', 27, '7', 'Кабели', 'Editing resource'),
(276, 1519906463, 1, 'admin', 27, '7', 'Кабели', 'Editing resource'),
(277, 1519906507, 1, 'admin', 27, '7', 'Кабели', 'Editing resource'),
(278, 1519906515, 1, 'admin', 27, '7', 'Кабели', 'Editing resource'),
(279, 1519906780, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(280, 1519906780, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(281, 1519906840, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(282, 1519906841, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(283, 1519906895, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(284, 1519906895, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(285, 1519906918, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(286, 1519906918, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(287, 1519907091, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(288, 1519907091, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(289, 1519907105, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(290, 1519907105, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(291, 1519907205, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(292, 1519907205, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(293, 1519907270, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(294, 1519907270, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(295, 1519907287, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(296, 1519907287, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(297, 1519907407, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(298, 1519907407, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(299, 1519909896, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(300, 1519909896, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(301, 1519909943, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(302, 1519909943, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(303, 1519909980, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(304, 1519909980, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(305, 1519912397, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(306, 1519912414, 1, 'admin', 5, '-', 'System', 'Saving resource'),
(307, 1519912414, 1, 'admin', 27, '16', 'System', 'Editing resource'),
(308, 1519912418, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(309, 1519912425, 1, 'admin', 5, '-', 'ajax', 'Saving resource'),
(310, 1519912425, 1, 'admin', 27, '17', 'ajax', 'Editing resource'),
(311, 1519912429, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(312, 1519912439, 1, 'admin', 5, '-', 'adm', 'Saving resource'),
(313, 1519912439, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(314, 1519912442, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(315, 1519912452, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(316, 1519912454, 1, 'admin', 5, '18', 'adm', 'Saving resource'),
(317, 1519912454, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(318, 1519912457, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(319, 1519912483, 1, 'admin', 5, '18', 'adm', 'Saving resource'),
(320, 1519912483, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(321, 1519912489, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(322, 1519912554, 1, 'admin', 24, '-', 'admAJX', 'Saving Snippet'),
(323, 1519912555, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(324, 1519912643, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(325, 1519912651, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(326, 1519915236, 1, 'admin', 101, '-', 'Новый плагин', 'Create new plugin'),
(327, 1519915278, 1, 'admin', 103, '-', 'ajxControl', 'Saving plugin'),
(328, 1519915290, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(329, 1519915314, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(330, 1519915314, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(331, 1519915508, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(332, 1519915508, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(333, 1519915591, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(334, 1519915591, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(335, 1519915672, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(336, 1519915672, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(337, 1519915708, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(338, 1519915708, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(339, 1519915803, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(340, 1519915803, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(341, 1519915834, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(342, 1519915835, 1, 'admin', 102, '13', 'ajxControl', 'Edit plugin'),
(343, 1519915859, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(344, 1519915860, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(345, 1519915885, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(346, 1519915885, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(347, 1519916408, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(348, 1519916408, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(349, 1519916486, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(350, 1519916486, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(351, 1519917288, 1, 'admin', 103, '11', 'test', 'Saving plugin'),
(352, 1519917289, 1, 'admin', 102, '11', 'test', 'Edit plugin'),
(353, 1519917340, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(354, 1519917424, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(355, 1519917424, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(356, 1519917437, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(357, 1519917437, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(358, 1520005569, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(359, 1520005583, 1, 'admin', 79, '11', 'edit_product', 'Saving Chunk (HTML Snippet)'),
(360, 1520005583, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(361, 1520005722, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(362, 1520005726, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(363, 1520005855, 1, 'admin', 78, '11', 'edit_product', 'Editing Chunk (HTML Snippet)'),
(364, 1520005894, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(365, 1520005894, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(366, 1520005902, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(367, 1520005921, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(368, 1520005990, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(369, 1520005995, 1, 'admin', 20, '4', 'Каталог', 'Saving template'),
(370, 1520005995, 1, 'admin', 16, '4', 'Каталог', 'Editing template'),
(371, 1520006241, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(372, 1520006241, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(373, 1520009400, 1, 'admin', 17, '-', '-', 'Editing settings'),
(374, 1520009408, 1, 'admin', 30, '-', '-', 'Saving settings'),
(375, 1520845570, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(376, 1520845572, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(377, 1520845618, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(378, 1520845638, 1, 'admin', 27, '17', 'ajax', 'Editing resource'),
(379, 1520845643, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(380, 1520845645, 1, 'admin', 27, '17', 'ajax', 'Editing resource'),
(381, 1520845649, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(382, 1520845650, 1, 'admin', 27, '18', 'adm', 'Editing resource'),
(383, 1520845663, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(384, 1520846686, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(385, 1520846690, 1, 'admin', 102, '12', 'syncSnippets', 'Edit plugin'),
(386, 1520846692, 1, 'admin', 102, '13', 'ajxControl', 'Edit plugin'),
(387, 1520847837, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(388, 1520847838, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(389, 1520847839, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(390, 1520847839, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(391, 1520847912, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(392, 1520847912, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(393, 1520847989, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(394, 1520847989, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(395, 1520848055, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(396, 1520848055, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(397, 1520848068, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(398, 1520848068, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(399, 1520848139, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(400, 1520848139, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(401, 1520848510, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(402, 1520848527, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(403, 1520848527, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(404, 1520849325, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(405, 1520849325, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(406, 1520850105, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(407, 1520850105, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(408, 1520851720, 1, 'admin', 24, '11', 'admAJX', 'Saving Snippet'),
(409, 1520851720, 1, 'admin', 22, '11', 'admAJX', 'Editing Snippet'),
(410, 1521031560, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(411, 1521031578, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(412, 1521031578, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(413, 1521033653, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(414, 1521033653, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(415, 1521034440, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(416, 1521034445, 1, 'admin', 78, '10', 'test_card', 'Editing Chunk (HTML Snippet)'),
(417, 1521034447, 1, 'admin', 78, '9', 'test_good', 'Editing Chunk (HTML Snippet)'),
(418, 1521034508, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(419, 1521034508, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(420, 1521034740, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(421, 1521034740, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(422, 1521034805, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(423, 1521034806, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(424, 1521034883, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(425, 1521034883, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(426, 1521035217, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(427, 1521035218, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(428, 1521035228, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(429, 1521035231, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(430, 1521035232, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(431, 1521035537, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(432, 1521035537, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(433, 1521036660, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(434, 1521036660, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(435, 1521037705, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(436, 1521037705, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(437, 1521037829, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(438, 1521037829, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(439, 1521039574, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(440, 1521039574, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(441, 1521045967, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(442, 1521045967, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(443, 1521045990, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(444, 1521045990, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(445, 1521045997, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(446, 1521045997, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(447, 1521046094, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(448, 1521046094, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)'),
(449, 1521046259, 1, 'admin', 79, '11', 'ProductRedactor', 'Saving Chunk (HTML Snippet)'),
(450, 1521046259, 1, 'admin', 78, '11', 'ProductRedactor', 'Editing Chunk (HTML Snippet)');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_manager_users`
--

CREATE TABLE `delta_manager_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';

--
-- Дамп данных таблицы `delta_manager_users`
--

INSERT INTO `delta_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$P$BEHUuj6XgII70O9nd4n11W6r3WSg541');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_membergroup_access`
--

CREATE TABLE `delta_membergroup_access` (
  `id` int(10) NOT NULL,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_membergroup_names`
--

CREATE TABLE `delta_membergroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_member_groups`
--

CREATE TABLE `delta_member_groups` (
  `id` int(10) NOT NULL,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_content`
--

CREATE TABLE `delta_site_content` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';

--
-- Дамп данных таблицы `delta_site_content`
--

INSERT INTO `delta_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Evolution CMS Install Success', 'Welcome to the EVO Content Management System', '', 'minimal-base', '', 1, 0, 0, 0, 0, '', '<h3>Install Successful!</h3>\r\n<p>You have successfully installed Evolution CMS.</p>\r\n\r\n<h3>Getting Help</h3>\r\n<p>The <a href=\"http://evo.im/\" target=\"_blank\">EVO Community</a> provides a great starting point to learn all things Evolution CMS, or you can also <a href=\"http://evo.im/\">see some great learning resources</a> (books, tutorials, blogs and screencasts).</p>\r\n<p>Welcome to EVO!</p>\r\n', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1130304927, 0, 0, 0, 1130304721, 1, 'Base Install', 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'тест', '', '', 'test', '', 1, 0, 0, 0, 0, '', '', 1, 3, 1, 1, 1, 1, 1513257336, 1, 1513257345, 0, 0, 0, 1513257336, 1, '', 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'Каталог', '', '', 'catalog', '', 1, 0, 0, 0, 1, '', '', 1, 4, 2, 1, 1, 1, 1515066843, 1, 1515080044, 0, 0, 0, 1515066843, 1, '', 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Компьютеры и периферия', '', '', 'kompyutery-i-periferiya', '', 1, 0, 0, 3, 1, '', '', 1, 4, 0, 1, 1, 1, 1515066852, 1, 1515080049, 0, 0, 0, 1515066852, 1, '', 0, 0, 0, 0, 0, 1),
(5, 'document', 'text/html', 'Комплектующие для ПК', '', '', 'komplektuyushhie-dlya-pk', '', 1, 0, 0, 3, 1, '', '', 1, 4, 1, 1, 1, 1, 1515066875, 1, 1515069413, 0, 0, 0, 1515066875, 1, '', 0, 0, 0, 0, 0, 1),
(6, 'document', 'text/html', 'Телевизоры и медиа', '', '', 'televizory-i-media', '', 1, 0, 0, 3, 1, '', '', 1, 4, 2, 1, 1, 1, 1515066901, 1, 1515066901, 0, 0, 0, 1515066901, 1, '', 0, 0, 0, 0, 0, 1),
(7, 'document', 'text/html', 'Кабели', '', '', 'kabeli', '', 1, 0, 0, 4, 1, '', '', 1, 4, 0, 1, 1, 1, 1515066919, 1, 1515069236, 0, 0, 0, 1515066919, 1, '', 0, 0, 0, 0, 0, 1),
(8, 'document', 'text/html', 'Компьютеры', '', '', 'kompyutery', '', 1, 0, 0, 4, 1, '', '', 1, 4, 1, 1, 1, 1, 1515066934, 1, 1515069336, 0, 0, 0, 1515066934, 1, '', 0, 0, 0, 0, 0, 1),
(9, 'document', 'text/html', 'Мониторы', '', '', 'monitory', '', 1, 0, 0, 4, 1, '', '', 1, 4, 2, 1, 1, 1, 1515066945, 1, 1515069344, 0, 0, 0, 1515066945, 1, '', 0, 0, 0, 0, 0, 1),
(10, 'document', 'text/html', 'Процессоры', '', '', 'processory', '', 1, 0, 0, 5, 1, '', '', 1, 4, 0, 1, 1, 1, 1515066969, 1, 1515067000, 0, 0, 0, 1515066969, 1, '', 0, 0, 0, 0, 0, 1),
(11, 'document', 'text/html', 'Материнские платы', '', '', 'materinskie-platy', '', 1, 0, 0, 5, 1, '', '', 1, 4, 1, 1, 1, 1, 1515066981, 1, 1515066981, 0, 0, 0, 1515066981, 1, '', 0, 0, 0, 0, 0, 1),
(12, 'document', 'text/html', 'Видеокарты', '', '', 'videokarty', '', 1, 0, 0, 5, 1, '', '', 1, 4, 2, 1, 1, 1, 1515066993, 1, 1515066993, 0, 0, 0, 1515066993, 1, '', 0, 0, 0, 0, 0, 1),
(13, 'document', 'text/html', 'Телевизоры', '', '', 'televizory', '', 1, 0, 0, 6, 1, '', '', 1, 4, 0, 1, 1, 1, 1515067018, 1, 1515067018, 0, 0, 0, 1515067018, 1, '', 0, 0, 0, 0, 0, 1),
(14, 'document', 'text/html', 'Проекторы', '', '', 'proektory', '', 1, 0, 0, 6, 1, '', '', 1, 4, 1, 1, 1, 1, 1515067030, 1, 1515067030, 0, 0, 0, 1515067030, 1, '', 0, 0, 0, 0, 0, 1),
(15, 'document', 'text/html', 'Спутниковое оборудование', '', '', 'sputnikovoe-oborudovanie', '', 1, 0, 0, 6, 1, '', '', 1, 4, 2, 1, 1, 1, 1515067049, 1, 1515067049, 0, 0, 0, 1515067049, 1, '', 0, 0, 0, 0, 0, 1),
(16, 'document', 'text/html', 'System', '', '', 'system', '', 1, 0, 0, 0, 1, '', '', 1, 3, 3, 1, 1, 1, 1519912414, 1, 1519912414, 0, 0, 0, 1519912414, 1, '', 0, 0, 0, 0, 1, 0),
(17, 'document', 'text/html', 'ajax', '', '', 'ajax', '', 1, 0, 0, 16, 1, '', '', 1, 3, 0, 1, 1, 1, 1519912425, 1, 1519912425, 0, 0, 0, 1519912425, 1, '', 0, 0, 0, 0, 0, 1),
(18, 'document', 'text/html', 'adm', '', '', 'adm', '', 1, 0, 0, 17, 1, '', '[!admAJX!]', 1, 0, 0, 1, 1, 1, 1519912438, 1, 1519912483, 0, 0, 0, 1519912438, 1, '', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_htmlsnippets`
--

CREATE TABLE `delta_site_htmlsnippets` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';

--
-- Дамп данных таблицы `delta_site_htmlsnippets`
--

INSERT INTO `delta_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 1, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\r\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n}\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\nmm_createTab(\'SEO\', \'seo\', \'\', \'\', \'\', \'\');\r\nmm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\r\nmm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n\r\n\r\n//mm_createTab(\'Images\', \'photos\', \'\', \'\', \'\', \'850\');\r\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\r\n\r\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\r\n\r\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\r\n\r\n//mm_hideTabs(\'settings, access\', \'2\');\r\n', 0, 0, 0, 0),
(2, 'head', '', 2, 'none', 0, 0, '<head>\r\n    <!--[if lt IE 9]!><script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->\r\n    <!--[if lt IE 9]>\r\n        <script src=\"http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js\"></script>\r\n    <![endif]-->\r\n    <base href=\"[(site_url)]\" />\r\n	<link rel=\"canonical\" href=\"[(site_url)][!if? &is=`[*id*]:eq:1` &then=`` &else=`[~[*id*]~]` !]\" />\r\n	\r\n    <title>[*pagetitle*]</title>\r\n    <meta name=\"description\" lang=\"ru\" content=\"[*descr*]\" />\r\n    <meta name=\"keywords\" lang=\"ru\" content=\"[*keywords*]\" />\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <link rel=\"icon\" href=\"favicon.ico\" type=\"image/x-icon\" />\r\n    <link rel=\"shortcut icon\" href=\"favicon.ico\" type=\"image/x-icon\" />\r\n	\r\n	<!-- Стили, скрипты и шрифты пока пусть будут тут -->\r\n	<link href=\"https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700&amp;subset=cyrillic\" rel=\"stylesheet\">\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"template/css/style.css\" />\r\n    <!-- <link rel=\"stylesheet\" type=\"text/css\" href=\"template/css/responsive.css\" /> -->\r\n	<!-- <link rel=\"stylesheet\" type=\"text/css\" href=\"template/css/catalogfilter.css\" /> -->\r\n	<!-- <link rel=\"stylesheet\" type=\"text/css\" href=\"template/css/jquery.fancybox.min.css\" /> -->\r\n	<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js\"></script>\r\n</head>', 0, 1515159221, 1515159221, 0),
(3, 'header', '', 2, 'none', 0, 0, ' <header>\r\n 	<div class=\"wrapper\">\r\n 		<img src=\"\" alt=\"\" class=\"logo\" alt=\"LOGO\" title=\"LOGO\">\r\n		<div class=\"contacts\">CONTACTS</div>\r\n		<div class=\"clr\"></div>\r\n 	</div>\r\n </header>', 0, 1515159504, 1515161834, 0),
(4, 'topmenu', '', 2, 'none', 0, 0, '<div class=\"topmenu\">\r\n	<div class=\"wrapper\">\r\n		<nav>\r\n			<ul>\r\n				<li><a href=\"#\">LINK</a></li>\r\n				<li><a href=\"#\">LINK</a></li>\r\n				<li><a href=\"#\">LINK</a></li>\r\n				<li><a href=\"#\">LINK</a></li>\r\n				<li><a href=\"#\">LINK</a></li>\r\n			</ul>\r\n		</nav>\r\n		<div class=\"search\">SEARCH</div>\r\n		<div class=\"clr\"></div>\r\n	</div>\r\n</div>', 0, 0, 1515162174, 0),
(5, 'slider', '', 2, 'none', 0, 0, '<section class=\"slider\">\r\n    <ul class=\"bxslider\">\r\n      	<li style=\"background-image: url(template/image/pic1.jpg)\">\r\n      	    <div class=\"sliderTit\">Lorem ipsum\r\n				<span class=\"sliderSubT\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem voluptatum fugit quod consectetur voluptate dolores.</span>\r\n			</div>\r\n      	</li>\r\n		\r\n		<li style=\"background-image: url(template/image/pic2.jpg)\">\r\n      	    <div class=\"sliderTit\">Lorem ipsum\r\n				<span class=\"sliderSubT\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem voluptatum fugit quod consectetur voluptate dolores.</span>\r\n			</div>\r\n      	</li>\r\n\r\n		<li style=\"background-image: url(template/image/pic3.jpg)\">\r\n      	    <div class=\"sliderTit\">Lorem ipsum\r\n				<span class=\"sliderSubT\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem voluptatum fugit quod consectetur voluptate dolores.</span>\r\n			</div>\r\n      	</li>\r\n		\r\n		<li style=\"background-image: url(template/image/pic4.jpg)\">\r\n      	    <div class=\"sliderTit\">Lorem ipsum\r\n				<span class=\"sliderSubT\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem voluptatum fugit quod consectetur voluptate dolores.</span>\r\n			</div>\r\n      	</li>\r\n		\r\n    </ul>\r\n</section>', 0, 0, 1515160644, 0),
(6, 'scripts', '', 2, 'none', 0, 0, '<script src=\"template/js/common.js\"></script>\r\n<script src=\"template/js/jquery.bxslider.js\"></script>', 0, 0, 1515160127, 0),
(7, 'footer', '', 2, 'none', 0, 0, '<footer>\r\n	FOOTER\r\n</footer>', 0, 0, 1515162478, 0),
(8, 'test_cat', '', 2, 'none', 5, 0, '<div class=\"item\">\r\n	<div class=\"image\">[+px.image+]</div>\r\n	<div class=\"title\">[+px.pagetitle+]</div>\r\n	<!-- <div class=\"link\">[~[+px.id+]F~]</div> -->\r\n	<div class=\"link\"><a href=\"[~[+px.id+]~]\">[~[+px.id+]~]</a></div>\r\n</div>\r\n', 0, 1515164382, 1515166117, 0),
(9, 'test_good', '', 2, 'none', 5, 0, '<div class=\"item\">\r\n	<div class=\"image\">[+px.istCardPage+]</div>\r\n	<div class=\"image\">[+px.id_product+]</div>\r\n	<div class=\"title\">[+px.name+]</div>\r\n	<!-- <div class=\"link\">[~[+px.id+]F~]</div> -->\r\n	<div class=\"link\"><a href=\"[+px.path+]\">[+px.path+]</a></div>\r\n</div>\r\n', 0, 0, 1518193384, 0),
(10, 'test_card', '', 2, 'none', 5, 0, '<div class=\"item\">\r\n	<div class=\"image\">[+px.istCardPage+]</div>\r\n	<div class=\"image\">[+px.id_product+]</div>\r\n	<div class=\"title\">[+px.name+]</div>\r\n	<!-- <div class=\"link\">[~[+px.id+]F~]</div> -->\r\n	<div class=\"link\"><a href=\"[+px.path+]\">[+px.path+]</a></div>\r\n</div>\r\n', 0, 0, 1519751121, 0),
(11, 'ProductRedactor', '', 2, 'none', 6, 0, '<link rel=\"stylesheet\" type=\"text/css\" href=\"template/css/deltaEdits.css\" />\r\n<script src=\"template/js/deltaEdits.js\"></script>\r\n<script src=\"template/js/Sortable.min.js\"></script>\r\n\r\n<script type=\"text/javascript\" src=\"assets/plugins/tinymce4/tinymce/jquery.tinymce.min.js\"></script>\r\n<script type=\"text/javascript\" src=\"assets/plugins/tinymce4/tinymce/tinymce.min.js\"></script>\r\n\r\n<div class=\"deltaEPCont\" id=\"viEditForm\">Добавить</div>\r\n\r\n<div class=\"deltaEditProduct\" id=\"deltaEditProduct\" data-productid=\"[+px.idPage+]\">\r\n	<div class=\"tabs\">\r\n        <div class=\"tab active\" data-tabid=\"1\" data-hash=\"main\">Основные</div>\r\n		<div class=\"tab\" data-tabid=\"2\" data-hash=\"photo\">Фотографии</div>\r\n        <div class=\"tab\" data-tabid=\"3\" data-hash=\"props\">Свойства</div>\r\n        <div class=\"tab\" data-tabid=\"4\" data-hash=\"prices\">Цены</div>\r\n		<div class=\"tab\" data-tabid=\"5\" data-hash=\"seo\">SEO</div>\r\n    </div>\r\n	\r\n	\r\n	<div class=\"tabContent\">\r\n		\r\n            <div class=\"cont active\" data-tabid=\"1\">\r\n             \r\n				\r\n				<div class=\"oneInut\">\r\n					<input type=\"text\" name=\"name\" value=\"[+px.name+]\" id=\"g_name\"/>\r\n					<label for=\"g_name\">Название</label>\r\n				</div>\r\n				\r\n				\r\n				<div class=\"oneInut\">\r\n					<input type=\"text\" name=\"intro\" value=\"[+px.intro+]\" id=\"g_intro\"/>\r\n					<label for=\"g_intro\">Краткое описание</label>\r\n				</div>\r\n				\r\n				\r\n				<div class=\"oneInut\">\r\n					<!-- TinyMCE -->\r\n					<script type=\"text/javascript\">\r\n					tinyMCE.init({\r\n						mode : \"exact\",\r\n						elements: \"content_editor\",\r\n						theme : \"modern\",\r\n						language:\"ru\",\r\n						elements: \"content_editor\"\r\n					 });\r\n					</script>\r\n					<!-- /TinyMCE -->\r\n					<textarea name=\"description\" id=\"content_editor\">[+px.description+]</textarea>\r\n				</div>\r\n				\r\n				\r\n					\r\n\r\n            </div>\r\n			\r\n			\r\n            <div class=\"cont\" data-tabid=\"2\">\r\n				\r\n			    <label class=\"file_upload\">\r\n				   <span class=\"button\">Выбрать файлы</span>\r\n				   <mark>Файлы не выбраны</mark>\r\n				   <input type=\"file\" name=\"xFile\" id=\"uploaded_file\" multiple=\"false\" accept=\".jpg,.png,.gif,.webp,.jpeg,.bmp,.wbmp\">\r\n			    </label>\r\n				\r\n				<div class=\"imagelist\" id=\"dloadImageList\">\r\n					\r\n				</div>\r\n				\r\n				\r\n				\r\n				\r\n				\r\n				\r\n            </div>\r\n			\r\n			\r\n            <div class=\"cont\" data-tabid=\"3\">\r\n				\r\n			\r\n            </div>\r\n		\r\n		\r\n		    <div class=\"cont\" data-tabid=\"4\">\r\n				\r\n			\r\n            </div>\r\n		\r\n				\r\n		    <div class=\"cont\" data-tabid=\"4\">\r\n				\r\n			\r\n            </div>\r\n		\r\n		<div class=\"controls\">\r\n			<button class=\"dControl save\">Сохранить</button>\r\n			<button class=\"dControl accept\">Применить</button>\r\n			<button class=\"dControl cancel\">Отменить</button>\r\n		</div>\r\n		\r\n		\r\n		\r\n    </div>\r\n	\r\n</div>', 0, 1519831930, 1521046259, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_modules`
--

CREATE TABLE `delta_site_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Modules';

--
-- Дамп данных таблицы `delta_site_modules`
--

INSERT INTO `delta_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 2, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.3</strong> first repository for Evolution CMS', 0, 0, 2, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_module_access`
--

CREATE TABLE `delta_site_module_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_module_depobj`
--

CREATE TABLE `delta_site_module_depobj` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_plugins`
--

CREATE TABLE `delta_site_plugins` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';

--
-- Дамп данных таблицы `delta_site_plugins`
--

INSERT INTO `delta_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'CodeMirror', '<strong>1.4</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12', 0, 2, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12\r\n *\r\n * @category    plugin\r\n * @version     1.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     modx\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  3/07/2017\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\r\n', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 0, 0),
(2, 'ElementsInTree', '<strong>1.5.9</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';', 0, '{\r\n  \"adminRoleOnly\": [\r\n    {\r\n      \"label\": \"Administrators only\",\r\n      \"type\": \"list\",\r\n      \"value\": \"yes\",\r\n      \"options\": \"yes,no\",\r\n      \"default\": \"yes\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"treeButtonsInTab\": [\r\n    {\r\n      \"label\": \"Tree buttons in tab\",\r\n      \"type\": \"list\",\r\n      \"value\": \"yes\",\r\n      \"options\": \"yes,no\",\r\n      \"default\": \"yes\",\r\n      \"desc\": \"\"\r\n    }\r\n  ]\r\n}', 0, ' ', 0, 1513257370),
(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';', 0, '', 0, '', 0, 0),
(4, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 0, '', 0, 0),
(5, 'ManagerManager', '<strong>0.6.2</strong> Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 2, 0, '\n/**\n * ManagerManager\n *\n * Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.2\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  06/03/2016\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');', 0, '{\"remove_deprecated_tv_types_pref\":[{\"label\":\"Remove deprecated TV types\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"config_chunk\":[{\"label\":\"Configuration Chunk\",\"type\":\"text\",\"value\":\"mm_rules\",\"default\":\"mm_rules\",\"desc\":\"\"}]}', 0, '', 0, 0),
(6, 'Quick Manager+', '<strong>1.5.9</strong> Enables QuickManager+ front end content editing support', 0, 2, 0, '\r\n/**\r\n * Quick Manager+\r\n * \r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.9\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons  \r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  28/09/2017 \r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif ($disabled  != \'\') {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\r\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 1, '', 0, 0),
(7, 'TinyMCE4', '<strong>4.6.3</strong> Javascript WYSIWYG editor', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/tinymce4/plugin.tinymce.php\';', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 0, 0),
(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(9, 'Updater', '<strong>0.8.2</strong> show message about outdated CMS version', 0, 2, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\r\n\r\n\r\n', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}]}', 0, '', 0, 0),
(10, 'userHelper', '<strong>1.7.11</strong> addition to FormLister', 0, 3, 0, '\n/**\n * userHelper\n * \n * addition to FormLister\n * \n * @category    plugin\n * @version     1.7.11\n * @internal    @properties &logoutKey=Request key;text;logout &cookieName=Cookie Name;text;WebLoginPE &cookieLifetime=Cookie Lifetime, seconds;text;157680000 &maxFails=Max failed logins;text;3 &blockTime=Block for, seconds;text;3600\n * @internal    @events OnWebPageInit,OnPageNotFound,OnWebLogin\n * @internal    @modx_category Content\n * @internal    @disabled 1\n**/\n\nrequire MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';', 0, '{\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}]}', 1, '', 0, 0),
(11, 'test', '', 0, 0, 0, '$headers = getallheaders();\r\nif ($headers[\'xDltFetching\'] == \'true\') {\r\n	return;\r\n}\r\n\r\necho $modx->pre($modx->urlXParams);\r\n\r\n//echo $modx->pre($modx->getCatFromID(3));\r\n\r\n//$id= $modx->documentIdentifier;\r\n\r\n//$ids = $modx->getTreeCat(4 , false);\r\n	\r\n//$modx->getTreeCat(3);\r\n\r\n//$modx->getCatFromID(4)->getFields()->sortIt(\'cats\', \'menuindex\', \'DESC\')->sliceIt(\'cats\' , 1, 2);\r\n\r\n\r\n//$idsF = $modx->getArrayData(\'cats\');\r\n\r\n\r\n//$idsF = $modx->getFields();\r\n\r\n\r\n//$modx->sortGoods (\'menuindex\', \'ASC\');\r\n\r\n//$idsF = $modx->sliceGoods ($idsF , 0, 99);\r\n\r\n//echo $modx->pre($idsF);\r\n\r\n\r\n\r\n//$modx->getGoodsFromCats (4 ,false, /*$modx->parseXparams()*/ false , true );\r\n\r\n//$modx->getAllGoodFields();\r\n\r\n\r\n//$idsGoods = $modx->getGoodsFromCats ();\r\n\r\n//$modx->getAllGoodFields();\r\n	\r\n\r\n//echo $modx->pre($modx->getArrayData(\'goods\'));\r\n\r\n//echo $modx->pre($modx->urlXParams);\r\n\r\n', 0, '{}', 0, ' ', 1515077424, 1519917288),
(12, 'syncSnippets', '<b>2.0</b> Cинхронизация сниппетов. Использовать ТОЛЬКО при разработке', 0, 0, 0, '/**\r\n * syncSnippets\r\n *\r\n * Cинхронизация сниппетов. Использовать ТОЛЬКО при разработке\r\n *\r\n * @version   2.0\r\n * @date      02.02.2018\r\n * @events    OnWebPageInit,OnSnipFormSave\r\n *\r\n */\r\n\r\n$conf = array (\r\n		\'path\' => \"assets/sync_snippets/\"\r\n);\r\n\r\n$catList = [];\r\n\r\n\r\n\r\nswitch ($modx->event->name) {\r\n    case \'OnWebPageInit\':\r\n        init_px_sync($modx, $conf, $catList);\r\n        break;\r\n    case \'OnSnipFormSave\':\r\n        refreshSNPfile($modx , $conf);\r\n        break;	\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction refreshSNPfile($modx , $conf){\r\n	$snippetID = $modx->event->params[\'id\'];\r\n	$sql = \"SELECT ss.snippet, ss.name , cat.category FROM \".$modx->getFullTableName( \'site_snippets\' ).\" AS ss \r\n			LEFT JOIN  \".$modx->getFullTableName( \'categories\' ).\" AS cat ON cat.id = ss.category\r\n			WHERE ss.id = \".$snippetID;\r\n	\r\n	$result = $modx->db->query($sql);\r\n	if ($result && $modx->db->getRecordCount($result) > 0) {\r\n		if ($row = $modx->db->getRow($result)){\r\n		\r\n			if ($row[\'category\'] == \'\') {\r\n				$snp_path = $conf[\'path\'].$row[\'name\'].\'.php\';\r\n			} else {\r\n				$snp_path = $conf[\'path\'].$row[\'category\'].\'/\'.$row[\'name\'].\'.php\';\r\n			}\r\n			\r\n			$fileHandler = fopen (\'../\'.$snp_path , \'w\');\r\n				\r\n			if ($fileHandler) {\r\n				fwrite($fileHandler , \"<?php\".PHP_EOL.$row[\'snippet\'].PHP_EOL.\"?>\");\r\n				fclose($fileHandler);\r\n				@unlink(\'../\'.$conf[\'path\'].\'___SyncDATE.log\');\r\n				rewriteLog(\'../\'.$conf[\'path\'] , $conf , true);\r\n				\r\n			}	\r\n		}\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction init_px_sync ($modx , $conf , &$catList) {\r\n	$sql = \"SELECT * FROM \".$modx->getFullTableName( \'categories\' ).\" LIMIT 50\";\r\n	$result = $modx->db->query($sql);\r\n	if ($result && $modx->db->getRecordCount($result) > 0 ) {\r\n		while ($row = $modx->db->getRow($result)){\r\n			$catList[$row[\'id\'] ] = $row[\'category\']; \r\n		}\r\n	}\r\n	\r\n	$newDirectories = addNewCatToDB($modx , $conf , $catList);\r\n	if ($newDirectories) {\r\n		createNewSnippet($modx , $conf[\'path\'] , $conf);\r\n	}\r\n	\r\n	if (makeDir($catList , $conf)) {\r\n		if (sync($modx , $conf , $catList) === true){\r\n			@unlink($conf[\'path\'].\'___SyncDATE.log\');\r\n			if (rewriteLog($conf[\'path\'] , $conf , false) === true) {\r\n				header(\"Location: http://\".$_SERVER[\'HTTP_HOST\'].$_SERVER[\'REQUEST_URI\']);\r\n			}	\r\n		}\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction createNewSnippet($modx , $path, $conf) {\r\n	$dirHandler = opendir($path);\r\n	while (($file = readdir($dirHandler)) !== false) {\r\n        if ($file == \'.\' || $file == \'..\' || $file == \"___SyncDATE.log\") continue;\r\n		\r\n		if (is_dir($path.$file)) {\r\n			//recurssive\r\n			createNewSnippet($modx , $path.$file.\"/\", $conf);\r\n		}elseif (is_file($path.$file)) {\r\n			\r\n			if (!file_exists($path.$file)) return false;\r\n			$fileName = explode(\'.\', $file);\r\n			$fileName = $fileName[0];\r\n			$idCategory = 0;\r\n\r\n			$sql = \"SELECT id FROM  \".$modx->getFullTableName( \'site_snippets\' ).\" WHERE name = \'\".$fileName.\"\' \";\r\n			if ($result = $modx->db->query($sql)){\r\n				if ($modx->db->getRecordCount($result) == 0) {\r\n					$pathWay = explode(\'/\' , $path);\r\n					print_r($pathWay);\r\n					if (count($pathWay) > 0){\r\n						\r\n						$rootPath = explode(\'/\', $conf[\'path\']);\r\n						$rootPath = $rootPath[count($rootPath)-2];\r\n						if ($pathWay[count($pathWay)-2] == $rootPath) {\r\n							$idCategory = 0;\r\n						} else {\r\n\r\n							$catName = $pathWay[count($pathWay)-2];\r\n							echo \'__\'.$catName.\'<br>\';\r\n							\r\n							$sql = \"SELECT id FROM \".$modx->getFullTableName( \'categories\' ).\" WHERE category = \'\".$catName.\"\' LIMIT 1\";\r\n							if ($result = $modx->db->query($sql)) {\r\n								if ($modx->db->getRecordCount($result) > 0){\r\n									if ($row = $modx->db->getRow($result)) {\r\n										$idCategory = $row[\'id\'];\r\n									}\r\n								}\r\n							}\r\n						}\r\n\r\n						$snp_code =  file($path.$file);\r\n						$snp_code[0] = \'\';\r\n						$snp_code[count($snp_code) -1 ] = \'\';\r\n						$snp_code = implode(\"\", $snp_code);\r\n						$snp_code = $modx->db->escape($snp_code);\r\n						$sql = \"INSERT INTO \".$modx->getFullTableName( \'site_snippets\' ).\" (name , category , snippet) VALUES (\'\".$fileName.\"\' , \'\".$idCategory.\"\' , \'\".$snp_code.\"\') \";\r\n						$result = $modx->db->query($sql);\r\n						if ($result) {\r\n							//rewriteLog($conf[\'path\'] , $conf);\r\n						}\r\n					}\r\n				}\r\n			}\r\n		}	\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction addNewCatToDB($modx , $conf, &$catList) {\r\n	if (file_exists($conf[\'path\'])) {\r\n		$dirHandler = opendir($conf[\'path\']);\r\n	}else {\r\n		return false;\r\n	}\r\n	$err = false;\r\n	$fs_dirs = [];\r\n	\r\n	while (($file = readdir($dirHandler)) !== false) {\r\n        if ($file == \'.\' || $file == \'..\' ) continue;\r\n		if (is_dir($conf[\'path\'].$file)) {\r\n			$fs_dirs[] = $file;\r\n		}\r\n	}\r\n	\r\n	if (count($fs_dirs) > 0) {\r\n		$newDirs = array_diff($fs_dirs , $catList);\r\n	}\r\n\r\n	if (count($newDirs) > 0) {\r\n		foreach($newDirs AS $val) {\r\n			$sql = \"INSERT INTO \".$modx->getFullTableName( \'categories\' ).\" (id, category) VALUES (NULL , \'\".$val.\"\')\";\r\n			$result = $modx->db->query($sql);\r\n			if ($result) {\r\n				$sql_last = \"SELECT id FROM \".$modx->getFullTableName( \'categories\' ).\" WHERE category = \'\".$val.\"\' \";\r\n				$result_last = $modx->db->query($sql_last);\r\n				if ($result_last) {\r\n					if ($lastId = $modx->db->getRow($result_last)) {\r\n						$catList[$lastId[\'id\'] ] = $val;\r\n					}\r\n				}\r\n			}else {\r\n				$err = true;\r\n			}\r\n		}\r\n	}\r\n\r\n	if ($err) {\r\n		return false;\r\n	} else {\r\n		if (count($newDirs) > 0) {\r\n			return $newDirs;\r\n		} else {\r\n			return true;\r\n		}\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction makeDir ($catList , $conf) {\r\n	$err = false;\r\n	if (count($catList) > 0) {\r\n		if (!file_exists($conf[\'path\'])) {\r\n			if (!mkdir ($conf[\'path\'])) {\r\n				$err = true;\r\n			}\r\n		} \r\n		foreach ($catList AS $key => $value){\r\n			if (!file_exists($conf[\'path\'].$value)) {\r\n				if (!mkdir ($conf[\'path\'].$value, 0777, true)){\r\n					$err = true;\r\n					break;\r\n				}\r\n			}	\r\n		}\r\n	} else {	\r\n		$err = true;\r\n	}\r\n	if ($err) {\r\n		return false;\r\n	} else {\r\n		return true;\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction sync ($modx , $conf , $catList) {\r\n\r\n	if (count($catList) < 1) return false;\r\n	$sql = \"SELECT * FROM \".$modx->getFullTableName( \'site_snippets\' ).\" LIMIT 500\";\r\n	$result = $modx->db->query($sql);\r\n	if ($result && $modx->db->getRecordCount($result) > 0 ) {\r\n		$dateSyncFileHandler = fopen ($conf[\'path\'].\'___SyncDATE.log\' , \'a+\');\r\n		$logDataArr = [];\r\n		$logData = @fread($dateSyncFileHandler, filesize($conf[\'path\'].\'___SyncDATE.log\'));	\r\n		$logData = explode(PHP_EOL,$logData);\r\n		\r\n		if (count($logData) > 0){\r\n			foreach ($logData AS $tmp){\r\n				$tmp = explode(\"::\" , $tmp);\r\n				$logDataArr[ $tmp[0] ] = $tmp[1];\r\n			}\r\n		}\r\n		$refreshProcess = false;\r\n		while ($row = $modx->db->getRow($result)){\r\n			$snp_path = $conf[\'path\'].$catList[ $row[\'category\'] ].\'/\'.$row[\'name\'].\'.php\';\r\n			if (file_exists($snp_path)){\r\n				if (filemtime($snp_path) > $logDataArr[$row[\'name\'].\'.php\' ]) {	\r\n					if (refreshDBsnippet($modx , $snp_path, $row[\'name\'], $catList) === true){\r\n						$refreshProcess = true;\r\n					}\r\n				}	\r\n			} else {\r\n				$fileHandler = fopen ($snp_path , \'a+\');\r\n				if ($fileHandler) {\r\n					fwrite($fileHandler , \"<?php\".PHP_EOL.$row[\'snippet\'].PHP_EOL.\"?>\");\r\n					fclose($fileHandler);\r\n				}\r\n				fwrite($dateSyncFileHandler , $row[\'name\'].\'::\'.filemtime($snp_path).PHP_EOL);\r\n			}\r\n		}\r\n		fclose($dateSyncFileHandler);\r\n	}\r\n	if ($refreshProcess) {\r\n		return true;\r\n	} else return false;\r\n}\r\n\r\n\r\n\r\n\r\n\r\nfunction refreshDBsnippet($modx , $snp_path, $snp_name,  $catList) {\r\n	$snp_code =  file($snp_path);\r\n	$snp_code[0] = \'\';\r\n	$snp_code[count($snp_code) -1 ] = \'\';\r\n	$snp_code = implode(\"\", $snp_code);\r\n	$snp_code = $modx->db->escape($snp_code);\r\n	\r\n	$sql = \"UPDATE \".$modx->getFullTableName( \'site_snippets\' ).\" SET snippet = \'\".$snp_code.\"\' WHERE name = \'\".$snp_name.\"\' LIMIT 1\";\r\n	$result = $modx->db->query($sql) or die (\"ERR 564 \".$modx->db->getLastError());\r\n	\r\n	if ($result){\r\n		clearCache_px($modx);\r\n		return true;\r\n	} else {\r\n		return false;\r\n	}\r\n}\r\n\r\n\r\n\r\n\r\n\r\nfunction clearCache_px($modx) {\r\n	$modx->clearCache();\r\n	include_once MODX_BASE_PATH . \'manager/processors/cache_sync.class.processor.php\';\r\n	$sync= new synccache();\r\n	$sync->setCachepath( MODX_BASE_PATH . \"assets/cache/\" );\r\n	$sync->setReport( false );\r\n	$sync->emptyCache();\r\n}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nfunction rewriteLog($path , $conf , $outMNG) {\r\n\r\n	if ($outMNG) {\r\n		$upPath = \'../\';\r\n	}else {\r\n		$upPath = \'\';\r\n	}\r\n	\r\n	$dirHandler = opendir($path);\r\n	while (($file = readdir($dirHandler)) !== false) {\r\n        if ($file == \'.\' || $file == \'..\' ) continue;\r\n		if (is_dir($path.$file)) {\r\n			rewriteLog($path.$file.\'/\', $conf , $outMNG);\r\n		}else {\r\n			$fp = fopen($upPath.$conf[\'path\'].\'___SyncDATE.log\' , \'a\');\r\n			fwrite($fp , $file.\'::\'.filemtime($path.$file).PHP_EOL);\r\n			fclose($fp);\r\n		}\r\n    }\r\n	return true;\r\n}\r\n', 0, '{}', 0, ' ', 1517585165, 1517585532),
(13, 'ajxControl', '', 0, 0, 0, '$headers = getallheaders();\r\nif ($headers[\'X-Requested-With\'] == \'XMLHttpRequest\' && $headers[\'px-FormSender\'] == \'true\') {\r\n	\r\n	if (is_array($_POST) && count($_POST)) {\r\n		foreach($_POST AS $key => $json){\r\n			if ($key == \'meta\') {\r\n				$meta =  json_decode($json , 1);\r\n				continue;\r\n			}\r\n			$jdata = json_decode($json , 1) ;\r\n			$fields_pholder[$key] = $jdata [\'fieldname\'];\r\n			$values_pholder[$key] = $jdata [\'value\'];\r\n		}\r\n	}\r\n	\r\n	if (is_array($fields_pholder) && is_array($values_pholder) && count($fields_pholder) && count($fields_pholder) == count($values_pholder) && $meta[\'chunk\'] != \'\') {\r\n		if ($meta[\'subject\'] == \'\') $meta[\'subject\'] = \'Писмо с сайта \'.$_SERVER[\'HTTP_HOST\'];\r\n		\r\n		$parsedChunk = $modx->parseText($modx->getChunk(\'testForm_Mail\') , $fields_pholder , \'[+pxField.\');\r\n		$parsedChunk = $modx->parseText($parsedChunk , $values_pholder , \'[+pxValue.\');\r\n		$parsedChunk = $modx->rewriteUrls($parsedChunk);\r\n		$respond[\'debug\'] = $parsedChunk;\r\n		$respond[\'result\'] = true;\r\n		$modx->runSnippet(\'sendQuickEmail\' , array(\r\n			\'subject\' => $meta[\'subject\'], \r\n			\'clientMail\' => \'\' , //todo\r\n			\'emailtext\' => $parsedChunk,\r\n			\'clientOnly\' => false, //todo\r\n			) \r\n		);\r\n		}else {\r\n		$respond[\'resultpx\'] = false;\r\n	\r\n	}\r\n	sleep(1);\r\n	echo json_encode($respond);\r\n	exit();\r\n}\r\n', 0, '{}', 0, ' ', 1519915278, 1519915278);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_plugin_events`
--

CREATE TABLE `delta_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `delta_site_plugin_events`
--

INSERT INTO `delta_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(1, 88, 0),
(2, 25, 0),
(2, 27, 0),
(2, 37, 0),
(2, 39, 0),
(2, 43, 0),
(2, 45, 0),
(2, 49, 0),
(2, 51, 0),
(2, 55, 0),
(2, 57, 0),
(2, 75, 0),
(2, 77, 0),
(2, 206, 0),
(2, 210, 0),
(2, 211, 0),
(3, 34, 0),
(3, 35, 0),
(3, 36, 0),
(3, 40, 0),
(3, 41, 0),
(3, 42, 0),
(4, 80, 0),
(4, 81, 0),
(4, 93, 0),
(5, 28, 0),
(5, 29, 0),
(5, 30, 0),
(5, 31, 0),
(5, 35, 0),
(5, 53, 0),
(5, 205, 0),
(6, 3, 0),
(6, 13, 0),
(6, 28, 0),
(6, 31, 0),
(6, 92, 0),
(7, 3, 0),
(7, 20, 0),
(7, 85, 0),
(7, 87, 0),
(7, 88, 0),
(7, 91, 0),
(7, 92, 0),
(8, 100, 0),
(9, 70, 0),
(9, 202, 0),
(9, 1000, 0),
(10, 4, 0),
(10, 90, 0),
(10, 1000, 0),
(11, 3, 1),
(12, 90, 1),
(12, 43, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_snippets`
--

CREATE TABLE `delta_site_snippets` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';

--
-- Дамп данных таблицы `delta_site_snippets`
--

INSERT INTO `delta_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\r\n', 0, '', '', 0, 0, 0),
(2, 'DLMenu', '<strong>1.2.0</strong> Snippet to build menu with DocLister', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n\r\n', 0, '', '', 0, 0, 0),
(3, 'DLSitemap', '<strong>1.0.0</strong> Snippet to build XML sitemap', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n\r\n', 0, '', '', 0, 0, 0),
(4, 'DocInfo', '<strong>1</strong> Take any field from any document (fewer requests than GetField)', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\r\n\r\n', 0, '', '', 0, 0, 0),
(5, 'DocLister', '<strong>2.3.11</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n\r\n', 0, '', '', 0, 0, 0),
(6, 'FormLister', '<strong>1.7.11</strong> Form processor', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n\r\n', 0, '', '', 0, 0, 0),
(7, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 4, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';\r\n', 0, '', '', 0, 0, 0),
(8, 'phpthumb', '<strong>1.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n\r\n', 0, '', '', 0, 0, 0),
(9, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';\r\n', 0, '', '', 0, 0, 0),
(10, 'DLT_CATALOG', '', 0, 0, 0, '\r\nif (!is_numeric($root)){\r\n	$root= $modx->documentIdentifier;\r\n}\r\n\r\n\r\n \r\n//$catalog = new catalog_c($modx);\r\n\r\n//echo \'ww\'.$modx->urlXParams[\'istCardPage\'].\"ww\";\r\n\r\nif ($modx->urlXParams[\'istCardPage\'] != true) {\r\n	$modx->c->getCatFromID($root);\r\n	$modx->c->getCatFromID($root)->getCatFields()->sortIt(\'cats\', \'menuindex\', \'DESC\');\r\n	$modx->c->renderAll($chunkCats , \'cats\' , \'print\');\r\n}\r\n\r\n\r\n\r\nif ($modx->urlXParams[\'istCardPage\'] != true) {\r\n	$modx->c->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );\r\n	$modx->c->getAllGoodFields();\r\n	$modx->c->renderAll($chunkGoods , \'goods\' , \'print\'); \r\n}\r\n//$modx->c->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );\r\n\r\n\r\n\r\n\r\nif ($modx->urlXParams[\'istCardPage\'] == true) {\r\n	//$modx->c->set($modx->urlXParams[\'idPage\']);\r\n	//print_r($modx->c->getFields($modx->urlXParams[\'idPage\']) );\r\n	$modx->c->render($chunkCard , $modx->c->getFields($modx->urlXParams[\'idPage\'])[$modx->urlXParams[\'idPage\']]  , \'print\'); \r\n}\r\n\r\n\r\n\r\n//echo $modx->pre($modx->c->getArrayData(\'cats\'));\r\n\r\n\r\n/*\r\n$catalog = $modx->getCatFromID($root);\r\n$catalog->getFields()->sortIt(\'cats\', \'menuindex\', \'DESC\')->sliceIt(\'cats\' , 0, 2);\r\n*/\r\n\r\n\r\n\r\n//$catalog->getCatFromID($root)->getFields()->sortIt(\'cats\', \'menuindex\', \'DESC\');\r\n\r\n//$catalog->renderAll($chunkCats , \'cats\' , \'print\');\r\n\r\n\r\n\r\n\r\n\r\n//$modx->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );\r\n//$modx->getAllGoodFields();\r\n/*\r\n$modx->renderAll($chunkGoods , \'goods\' , \'print\');\r\n\r\necho $modx->pre($modx->getArrayData(\'goods\'));\r\n\r\n/\r\n	\r\n	\r\n	\r\n/*\r\n$idsF = $modx->getArrayData(\'cats\');\r\necho $modx->pre($idsF);\r\n*/\r\n', 0, '{}', ' ', 1515163324, 1519813809, 0),
(11, 'admAJX', '', 0, 6, 0, '\r\n$headers = getallheaders();\r\n\r\nif ($headers[\'xDltFetching\'] == \'true\'){\r\n\r\n	\r\n	if (RQ::P(\'event\') == \'addOrUpdate\') {\r\n		if ($response[\'che\'] = $modx->c->checkExists(RQ::P(\'id_product\'))){\r\n			$response[\'evt\'] =  \'update\';\r\n			$response[\'state\'] =  $modx->c->updateGoods(RQ::P(\'id_product\'));\r\n		}else {\r\n			$response[\'evt\'] = \'create\';\r\n		}\r\n	}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n	if (RQ::G(\'event\') == \'uploadimages\') {\r\n		$response = $modx->c->uploadimages(); \r\n	}\r\n	\r\n	\r\n}\r\n	\r\nreturn json_encode($response);\r\n\r\n', 0, '{}', ' ', 1519912554, 1520851720, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_templates`
--

CREATE TABLE `delta_site_templates` (
  `id` int(10) NOT NULL,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';

--
-- Дамп данных таблицы `delta_site_templates`
--

INSERT INTO `delta_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(3, 'Minimal Template', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1, 0, 0),
(4, 'Каталог', '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"ru\" lang=\"ru\">\r\n{{head}}\r\n\r\n\r\n<body>\r\n	\r\n	[+px.islogged+]\r\n\r\n	{{header}}\r\n	\r\n	{{topmenu}}\r\n\r\n	{{slider}}\r\n	\r\n	<section class=\"content\">\r\n		<div class=\"wrapper\">\r\n			<h1 class=\"hTitle\">[*pagetitle*]</h1>\r\n			[!DLT_CATALOG?\r\n				&chunkCats=`test_cat`\r\n				&chunkGoods=`test_good`	\r\n				&chunkCard=`test_card`	\r\n			!]\r\n		</div>\r\n	</section>\r\n\r\n\r\n\r\n\r\n\r\n	{{footer}}\r\n	\r\n	{{ProductRedactor}}\r\n	\r\n	{{scripts}}\r\n \r\n</body>\r\n</html>', 0, 1, 1515080028, 1520005995);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_tmplvars`
--

CREATE TABLE `delta_site_tmplvars` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';

--
-- Дамп данных таблицы `delta_site_tmplvars`
--

INSERT INTO `delta_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`) VALUES
(1, 'image', 'image', 'Изображение', '', 0, 0, 0, '', 0, '', '', '', 1515149538, 1515149538);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_tmplvar_access`
--

CREATE TABLE `delta_site_tmplvar_access` (
  `id` int(10) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_tmplvar_contentvalues`
--

CREATE TABLE `delta_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';

--
-- Дамп данных таблицы `delta_site_tmplvar_contentvalues`
--

INSERT INTO `delta_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 1, 4, 'assets/images/testcatalog/756a5a7cba73721607453c2c42b23ad8.jpg'),
(2, 1, 7, 'assets/images/testcatalog/computer-cables-480.jpg'),
(3, 1, 8, 'assets/images/testcatalog/1017452246.jpg'),
(4, 1, 9, 'assets/images/testcatalog/2.jpg'),
(5, 1, 5, 'assets/images/testcatalog/kakie-komplektuyushhie-nuzhny-dlya-sborki-igrovogo-kompyutera.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_site_tmplvar_templates`
--

CREATE TABLE `delta_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `delta_site_tmplvar_templates`
--

INSERT INTO `delta_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_system_eventnames`
--

CREATE TABLE `delta_system_eventnames` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

--
-- Дамп данных таблицы `delta_system_eventnames`
--

INSERT INTO `delta_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(108, 'OnBeforeParseParams', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(215, 'OnManagerTopPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_system_settings`
--

CREATE TABLE `delta_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `delta_system_settings`
--

INSERT INTO `delta_system_settings` (`setting_name`, `setting_value`) VALUES
('settings_version', '1.4.0.RC2'),
('manager_theme', 'default'),
('server_offset_time', '0'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'My Evolution Site'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('friendly_urls', '1'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('cache_type', '2'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('emailsender', ''),
('use_editor', '1'),
('use_browser', '1'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('upload_maxsize', '10485760'),
('manager_layout', '4'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('xhtml_urls', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('number_of_results', '30'),
('theme_refresher', ''),
('show_picker', '0'),
('show_newresource_btn', '0'),
('show_fullscreen_btn', '0'),
('site_id', '5a32792691ebe'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('enable_filter', '0'),
('enable_at_syntax', '1'),
('cache_default', '1'),
('search_default', '1'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('docid_incrmnt_method', '0'),
('enable_cache', '1'),
('minifyphp_incache', '0'),
('server_protocol', 'http'),
('rss_url_news', 'http://feeds.feedburner.com/evocms-release-news'),
('track_visitors', '0'),
('top_howmany', '10'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('make_folders', '1'),
('aliaslistingfolder', '0'),
('allow_duplicate_alias', '0'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_secure', 'none'),
('smtp_host', 'smtp.example.com'),
('smtp_port', '25'),
('smtp_username', 'you@example.com'),
('reload_emailsubject', ''),
('emailsubject', 'Данные для авторизации'),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('tree_page_click', '27'),
('use_breadcrumbs', '0'),
('global_tabs', '0'),
('group_tvs', '0'),
('resource_tree_node_name', 'pagetitle'),
('session_timeout', '15'),
('tree_show_protected', '0'),
('datepicker_offset', '-10'),
('number_of_logs', '100'),
('number_of_messages', '40'),
('which_editor', 'TinyMCE4'),
('tinymce4_theme', 'custom'),
('tinymce4_skin', 'lightgray'),
('tinymce4_template_docs', ''),
('tinymce4_template_chunks', ''),
('tinymce4_entermode', 'p'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_schema', 'html5'),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('allow_eval', 'with_scan'),
('safe_functions_at_eval', 'time,date,strtotime,strftime'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('validate_referer', '1'),
('rss_url_security', 'http://feeds.feedburner.com/evocms-security-news'),
('error_reporting', '2'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('filemanager_path', 'C:/OSPanel/domains/Evolution/'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('which_browser', 'mcpuk'),
('rb_webuser', '0'),
('rb_base_dir', 'C:/OSPanel/domains/Evolution/assets/'),
('rb_base_url', 'assets/'),
('clean_uploaded_filename', '1'),
('strip_image_paths', '1'),
('maxImageWidth', '2600'),
('maxImageHeight', '2200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('lang_code', 'ru'),
('sys_files_checksum', 'a:4:{s:38:\"C:/OSPanel/domains/Evolution/index.php\";s:32:\"c3eae897837b547d501064f641a1d0e3\";s:38:\"C:/OSPanel/domains/Evolution/.htaccess\";s:32:\"b1c95a3066c8f67a50735856c271c60f\";s:46:\"C:/OSPanel/domains/Evolution/manager/index.php\";s:32:\"863a96f261fe95da8b2a549002172c37\";s:60:\"C:/OSPanel/domains/Evolution/manager/includes/config.inc.php\";s:32:\"cab447d50245713fbb0d37e7fb2e49f0\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `delta_user_attributes`
--

CREATE TABLE `delta_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';

--
-- Дамп данных таблицы `delta_user_attributes`
--

INSERT INTO `delta_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`) VALUES
(1, 1, 'Admin', 1, '', '', '', 0, 0, 0, 7, 1520845572, 1520845618, 0, 's6mfj00eq88jrffvatnaido960', 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_user_messages`
--

CREATE TABLE `delta_user_messages` (
  `id` int(10) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_user_roles`
--

CREATE TABLE `delta_user_roles` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';

--
-- Дамп данных таблицы `delta_user_roles`
--

INSERT INTO `delta_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `category_manager`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `delta_user_settings`
--

CREATE TABLE `delta_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_webgroup_access`
--

CREATE TABLE `delta_webgroup_access` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_webgroup_names`
--

CREATE TABLE `delta_webgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_web_groups`
--

CREATE TABLE `delta_web_groups` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_web_users`
--

CREATE TABLE `delta_web_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta_web_user_attributes`
--

CREATE TABLE `delta_web_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta_web_user_settings`
--

CREATE TABLE `delta_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `delta__language`
--

CREATE TABLE `delta__language` (
  `id_language` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__language`
--

INSERT INTO `delta__language` (`id_language`, `code`, `name`) VALUES
(1, 'RUS', 'Русский'),
(2, 'ENG', 'English');

-- --------------------------------------------------------

--
-- Структура таблицы `delta__price_base`
--

CREATE TABLE `delta__price_base` (
  `id_price_base` int(11) NOT NULL,
  `val` int(10) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_price_types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__price_currency_types`
--

CREATE TABLE `delta__price_currency_types` (
  `id_price_c_types` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `symbol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__price_currency_types`
--

INSERT INTO `delta__price_currency_types` (`id_price_c_types`, `name`, `symbol`) VALUES
(1, 'RUB', '&#8381;'),
(2, 'USD', '&#36;'),
(3, 'EUR', '&euro;');

-- --------------------------------------------------------

--
-- Структура таблицы `delta__price_final`
--

CREATE TABLE `delta__price_final` (
  `id_price_base` int(11) NOT NULL,
  `val` int(10) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_price_types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__price_types`
--

CREATE TABLE `delta__price_types` (
  `id_price_types` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `id_price_c_types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product`
--

CREATE TABLE `delta__product` (
  `id_product` int(11) NOT NULL,
  `alias` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__product`
--

INSERT INTO `delta__product` (`id_product`, `alias`) VALUES
(1, 'testcable');

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product_description`
--

CREATE TABLE `delta__product_description` (
  `id_product` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `intro` varchar(300) DEFAULT NULL,
  `description` text NOT NULL,
  `id_language` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__product_description`
--

INSERT INTO `delta__product_description` (`id_product`, `name`, `intro`, `description`, `id_language`) VALUES
(1, '12121212121', 'kjl', 'jkjhkjhk', 1),
(1, 'd-sub cable', 'gold', '', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product_final`
--

CREATE TABLE `delta__product_final` (
  `id_product_final` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_price_final` int(11) NOT NULL,
  `action_for_price` set('ADD_TO_BASE','REPLACE_BASE','','') NOT NULL DEFAULT 'REPLACE_BASE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product_images`
--

CREATE TABLE `delta__product_images` (
  `id_product` int(11) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product_options`
--

CREATE TABLE `delta__product_options` (
  `id_product` int(11) NOT NULL,
  `visible` set('1','0') DEFAULT '1',
  `searchable` set('1','0') DEFAULT '1',
  `deleted` set('1','0') DEFAULT '0',
  `state_stock` set('0','1','2','3') DEFAULT '1',
  `counter_visible` int(11) DEFAULT '0',
  `create_date` varchar(20) DEFAULT NULL,
  `update_date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__product_options`
--

INSERT INTO `delta__product_options` (`id_product`, `visible`, `searchable`, `deleted`, `state_stock`, `counter_visible`, `create_date`, `update_date`) VALUES
(1, '1', '1', '0', '1', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `delta__product_to_directory`
--

CREATE TABLE `delta__product_to_directory` (
  `id_product` int(11) NOT NULL,
  `id_sc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__product_to_directory`
--

INSERT INTO `delta__product_to_directory` (`id_product`, `id_sc`) VALUES
(1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props`
--

CREATE TABLE `delta__props` (
  `id_prop` int(11) NOT NULL,
  `id_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props_descr`
--

CREATE TABLE `delta__props_descr` (
  `id_prop` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_language` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props_group`
--

CREATE TABLE `delta__props_group` (
  `id_props_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props_group_descr`
--

CREATE TABLE `delta__props_group_descr` (
  `id_props_group` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `id_language` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props_to_category`
--

CREATE TABLE `delta__props_to_category` (
  `id_prop` int(11) NOT NULL,
  `id_sc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__props_to_product`
--

CREATE TABLE `delta__props_to_product` (
  `id_product_final` int(11) NOT NULL,
  `id_prop` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__users`
--

CREATE TABLE `delta__users` (
  `id_user` int(11) NOT NULL,
  `passw` varchar(32) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `lastvivsit` timestamp NULL DEFAULT NULL,
  `datereg` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `visitcount` int(11) NOT NULL DEFAULT '0',
  `blocked` int(11) NOT NULL DEFAULT '0',
  `confirm` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__users_address`
--

CREATE TABLE `delta__users_address` (
  `id_users_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `house` varchar(15) DEFAULT NULL,
  `entrance` varchar(10) DEFAULT NULL,
  `apartment` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delta__vendors`
--

CREATE TABLE `delta__vendors` (
  `id_vendor` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__vendors`
--

INSERT INTO `delta__vendors` (`id_vendor`, `name`) VALUES
(1, 'Philips');

-- --------------------------------------------------------

--
-- Структура таблицы `delta__vendor_to_product`
--

CREATE TABLE `delta__vendor_to_product` (
  `id_vendor` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__vendor_to_product`
--

INSERT INTO `delta__vendor_to_product` (`id_vendor`, `id_product`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_product_all_field`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_product_all_field` (
`id_product` int(11)
,`alias` varchar(50)
,`name` varchar(150)
,`intro` varchar(300)
,`description` text
,`id_language` int(11)
,`visible` set('1','0')
,`searchable` set('1','0')
,`deleted` set('1','0')
,`state_stock` set('0','1','2','3')
,`counter_visible` int(11)
,`create_date` varchar(20)
,`update_date` varchar(20)
,`parent` int(10)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_product_dir_and_option`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_product_dir_and_option` (
`id_product` int(11)
,`id_sc` int(10)
,`visible` set('1','0')
,`searchable` set('1','0')
,`deleted` set('1','0')
,`state_stock` set('0','1','2','3')
,`counter_visible` int(11)
,`create_date` varchar(20)
,`update_date` varchar(20)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_user_and_address`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_user_and_address` (
`id_user` int(11)
,`id_users_address` int(11)
,`phone` varchar(20)
,`email` varchar(80)
,`firstname` varchar(45)
,`lastname` varchar(45)
,`middlename` varchar(45)
,`street` varchar(60)
,`postcode` varchar(12)
,`house` varchar(15)
,`entrance` varchar(10)
,`apartment` varchar(10)
);

-- --------------------------------------------------------

--
-- Структура для представления `v_product_all_field`
--
DROP TABLE IF EXISTS `v_product_all_field`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `deltaevo`.`v_product_all_field`  AS  select `p`.`id_product` AS `id_product`,`p`.`alias` AS `alias`,`pd`.`name` AS `name`,`pd`.`intro` AS `intro`,`pd`.`description` AS `description`,`pd`.`id_language` AS `id_language`,`po`.`visible` AS `visible`,`po`.`searchable` AS `searchable`,`po`.`deleted` AS `deleted`,`po`.`state_stock` AS `state_stock`,`po`.`counter_visible` AS `counter_visible`,`po`.`create_date` AS `create_date`,`po`.`update_date` AS `update_date`,`pdir`.`id_sc` AS `parent` from (((`deltaevo`.`delta__product` `p` join `deltaevo`.`delta__product_description` `pd` on((`p`.`id_product` = `pd`.`id_product`))) join `deltaevo`.`delta__product_options` `po` on((`p`.`id_product` = `po`.`id_product`))) join `deltaevo`.`delta__product_to_directory` `pdir` on((`p`.`id_product` = `pdir`.`id_product`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `v_product_dir_and_option`
--
DROP TABLE IF EXISTS `v_product_dir_and_option`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `deltaevo`.`v_product_dir_and_option`  AS  select `pd`.`id_product` AS `id_product`,`pd`.`id_sc` AS `id_sc`,`po`.`visible` AS `visible`,`po`.`searchable` AS `searchable`,`po`.`deleted` AS `deleted`,`po`.`state_stock` AS `state_stock`,`po`.`counter_visible` AS `counter_visible`,`po`.`create_date` AS `create_date`,`po`.`update_date` AS `update_date` from (`deltaevo`.`delta__product_to_directory` `pd` join `deltaevo`.`delta__product_options` `po` on((`pd`.`id_product` = `po`.`id_product`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `v_user_and_address`
--
DROP TABLE IF EXISTS `v_user_and_address`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `deltaevo`.`v_user_and_address`  AS  select `u`.`id_user` AS `id_user`,`ua`.`id_users_address` AS `id_users_address`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`middlename` AS `middlename`,`ua`.`street` AS `street`,`ua`.`postcode` AS `postcode`,`ua`.`house` AS `house`,`ua`.`entrance` AS `entrance`,`ua`.`apartment` AS `apartment` from (`deltaevo`.`delta__users` `u` join `deltaevo`.`delta__users_address` `ua` on((`u`.`id_user` = `ua`.`id_user`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `delta_active_users`
--
ALTER TABLE `delta_active_users`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `delta_active_user_locks`
--
ALTER TABLE `delta_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `delta_active_user_sessions`
--
ALTER TABLE `delta_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `delta_categories`
--
ALTER TABLE `delta_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_documentgroup_names`
--
ALTER TABLE `delta_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `delta_document_groups`
--
ALTER TABLE `delta_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document` (`document`),
  ADD KEY `document_group` (`document_group`);

--
-- Индексы таблицы `delta_event_log`
--
ALTER TABLE `delta_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `delta_manager_log`
--
ALTER TABLE `delta_manager_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_manager_users`
--
ALTER TABLE `delta_manager_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `delta_membergroup_access`
--
ALTER TABLE `delta_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_membergroup_names`
--
ALTER TABLE `delta_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `delta_member_groups`
--
ALTER TABLE `delta_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `delta_site_content`
--
ALTER TABLE `delta_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `typeidx` (`type`);
ALTER TABLE `delta_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `delta_site_htmlsnippets`
--
ALTER TABLE `delta_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_modules`
--
ALTER TABLE `delta_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_module_access`
--
ALTER TABLE `delta_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_module_depobj`
--
ALTER TABLE `delta_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_plugins`
--
ALTER TABLE `delta_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_plugin_events`
--
ALTER TABLE `delta_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `delta_site_snippets`
--
ALTER TABLE `delta_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_templates`
--
ALTER TABLE `delta_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_tmplvars`
--
ALTER TABLE `delta_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `delta_site_tmplvar_access`
--
ALTER TABLE `delta_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_site_tmplvar_contentvalues`
--
ALTER TABLE `delta_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_tmplvarid` (`tmplvarid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `delta_site_tmplvar_contentvalues` ADD FULLTEXT KEY `value_ft_idx` (`value`);

--
-- Индексы таблицы `delta_site_tmplvar_templates`
--
ALTER TABLE `delta_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `delta_system_eventnames`
--
ALTER TABLE `delta_system_eventnames`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_system_settings`
--
ALTER TABLE `delta_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `delta_user_attributes`
--
ALTER TABLE `delta_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `delta_user_messages`
--
ALTER TABLE `delta_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_user_roles`
--
ALTER TABLE `delta_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_user_settings`
--
ALTER TABLE `delta_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `delta_webgroup_access`
--
ALTER TABLE `delta_webgroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delta_webgroup_names`
--
ALTER TABLE `delta_webgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `delta_web_groups`
--
ALTER TABLE `delta_web_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`);

--
-- Индексы таблицы `delta_web_users`
--
ALTER TABLE `delta_web_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `delta_web_user_attributes`
--
ALTER TABLE `delta_web_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `delta_web_user_settings`
--
ALTER TABLE `delta_web_user_settings`
  ADD PRIMARY KEY (`webuser`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `webuserid` (`webuser`);

--
-- Индексы таблицы `delta__language`
--
ALTER TABLE `delta__language`
  ADD PRIMARY KEY (`id_language`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_name` (`name`);

--
-- Индексы таблицы `delta__price_base`
--
ALTER TABLE `delta__price_base`
  ADD PRIMARY KEY (`id_price_base`);

--
-- Индексы таблицы `delta__price_currency_types`
--
ALTER TABLE `delta__price_currency_types`
  ADD PRIMARY KEY (`id_price_c_types`);

--
-- Индексы таблицы `delta__price_final`
--
ALTER TABLE `delta__price_final`
  ADD PRIMARY KEY (`id_price_base`);

--
-- Индексы таблицы `delta__price_types`
--
ALTER TABLE `delta__price_types`
  ADD PRIMARY KEY (`id_price_types`);

--
-- Индексы таблицы `delta__product`
--
ALTER TABLE `delta__product`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `delta__product_description`
--
ALTER TABLE `delta__product_description`
  ADD KEY `product_descr_to_language_idx` (`id_language`),
  ADD KEY `product_descr_to_product` (`id_product`);

--
-- Индексы таблицы `delta__product_final`
--
ALTER TABLE `delta__product_final`
  ADD PRIMARY KEY (`id_product_final`);

--
-- Индексы таблицы `delta__product_images`
--
ALTER TABLE `delta__product_images`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `delta__product_options`
--
ALTER TABLE `delta__product_options`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `delta__product_to_directory`
--
ALTER TABLE `delta__product_to_directory`
  ADD KEY `to_product_idx` (`id_product`),
  ADD KEY `to_directory_idx` (`id_sc`);

--
-- Индексы таблицы `delta__props`
--
ALTER TABLE `delta__props`
  ADD PRIMARY KEY (`id_prop`),
  ADD KEY `to_group_idx` (`id_group`);

--
-- Индексы таблицы `delta__props_descr`
--
ALTER TABLE `delta__props_descr`
  ADD UNIQUE KEY `idx_unq` (`id_prop`,`id_language`),
  ADD KEY `to_props_idx` (`id_prop`),
  ADD KEY `to_lang_idx` (`id_language`);

--
-- Индексы таблицы `delta__props_group`
--
ALTER TABLE `delta__props_group`
  ADD PRIMARY KEY (`id_props_group`);

--
-- Индексы таблицы `delta__props_group_descr`
--
ALTER TABLE `delta__props_group_descr`
  ADD UNIQUE KEY `idx_unq` (`id_props_group`,`id_language`),
  ADD KEY `to_group_idx` (`id_props_group`),
  ADD KEY `to_lang_idx` (`id_language`);

--
-- Индексы таблицы `delta__props_to_category`
--
ALTER TABLE `delta__props_to_category`
  ADD UNIQUE KEY `idx_unq` (`id_prop`,`id_sc`),
  ADD KEY `to_prop_idx` (`id_prop`),
  ADD KEY `to_sc0_idx` (`id_sc`);

--
-- Индексы таблицы `delta__props_to_product`
--
ALTER TABLE `delta__props_to_product`
  ADD UNIQUE KEY `idx_unq` (`id_prop`,`id_product`),
  ADD KEY `to_prop_idx` (`id_prop`),
  ADD KEY `to_product_idx` (`id_product`);

--
-- Индексы таблицы `delta__users`
--
ALTER TABLE `delta__users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `idx_mail` (`email`),
  ADD KEY `idx_passw` (`passw`);

--
-- Индексы таблицы `delta__users_address`
--
ALTER TABLE `delta__users_address`
  ADD PRIMARY KEY (`id_users_address`),
  ADD KEY `user_address_to_user_idx` (`id_user`);

--
-- Индексы таблицы `delta__vendors`
--
ALTER TABLE `delta__vendors`
  ADD PRIMARY KEY (`id_vendor`);

--
-- Индексы таблицы `delta__vendor_to_product`
--
ALTER TABLE `delta__vendor_to_product`
  ADD UNIQUE KEY `idx_mplt` (`id_vendor`,`id_product`),
  ADD KEY `to_product_idx` (`id_product`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `delta_active_user_locks`
--
ALTER TABLE `delta_active_user_locks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT для таблицы `delta_categories`
--
ALTER TABLE `delta_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `delta_documentgroup_names`
--
ALTER TABLE `delta_documentgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_document_groups`
--
ALTER TABLE `delta_document_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_event_log`
--
ALTER TABLE `delta_event_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT для таблицы `delta_manager_log`
--
ALTER TABLE `delta_manager_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT для таблицы `delta_manager_users`
--
ALTER TABLE `delta_manager_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `delta_membergroup_access`
--
ALTER TABLE `delta_membergroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_membergroup_names`
--
ALTER TABLE `delta_membergroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_member_groups`
--
ALTER TABLE `delta_member_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_site_content`
--
ALTER TABLE `delta_site_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `delta_site_htmlsnippets`
--
ALTER TABLE `delta_site_htmlsnippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `delta_site_modules`
--
ALTER TABLE `delta_site_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `delta_site_module_access`
--
ALTER TABLE `delta_site_module_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_site_module_depobj`
--
ALTER TABLE `delta_site_module_depobj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_site_plugins`
--
ALTER TABLE `delta_site_plugins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `delta_site_snippets`
--
ALTER TABLE `delta_site_snippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `delta_site_templates`
--
ALTER TABLE `delta_site_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `delta_site_tmplvars`
--
ALTER TABLE `delta_site_tmplvars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `delta_site_tmplvar_access`
--
ALTER TABLE `delta_site_tmplvar_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_site_tmplvar_contentvalues`
--
ALTER TABLE `delta_site_tmplvar_contentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `delta_system_eventnames`
--
ALTER TABLE `delta_system_eventnames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1036;

--
-- AUTO_INCREMENT для таблицы `delta_user_attributes`
--
ALTER TABLE `delta_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `delta_user_messages`
--
ALTER TABLE `delta_user_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_user_roles`
--
ALTER TABLE `delta_user_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `delta_webgroup_access`
--
ALTER TABLE `delta_webgroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_webgroup_names`
--
ALTER TABLE `delta_webgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_web_groups`
--
ALTER TABLE `delta_web_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_web_users`
--
ALTER TABLE `delta_web_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta_web_user_attributes`
--
ALTER TABLE `delta_web_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__language`
--
ALTER TABLE `delta__language`
  MODIFY `id_language` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `delta__price_base`
--
ALTER TABLE `delta__price_base`
  MODIFY `id_price_base` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__price_currency_types`
--
ALTER TABLE `delta__price_currency_types`
  MODIFY `id_price_c_types` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `delta__price_final`
--
ALTER TABLE `delta__price_final`
  MODIFY `id_price_base` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__price_types`
--
ALTER TABLE `delta__price_types`
  MODIFY `id_price_types` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__product`
--
ALTER TABLE `delta__product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `delta__product_final`
--
ALTER TABLE `delta__product_final`
  MODIFY `id_product_final` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__props`
--
ALTER TABLE `delta__props`
  MODIFY `id_prop` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__props_group`
--
ALTER TABLE `delta__props_group`
  MODIFY `id_props_group` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__users`
--
ALTER TABLE `delta__users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__users_address`
--
ALTER TABLE `delta__users_address`
  MODIFY `id_users_address` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delta__vendors`
--
ALTER TABLE `delta__vendors`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `delta__product_description`
--
ALTER TABLE `delta__product_description`
  ADD CONSTRAINT `product_descr_to_language` FOREIGN KEY (`id_language`) REFERENCES `delta__language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_descr_to_product` FOREIGN KEY (`id_product`) REFERENCES `delta__product` (`id_product`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__product_images`
--
ALTER TABLE `delta__product_images`
  ADD CONSTRAINT `images_to_product` FOREIGN KEY (`id_product`) REFERENCES `delta__product` (`id_product`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__product_options`
--
ALTER TABLE `delta__product_options`
  ADD CONSTRAINT `product_props_to_product` FOREIGN KEY (`id_product`) REFERENCES `delta__product` (`id_product`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__product_to_directory`
--
ALTER TABLE `delta__product_to_directory`
  ADD CONSTRAINT `to_product_prod_to_dir` FOREIGN KEY (`id_product`) REFERENCES `delta__product` (`id_product`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__props`
--
ALTER TABLE `delta__props`
  ADD CONSTRAINT `to_group_from_props` FOREIGN KEY (`id_group`) REFERENCES `delta__props_group` (`id_props_group`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__props_descr`
--
ALTER TABLE `delta__props_descr`
  ADD CONSTRAINT `to_lang_from_props_descr` FOREIGN KEY (`id_language`) REFERENCES `delta__language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_props_from_props_descr` FOREIGN KEY (`id_prop`) REFERENCES `delta__props` (`id_prop`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__props_group_descr`
--
ALTER TABLE `delta__props_group_descr`
  ADD CONSTRAINT `to_group` FOREIGN KEY (`id_props_group`) REFERENCES `delta__props_group` (`id_props_group`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_lang` FOREIGN KEY (`id_language`) REFERENCES `delta__language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `delta__props_to_product`
--
ALTER TABLE `delta__props_to_product`
  ADD CONSTRAINT `to_product_from_props_keys` FOREIGN KEY (`id_product`) REFERENCES `delta__product` (`id_product`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `to_prop_from_props_keys` FOREIGN KEY (`id_prop`) REFERENCES `delta__props` (`id_prop`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
