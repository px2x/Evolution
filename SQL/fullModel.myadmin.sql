-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 27 2018 г., 20:17
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
  `id_language` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delta__product_description`
--

INSERT INTO `delta__product_description` (`id_product`, `name`, `intro`, `id_language`) VALUES
(1, 'Кабель D-SUB', 'Позолоченные контакты', 1),
(1, 'd-sub cable', 'gold', 2);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `deltaevo`.`v_product_all_field`  AS  select `p`.`id_product` AS `id_product`,`p`.`alias` AS `alias`,`pd`.`name` AS `name`,`pd`.`intro` AS `intro`,`pd`.`id_language` AS `id_language`,`po`.`visible` AS `visible`,`po`.`searchable` AS `searchable`,`po`.`deleted` AS `deleted`,`po`.`state_stock` AS `state_stock`,`po`.`counter_visible` AS `counter_visible`,`po`.`create_date` AS `create_date`,`po`.`update_date` AS `update_date`,`pdir`.`id_sc` AS `parent` from (((`deltaevo`.`delta__product` `p` join `deltaevo`.`delta__product_description` `pd` on((`p`.`id_product` = `pd`.`id_product`))) join `deltaevo`.`delta__product_options` `po` on((`p`.`id_product` = `po`.`id_product`))) join `deltaevo`.`delta__product_to_directory` `pdir` on((`p`.`id_product` = `pdir`.`id_product`))) ;

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
-- Индексы таблицы `delta__language`
--
ALTER TABLE `delta__language`
  ADD PRIMARY KEY (`id_language`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_name` (`name`);

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
-- AUTO_INCREMENT для таблицы `delta__language`
--
ALTER TABLE `delta__language`
  MODIFY `id_language` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `delta__product`
--
ALTER TABLE `delta__product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
