-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 28 2017 г., 12:32
-- Версия сервера: 5.7.20-0ubuntu0.16.04.1
-- Версия PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `outstyle`
--

-- --------------------------------------------------------

--
-- Структура таблицы `z_attachments`
--

CREATE TABLE `z_attachments` (
  `id` int(11) NOT NULL,
  `elem_id` int(11) UNSIGNED NOT NULL,
  `attachment_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `elem_type` int(11) NOT NULL,
  `attachment_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_attachments`
--

INSERT INTO `z_attachments` (`id`, `elem_id`, `attachment_id`, `user_id`, `elem_type`, `attachment_type`) VALUES
(7, 1198, 2, 14, 5, 8),
(8, 1198, 3, 14, 5, 8),
(9, 1199, 2, 14, 5, 8),
(10, 1199, 3, 14, 5, 8),
(11, 1200, 2, 14, 5, 8),
(12, 1200, 3, 14, 5, 8),
(13, 1201, 2, 14, 5, 8),
(14, 1201, 3, 14, 5, 8),
(15, 1215, 33, 14, 5, 8),
(16, 1216, 2, 14, 5, 8),
(17, 1217, 3, 14, 5, 8),
(18, 1218, 2, 14, 5, 8),
(19, 1220, 33, 14, 5, 8),
(20, 1221, 3, 14, 5, 8),
(21, 1222, 4, 14, 5, 8),
(22, 1223, 2, 14, 5, 8),
(23, 1224, 50, 14, 5, 8),
(24, 1225, 37, 14, 5, 8),
(25, 1226, 37, 14, 5, 8),
(26, 1227, 2, 14, 5, 8),
(27, 1228, 3, 14, 5, 8),
(28, 1229, 50, 14, 5, 8),
(29, 1230, 33, 14, 5, 8),
(30, 1231, 56, 14, 5, 8),
(31, 1232, 4, 14, 5, 8),
(32, 1233, 50, 14, 5, 8),
(33, 1234, 4, 14, 5, 8),
(34, 1234, 37, 14, 5, 8),
(35, 1235, 50, 14, 5, 8),
(36, 1236, 33, 14, 5, 8),
(37, 1237, 37, 14, 5, 8),
(38, 1238, 50, 14, 5, 8),
(39, 1238, 3, 14, 5, 8),
(40, 1239, 56, 14, 5, 8),
(41, 1239, 33, 14, 5, 8),
(42, 1240, 3, 14, 5, 8),
(43, 1241, 33, 14, 5, 8),
(44, 1241, 3, 14, 5, 8),
(45, 1242, 2, 14, 5, 8),
(46, 1242, 4, 14, 5, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `z_auth_assignment`
--

CREATE TABLE `z_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_auth_assignment`
--

INSERT INTO `z_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '101', 1493136013),
('mainadmin', '101', 1493136013),
('mainadmin', '14', 1447081076),
('moderator', '101', 1493136013),
('moderator', '103', 1493992344),
('moderator', '104', 1493992688),
('redactor', '101', 1493136013),
('redactor', '102', 1493894574),
('redactor', '103', 1493992344),
('redactor', '104', 1493992688);

-- --------------------------------------------------------

--
-- Структура таблицы `z_auth_item`
--

CREATE TABLE `z_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_auth_item`
--

INSERT INTO `z_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Администратор', NULL, NULL, 1446548731, 1453378147),
('article/create', 2, 'создание статьи', NULL, NULL, 1453087789, 1454514368),
('article/delete', 2, 'Удаление статьи', NULL, NULL, 1453087918, 1453087918),
('article/index', 2, 'Каталог статей', NULL, NULL, 1446551900, 1453087689),
('article/update', 2, 'Редактировать статью', NULL, NULL, 1453087841, 1453087841),
('article/view', 2, 'Одна статья', NULL, NULL, 1453087735, 1453087750),
('category', 2, 'Редактирование категорий', NULL, NULL, 1481256665, 1481256665),
('comments/delete', 2, 'Удаление комментария', NULL, NULL, 1479688811, 1479688811),
('debug', 2, 'Показывать панель дебаггера', NULL, NULL, 1476303175, 1476303289),
('elfinder', 2, 'Загрузка файлов в редактор', NULL, NULL, 1501581988, 1501582008),
('events/create', 2, 'создание события', NULL, NULL, 1453088151, 1453088151),
('events/delete', 2, 'удаление события', NULL, NULL, 1453088116, 1453088116),
('events/index', 2, 'Каталог событий', NULL, NULL, 1453088032, 1453088032),
('events/update', 2, 'Редактирование события', NULL, NULL, 1453088084, 1453088084),
('events/view', 2, 'Просмотр события', NULL, NULL, 1453088060, 1453088060),
('mainadmin', 1, 'Главный администратор', NULL, NULL, 1446548693, 1501582046),
('moderator', 1, 'Модератор', NULL, NULL, 1446548766, 1453378200),
('news/create', 2, 'создание новости', NULL, NULL, 1453045725, 1453045725),
('news/delete', 2, 'удаление новости', NULL, NULL, 1453086981, 1453087001),
('news/index', 2, 'Управление новостями', NULL, NULL, 1446551839, 1453047837),
('news/update', 2, 'редактировать новость', NULL, NULL, 1453086913, 1453086913),
('news/view', 2, 'просмотр одной новости', NULL, NULL, 1453086867, 1453087469),
('permit', 2, 'Управление правами и ролями', NULL, NULL, 1446551768, 1446551768),
('photo', 2, 'Управление фотографиями', NULL, NULL, 1490179023, 1490179491),
('photoalbum/create', 2, 'Создание фотоальбома', NULL, NULL, 1489289325, 1489289325),
('photoalbum/delete', 2, 'Удаление фотоальбома', NULL, NULL, 1489292591, 1489292591),
('photoalbum/index', 2, 'Просмотр фотоальбомов', NULL, NULL, 1488730317, 1488730317),
('photoalbum/update', 2, 'редактирование фотоальбома', NULL, NULL, 1488731908, 1488731920),
('photoalbum/view', 2, 'Просмотр фотоальбомов', NULL, NULL, 1489164833, 1489164833),
('redactor', 1, 'Редактор', NULL, NULL, 1446548794, 1453378212),
('school/city', 2, 'управление городами', NULL, NULL, 1453378091, 1453378091),
('school/create', 2, 'Создание школ', NULL, NULL, 1447077901, 1447077901),
('school/delete', 2, 'Удаление школ', NULL, NULL, 1453088427, 1453088427),
('school/index', 2, 'Каталог школ', NULL, NULL, 1453088329, 1453088329),
('school/update', 2, 'Редактирование школ', NULL, NULL, 1453088398, 1453088398),
('school/view', 2, 'Одна школа', NULL, NULL, 1453088349, 1453088349),
('site', 2, 'Панель администратора', NULL, NULL, 1446550684, 1446550684),
('user', 2, 'Раздел пользователи(админка)', NULL, NULL, 1446551259, 1446551259);

-- --------------------------------------------------------

--
-- Структура таблицы `z_auth_item_child`
--

CREATE TABLE `z_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_auth_item_child`
--

INSERT INTO `z_auth_item_child` (`parent`, `child`) VALUES
('admin', 'article/create'),
('mainadmin', 'article/create'),
('moderator', 'article/create'),
('redactor', 'article/create'),
('admin', 'article/delete'),
('mainadmin', 'article/delete'),
('moderator', 'article/delete'),
('admin', 'article/index'),
('mainadmin', 'article/index'),
('moderator', 'article/index'),
('redactor', 'article/index'),
('admin', 'article/update'),
('mainadmin', 'article/update'),
('moderator', 'article/update'),
('redactor', 'article/update'),
('admin', 'article/view'),
('mainadmin', 'article/view'),
('moderator', 'article/view'),
('redactor', 'article/view'),
('mainadmin', 'category'),
('mainadmin', 'comments/delete'),
('mainadmin', 'debug'),
('mainadmin', 'elfinder'),
('admin', 'events/create'),
('mainadmin', 'events/create'),
('moderator', 'events/create'),
('redactor', 'events/create'),
('admin', 'events/delete'),
('mainadmin', 'events/delete'),
('moderator', 'events/delete'),
('admin', 'events/index'),
('mainadmin', 'events/index'),
('moderator', 'events/index'),
('redactor', 'events/index'),
('admin', 'events/update'),
('mainadmin', 'events/update'),
('moderator', 'events/update'),
('redactor', 'events/update'),
('admin', 'events/view'),
('mainadmin', 'events/view'),
('moderator', 'events/view'),
('redactor', 'events/view'),
('admin', 'news/create'),
('mainadmin', 'news/create'),
('moderator', 'news/create'),
('redactor', 'news/create'),
('admin', 'news/delete'),
('mainadmin', 'news/delete'),
('moderator', 'news/delete'),
('admin', 'news/index'),
('mainadmin', 'news/index'),
('moderator', 'news/index'),
('redactor', 'news/index'),
('admin', 'news/update'),
('mainadmin', 'news/update'),
('moderator', 'news/update'),
('redactor', 'news/update'),
('admin', 'news/view'),
('mainadmin', 'news/view'),
('moderator', 'news/view'),
('redactor', 'news/view'),
('mainadmin', 'permit'),
('mainadmin', 'photo'),
('mainadmin', 'photoalbum/create'),
('mainadmin', 'photoalbum/delete'),
('mainadmin', 'photoalbum/index'),
('mainadmin', 'photoalbum/update'),
('mainadmin', 'photoalbum/view'),
('admin', 'school/city'),
('mainadmin', 'school/city'),
('moderator', 'school/city'),
('redactor', 'school/city'),
('admin', 'school/create'),
('mainadmin', 'school/create'),
('moderator', 'school/create'),
('redactor', 'school/create'),
('admin', 'school/delete'),
('mainadmin', 'school/delete'),
('moderator', 'school/delete'),
('admin', 'school/index'),
('mainadmin', 'school/index'),
('moderator', 'school/index'),
('redactor', 'school/index'),
('admin', 'school/update'),
('mainadmin', 'school/update'),
('moderator', 'school/update'),
('redactor', 'school/update'),
('admin', 'school/view'),
('mainadmin', 'school/view'),
('moderator', 'school/view'),
('redactor', 'school/view'),
('admin', 'site'),
('mainadmin', 'site'),
('moderator', 'site'),
('redactor', 'site'),
('mainadmin', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `z_auth_misstep`
--

CREATE TABLE `z_auth_misstep` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `attempt` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_auth_misstep`
--

INSERT INTO `z_auth_misstep` (`id`, `ip`, `attempt`, `created`) VALUES
(7, '80.15.215.199', 6, 0),
(12, '176.122.100.34', 1, 0),
(17, '93.174.53.155', 3, 0),
(18, '136.169.8.41', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `z_auth_rule`
--

CREATE TABLE `z_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `z_blacklist`
--

CREATE TABLE `z_blacklist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `blacklisted_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `z_board`
--

CREATE TABLE `z_board` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `owner` int(11) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text COLLATE utf8_unicode_ci,
  `photo` bigint(20) NOT NULL DEFAULT '0',
  `notice` bigint(20) NOT NULL DEFAULT '0',
  `repost` int(11) DEFAULT NULL,
  `repost_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_board`
--

INSERT INTO `z_board` (`id`, `user`, `owner`, `created`, `text`, `photo`, `notice`, `repost`, `repost_type`) VALUES
(1, 5, 1, '2015-05-13 11:14:02', 'Привет', 0, 0, NULL, NULL),
(2, 5, 7, '2015-05-13 11:14:24', 'Привет', 0, 0, NULL, NULL),
(3, 8, 8, '2015-05-13 14:04:51', 'всем привет', 0, 0, NULL, NULL),
(4, 8, 5, '2015-05-15 15:12:23', 'Дарова', 0, 0, NULL, NULL),
(5, 9, 9, '2015-05-17 14:43:44', 'Первое сообщение', 0, 0, NULL, NULL),
(6, 9, 9, '2015-05-17 16:30:38', 'фівафівафі', 0, 0, NULL, NULL),
(7, 9, 5, '2015-05-19 12:25:53', 'раз -два', 0, 0, NULL, NULL),
(8, 15, 13, '2015-08-13 09:25:15', 'Доска-плоска', 0, 0, NULL, NULL),
(9, 15, 13, '2015-08-13 13:14:39', 'привет', 0, 0, NULL, NULL),
(24, 13, 14, '2015-11-16 08:14:36', 'Ченьж произошел )', 0, 0, NULL, NULL),
(25, 15, 13, '2015-08-20 14:36:04', 'Тест', 0, 0, NULL, NULL),
(26, 15, 13, '2015-08-20 14:39:54', 'Привет', 0, 0, NULL, NULL),
(27, 13, 13, '2015-08-20 14:40:25', 'привет', 0, 0, NULL, NULL),
(28, 15, 15, '2015-08-20 14:43:46', 'Привет и от меня', 0, 0, NULL, NULL),
(29, 14, 13, '2015-08-20 14:45:06', 'they were asked to keep a diary and record everything they ate or drank', 0, 0, NULL, NULL),
(30, 13, 13, '2015-08-20 19:53:10', 'И у меня есть стена', 0, 0, NULL, NULL),
(31, 13, 15, '2015-08-20 19:54:18', 'Вітаю! :)', 0, 0, NULL, NULL),
(33, 13, 13, '2015-08-20 19:58:55', 'Буду во многом прав, если скажу, что рэп это по большей части чистое бахвальство и понты. Есть в нём элементы протеста как в роке, но рок всё-таки это в основном протест, а рэп больше акцентирует на понт и угрозы. Тяжело представить хип-хоп и без соревновательного элемента', 0, 0, NULL, NULL),
(36, 14, 13, '2015-08-21 08:55:27', 'Привет, чувак!', 0, 0, NULL, NULL),
(37, 14, 13, '2015-08-22 08:21:41', 'Привет', 0, 0, NULL, NULL),
(38, 15, 13, '2015-08-24 10:39:02', 'Пливет', 0, 0, NULL, NULL),
(41, 14, 14, '2015-09-25 14:01:06', 'Привет', 0, 0, NULL, NULL),
(42, 5, 5, '2015-09-28 09:17:59', 'Привет', 0, 0, NULL, NULL),
(43, 18, 18, '2015-09-28 09:18:57', 'dasdadasd', 0, 0, NULL, NULL),
(44, 9, 9, '2015-09-28 14:44:49', 'думаю, чего бы тут такого написать', 0, 0, NULL, NULL),
(45, 9, 9, '2015-09-28 14:49:39', 'тест для Димы', 0, 0, NULL, NULL),
(46, 9, 9, '2015-09-28 14:49:44', 'вафыва', 0, 0, NULL, NULL),
(47, 9, 9, '2015-09-28 14:50:03', 'авввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф вафавввввввввввввввввввв ыфваф вафвы фав фыва фвыа фываф ываф ваф', 0, 0, NULL, NULL),
(48, 22, 22, '2015-09-29 12:14:49', 'Первая запись', 0, 0, NULL, NULL),
(66, 24, 24, '2015-12-09 12:18:28', 'Привет', 0, 0, NULL, NULL),
(67, 24, 24, '2015-12-09 12:53:27', '', 0, 0, NULL, NULL),
(68, 24, 24, '2015-12-09 12:53:35', '', 0, 0, NULL, NULL),
(78, 26, 25, '2015-12-10 13:06:56', 'ку - ку епта', 0, 0, NULL, NULL),
(79, 25, 25, '2015-12-13 11:25:51', 'Теперь моя:)', 0, 0, NULL, NULL),
(81, 6, 14, '2015-12-10 18:29:32', 'Здоров Петров', 0, 0, NULL, NULL),
(84, 25, 25, '2015-12-13 11:25:40', 'Есть кто тут?', 0, 0, NULL, NULL),
(87, 25, 27, '2015-12-13 11:29:11', 'О ежиках', 0, 0, NULL, NULL),
(88, 27, 25, '2015-12-13 11:29:31', 'ку', 0, 0, NULL, NULL),
(107, 30, 25, '2016-01-09 08:58:52', 'ky', 0, 0, NULL, NULL),
(110, 31, 31, '2016-01-12 08:38:27', '', 0, 0, NULL, NULL),
(111, 31, 31, '2016-01-12 08:39:28', '', 0, 0, NULL, NULL),
(112, 31, 31, '2016-01-12 08:39:57', '', 0, 0, NULL, NULL),
(113, 31, 31, '2016-01-12 08:41:07', '', 0, 0, NULL, NULL),
(114, 31, 31, '2016-01-12 08:42:22', '', 0, 0, NULL, NULL),
(115, 31, 31, '2016-01-12 08:47:06', 'Опять холодно, когда уже потеплеет?', 0, 0, NULL, NULL),
(116, 32, 32, '2016-01-12 09:00:59', '', 0, 0, NULL, NULL),
(117, 32, 32, '2016-01-12 09:01:31', '', 0, 0, NULL, NULL),
(118, 32, 32, '2016-01-12 09:02:16', '', 0, 0, NULL, NULL),
(119, 32, 32, '2016-01-12 09:02:45', '', 0, 0, NULL, NULL),
(120, 32, 32, '2016-01-12 09:03:31', '', 0, 0, NULL, NULL),
(121, 32, 32, '2016-01-12 09:58:24', 'Вот это от круто!', 0, 0, NULL, NULL),
(122, 32, 32, '2016-01-12 09:59:34', 'Добавляйтесь в друзья', 0, 0, NULL, NULL),
(124, 32, 32, '2016-01-12 10:02:23', 'То, чему не научат Вас в школе', 0, 0, 114, 'board'),
(125, 32, 31, '2016-01-12 10:22:51', 'Дружелюбный гном?', 0, 0, NULL, NULL),
(126, 31, 13, '2016-01-12 10:34:37', 'А кто это у нас?', 0, 0, NULL, NULL),
(127, 31, 31, '2016-01-12 11:26:25', '', 0, 0, NULL, NULL),
(128, 31, 31, '2016-01-12 11:41:32', '', 0, 0, NULL, NULL),
(159, 25, 25, '2016-01-14 13:07:31', 'А кто это у нас?', 0, 0, 126, 'board'),
(162, 13, 13, '2016-01-15 07:24:00', '', 0, 0, NULL, NULL),
(165, 35, 35, '2016-01-17 10:28:27', 'o vysokom', 0, 0, NULL, NULL),
(167, 14, 14, '2016-01-17 12:02:10', 'sdsd', 0, 0, NULL, NULL),
(168, 14, 14, '2016-01-17 12:01:50', 'Фреймворки', 0, 0, 127, 'board'),
(169, 14, 14, '2016-01-17 13:32:59', '11', 0, 0, NULL, NULL),
(170, 14, 14, '2016-01-17 14:12:30', 'wsfwef', 0, 0, NULL, NULL),
(171, 34, 34, '2016-01-17 20:46:40', 'sdsd', 0, 0, NULL, NULL),
(172, 34, 34, '2016-01-17 21:33:27', '1', 0, 0, NULL, NULL),
(173, 36, 36, '2016-01-17 22:19:01', 'JJJ?????', 0, 0, NULL, NULL),
(174, 36, 36, '2016-01-17 22:46:05', 'О жизни!', 0, 0, NULL, NULL),
(175, 36, 36, '2016-01-17 22:58:47', '', 0, 0, NULL, NULL),
(176, 14, 14, '2016-01-19 08:05:28', 'йцл3кугнпцущкшгежпйгшцукржейрцукждерйдцушгкардшцугкрадшйгцукрдешйгцукрешдгйцрукдешгпрйцудкнпиадуцлнкпидйнпуцкещйшцдпрцфрудшкгеардшцйгфупкеашдцгукрпадшыиапывриапдрицл3укгшщепйшцгщапцнукапщзугпрзцушйгкетдцуке', 0, 0, NULL, NULL),
(177, 14, 14, '2016-01-17 23:10:49', '', 0, 0, NULL, NULL),
(178, 14, 14, '2016-01-18 00:33:54', 'шщкпомз9гц45праг45рпт45гпртщг4прмт24гпару7834гран7е3артн74ргшптоацне7рг45а745грпта47нергато45п97р4г25шптт4958гцрптшо245нп7рг24шщ5тп4589гпрто425пгр4258пгр425тпа9428гпршг', 0, 0, NULL, NULL),
(181, 14, 14, '2016-01-18 11:55:27', '', 0, 0, NULL, NULL),
(182, 33, 33, '2016-01-18 12:02:23', 'текст текст', 0, 0, NULL, NULL),
(183, 33, 33, '2016-02-02 18:57:53', 'привет', 0, 0, NULL, NULL),
(185, 33, 33, '2016-02-02 18:58:10', 'привет привет', 0, 0, NULL, NULL),
(186, 33, 33, '2016-01-19 12:45:12', '', 0, 0, NULL, NULL),
(188, 33, 33, '2016-01-20 11:45:28', 'Вопросы психологии долгое время рассматривались в рамках философии. Только в середине XIX века психология стала самостоятельной наукой. Но отделившись от философии, она продолжает сохранять тесную связь с ней. В настоящее время существуют научные проблемы, которые изучаются как психологией, так и философией. К числу таких проблем относятся понятия личностного смысла, цели жизни, мировоззрение, политические взгляды, моральные ценности и другое. Психология использует экспериментальные методы для проверки гипотез. Однако есть вопросы, которые невозможно решить экспериментальным путём. В таких случаях психологи могут обращаться к философии. К числу философско-психологических проблем относятся проблемы сущности и происхождения человеческого сознания, природы высших форм человеческого мышления, влияние общества на личность и личность на общество', 0, 0, 187, 'board'),
(189, 33, 33, '2016-01-21 05:01:54', 'Шварц у Вани', 0, 0, 118, 'board'),
(197, 33, 33, '2016-01-21 12:50:21', 'тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест', 0, 0, NULL, NULL),
(198, 33, 33, '2016-01-21 13:15:22', 'тест тест тест тест тест тесттест тест тесттест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тесттест тест тест тест тест тест тест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тест', 0, 0, NULL, NULL),
(199, 32, 33, '2016-01-21 13:15:33', 'тест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тест', 0, 0, NULL, NULL),
(202, 14, 14, '2016-01-22 09:21:12', 'qwq', 0, 0, NULL, NULL),
(203, 35, 14, '2016-01-22 09:22:18', 'sds', 0, 0, NULL, NULL),
(204, 35, 14, '2016-01-22 09:22:27', 'sd', 0, 0, NULL, NULL),
(207, 33, 33, '2016-01-31 22:33:42', 'мапуквимук', 0, 0, NULL, NULL),
(209, 13, 34, '2016-01-22 10:42:05', 'ывывывы', 0, 0, NULL, NULL),
(211, 34, 34, '2016-01-22 11:06:35', 'sdsds', 0, 0, NULL, NULL),
(212, 34, 34, '2016-01-22 11:06:36', 'dsasd', 0, 0, NULL, NULL),
(213, 34, 34, '2016-01-22 11:06:38', 'sadasdas', 0, 0, NULL, NULL),
(214, 34, 34, '2016-01-22 11:06:39', 'asdasdsad', 0, 0, NULL, NULL),
(215, 31, 13, '2016-01-22 11:07:54', 'sdsdsdsdsd', 0, 0, NULL, NULL),
(217, 13, 13, '2016-01-23 13:40:06', '', 0, 0, NULL, NULL),
(218, 13, 13, '2016-01-23 13:40:27', '', 0, 0, NULL, NULL),
(219, 31, 13, '2016-01-23 13:41:03', '', 0, 0, NULL, NULL),
(224, 39, 39, '2016-01-28 10:29:25', 'iusdbfiusabdfiubsadfigbasdfasdfasdffasdf', 0, 0, NULL, NULL),
(225, 33, 33, '2016-01-31 22:39:13', '', 0, 0, NULL, NULL),
(233, 33, 33, '2016-02-02 18:56:13', 'Привет приветПривет привет Привет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет приветПривет привет', 0, 0, NULL, NULL),
(235, 33, 33, '2016-02-02 18:57:14', '', 0, 0, NULL, NULL),
(236, 33, 33, '2016-02-02 18:57:25', '', 0, 0, NULL, NULL),
(237, 33, 33, '2016-02-02 19:01:20', '', 0, 0, NULL, NULL),
(238, 33, 33, '2016-02-02 19:01:45', '', 0, 0, NULL, NULL),
(239, 33, 33, '2016-02-02 19:58:08', '', 0, 0, NULL, NULL),
(245, 33, 33, '2016-02-04 21:39:37', '', 0, 0, NULL, NULL),
(247, 33, 33, '2016-02-08 22:18:26', '', 0, 0, 243, 'board'),
(248, 33, 33, '2016-02-08 22:18:58', 'wet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrtt', 0, 0, 228, 'board'),
(256, 13, 13, '2016-02-09 10:03:24', '', 0, 0, NULL, NULL),
(257, 33, 14, '2016-02-10 11:07:00', 'sdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfg', 0, 0, NULL, NULL),
(258, 33, 14, '2016-02-10 11:07:08', 'sdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfg', 0, 0, NULL, NULL),
(259, 33, 14, '2016-02-10 11:07:19', 'sdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfg', 0, 0, NULL, NULL),
(260, 33, 14, '2016-02-10 11:43:24', 'swrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrty', 0, 0, NULL, NULL),
(261, 33, 14, '2016-02-10 11:44:39', 'messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage', 0, 0, NULL, NULL),
(262, 33, 14, '2016-02-10 11:44:44', 'messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage', 0, 0, NULL, NULL),
(263, 33, 14, '2016-02-10 11:48:27', 'textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();textareaInit();', 0, 0, NULL, NULL),
(264, 33, 14, '2016-02-10 13:44:20', 'akusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgv', 0, 0, NULL, NULL),
(275, 48, 13, '2016-02-18 20:37:42', 'fifa', 0, 0, NULL, NULL),
(292, 33, 33, '2016-03-02 19:12:25', '', 0, 0, NULL, NULL),
(293, 33, 33, '2016-03-02 19:12:48', '', 0, 0, NULL, NULL),
(294, 33, 33, '2016-03-02 20:10:43', 'оп', 0, 0, NULL, NULL),
(295, 33, 33, '2016-03-02 20:26:30', 'птокелтикоелтижк', 0, 0, NULL, NULL),
(296, 33, 33, '2016-03-02 20:13:11', 'вюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоаривюаллмтяватмпдвяыапявыоари', 0, 0, 273, 'board'),
(297, 33, 33, '2016-03-02 20:27:51', 'запись', 0, 0, NULL, NULL),
(298, 33, 33, '2016-03-02 20:29:59', 'текст', 0, 0, NULL, NULL),
(299, 33, 33, '2016-03-16 03:47:56', 'привет', 0, 0, NULL, NULL),
(300, 14, 14, '2016-03-16 13:13:55', '', 0, 0, NULL, NULL),
(301, 33, 33, '2016-03-16 14:57:09', 'привет', 0, 0, NULL, NULL),
(308, 33, 33, '2016-03-17 14:15:43', 'привет привет', 0, 0, NULL, NULL),
(309, 33, 33, '2016-03-17 14:16:03', '[проверить] на любой стене, когда кликаем по нику другого пользователя, то просто обновляется страница, а по аватару, переходит на страницу того пользователя, по кому кликнули - а должно и по нику, и по аватару\n[проверить] на любой стене, когда кликаем по нику другого пользователя, то просто обновляется страница, а по аватару, переходит на страницу того пользователя, по кому кликнули - а должно и по нику, и по аватару', 0, 0, NULL, NULL),
(312, 33, 33, '2016-03-17 15:03:50', 'привет', 0, 0, NULL, NULL),
(320, 33, 33, '2016-03-18 11:53:41', 'привте', 0, 0, NULL, NULL),
(323, 33, 33, '2016-03-18 12:34:29', '', 0, 0, NULL, NULL),
(326, 14, 14, '2016-03-21 14:56:52', '', 0, 0, NULL, NULL),
(343, 33, 33, '2016-03-22 07:46:33', 'привет', 0, 0, NULL, NULL),
(361, 33, 33, '2016-03-22 17:56:48', 'привет', 0, 0, NULL, NULL),
(362, 33, 33, '2016-03-22 17:57:02', 'хоп хоп опа', 0, 0, NULL, NULL),
(365, 33, 33, '2016-03-22 17:58:26', 'привет', 0, 0, NULL, NULL),
(366, 33, 33, '2016-03-22 17:58:32', 'привет', 0, 0, NULL, NULL),
(378, 33, 14, '2016-03-25 07:46:22', 'вфыафыва', 0, 0, NULL, NULL),
(379, 33, 14, '2016-03-25 07:46:44', 'фафыа', 0, 0, NULL, NULL),
(381, 14, 14, '2016-03-25 07:51:53', '', 0, 0, NULL, NULL),
(382, 14, 14, '2016-03-25 07:58:35', '', 0, 0, NULL, NULL),
(383, 14, 14, '2016-03-25 08:00:42', '', 0, 0, NULL, NULL),
(388, 33, 33, '2016-03-25 16:17:32', 'привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста привет много текста', 0, 0, NULL, NULL),
(389, 33, 33, '2016-03-25 16:19:03', 'привет', 0, 0, NULL, NULL),
(391, 33, 33, '2016-03-25 16:19:21', '', 0, 0, 385, 'board'),
(392, 33, 33, '2016-03-25 16:20:36', '', 0, 0, NULL, NULL),
(393, 33, 33, '2016-03-25 16:20:55', '', 0, 0, NULL, NULL),
(394, 33, 33, '2016-03-25 16:22:46', '', 0, 0, 383, 'board'),
(416, 33, 33, '2016-03-28 22:16:03', '', 0, 0, NULL, NULL),
(417, 33, 33, '2016-03-28 22:19:09', '', 0, 0, NULL, NULL),
(418, 33, 33, '2016-03-28 22:20:03', 'впвупкук', 0, 0, 380, 'board'),
(421, 33, 33, '2016-03-29 15:53:27', '', 0, 0, NULL, NULL),
(426, 33, 33, '2016-03-31 10:49:14', '', 0, 0, NULL, NULL),
(427, 33, 33, '2016-03-31 12:39:53', 'много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает', 0, 0, NULL, NULL),
(432, 33, 33, '2016-03-31 14:30:12', 'много текста', 0, 0, NULL, NULL),
(437, 33, 33, '2016-04-01 06:17:12', '', 0, 0, NULL, NULL),
(438, 33, 33, '2016-04-01 06:17:15', 'привет', 0, 0, NULL, NULL),
(439, 33, 33, '2016-04-01 06:17:20', 'оп', 0, 0, NULL, NULL),
(440, 33, 33, '2016-04-01 06:17:38', 'оп', 0, 0, NULL, NULL),
(441, 33, 33, '2016-04-01 06:17:41', 'оп', 0, 0, NULL, NULL),
(442, 33, 33, '2016-04-01 12:19:14', '', 0, 0, NULL, NULL),
(443, 33, 33, '2016-04-01 12:19:18', 'опа', 0, 0, NULL, NULL),
(444, 33, 33, '2016-04-01 12:24:08', 'привет \n\n\n\nпривет', 0, 0, NULL, NULL),
(448, 33, 33, '2016-04-01 13:30:08', 'привет \n\n\n\n\nпривет', 0, 0, NULL, NULL),
(449, 33, 33, '2016-04-01 13:30:21', 'привет', 0, 0, NULL, NULL),
(450, 33, 33, '2016-04-01 13:30:52', 'привет приве привет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет привепривет приве', 0, 0, NULL, NULL),
(451, 33, 33, '2016-04-01 13:31:14', 'привет приветприветприветприветпривет привет приветприветприветприветпривет привет приветприветприветприветпривет привет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветпривет', 0, 0, NULL, NULL),
(453, 33, 33, '2016-04-04 16:25:18', 'привет привет привет', 0, 0, NULL, NULL),
(458, 33, 33, '2016-04-04 17:17:00', 'привте', 0, 0, NULL, NULL),
(464, 75, 75, '2016-04-07 05:53:27', 'Новаторский характер носит космология Николая Кузанского, изложенная в трактате Об учёном незнании. Он предполагал материальное единство Вселенной и считал Землю одной из планет, также совершающей движение; небесные тела населены, как и наша Земля, причём каждый наблюдатель во Вселенной с равным основанием может считать себя неподвижным. По его мнению, Вселенная безгранична, но конечна, поскольку бесконечность может быть свойственна одному только Богу. Вместе с тем, у Кузанца сохраняются многие элементы средневековой космологии, в том числе вера в существование небесных сфер, включая внешнюю из них — сферу неподвижных звёзд. Однако эти «сферы» не являются абсолютно круглыми, их вращение не является равномерным, оси вращения не занимают фиксированного положения в пространстве. Вследствие этого у мира нет абсолютного центра и чёткой границы (вероятно, именно в этом смысле нужно понимать тезис Кузанца о безграничности Вселенной)[6].\n\nПервая половина XVI века отмечена появлением новой, гелиоцентрической системы мира Николая Коперника. В центр мира Коперник поместил Солнце, вокруг которого вращались планеты (в числе которых и Земля, совершавшая к тому же ещё и вращение вокруг оси). Вселенную Коперник по-прежнему считал ограниченной сферой неподвижных звёзд; по-видимому, сохранялась у него и вера в существование небесных сфер[7].\n\nМодификацией системы Коперника была система Томаса Диггеса, в которой звёзды располагаются не на одной сфере, а на различных расстояниях от Земли до бесконечности. Некоторые философы (Франческо Патрици, Ян Ессенский) заимствовали только один элемент учения Коперника — вращение Земли вокруг оси, также считая звёзды разбросанными во Вселенной до бесконечности. Воззрения этих мыслителей несут на себе следы влияния герметизма, поскольку область Вселенной за пределами Солнечной системы считалась ими нематериальным миром, местом обитания Бога и ангелов[8][9][10].\n\nРешительный шаг от гелиоцентризма к бесконечной Вселенной, равномерно заполненной звёздами, сделал итальянский философ Джордано Бруно. Согласно Бруно, при наблюдении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и Уильям Гильберт. В середине — второй половине XVII века эти взгляды поддержали Рене Декарт, Отто фон Герике и Христиан Гюйгенс.', 0, 0, NULL, NULL),
(481, 35, 33, '2016-04-15 18:31:46', 'ыыыыыыыыыыыыыыыыыыыыыы', 0, 0, NULL, NULL),
(484, 33, 93, '2016-04-16 18:55:34', 'кккк', 0, 0, NULL, NULL),
(499, 14, 14, '2016-04-17 16:53:26', 'ввввввввввввввввввввв', 0, 0, NULL, NULL),
(500, 33, 33, '2016-04-18 06:44:00', '', 0, 0, NULL, NULL),
(501, 82, 82, '2016-04-18 21:35:20', 'еуеыав', 0, 0, NULL, NULL),
(507, 14, 14, '2016-04-21 19:16:09', 'wwwwwwwwwwwwwwwwwwwwww', 0, 0, NULL, NULL),
(512, 14, 14, '2016-04-22 17:10:48', 'оооооооооооо', 0, 0, NULL, NULL),
(519, 14, 14, '2016-04-27 19:17:41', 'aaaaaaaaaaaaaaaaaaaaaaaa', 0, 0, NULL, NULL),
(520, 14, 14, '2016-04-27 22:06:08', '', 0, 0, NULL, NULL),
(528, 14, 33, '2016-04-28 10:20:26', 'привет', 0, 0, NULL, NULL),
(529, 14, 14, '2016-04-28 12:33:58', 'ааааа', 0, 0, NULL, NULL),
(530, 33, 14, '2016-04-28 12:34:12', 'ааааа', 0, 0, NULL, NULL),
(531, 38, 14, '2016-04-28 14:16:46', 'ccccccccccc', 0, 0, NULL, NULL),
(532, 14, 14, '2016-04-28 14:20:51', 'фывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в рфывп фукп фук укр в р', 0, 0, 0, ''),
(533, 14, 14, '2016-04-28 14:42:51', '', 0, 0, 0, ''),
(534, 33, 33, '2016-04-28 14:43:16', 'раз два', 0, 0, NULL, NULL),
(538, 14, 14, '2016-04-28 15:17:45', 'zfd gfd gdf hfd', 0, 0, 0, ''),
(539, 14, 14, '2016-04-28 15:18:33', '', 0, 0, 500, 'board'),
(542, 14, 14, '2016-04-28 15:35:53', '2222222222222222222222', 0, 0, 0, ''),
(544, 14, 14, '2016-05-03 19:22:47', 'отличная запись, еще и фото добавил', 0, 0, 0, ''),
(546, 14, 14, '2016-05-04 05:04:26', 'ddddddddddddddddddddd', 0, 0, NULL, NULL),
(548, 14, 14, '2016-05-04 14:33:53', 'asdg sdg df dsfh fh fgh', 0, 0, NULL, NULL),
(558, 93, 93, '2016-05-04 20:08:34', 'вввввввввввввввввв', 0, 0, NULL, NULL),
(559, 93, 93, '2016-05-04 20:14:01', 'ddddddddddddddddddddd', 0, 0, 546, 'board'),
(560, 93, 33, '2016-05-04 21:37:13', 'вот сейчас и проверим', 0, 0, NULL, NULL),
(561, 93, 33, '2016-05-04 21:37:21', '', 0, 0, NULL, NULL),
(562, 14, 33, '2016-05-04 21:38:57', '', 0, 0, NULL, NULL),
(564, 14, 14, '2016-05-05 13:13:29', 'asdfasdf', 0, 0, NULL, NULL),
(565, 14, 14, '2016-05-05 13:13:38', 'asdfasfd', 0, 0, NULL, NULL),
(566, 33, 14, '2016-05-05 13:19:13', 'asdfasdf', 0, 0, NULL, NULL),
(567, 14, 14, '2016-05-05 13:20:00', 'asdfasdf', 0, 0, NULL, NULL),
(568, 33, 14, '2016-05-05 13:20:20', 'asdfasdf', 0, 0, NULL, NULL),
(569, 14, 33, '2016-05-05 13:24:02', '', 0, 0, NULL, NULL),
(571, 14, 38, '2016-05-05 13:44:41', 'hlsdglsdhlghsdgh', 0, 0, NULL, NULL),
(572, 38, 38, '2016-05-05 13:45:05', '', 0, 0, 569, 'board'),
(578, 79, 79, '2016-05-06 08:59:04', 'sdf', 0, 0, NULL, NULL),
(579, 79, 79, '2016-05-06 08:59:04', 'sdf', 0, 0, NULL, NULL),
(580, 38, 38, '2016-05-06 09:37:02', '', 0, 0, NULL, NULL),
(581, 38, 38, '2016-05-06 09:37:03', '', 0, 0, NULL, NULL),
(582, 38, 38, '2016-05-06 09:38:48', '', 0, 0, NULL, NULL),
(583, 38, 38, '2016-05-06 09:39:57', '', 0, 0, NULL, NULL),
(584, 38, 38, '2016-05-06 09:40:01', '', 0, 0, NULL, NULL),
(585, 38, 38, '2016-05-06 09:40:02', '', 0, 0, NULL, NULL),
(586, 38, 38, '2016-05-06 09:40:05', '', 0, 0, NULL, NULL),
(587, 38, 38, '2016-05-06 09:40:05', '', 0, 0, NULL, NULL),
(588, 38, 38, '2016-05-06 09:42:17', '', 0, 0, NULL, NULL),
(589, 14, 14, '2016-05-06 12:17:17', 'тест', 0, 0, NULL, NULL),
(591, 14, 38, '2016-05-06 13:44:46', 'a.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfla.zdbfzsd;kjfskdf/lsdkjflsdj;fsdjfl', 0, 0, NULL, NULL),
(592, 79, 79, '2016-05-06 14:28:38', 'тест', 0, 0, 589, 'board'),
(593, 79, 79, '2016-05-06 14:28:53', '', 0, 0, NULL, NULL),
(594, 14, 14, '2016-05-06 19:28:16', '', 0, 0, NULL, NULL),
(595, 14, 14, '2016-11-05 08:58:02', '<p>Испанские нейробиологи показали, что мозговая деятельность двух людей синхронизируется во время разговора. Они считают, что такая синхронность может оказаться ключевым фактором в понимании языка и в формировании межличностных отношений. Работа опубликована в Scientific Reports.</p>\r\n\r\n<p>Мозговая деятельность человека достаточно индивидуальна, и при этом гибка и подвержена изменениям в ответ на внешние раздражители. Известно, например, что мозговая деятельность людей, копирующих физические действия друг друга, подвержена синхронизации. Ученые решили выяснить, работают ли подобные механизмы в ходе вербальной коммуникации между людьми, не связанной с подражательной деятельностью.  В ходе своей работы ученые проанализировали 15 пар людей одного пола, которые до эксперимента друг друга не знали. Каждую пару разделял экран, и участники разговора не видели друг друга. Они задавали друг другу тридцать вопросов на пять разных тем и слушали ответы. Мозговая деятельность каждого человека измерялась с помощью методов электроэнцефалографии (ЭЭГ), в ходе которой использовали сеть из 27 на 27 электродов (всего, таким образом, состоящую из 729 электродов) и замеряли четыре основных частоты мозговой деятельности (дельта, тета, альфа и бета). В качестве контроля использовалась мозговая деятельность этих же индивидов, но вне данной беседы.  Выяснилось, что мозговая деятельность собеседников синхронизируется после начала разговора. Статистически значимая синхронизация касалась 123 электродных пар: 14 дельта, 49 тета, 28 альфа и 32 бета. При этом в ходе разных бесед синхронизируются разные электроды, поэтому общая схема оказывается достаточно индивидуальной. Таким образом, можно выяснить, что конкретные два человека разговаривают друг с другом, с помощью одной только ЭЭГ их мозговой деятельности.</p>\r\n\r\n<p>Анализ топографического распределения этих сигналов у отдельных людей показал, что данный механизм регулируется как за счет внутренних низкоуровневых процессов, возникающей вследствие восприятия речи как таковой (и собеседника, и своей собственной), так и за счет интерактивного процесса, происходящего в каждой конкретной ситуации между двумя людьми. Однако для некоторых частот, в частности, дельта и тета-частот, эти механизмы оказалось достаточно трудно разделить, поэтому возникла необходимость дополнительных экспериментов, исключающих «автонастройку» участков мозга на произвольную речь. На следующем этапе проекта исследователи исключили из анализа такие участки и показали, что синхронизация на альфа и бета частотах, по крайней мере, не является случайной и индивидуальна для каждой пары.  Ученые считают, что их исследование открывает огромные возможности для работ, касающихся психологии, социологии, психиатрии и образования. В частности, исследование влияния диалогов на мозговую деятельность и соответствующих процессов синхронизации может быть важно для помощи людям, испытывающим затруднения с коммуникацией.  А о том, как можно идентифицировать мозговую деятельность, подобно отпечаткам пальцев или об энцефалограммах, снятых в моменты «божественных откровений», вы можете почитать в других наших материалах.</p>\r\n\r\n  Источник: https://nplus1.ru/news/2017/07/21/brain-synchro', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `z_category`
--

CREATE TABLE `z_category` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `url` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_category`
--

INSERT INTO `z_category` (`id`, `name`, `url`) VALUES
(1, 'Брейкинг', 'breaking'),
(2, 'Граффити', 'graffiti'),
(3, 'Rap', 'rap'),
(4, 'Диджеинг', 'dj'),
(9, 'Битбоксинг', 'beatboxing'),
(10, 'Street Fashion', 'street-fashion'),
(11, 'Street Language', 'street-language'),
(12, 'Street Knowledge', 'street-knowledge'),
(13, 'Street Entrepreneurialism', 'street-entrepreneurialism'),
(14, 'Some testin\' name', 'a430-249-80-a-d345');

-- --------------------------------------------------------

--
-- Структура таблицы `z_comments`
--

CREATE TABLE `z_comments` (
  `id` int(11) NOT NULL,
  `elem_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elem_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_comments`
--

INSERT INTO `z_comments` (`id`, `elem_type`, `elem_id`, `user_id`, `created`, `comment`) VALUES
(2, 'board', 78, 25, '2015-12-10 15:07:32', 'фывфывфыфыыф'),
(3, 'board', 53, 14, '2015-12-10 18:48:36', 'asdsd'),
(4, 'board', 40, 14, '2015-12-10 18:49:51', 'dfsdfs'),
(5, 'board', 81, 14, '2015-12-10 20:29:54', '( .  )( .  )'),
(6, 'video', 4, 14, '2015-12-10 21:47:12', 'прикольная няша'),
(7, 'photo', 33, 14, '2015-12-10 21:47:55', 'котофей'),
(9, 'board', 78, 25, '2015-12-13 13:24:35', 'sdfsdf'),
(10, 'board', 79, 27, '2015-12-13 13:25:34', 'Я тут:)'),
(11, 'board', 79, 25, '2015-12-13 13:25:48', 'фвывыв'),
(13, 'school', 1, 13, '2015-12-21 15:14:18', 'Привет'),
(14, 'school', 3, 13, '2015-12-21 18:30:31', 'Отлично !!! Ждите'),
(15, 'school', 3, 14, '2015-12-22 06:29:13', 'ждем'),
(16, 'article', 12, 14, '2015-12-22 14:48:00', 'Мне статья понравилась '),
(17, 'school', 1, 14, '2015-12-22 14:55:55', 'Это и всё что ты думаешь  об этом?'),
(18, 'article', 12, 14, '2015-12-22 16:41:02', 'тест'),
(20, 'video', 15, 25, '2015-12-24 20:06:31', 'fdfdfdfdfd '),
(21, 'board', 101, 14, '2016-01-04 09:33:15', 'qqqq'),
(22, 'board', 102, 14, '2016-01-04 10:49:26', '2222'),
(23, 'board', 103, 14, '2016-01-04 10:50:53', 'qqqq'),
(26, 'board', 121, 32, '2016-01-12 11:58:38', 'Мне нравится'),
(27, 'board', 122, 32, '2016-01-12 12:00:13', 'У мея крутые видосики'),
(28, 'board', 115, 32, '2016-01-12 12:01:33', 'Весна близко!'),
(29, 'board', 114, 32, '2016-01-12 12:02:21', 'Это меня не учили :)'),
(30, 'board', 112, 32, '2016-01-12 12:03:06', 'Велик с квадратными колесами? Ыыыыыыыы'),
(31, 'board', 110, 32, '2016-01-12 12:03:24', 'Добро!'),
(34, 'board', 122, 31, '2016-01-12 12:21:43', 'Тупые видосы, н люблю Урганта!'),
(35, 'board', 117, 31, '2016-01-12 12:22:12', 'А вот Джекки классный!'),
(36, 'board', 117, 31, '2016-01-12 12:22:12', 'А вот Джекки классный!'),
(38, 'board', 126, 31, '2016-01-12 12:41:39', 'приветики) '),
(39, 'board', 115, 31, '2016-01-12 13:11:07', 'проверка'),
(40, 'photo', 52, 25, '2016-01-13 08:38:48', 'asdasdasdas'),
(41, 'photo', 61, 14, '2016-01-13 10:02:05', 'Крутая тачка'),
(42, 'photo', 61, 14, '2016-01-13 10:02:05', 'Крутая тачка'),
(43, 'photo', 61, 14, '2016-01-13 10:02:46', 'сдваивает коммент - - не бенч'),
(44, 'photo', 61, 14, '2016-01-13 10:02:46', 'сдваивает коммент - - не бенч'),
(46, 'article', 29, 14, '2016-01-13 10:42:10', ' укшмтушгкмт'),
(48, 'article', 29, 14, '2016-01-13 10:42:18', ' 94атм9384прагто'),
(50, 'article', 29, 14, '2016-01-13 10:44:28', ' 8ашотсг4та'),
(52, 'article', 29, 14, '2016-01-13 10:44:34', ' 48егаокм'),
(53, 'school', 15, 14, '2016-01-13 13:17:01', 'шутлва'),
(54, 'school', 15, 14, '2016-01-13 13:17:04', ' упмукмукм'),
(55, 'school', 15, 14, '2016-01-13 13:17:08', ' мумтуолк'),
(56, 'article', 29, 14, '2016-01-13 21:41:47', 'амавм'),
(57, 'article', 29, 14, '2016-01-13 21:41:51', ' вамвам'),
(58, 'article', 29, 14, '2016-01-13 21:41:54', ' п4пмке'),
(59, 'article', 29, 14, '2016-01-13 21:42:00', ' мав ап а'),
(60, 'news', 43, 14, '2016-01-13 22:23:04', 'Ребят, у нас еще не все потеряно :)'),
(61, 'school', 6, 14, '2016-01-13 22:35:28', 'Событие из событий'),
(63, 'news', 43, 14, '2016-01-14 00:22:05', ' пекмк'),
(64, 'news', 43, 14, '2016-01-14 00:22:09', ' емкеме'),
(65, 'news', 43, 14, '2016-01-14 00:22:14', ' мекмекм'),
(66, 'news', 43, 14, '2016-01-14 00:22:18', ' м54п5пмп5п'),
(67, 'school', 14, 14, '2016-01-14 00:55:31', 'авмму'),
(68, 'school', 14, 14, '2016-01-14 00:55:36', ' цмумукмук'),
(69, 'school', 14, 14, '2016-01-14 00:55:42', ' укмцкмкцум'),
(70, 'photo', 254, 25, '2016-01-14 07:03:25', 'йцуйцуй'),
(71, 'news', 43, 25, '2016-01-14 07:28:59', 'qweqwew'),
(72, 'news', 43, 25, '2016-01-14 07:29:01', ' qweqwe'),
(73, 'news', 43, 25, '2016-01-14 07:29:05', ' qweqwe'),
(74, 'news', 43, 25, '2016-01-14 07:29:07', ' qweqwe'),
(75, 'news', 43, 25, '2016-01-14 07:29:17', ' qwewqe'),
(76, 'video', 36, 14, '2016-01-14 12:14:21', 'ммкемк'),
(77, 'video', 36, 14, '2016-01-14 12:14:26', 'ммумкумук'),
(78, 'video', 36, 14, '2016-01-14 12:14:30', 'мукуим'),
(82, 'school', 16, 25, '2016-01-14 13:23:33', 'ывывыв'),
(83, 'photo', 275, 14, '2016-01-14 13:25:26', 'asfasfdafs'),
(84, 'school', 13, 14, '2016-01-14 13:26:39', 'выапфыапфЫАП'),
(85, 'school', 13, 14, '2016-01-14 13:26:39', 'выапфыапфЫАП'),
(86, 'school', 13, 14, '2016-01-14 13:26:51', ' ФЫВПФЫАПФЫАПФЫАП'),
(87, 'school', 13, 14, '2016-01-14 13:26:55', ' ФЫВПФЫАПФЫАПФЫПФЫВП'),
(88, 'school', 13, 14, '2016-01-14 13:27:00', ' ыврваывапрвыаоывпрывпрывпрывпр'),
(90, 'events', 6, 14, '2016-01-14 13:39:59', 'wewewe'),
(91, 'events', 9, 14, '2016-01-14 13:40:59', 'SDSDS'),
(92, 'events', 10, 14, '2016-01-14 13:43:57', 'WQEWE'),
(93, 'events', 9, 14, '2016-01-14 13:48:31', 'фываывафываЫВАФЫВ'),
(94, 'events', 9, 14, '2016-01-14 13:48:38', ' ФВАФЫВПФАПФЫВАПЫВАПАВПРЫА'),
(95, 'events', 9, 14, '2016-01-14 13:48:42', ' ывпрыпрывапрвыапрывпрывпрывпрывар'),
(96, 'events', 9, 14, '2016-01-14 13:48:46', ' ыкапфукарвкерыпрывпкорыкеоы'),
(97, 'events', 10, 14, '2016-01-14 14:04:55', 'фапфапфывфывпфывп'),
(98, 'events', 4, 14, '2016-01-14 14:21:04', 'asdsds'),
(99, 'events', 4, 14, '2016-01-14 14:21:08', 'sdsdsds'),
(100, 'events', 4, 14, '2016-01-14 14:21:11', 'sdsdsd'),
(101, 'events', 4, 14, '2016-01-14 14:21:17', 'sdsdsd'),
(102, 'events', 4, 14, '2016-01-14 14:21:20', 'sdsdsd'),
(103, 'events', 10, 14, '2016-01-14 14:23:15', 'цукеукефыекфцке'),
(104, 'events', 10, 14, '2016-01-14 14:23:18', ' фыпывапывапывап'),
(105, 'events', 10, 14, '2016-01-14 14:23:20', ' фывапывпрфвапфыап'),
(106, 'events', 10, 14, '2016-01-14 14:23:23', ' фвапфвапфвапфвап'),
(107, 'school', 15, 14, '2016-01-14 14:27:50', 'sdsdsd'),
(109, 'school', 15, 14, '2016-01-14 14:27:55', ' sdsdsds'),
(115, 'board', 159, 25, '2016-01-14 15:07:40', 'wewewewewewe'),
(117, 'board', 130, 25, '2016-01-14 15:08:03', 'wewewe'),
(119, 'events', 10, 25, '2016-01-14 15:27:38', 'лку'),
(120, 'article', 28, 14, '2016-01-14 20:07:30', 'мымолвта'),
(121, 'article', 28, 14, '2016-01-14 20:07:36', ' ивма ум'),
(122, 'article', 28, 14, '2016-01-14 20:07:41', ' 45п4мсим'),
(123, 'article', 28, 14, '2016-01-14 20:07:46', 'п4м4им  5п '),
(124, 'board', 136, 14, '2016-01-14 20:15:59', 'ацусус'),
(125, 'board', 37, 14, '2016-01-14 20:33:08', 'привет'),
(126, 'school', 16, 14, '2016-01-15 08:18:43', 'явапывапфыапфапф'),
(127, 'school', 16, 14, '2016-01-15 08:18:45', ' фывпфывявапфвапфвап'),
(128, 'school', 16, 14, '2016-01-15 08:18:48', ' фывапфвапвапфвап'),
(129, 'article', 20, 14, '2016-01-15 10:41:05', 'мваимаикм уму'),
(130, 'video', 41, 25, '2016-01-15 11:20:22', '1'),
(131, 'video', 41, 25, '2016-01-15 11:20:25', '2'),
(132, 'news', 43, 25, '2016-01-15 11:23:40', 'ывывыв'),
(133, 'news', 43, 25, '2016-01-15 11:23:43', ' ывывы'),
(134, 'news', 43, 25, '2016-01-15 11:23:45', ' ывывыв'),
(135, 'news', 43, 25, '2016-01-15 11:23:48', ' ывыв'),
(136, 'news', 43, 25, '2016-01-15 11:23:56', ' фыффф'),
(137, 'news', 43, 25, '2016-01-15 11:24:15', ' ф1111111111'),
(138, 'news', 43, 25, '2016-01-15 11:24:19', ' 11122222'),
(142, 'photo', 282, 25, '2016-01-15 11:49:02', 'йцуйцуйцууцу'),
(143, 'photo', 282, 25, '2016-01-15 11:49:04', '1'),
(144, 'news', 43, 14, '2016-01-15 11:52:27', 'пкмо'),
(145, 'news', 43, 14, '2016-01-15 11:52:32', ' икмкпикеи '),
(146, 'news', 43, 14, '2016-01-15 11:52:36', ' имкеикм '),
(150, 'news', 42, 25, '2016-01-15 20:25:54', 'wewe'),
(151, 'video', 42, 25, '2016-01-15 20:29:23', 'wewew'),
(157, 'board', 108, 25, '2016-01-15 20:30:53', ' wew'),
(158, 'board', 138, 25, '2016-01-15 20:31:38', 'wewe'),
(159, 'photo', 256, 13, '2016-01-15 20:43:26', 'sdfsdf'),
(162, 'news', 43, 14, '2016-01-16 01:44:13', 'ппшкоеим'),
(166, 'events', 10, 14, '2016-01-16 03:00:52', 'ybhh'),
(170, 'article', 45, 25, '2016-01-16 03:03:01', 'w'),
(171, 'article', 45, 25, '2016-01-16 03:03:13', 's'),
(172, 'article', 45, 25, '2016-01-16 03:03:21', 'ss'),
(173, 'events', 10, 25, '2016-01-16 03:03:59', 'wwwwww'),
(174, 'school', 13, 25, '2016-01-16 03:04:27', 'sdsdsdsd'),
(175, 'school', 13, 25, '2016-01-16 03:04:56', 's'),
(176, 'school', 13, 25, '2016-01-16 03:05:11', 'ww'),
(177, 'article', 45, 25, '2016-01-16 03:05:52', 'www'),
(178, 'events', 10, 25, '2016-01-16 03:06:18', 'wq1'),
(179, 'school', 17, 25, '2016-01-16 03:06:51', '11111'),
(184, 'photo', 269, 14, '2016-01-16 04:18:04', 'дбмжд бивмв'),
(186, 'board', 137, 14, '2016-01-16 05:52:45', 'ыаииаике'),
(188, 'board', 136, 14, '2016-01-16 06:04:15', 'нгпло'),
(189, 'board', 136, 14, '2016-01-16 06:04:32', 'asgasdfgadfg'),
(190, 'photo', 155, 14, '2016-01-16 06:11:50', 'vdfbdfb'),
(191, 'photo', 155, 14, '2016-01-16 06:11:56', 'vsdvdfvdf'),
(192, 'photo', 155, 14, '2016-01-16 06:12:01', 'bfdbfbsfb'),
(193, 'photo', 257, 14, '2016-01-16 06:12:11', 'ыволиыавбрилыавфрилбывафиыавфилоыавф'),
(194, 'photo', 257, 14, '2016-01-16 06:12:17', 'аывфриомфыавлгпыавфрпаывфыавфыавф'),
(195, 'photo', 257, 14, '2016-01-16 06:12:22', 'ауфцфаывдлоавдлоиывадлопиывфжа'),
(196, 'photo', 257, 14, '2016-01-16 06:16:12', 'adfhgadfhgdfghadf'),
(197, 'board', 108, 14, '2016-01-16 07:34:09', 'jhgt'),
(198, 'board', 117, 14, '2016-01-16 07:36:43', 'km'),
(199, 'board', 161, 14, '2016-01-16 07:37:13', 'l;l;,lm'),
(200, 'board', 138, 14, '2016-01-16 07:49:04', 'btbetbtehb'),
(201, 'board', 128, 14, '2016-01-16 07:55:16', 'uiguyg'),
(203, 'article', 25, 35, '2016-01-17 12:32:56', 'comment'),
(204, 'school', 7, 35, '2016-01-17 12:35:55', 'great school'),
(205, 'school', 7, 35, '2016-01-17 12:36:52', 'wow wow'),
(206, 'board', 166, 14, '2016-01-17 14:01:33', '2222'),
(207, 'board', 166, 14, '2016-01-17 14:01:39', '2232'),
(208, 'board', 166, 14, '2016-01-17 14:01:55', '232'),
(209, 'board', 167, 14, '2016-01-17 14:02:05', '23232323'),
(210, 'photo', 286, 14, '2016-01-17 14:07:43', 'qqq'),
(212, 'board', 138, 14, '2016-01-17 14:57:31', 'v zcbcvbvcb'),
(222, 'photo', 256, 13, '2016-01-17 18:44:42', 'gfgdfg'),
(223, 'school', 8, 14, '2016-01-17 19:31:34', 'weftyqedtfedfftydwa'),
(224, 'board', 165, 14, '2016-01-17 19:40:02', 'ыыывыыывы'),
(226, 'board', 165, 14, '2016-01-17 19:40:14', 'ыы'),
(228, 'board', 108, 34, '2016-01-17 22:47:26', ' 1'),
(229, 'board', 168, 14, '2016-01-17 23:38:56', '5пщшкеор8ркоеп'),
(230, 'board', 115, 14, '2016-01-17 23:49:29', '55р6р'),
(231, 'video', 44, 36, '2016-01-18 00:29:16', 'Вообще яд! '),
(232, 'board', 177, 36, '2016-01-18 01:24:27', 'Нормально! так '),
(233, 'photo', 285, 14, '2016-01-18 01:44:51', 'маиапиап'),
(234, 'photo', 285, 14, '2016-01-18 01:44:56', 'иаикеикеи'),
(235, 'photo', 286, 14, '2016-01-18 01:59:53', 'кимикеи'),
(236, 'photo', 286, 14, '2016-01-18 01:59:58', 'укиекиеки'),
(239, 'board', 174, 14, '2016-01-18 02:34:14', 'фвапфыапфыпв'),
(240, 'board', 174, 14, '2016-01-18 02:34:17', 'ывафываЫВА'),
(241, 'board', 174, 14, '2016-01-18 02:35:19', 'ыкернцкеныукнеыуфкп'),
(242, 'board', 175, 14, '2016-01-18 03:02:15', 'укшпмкугрптмгшуктпмгшкумзгшрукпгзмркугшупрмукгшпрмшкрпшгцршгцрукшгмцрукгкришгеригшщкерпшгкуцр'),
(243, 'board', 173, 14, '2016-01-18 03:26:21', ' шр4ашота'),
(244, 'board', 173, 14, '2016-01-18 03:26:26', ' пкоущшп'),
(247, 'board', 175, 14, '2016-01-18 04:40:38', 'поугукрпшук'),
(248, 'board', 179, 34, '2016-01-18 06:19:31', 'ывыв'),
(249, 'board', 179, 34, '2016-01-18 06:19:33', ' ывыв'),
(250, 'board', 179, 34, '2016-01-18 06:19:35', ' ывыв'),
(253, 'board', 180, 34, '2016-01-18 06:19:50', ' фывыфвыв'),
(255, 'board', 180, 34, '2016-01-18 06:20:26', 'цуцуц'),
(256, 'photo', 298, 14, '2016-01-18 08:02:21', 'we5tyq4tq334tq4'),
(257, 'board', 160, 14, '2016-01-18 08:24:43', 'ыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаиыекривкеаи'),
(258, 'board', 171, 14, '2016-01-18 09:00:35', 'кикмуцкмку'),
(259, 'board', 160, 34, '2016-01-18 12:17:47', 'wewe'),
(261, 'board', 182, 33, '2016-01-18 14:03:02', 'да, это здорово '),
(262, 'board', 182, 33, '2016-01-18 14:03:13', 'еще лучше чем ВК'),
(263, 'board', 182, 33, '2016-01-18 14:03:32', 'и еще разок, и еще один коммент'),
(264, 'photo', 299, 34, '2016-01-18 14:16:49', 'сысывы'),
(265, 'photo', 300, 33, '2016-01-18 14:17:50', 'котуцлодтму'),
(266, 'video', 43, 34, '2016-01-18 14:18:42', 'ывывыв'),
(267, 'board', 179, 34, '2016-01-18 14:22:25', 'ывывы'),
(268, 'board', 108, 34, '2016-01-18 14:22:45', 'ывыв'),
(269, 'board', 108, 34, '2016-01-18 14:22:47', 'ывыв'),
(270, 'board', 108, 34, '2016-01-18 14:22:49', 'ывыв'),
(271, 'board', 131, 34, '2016-01-18 14:22:51', 'ывывы'),
(282, 'events', 10, 33, '2016-01-19 10:44:52', 'тест'),
(283, 'events', 10, 33, '2016-01-19 10:44:53', 'тест'),
(284, 'events', 10, 33, '2016-01-19 10:44:53', 'тест'),
(285, 'school', 17, 33, '2016-01-19 10:45:29', 'тест'),
(287, 'school', 17, 33, '2016-01-19 10:45:30', 'тест'),
(288, 'school', 17, 33, '2016-01-19 10:45:30', 'тест'),
(289, 'school', 17, 33, '2016-01-19 10:45:31', 'тест'),
(291, 'school', 17, 33, '2016-01-19 10:45:33', 'тест'),
(292, 'news', 44, 34, '2016-01-19 10:50:44', 'jhjh'),
(293, 'news', 44, 34, '2016-01-19 10:50:45', 'jhjh'),
(294, 'news', 44, 34, '2016-01-19 10:50:46', 'jhjh'),
(295, 'news', 44, 34, '2016-01-19 10:50:46', 'jhjh'),
(296, 'news', 44, 34, '2016-01-19 10:50:46', 'jhjh'),
(297, 'news', 44, 34, '2016-01-19 10:50:47', 'jhjh'),
(298, 'news', 41, 34, '2016-01-19 11:18:18', 'sdsd'),
(299, 'article', 45, 34, '2016-01-19 11:18:32', 'sdsds'),
(300, 'events', 10, 14, '2016-01-19 11:18:48', 'фцармиолыфапбфыривдпшцфпркалфгнпцпашгнпфцлууафцукапфкпфукпфкцп'),
(301, 'events', 10, 34, '2016-01-19 11:19:47', 'sdsdsd'),
(302, 'events', 10, 14, '2016-01-19 11:20:06', ' ывма'),
(303, 'events', 10, 14, '2016-01-19 11:20:30', 'фцармиолыфапбфыривдпшцфпркалфгнпцпашгнпфцлууафцукапфкпфукпфкцфцармиолыфапбфыривдпшцфпркалфгнпцпашгнпфцлууафцукапфкпфукпфкц'),
(304, 'events', 10, 34, '2016-01-19 11:20:33', 'sdsds'),
(308, 'article', 45, 34, '2016-01-19 11:22:44', 'sdsds'),
(312, 'news', 44, 34, '2016-01-19 13:54:14', '1'),
(313, 'photo', 299, 34, '2016-01-19 14:02:46', 'sdsds'),
(314, 'photo', 299, 34, '2016-01-19 14:02:47', 'sdsd'),
(315, 'video', 43, 34, '2016-01-19 14:03:01', 'sdsds'),
(316, 'video', 43, 34, '2016-01-19 14:03:04', 'sdss'),
(317, 'news', 44, 33, '2016-01-19 14:19:48', 'кгпрвшкоп'),
(318, 'news', 44, 33, '2016-01-19 14:19:52', ' мм'),
(320, 'news', 44, 34, '2016-01-19 14:23:50', 'выывыв'),
(321, 'photo', 301, 33, '2016-01-19 14:39:38', 'шольсыв'),
(322, 'photo', 301, 33, '2016-01-19 14:39:42', 'маволтвам'),
(323, 'photo', 301, 33, '2016-01-19 14:39:46', 'кутмькеоат'),
(324, 'photo', 301, 33, '2016-01-19 14:39:51', 'кущгпмотлкгыиом'),
(325, 'video', 46, 33, '2016-01-19 14:45:44', 'кгмротвмшголвм'),
(326, 'video', 46, 33, '2016-01-19 14:45:48', 'ушщкимтокгеимтолыв'),
(328, 'video', 46, 33, '2016-01-19 14:45:56', 'ушщпкотлшзкуо'),
(335, 'news', 44, 33, '2016-01-20 13:13:03', 'ntn'),
(336, 'news', 44, 33, '2016-01-20 13:13:17', 'ntcn'),
(337, 'article', 45, 33, '2016-01-20 13:15:07', 'тест'),
(338, 'events', 11, 33, '2016-01-20 13:17:54', 'тест '),
(340, 'board', 188, 33, '2016-01-20 13:45:47', 'лавоплвад'),
(341, 'photo', 298, 14, '2016-01-21 12:27:00', 'http://outstyle.dev/myprofile/http://outstyle.dev/myprofile/http://outstyle.dev/myprofile/http://outstyle.dev/myprofile/http://outstyle.dev/myprofile/http://outstyle.dev/myprofile/'),
(343, 'news', 44, 14, '2016-01-21 12:28:10', ' http://outstyle.dev/myprofile/'),
(346, 'board', 187, 14, '2016-01-21 12:39:49', 'asgaerg'),
(348, 'photo', 257, 13, '2016-01-21 14:26:22', 'w'),
(349, 'news', 42, 33, '2016-01-21 14:47:02', 'тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест '),
(351, 'events', 11, 33, '2016-01-21 14:48:48', 'тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест '),
(353, 'board', 189, 33, '2016-01-21 14:51:00', 'тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест '),
(354, 'board', 199, 33, '2016-01-21 15:15:43', 'тест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тесттест тест тест'),
(355, 'board', 191, 14, '2016-01-22 11:19:48', 'xccxcxcxxc'),
(356, 'board', 191, 14, '2016-01-22 11:19:56', 'sdsds'),
(357, 'board', 191, 14, '2016-01-22 11:20:01', 'qqqq'),
(358, 'news', 36, 13, '2016-01-22 11:41:04', 'sdsds'),
(359, 'school', 9, 33, '2016-01-22 11:55:46', 'тест \nтест'),
(360, 'school', 9, 33, '2016-01-22 11:55:50', ' тест \n'),
(361, 'school', 9, 33, '2016-01-22 11:55:55', ' тест'),
(362, 'school', 9, 33, '2016-01-22 11:56:00', ' тест'),
(363, 'board', 210, 13, '2016-01-22 13:03:30', 'we'),
(364, 'board', 209, 13, '2016-01-22 13:03:33', 'we'),
(366, 'board', 216, 13, '2016-01-22 13:10:45', 'sdsds'),
(369, 'events', 11, 14, '2016-01-25 09:57:50', 'kjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfgkjfgblashbfgliabfg'),
(372, 'video', 2, 14, '2016-01-25 10:20:03', 'serfgiuushdfoigushodighserfgiuushdfoigushodighserfgiuushdfoigushodighserfgiuushdfoigushodighserfgiuushdfoigushodigh'),
(374, 'news', 44, 14, '2016-01-25 11:35:14', '9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР9 кнап8щуцнкрепщшгуфкрещГР'),
(375, 'news', 44, 14, '2016-01-25 12:12:45', 'ldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgbldisfgilsdhbfgsdihbfgisdfgb'),
(377, 'photo', 257, 14, '2016-01-27 13:24:41', 'asfasfasf'),
(378, 'photo', 257, 14, '2016-01-27 13:24:42', 'asfasfasf'),
(379, 'photo', 257, 14, '2016-01-27 13:24:42', 'asfasfasf'),
(383, 'news', 37, 14, '2016-01-27 14:04:18', 'afasfdasfasfd'),
(384, 'article', 18, 14, '2016-01-27 14:05:47', 'фыафыафыафыа'),
(386, 'photo', 373, 14, '2016-01-27 14:48:24', 'фыафыафыа'),
(389, 'board', 206, 14, '2016-01-29 07:09:27', 'sfgwrthwrth'),
(390, 'board', 108, 14, '2016-01-29 12:55:32', 'sfasfasfasf sfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfsfasfasfasfafasfas asfd asdf asdf asdf asdf asdf asd fasdf asdf asdf '),
(393, 'news', 44, 33, '2016-01-29 14:13:24', 'привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений '),
(394, 'article', 45, 33, '2016-01-29 14:13:52', 'привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений '),
(395, 'school', 16, 33, '2016-01-29 14:15:32', 'привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений '),
(397, 'photo', 334, 33, '2016-01-29 14:26:43', 'привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений '),
(398, 'video', 46, 33, '2016-01-29 14:42:06', 'Данил19 января в 17:45кгмротвмшголвм0Данил19 января в 17:45ушщкимтокгеимтолыв1Данил19 января в 17:45ушщпкотлшзкуо1'),
(399, 'video', 46, 33, '2016-01-29 14:42:13', 'привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений '),
(400, 'photo', 88, 33, '2016-01-31 22:53:33', 'кмуквмв'),
(401, 'photo', 88, 33, '2016-01-31 22:53:35', 'кмуквмв'),
(402, 'photo', 88, 33, '2016-01-31 22:53:36', 'кмуквмв'),
(403, 'photo', 88, 33, '2016-01-31 22:53:36', 'кмуквмв'),
(404, 'photo', 88, 33, '2016-01-31 22:53:36', 'кмуквмв'),
(405, 'photo', 334, 33, '2016-01-31 22:53:48', 'кмывимыв'),
(409, 'board', 206, 14, '2016-02-01 06:58:28', 'wet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrttwet4rewrtt'),
(411, 'events', 18, 14, '2016-02-01 08:01:51', 'asfasfasf'),
(412, 'events', 18, 14, '2016-02-01 08:01:54', ' asdfasfasfsdf'),
(413, 'events', 19, 14, '2016-02-01 08:04:04', 'afasdfasf afasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasfafasdfasf'),
(414, 'events', 20, 14, '2016-02-01 08:06:19', 'fasfasf'),
(415, 'events', 20, 14, '2016-02-01 08:08:32', 'asfasf'),
(420, 'events', 24, 14, '2016-02-01 08:59:12', 'asrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrgasrg'),
(433, 'board', 182, 33, '2016-02-02 19:06:20', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(438, 'video', 46, 33, '2016-02-02 20:04:21', 'Данил19 января в 17:45кгмротвмшголвм0Данил19 января в 17:45ушщкимтокгеимтолыв1Данил19 января в 17:45ушщпкотлшзкуо1Данил29 января в 17:42Данил19 января в 17:45кгмротвмшголвм0Данил19 января в 17:45ушщкимтокгеимтолыв1Данил19 января в 17:45ушщпкотлшзкуо10Данил29 января в 17:42привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений привет, это тест больших сообщений 0'),
(439, 'board', 184, 33, '2016-02-02 20:22:31', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(440, 'board', 240, 38, '2016-02-02 20:24:30', 'чвдлпт'),
(441, 'board', 240, 38, '2016-02-02 20:43:43', 'nm\n'),
(442, 'photo', 404, 14, '2016-02-03 06:14:13', 'фыафыа'),
(443, 'board', 228, 14, '2016-02-03 07:15:12', 'ывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапрывапывапр'),
(445, 'board', 240, 14, '2016-02-03 14:01:54', '.edit-mes.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message.edit-messagesage.edit-message.edit-message.edit-message.edit-message.edit-message.edit-message'),
(448, 'board', 228, 14, '2016-02-04 11:30:14', 'яыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывапяыварияывап'),
(449, 'photo', 401, 33, '2016-02-04 21:53:13', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(451, 'board', 240, 33, '2016-02-04 21:55:43', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(454, 'news', 43, 14, '2016-02-05 06:59:22', 'фыва'),
(457, 'video', 34, 13, '2016-02-08 07:32:10', 'фвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывапфвапфывап'),
(461, 'video', 49, 33, '2016-02-08 22:20:43', 'ввввв'),
(462, 'video', 49, 33, '2016-02-08 22:20:58', 'выя'),
(463, 'video', 49, 33, '2016-02-08 22:21:01', 'ввцпаука'),
(464, 'video', 49, 33, '2016-02-08 22:21:10', 'влмьвжалмьсжhttp://devoutstyle.orghttp://devoutstyle.orghttp://devoutstyle.org'),
(465, 'photo', 286, 33, '2016-02-08 22:26:04', 'привет'),
(466, 'video', 49, 33, '2016-02-08 22:28:35', 'тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест '),
(467, 'board', 246, 14, '2016-02-09 07:19:18', 'ывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыапывакпфвыап'),
(470, 'board', 255, 14, '2016-02-09 10:48:40', 'asfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfg'),
(471, 'video', 33, 14, '2016-02-09 10:51:08', 'asfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfg'),
(472, 'video', 33, 14, '2016-02-09 10:51:15', 'asfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfg'),
(473, 'photo', 426, 14, '2016-02-09 10:51:33', 'asfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfgasfdgsadfg'),
(475, 'events', 25, 14, '2016-02-09 12:12:17', 'asfasf'),
(477, 'video', 33, 14, '2016-02-09 13:24:31', 'фыафывафыафыва'),
(478, 'video', 2, 14, '2016-02-09 13:24:54', 'фыафыавфыав'),
(482, 'video', 33, 14, '2016-02-09 13:28:39', 'фффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффф'),
(483, 'video', 33, 14, '2016-02-09 13:29:10', 'фффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффффф'),
(484, 'video', 2, 14, '2016-02-09 13:30:00', 'фы'),
(493, 'video', 3, 14, '2016-02-10 11:16:15', 'asfasfasfasfasfasf'),
(494, 'video', 33, 14, '2016-02-10 11:16:35', 'asfasfasfasfasfasfasfasf'),
(495, 'photo', 405, 14, '2016-02-10 11:40:43', 'фывафывафыва'),
(496, 'photo', 405, 14, '2016-02-10 11:40:46', 'фывафывафыав'),
(497, 'board', 259, 14, '2016-02-10 11:43:20', 'swrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrtyswrtyhsrtysrty'),
(501, 'board', 263, 14, '2016-02-10 13:44:24', 'akusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgv'),
(504, 'photo', 440, 14, '2016-02-10 13:45:34', 'akusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgv'),
(507, 'video', 37, 14, '2016-02-10 13:46:22', 'akusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgvakusdfbkuusadfgv'),
(508, 'video', 49, 14, '2016-02-10 13:48:16', 'afasfasdfasdf'),
(509, 'photo', 404, 14, '2016-02-10 14:49:24', 'фывафыафыафыа'),
(515, 'video', 37, 14, '2016-02-11 06:08:29', 'sdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerf'),
(516, 'video', 37, 14, '2016-02-11 06:08:33', 'sdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerfsdfgawsfawerf'),
(519, 'video', 50, 14, '2016-02-11 08:40:36', 'привет , привет , привет , привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,привет , привет , привет ,'),
(521, 'photo', 443, 14, '2016-02-11 09:01:32', 'http://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursovhttp://modx.ws/urok-modx-ajax-zagruzka-resursov'),
(523, 'photo', 443, 14, '2016-02-11 09:06:09', 'ыапывапрывап'),
(524, 'photo', 257, 14, '2016-02-11 09:06:43', 'явапиывапывап'),
(525, 'photo', 257, 14, '2016-02-11 09:07:14', 'вфаыпыявапфывап'),
(526, 'photo', 442, 13, '2016-02-11 09:09:50', 'фыафыа'),
(527, 'photo', 442, 13, '2016-02-11 09:09:54', 'фыафыва'),
(528, 'photo', 441, 13, '2016-02-11 09:18:40', 'adsfasfasf'),
(529, 'photo', 441, 13, '2016-02-11 09:18:42', 'asdfasdfasf'),
(530, 'photo', 441, 13, '2016-02-11 09:18:45', 'asdfasfdasfdasdf'),
(531, 'photo', 443, 13, '2016-02-11 09:18:50', 'asdfasdf'),
(532, 'photo', 443, 13, '2016-02-11 09:18:53', 'asdfasdfasdf'),
(533, 'board', 237, 14, '2016-02-11 09:21:40', 'asdfasdf'),
(534, 'board', 237, 14, '2016-02-11 09:21:46', 'asdfasfdasf'),
(535, 'photo', 423, 14, '2016-02-11 09:21:58', 'asdfasdfasdf'),
(536, 'photo', 257, 14, '2016-02-11 11:04:06', 'sedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrtysedsrtysrty'),
(537, 'photo', 423, 14, '2016-02-11 14:51:57', 'афафыва'),
(538, 'photo', 423, 14, '2016-02-11 14:52:01', 'фыафыафыва'),
(539, 'photo', 423, 14, '2016-02-11 14:52:17', 'фыафыав'),
(540, 'video', 49, 14, '2016-02-11 14:53:16', 'ыфаыа'),
(547, 'photo', 443, 14, '2016-02-15 20:59:35', 'лтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлв лтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлв'),
(548, 'photo', 443, 14, '2016-02-15 21:01:27', 'лтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлвлтмдлтвамдлв'),
(549, 'photo', 318, 14, '2016-02-15 21:02:20', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(550, 'video', 50, 14, '2016-02-15 21:09:29', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(551, 'video', 50, 14, '2016-02-16 06:24:12', 'тест'),
(552, 'board', 236, 14, '2016-02-16 06:41:04', 'wertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertg'),
(553, 'board', 235, 14, '2016-02-16 06:41:11', 'wertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertgwertg'),
(558, 'board', 264, 14, '2016-02-16 10:58:08', '.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost'),
(559, 'board', 238, 14, '2016-02-16 10:58:25', '.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost'),
(560, 'board', 236, 14, '2016-02-16 10:59:41', '.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost.delete-repost'),
(561, 'board', 245, 14, '2016-02-16 11:16:45', 'erfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfgerfgsdfg'),
(562, 'board', 239, 14, '2016-02-16 11:17:05', 'sdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfgsdfgasdfg'),
(563, 'board', 245, 14, '2016-02-16 11:17:46', 'rsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrgh'),
(564, 'board', 264, 14, '2016-02-16 11:18:11', 'rsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrghrsthsrgh'),
(565, 'board', 209, 14, '2016-02-16 11:32:02', 'фываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоатфываолтыдвлоат'),
(566, 'video', 50, 14, '2016-02-16 12:18:04', 'фуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывапфуапывап'),
(569, 'board', 264, 33, '2016-02-17 06:32:17', 'комменты у себя на стене'),
(570, 'board', 263, 33, '2016-02-17 06:32:21', 'комменты у себя на стене'),
(571, 'board', 262, 33, '2016-02-17 06:32:31', 'комменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стенекомменты у себя на стене');
INSERT INTO `z_comments` (`id`, `elem_type`, `elem_id`, `user_id`, `created`, `comment`) VALUES
(572, 'board', 261, 33, '2016-02-17 06:32:42', 'комменты у себя на стене'),
(573, 'board', 273, 13, '2016-02-17 07:29:16', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(574, 'board', 272, 13, '2016-02-17 07:29:20', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(575, 'board', 268, 13, '2016-02-17 07:29:24', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(576, 'board', 267, 13, '2016-02-17 07:29:29', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(577, 'board', 266, 13, '2016-02-17 07:29:33', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(578, 'board', 255, 13, '2016-02-17 07:29:37', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(579, 'board', 254, 13, '2016-02-17 07:29:41', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(580, 'board', 254, 13, '2016-02-17 07:29:45', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(581, 'board', 253, 13, '2016-02-17 07:30:31', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(582, 'board', 253, 13, '2016-02-17 07:30:35', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(583, 'board', 228, 13, '2016-02-17 07:30:40', 'увыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывапувыапывап'),
(584, 'board', 228, 13, '2016-02-17 07:30:42', 'увыапывапувыапывапувыапывап'),
(585, 'board', 273, 14, '2016-02-17 09:59:18', 'sdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgj'),
(586, 'photo', 443, 14, '2016-02-17 10:01:03', 'sdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgjsdfgjsdfilgj'),
(588, 'video', 37, 13, '2016-02-17 20:34:02', 'цацуа'),
(589, 'video', 37, 13, '2016-02-17 20:34:15', 'цауцу'),
(590, 'board', 203, 13, '2016-02-17 20:35:09', 'ёё'),
(591, 'board', 253, 13, '2016-02-17 20:39:16', 'уцау'),
(592, 'news', 44, 13, '2016-02-17 20:40:05', 'Сложный текст'),
(593, 'article', 46, 13, '2016-02-17 20:40:34', 'Эрудиты блин'),
(594, 'school', 18, 13, '2016-02-17 20:41:28', 'cool school - cool girls'),
(595, 'board', 270, 14, '2016-02-18 08:53:33', 'лгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплри'),
(596, 'board', 268, 14, '2016-02-18 08:53:41', ' лгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплрилгырваплрыиваплри'),
(597, 'board', 273, 13, '2016-02-18 20:38:23', 'fwefwe'),
(598, 'board', 199, 13, '2016-02-18 20:39:44', 'ytjtyj'),
(599, 'news', 44, 14, '2016-02-19 06:39:44', 'lakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgb'),
(600, 'news', 44, 14, '2016-02-19 06:39:57', 'lakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgb'),
(601, 'news', 44, 14, '2016-02-19 06:40:00', ' lakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgblakjrfhbskldfhgb'),
(605, 'news', 36, 14, '2016-02-19 13:27:42', 'фкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывп'),
(606, 'news', 36, 14, '2016-02-19 13:28:06', ' фкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывпфкпывп'),
(607, 'news', 42, 14, '2016-02-19 13:28:35', 'ыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукепыукеп'),
(609, 'news', 44, 38, '2016-02-20 10:45:38', 'вп'),
(611, 'video', 50, 14, '2016-02-21 19:38:58', 'привет'),
(616, 'board', 238, 38, '2016-02-21 20:39:03', 'ываыа'),
(617, 'board', 238, 38, '2016-02-21 20:39:03', 'ываыа'),
(618, 'video', 50, 14, '2016-02-21 20:58:34', 'jityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuyjityuirtuy'),
(620, 'video', 47, 38, '2016-02-22 16:43:45', 'нормас видео\n'),
(621, 'board', 270, 38, '2016-02-22 16:51:14', 'козырная карта'),
(625, 'video', 50, 38, '2016-02-22 18:00:25', 'вмвав\n'),
(626, 'board', 268, 38, '2016-02-22 18:04:31', 'апыв'),
(630, 'board', 256, 14, '2016-02-26 18:35:25', 'hi'),
(631, 'news', 44, 33, '2016-03-02 17:01:18', 'коммент'),
(632, 'board', 270, 33, '2016-03-02 17:09:35', 'раз '),
(633, 'board', 268, 14, '2016-03-02 17:36:28', 'ывмывм'),
(634, 'news', 44, 14, '2016-03-02 17:36:52', 'вмывм'),
(635, 'video', 37, 14, '2016-03-02 18:08:35', 'привет'),
(636, 'board', 256, 13, '2016-03-02 18:24:05', 'sdfs'),
(637, 'video', 54, 33, '2016-03-02 18:25:44', 'тест'),
(638, 'video', 54, 33, '2016-03-02 18:26:00', 'вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест вот тест тест '),
(642, 'board', 288, 33, '2016-03-02 20:34:23', 'привет\n'),
(643, 'board', 298, 33, '2016-03-09 10:48:28', 'тест'),
(645, 'video', 56, 14, '2016-03-16 13:18:39', 'привет'),
(648, 'video', 53, 38, '2016-03-16 17:04:26', 'ми\n'),
(649, 'video', 52, 38, '2016-03-16 17:05:24', 'иио\n'),
(650, 'video', 52, 38, '2016-03-16 17:05:31', 'пли\n'),
(651, 'board', 301, 33, '2016-03-17 12:52:23', 'привте'),
(652, 'board', 303, 33, '2016-03-17 12:53:09', 'привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест привет тест '),
(653, 'board', 307, 33, '2016-03-17 12:57:51', 'ghbdtn'),
(654, 'board', 307, 33, '2016-03-17 14:16:19', 'привет'),
(655, 'photo', 428, 33, '2016-03-17 14:17:59', 'привет'),
(656, 'video', 54, 33, '2016-03-17 14:29:26', 'привет'),
(658, 'video', 56, 33, '2016-03-17 14:30:29', 'привет'),
(659, 'video', 56, 14, '2016-03-17 14:31:13', 'привет'),
(661, 'photo', 451, 33, '2016-03-17 15:03:33', 'привет'),
(662, 'photo', 451, 33, '2016-03-17 15:03:40', 'привет'),
(663, 'video', 56, 14, '2016-03-18 08:34:47', 'фыафыафыа'),
(664, 'board', 310, 14, '2016-03-18 09:41:26', 'asfasfasfasfd'),
(666, 'board', 307, 14, '2016-03-18 09:41:59', 'asfasdf\nasdfasdf\n'),
(668, 'board', 312, 33, '2016-03-18 10:18:59', 'привет \n\n\n\n\n\nпривет'),
(669, 'board', 312, 33, '2016-03-18 10:19:24', 'привет \nпривет \n\n\nпривет'),
(670, 'board', 312, 33, '2016-03-18 10:19:41', 'привет \n\n\nпривет \n\nпривет'),
(671, 'news', 44, 33, '2016-03-18 11:43:21', 'привет'),
(672, 'video', 53, 38, '2016-03-18 12:14:22', 'bnv'),
(674, 'board', 323, 33, '2016-03-21 07:36:37', 'привет \n\nпривет'),
(675, 'news', 44, 33, '2016-03-21 07:36:58', 'ПРивет \n\nпривет \n\n\n\n\n\n\n\nвот это да\n'),
(676, 'news', 44, 33, '2016-03-21 07:37:44', 'ПРивет \n\nПривет'),
(677, 'board', 317, 14, '2016-03-21 13:51:51', 'asfasf'),
(678, 'board', 317, 14, '2016-03-21 14:43:01', 'fdh\nhdfgh\n'),
(679, 'news', 44, 14, '2016-03-21 14:43:18', 'asfasdf\nasfasdf'),
(681, 'photo', 313, 14, '2016-03-21 14:55:46', 'ааааа'),
(683, 'photo', 334, 38, '2016-03-21 17:44:38', 'аса\n'),
(688, 'photo', 255, 38, '2016-03-21 18:05:55', 'mmm\n'),
(689, 'photo', 257, 38, '2016-03-21 18:06:18', 'ml\nl\n'),
(690, 'news', 44, 14, '2016-03-22 09:05:34', 'афыа'),
(700, 'board', 362, 33, '2016-03-22 17:57:47', 'хоп хоп '),
(704, 'photo', 453, 33, '2016-03-22 18:01:38', 'привет'),
(705, 'photo', 453, 33, '2016-03-22 18:01:45', 'хоп хоп '),
(706, 'photo', 313, 33, '2016-03-22 18:02:25', 'привет'),
(707, 'photo', 313, 33, '2016-03-22 18:02:29', '123'),
(711, 'school', 18, 14, '2016-03-25 07:33:30', 'afasdf'),
(712, 'school', 18, 14, '2016-03-25 07:33:40', ' adaddddddddddddddddddddd'),
(713, 'school', 18, 14, '2016-03-25 07:33:49', ' adadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadadddddddddddddddddddddadaddddddddddddddddddddd'),
(714, 'board', 380, 14, '2016-03-25 07:49:04', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(715, 'board', 380, 14, '2016-03-25 07:49:27', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(716, 'photo', 443, 14, '2016-03-25 07:49:51', 'привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет привет '),
(717, 'photo', 443, 14, '2016-03-25 07:59:36', 'привет'),
(719, 'board', 379, 38, '2016-03-25 17:00:21', 'gyj\n'),
(720, 'board', 379, 38, '2016-03-25 17:00:24', 'gyj\n'),
(721, 'board', 379, 38, '2016-03-25 17:00:26', 'gyj\n'),
(722, 'board', 379, 38, '2016-03-25 17:00:26', 'gyj\n'),
(723, 'board', 379, 38, '2016-03-25 17:00:26', 'gyj\n'),
(724, 'board', 379, 38, '2016-03-25 17:00:27', 'gyj\n'),
(725, 'board', 379, 38, '2016-03-25 17:00:27', 'gyj\n'),
(726, 'board', 379, 38, '2016-03-25 17:00:28', 'gyj\n'),
(727, 'board', 379, 38, '2016-03-25 17:00:31', 'gyj'),
(728, 'board', 379, 38, '2016-03-25 17:00:34', 'gyj'),
(729, 'board', 379, 38, '2016-03-25 17:00:47', 'gfh'),
(730, 'board', 379, 38, '2016-03-25 17:00:48', 'gfh'),
(731, 'board', 379, 38, '2016-03-25 17:00:48', 'gfh'),
(736, 'board', 388, 38, '2016-03-25 17:01:17', 'l'),
(737, 'board', 378, 38, '2016-03-25 17:01:21', 'l'),
(741, 'video', 53, 38, '2016-03-26 15:33:02', 'ЯЧСЯЧС\n'),
(742, 'board', 395, 38, '2016-03-26 15:56:03', 'ьи'),
(743, 'board', 395, 38, '2016-03-26 15:56:05', 'лыфапвфа'),
(744, 'board', 395, 38, '2016-03-26 15:56:07', 'дывард'),
(745, 'board', 395, 38, '2016-03-26 15:56:09', 'дыра'),
(746, 'board', 378, 38, '2016-03-26 16:01:02', 'ыаяа'),
(747, 'board', 378, 38, '2016-03-26 16:01:09', 'ыааффаы\nывпож\nывпр'),
(750, 'video', 53, 38, '2016-03-27 11:37:03', 'зваавыла'),
(751, 'video', 53, 38, '2016-03-27 11:37:34', 'ываыва'),
(754, 'board', 425, 14, '2016-03-31 12:01:51', 'afasfasf'),
(755, 'board', 425, 14, '2016-03-31 12:01:53', 'asfdasfd'),
(756, 'board', 425, 14, '2016-03-31 12:01:54', 'asfasdf'),
(757, 'board', 425, 14, '2016-03-31 12:01:55', 'asdf'),
(758, 'board', 425, 14, '2016-03-31 12:01:56', 'fasf'),
(759, 'board', 426, 14, '2016-03-31 12:10:46', 'ффаыафыа\n'),
(760, 'board', 426, 14, '2016-03-31 12:10:50', 'ффаыафыа\n'),
(761, 'board', 426, 14, '2016-03-31 12:10:52', 'ффаыафыа\nфыва'),
(762, 'board', 421, 14, '2016-03-31 12:10:55', 'фыва'),
(763, 'board', 418, 14, '2016-03-31 12:10:58', 'фывафыва'),
(764, 'board', 416, 14, '2016-03-31 12:11:03', 'фывафыав'),
(765, 'board', 421, 33, '2016-03-31 12:39:28', 'привет '),
(766, 'board', 421, 33, '2016-03-31 12:39:33', 'как дела\n'),
(767, 'board', 427, 33, '2016-03-31 12:39:59', 'много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает много текста не бывает '),
(771, 'board', 326, 14, '2016-03-31 14:53:52', 'фыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафыафывафыа'),
(772, 'board', 427, 38, '2016-03-31 18:24:31', 'тлдт'),
(773, 'board', 427, 38, '2016-03-31 18:24:37', ' ыфв\nфывфывв\nфыв'),
(774, 'board', 443, 33, '2016-04-01 12:19:31', 'опа \n\nлпа '),
(775, 'board', 425, 14, '2016-04-01 12:22:27', 'asfasfas'),
(776, 'board', 317, 14, '2016-04-01 12:23:03', 'fasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdffasdfasfasdf\nasdf'),
(778, 'board', 444, 33, '2016-04-01 12:24:27', 'привте \n\n\n\n\n'),
(779, 'board', 413, 33, '2016-04-01 12:25:21', 'оп оп \n\n\n\n\n\n'),
(781, 'board', 425, 33, '2016-04-01 12:39:24', 'привте'),
(782, 'board', 451, 33, '2016-04-01 13:31:24', 'привет привет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветприветпривет приветприветприветприветпривет'),
(785, 'board', 447, 38, '2016-04-04 17:09:21', 'hfgffj'),
(787, 'board', 447, 14, '2016-04-06 08:35:58', 'очень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень оочень о'),
(790, 'board', 464, 75, '2016-04-07 06:07:03', 'Новаторский характер носит космология Николая Кузанского, изложенная в трактате Об учёном незнании. Он предполагал материальное единство Вселенной и считал Землю одной из планет, также совершающей движение; небесные тела населены, как и наша Земля, причём каждый наблюдатель во Вселенной с равным основанием может считать себя неподвижным. По его мнению, Вселенная безгранична, но конечна, поскольку бесконечность может быть свойственна одному только Богу. Вместе с тем, у Кузанца сохраняются многие элементы средневековой космологии, в том числе вера в существование небесных сфер, включая внешнюю из них — сферу неподвижных звёзд. Однако эти «сферы» не являются абсолютно круглыми, их вращение не является равномерным, оси вращения не занимают фиксированного положения в пространстве. Вследствие этого у мира нет абсолютного центра и чёткой границы (вероятно, именно в этом смысле нужно понимать тезис Кузанца о безграничности Вселенной)[6].\n\nПервая половина XVI века отмечена появлением новой, гелиоцентрической системы мира Николая Коперника. В центр мира Коперник поместил Солнце, вокруг которого вращались планеты (в числе которых и Земля, совершавшая к тому же ещё и вращение вокруг оси). Вселенную Коперник по-прежнему считал ограниченной сферой неподвижных звёзд; по-видимому, сохранялась у него и вера в существование небесных сфер[7].\n\nМодификацией системы Коперника была система Томаса Диггеса, в которой звёзды располагаются не на одной сфере, а на различных расстояниях от Земли до бесконечности. Некоторые философы (Франческо Патрици, Ян Ессенский) заимствовали только один элемент учения Коперника — вращение Земли вокруг оси, также считая звёзды разбросанными во Вселенной до бесконечности. Воззрения этих мыслителей несут на себе следы влияния герметизма, поскольку область Вселенной за пределами Солнечной системы считалась ими нематериальным миром, местом обитания Бога и ангелов[8][9][10].\n\nРешительный шаг от гелиоцентризма к бесконечной Вселенной, равномерно заполненной звёздами, сделал итальянский философ Джордано Бруно. Согласно Бруно, при наблюдении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и Уильям Гильберт. В середине — второй половине XVII века эти взгляды поддержали Рене Декарт, Отто фон Герике и Христиан Гюйгенс.'),
(791, 'board', 460, 33, '2016-04-07 11:34:35', 'такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать '),
(792, 'board', 464, 75, '2016-04-08 10:56:18', 'аблюдении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и Уильям Гильберт. В середине — второй половине XVII века эти взгляды поддержали Рене Декарт, Отто фон Герике и Христиан Гюйгенс.'),
(793, 'board', 464, 75, '2016-04-08 10:57:53', 'ении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и У'),
(794, 'board', 464, 75, '2016-04-08 10:58:08', 'Вчера в 09:07\nНоваторский характер носит космология Николая Кузанского, изложенная в трактате Об учёном незнании. Он предполагал материальное единство Вселенной и считал Землю одной из планет, также совершающей движение; небесные тела населены, как и наша Земля, причём каждый наблюдатель во Вселенной с равным основанием может считать себя неподвижным. По его мнению, Вселенная безгранична, но конечна, поскольку бесконечность может быть свойственна одному только Богу. Вместе с тем, у Кузанца сохраняются многие элементы средневековой космологии, в том числе вера в существование небесных сфер, включая внешнюю из них — сферу неподвижных звёзд. Однако эти «сферы» не являются абсолютно круглыми, их вращение не является равномерным, оси вращения не занимают фиксированного положения в пространстве. Вследствие этого у мира нет абсолютного центра и чёткой границы (вероятно, именно в этом смысле нужно понимать тезис Кузанца о безграничности Вселенной)[6].\n\nПервая половина XVI века отмечена появлением новой, гелиоцентрической системы мира Николая Коперника. В центр мира Коперник поместил Солнце, вокруг которого вращались планеты (в числе которых и Земля, совершавшая к тому же ещё и вращение вокруг оси). Вселенную Коперник по-прежнему считал ограниченной сферой неподвижных звёзд; по-видимому, сохранялась у него и вера в существование небесных сфер[7].\n\nМодификацией системы Коперника была система Томаса Диггеса, в которой звёзды располагаются не на одной сфере, а на различных расстояниях от Земли до бесконечности. Некоторые философы (Франческо Патрици, Ян Ессенский) заимствовали только один элемент учения Коперника — вращение Земли вокруг оси, также считая звёзды разбросанными во Вселенной до бесконечности. Воззрения этих мыслителей несут на себе следы влияния герметизма, поскольку область Вселенной за пределами Солнечной системы считалась ими нематериальным миром, местом обитания Бога и ангелов[8][9][10].\n\nРешительный шаг от гелиоцентризма к бесконечной Вселенной, равномерно заполненной звёздами, сделал итальянский философ Джордано Бруно. Согласно Бруно, при наблюдении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и Уильям Гильберт. В середине — второй половине XVII века эти взгляды поддержали Рене Декарт, Отто фон Герике и Христиан Гюйгенс'),
(795, 'board', 464, 75, '2016-04-08 10:58:15', 'Вчера в 09:07\nНоваторский характер носит космология Николая Кузанского, изложенная в трактате Об учёном незнании. Он предполагал материальное единство Вселенной и считал Землю одной из планет, также совершающей движение; небесные тела населены, как и наша Земля, причём каждый наблюдатель во Вселенной с равным основанием может считать себя неподвижным. По его мнению, Вселенная безгранична, но конечна, поскольку бесконечность может быть свойственна одному только Богу. Вместе с тем, у Кузанца сохраняются многие элементы средневековой космологии, в том числе вера в существование небесных сфер, включая внешнюю из них — сферу неподвижных звёзд. Однако эти «сферы» не являются абсолютно круглыми, их вращение не является равномерным, оси вращения не занимают фиксированного положения в пространстве. Вследствие этого у мира нет абсолютного центра и чёткой границы (вероятно, именно в этом смысле нужно понимать тезис Кузанца о безграничности Вселенной)[6].\n\nПервая половина XVI века отмечена появлением новой, гелиоцентрической системы мира Николая Коперника. В центр мира Коперник поместил Солнце, вокруг которого вращались планеты (в числе которых и Земля, совершавшая к тому же ещё и вращение вокруг оси). Вселенную Коперник по-прежнему считал ограниченной сферой неподвижных звёзд; по-видимому, сохранялась у него и вера в существование небесных сфер[7].\n\nМодификацией системы Коперника была система Томаса Диггеса, в которой звёзды располагаются не на одной сфере, а на различных расстояниях от Земли до бесконечности. Некоторые философы (Франческо Патрици, Ян Ессенский) заимствовали только один элемент учения Коперника — вращение Земли вокруг оси, также считая звёзды разбросанными во Вселенной до бесконечности. Воззрения этих мыслителей несут на себе следы влияния герметизма, поскольку область Вселенной за пределами Солнечной системы считалась ими нематериальным миром, местом обитания Бога и ангелов[8][9][10].\n\nРешительный шаг от гелиоцентризма к бесконечной Вселенной, равномерно заполненной звёздами, сделал итальянский философ Джордано Бруно. Согласно Бруно, при наблюдении из всех точек Вселенная должна выглядеть примерно одинаково. Из всех мыслителей Нового времени он первым предположил, что звёзды — это далёкие солнца и что физические законы во всем бесконечном и безграничном пространстве одинаковы[11]. В конце XVI века бесконечность Вселенной отстаивал и Уильям Гильберт. В середине — второй половине XVII века эти взгляды поддержали Рене Декарт, Отто фон Герике и Христиан Гюйгенс'),
(796, 'board', 466, 93, '2016-04-10 20:19:34', 'яя ва ва в'),
(798, 'news', 55, 33, '2016-04-12 08:18:52', 'опа раз-два\n'),
(799, 'news', 55, 33, '2016-04-12 08:18:59', 'раз два'),
(800, 'news', 55, 33, '2016-04-12 08:19:07', 'пам пам'),
(801, 'news', 55, 33, '2016-04-12 08:19:32', 'туц туй комменты '),
(802, 'news', 55, 33, '2016-04-12 08:23:20', 'ь очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень много текста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многоь очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень много текста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень многотекста может быть очень очень много'),
(804, 'board', 466, 33, '2016-04-13 12:31:58', 'такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать такое кол-во теста , что можно роман написать'),
(805, 'board', 474, 33, '2016-04-13 13:07:10', 'ыыыыы'),
(806, 'board', 474, 33, '2016-04-13 13:07:12', 'ыыыыы'),
(807, 'board', 474, 33, '2016-04-13 13:07:16', 'ыыыыы'),
(808, 'board', 474, 33, '2016-04-13 13:07:32', 'ыыыыы'),
(809, 'board', 474, 33, '2016-04-13 13:07:33', 'ыыыыы'),
(810, 'board', 474, 33, '2016-04-13 13:07:34', 'ыыыыы'),
(813, 'board', 474, 33, '2016-04-13 13:08:02', 'ыыы'),
(814, 'board', 475, 33, '2016-04-13 13:08:18', 'ццццц'),
(822, 'board', 477, 33, '2016-04-13 13:10:59', 'вввв'),
(827, 'board', 478, 33, '2016-04-13 13:12:16', 'кккк'),
(832, 'video', 55, 33, '2016-04-13 13:18:51', 'вввввввввввввввввв'),
(836, 'board', 204, 33, '2016-04-13 13:20:00', 'вввв'),
(837, 'photo', 441, 33, '2016-04-13 13:20:35', 'ыыыыыыыы'),
(842, 'events', 29, 33, '2016-04-13 16:04:47', 'вввв'),
(844, 'events', 25, 33, '2016-04-13 21:39:26', ' много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводитьмного текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводитьмного текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить много текста следует здесь выводить'),
(845, 'board', 204, 33, '2016-04-15 18:31:41', 'ыыыы'),
(846, 'board', 467, 93, '2016-04-15 18:46:57', 'llll\n'),
(849, 'board', 475, 14, '2016-04-16 18:03:46', 'Коммент на стене вебэпирика'),
(850, 'board', 482, 93, '2016-04-16 18:04:57', 'Коммент на моей стене, когда только я'),
(851, 'board', 482, 14, '2016-04-16 18:06:51', 'Когда только друзья, а я не друг сейчас'),
(852, 'board', 482, 14, '2016-04-16 18:07:53', 'еще раз когда ене друг'),
(853, 'board', 447, 93, '2016-04-17 04:12:17', 'йййййййй'),
(854, 'board', 488, 93, '2016-04-17 04:29:37', 'йййй'),
(855, 'board', 447, 93, '2016-04-17 04:30:19', 'ццц'),
(856, 'board', 414, 14, '2016-04-17 04:44:57', 'ууууу'),
(859, 'board', 492, 14, '2016-04-17 04:48:53', 'ууууу'),
(860, 'board', 493, 93, '2016-04-17 04:50:17', 'aaaa'),
(863, 'board', 493, 93, '2016-04-17 04:50:48', 'qqq'),
(864, 'board', 445, 93, '2016-04-17 04:52:33', 'wwww'),
(865, 'board', 445, 93, '2016-04-17 04:53:48', 'qqqq'),
(866, 'board', 414, 93, '2016-04-17 04:53:57', 'qqqq'),
(867, 'board', 475, 93, '2016-04-17 04:57:19', 'qqqq'),
(868, 'board', 384, 93, '2016-04-17 04:58:18', 'qqq'),
(869, 'board', 498, 14, '2016-04-17 04:58:56', 'цццц'),
(870, 'board', 497, 14, '2016-04-17 04:59:00', 'ццц'),
(871, 'news', 31, 14, '2016-04-17 14:27:08', 'ууууу'),
(872, 'board', 382, 14, '2016-04-17 14:57:43', 'ввввввв'),
(873, 'board', 382, 14, '2016-04-17 15:03:30', 'ввввв'),
(874, 'board', 382, 14, '2016-04-17 15:08:22', 'уууууу'),
(878, 'board', 499, 14, '2016-04-17 16:53:31', 'вввввввввввввввввв'),
(879, 'board', 380, 14, '2016-04-17 16:54:48', 'пппппппппппппппппппппп'),
(882, 'board', 501, 82, '2016-04-18 21:36:09', 'Избранная статья\n\n«О начале человеческой истории (проблемы палеопсихологии)» — философско-естественнонаучный трактат советского историка Б. Ф. Поршнева, посвящённый проблемам антропогенеза. Первоначальный замысел книги о человеческой праистории относился к 1924 году, хотя непосредственно к теме возникновения Homo sapiens Б. Поршнев обратился в 1950-е годы в связи с интересом к троглодитидам и проблеме «снежного человека». После 1968 года работа исследователя была целиком посвящена написанию и публикации «О начале человеческой истории», которую он считал главным исследовательским трудом в своей жизни.\n\nКнига содержит сложное междисциплинарное исследование на стыке физической антропологии, эволюционной психологии, социологии, философии истории и ряда других дисциплин. Вынесенное в заглавие «начало» в понимании автора являлось ключевым применительно ко всему комплексу наук о человеческом обществе и человеке в обществе, создавая исследовательскую программу. Для Б. Поршнева существовало Избранная статья\n\n«О начале человеческой истории (проблемы палеопсихологии)» — философско-естественнонаучный трактат советского историка Б. Ф. Поршнева, посвящённый проблемам антропогенеза. Первоначальный замысел книги о человеческой праистории относился к 1924 году, хотя непосредственно к теме возникновения Homo sapiens Б. Поршнев обратился в 1950-е годы в связи с интересом к троглодитидам и проблеме «снежного человека». После 1968 года работа исследователя была целиком посвящена написанию и публикации «О начале человеческой истории», которую он считал главным исследовательским трудом в своей жизни.\n\nКнига содержит сложное междисциплинарное исследование на стыке физической антропологии, эволюционной психологии, социологии, философии истории и ряда других дисциплин. Вынесенное в заглавие «начало» в понимании автора являлось ключевым применительно ко всему комплексу наук о человеческом обществе и человеке в обществе, создавая исследовательскую программу. Для Б. Поршнева существовало Избранная статья\n\n«О начале человеческой истории (проблемы палеопсихологии)» — философско-естественнонаучный трактат советского историка Б. Ф. Поршнева, посвящённый проблемам антропогенеза. Первоначальный замысел книги о человеческой праистории относился к 1924 году, хотя непосредственно к теме возникновения Homo sapiens Б. Поршнев обратился в 1950-е годы в связи с интересом к троглодитидам и проблеме «снежного человека». После 1968 года работа исследователя была целиком посвящена написанию и публикации «О начале человеческой истории», которую он считал главным исследовательским трудом в своей жизни.\n\nКнига содержит сложное междисциплинарное исследование на стыке физической антропологии, эволюционной психологии, социологии, философии истории и ряда других дисциплин. Вынесенное в заглавие «начало» в понимании автора являлось ключевым применительно ко всему комплексу наук о человеческом обществе и человеке в обществе, создавая исследовательскую программу. Для Б. Поршнева существовало '),
(883, 'board', 377, 14, '2016-04-19 17:43:01', 'dfsdfdsf'),
(884, 'board', 503, 33, '2016-04-20 08:15:23', 'опоп '),
(885, 'board', 503, 33, '2016-04-20 08:15:27', 'раз два'),
(886, 'board', 503, 33, '2016-04-20 08:15:33', 'три '),
(887, 'board', 394, 33, '2016-04-20 08:20:13', 'привет'),
(888, 'board', 394, 33, '2016-04-20 08:20:19', 'привет');
INSERT INTO `z_comments` (`id`, `elem_type`, `elem_id`, `user_id`, `created`, `comment`) VALUES
(889, 'board', 394, 33, '2016-04-20 08:20:24', 'привет'),
(890, 'board', 504, 33, '2016-04-20 08:22:53', '12'),
(892, 'board', 504, 33, '2016-04-20 08:22:59', '12423'),
(893, 'board', 326, 14, '2016-04-21 16:15:07', 'sdfsdfsfsdf'),
(895, 'events', 25, 14, '2016-04-21 18:31:34', ' ssssssssssssss'),
(897, 'events', 25, 14, '2016-04-21 18:33:45', 'sssssssssss'),
(898, 'events', 25, 14, '2016-04-21 18:33:47', ' dddddddddddddd'),
(902, 'article', 47, 14, '2016-04-21 18:36:20', 'asdasdasdasdasd'),
(904, 'article', 47, 14, '2016-04-21 18:36:45', 'sdfsdgsdfdfhfdghgh'),
(905, 'article', 47, 14, '2016-04-21 18:36:48', 'fghfghfgh'),
(906, 'events', 25, 14, '2016-04-21 18:36:58', 'asdfsdfsdfasdf'),
(907, 'events', 25, 14, '2016-04-21 18:37:00', ' asdfasdfsadfasdf'),
(908, 'events', 25, 14, '2016-04-21 18:37:39', 'xdfsdfsdfsdf'),
(909, 'events', 25, 14, '2016-04-21 18:37:53', ' hfdgdhfghdfjghjfj'),
(910, 'article', 45, 14, '2016-04-21 18:38:35', 'привет'),
(911, 'events', 25, 14, '2016-04-21 18:39:32', 'dddddddddddddddddddddddddddddddddddddddddddddd'),
(913, 'events', 25, 14, '2016-04-21 18:40:27', 'ааа'),
(914, 'events', 25, 14, '2016-04-21 18:41:16', ' wwwwwwwwwwwwwwwwwwwwwwww'),
(916, 'school', 18, 14, '2016-04-21 19:13:42', 'fsdfsdfsdf'),
(917, 'events', 25, 14, '2016-04-21 19:14:00', 'опа\n'),
(918, 'school', 17, 33, '2016-04-21 19:21:10', 'привте'),
(920, 'board', 515, 38, '2016-04-23 15:23:32', 'ываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываываыва'),
(921, 'video', 52, 38, '2016-04-23 15:37:56', 'ываываыва'),
(924, 'board', 475, 14, '2016-04-26 16:11:55', 'чпяваяварвапв'),
(928, 'board', 475, 14, '2016-04-27 18:06:26', 'd fsd sd sd d'),
(929, 'news', 88, 33, '2016-04-27 21:18:08', 'раз два'),
(932, 'events', 30, 33, '2016-04-27 21:30:37', ' опа '),
(933, 'events', 30, 33, '2016-04-27 21:30:44', ' туц-туц'),
(934, 'events', 30, 33, '2016-04-27 21:30:47', ' опа'),
(935, 'board', 508, 14, '2016-04-27 22:05:45', 'привет'),
(938, 'board', 531, 14, '2016-04-28 14:16:52', 'dddddddddddddddddd'),
(939, 'board', 531, 14, '2016-04-28 14:16:55', 'dddddddddddddddddd'),
(941, 'board', 529, 14, '2016-04-28 14:18:10', 'dddd'),
(942, 'board', 529, 14, '2016-04-28 14:18:17', 'eeee'),
(943, 'board', 518, 14, '2016-04-28 14:18:29', 'ffff'),
(944, 'board', 382, 14, '2016-04-28 14:37:47', 'www'),
(949, 'board', 549, 93, '2016-05-04 14:39:28', 'Классный коп!'),
(950, 'photo', 427, 93, '2016-05-04 18:19:07', 'fffffffffffffffffffff'),
(951, 'photo', 425, 93, '2016-05-04 19:31:24', 'zxfzdfzdf'),
(952, 'photo', 546, 33, '2016-05-04 21:41:37', 'привет'),
(953, 'photo', 546, 33, '2016-05-04 21:41:46', 'что нового'),
(954, 'photo', 546, 33, '2016-05-04 21:41:56', 'а что ты делаешь?'),
(955, 'photo', 546, 33, '2016-05-04 21:42:02', 'вот это да '),
(956, 'photo', 586, 38, '2016-05-05 13:56:06', 'фывфыв'),
(958, 'photo', 431, 93, '2016-05-05 16:22:19', 'ввввввввввввввввв'),
(959, 'video', 55, 33, '2016-05-05 19:57:39', 'ghbdtn'),
(960, 'board', 565, 14, '2016-05-06 05:04:52', 'sdafasdfsadfsa'),
(962, 'school', 26, 38, '2016-05-06 07:18:46', 'ываыв'),
(963, 'school', 26, 38, '2016-05-06 07:18:52', ' фвавыв'),
(964, 'board', 568, 33, '2016-05-06 13:41:12', 'привет'),
(965, 'board', 591, 14, '2016-05-06 13:48:52', 'фывллфы ллфылфыв ж\nфыв\n'),
(966, 'photo', 594, 14, '2016-05-06 14:55:20', ' привет'),
(967, 'photo', 594, 14, '2016-05-06 14:55:46', 'привет'),
(968, 'board', 568, 14, '2016-05-06 15:00:07', 'Тест\n'),
(969, 'board', 568, 14, '2016-05-06 15:00:24', 'Ещё тест'),
(970, 'news', 60, 14, '2016-05-06 19:19:31', 'ghbdtn'),
(971, 'photo', 594, 14, '2016-05-06 19:29:10', 'привет\n'),
(972, 'photo', 590, 14, '2016-05-06 19:29:27', 'привет'),
(973, 'photo', 431, 14, '2016-05-06 19:29:38', 'привет'),
(974, 'video', 50, 14, '2016-05-06 19:32:09', 'ghbdtn'),
(975, 'board', 588, 33, '2016-05-06 19:42:51', 'ghbdtn'),
(976, 'board', 588, 33, '2016-05-06 19:42:53', 'ghbdtn'),
(977, 'board', 588, 33, '2016-05-06 19:42:54', 'ghbdtn'),
(978, 'board', 588, 33, '2016-05-06 19:42:54', 'ghbdtn'),
(979, 'photo', 431, 33, '2016-05-06 19:43:04', 'опа'),
(980, 'board', 588, 33, '2016-05-06 19:43:10', 'опа'),
(981, 'board', 587, 33, '2016-05-06 19:43:16', 'опа'),
(984, 'board', 587, 33, '2016-05-06 19:43:17', 'опа'),
(994, 'news', 25, 33, '2016-11-20 19:14:02', ' '),
(995, 'news', 28, 14, '2016-11-20 19:40:58', ' '),
(997, 'news', 25, 14, '2016-11-21 00:09:43', '3543'),
(998, 'news', 25, 14, '2016-11-21 00:09:54', '3543'),
(999, 'news', 25, 14, '2016-11-21 00:09:55', '3543'),
(1000, 'news', 23, 14, '2016-11-22 03:54:52', 'sometext5'),
(1003, 'news', 88, 14, '2016-11-23 15:11:01', 'habra4453453kadabra_я тестовый текст 123'),
(1004, 'news', 88, 14, '2016-11-23 15:11:03', 'habr434a4453453kadabra_я тестовый текст 123'),
(1005, 'news', 88, 14, '2016-11-23 15:11:05', 'habr434a44534343kadabra_я тестовый текст 123'),
(1006, 'news', 88, 14, '2016-11-24 07:23:43', 'habr434a44534343kadabra_я тестовый текст 1234'),
(1008, 'news', 88, 14, '2016-11-24 07:48:45', 'habr434a44534343kadabra_я тестовый текст 123456'),
(1010, 'news', 88, 14, '2016-11-24 07:48:49', 'habr434a44534343kadabra_я тестовый текст 8'),
(1016, 'news', 88, 14, '2016-11-24 09:19:38', 'tryrtyertet222'),
(1017, 'news', 88, 14, '2016-11-24 09:21:24', 'habr434a445344'),
(1018, 'news', 88, 14, '2016-11-24 09:38:33', 'tryrtyertet222www'),
(1019, 'news', 88, 14, '2016-11-24 09:42:16', 'tryrtyertet222wwwasdasda '),
(1020, 'news', 88, 14, '2016-11-24 09:44:08', 'tryrtyertet222wwwasdasda 23424'),
(1021, 'news', 88, 14, '2016-11-24 09:44:19', 'tryrtyertet222wwwasdasda q2'),
(1022, 'news', 88, 14, '2016-11-24 09:44:56', 'tryrtyertet222wwwasdas232'),
(1023, 'news', 88, 14, '2016-11-24 09:45:00', 'tryrtyertet222wwwasdas232234234'),
(1024, 'news', 88, 14, '2016-11-24 09:52:04', 'dfsdfn ,msdf., smdf., msdf asdasdads asd asd'),
(1025, 'news', 88, 14, '2016-11-24 10:04:12', 'Красивый коммент'),
(1026, 'news', 88, 14, '2016-11-24 23:49:25', 'habr434a4453447\\'),
(1027, 'news', 88, 14, '2016-11-25 01:48:57', 'Comment'),
(1028, 'news', 88, 14, '2016-11-25 02:07:15', 'фывфывфывasdasdasdasd'),
(1038, 'news', 88, 14, '2016-11-25 04:32:09', 'My new comment'),
(1039, 'news', 88, 14, '2016-11-25 04:33:32', 'My new comment 1123445'),
(1042, 'news', 88, 14, '2016-11-25 04:51:36', 'My new comment 112344526776'),
(1043, 'news', 88, 14, '2016-11-25 04:53:15', 'My new comment 1123445234534'),
(1044, 'news', 88, 14, '2016-11-25 04:54:31', 'My new comment 123'),
(1045, 'news', 88, 14, '2016-11-25 05:02:39', 'My new comme1'),
(1046, 'news', 88, 14, '2016-11-25 05:03:14', 'My new comme14'),
(1047, 'news', 88, 14, '2016-11-25 05:03:59', 'My new comme144'),
(1048, 'news', 88, 14, '2016-11-25 05:04:45', 'My new comme1444'),
(1049, 'news', 88, 14, '2016-11-25 05:05:04', 'My new comme14448'),
(1050, 'news', 88, 14, '2016-11-25 05:08:00', 'My new comme14449'),
(1051, 'news', 88, 14, '2016-11-25 05:09:26', 'My new comme14449as'),
(1053, 'news', 88, 14, '2016-11-26 01:40:48', 'My new comme14449asdf'),
(1056, 'news', 99, 14, '2016-11-26 07:53:32', 'New comment\n'),
(1057, 'news', 99, 14, '2016-11-26 07:54:13', 'New comment 2\n'),
(1058, 'news', 99, 14, '2016-11-26 07:54:23', 'New comment 3\n\n'),
(1059, 'news', 88, 14, '2016-12-02 15:12:05', '789789\n\n'),
(1060, 'news', 88, 14, '2016-12-02 15:16:15', '78978998889\n\n'),
(1061, 'news', 88, 14, '2016-12-02 15:28:16', 'zoom\n'),
(1062, 'news', 88, 14, '2016-12-02 15:28:36', 'zazazaaz'),
(1063, 'news', 123, 14, '2016-12-03 23:59:01', 'Test To'),
(1064, 'news', 123, 14, '2016-12-04 00:00:19', 'Test'),
(1065, 'news', 123, 14, '2016-12-04 00:49:44', 'Toast'),
(1066, 'news', 123, 14, '2016-12-04 21:43:40', 'Test unique'),
(1068, 'news', 84, 14, '2016-12-05 13:46:35', 'Test456'),
(1069, 'news', 125, 14, '2016-12-05 15:00:15', 'Test456'),
(1070, 'news', 88, 14, '2016-12-28 02:36:32', 'Тестовый\r\n'),
(1073, 'events', 38, 14, '2016-12-28 04:37:56', 'Test more'),
(1077, 'news', 141, 15, '2017-05-22 14:59:05', 'Another test'),
(1078, 'news', 141, 15, '2017-05-22 15:06:04', 'New'),
(1079, 'news', 141, 15, '2017-05-22 15:32:11', 'you'),
(1080, 'news', 141, 15, '2017-05-22 15:33:57', 'you2'),
(1081, 'news', 141, 15, '2017-05-22 15:35:26', 'fara'),
(1082, 'news', 141, 15, '2017-05-22 15:37:45', 'faray'),
(1083, 'news', 141, 15, '2017-05-22 15:41:56', 'Thanks'),
(1084, 'news', 141, 15, '2017-05-22 15:47:29', 'Thanks yu'),
(1085, 'news', 141, 15, '2017-05-22 15:50:33', 'Thanks yum'),
(1086, 'news', 141, 15, '2017-05-22 15:52:30', 'Thanks yum33'),
(1087, 'news', 141, 15, '2017-05-22 15:54:12', 'Thanks yum334'),
(1088, 'news', 141, 15, '2017-05-22 15:58:17', 'Thanks yum3343'),
(1089, 'news', 141, 15, '2017-05-22 15:59:10', 'Thanks yum33433'),
(1090, 'news', 141, 15, '2017-05-22 15:59:17', 'Thanks yum3343344'),
(1091, 'news', 141, 15, '2017-05-22 16:00:18', 'Thanks yum33433443'),
(1092, 'news', 141, 15, '2017-05-22 16:10:20', 'Test'),
(1095, 'news', 141, 15, '2017-05-22 19:22:50', 'Testoo\n'),
(1096, 'news', 141, 15, '2017-05-22 19:37:34', 'Testoo6\n'),
(1097, 'news', 80, 15, '2017-05-22 19:40:20', 'Testoo6\n'),
(1098, 'news', 80, 15, '2017-05-22 19:48:47', 'Testoo6a\n'),
(1099, 'news', 80, 15, '2017-05-22 19:54:52', 'asass\n'),
(1100, 'news', 80, 15, '2017-05-22 19:54:59', 'Poopie'),
(1101, 'article', 140, 15, '2017-05-22 20:03:56', 'Test foundation\n'),
(1102, 'article', 140, 15, '2017-05-22 20:04:54', 'Test foundation 4\n'),
(1104, 'article', 140, 15, '2017-05-22 21:12:12', 'Еуые'),
(1105, 'school', 45, 15, '2017-05-22 21:14:11', 'Test'),
(1106, 'events', 49, 14, '2017-06-12 20:16:50', 'нЕуы'),
(1107, 'video', 56, 14, '2017-07-16 09:40:02', 'Poop da poop'),
(1108, 'video', 56, 14, '2017-07-16 09:40:34', 'Poop da poopa'),
(1110, 'video', 56, 14, '2017-07-16 09:51:22', 'Poop da poop llama'),
(1112, 'video', 56, 14, '2017-07-16 10:20:50', 'Poop da poop llama2'),
(1113, 'video', 50, 14, '2017-07-16 10:21:40', 'Poop da poop llama2'),
(1114, 'video', 56, 14, '2017-07-17 07:06:04', 'Poop da poop llama3'),
(1115, 'video', 56, 14, '2017-07-17 07:08:41', 'Poop da poop llama4'),
(1116, 'video', 56, 14, '2017-07-17 07:09:46', 'test'),
(1117, 'video', 56, 14, '2017-07-17 07:10:51', 'reck'),
(1118, 'video', 56, 14, '2017-07-17 07:11:33', 'reck2'),
(1119, 'video', 56, 14, '2017-07-17 07:13:10', 'tests'),
(1120, 'video', 56, 14, '2017-07-17 07:13:26', 'loltest'),
(1121, 'video', 50, 14, '2017-07-17 07:28:17', 'asdasd2323222225'),
(1122, 'video', 56, 14, '2017-07-17 07:30:54', 'asdasd2323222225'),
(1123, 'video', 56, 14, '2017-07-17 07:33:28', 'asdasd23232222252'),
(1124, 'video', 56, 14, '2017-07-17 08:13:45', 'new s'),
(1125, 'news', 141, 14, '2017-07-17 08:45:37', 'new s'),
(1126, 'school', 56, 14, '2017-07-17 08:57:05', 'test comment'),
(1127, 'events', 50, 14, '2017-07-17 09:04:53', 'wwwwww'),
(1128, 'events', 50, 14, '2017-07-17 09:05:06', 'rrr'),
(1130, 'board', 568, 14, '2017-07-27 21:23:58', 'new s3123'),
(1131, 'board', 568, 14, '2017-07-27 21:31:43', 'Crap'),
(1132, 'board', 568, 14, '2017-07-27 21:33:30', 'test\n'),
(1136, 'video', 56, 14, '2017-07-27 22:09:51', '123'),
(1138, 'video', 56, 14, '2017-07-31 18:19:05', 'ываываыва'),
(1140, 'video', 56, 14, '2017-08-04 09:50:39', 'asd'),
(1141, 'video', 56, 14, '2017-08-04 10:11:26', 'asdasaaa'),
(1142, 'video', 56, 14, '2017-08-04 10:11:38', 'asdasaaaaaaaas'),
(1143, 'video', 56, 14, '2017-08-04 10:12:22', 'asdasaaaaaaaas2'),
(1144, 'video', 56, 14, '2017-08-04 10:17:02', 'asdasaaaaaaaas22'),
(1145, 'video', 56, 14, '2017-08-04 10:54:10', 'asdasaaaaaaaas223'),
(1146, 'video', 56, 14, '2017-08-04 10:56:52', 'asdasaaaaaaaas22334'),
(1147, 'video', 56, 14, '2017-08-04 10:58:22', 'asdasaaaaaaaas22334r'),
(1148, 'video', 56, 14, '2017-08-04 10:59:29', 'asdasaaaaaaaas22334r3'),
(1149, 'video', 56, 14, '2017-08-04 11:11:02', 'приветы'),
(1150, 'video', 56, 14, '2017-08-04 11:18:21', 'sdfsdf'),
(1151, 'video', 50, 14, '2017-08-04 11:20:37', 'sdfsdf'),
(1152, 'video', 56, 14, '2017-08-04 12:10:30', 'sssssssss2'),
(1153, 'board', 595, 14, '2017-08-04 12:10:43', '22222222242'),
(1154, 'board', 595, 14, '2017-08-04 12:13:39', 'test'),
(1156, 'comments', 594, 14, '2017-08-04 12:24:47', '2323'),
(1157, 'board', 594, 14, '2017-08-04 12:27:58', '232322'),
(1158, 'board', 594, 14, '2017-08-04 12:28:33', '23232232323'),
(1159, 'board', 594, 14, '2017-08-04 12:29:43', '2321'),
(1160, 'board', 594, 14, '2017-08-04 12:30:11', '5223'),
(1161, 'board', 594, 14, '2017-08-04 12:33:53', '323244'),
(1162, 'board', 594, 14, '2017-08-04 12:34:18', '342'),
(1163, 'board', 589, 14, '2017-08-04 12:35:03', 'test'),
(1164, 'board', 595, 14, '2017-08-04 12:36:39', 'shoop'),
(1165, 'board', 589, 14, '2017-08-04 12:38:20', 'testss'),
(1166, 'board', 589, 14, '2017-08-04 12:38:34', 'testss2'),
(1168, 'video', 56, 14, '2017-08-04 12:40:28', 'asad'),
(1169, 'video', 56, 14, '2017-08-04 12:41:40', 'asd2'),
(1170, 'board', 542, 14, '2017-08-04 12:43:19', 'test'),
(1171, 'board', 539, 14, '2017-08-04 12:43:28', 'qqa'),
(1172, 'board', 539, 14, '2017-08-04 12:44:09', 'ttt'),
(1174, 'video', 56, 14, '2017-08-04 12:47:12', 'waaa'),
(1175, 'video', 56, 14, '2017-08-04 13:02:31', 'assaa'),
(1176, 'board', 594, 14, '2017-08-04 13:05:40', 'warrrr'),
(1180, 'board', 564, 14, '2017-08-04 15:34:36', 'alert(1);'),
(1181, 'board', 564, 14, '2017-08-04 15:34:57', 'alert(1);3'),
(1184, 'board', 594, 14, '2017-08-08 17:38:53', 'Привет'),
(1185, 'board', 589, 14, '2017-08-10 15:23:44', 'аываываываывывавыа'),
(1186, 'board', 548, 14, '2017-09-04 04:42:45', 'dsfsdf sdf sd f'),
(1187, 'board', 566, 14, '2017-09-09 12:14:49', '8\n45434'),
(1188, 'comments', 568, 14, '2017-09-16 01:35:22', 'Test'),
(1189, 'comments', 594, 14, '2017-09-16 01:36:51', 'Testa'),
(1190, 'comments', 566, 14, '2017-09-16 01:43:08', 'Testallo'),
(1191, 'board', 567, 14, '2017-09-16 01:54:17', 'Testallo'),
(1192, 'board', 566, 14, '2017-09-16 01:58:34', 'Get the'),
(1193, 'board', 594, 14, '2017-09-16 02:24:25', 'asd'),
(1194, 'board', 566, 14, '2017-09-16 02:26:23', 'tootsd'),
(1195, 'board', 566, 14, '2017-09-16 02:27:23', 'tests'),
(1196, 'board', 565, 14, '2017-09-16 02:42:12', 'good'),
(1197, 'board', 565, 14, '2017-09-16 02:44:01', 'goodaa'),
(1198, 'board', 565, 14, '2017-09-16 03:55:52', 'asad'),
(1199, 'board', 564, 14, '2017-09-16 20:55:33', 'Moorckocks'),
(1200, 'board', 564, 14, '2017-09-16 20:56:30', 'Moorckocks2'),
(1201, 'board', 564, 14, '2017-09-16 20:58:53', 'manly'),
(1202, 'board', 546, 14, '2017-09-16 21:01:05', 'Testi'),
(1203, 'board', 546, 14, '2017-09-16 21:02:06', 'Testia'),
(1204, 'board', 546, 14, '2017-09-16 21:02:19', 'Testiaa'),
(1205, 'board', 546, 14, '2017-09-16 21:02:51', 'Hop'),
(1206, 'board', 539, 14, '2017-09-16 21:15:17', 'Hopd'),
(1207, 'board', 542, 14, '2017-09-16 21:51:22', 'Hopd'),
(1208, 'board', 542, 14, '2017-09-16 21:52:35', 'Hopda'),
(1209, 'board', 542, 14, '2017-09-16 21:53:06', 'Hopdaa'),
(1210, 'board', 542, 14, '2017-09-16 21:53:38', 'Hopdaaa'),
(1211, 'board', 542, 14, '2017-09-16 21:54:05', 'Hopdaaaa'),
(1212, 'board', 542, 14, '2017-09-16 21:54:17', 'Hopdaaaaa'),
(1213, 'board', 542, 14, '2017-09-16 21:56:30', 'Hopdaaaaaa'),
(1214, 'board', 542, 14, '2017-09-16 21:56:50', 'Hopdaaaaaa2'),
(1215, 'board', 542, 14, '2017-09-16 21:58:46', 'Hopdaaaaaa2a'),
(1216, 'board', 542, 14, '2017-09-16 21:59:14', 'Pingvin'),
(1217, 'board', 539, 14, '2017-09-16 22:01:25', 'Kawaii!'),
(1218, 'board', 544, 14, '2017-09-16 22:03:14', 'my'),
(1219, 'board', 544, 14, '2017-09-16 22:03:34', 'more'),
(1220, 'board', 544, 14, '2017-09-16 22:05:41', 'crap'),
(1221, 'board', 544, 14, '2017-09-16 22:10:25', 'hall'),
(1222, 'board', 538, 14, '2017-09-16 22:12:47', 'test'),
(1223, 'board', 539, 14, '2017-09-16 22:14:55', 'tests'),
(1224, 'board', 594, 14, '2017-09-16 22:31:30', 'Stoop'),
(1225, 'board', 566, 14, '2017-09-16 22:33:06', 'waahha'),
(1226, 'board', 548, 14, '2017-09-16 22:35:17', 'poop'),
(1227, 'board', 548, 14, '2017-09-16 22:36:35', 'wa'),
(1228, 'board', 538, 14, '2017-09-16 22:37:54', 'Swac'),
(1229, 'board', 542, 14, '2017-09-16 22:39:04', 'waka waka'),
(1230, 'board', 546, 14, '2017-09-16 22:39:31', 'tot'),
(1231, 'board', 542, 14, '2017-09-16 22:41:38', 'waka'),
(1232, 'board', 544, 14, '2017-09-16 22:44:54', 'aas'),
(1233, 'board', 544, 14, '2017-09-16 22:46:00', 'arch'),
(1234, 'board', 594, 14, '2017-09-16 22:48:10', 'faaaw'),
(1235, 'board', 544, 14, '2017-09-16 22:51:59', 'ASDASD'),
(1236, 'board', 542, 14, '2017-09-16 22:53:28', 'asd'),
(1237, 'board', 566, 14, '2017-09-16 22:56:20', 'kwa'),
(1238, 'board', 589, 14, '2017-09-16 22:59:39', 'Commentarius'),
(1239, 'board', 539, 14, '2017-09-17 00:06:08', 'New comment!'),
(1240, 'board', 568, 14, '2017-09-17 00:13:12', 'One more comment! '),
(1241, 'board', 595, 14, '2017-12-07 10:08:55', 'Test2vb f '),
(1242, 'board', 548, 14, '2017-12-07 10:11:28', 'dxgf'),
(1243, 'board', 548, 14, '2017-12-07 10:11:33', 'gvDF');

-- --------------------------------------------------------

--
-- Структура таблицы `z_confirm_email`
--

CREATE TABLE `z_confirm_email` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `confirm_key` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_confirm_email`
--

INSERT INTO `z_confirm_email` (`id`, `email`, `confirm_key`, `created`) VALUES
(1, '5464564646@gm.fu', 'FFELYNEtFJfmxXpOLrYfH0crmOxMxAkK', 1449674277),
(2, 'alexvold@mail.ru', 'lQcShVtGfjX_2qHg8O3ky0fw5SpEkJRl', 1449763254),
(3, 'ilasdadf@fdgdfg.co', 'Xbm5mK00cki5TtdQJbSmoh5ppvQE-Xyl', 1449763401),
(4, 'iluh-s@yandex.ru', 'KXsYRYhW9KcehdSqXIVZcs5PLaddaytn', 1450016463),
(5, 'radchenko87@gmail.com', 'b_dr-qGtiSu-1jVeDSrwS3gMoFgYD1kq', 1452081123),
(6, 'ilyapodanev@gmail.com', 'jwQPIjgt2Clw-_taVL8k2819cgMNGXkI', 1452081354),
(7, 'chestr@inbox.ru', 'NPOagqbEKY3NyahChQLINWzb02WFSW2V', 1452340637),
(8, 'roman.j.zharko@gmail.com', 'uwLDlqJlh-ViWkuQ3HMcsIaTuVW9BEkL', 1452597729),
(9, 'ramaja12@i.ua', 'tkKQKwRYhsaF0WliOj7t-SWZxWtXt_PG', 1452599518),
(10, 'danilpasko@gmail.com', '06dKH-hmWiB5H1suR2DpETqczJ3jKbST', 1452637064),
(11, 'alexvold@mail.ru', 'jUaIk9vDhL6bLor0yI1ObKy4c0Ftsy3u', 1452932146),
(13, '7yr1k.dp@gmail.com', 'yC_vsnK1Q-VeDldNvkRTUrEVLMAx0M_B', 1453079855),
(14, 'Dev_dev@appshop.com.ua', 'rrHT-EDSJCc8CkaqeQn2lG0OV-Ered91', 1453085127),
(16, 'jsaghdj@jhsgad.sed', '9iub7wv_nbIy6_Nnh3T1wJP_Lm_fBdq8', 1453987733),
(17, 'asdfsadf@asdfasf.com', 'aJ-9TgSXf1gCIJnymWsYePyoU7piO5_9', 1453989256),
(18, 'jambo@asfasf.ru', '3UGqd1OH0JhRHYrU8lwvc6ToslE2HgFJ', 1453989297),
(19, 'asfasdf@asfasdf.com', 's5VQTLLGqAyaUuMXD8Kn0GQkW8pIDpxX', 1453989349),
(20, 'asfasf@asfasf.ua', 'qWypw6m4-37w5z3v5AdKo_X33BY-Gpp-', 1453989387),
(21, 'asfsf@sfas.com', 'PpHnqkz-kXPHMoqTP5Rjk3pI5HLhnAsU', 1453989423),
(22, 'jambo@asfasf.com', 'r5Bt96OpPlSVu-GadtwwZzvCZSvthMLL', 1453989478),
(23, 'assdf@asdfaf.com', 'XzXroD6ilz2k62w5n8Sb8zTjqcIy7Fej', 1453989717),
(24, 'sfsadf@asfasf.com', 'u7UEXyysoUR7FmFb8OLwOygL9DavOBfP', 1453989771),
(25, 'sfasf@asfasf.ua', 'Oamk0F3CFNCDqQAQIe-vIeWD23rVXGU6', 1453989822),
(26, 'asfaf@asfas.com', 'hkfAmRNdT91-uOyCUveCevpyMkvRyu6Q', 1453989865),
(27, 'asdfsaf@asfas.com', 'v3BYYtgTzNIM30Zu2pS5NKV4GzddWpR_', 1453989909),
(28, 'asfasf@asdfasdf.com', 'NP-G6MaWtDRD7HFdDJsI4XZ6RRBteemo', 1453989952),
(29, 'asfsf@asfas.com', '0nqBsuvIGjKOnzc0-6Qffk_DNf85RVGG', 1453990006),
(30, 'asfd@asdf.com', 'Lc_96PGwtly_-AyEhgOmkVcDRYo97pY6', 1453990049),
(31, 'asfsaf@asfaf.com', 'pMaM_FDb-H6FJdvSWxX_xzl_PWQbobjx', 1453990097),
(48, 'rlopatkin@gmail.com', 'NLn1Tw6GwH7eiNALOHiOweuJ4udGo9JJ', 1459431633),
(51, 'rlopatkin@gmail.com', 'PBVhqKPUskrg8L_MhstdzYkO9p33-_-1', 1459436859),
(50, 'rlopatkin@gmail.com', 'dCJ8CzH7-dxTlIPD_zZYp9dg2fTu5Don', 1459436532),
(57, 'dxfire5@ukr.net', 'RlUXt466sIouIfb_13ymJhqTNl37RKnY', 1459449560),
(58, 'nataliamanzhos@gmail.com', 'tjQhkjVlmW_y3BIXoQYecSZHe7jbG-5U', 1459449632),
(64, 'rrlopatkin@gmail.com', '6tKemHotYqAYjBTIhyNCSfpO6ldDXd2n', 1460114831),
(65, 'rlopatkin@gmaill.com', 'PgqoptIMUrD-MFgaVUSA8M7ARn1M3b4W', 1460114906),
(67, 'rrlopatkin@gmail.com', 'LOK7BEx9xnjjegteb6c8QEQWUnE_uuQh', 1460116203),
(68, 'rlopatkin@gmail.com', 'GOnLkxT4YYx4i-WQ9o5YAdiif6R32Hc1', 1460116367),
(69, 'rlopatkin@gmail.com', 'FHzKh9UA7QqFis0B6NuVpZ1nx_-ZMQS5', 1460116915),
(71, 'battery.ukraine@gmail.com', 'n35WRXFQtkDx88_kTRQ9Nea6jT8sst_a', 1461419322),
(74, 'danil@gmail.com', '48fp9YC82NVvoRIC76KUMjzMwR9cjZ8_', 1462562447);

-- --------------------------------------------------------

--
-- Структура таблицы `z_dialog`
--

CREATE TABLE `z_dialog` (
  `id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_dialog`
--

INSERT INTO `z_dialog` (`id`, `created`, `name`) VALUES
(1, '2016-04-17 06:41:15', ''),
(2, '2016-04-17 12:20:40', ''),
(3, '2016-04-17 12:21:27', ''),
(4, '2016-04-17 12:22:20', ''),
(5, '2016-04-17 12:22:48', ''),
(6, '2016-04-23 15:29:24', ''),
(7, '2016-05-04 21:56:29', ''),
(8, '2016-05-05 14:14:35', '');

-- --------------------------------------------------------

--
-- Структура таблицы `z_dialog_members`
--

CREATE TABLE `z_dialog_members` (
  `id` int(11) NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `dialog` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_dialog_members`
--

INSERT INTO `z_dialog_members` (`id`, `user`, `dialog`) VALUES
(1, 14, 1),
(2, 35, 1),
(3, 14, 2),
(4, 31, 2),
(5, 14, 3),
(6, 33, 3),
(7, 14, 4),
(8, 13, 4),
(9, 14, 5),
(10, 38, 5),
(11, 38, 6),
(12, 82, 6),
(13, 83, 7),
(14, 33, 7),
(15, 79, 8),
(16, 38, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `z_events`
--

CREATE TABLE `z_events` (
  `id` int(11) NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` int(11) UNSIGNED NOT NULL,
  `album` int(11) UNSIGNED NOT NULL,
  `geolocation_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `price_currency` varchar(3) NOT NULL,
  `price_visual` int(11) DEFAULT '0',
  `phones` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_redact` int(11) NOT NULL,
  `redactor_id` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `events_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_events`
--

INSERT INTO `z_events` (`id`, `user`, `title`, `category`, `album`, `geolocation_id`, `description`, `price`, `price_currency`, `price_visual`, `phones`, `site`, `email`, `date_redact`, `redactor_id`, `status`, `created`, `img`, `events_date`) VALUES
(51, 14, 'Хип Хоп Фестиваль "Деталь Бита"', 1, 0, 78, '<p>На главной сцене Драмтеатра в г. Мариуполь состоится межрегиональный фестиваль уличных танцев (Hip Hop &amp; Break Dance) "Деталь Бита".</p><p>Категории:</p><p>-Breaking Kids Pro M<br>-Hip Hop Kids Pro M</p><p>-Breaking Juniors 1x1<br>-Hip Hop Juniors 1x1</p><p>-Breaking Pro 1x1<br>-Hip Hop Pro 1x1</p><p>Гости Фестиваля:<br>-Dj Boxman<br>-MC Loony Barada<br>-Корень из 9<br>-Beatbox Machine Bosko</p><p>Судьи:<br>-Bboy Maxi Move (Breaking) г.Киев<br>-Sam (Hip Hop) г.Харьков</p><p>Фирменные призы и подарки для победителей и призерев от организаторов и спонсоров фестиваля.</p><p>Регистрация:Участие + Мастер Класс от судей фестиваля на выбор:200 грн</p>', '200', 'UAH', 0, '+8(999)999-99-9999', 'https://vk.com/detal_bita', '', 0, 0, 0, 1494097094, '8/2/9/590e20b1d4fc9.jpg', '2017-05-26 08:00:00'),
(13, 14, 'Студия Танца «ART DREAM»', 2, 112, 0, 'Почувствуй как ты изящна от природы, Не надо сомневаться! Просто начните. Приходите в танцевальный зал и начните работу над собой… Прислушайтесь к себе, будьте внимательны к своему телу…. Вы окажетесь в одном ряду с трудолюбивыми грациозными красотками, Вы — уже одна из них. Сегодня Вы в самом центре прекрасного, разгоряченая кровь бежит по венам, расцветает румянец на щеках, руки, ноги, шея будто стала длиннее, плечи раскрыты, музыка пронзает насквозь, наполняя душу вдохновением…. Это то, без чего больше уже не сможешь… 6 уютных и теплых зала в самом центре города Днепропетровска. Ждём новых людей в нашей танцевальной семье! Тренера Студии Танца Арт-Дрим найдут подход к каждому, кто действительно хочет танцевать и развиваться. Ждём новых людей в нашей танцевальной семье!', '500', '', 0, '0553329291', 'http://art-dream.dp.ua/', 'blabla@gmail.com', 0, 0, 1, 1453881622, NULL, NULL),
(50, 14, 'BATTLE SCHOOL™ / HIP HAP SERIES™ 2017', 1, 0, 77, '<p>КОМАНДНЫЕ ШОУ, BREAK DANCE И HIP HOP ШОУ МИРОВОГО МАСШТАБА</p><p>16 сильнейших бибоев и хип хоперов США, Европы и Азии бросили вызов украинским танцорам.<br>Уже более 10 лет украинские брейк данс и хип хоп танцоры считаются одними из лучших в мире. <br>16 сентября Киев станет местом исторической встречи. <br>Вы увидите слет мировых легенд брейкинга и хип хопа, танцевальные битвы и командные шоу за призовой фонд 100 тыс. грн. <br>Приглашаем на шоу мирового масштаба! </p><p>Контесты:<br>● Int. breaking battle 1x1 за приз 25 000 грн.<br>● Int. hip hop battle 1x1 за приз 25 000 грн.<br>● Beginners breaking battle за приз 5 000 грн для танцоров с опытом до 4 лет.<br>● Beginners hip hop battle за приз 5 000 грн для танцоров с опытом до 4 лет.<br>● Dance Show Kids за приз 5 000 грн.<br>● Dance Show Juniors за приз 5 000 грн.<br>● Dance Show Adults за приз 30 000 грн.</p><p>Line Up:<br>● Судьи: легендарные танцоры из США, Европы и Азии <br>● Диджеи: топовые диджеи из Европы и Украины<br>● Топовые Мс из Англии и Украины<br>● Приглашенные участники: <br>- 8 топовых бибоев из США, Азии и Европы<br>- 8 топовых хип хоп танцоров из США, Азии и Европы.<br>Остальные участники определятся во время отбора 16 сентября </p><p>Имена гостей будут раскрываться постепенно... </p><p>с 1 го июня стартует регистрация и продажа билетов!</p>', '1', 'UAH', 0, '(044)222-00-22', 'http://www.hiphapseries.com/', '', 0, 0, 1, 1494095679, '4/6/0/590e1aa06051d.png', '2017-09-16 06:00:00'),
(42, 14, 'Баста. Большой концерт', 3, 0, 71, '<p><strong>Мощный кач от самого Басты – 17 июня в Stereo Plaza! Крутая программа из любимых хитов и точно – не без зачетных сюрпризов, вот что ждёт тебя в этот вечер.</strong></p><p><br>Продажа билетов на Басту обычно заканчивается едва начавшись. Советуем оформлять билеты себе и всем своим – прямо сейчас<br> <br>Для Киева уже становится доброй традицией принимать честного и чертовски близкого всем нам Басту. Последняя улётная встреча состоялась в ноябре 2016. Тогда рэпер неслабо прокачал зал Stereo Plaza. В полном лайв-составе команда Василия Вакуленко зажгла сердца тысяч поклонников. И теперь мы ждём от Басты чего-то запредельного. И он нам это даст!<br> <br>Столичная публика увидит новое шоу крутого исполнителя. Вместе обсудим, что обрел и что, возможно, утратил Баста за годы своего уверенного шествия к славе. Вместе с любимым рэпером вы сможете зачитать все полюбившиеся, такие простые и важные строки главных хитов. Это будет супершоу для всех посвященных!</p><p><iframe width="500" height="281" src="//www.youtube.com/embed/woCjlrBBJko" frameborder="0" allowfullscreen=""></iframe></p><p><br></p>', '500', 'UAH', 0, '(380)442-22-00', '', '', 0, 0, 1, 1493931205, '0/1/9/590b94c5eebf2.jpg', '2017-06-17 17:00:00'),
(43, 14, 'Thomas Mraz', 3, 0, 72, '<p>THOMASMRAZ (Neo-R&amp;B) в Киеве!</p><p> <br>Thomas Mraz, новый артист Booking Machine, отправляется в первый сольный тур по СНГ и Европе: на концертах прозвучит как новый EP "Do Not Shake The Spear", так и хорошо знакомые треки.</p><p><br> <br>Thomas легко маневрирует между жанрами на ретро-байке и с копьем наперевес, не боясь показаться чудаком в наш ироничный век. Все, кому не хватало этой искренности да и просто сильной новой музыки - увидимся на концертах!</p><p><br></p>', '400', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/eventpage/thomas-mraz', '', 0, 0, 1, 1493989068, '4/4/7/590c76cc377ac.jpg', '2017-05-12 16:00:00'),
(16, 14, 'Студия Танца «ART DREAM»', 1, 0, 0, '<p>Жизнь в ритме SOHO - это гармония души и тела!</p><p>Современный комплекс SOHO Fitness &amp; SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.</p><p>Комплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.</p><p>После активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.</p><p>Определяйте для себя правильное направление вместе с SOHO - в ритме будущего!</p>', '200', 'UAH', 0, '+8(888)888-88-8888', 'http://soho.dp.ua/', 'blabla@gmail.com', 0, 0, 0, 1453882312, NULL, '2017-07-13 21:00:00'),
(44, 14, 'Вагоновожатые', 3, 0, 73, '<p style="text-align: right;"><em>\r\n	"Весной всё плохо\r\n</em></p><p style="text-align: right;">\r\n	<em><span data-redactor-tag="span"></span>отвратительный запах цветочного смога\r\n</em></p><p style="text-align: right;"><em>\r\n	и деревья заключили контракт с купоросом <br>\r\n	все так радуются <br>\r\n	забывают, что вообще-то это предательство…"</em>\r\n</p><p>\r\n	<br>\r\n	 <br>\r\n	Эти строчки из композиции «Осень» - «вагоновожатых» вполне можно признать правдивыми и априори согласиться с ними. Да, старичули всегда охотнее играют осенью. Осень - самое продуктивное время для творчества и концертирования. И вы не должны сильно удивляться, что 13 мая - «Вагоновожатые» сыграют «Большой осенний концерт» в клубе Sentrum.\r\n</p><p>\r\n	<iframe width="500" height="281" src="//www.youtube.com/embed/luJWnhPp6ok" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p><p>\r\n	<br>\r\n</p><p>\r\n	Почему осенний? С этим всё просто. Май (лат. mensis Maius — «месяц богини Майи») — пятый месяц года в юлианском и григорианском календарях, третий месяц староримского года, начинавшегося до реформы Цезаря с марта. Один из семи месяцев длиной в 31 день.<br>\r\n	 <br>\r\n	В Северном полушарии Земли является третьим месяцем весны, в Южном — третьим месяцем осени! Поэтому ждём вас 13 мая на глоточек осеннего дождя, в коктейле с ветром и опавшими листьями и конечно новыми сюрпризами от «вагоновожатых».\r\n</p>', '270', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/eventpage/vagonovozhatye', '', 0, 0, 1, 1493989726, '5/9/7/590c795e51c79.jpg', '2017-05-13 17:00:00'),
(45, 14, 'Oxxxymiron', 3, 0, 74, '<p>\r\n	16 декабря российский рэпер Oxxxymiron созывает друзей на эпохальное Oxxxy-шоу в киевский Дворец спорта!\r\n</p>\r\n<p>\r\n	Грандиозный концерт состоится в рамках большого стадионного турне IMPERIVM! 12 наибольших стадионов постсоветского пространства, десятки тысяч поклонников и один Oxxxymiron! Это нужно видеть!\r\n</p>\r\n<p>\r\n	 <br>\r\n	Мирона Федорова (настоящее имя исполнителя) называют «белой вороной российского рэпа». Он чуть ли ни единственный представитель этой субкультуры, который выбился на большую сцену без ротаций и продюсерской поддержки. Талант и образование, умноженные на большое упорство, способны творить чудеса…<br>\r\n	 <br>\r\n	Детство и юношеские годы Мирона миновали за границей. Вместе с родителями мальчик жил и учился в Германии, потом в Британии. Выпускник Оксфордского университета мог выстроить респектабельную карьеру в Западной Европе. Но музыка всегда превалировала в его жизни. Чтобы добиться успеха на музыкальном поприще, нужно было не жить, а выживать. Парень подрабатывал репетитором, переводчиком, продавцом, гидом и даже грузчиком!\r\n</p>\r\n<div style="text-align:center">\r\n<p>\r\n	<iframe width="500" height="281" src="//www.youtube.com/embed/XBleNfmkScA" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p>\r\n</div>\r\n<p>\r\n	<br>\r\n</p>', '1099', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/eventpage/oxxxymiron', '', 0, 0, 1, 1493990544, '0/3/4/590c7c906c5f6.jpg', '2017-12-06 17:00:00'),
(46, 14, 'YARMAK. Большое шоу. 5 лет', 3, 0, 71, '<p>\r\n	11 ноября в Stereo Plaza будет настоящий взрыв качественного хип-хопа. В рамках Международного тура «5 лет», самый популярный украинский рэп-исполнитель YARMAK готовит не просто концерт, посвященный 5-летию его творчества, а настоящее шоу с презентацией нового альбома «RESTART»!\r\n</p>\r\n<p>\r\n	 <br>\r\n	Первая популярность к артисту пришла благодаря его трекам на остросоциальные темы и миллионам просмотров его клипов на YouTube. К примеру, его клип на песню «Сердце пацана» в 2013 году стал самым просматриваемым русскоязычным видео на YouTube, а по версии портала «Новый Рэп» победил в номинации «Видео года». Также YARMAK многим известен благодаря своей гражданской позиции и патриотической песне «22», которая стала гимном Революции Достоинства.\r\n</p>\r\n<div style="text-align:center">\r\n<p>\r\n	<iframe width="500" height="281" src="//www.youtube.com/embed/opb2rUqrSq0" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p>\r\n</div>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	В любом городе YARMAK собирает толпы своих поклонников, забивая залы практически до пределов, но его концерты в Киеве всегда отличались особой энергетикой и атмосферой. YARMAK в Киеве - это обязательно буря эмоций и невероятный драйв, когда весь зал «качает» в унисон.<br>\r\n	 <br>\r\n	В этот раз YARMAK для своего любимого города подготовил много интересного, а помимо презентации нового альбома, рэп-артист также исполнит свои главные хиты.<br>\r\n	 <br>\r\n	На Большом концерте 11-го ноября YARMAK обещает полномасштабное шоу и совершенно новый уровень хип-хопа.\r\n</p>\r\n<p>\r\n	<br>\r\n</p>', '1000', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/eventpage/yarmak-5let', '', 0, 0, 1, 1493992170, '9/6/0/590c82ea46086.jpg', '2017-11-11 17:00:00'),
(49, 14, 'Скриптонит в Одессе', 3, 0, 76, '<p>24 июня в одесском клубе Bono Beach Club состоится концерт Скриптонита! Казахстанский рэп-исполнитель представить зрителям свой новый альбом. Долгожданная пластинка обещает стать самым важным рэп-релизом этого года.</p><p>Резидент Творческого объединения Gazgolder Скриптонит появился в медиа пространстве в 2013-м: его видео VBVVVCTND буквально взорвало YouTube, собрав более полумиллиона просмотров за несколько дней. Его по праву называют одним из важнейших героев нового хип-хопа.</p><iframe width="560" height="315" src="https://www.youtube.com/embed/86xrsLhL6o8" frameborder="0" allowfullscreen=""></iframe><p>Скриптонит стал гостем на совместном альбоме Басты и Смоки Мо, записав с музыкантами два трека «Лед» и «Миллионер из трущоб», а также поучаствовал в записи новой пластинки культового британского исполнителя Tricky, выход которой намечен на 2016 год. </p><p>Сингл Скриптонита «Космос», записанный совместно с его коллегой по Gazgolder Дашей Чарушей, мгновенно занял первые места в чартах iTunes, а серия клипов, выпущенных на Gazgolder, набрала несколько миллионов просмотров в интернете.</p><p>В 2015-м Скриптонит выступил на крупнейших фестивалях Москвы, был номинирован на премию Jagermeister Indie Awards в категории «Лучший хип-хоп артист», а также подготовил к выходу сразу два дебютных альбома, первый из которых - «Дом с нормальными явлениями» стал одним из самых ярких музыкальных релизов прошлого года на постсоветском пространстве.</p><p>«Нет сомнений, что уже первым релизом этот человек обеспечил себе страницу-другую в книге об истории жанра, если таковая когда-нибудь будет написана. Да и просто без оглядки на жанры у Скриптонита получился один из самых впечатляющих русскоязычных альбомов 2015-го года», - «Афиша Daily».</p><p>Сейчас аудитория с нетерпением ждёт выхода его второй полноформатной пластинки, концертная презентация которой состоится 24 июня в одесском клубе Bono Beach Club. Не пропустите одно из главных событий мира хип-хопа в Вашем городе!</p>', '350', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/ua/eventpage/skriptonit-odessa', '', 0, 0, 1, 1494084370, '4/5/1/590deb128e3b2.jpg', '2017-06-24 20:59:00'),
(48, 14, 'Кровосток', 3, 0, 75, '<p>29 сентября – Кровосток снова посетит Киев! Концерт кумиров узкого круга знатаков пройдет столичном клубе Atlas.</p><p>Кровосток довольно часто посещают Киев с концертами. Даже свое 10-летие несколькими годами ранее<br>команда отмечала в кругу украинских поклонников. Здесь же, в столице, колектив презентовал свой альбом «Ломбард». Так что в Киеве Кровосток хорошо знают и всегда ждут их выступления. В этот раз самобытные и открытые (просто супероткрытые) музыканты исполнят свой самые мощные работы. Не пропустите!</p><p>Не совсем обычный, скажем так, колетив пытались запретить в России. Однако - это привело только к<br>увеличению заинтересованности общества. Творчество нестандартного колектива стало известно еще большему кругу людей. Что ж в них такого нестандартного? Много чего! Кровосток – это море парадоксов и неприкрытая реальность в одном флаконе.</p><p>Вот нам говорят «Думай позитивно, стакан всегда наполовину полон, всегда», и тут же начинают сыпать<br>отборной бранью или рисовать уж очень криминальные сюжеты. При этом «взрослые» темы песен Кровостока удивительным образом объединяются с интеллигентностью участников: Дмитрий «Фельдман» - талантливый инсталятор и писатель, а Антон «Шило» - художник и поэт.</p><p>Сегодня, Кровосток - это настоящая легенда российского хип-хоп андерграунда. Обязательно приходите,<br>чтобы послушать их откровенный и живой гангста-рэп, а точнее - художественную пародию на него. Ждем всех!</p>', '250', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/ua/eventpage/krovostok', '', 0, 0, 1, 1494083385, '2/6/4/590de739ca242.jpg', '2017-09-29 17:00:00'),
(47, 14, 'Скриптонит', 3, 0, 71, '<p>27 октября в киевской StereoPlaza состоится сольный концерт Скриптонита! Казахстанский рэп-исполнитель представить зрителям свой новый альбом. Долгожданная пластинка обещает стать самым важным рэп-релизом этого года.</p><p>Резидент Творческого объединения Gazgolder Скриптонит появился в медиа пространстве в 2013-м: его видео VBVVVCTND буквально взорвало YouTube, собрав более полумиллиона просмотров за несколько дней. Его по праву называют одним из важнейших героев нового хип-хопа.<span></span></p><iframe width="560" height="315" src="https://www.youtube.com/embed/86xrsLhL6o8" frameborder="0" allowfullscreen=""></iframe><p>Скриптонит стал гостем на совместном альбоме Басты и Смоки Мо, записав с музыкантами два трека «Лед» и «Миллионер из трущоб», а также поучаствовал в записи новой пластинки культового британского исполнителя Tricky, выход которой намечен на 2016 год. <br></p><p>Сингл Скриптонита «Космос», записанный совместно с его коллегой по Gazgolder Дашей Чарушей, мгновенно занял первые места в чартах iTunes, а серия клипов, выпущенных на Gazgolder, набрала несколько миллионов просмотров в интернете. </p><p>В 2015-м Скриптонит выступил на крупнейших фестивалях Москвы, был номинирован на премию Jagermeister Indie Awards в категории «Лучший хип-хоп артист», а также подготовил к выходу сразу два дебютных альбома, первый из которых - «Дом с нормальными явлениями» стал одним из самых ярких музыкальных релизов прошлого года на постсоветском пространстве.</p><p>«Нет сомнений, что уже первым релизом этот человек обеспечил себе страницу-другую в книге об истории жанра, если таковая когда-нибудь будет написана. Да и просто без оглядки на жанры у Скриптонита получился один из самых впечатляющих русскоязычных альбомов 2015-го года», - «Афиша Daily». </p><p>Сейчас аудитория с нетерпением ждёт выхода его второй полноформатной пластинки, концертная презентация которой состоится 6 октября на сцене StereoPlaza. Не пропустите одно из главных событий мира хип-хопа!</p><p><br></p>', '450', 'UAH', 0, '(044)222-00-22', 'https://www.concert.ua/ua/eventpage/skriptonit', '', 0, 0, 1, 1494080921, '3/7/1/590ddde2a7bef.jpg', '2017-10-27 17:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `z_friend`
--

CREATE TABLE `z_friend` (
  `id` int(11) NOT NULL,
  `user1` int(11) UNSIGNED NOT NULL,
  `user2` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_friend`
--

INSERT INTO `z_friend` (`id`, `user1`, `user2`, `status`) VALUES
(21, 31, 14, 1),
(22, 31, 13, 1),
(24, 32, 31, 1),
(25, 32, 30, 0),
(28, 32, 14, 1),
(30, 32, 13, 1),
(32, 31, 31, 1),
(34, 35, 14, 1),
(36, 14, 33, 1),
(38, 14, 29, 0),
(40, 37, 14, 1),
(41, 33, 36, 1),
(42, 33, 37, 1),
(43, 33, 35, 1),
(45, 14, 15, 0),
(46, 13, 14, 1),
(48, 14, 38, 1),
(49, 14, 36, 0),
(50, 14, 30, 0),
(51, 14, 27, 0),
(53, 45, 14, 1),
(54, 40, 14, 1),
(55, 42, 14, 1),
(56, 43, 14, 1),
(57, 44, 14, 1),
(58, 46, 14, 1),
(59, 47, 14, 1),
(60, 48, 14, 1),
(61, 49, 14, 1),
(62, 50, 14, 1),
(63, 51, 14, 1),
(64, 52, 14, 1),
(65, 53, 14, 1),
(66, 53, 13, 1),
(67, 54, 14, 1),
(68, 38, 33, 1),
(69, 41, 14, 1),
(70, 38, 13, 0),
(71, 14, 39, 0),
(72, 83, 33, 1),
(73, 83, 14, 1),
(74, 83, 43, 0),
(75, 33, 75, 0),
(76, 93, 33, 1),
(78, 33, 31, 1),
(81, 82, 15, 0),
(82, 82, 33, 1),
(83, 82, 38, 1),
(84, 82, 13, 0),
(85, 93, 14, 1),
(86, 79, 38, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `z_geolocation`
--

CREATE TABLE `z_geolocation` (
  `id` int(11) NOT NULL,
  `lat` varchar(32) NOT NULL,
  `lng` varchar(32) NOT NULL,
  `country` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `address` varchar(256) NOT NULL,
  `formatted_address` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `google_place_id` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_geolocation`
--

INSERT INTO `z_geolocation` (`id`, `lat`, `lng`, `country`, `city`, `address`, `formatted_address`, `name`, `google_place_id`) VALUES
(64, '47.8607322', '35.0248659', 'UA', 'Запорожье', 'вулиця Михайла Коцюбинського', 'вулиця Михайла Коцюбинського, Запоріжжя, Запорізька область, Украина', '', 'ChIJx5QAoO9j3EARGQ217jqlrAA'),
(65, '46.7480012', '36.8089657', 'UA', 'Бердянск', 'вулиця Івана Франка, 10', 'вулиця Івана Франка, 10, Бердянськ, Запорізька область, Украина, 71100', '', 'ChIJ5SSAR9DK50ARumIU5UEPZKM'),
(63, '47.8242092', '35.1709652', 'UA', 'Запорожье', 'вулиця Франка, 5', 'вулиця Франка, 5, Запоріжжя, Запорізька область, Украина', 'Первая Черниговская школа "Breakazoid"', 'EmXQstGD0LvQuNGG0Y8g0KTRgNCw0L3QutCwLCA1LCDQl9Cw0L_QvtGA0ZbQttC20Y8sINCX0LDQv9C-0YDRltC30YzQutCwINC-0LHQu9Cw0YHRgtGMLCDQo9C60YDQsNGX0L3QsA'),
(62, '46.4524519', '30.7539265', 'UA', 'Одесса', 'проспект Шевченка, 20', 'проспект Шевченка, 20, Одеса, Одеська область, Украина', 'Some other test school', 'EmDQv9GA0L7RgdC_0LXQutGCINCo0LXQstGH0LXQvdC60LAsIDIwLCDQntC00LXRgdCwLCDQntC00LXRgdGM0LrQsCDQvtCx0LvQsNGB0YLRjCwg0KPQutGA0LDRl9C90LA'),
(61, '46.7491013', '36.805876', 'UA', 'Бердянск', 'вулиця Івана Франка, 7', 'вулиця Івана Франка, 7, Бердянськ, Запорізька область, Украина, 71100', 'Первая Черниговская школа "Breakazoid"', 'ChIJnzocmNrK50ARU4xriv0-OpM'),
(59, '51.4932954', '31.304514', 'UA', 'Чернигов', 'вулиця Шевченка, 20', 'вулиця Шевченка, 20, Чернігів, Чернігівська область, Украина', '', 'EmzQstGD0LvQuNGG0Y8g0KjQtdCy0YfQtdC90LrQsCwgMjAsINCn0LXRgNC90ZbQs9GW0LIsINCn0LXRgNC90ZbQs9GW0LLRgdGM0LrQsCDQvtCx0LvQsNGB0YLRjCwg0KPQutGA0LDRl9C90LA'),
(58, '47.8440432', '35.107929', 'UA', 'Запорожье', 'бульвар Шевченка, 40', 'бульвар Шевченка, 40, Запоріжжя, Запорізька область, Украина', '', 'EmzQsdGD0LvRjNCy0LDRgCDQqNC10LLRh9C10L3QutCwLCA0MCwg0JfQsNC_0L7RgNGW0LbQttGPLCDQl9Cw0L_QvtGA0ZbQt9GM0LrQsCDQvtCx0LvQsNGB0YLRjCwg0KPQutGA0LDRl9C90LA'),
(57, '50.4493145', '30.5100184', 'UA', 'Киев', 'вулиця Івана Франка, 7', 'вулиця Івана Франка, 7, Київ, Украина, 01030', '', 'ChIJSc-LIlnO1EARQi9iXEeU9nk'),
(66, '46.7490216', '36.8055278', 'UA', 'Бердянск', 'вулиця Івана Франка, 5', 'вулиця Івана Франка, 5, Бердянськ, Запорізька область, Украина, 71100', '', 'ChIJP809l9rK50ARjp7nZIpqx_c'),
(68, '51.4932801', '31.3048741', 'UA', 'Чернигов', 'вулиця Шевченка, 21', 'вулиця Шевченка, 21, Чернігів, Чернігівська область, Украина', '', 'ChIJtRw06vFI1UYRcqc5vh_iL_Y'),
(69, '53.9290701', '27.5877107', 'BY', 'Минск', 'улица Сурганова, 50', 'ул. Сурганова 50, Минск, Беларусь', 'Dj школа в Минске №1', 'ChIJ6R9jswzP20YRGGvvkEfhkmo'),
(70, '53.910028', '27.5767511', 'BY', 'Минск', 'проспект Независимости', 'Площадь Победы, проспект Независимости, Минск, Беларусь', 'TopDJ School Minsk', 'ChIJB17Xf7vP20YRfLKrC3HwWQ8'),
(71, '50.4073306', '30.5124248', 'UA', 'Киев', 'проспект Валерія Лобановського, 119', 'проспект Валерія Лобановського, 119, Київ, Украина', '', 'ElnQv9GA0L7RgdC_0LXQutGCINCS0LDQu9C10YDRltGPINCb0L7QsdCw0L3QvtCy0YHRjNC60L7Qs9C-LCAxMTksINCa0LjRl9CyLCDQo9C60YDQsNGX0L3QsA'),
(72, '50.448573', '30.520202', 'UA', 'Киев', 'вулиця Прорізна, 8', 'вулиця Прорізна, 8, Київ, Украина', '', 'ChIJy72VMlfO1EARhM6Wjf0TFVQ'),
(73, '50.439015', '30.5208925', 'UA', 'Киев', 'вулиця Шота Руставелі, 7/11', 'вулиця Шота Руставелі, 7/11, Київ, Украина', '', 'ChIJQ1kBW_7O1EARlB4JDwn2QTo'),
(74, '50.4371865', '30.5223532', 'UA', 'Киев', 'Спортивна площа, 1', 'Київський Палац Спорту, Спортивна площа, 1, Київ, Украина', '', 'ChIJg8IHA_7O1EAR-Ey02lEsoE8'),
(75, '50.4559903', '30.4968556', 'UA', 'Киев', 'вулиця Січових Стрільців, 37', 'вулиця Січових Стрільців, 37, Київ, Украина, 02000', '', 'ChIJnaE4r2bO1EARFsKW-a3USUw'),
(76, '46.4709521', '30.7632959', 'UA', 'Одесса', 'Пляж Ланжерон, 1', 'Пляж Ланжерон, 1, Одеса, Одеська область, Украина', '', 'ElfQn9C70Y_QtiDQm9Cw0L3QttC10YDQvtC9LCAxLCDQntC00LXRgdCwLCDQntC00LXRgdGM0LrQsCDQvtCx0LvQsNGB0YLRjCwg0KPQutGA0LDQuNC90LA'),
(77, '50.4371855', '30.5224655', 'UA', 'Киев', 'Спортивна площа, 1', 'Спортивна площа, 1, Київ, Украина, 02000', '', 'ChIJH-gHA_7O1EARNb0wbFOyFhU'),
(78, '47.096028', '37.548736', 'UA', 'Мариуполь', 'Театральна площа, 1', 'Театральна площа, 1, Маріуполь, Донецька область, Украина, 87500', 'Место номер два', 'ChIJ78p-zmXk5kARX_3pdiNnqJM'),
(79, '43.239295', '76.9456253', 'KZ', 'Алма-Ата', 'улица Байсеитовой, 89', 'улица Байсеитовой 89, Алматы, Казахстан', 'STAY TRUE', 'EkbRg9C70LjRhtCwINCR0LDQudGB0LXQuNGC0L7QstC-0LkgODksINCQ0LvQvNCw0YLRiywg0JrQsNC30LDRhdGB0YLQsNC9'),
(80, '51.1688502', '71.4301784', 'KZ', 'Астана', 'проспект Абая, 47', 'проспект Абая 47, Астана 010000, Казахстан', 'My Way', 'ChIJHd41EyuBRUIRHHu5OcSIz60'),
(81, '55.743479', '37.651015', 'RU', 'Москва', 'Верхняя Радищевская улица, 16', 'Верхняя Радищевская ул., 16, Москва, Россия, 109240', 'Music Academy', 'ChIJzYF8ZO9KtUYRqYoPOujLbGY'),
(82, '50.479039', '30.600554', 'UA', 'Киев', 'вулиця Петра Запорожця, 14', 'вулиця Петра Запорожця, 14, Київ, Украина, 02000', 'Современная школа диджеев', 'ChIJsdK5czvQ1EARdLWFScPR-KM'),
(83, '57.765293', '40.932035', 'RU', 'Кострома', 'улица Советская, 2', 'ул. Советская, 2, Кострома, Костромская обл., Россия, 156000', 'СВОИ ЛЮДИ', 'ChIJJWjA-OFPrUYRHOeXJWmqSLo'),
(84, '55.716068', '37.900425', 'RU', 'Москва', 'Лухмановская улица, 10А', 'Лухмановская ул., 10А, Москва, Россия, 111675', 'Max Dance', 'ChIJI5mbEPPJSkERWgeCuAv3TIM'),
(85, '54.317397', '48.400029', 'RU', 'Ульяновск', 'улица Карла Маркса, 4А', 'ул. Карла Маркса, 4А, Ульяновск, Ульяновская обл., Россия, 432000', 'Uni-Dance', 'ChIJfX-gpW43XUERV6iVmuIcTMU'),
(86, '53.9061759', '27.5750001', 'BY', 'Минск', 'улица Фрунзе, 2', 'улица Фрунзе 2, Минск, Беларусь', 'STREET MASTERS', 'ChIJAXl0QLnP20YRzi31Y34MnKo'),
(87, '55.725619', '37.6735', 'RU', 'Москва', 'улица Мельникова, 7', 'ул. Мельникова, 7, Москва, Россия, 101000', ' Академия танца Татьяны Мартыновой', 'ChIJcYxN8dZKtUYRjv61opzbbnc'),
(88, '53.9254946', '27.4252331', 'BY', 'Минск', 'улица Каменногорская, 70', 'ул. Каменногорская 70, Минск, Беларусь', 'ВИНТ-КЛАБ', 'ChIJPdo69cjE20YRrqUnNDLMg7U'),
(89, '53.9497405', '27.6824677', 'BY', 'Минск', 'улица Ложинская, 14', 'ул. Ложинская 14, Минск, Беларусь', 'FATALITY DANCE STUDIO', 'ChIJF3_IXjHJ20YRR3ZcSkhNL_k'),
(90, '53.8681363', '27.6835138', 'BY', 'Минск', 'улица Ангарская, 22', 'улица Ангарская 22, Минск, Беларусь', 'CONQUISTADOR CREW', 'ChIJo5F13fLN20YRUYzG382V1a8'),
(91, '53.8713799', '27.6349524', 'BY', 'Минск', 'улица Народная, 51', 'улица Народная 51, Минск, Беларусь', 'Life4dance', 'ChIJQ-4PwQTO20YR1kmw4jxXGR0'),
(92, '55.675848', '37.4729067', 'RU', 'Москва', 'улица Олимпийская деревня, 2', 'ул. Олимпийская деревня, 2, Москва, Россия, 119602', 'WILD STYLE', 'ChIJg4qYeLBNtUYRUCMhq_qFAOY'),
(93, '50.429131', '30.475047', 'UA', 'Киев', 'Соломенская ул., 5', 'Соломенская ул., 5, Київ, Київська область, Украина, 03110', 'NuTone', 'ChIJzeujl8DO1EARCWS948cs2qY');

-- --------------------------------------------------------

--
-- Структура таблицы `z_geolocation_cities`
--

CREATE TABLE `z_geolocation_cities` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `area` varchar(64) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `vk_city_id` int(11) NOT NULL,
  `vk_country_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_geolocation_cities`
--

INSERT INTO `z_geolocation_cities` (`id`, `name`, `area`, `region`, `vk_city_id`, `vk_country_id`) VALUES
(1, 'Бердянск', 'Бердянский район', 'Запорожская область', 4316, 2),
(2, 'Бердянское', 'Першотравневый район', 'Донецкая область', 1503050, 2),
(3, 'Запорожье', '', 'Запорожская область', 628, 2),
(4, 'Берлоги', 'Рожнятовский район', 'Ивано-Франковская область', 1505418, 2),
(5, 'Донецк', '', 'Донецкая область', 223, 2),
(6, 'Бородянка', 'Бородянский район', 'Киевская область', 5418, 2),
(7, 'Борисполь', 'Бориспольский район', 'Киевская область', 7623, 2),
(8, 'Санкт-Петербург', '', '', 2, 1),
(9, 'Tortachilla', '', 'State of South Australia', 3977504, 19),
(10, 'Харьков', '', 'Харьковская область', 280, 2),
(11, 'Тхорин', 'Овручский район', 'Житомирская область', 1503855, 2),
(12, 'Херсон', '', 'Херсонская область', 427, 2),
(13, 'Черкассы', '', 'Черкасская область', 2642, 2),
(14, 'Чернигов', '', 'Черниговская область', 444, 2),
(15, 'Львов', '', 'Львовская область', 1057, 2),
(16, 'New Well', '', 'State of South Australia', 3977887, 19),
(17, 'Киев', '', '', 314, 2),
(18, 'Житомир', '', 'Житомирская область', 1158, 2),
(19, 'Киверцы', 'Киверцывский район', 'Волынская область', 9992, 2),
(20, 'Ребриково', 'Антрацитовский район', 'Луганская область', 1506861, 2),
(21, 'Бердичев', 'Бердичевский район', 'Житомирская область', 2738, 2),
(22, 'Николаев', '', 'Николаевская область', 377, 2),
(23, 'Ровно', '', 'Ровненская область', 3170, 2),
(24, 'Москва', '', '', 1, 1),
(25, 'Одесса', '', 'Одесская область', 292, 2),
(26, 'Алешки / Цюрупинск', 'Алешковский / Цюрупинский район', 'Херсонская область', 3959, 2),
(27, 'Sea View', '', 'State of Victoria', 4001157, 19),
(28, 'Минск', 'Минский район', 'Минская область', 282, 3),
(29, 'Мигай', 'Буда-Кошелевский район', 'Гомельская область', 5444409, 3),
(30, 'Миоры', 'Миорский район', 'Витебская область', 17790, 3),
(31, 'Мариуполь', '', 'Донецкая область', 455, 2),
(32, 'Алтыкарасу', 'Темирский район', 'Актюбинская область', 1700420, 4),
(33, 'Алма-Ата', '', '', 183, 4),
(34, 'Астана', '', '', 14, 4),
(35, 'Владивосток', '', 'Приморский край', 37, 1),
(36, 'Кикишовка', 'Бердичевский район', 'Житомирская область', 1503378, 2),
(37, 'Кострома', '', 'Костромская область', 71, 1),
(38, 'Мочилы', 'Серебряно-Прудский район', 'Московская область', 13697, 1),
(39, 'Уляп', 'Красногвардейский район', 'Адыгея ', 1000083, 1),
(40, 'Ульяновск', '', 'Ульяновская область', 149, 1),
(41, 'Москаленки', 'Москаленский район', 'Омская область', 14779, 1),
(42, 'Мисевичи', 'Вороновский район', 'Гродненская область', 1601857, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `z_geolocation_countries`
--

CREATE TABLE `z_geolocation_countries` (
  `id` int(11) NOT NULL,
  `iso_code` varchar(3) NOT NULL,
  `name_ru` varchar(64) NOT NULL,
  `vk_country_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_geolocation_countries`
--

INSERT INTO `z_geolocation_countries` (`id`, `iso_code`, `name_ru`, `vk_country_id`) VALUES
(1, 'UA', 'Украина', 2),
(2, 'CA', 'Канада', 10),
(3, 'RU', 'Россия', 1),
(4, 'BY', 'Беларусь', 3),
(5, 'KZ', 'Казахстан', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `z_language`
--

CREATE TABLE `z_language` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_language`
--

INSERT INTO `z_language` (`id`, `code`, `name`) VALUES
(1, 'ru', 'Русский'),
(2, 'en', 'English');

-- --------------------------------------------------------

--
-- Структура таблицы `z_likes`
--

CREATE TABLE `z_likes` (
  `id` int(11) NOT NULL,
  `elem_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elem_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_likes`
--

INSERT INTO `z_likes` (`id`, `elem_type`, `elem_id`, `user_id`) VALUES
(5, 'board', 78, 25),
(9, 'board', 40, 14),
(10, 'comments', 4, 14),
(11, 'board', 53, 14),
(14, 'photo', 33, 14),
(15, 'comments', 6, 14),
(16, 'comments', 7, 14),
(18, 'comments', 13, 25),
(19, 'video', 13, 25),
(22, 'comments', 10, 25),
(23, 'comments', 11, 25),
(26, 'board', 90, 14),
(30, 'board', 79, 14),
(31, 'board', 81, 14),
(32, 'board', 78, 14),
(38, 'school', 3, 13),
(39, 'comments', 3, 13),
(40, 'school', 2, 11),
(41, 'comments', 2, 11),
(43, 'article', 12, 14),
(46, 'comments', 17, 14),
(48, 'comments', 16, 14),
(49, 'comments', 18, 14),
(50, 'school', 2, 14),
(55, 'events', 2, 14),
(58, 'events', 1, 14),
(59, 'news', 14, 14),
(60, 'comments', 19, 14),
(63, 'comments', 20, 25),
(66, 'comments', 16, 25),
(81, 'board', 37, 14),
(83, 'board', 77, 14),
(85, 'comments', 1, 14),
(86, 'board', 50, 14),
(87, 'board', 91, 14),
(90, 'article', 12, 20),
(99, 'comments', 19, 20),
(100, 'news', 6, 20),
(103, 'comments', 21, 14),
(108, 'comments', 23, 14),
(118, 'board', 47, 20),
(121, 'board', 6, 20),
(122, 'news', 13, 30),
(123, 'news', 14, 30),
(124, 'news', 6, 30),
(125, 'news', 5, 30),
(131, 'board', 108, 14),
(135, 'board', 115, 31),
(150, 'video', 24, 32),
(151, 'video', 23, 32),
(152, 'board', 122, 32),
(153, 'comments', 27, 32),
(154, 'board', 115, 32),
(155, 'board', 114, 32),
(157, 'board', 110, 32),
(158, 'article', 12, 13),
(160, 'article', 10, 13),
(161, 'school', 4, 14),
(165, 'board', 109, 14),
(166, 'photo', 162, 32),
(173, 'comments', 40, 25),
(174, 'board', 135, 14),
(175, 'board', 33, 14),
(177, 'comments', 39, 14),
(178, 'comments', 29, 14),
(179, 'board', 131, 14),
(180, 'comments', 65, 14),
(185, 'comments', 67, 14),
(195, 'comments', 70, 25),
(199, 'board', 138, 14),
(200, 'board', 160, 14),
(201, 'photo', 257, 14),
(202, 'news', 41, 18),
(209, 'news', 42, 25),
(266, 'article', 45, 13),
(270, 'school', 17, 25),
(293, 'school', 9, 14),
(306, 'comments', 106, 14),
(307, 'news', 43, 25),
(321, 'comments', 147, 25),
(339, 'article', 21, 25),
(347, 'comments', 164, 25),
(348, 'comments', 165, 25),
(353, 'article', 45, 25),
(357, 'events', 3, 25),
(362, 'school', 7, 25),
(364, 'comments', 84, 25),
(369, 'school', 86, 25),
(371, 'school', 85, 25),
(372, 'comments', 174, 25),
(373, 'comments', 88, 25),
(374, 'comments', 87, 25),
(375, 'comments', 86, 25),
(376, 'comments', 85, 25),
(377, 'school', 175, 25),
(378, 'school', 176, 25),
(379, 'school', 174, 25),
(380, 'comments', 177, 25),
(381, 'comments', 178, 25),
(383, 'school', 179, 25),
(385, 'school', 113, 25),
(386, 'comments', 180, 25),
(387, 'comments', 181, 25),
(404, 'board', 132, 25),
(405, 'board', 131, 25),
(406, 'board', 109, 25),
(409, 'comments', 94, 14),
(411, 'board', 160, 25),
(415, 'comments', 130, 25),
(416, 'video', 130, 25),
(418, 'board', 79, 25),
(426, 'comments', 125, 14),
(431, 'board', 31, 14),
(432, 'comments', 83, 14),
(487, 'video', 22, 14),
(494, 'board', 161, 14),
(497, 'board', 41, 14),
(499, 'comments', 157, 14),
(503, 'comments', 35, 14),
(512, 'board', 165, 35),
(513, 'article', 25, 35),
(514, 'school', 7, 35),
(515, 'comments', 204, 35),
(516, 'school', 13, 35),
(520, 'comments', 207, 14),
(523, 'board', 167, 14),
(524, 'board', 166, 14),
(525, 'comments', 206, 14),
(533, 'comments', 79, 14),
(534, 'video', 79, 14),
(547, 'comments', 2, 14),
(555, 'comments', 37, 14),
(561, 'comments', 219, 14),
(562, 'comments', 218, 14),
(564, 'comments', 221, 14),
(569, 'news', 38, 13),
(570, 'news', 39, 13),
(571, 'board', 169, 13),
(572, 'video', 36, 14),
(580, 'comments', 226, 14),
(582, 'comments', 224, 14),
(584, 'comments', 188, 13),
(588, 'comments', 177, 14),
(589, 'comments', 172, 14),
(593, 'news', 30, 36),
(594, 'news', 32, 36),
(595, 'video', 44, 36),
(596, 'photo', 296, 36),
(597, 'photo', 297, 36),
(599, 'board', 175, 36),
(600, 'board', 174, 36),
(602, 'news', 43, 36),
(605, 'comments', 80, 14),
(607, 'comments', 118, 14),
(609, 'video', 37, 14),
(615, 'comments', 253, 34),
(616, 'comments', 252, 34),
(617, 'comments', 255, 34),
(618, 'comments', 254, 34),
(620, 'events', 9, 14),
(624, 'board', 172, 14),
(634, 'comments', 250, 34),
(635, 'comments', 267, 34),
(636, 'board', 177, 34),
(637, 'comments', 232, 34),
(645, 'school', 7, 14),
(649, 'comments', 179, 33),
(650, 'events', 8, 33),
(651, 'events', 10, 33),
(652, 'comments', 92, 33),
(670, 'article', 45, 34),
(676, 'news', 34, 34),
(677, 'news', 31, 34),
(678, 'article', 28, 33),
(681, 'comments', 318, 33),
(682, 'comments', 317, 33),
(683, 'news', 44, 34),
(688, 'comments', 305, 33),
(689, 'comments', 321, 33),
(690, 'comments', 326, 33),
(702, 'school', 10, 33),
(706, 'board', 181, 14),
(730, 'article', 25, 14),
(735, 'board', 184, 14),
(783, 'news', 35, 14),
(795, 'comments', 225, 14),
(804, 'events', 7, 14),
(806, 'events', 4, 14),
(812, 'board', 187, 33),
(820, 'school', 8, 14),
(821, 'school', 10, 14),
(822, 'board', 92, 14),
(825, 'school', 13, 14),
(829, 'school', 15, 14),
(834, 'board', 118, 33),
(841, 'news', 40, 33),
(843, 'news', 36, 33),
(858, 'board', 177, 14),
(860, 'comments', 349, 33),
(861, 'comments', 344, 33),
(862, 'comments', 352, 33),
(865, 'news', 31, 33),
(870, 'comments', 38, 13),
(887, 'comments', 364, 13),
(892, 'comments', 187, 14),
(899, 'comments', 250, 14),
(900, 'board', 178, 14),
(907, 'news', 42, 13),
(908, 'news', 41, 13),
(909, 'news', 40, 13),
(952, 'board', 162, 14),
(973, 'comments', 378, 14),
(975, 'news', 42, 14),
(981, 'board', 137, 14),
(984, 'board', 187, 14),
(987, 'school', 14, 14),
(988, 'comments', 128, 14),
(989, 'comments', 127, 14),
(991, 'news', 34, 14),
(993, 'events', 14, 14),
(996, 'board', 206, 14),
(998, 'events', 11, 14),
(1036, 'board', 207, 14),
(1037, 'board', 197, 14),
(1041, 'comments', 374, 14),
(1042, 'news', 37, 14),
(1043, 'comments', 383, 14),
(1044, 'news', 44, 14),
(1046, 'article', 29, 14),
(1048, 'article', 26, 14),
(1050, 'article', 21, 14),
(1051, 'article', 17, 14),
(1052, 'article', 18, 14),
(1053, 'comments', 384, 14),
(1054, 'events', 15, 14),
(1055, 'events', 5, 14),
(1056, 'events', 6, 14),
(1058, 'events', 10, 14),
(1060, 'events', 17, 14),
(1061, 'events', 13, 14),
(1062, 'events', 16, 14),
(1065, 'events', 8, 14),
(1067, 'comments', 370, 14),
(1070, 'photo', 286, 14),
(1071, 'comments', 235, 14),
(1072, 'comments', 236, 14),
(1080, 'comments', 237, 14),
(1099, 'board', 212, 14),
(1105, 'board', 213, 14),
(1106, 'board', 217, 14),
(1107, 'comments', 385, 14),
(1109, 'photo', 373, 14),
(1110, 'comments', 386, 14),
(1111, 'board', 205, 14),
(1112, 'comments', 357, 14),
(1113, 'board', 179, 14),
(1114, 'board', 170, 14),
(1115, 'board', 29, 14),
(1116, 'comments', 227, 14),
(1117, 'board', 201, 14),
(1119, 'news', 44, 49),
(1123, 'comments', 393, 33),
(1124, 'school', 13, 33),
(1127, 'news', 32, 33),
(1129, 'comments', 148, 33),
(1130, 'article', 45, 33),
(1131, 'comments', 160, 33),
(1132, 'events', 17, 33),
(1133, 'events', 15, 33),
(1134, 'school', 16, 33),
(1135, 'school', 15, 33),
(1136, 'school', 9, 33),
(1138, 'board', 198, 33),
(1139, 'comments', 340, 33),
(1140, 'comments', 396, 33),
(1142, 'comments', 328, 33),
(1143, 'photo', 334, 33),
(1144, 'comments', 397, 33),
(1146, 'board', 207, 33),
(1147, 'board', 206, 33),
(1148, 'comments', 389, 33),
(1150, 'photo', 331, 33),
(1151, 'photo', 315, 33),
(1152, 'board', 131, 33),
(1153, 'board', 180, 33),
(1157, 'comments', 387, 14),
(1158, 'comments', 394, 14),
(1160, 'comments', 375, 14),
(1162, 'events', 18, 14),
(1163, 'events', 19, 14),
(1165, 'events', 20, 14),
(1182, 'comments', 375, 33),
(1184, 'events', 24, 33),
(1185, 'comments', 307, 33),
(1187, 'comments', 440, 38),
(1188, 'comments', 441, 38),
(1190, 'comments', 442, 14),
(1191, 'news', 44, 41),
(1193, 'news', 43, 33),
(1197, 'video', 33, 14),
(1199, 'video', 3, 14),
(1205, 'video', 46, 33),
(1208, 'news', 44, 33),
(1209, 'photo', 320, 33),
(1210, 'events', 25, 33),
(1211, 'comments', 460, 33),
(1212, 'board', 243, 33),
(1213, 'board', 228, 33),
(1216, 'comments', 352, 14),
(1217, 'news', 43, 14),
(1240, 'comments', 255, 14),
(1241, 'board', 214, 14),
(1250, 'comments', 466, 14),
(1252, 'board', 265, 38),
(1258, 'comments', 393, 14),
(1262, 'photo', 311, 14),
(1265, 'photo', 405, 14),
(1274, 'comments', 460, 13),
(1277, 'school', 16, 38),
(1283, 'photo', 441, 38),
(1284, 'board', 268, 38),
(1285, 'board', 254, 38),
(1286, 'board', 256, 14),
(1287, 'comments', 630, 14),
(1290, 'board', 270, 33),
(1291, 'board', 273, 33),
(1292, 'board', 297, 33),
(1293, 'board', 288, 33),
(1300, 'news', 42, 33),
(1301, 'board', 309, 14),
(1302, 'board', 299, 14),
(1311, 'board', 312, 14),
(1312, 'board', 308, 14),
(1329, 'comments', 309, 38),
(1334, 'board', 243, 38),
(1335, 'events', 24, 14),
(1336, 'board', 379, 14),
(1340, 'board', 385, 33),
(1341, 'board', 383, 33),
(1343, 'photo', 449, 38),
(1349, 'video', 54, 38),
(1352, 'board', 378, 33),
(1353, 'board', 380, 33),
(1354, 'comments', 393, 38),
(1356, 'comments', 767, 33),
(1357, 'board', 426, 38),
(1361, 'board', 454, 38),
(1369, 'comments', 785, 33),
(1371, 'board', 446, 33),
(1374, 'comments', 384, 38),
(1413, 'comments', 784, 38),
(1417, 'comments', 787, 38),
(1419, 'comments', 782, 38),
(1421, 'news', 55, 33),
(1422, 'photo', 453, 33),
(1424, 'comments', 704, 33),
(1426, 'video', 54, 33),
(1427, 'board', 475, 33),
(1428, 'board', 383, 14),
(1429, 'board', 499, 14),
(1431, 'comments', 878, 14),
(1432, 'news', 56, 33),
(1433, 'board', 499, 33),
(1434, 'comments', 882, 38),
(1437, 'comments', 381, 14),
(1438, 'comments', 232, 14),
(1439, 'events', 25, 14),
(1440, 'photo', 425, 14),
(1441, 'photo', 532, 14),
(1442, 'article', 47, 38),
(1443, 'board', 435, 38),
(1444, 'events', 23, 38),
(1445, 'comments', 712, 38),
(1446, 'school', 18, 38),
(1448, 'board', 383, 38),
(1449, 'board', 472, 14),
(1450, 'board', 508, 14),
(1451, 'board', 519, 93),
(1452, 'board', 518, 14),
(1453, 'board', 500, 14),
(1455, 'events', 30, 38),
(1456, 'board', 543, 14),
(1460, 'board', 544, 93),
(1461, 'comments', 544, 93),
(1462, 'comments', 546, 93),
(1465, 'board', 458, 14),
(1466, 'board', 569, 38),
(1471, 'board', 589, 79),
(1474, 'news', 55, 14),
(1475, 'news', 32, 14),
(1484, 'news', 63, 14),
(1491, 'news', 57, 14),
(1493, 'news', 60, 14),
(1545, 'news', 56, 14),
(1546, 'news', 79, 14),
(1547, 'news', 82, 14),
(1549, 'comments', 986, 14),
(1558, 'comments', 929, 14),
(1562, 'news', 118, 14),
(1589, 'comments', 1062, 14),
(1590, 'comments', 1061, 14),
(1591, 'comments', 1060, 14),
(1592, 'comments', 1059, 14),
(1593, 'comments', 1003, 14),
(1597, 'news', 62, 14),
(1600, 'news', 78, 14),
(1601, 'news', 127, 14),
(1602, 'news', 128, 14),
(1628, 'news', 83, 14),
(1629, 'news', 80, 14),
(1630, 'news', 84, 14),
(1631, 'comments', 1073, 14),
(1634, 'news', 125, 14),
(1643, 'news', 141, 15),
(1644, 'news', 80, 15),
(1645, 'comments', 645, 14),
(1655, 'board', 0, 14),
(1657, 'board', 568, 14),
(1658, 'comments', 1063, 14),
(1661, 'comments', 1163, 14),
(1662, 'comments', 964, 14),
(1663, 'board', 594, 14),
(1666, 'board', 539, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `z_message`
--

CREATE TABLE `z_message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `recipient_id` int(11) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `dialog` int(11) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_message`
--

INSERT INTO `z_message` (`id`, `sender_id`, `recipient_id`, `message`, `dialog`, `created`, `status`) VALUES
(1, 14, 35, '111111111111111111111', 1, '2016-04-17 06:41:15', 0),
(2, 14, 35, '222222222222222222222222222', 1, '2016-04-17 06:42:44', 0),
(3, 14, 35, '3333333333333333333', 1, '2016-04-17 06:43:03', 0),
(4, 14, 35, '333333', 1, '2016-04-17 12:15:57', 0),
(5, 14, 35, '555555', 1, '2016-04-17 12:16:02', 0),
(6, 14, 31, 'уууууууууууу', 2, '2016-04-17 12:20:40', 0),
(7, 14, 33, 'фыпп фц фук фкур р', 3, '2016-04-17 12:21:27', 1),
(8, 14, 35, 'кккккккккккккккккккккккккккк', 1, '2016-04-17 12:21:52', 0),
(9, 14, 13, 'уууу', 4, '2016-04-17 12:22:20', 0),
(10, 14, 38, 'ыыыыыыыыыыыыыыыыыы', 5, '2016-04-17 12:22:48', 1),
(11, 14, 38, 'ыВ вы вп вап ва ва а', 5, '2016-04-17 12:23:37', 1),
(12, 33, 33, 'проверка смешивается или нет', 3, '2016-04-18 08:38:00', 1),
(13, 14, 14, 'Тест', 1, '2016-04-20 18:13:37', 1),
(14, 14, 14, 'еще тест', 1, '2016-04-20 18:19:19', 1),
(15, 14, 35, 'и еще тест', 1, '2016-04-20 18:19:55', 0),
(16, 14, 14, '4 тест', 1, '2016-04-20 18:21:40', 1),
(17, 38, 82, 'здоров', 6, '2016-04-23 15:29:24', 0),
(18, 83, 33, 'привет', 7, '2016-05-04 21:56:29', 1),
(19, 33, 83, 'хай', 7, '2016-05-04 21:56:46', 1),
(20, 83, 33, 'вот это круто', 7, '2016-05-04 21:56:59', 1),
(21, 33, 83, 'это да', 7, '2016-05-04 21:57:09', 1),
(22, 79, 38, 'Привет чувак! Давай корешить!!', 8, '2016-05-05 14:14:35', 1),
(23, 38, 79, 'ок, круть', 8, '2016-05-05 14:15:05', 1),
(24, 14, 33, '`112', 3, '2016-05-06 14:45:59', 0),
(25, 14, 33, '`112', 3, '2016-05-06 14:45:59', 0),
(26, 14, 33, '`112', 3, '2016-05-06 14:45:59', 0),
(27, 14, 33, '`112', 3, '2016-05-06 14:46:00', 0),
(28, 14, 33, '`112', 3, '2016-05-06 14:46:00', 0),
(29, 14, 33, '`112', 3, '2016-05-06 14:46:00', 0),
(30, 14, 33, '`112', 3, '2016-05-06 14:46:01', 0),
(31, 14, 33, '`112', 3, '2016-05-06 14:46:01', 0),
(32, 14, 33, '`112', 3, '2016-05-06 14:46:02', 0),
(33, 14, 33, '`112', 3, '2016-05-06 14:46:02', 0),
(34, 14, 33, '`112', 3, '2016-05-06 14:46:02', 0),
(35, 14, 33, '`112', 3, '2016-05-06 14:46:02', 0),
(36, 14, 33, '`112', 3, '2016-05-06 14:46:03', 0),
(37, 14, 33, '`112', 3, '2016-05-06 14:46:03', 0),
(38, 14, 33, '`112', 3, '2016-05-06 14:46:03', 0),
(39, 14, 33, '`112', 3, '2016-05-06 14:46:04', 0),
(40, 14, 33, '`11223434', 3, '2016-05-06 14:46:06', 0),
(41, 14, 33, '`11223434', 3, '2016-05-06 14:46:07', 0),
(42, 14, 33, '`11223434', 3, '2016-05-06 14:46:07', 0),
(43, 14, 33, '`11223434', 3, '2016-05-06 14:46:07', 0),
(44, 14, 33, '`11223434', 3, '2016-05-06 14:46:08', 0),
(45, 14, 33, '`11223434', 3, '2016-05-06 14:46:08', 0),
(46, 14, 33, '`11223434', 3, '2016-05-06 14:46:09', 0),
(47, 14, 33, '`11223434', 3, '2016-05-06 14:46:09', 0),
(48, 14, 33, '`11223434', 3, '2016-05-06 14:46:09', 0),
(49, 14, 33, '`11223434', 3, '2016-05-06 14:46:09', 0),
(50, 14, 33, '`11223434', 3, '2016-05-06 14:46:09', 0),
(51, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(52, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(53, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(54, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(55, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(56, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(57, 14, 33, '`11223434', 3, '2016-05-06 14:46:10', 0),
(58, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(59, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(60, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(61, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(62, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(63, 14, 33, '`11223434', 3, '2016-05-06 14:46:11', 0),
(64, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(65, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(66, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(67, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(68, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(69, 14, 33, '`11223434', 3, '2016-05-06 14:46:12', 0),
(70, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(71, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(72, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(73, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(74, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(75, 14, 33, '`11223434', 3, '2016-05-06 14:46:13', 0),
(76, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 0),
(77, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 0),
(78, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 0),
(79, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 1),
(80, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 1),
(81, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 1),
(82, 14, 33, '`11223434', 3, '2016-05-06 14:46:14', 1),
(83, 14, 33, '`11223434', 3, '2016-05-06 14:46:15', 1),
(84, 14, 33, '`11223434', 3, '2016-05-06 14:46:15', 1),
(85, 14, 33, '`11223434', 3, '2016-05-06 14:46:15', 1),
(86, 14, 33, '`11223434', 3, '2016-05-06 14:46:15', 1),
(87, 14, 33, '2288222\n\nsjjjd\nsd\nsd\n\nsd\n\n\nsd\n\n\nsd\ns\nd\ns\n\n\nsd', 3, '2016-05-06 14:50:32', 1),
(88, 33, 14, 'оп', 3, '2016-05-06 19:37:20', 1),
(89, 33, 14, 'раз', 3, '2016-05-06 19:37:32', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `z_migration`
--

CREATE TABLE `z_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `z_migration`
--

INSERT INTO `z_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1481250988),
('m161209_015352_create_category_table', 1481251389),
('m170909_132928_add_user_id_column_to_attachments_table', 1504966397),
('m170909_141615_drop_migration_table', 1504966675),
('m170909_145604_alter_columns_in_attachments_table', 1504969682);

-- --------------------------------------------------------

--
-- Структура таблицы `z_news`
--

CREATE TABLE `z_news` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small` text COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article` tinyint(1) NOT NULL DEFAULT '0',
  `date_redact` int(11) NOT NULL,
  `redactor_id` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `img_block_size` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_news`
--

INSERT INTO `z_news` (`id`, `name`, `url`, `category`, `user`, `title`, `description`, `small`, `text`, `img`, `created`, `article`, `date_redact`, `redactor_id`, `status`, `img_block_size`) VALUES
(66, 'Дуэт украинцев выиграл чемпионат мира по брейк-дансу (видео)', 'duyet-ukraincev-vyigral-chempionat-mira-po-brejk-dansu-video', 1, 14, 'Дуэт украинцев выиграл чемпионат мира по брейк-дансу (видео)', '', 'Двое украинских парней из дуэта Navi выиграли чемпионат мира по брейк-дансу World Bboy Classic 2016, передает сайт Red Bull.', '<pre>\r\nДвое украинских парней из дуэта Navi выиграли чемпионат мира по брейк-дансу World Bboy Classic 2016, передает сайт Red Bull.</pre>\r\n\r\n<blockquote>\r\n<p>Navi были одним из четырех дуэтов, которых напрямую пригласили к участию в турнире.<br />\r\nУкраинцы были сильнее команды <a href="#">Spin &amp; Sunni</a>, а в финале встретились с дуэтом би-боев Red Bull BC One All Stars.<br />\r\nНапомним, что это далеко не первая победа украинских би-боев в 2016 году.</p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/WVOHHsVhUUI" width="660">&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;lt;/p&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;gt;</iframe></p>\r\n\r\n<ul>\r\n	<li>Сначала громкие победы (WGTF 2016 и Battle Europa 2016)</li>\r\n	<li>на европейских контестах получили ребята из Ruffneck Attack.</li>\r\n	<li>Далее был сольный прорыв би-боя Kuzya, который выиграл</li>\r\n</ul>\r\n\r\n<p>Unbreakable и гарантировал себе место среди лучших брейкеров мира на Undisputed.</p>\r\n', '4/9/7/581dd3587ccbd.jpg', '2017-01-15 09:15:39', 0, 1484478934, 14, 1, 1),
(67, 'Украинские би-бои стали победителями супертурнира в Словакии', 'ukrainskie-bi-boi-stali-pobeditelyami-superturnira-v-slovakii', 1, 14, 'Украинские би-бои стали победителями супертурнира в Словакии', '', 'Наши ребята выиграли очередной контест – на этот раз "Outbreak Europe", что проходил в эти выходные в Словакии в рамках фестиваля "The Legits Blast".', '<p>\r\n	<em></em>\r\n</p><h3><em>Украинцы взяли призы как в сольной категории, так и в батлах 2х2.</em></h3><p><em> </em></p><p>\r\n	Год 2016-й в европейском брейкинге проходит под диктовку украинских би-боев.\r\n</p><p>\r\n	Наши ребята выиграли очередной контест – на этот раз "Outbreak Europe", что проходил в эти выходные в Словакии в рамках фестиваля "The Legits Blast". Причем, главные награды украинцы забрали как в сольной категории, так и в батлах 2х2.\r\n</p><p>\r\n	Би-бой Kuzya взял победу в соревнованиях 1х1. Это уже второй выигранный для украинца турнир, что дает право соревноваться в решающем соревновании в рамках "Undisputed". В мае этого года Kuzya побеждал на контесте мировой серии "Unbreakable - 2016" и стал третьим известным участником "финала финалов" турнира. Благодаря этой победе украинец значительно улучшил свои шансы на первое место в общем рейтинге серии.\r\n</p><p>\r\n	 В батлах 2х2 украинскую публику порадовали победой ребята из "Ruffneck Attack".\r\n</p><p align="center"><iframe width="810" height="500" src="https://www.youtube.com/embed/5hAImhrpfQ0" frameborder="0" allowfullscreen=""></iframe></p>', '3/8/4/581dd23d78a3e.jpg', '2016-11-05 10:36:13', 0, 1478349340, 14, 1, 3),
(68, 'Би-Бой Pluto Выиграл Отбор Мирового Чемпионата По Брейкингу!', 'bi-boj-pluto-vyigral-otbor-mirovogo-chempionata-po-brejkingu', 1, 14, 'Би-Бой Pluto Выиграл  Отбор Мирового Чемпионата', '', '12-14 августа в Киеве на «Арт-заводе Платформа» впервые в Украине состоялось масштабное и насыщенное событие Red Bull BC One Camp.', '<p>\r\n	<img src="/images/news/581ceadb12ffb.jpg" class="img-fixedwidth">\r\n</p><p>\r\n	12-14 августа в Киеве на «Арт-заводе Платформа» впервые в Украине состоялось масштабное и насыщенное событие Red Bull BC One Camp.\r\n</p><p>\r\n	12-14 августа в Киеве на «Арт-заводе Платформа» впервые в Украине состоялось масштабное и насыщенное событие Red Bull BC One Camp  — фестиваль-лагерь, который отражает весь творческий масштаб украинской культуры, и вместе с брейкингом объединяет различные элементы хип хопа, уличного танца, искусства и музыки.\r\n	<br>\r\n	<br>\r\n	Лучшие представители украинской и мировой сцены собрались на хип-хоп кемпе в Киеве, чтобы показать и рассказать больше о хип-хоп культуре в различных ее направлениях.\r\n	<br>\r\n	<br>\r\n	Насыщенная ежедневная программа мастер-классов, лекций и контестов не давала ни минуты отдыха — каждый из участников мог попробовать себя в танце, стрит-арте и музыке, и узнать больше о брейкинге, хип-хопе, поппинге и хаусе.\r\n	<br>\r\n	А в завершение каждый день — зрелищные танцевальные соревнования на Главной сцене, выступления вживую и вечеринки после.\r\n</p><p>\r\n	<img src="/images/news/581ceb0c92e2f.jpg" class="img-fixedwidth">\r\n</p><p>\r\n	Финальным аккордом трехдневного хип-хоп марафона стал яркий и захватывающий всеукраинский финал среди лучших би-боев \r\n	<strong>Red Bull BC One Ukraine Cypher</strong>.\r\n</p><p>\r\n	<br>\r\n	Под горячую поддержку 3000 зрителей, биты DJ Smirnoff и голос MC Scream, 16 украинских би-боев показывали яркую технику и стиль.\r\n	<br>\r\n	Интрига сохранялась до самого конца, ведь в финале встретились представители одной команды — Ruffneck Attack — би-бои In_Tact и Pluto.\r\n</p><p>\r\n	<br>\r\n	Международные судьи — всемирно-известные би-бои Menno, Roxrite и Mounir — предпочли выступление Pluto, и именно он в декабре будет представлять Украину на главной битве года в формате один на один Red Bull BC One, который состоится в Японии.\r\n	<br>\r\n	<br>\r\n	«С каждым годом победы воспринимаются проще, тем не менее это всегда очень здорово и приятно — выигрывать фестиваль. Особенно приятно выигрывать, когда ты доволен своим брейкингом. Сегодня в большей степени я удовлетворен. Еще больше меня порадовал тот момент, что я оказался в финале со своим сокомандником, своим лучшим другом, просто старшим братом би-боем In_Tact, и это было здорово — разделить с ним финал»— би-бой Pluto.\r\n</p>', '6/1/5/581dce69d18b0.jpg', '2016-11-05 10:28:55', 0, 1478348907, 14, 1, 2),
(69, ' The End From Gamblerz Crew, Cay Crew', 'the-end-from-gamblerz-crew-cay-crew', 1, 14, ' The End From Gamblerz Crew, Cay Crew', 'Bboy The End рассказал что произошло в его жизни и почему его не видно на чемпионатах.', 'Bboy The End рассказал что произошло в его жизни и почему его не видно на чемпионатах.', '<p>\r\n	«Привет. Это бибой The End из команды Gamblerz и Cay Crew.\r\n</p><p>\r\n	Сегодня я хочу всем рассказать об одной своей личной истории.\r\n</p><p>\r\n	<br>\r\n	А ноябре 2015 года команда Gamblerz посетила город Хабаровск с выступлением. Мы приехали в отель поздно ночью, жили в номере вместе с моим сокомандником bboy Blast. Поужинали и выпили пива.<br>\r\n	На следующий день Blast пошел посмотреть город, а я остался в номере, принял душ и решил немного отдохнуть.\r\n</p><p align="center"><img src="/images/news/581dd58b76a6c.jpg"></p><p>\r\n	<br>\r\n	Но внезапно я почувствовал ужасную боль в левом глазе. Очень сильно заболел глаз, а затем голова, я почувствовал тошноту. Я решил пойти в туалет, но понял, что не чувствую левую сторону своего тела. Попытался встать, но упал на пол.\r\n</p><p>\r\n	<br>\r\n	Попытался доползти до туалета, чтобы меня стошнило, но ничего не получалось. Я осознал, что моя левая половина тела ничего не чувствует.\r\n</p><p>\r\n	<br>\r\n	Мне стало очень страшно, и я позвал на помощь bboy Q, который приехал в Россию в качестве менеджера команды. Q быстро прибежал в номер. Я ничего не видел левым глазом, и вся левая сторона тела была парализована.\r\n</p><p>\r\n	<br>\r\n	Я попросил отвезти меня в госпиталь, и Q позвал врача.\r\n</p><p>\r\n	<br>\r\n	Я попросил помассировать мне левую сторону тела, и понял что не чувствую вообще ничего.<br>\r\n	Приехала скорая помощь и посоветовала полежать в отеле, сказали, что все пройдет само. Но я настоял на госпитализации. В больнице мне сделали МРТ, и оставили на один день.\r\n</p><p>\r\n	<br>\r\n	На следующий день я встретился с доктором и переводчиком. Мне сообщили, что у меня случился \'инфаркт мозга\', кровь на время прекратило поступать через сосуды в какую то часть мозга.\r\n</p><p>\r\n	<br>\r\n	Я очень хотел вернуться в Корю, но состояние не позволяло мне сесть на самолет. Поэтому я остался в больнице еще на 8 дней, а уже потом улетел домой, в Южную Корею.\r\n</p><p>\r\n	<br>\r\n	По прилету я направился прямиком в больницу и сделал МРТ повторно. Результаты оказались такими же.\r\n</p><p>\r\n	<br>\r\n	Доктора не могли сказать почему заболевание появилось в таком юном возрасте. Предположительно мое сердце работает не совсем нормально и поэтому кровь течет не так быстро, как положено.<br>\r\n	Так что я остался с этим заболеванием.\r\n</p><p>\r\n	<br>\r\n	Я начал процесс реабилитации, и, через 2 месяца, смог снова нормально ходить и начал разрабатывать левую руку, пытался ловить предметы и максимально двигать ею.\r\n</p><p>\r\n	<br>\r\n	На сегодняшний день я почти вернулся к нормальной жизни, хотя многие докторы говорили, что танцевать снова я не смогу.\r\n</p><p>\r\n	<br>\r\n	Но я начал все с нуля и сейчас могу делать немного базовых движений (флай, твист и так далее). Но, конечно, я уже не могу делать те безумные комбинации, которые я делал раньше. Моя левая сторона тела развита намного хуже правой.\r\n</p><p>\r\n	<br>\r\n	Каждые 3 месяца я посещаю больницу и делаю МРТ, но результаты такие же. Тело потихоньку восстанавливается, хотя левый глаз стал плохо видеть.\r\n</p><p>\r\n	<br>\r\n	Мне было тяжело рассказать эту историю.\r\n</p><p>\r\n	<br>\r\n	Это стало причиной того, что я перестал танцевать в ноябре 2015.<br>\r\n	Многие люди думают, что я бросил брейкинг, но это не так! Я по-прежнему танцую и восстанавливаюсь.<br>\r\n	Я не могу делать те безумные движения, как раньше, но я стараюсь как могу. Я не хочу, чтобы люди думали, что \'The End\' — это нереальный мувщик, но, пожалуйста, думайте, что \'The End\' это очень работящий бибой. Спасибо, что прочитали мою историю. Я часто разговариваю с бибоем Krops из Fusion MC, у него гораздо более серьезная травма, чем у меня (он повредил себе шейный позвонок на тренировке, и из-за этого его полностью парализовало). Мы по-прежнему общаемся, развиваемся, тренируемся и мечтаем о своем следующем шаге.\r\n</p><p>\r\n	<br>\r\n	Мое послание бибоям по всему миру — пожалуйста, берегите себя.<br>\r\n	Спасибо,<br>\r\n	The END (Gamblerz, Cay Crew) «.\r\n</p>', '7/7/4/581dd6701e466.jpg', '2016-11-05 10:54:08', 0, 1478350287, 14, 1, 3),
(70, 'Powermoves Philosophy WORDS !#2 Bboy MARCIO', 'powermoves-philosophy-words-2-bboy-marcio', 1, 14, 'Powermoves Philosophy WORDS !#2 Bboy MARCIO', 'Мотивирующие слова от bboy MARCIO для всех кто крутит Power Move.', 'Мотивирующие слова от bboy MARCIO для всех кто крутит Power Move.', '<p>\r\n	Мотивирующие слова от bboy MARCIO для всех кто крутит Power Move.\r\n</p><p align="center"><iframe width="640" height="360" src="https://www.youtube.com/embed/crRyEMqbNk0" frameborder="0" allowfullscreen=""></iframe></p>', '5/4/9/581dd962ae1ab.jpg', '2016-11-05 11:06:42', 0, 1478351194, 14, 1, 2),
(71, ' Crazy Legs Interview | Freestyle Session Midwest Qualifier', 'crazy-legs-interview-freestyle-session-midwest-qualifier', 1, 14, ' Crazy Legs Interview | Freestyle Session Midwest Qualifier', 'Небольшое интервью с Crazy Legs.', 'Небольшое интервью с Crazy Legs.', '<p>\r\n	Само интервью было взято во время Freestyle Session Midwest Qualifier.\r\n</p>\r\n<p>\r\n	В интервью Crazy Legs рассказывает как появилась идея его батла со Storm и чем он себя мотивирует и что хочет показать этим батлом и своей деятельностью.\r\n</p>\r\n<p>\r\n	<div align="center"><iframe width="640" height="360" src="https://www.youtube.com/embed/9PAHS6ZPwL0" frameborder="0" allowfullscreen></iframe></div>\r\n</p>\r\n', '6/8/1/581dda7ceac27.jpg', '2016-11-05 11:11:24', 0, 1478351351, 14, 1, 3),
(72, 'В Харькове состоялся легендарный фестиваль "Breakidz"', 'v-harikove-sostoyalsya-legendarnyj-festivali-breakidz', 1, 14, 'В Харькове состоялся легендарный фестиваль "Breakidz"', '', 'В этом году ему исполнилось 17 лет, а также 30 лет с того момента, когда родился брейкданс в Харькове. ', '<p>2 октября на уличной площадке возле Харьковского национального академического театра оперы и балета имени Н. В. Лысенко "Street Culture" состоялся брейкданс фестиваль "Breakidz". В этом году ему исполнилось 17 лет, а также 30 лет с того момента, когда родился брейкданс в Харькове.</p><p><img src="/images/news/581ddbe417029.jpg"></p><p>В Харькове состоялся легендарный брейкданс фестиваль "Breakidz"Город Харьков собрал участников со всей страны, а также судей с Болгарии и Белоруссии, которые имеют мировое признание. Этот фестиваль по праву можно назвать одним из лучших за всё время его существования!</p><p>Первый день фестиваля прошел в институте физкультуры, где проходили отборы на финальную часть, а на уличной площадке ХНАТОБа! Лучшие сборные городов сразились в финале, в итоге победила сборная Днепра (профи команды), и сборная Б.Церкви (кидз). Белая Церковь второй раз забирает победу (первая была в 2015г.)</p><p><br>Напоминаем, что фестиваль проходил в рамках программы развития уличных культур Харькова, под патронатом городского головы Геннадия Кернеса, а также при поддержке Департамента семьи молодежи и спорта Харьковского городского совета. В 2016 году уже состоялись фестивали по уличному баскетболу "Украинская стритбольная лига", граффити и стрит арта "Оставь свой след", паркур культуры "Prokach Days", райдер культур "Комплит", брейкданс культуры "Breakidz". До конца текущего года состоится фестиваль 15 октября воркаут культуры "Barstylers battle".</p>', '0/3/8/581ddbc0abc3f.jpg', '2016-11-05 11:17:29', 0, 1478351829, 14, 1, 1),
(73, 'V1Battle в Санкт-Петербурге', 'v1battle-v-sankt-peterburge', 1, 14, 'V1Battle в Санкт-Петербурге', '28 и 29 октября в Питере пройдёт ежегодный хип-хоп фестиваль V1Battle. В качестве судей были приглашены именитые гости из Нью-Йорка', '28 и 29 октября в Питере пройдёт ежегодный хип-хоп фестиваль V1Battle. В качестве судей были приглашены именитые гости из Нью-Йорка', '<p>28 и 29 октября в Питере пройдёт ежегодный хип-хоп фестиваль V1Battle. В качестве судей были приглашены именитые гости из Нью-Йорка: легендарный би-бой Ken Swift (Судья в номинации «Breaking Battle») и культовый хип-хоп продюсер Large Professor (Судья в номинации «Beatmakers Battle»). В пятницу вечером Large Pro даст концерт на этом мероприятии.</p><p><img src="/images/news/581ddf5cf4002.jpg"></p><p>Вход: бесплатный!!</p><p><br>Подробности на официальном сайте V1Battle и во встрече ВКонтакте.</p><p><br>Ken Swift — b-boy 2-го поколения и вице-президент команды Rock Steady Crew, ключевой фигурой которой он давно являлся. Сейчас Ken президент хип-хоп движения VII Gems в Нью-Йорке. Ken Swift начал танцевать в 1978-ом году, а это уже почти 40 лет. Он один из самых влиятельных брейкдансеров, именно ему приписывают создание многих танцевальных движений. 29-го октября эти движения можно будет лицезреть вживую в Санкт-Петербурге.</p><p><br>Large Professor (также известен как Large Pro и Extra P) — нью-йоркский MC и продюсер. Получил известность как один из основателей влиятельной андеграунд хип-хоп группы Main Source. Позже стал главным наставником для рэппера NaS. За свою карьеру Large Proвыпустил 5 сольных, 6 совместных и 2 инструментальных альбома, а также спродюсировал огромное количество треков для Eric B. &amp; Rakim, Kool G Rap &amp; DJ Polo, Tragedy Khadafi, NaS, Pete Rock &amp; CL Smooth, Gang Starr, A Tribe Called Quest, Big Daddy Kane, Busta Rhymes, Mobb Deep, Beastie Boys, Slick Rick, Common, The Beatnuts, Cormega, Non Phixion, AZ, Public Enemy, N.O.R.E., Capone-N-Noreaga, Reks и многих других на протяжении его 30-летней карьеры. Large Pro мастерски подбирает экзотические джаззовые сэмплы, что делает его музыку оригинальной и не похожей на музыку других хип-хоп продюсеров. 28-го октября он отсудит баттл битмейкеров и даст эксклюзивное шоу.</p>', '3/4/6/581ddf2c6323d.jpg', '2016-11-05 11:33:00', 0, 1478352770, 14, 1, 2),
(74, 'флэшмоб, в честь 30-летия первого брейк-фестиваля', 'flyeshmob-v-chesti-30-letiya-pervogo-brejk-festivalya', 1, 14, 'флэшмоб, в честь 30-летия первого брейк-фестиваля', 'Брэйкеры первой волны СССР сняли видеофлэшмоб, в честь 30-летия первого брейк-фестиваля', 'Брэйкеры первой волны СССР сняли видеофлэшмоб, в честь 30-летия первого брейк-фестиваля', '<p>\r\n	Как будут выглядеть хип-хоп герои новой волны в 50 лет!? Можно только догадываться. А вот представители первой волны Хип-Хоп Культуры нашей страны, уже достигли этого возраста. Всех их разбросала жизнь по разным странам и профессиям, но что такое брэйк-дэнс они готовы показать и сегодня!\r\n</p><p>\r\n	Видеофлешмоб брейкеров первой волны из стран бывшего СССР в год тридцатилетия первого брейкданс фестиваля, прошедшего 26 апреля 1986 года в Винни, Эстонская ССР.<br>\r\n	Участники Видеоволны- брейкеры , пришедшие в этот танец в далеких 80-х.\r\n</p><p align="center"><iframe width="635" height="400" src="https://www.youtube.com/embed/M-lwgdMqrXY" frameborder="0" allowfullscreen=""></iframe></p>', '9/8/4/581de12009559.jpg', '2016-11-05 11:40:30', 0, 1478353218, 14, 1, 3),
(75, 'Тор 9 Anniversary 15 years', 'tor-9-anniversary-15-years', 1, 14, 'Тор 9 Anniversary 15 years', 'Masta BK (Jam Style Crew), являясь человеком, что стоял у истоков этой команды, в честь такого события презентовал музыкальный проект', 'Masta BK (Jam Style Crew), являясь человеком, что стоял у истоков этой команды, в честь такого события презентовал музыкальный проект', '<p><img src="/images/news/581de25b95eaa.jpg" alt="" style="display: block; margin: auto; height: 328px; width: 328px;"></p><p>1 октября состоялось грандиозное событие — Тор 9 Anniversary 15 years — 15-й день рождения легендарного брейк-данс коллектива нашей страны — TOP 9!!! Masta BK (Jam Crew), являясь человеком, что стоял у истоков этой команды, в честь такого события презентовал музыкальный проект при участии Fuze (KREC), Масса (DCMC), DJ Wolt, Шеff (Bad Balance), Братья Улыбайте, Зелёный Синдром, Lentos &amp; Дым, Вася Васин (Кирпичи),…</p><p>Прошел ровно год от задумки до реализации данного проекта, приуроченному и посвященному 15летию TOP 9!!!! И учитывая искренность сказанного и сделанного на этом альбоме, каждый из участников проекта может с полной уверенностью произнести слова «I am TOP 9!» С праздником, мои дорогие, мои друзья, моя ХИП-ХОП семья TOP NINE CREW!!!!! Всегда ваш Masta B.K.</p>', '7/2/2/581de2e206a48.jpg', '2016-11-05 11:48:08', 0, 1478353682, 14, 1, 2),
(76, 'Брэйк-данс: Финал BATTLE OF THE YEAR WORLD 2015', 'bryejk-dans-final-battle-of-the-year-world-2015', 1, 14, 'Брэйк-данс: Финал BATTLE OF THE YEAR WORLD 2015', '26 год подряд в эти выходные прошёл самый известный и самый популярный брэйк-данс Чемпионат Battle of the Year World 2015', '26 год подряд в эти выходные прошёл самый известный и самый популярный брэйк-данс Чемпионат Battle of the Year World 2015', '<p>\r\n	<img src="/images/news/581de47524436.jpg" alt="" style="display: block; margin: auto; height: 424px; width: 508px;">\r\n</p>\r\n<p>\r\n	26 год подряд в эти выходные прошёл самый известный и самый популярный брэйк-данс Чемпионат Battle of the Year World 2015, где выступили 15 лучших команд со всего мира: Греция, Сенегал, Франция, Испания, Тайвань, Япония, Тайланд, Нигерия, Израиль, Германия, Бразилия, Италия, Голландия, Англия, Ю.Корея, но до финала было суждено добраться Беларусам Kienjuice и Японцам The Floorriorz. Они и схлестнулись в финальной битве, это было впечатляюще, Поздравляем победителей !!! Не буде затягивать, смотрим баттл, а чуть ниже можно ознакомиться с Победителями в других номинациях.\r\n</p>\r\n\r\n<div align="center"><iframe width="635" height="400" src="https://www.youtube.com/embed/_zswMjtnivo" frameborder="0" allowfullscreen></iframe></div>', '7/9/0/581de4cbefd60.jpg', '2016-11-05 11:57:51', 0, 1478354234, 14, 1, 3),
(77, 'BOTY 2016 СРЕДИ СТРАН СНГ И БАЛТИИ', 'boty-2016-sredi-stran-sng-i-baltii', 1, 14, 'BOTY 2016 СРЕДИ СТРАН СНГ И БАЛТИИ', 'БИТВА ГОДА 2016 (BOTY 2016). ЭТАП ЧЕМПИОНАТА МИРА ПО БРЕЙК-ДАНСУ СРЕДИ СТРАН СНГ И БАЛТИИ', 'БИТВА ГОДА 2016 (BOTY 2016). ЭТАП ЧЕМПИОНАТА МИРА ПО БРЕЙК-ДАНСУ СРЕДИ СТРАН СНГ И БАЛТИИ', '<h4>23 октября в минском клубе Prime Hall состоится очередной отборочный этап чемпионата мира по брейк-дансу BATTLE OF THE YEAR для стран СНГ и Балтии — Битва года 2016. За 4 года проведения отбора в Минске мероприятие стало культовым и заслуженно собирает сильнейшие команды со всего региона.\r\n</h4><p>\r\n	<br>\r\n\r\n	Уровень команд, приезжавших в Минск на отборочный тур, действительно, впечатляет: в 2014-м году определилась команда-победитель, завоевавшая титул чемпиона мира (Predatorz Crew из России), а в 2015 белорусская Kienjuice Crew стала вице-чемпионом мира.</p><p><img src="/images/news/581de6b0a2334.jpg" alt="" style="float: right; margin: 0px 0px 10px 10px;"></p><p>\r\n	Главный приз отборочного этапа — участие в финале Battle of the Year, который в этот раз состоится уже через неделю после отбора — 28-29 октября 2016 года в г. Эссен, Германия. Победителю придется выложиться на полную, ведь путевку на главную танцевальную битву года получит только одна команда.<br>\r\n	Брейк-данс команды, желающие принять участие в «Битве года 2016» могут присылать заявки на электронный адрес botybelarus@gmail.com до 8 октября 2016 года.</p><p><br>\r\n	В этом году борьба обещает стать еще более жаркой, так как участников приедет поддержать один из самых ярких и лиричных исполнителей российской хип-хоп-сцены — Баста. Известнейший рэпер, вместе с расширенным составом музыкантов, сразу после окончания битвы представит всем гостям и болельщикам чемпионата Битва года 2016 свой новый альбом «Баста 5».<br>\r\n	<br></p><p>Программа:</p><ul><li>12:00 до 17:00 — отборочный этап Battle of The Year СНГ/БАЛТИЯ 2016</li><li>17:00 до 19:00 — технический перерыв</li><li>19:00 до 22:00 — сольный концерт «Баста»</li></ul><p>	Билеты можно приобрести на сайтах KVITKI.BY и AFISHA.TUT.BY, а также в кассах города, салонах сотовой связи «Евросеть» и «Связной».<br></p><p>	Стоимость билетов: от 20 до 120 BYN.<br></p><p>	Справки по телефону: +375 44 594-79-47.</p>', '3/4/3/581de73a873a0.jpg', '2016-11-05 12:06:48', 0, 1478354800, 14, 1, 1),
(78, '29 и 30 октября, «Hip Hop City Moscow», Лужники', '29-i-30-oktyabrya-hip-hop-city-moscow-luzhniki', 1, 14, '29 и 30 октября, «Hip Hop City Moscow», Лужники', '29 и 30 октября в Лужниках состоится пятый международный хип хоп фестиваль Splash! под новым названием Hip Hop City Moscow!', '29 и 30 октября в Лужниках состоится пятый международный хип хоп фестиваль Splash! под новым названием Hip Hop City Moscow!', '<p>29 и 30 октября в Лужниках состоится пятый международный хип хоп фестиваль Splash! под новым названием Hip Hop City Moscow!!!. В течение двух дней поклонники Урбан – культуры будут свидетелями не только выступлений любимых российских и иностранных артистов. Зрители смогут оценить самые ожидаемые поединки года среди танцоров и граффитчиков.</p><p><img src="/images/news/581de9865e08e.jpg" style="height: 548px; width: 388px; float: left; margin: 0px 10px 10px 0px;" alt=""></p><p>Благодаря своему широкомасштабному формату с участием многочисленных российских и иностранных артистов с 2005 года «Splash!» является самым актуальным хип хоп фестивалем в России, организатором которого выступает успешно зарекомендовавшее себя в хип хоп культуре Агентство «Phlatline», а главным спонсором фестиваля в этом году выступит компания ОАО «Газпром».</p><p><br><br>Расширяя с каждым годом свои возможности, и, уделив должное внимание экстремальным видам спорта и конкурсным мероприятиям в данном сегменте, Фестиваль взял на себя право организатора чемпионатов России и СНГ в качестве отборочных на Мировые чемпионаты по брейкдансу и граффити – «Battle of the Year и Write4Gold». А в последние несколько лет событие стало проходить в рамках не однодневной, а двухдневной программы. К слову, оценивать российских претендентов на выход в чемпионаты мира приедут заслуженные судьи, квалифицированные Европейским комитетом.<br>Следует отметить, что в 2010 году «Splash!» не был проведен в России, и в 2011 поклонники хип хоп культуры ждут этого события с еще большим энтузиазмом, тем более, что все заявленные артисты выступят с полноценной концертной программой.</p><p><br>Важно упомянуть, что в этом году «Splash!» будет представлен, как  Hip  Hop City Moscow и подарит новую, более глобальную жизнь Фестивалю. Мероприятие состоится во Дворце спорта «Лужники» (ГЦКЗ «Россия»), и с 10:00 в субботу и воскресение откроет свои двери для всех желающих. Удобная площадка для проведения соревнований и выступлений будет оснащена самым современным оборудованием и декорирована, согласно стилистики и специфики Фестиваля. Кроме этого, гостей приятно удивит наличие вместительного буфета с приемлемыми ценами, комфортная зона с удобными посадочными местами, ну и, конечно же, танцоп с нескончаемыми хитами от лучших DJs.</p><p><br>Не смотря на осеннюю погоду, многие все еще ностальгируют по недавно закрытому сезону стритбольных матчей. Все, кто не успел наиграться этим летом в баскетбол, смогут вновь окунуться в атмосферу уличного спорта и насладиться этим в стенах Дворца спорта «Лужники».</p><p><br>Программа «Hip Hop City Moscow»</p><br>29 октября:<br>В первой половине дня пройдут отборочные туры в квалификациях:<p><br></p><ul><li>Write4Gold,</li><li>Streetball Competition,</li><li>Breakdance Battle.</li></ul>Среди артистов, которые для Фестиваля подготовили специальную программу  выступления появятся:<p><br></p><ul><li>DJ Premier [USA],</li><li>Centr (Slim, Птаха),</li><li>Haftbefehl [GER],</li><li>Schokk &amp; Oxxymiron,</li><li>F.Y.P.M.,</li><li>Песочные люди</li><li>Джино,</li><li>Гига,</li></ul><br>И другие.<br>30 октября:<br>Второй день пройдёт также в активном хип хоп режиме:<p><br></p><ul><li>Battle of the Year,</li><li>Graffiti Showcase.</li></ul>А на сцене появятся:<p><br></p><ul><li>Fat Joe [USA],</li><li>Смоки Мо (surprise act)</li><li>Мастер ШЕFF,</li><li>Sefyu [FRA],</li><li>Миша Крупин</li><li>Dino MC 47,</li><li>The Chemodan</li><li>Крипл,</li><li>Словетский,</li><li>St1m,</li></ul>И другие.', '2/6/0/581de9c315c32.jpg', '2016-11-19 19:56:01', 0, 1479592557, 14, 1, 2),
(79, 'BURN Battle School Remixed:Баста Раймс, Grandmaster Flash', 'burn-battle-school-remixedbasta-rajms-grandmaster-flash', 1, 14, 'BURN Battle School Remixed', 'Баста Раймс, Grandmaster Flash и O.S.T.R подтвердили свое участие в BURN Battle School Remixed', 'Баста Раймс, Grandmaster Flash и O.S.T.R подтвердили свое участие в BURN Battle School Remixed', '<p><img src="/images/news/581deb5d6fe56.jpg"></p><p>Всемирно известные имена хип-хопа — Баста Раймс и диджей Grandmaster Flash — появляться в польском Кракове в субботу, 24 сентября 2016</p><p><br>BURN Battle School Remixed пройдет в субботу, 24 сентября 2016, на польской TAURON Arena в Кракове под шефством мультиплатинового артиста, номинанта «Грэмми» и музыкального гения Басты Раймса, получившего мировую славу благодаря своим хитам и экстраординарным выступлениям.</p><p><br>Зрители и гости этого настоящего праздника уличной культуры от BURN смогут увидеть лучших би-боев со всего мира, местных брейкдансеров и понаблюдать за созданием стрит-арт объектов. Кроме того, со своим сетом выступит один из отцов-основателей хип-хопа — диджей Grandmaster Flash — и польская знаменитость O.S.T.R.</p><p><br>В отличии от предыдущих ивентов, на этот раз гости станут свидетелями шоу от команды би-боев, собравшей всех мировых звезд, а также местных польских танцоров, при поддержке основателя BURN Battle School — MC Vladee, а также MC Trix. Кроме того, BURN перенесет искусство с улиц на арену, и стрит-арт-художники на глазах зрителей создадут огромное граффи.</p><p><br>BURN Battle School Remixed поддержит легенда хип-хопа диджей Grandmaster Flash, который выступит с классическим сетом и продемонстрирует свой талант сведения в лайве, а также местный артист O.S.T.R., чей успех измеряется в мультиплатиновых продажах, — он отыграет сет-лист из лучших треков своего 20-летнего репертуара.</p><p><br>Один из самых знаковых артистов хип-хопа, Баста Раймс, в этом году отмечает свой 25-й год в музыкальной индустрии, и не может сдержать энергию:</p><p><br><br><br>«Артист, выступающий вживую, может создать связь с аудиторией с помощью слов, мыслей и чувств, и готов в любой момент воплотить это на сцене. То, что BURN представляют в рамках Battle School Remixed, и является основой того, на чем были выстроены принципы и целостность хип-хопа», — Говорит Баста.</p>', '1/7/4/581deb9b96565.jpg', '2016-11-05 12:24:27', 0, 1478355701, 14, 1, 3),
(80, 'Пять вещей, которые мы узнали о BURN Battle School в Кракове', 'pyati-veshhej-kotorye-my-uznali-o-burn-battle-school-v-krakove', 1, 14, 'Пять вещей, которые мы узнали о BURN Battle School в Кракове', '', '4 000 людей посетили Краков ради грандиозного праздника стрит-культуры', '<p>\r\n	Построенный на принципах сопричастности, музыке и искусстве, BURN Battle School создавал и создает события, которые впрыскивают эмоции в уличную культуру с 2012 года — и 2016-й не стал исключением. Наше последнее событие увидели тысячи тусовщиков, влетевших в стены Tauron Arena в Кракове ради BURN Battle School Kraków. Местные b-boys и b-girls приняли участие в танцевальных битвах, в то время как лучшие граффити-зудожники планеты раскрашивали стены арт-инсталляциями. В потрясающей музыке — как местной, так и мировой — также не было недостатка. Местный рэпер Адам Островски, также известный как  O.S.T.R., исполнял такие хиты, как Spowiedź, хип-хоп-легенда Баста Раймс исполнил несколько своих классических работ, а знаменитый Grandmaster Flash просто-напросто порвал весь зал своим DJ-сетом. Не печальтесь, если вас там не было: вот 5 главных вещей, которые вы ДОЛЖНЫ узнать о BURN Battle School Kraków...\r\n</p><p>\r\n	<br>\r\n</p><h3>ХИП-ХОП ЛЕГЕНДА БАСТА РАЙМС ЗАДАЛ ЖАРУ</h3><p>\r\n	Сет рэпера в очередной раз напомнил о его величии и музыкальной эрудиции. Баста исполнял хиты со всего своего обширного собрания сочинений: от свего дебютного трека 1996 года Woo Hah!! Got You All In Check до зубодробительного Break Ya Neck.\r\n</p><p>\r\n	<img src="/images/news/581deceb4bebd.jpg">\r\n</p><p>\r\n	<br>\r\n</p><h3>ПЕРВОПРОХОДЕЦ ХИП-ХОПА DJ GRANDMASTER FLASH ВСТАЛ ЗА ВЕРТУШКИ</h3><p>\r\n	Еще не успевший толком отметить свое назначение на роль продюсера сериала The Get Down от Netflix, Grandmaster Flash выступил с сетом классических треков, и его выступление стало одним из самых ярких моментов вечера. Flash без устали раскачивал толпу такими треками, как Hip Hop Hooray от Naughty by Nature и Jump Around от House of Pain.\r\n</p><p>\r\n	Отечественные таланты в лице Kleju, Paulina, Thomas и Kuzya столкнулись с голландским танцором Kid Colombia и Kareem из Rockforce Crew в жаркой зарубе на танцполе. \r\n</p><p><img src="/images/news/581dee309e6dd.jpg"></p>', '0/7/8/581dee55f1b81.jpg', '2016-11-05 12:37:14', 0, 1478356625, 14, 1, 3),
(81, 'BURN BATTLE SCHOOL REMIXED В МОСКВЕ', 'burn-battle-school-remixed-v-moskve', 1, 14, 'BURN BATTLE SCHOOL REMIXED В МОСКВЕ', 'BURN Battle School Remixed состоится 11 ноября на концертной площадке Stadium Live в Москве (Россия).', 'BURN Battle School Remixed состоится 11 ноября на концертной площадке Stadium Live в Москве (Россия).', '<p>Вслед за незабываемым приключением в Кракове (Польша) финальное мероприятие серии BURN Battle School Remixed состоится 11 ноября на концертной площадке Stadium Live в Москве (Россия).</p><p><img src="/images/news/581defc728bea.jpg"></p><p><br>Вслед за незабываемым приключением в Кракове (Польша) финальное мероприятие серии BURN Battle School Remixed состоится 11 ноября на концертной площадке Stadium Live в Москве (Россия). Хедлайнером шоу станет номинант «Грэмми», мультплатиновый артист и музыкальный гений Busta Rhymes. Бесплатные билеты на мероприятие доступны после регистрации на battleschool.burn.com.</p><p><br>Известный всему миру огромным количеством хитов и потрясающими выступлениями на сцене, Busta Rhymes отмечает свой 25 год в индустрии и готов рваться в бой: </p><p><br>«На мой взгляд, нет такого компонента хип-хопа, который бы не был представлен на BURN Battle School Remixed. Мы создадим колоссальную энергию, которую просто нельзя передать словами. Мне проще показать вам, как это будет, нежели чем рассказывать: на мой взгляд, никакие мои слова не смогут сравниться с теми впечатлениями, которые вы получите на BURN Battle School Remixed».</p><p><br>На BURN Battle School Remixed также выступит один из отцов-основателей хип-хопа Grandmaster Flash с эксклюзивным DJ-сетом, а также один секретный гость, чье имя скоро будет представлено публике. </p><p>На празднике уличной культуры от BURN зрители увидят битву лучших би-боев мира и России и живые стрит-арт-инсталляции, которые будут создаваться на протяжение всего вечера. </p><p><br>Чтобы узнать больше о празднике уличной культуры BURN Battle School  и зарегистрироваться для бесплатных билетов, посетите battleschool.burn.com Правила и условия доступны по ссылке: battleschool.burn.com/us/en/terms</p>', '9/0/2/581deff10b03e.jpg', '2016-11-05 12:42:57', 0, 1478356852, 14, 1, 2),
(82, 'Сибирская мощь на Battle of the Year', 'sibirskaya-moshhi-na-battle-of-the-year', 1, 14, 'Сибирская мощь на Battle of the Year', 'Выходец из России Bruce Almighty победил на одном из крупнейших мировых брейкинг-контестов.', 'Выходец из России Bruce Almighty победил на одном из крупнейших мировых брейкинг-контестов.', '<p>\r\n	Battle of the Year – один из главных контестов планеты по брейкингу, который с 1990 года ежегодно проходит в конце осени. В этом году его новым местом проведения стал немецкий Эссен. Ему традиционно предшествуют десятки отборочных турниров. Два дня контеста, который входит в мировую серию Undisputed, полностью посвящены брейкингу: командные и детские баттлы, сражения 1х1 среди би-боев и би-герлс.\r\n</p><p align="center">\r\n	<iframe width="820" height="461" src="https://www.youtube.com/embed/woV21kVCs8Q" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p><p>\r\n	Первый день Battle of the Year был посвящен сольным баттлам. В этом году впервые на контест серии Undisputed прямое приглашение получила девушка – би-герл Ayumi (Body Carnival). Всего за путевку на «финал финалов» сражались 16 би-боев, среди которых были Taisuke, Pac Pac, Lil Zoo, Kid Kolombia, а также португальский би-бой с сибирскими корнями Bruce Almighty. Вместе с французским би-боем Nasso он и разыграл звание сильнейшего. В финале Bruce Almighty взял три выхода против одного Nasso и завоевал путевку на Undisputed.\r\n</p><p align="center">\r\n	<iframe width="820" height="461" src="https://www.youtube.com/embed/LY70rm0LO3k" frameborder="0" allowfullscreen=""></iframe>\r\n</p><p>\r\nВторой день был отведен командным баттлам. Здесь главными фаворитами являлись Floorriorz. Японцы попали на Battle of the Year как прошлогодние финалисты и в этот раз снова стали лучшими среди 16 команд. В финале они без проблем одолели французскую Melting Force.\r\nВпереди еще три контеста в рамках Undisputed: Freestyle Session, Red Bull BC One и Taipei BBoy City. «Финал финалов» пройдет в Чехии 28 января будущего года.\r\nМировой финал Red Bull BC One пройдет 3 декабря в японской Нагое. В этом году формат контеста возвращается к корням: 15 би-боев получили прямое приглашение на финал, вакантным остается лишь одно место. За него поборются победители национальных финалом на Last Chance Cypher. Следи за новостями на нашем сайте!\r\n</p>', '1/4/0/581df34f92b3c.jpg', '2016-11-05 12:57:19', 0, 1478357482, 14, 1, 2),
(83, '​Мировой финал Red Bull BC One все ближе!', 'mirovoj-final-red-bull-bc-one-vse-blizhe', 1, 14, '​Мировой финал Red Bull BC One все ближе!', 'Напомним, что он пройдет в Японии, в городе Нагоя 3 декабря!', 'Напомним, что он пройдет в Японии, в городе Нагоя 3 декабря!', '<p><img src="/images/news/581df6464f116.jpg"></p><p><br></p><p>Мировой финал Red Bull BC One все ближе!</p><p>Напомним, что он пройдет в Японии, в городе Нагоя 3 декабря! 15 приглашенных участников и 1 прошедший отбор (Last Chance Qualifier) ! К отбору допускаются победители всех Сайферов, которые проходили в мире!</p><p>По слухам (официального подтверждения еще нет) последним приглашенным станет Кузя (Breaknuts) Украина/Польша</p>Приглашенные участники:<br><ul><li>Victor (The MF Kids/Squadron) США</li><li>Taisuke (The Floorriorz/BC One All Stars) Япония</li><li>Issei (Found Nation) Япония</li><li>Kleju (Polskee Flavour) Польша</li><li>Kid Colombia (Hustle Kids) Голландия</li><li>Cheerito (Illusion of Exist/Evolvers) Россия</li><li>Sunni (Soul Mavericks) Великобритания</li><li>Hong-10 (Drifterz/7Commandoz/BC One All Stars) Корея</li><li>Soso (Melting Force) Франция</li><li>Lil Zoo (LHiba King Zoo/Flying Steps) Марокко</li><li>Focus (Flow Mo) Финляндия</li><li>Bruce Almighty (Momentum) Португалия</li><li>Ben Stacks (Knucklehead Zoo/Super Crew) США</li><li>Neguin (Boogie Brats/BC One All Stars) Бразилия</li><li>Kuzya (Breaknuts) Украина/Польша</li></ul><p><br>Имя последнего участника мы узнаем после Last Chance Qualifier, который пройдет 1 декабря в Японии, в Нагое! Именно там сразятся все победители региональных сайферов!</p>', '6/0/5/581df6be74db1.jpg', '2016-11-05 13:11:58', 0, 1478358407, 14, 1, 2),
(84, 'Red Bull BC One Russia Cypher 2016', 'red-bull-bc-one-russia-cypher-2016', 1, 14, 'Red Bull BC One Russia Cypher 2016', '16 июня в Санкт-Петербурге пройдет Red Bull BC One Russia Cypher 2016.', '16 июня в Санкт-Петербурге пройдет Red Bull BC One Russia Cypher 2016.', '<p>\r\n	<br>\r\n</p><p>\r\n	6 июня в клубе «Космонавт» (Санкт-Петербург) сойдутся в престижной битве один на один Red Bull BC One Russian Cypher сильнейшие би-бои России. Последние года российские танцоры показывали настолько высокий профессионализм, что всегда оказывались в финале мирового чемпионата Red Bull BC One. Кто поедет защищать честь страны в Японию в этом году, можно будет узнать совсем скоро!\r\n</p><p><img src="/images/news/581df8dc02d27.jpg" alt="" style="display: block; margin: auto;"></p><p>В национальном финале мы увидим 15 би-боев, которые получили приглашение по итогам отбора экспертной комиссией.<br></p><p> <br></p><p>Приглашенные участники российского сайфера:<br></p><ul>\r\n	<li>Johnny (Russian Power, Екатеринбург)</li>\r\n	<li>Shortyfingerz (Animals, Омск)</li>\r\n	<li>Key White (Masters, Красноярск)</li>\r\n	<li>PJ Evolvers (Original Squad, Красноярск)</li>\r\n	<li>Zip Rock (Action Man, Казань)</li>\r\n	<li>Mongol (Чебоксары)</li>\r\n	<li>Tel (Flytronix, Новокузнецк)</li>\r\n	<li>Stany The Real (Soul Power и EvpaKingz, Евпатория)</li>\r\n	<li>Arsex (I-Town Family, Москва)</li>\r\n	<li>Yan The Shrimp (All The Most, Москва)</li>\r\n	<li>Jamal (Predatorz, Москва)</li>\r\n	<li>Boch Rock (All The Most, Москва)</li>\r\n	<li>Groovy John (OBC Crew, Москва)</li>\r\n	<li>Komar (Top9Crew, Санкт-Петербург)</li>\r\n	<li>Kapp (Funk Fanatix, Санкт-Петербург)</li>\r\n</ul>', '6/8/4/581df90420c1f.jpg', '2016-11-05 13:21:40', 0, 1478359287, 14, 1, 3),
(85, 'Граффити-тур по городам Европы, Африки', 'graffiti-tur-po-gorodam-evropy-afriki', 2, 14, 'Граффити-тур по городам Европы, Африки', '… с краской-спрэй в руках.', '… с краской-спрэй в руках.', '<p>\r\n	<strong>Mr.Dheo</strong> –29-летний художник-самоучка из Португалии, впервые познакомившись с граффити в 15 лет не оставил это дело и по сей день. На данный момент он сотрудничает с известными международными брэндами и компаниями, он не редко мелькает на страницах журналов, газет и ТВ, но искусство именно на улице его всё также привлекает и вдохновляет. Он выработал свой узнаваемый уникальный стиль и рисует в различных городах мира, а каждый год выкладывает видео со своими граффити-турне за прошедший год, не исключением стал и 2014 год, за который он посетил Голландию, Италию, Израиль, Германию, Францию, Испанию, Норвегию, Южную Африку, ОАЭ:\r\n</p>\r\n<p align="center">\r\n	<iframe width="635" height="400" src="https://www.youtube.com/embed/5eonn4JGeo8" frameborder="0" allowfullscreen></iframe>\r\n</p>\r\n<p>\r\n	Ниже опубликованы некоторые из его работ\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfc5dad1dc.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfc729e7be.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfc86d343c.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfc95ef3e7.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfcb14ec91.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfcbdb348d.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfcd636b7c.jpg">\r\n</p>\r\n<p>\r\n	<img src="/images/news/581dfce17bd6e.jpg">\r\n</p>', '4/3/7/581dfd007d53d.jpg', '2016-11-05 13:41:09', 0, 1478360433, 14, 1, 3),
(86, 'Противогазы из кроссовок Гэри Локвуда', 'protivogazy-iz-krossovok-gyeri-lokvuda', 2, 14, 'Противогазы из кроссовок Гэри Локвуда', 'Сегодня хотелось бы рассказать об одном креативном дизайнере, который, признаться, очень удивил меня, когда я познакомился с его работами.', 'Сегодня хотелось бы рассказать об одном креативном дизайнере, который, признаться, очень удивил меня, когда я познакомился с его работами.', '<p>Сегодня хотелось бы рассказать об одном креативном дизайнере, который, признаться, очень удивил меня, когда я познакомился с его работами.</p><p>Зовут его Гэри Локвуд (Gary Lockwood), в миру известен под псевдонимом Freehand Profit.<br>Гэри — автор весьма оригинального проекта MASK365, смысл которого заключается в том, что, разбирая по частям старые сношенные кроссовки, художник создает противогазы.</p><p><img src="/images/news/581dff5cf1ca9.jpg" alt="" style="display: block; margin: auto;"></p><p>Все началось с того, что еще в младших классах Гэри полюбил Хип-Хоп. Позже, в 2001-м, после поступления в колледж искусств, он начал выражать свою любовь к культуре посредством граффити.<br>Еще позже художник переехал в Лос-Анжелес и в 2010-м году начал свой проект MASK365.<br>Ежедневно в течение года он создавал по маске и выкладывал фото на свой сайт. Эту идею он позаимствовал у другого художника, Ноа Скалина, который ежедневно создавал черепа из разнообразных подручных средств.</p><p><img src="/images/news/581dff90b1bbc.jpg" alt="" style="display: block; margin: auto;"></p><p>Через несколько месяцев после старта проекта, в поисках материала для своих работ Гэри разрезал сумку Gucci по швам и собрал из этого противогаз. Это и стало ключевым моментом проекта.<br>Но дизайнер хотел работать с более близкими ему материалами. А так как кроссовки всегда были неотъемлемой составляющей Хип-Хоп культуры, именно они и стали основой для дальнейших творческих экспериментов.</p><p><strong>Почему противогазы?</strong> — Маски всегда являлись одной из форм искусства. Противогаз — это маска нашего времени, которая олицетворяет войны, гражданские беспорядки, экологические проблемы, а также служит символом страха и защиты.(с) Гэри Локвуд.</p><p>На сегодняшний день его маски оценивают в 3 — 5 тысяч долларов и за ними выстраиваются в очередь коллекционеры.</p><p><img src="/images/news/581e002bec9a2.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e003ba480d.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e0049a6dc0.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e005be72d1.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e006991421.jpg" alt="" style="display: block; margin: auto;"></p>', '6/2/5/581e013cc50b8.jpg', '2016-11-05 13:57:21', 0, 1478361435, 14, 1, 2),
(87, 'Граффити девушки в Афганистане', 'graffiti-devushki-v-afganistane', 2, 14, 'Граффити девушки в Афганистане', 'она хочет чтобы искусство было доступно всем, ведь это лучше чем война.', 'Она хочет чтобы искусство было доступно всем, ведь это лучше чем война.', '<p><strong>Shamsia Hassani</strong> является первой яркой девушкой из Афганистана, которая представляет уличное искусство, выпускница Университета Искусств Кабула, она хочет чтобы искусство было доступно всем, ведь это лучше чем война.</p><p><img src="/images/news/581e02e93ebc9.jpg" alt="" style="display: block; margin: auto;"></p><p>В 2010 году девушка узнала об уличном искусстве, она была впечатлена работами британца <strong>Chu</strong> и его словами <em>«Красота на стенах помогает обычным людям стереть из сознания войну»,</em> это было в журнале Art Radar Journal. Граффити в Афганистане является законным, однако единомышленников было сложно найти, многие начинают обвинять в том что стены становятся грязными, кто-то осуждает за то, что это искусство не является исламистским. Но в своём интервью для The Independent девушка сказала: «Меня могут оскорблять или арестовывать в Кабуле, здесь рискованно этим заниматься, но это меня не остановит».</p><p><img src="/images/news/581e0309cbc56.jpg" alt="" style="display: block; margin: auto;"></p><p>Она часто видит враждебность в глазах прохожих, однако последнее время ей перестали на улице задавать вопросы, а афганские художники начали интересоваться её работами. Она проводила в университете Кабула семинар о стрит-арте. <em>«Я надеюсь внедрить это искусство в нашей стране, это делает людей более открытыми. Современное искусство это что-то новое для нашей страны. Многие афганцы говорят, что это плохое влияние Запада. Но если художник из Афганистана, то и концепция афганская, ведь так. Я думаю это очень полезно будет для нашей страны, после стольких лет войны»</em></p><p><img src="/images/news/581e032d83e06.jpg" alt="" style="display: block; margin: auto;"></p><p>Кабул очень медленно зализывает раны. <em>«Мои граффити нанесены на поверхности, которые являются последствиями войны, пробитые пулями и повреждённые взрывами. Наши женщины по прежнему страдают от неравенстве в обществе и доступностью к образованию. Я хочу показать что женщины афганки хотят быть сильными, хотят большего, новой жизни, это я и показываю в своих работах. Я с оптимизмом смотрю на развитие нашей страны, потому мои рисунки выполнены в ярких и мягких цветах. Я хочу воскрешения нашей страны.»</em></p><p>\r\nShamsia Hassani номинирована на премию Artracker Awards.</p><p><img src="/images/news/581e035e8d6f4.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e037c89fe5.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e03a321a52.jpg" alt="" style="display: block; margin: auto;"></p>', '9/5/1/581e03b5b83e9.jpg', '2016-11-05 14:07:17', 0, 1478361576, 14, 1, 3),
(88, 'Хип-Хоп Ковры вашему дому!', 'hip-hop-kovry-vashemu-domu', 2, 14, 'Хип-Хоп Ковры вашему дому!', 'Вот чем занимается, помимо творчества, Erick Sermon (EPMD)', 'Вот чем занимается, помимо творчества, Erick Sermon (EPMD)', '<p>\r\n	В своём недавнем интервью, легендарный рэппер Erick Sermon (EPMD) рассказал о том, чем занимается помимо творчества.\r\n</p><p>\r\n	И кто бы мог подумать, это производство ковров под маркой Def Rugs. </p><p><br>\r\n	<strong>Big L, NWA, Group Home, Wu-Tang Clan, Naughty by Nature, M.O.P., BoogieDown, Public Enemy, Mobb Deep, Nas, House of Pain, La Coka Nostra, Beastie Boys, Run-DMC, Brand Nubian, Jazzy Jeff, Common, KMD, EPMD, Ras Kass, Artifacts, DMX, OC, Showbiz, DITC, Gang Starr, D&amp;D Studios, Pete Rock, Jeru, ONYX, Lords of the Underground, Digable Planets,Greg Nice, Chubb Rock, Das EFX, Redman, Rock Steady, Rakim, Snoop, 2Pac, Paris, Black Sheep, Wiz Khalifa, Joey Bada$, Ice Cube, Eazy-E, Notorious BIG</strong> и ещё много и много рэпперов и рэп-групп и даже баскетбольные команды, а также рок-музыканты стали героями для темы на ковры, которые любой желающий может заказать себе домой прямиком из Нью-Джерси. Этот бизнес принадлежит Erick Sermon и белому парню по имени Xing N Fox.\r\n</p><p><img src="/images/news/581e05503e010.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e055f94c09.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p><p>А всё началось с того, что Erick созвонившись с его сестрой приехал на производство Fox Floors, чтобы сделать именной коврик для дома с изображением логотипа EPMD. Увидев производство воочию, Erick тут же воскликнул что можно же сделать ковёр с изображением любого музыкального персонажа и группы. Его артисты смогут разместить в студии или дома например. Не долго думая, благодаря знакомству с огромным количеством артистов, Def Rugsуже выпустили огромное количество ковров. А ведь и правда отличный подарок настоящему хип-хоперу, коврик с изображением любимой группы, да ещё и хэнд-мэйд:</p><p><br></p><p><img src="/images/news/581e05a6ea22d.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/581e05c0e36b1.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p>', '0/1/3/581e0614bb85b.jpg', '2016-11-05 14:17:24', 0, 1478362136, 14, 1, 1);
INSERT INTO `z_news` (`id`, `name`, `url`, `category`, `user`, `title`, `description`, `small`, `text`, `img`, `created`, `article`, `date_redact`, `redactor_id`, `status`, `img_block_size`) VALUES
(89, 'Книга с обложками альбомов в стиле комиксов от Marvel', 'kniga-s-oblozhkami-alibomov-v-stile-komiksov-ot-marvel', 2, 14, 'Книга с обложками альбомов в стиле комиксов от Marvel', 'Marvel объединил комиксы и хип-хоп и скоро выпустит книгу со своими работами.', 'Marvel объединил комиксы и хип-хоп и скоро выпустит книгу со своими работами.\r\n\r\nА сможете ли вы узнать остальные?\r\nПредлагаем вашему вниманию некоторые из работ Marvel:', '<p>В январе выйдет книга Marvel с хип-хоп обложками в стиле комиксов </p><p>Marvel объединил комиксы и хип-хоп и скоро выпустит книгу со своими работами.<br>Это будет книга из 32 страниц, в которую войдёт 14 арт-ремиксов на обложки альбомов: DMX, A Tribe Called Quest, The Notorious B.I.G. и многих других. Выход книги запланирован на 6 января следующего года.</p><p><img src="/images/news/5820f06f2f5bd.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f07ae3d93.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f0875daa6.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f09521232.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p><p>А сможете ли вы узнать некоторые рисунки из книги?</p><p><img src="/images/news/5820f0b07595c.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f0bbed614.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f0cbc7531.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820f0d7b793b.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p>', '3/2/2/5820f191afbf3.jpg', '2016-11-07 19:28:46', 0, 1478554116, 14, 1, 3),
(90, 'Фильм MDT The Movie', 'filim-mdt-the-movie', 2, 14, 'Фильм MDT The Movie', 'Мы рады представить полноценную версию фильма в высоком разрешении', 'В преддверии десятилениялетия выхода MDT the movie, мы рады представить полноценную версию фильма в высоком разрешении', '<p>\r\n	В преддверии десятилетия выхода MDT the movie, мы рады представить полноценную версию фильма в высоком разрешении. Трафики гоняют без остановки по всем линиям, ЕЖ метро вагоны отрабатывают последние дни, ну и конечно первые холтрейны и евро выезды — так было в середине двухтысячных, это было веселое время.Сейчас это уже архив, так что удачного урока истории вместе со всеми этими командами – \r\n	<strong>ИСК, GBS, RST, KGS, QBE, CGS, 56, D2, PB, WUFC, ЗАЧЕМ, RNG, KGM, ECS, PHA, NBK, KDR, MBs, TMP, SPK, DYO, RFC, TMH, GRS, KR2, BGS[…], 158, TDV, SVRD, GOLD, UTOP, ALL, 731, RND, FO, EIER, DOS, NHA, ASM, NC, SAR, FACT, TSM, FSAL.</strong>\r\n</p>\r\n<p align="center"><iframe src="https://player.vimeo.com/video/155398840" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></p>', '8/2/4/5820f359308f9.jpg', '2016-11-07 19:34:17', 0, 1478554181, 14, 1, 3),
(91, 'Симпсоны: 60-минутный эпизод, посвящённый Хип-Хопу', 'simpsony-60-minutnyj-yepizod-posvyashhyonnyj-hip-hopu', 2, 14, 'Симпсоны: 60-минутный эпизод, посвящённый Хип-Хопу', 'Продюсеры шоу говорят, что в январе они продемонстрируют 60-минутный эпизод, полностью посвящённый хип-хоп тематике.', 'Продюсеры шоу говорят, что в январе они продемонстрируют 60-минутный эпизод, полностью посвящённый хип-хоп тематике.', '<p align="center">\r\n	<iframe src="https://player.vimeo.com/video/159063171" title="Bart Simpson - Do The Bartman (Official Video HQ)" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" width="500" height="281" frameborder="0">\r\n	</iframe>\r\n</p><p style="text-align: justify;">\r\n	За 27 сезонов и почти 600 эпизодов,\r\n	<strong> Симпсоны</strong> уделяли внимание хип-хопу, но делали это не слишком часто (к примеру эпизод с поющим <a href="https://www.youtube.com/watch?v=lEteJajTgcU" target="_blank" sl-processed="1"><strong>Pharrell Williams</strong></a> или <a href="https://www.youtube.com/watch?v=C_jJ2ifP9fA" target="_blank" sl-processed="1"><strong>50 Cent</strong></a>), но часового эпизода, полностью посвящённого хип-хопу ещё не было.\r\n</p><p style="text-align: justify;">\r\n	Настало время перемен. Продюсеры шоу говорят, что в январе они продемонстрируют 60-минутный эпизод, полностью посвящённый хип-хоп тематике. Приглашёнными звёздами будут \r\n	<strong>Key из Key &amp; Peele</strong> (<strong>Keegan-Michael Key</strong>) и <strong>Cookie</strong> из <strong>Empire</strong> (<strong>Taraji P. Henson</strong>).\r\n</p><p style="text-align: justify;">\r\n	<strong>Мэтт Зальман</strong>, исполнительный продюсер <strong>Симпсонов</strong>, сообщил <strong>Entertainment Weekly</strong> следующее:\r\n</p><blockquote>\r\n	<strong>Мы не делали ранее больших эпизодов, посвящённых хип-хопу и рэп-культуре, так что мы решили попробовать</strong>\r\n</blockquote><p style="text-align: justify;">\r\n	По словам \r\n	<strong>Мэтта</strong> это будет музыкальной адаптацией истории <strong>Великого Гэтсби</strong> (в 2013 году на тему был снят <a href="http://www.imdb.com/title/tt1343092/" target="_blank" sl-processed="1"><strong>фильм</strong></a>). Новый эпизод <strong>Симпсонов</strong> будет называться <strong>“The Great Phatsby"</strong>, ключевыми персонажами будут <strong>Мистер Бёрнс</strong> и загадочный хип-хоп магнат  по имени <strong>Jay G</strong>. Так что <span id="result_box" class="" lang="ru"><strong data-redactor-tag="strong"> <span class="">Джей</span> <span class="">Гэтсби</span></strong> <span class="">встретится с </span><strong><span class="" data-redactor-tag="span">Jay</span> </strong><span class=""><strong data-redactor-tag="strong">Z</strong>.</span></span>\r\n</p><p style="text-align: justify;">\r\n	Посмотреть эпизод \r\n	<strong>Симпсонов “The Great Phatsby"</strong> можно будет не раньше следующего года, а пока предлагаем вашему вниманию <span id="result_box" class="" lang="ru">ремикс <strong data-redactor-tag="strong">Декстера</strong></span> на культовую тему шоу:\r\n</p><p align="center">\r\n	<iframe src="https://www.youtube.com/embed/Ni3iokzjO8c?feature=oembed" allowfullscreen="" width="500" height="375" frameborder="0">\r\n	</iframe>\r\n</p>', '0/2/2/5820f7670adab.jpg', '2016-11-07 19:53:00', 0, 1478555570, 14, 1, 2),
(92, 'Как бандитские татуировки эволюционировали в искусство', 'kak-banditskie-tatuirovki-yevolyucionirovali-v-iskusstvo', 2, 14, 'Как бандитские татуировки эволюционировали в искусство', 'Как бандитские татуировки эволюционировали в искусство', 'История легендарного татуировщика Freddy Negrete из Восточного L.A.', '<p style="text-align: justify;">Если вы думаете, что ваш любимый художник настоящий <strong>OG</strong> в мире тату, то по сравнению с <strong>Freddy Negrete</strong>, почти все остальные по-прежнему являются в этом деле новичками. <strong>Negrete</strong> — один из самых опытных и влиятельных татуировщиков в мире, который сделал себе имя ещё до того как многие из сегодняшних лучших татуировщиков научились ходить.</p><p style="text-align: justify;">Профессионально <strong>Negrete</strong> начал татуировать около 40 лет назад, по-началу он делал татухи в различных местах содержания под стражей несовершеннолетних в Южной Калифорнии, постепенно оттачивая мастерство. В Соединённых Штатах татуировок с тонкими линиями, в чёрно-сером стиле фактически не существовало, по-крайне мере за пределами тюрем. Но всё изменилось, когда молодой татуировщик <strong>Freddy Negrete</strong> вышел из тюрьмы и начал вместе работать с такими легендами <strong>“<a href="http://goodtimecharliestattooland.com/" target="_blank" sl-processed="1">Good Time</a>"</strong> как <strong>Чарли Картрайтом</strong> и <strong>Джеком Руди</strong> в Восточном Лос-Анджелесе.</p><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-0" src="https://www.instagram.com/p/BHurLIjgZoT/embed/captioned/?v=7" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-0" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 500px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="622" frameborder="0"></iframe><p style="text-align: justify;">«В 60-х и 70-х татуаж контролировали байкеры и они не собирались позволить тому, чтобы какой-либо чикано гангстер просто начал наносить татуировки», — говорит <strong>Negrete</strong>. «Я был первым выдающимся чикано гангстером татуировщиком в Восточном Лос-Анджелесе, я привнёс этот стиль из тюрем, этот стиль отличался от того, что они делали. Здесь не используются какие-либо цвета, но это вовсе не означает, что так легче работать, когда <strong>Ed Hardy</strong> привёл меня в магазин, то люди начали видеть, что это непростое ремесло, потому что я много внимания уделяю деталям».</p><p style="text-align: justify;">За последние четыре десятилетия бесцветный детализированный стиль <strong>Negrete</strong> стал одним из наиболее популярных по всему миру. Первоначально это было частью чикано культуры Восточного Лос-Анджелеса, но теперь подобного рода первоклассные татуировки можно встретить повсюду, от Нью-Йорка и Сан-Диего до Австралии и Франции.</p><p style="text-align: justify;">После 60 лет взлётов и падений в тату бизнесе и бандитской жизни — <strong>Negrete</strong> объединился в соавторстве со <strong>Стивом Джонсом</strong> и готовится выпустить книгу под названием <strong>«Smile Now, Cry Later: My Life in Black and Gray»</strong> (<strong>«Смейся сейчас, плачь потом: моя история в чёрно-серых тонах»</strong>). Цена книги составит $30.</p><p><img src="/images/news/5820fb813909d.jpg" alt="" style="display: block; margin: auto;"></p><p style="text-align: left;"> «Есть несколько причин, по которым я решил написать эту книгу именно сейчас», — говорит <strong>Negrete</strong>. «Одной из причин является рост интереса к чикано культуре и тому, что происходило в 1960-х и 70-х годах, это было частью моей жизни. Другие причины заключаются в том, что люди интересуются тем, что происходит в тюремной системе Калифорнии и конечно же историей татуировки.»</p><p style="text-align: justify;">Автобиография охватывает всю жизнь <strong>Negrete</strong>, начиная с того времени как его грубо воспитывали в приёмных семьях, заканчивая тем, как он поднялся в мире тату и потерял одного из своих сыновей. В течение 2-х лет <strong>Negrete</strong> писал материал для книги, а также искал подходящие фотографии, курируя крупнейшие выставки с тематикой татуировок по всей Калифорнии.</p><p style="text-align: justify;">«Не так давно я встретил парня по имени <strong>Антонио Пелайо</strong>, именно он и проводит все эти художественные выставки в Восточном Лос-Анджелесе», — говорит <strong>Negrete</strong>. «Он всегда пытается привлечь тату художников, чтобы они поучаствовали в выставках, потому что считает их одними из лучших художников, но никому из них это обычно не интересно. Я начал делать арты на его шоу, а затем и другие художники татуировки начали принимать в них участие, так что он попросил меня помочь организовать шоу, на котором будут только художники татуировки».</p><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-1" src="https://www.instagram.com/p/BJerJmZgIBS/embed/captioned/?v=7" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-1" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 500px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="605" frameborder="0"></iframe><p style="text-align: justify;">В течение 2-х лет проводится мероприятие <strong>Tatuaje</strong> (последнее прошло совсем недавно, в конце июля), где собираются сотни лучших художников со всех штатов. Работы <strong>Carlos Torres</strong> и <strong>Sergio Sanchez</strong> отображаются на стенах<strong> Plaza de la Raza</strong>, там всегда много музыки, еды и напитков, всегда есть что посмотреть. На самом деле <strong>Negrete</strong> является идеальной кандидатурой среди всех возможных организаторов данного мероприятия, на котором ежегодно собираются элитные художники татуировки, никто не смог бы сделать это лучше, чем <strong>Negrete</strong>.</p><p style="text-align: justify;">В то время как индустрия татуировки, как правило, строится на уважении к старшим и наследию, <strong>Negrete</strong> выражает уважение молодому поколению художников татуировки и сам в свою очередь учится у них, <strong>Negrete</strong> не собирается останавливаться на достигнутом и до сих пор в деле, он ищет новые формы и продолжает оттачивать своё мастерство, ведь совершенству нет предела. <strong>Negrete</strong> может легко дать фору многим молодым профи и в очередной раз доказать, что старый пёс может научиться новым трюкам.</p><p style="text-align: justify;">«В последнее время появляются такие ребята как <strong>Carlos Torres, Bob Tyrrell </strong>и<strong> Nikko Hurtado</strong>, их работы это уже не столько просто татуировки, сколько целые картины», — говорит <strong>Negrete</strong>. «Они легенды современной татуировки. Я вижу вокруг очень много талантливых художников и понимаю, что должен не отставать, чтобы моё искусство тоже вышло на новый уровень».</p><p style="text-align: justify;">Годы прогресса принесли <strong>Negrete</strong> верную клиентуру. Начиная от твердолобых коллекционеров, до новичков, каждый отмечает, что мастерству <strong>Negrete</strong> нет равных, он уникален. Вместо того, чтобы сосредоточиться на создании потрясного <em>Instagram</em>, как это делают многие современные татуировщики, <strong>Negrete</strong> как правило не постит фото татуированных знаменитостей Голливуда, как это делают многие его коллеги по ремеслу.</p><p style="text-align: justify;">«Я делаю тату для актёров и рок-звёзд, у меня есть своя ниша клиентов, но есть и другие ребята, такие как мой сын <strong>Isaiah Boo Boo Negrete</strong>, <strong>Mark Mahoney</strong> и <strong>Doctor Woo</strong>«, — говорит <strong>Negrete</strong>. Они делают так чаще, потому что я пытаюсь делать это в другом стиле. Я стараюсь делать свои татуировки более художественными, я специализируюсь на больших татуировках, но другие ребята обычно делают крошечные тату, так что у нас разные подходы в этом деле».</p>', '3/5/2/5820fbffc9665.jpg', '2016-11-07 20:11:11', 0, 1478556343, 14, 1, 3),
(93, 'Три художника изобразили Wu-Tang Clan на холстах', 'tri-hudozhnika-izobrazili-wu-tang-clan-na-holstah', 2, 14, 'Три художника изобразили Wu-Tang Clan на холстах', 'Работы художников Reph, SB и Niz', 'Получилось очень оригинально...', '<p>\r\n	Трио <strong>Reph, SB</strong> и<strong> Niz</strong> потрудились и отрисовали всех девятерых участников <strong>Wu-Tang Clan</strong> на своих холстах, при том сделали это достаточно оригинально в классических чёрно-жёлтых тонах:\r\n</p><hr><p><br></p><p><img src="/images/news/5820ff119fa06.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff21ab355.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff36d6aef.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff4195cbc.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff4d57a0b.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff64e9992.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff6ed3c16.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff7a8c212.jpg" alt="" style="display: block; margin: auto;"></p><p><img src="/images/news/5820ff859b2fe.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p>', '3/2/8/582100798466d.jpg', '2016-11-07 20:30:17', 0, 1478557097, 14, 1, 3),
(94, 'Ловушка для райтеров', 'lovushka-dlya-rajterov', 2, 14, 'Ловушка для райтеров', 'Группа разработчиков из Сиднея представили систему, способную благодаря сенсорам реагировать на запах маркеров и краски', 'Группа разработчиков из Сиднея представили систему, способную благодаря сенсорам реагировать на запах маркеров и краски', '<p>Новая высокотехнологичная система способна обнаруживать граффити-райтеров.</p><p>Группа разработчиков из Сиднея представили систему, способную благодаря сенсорам реагировать на запах маркеров и краски, пишет Reuters. Новинка получила название "мышеловка" и на данный момент окончила тестирование в местной полиции. </p><p><img src="/images/news/58306c6794179.jpg" alt="" style="display: block; margin: auto;"></p><p>Принцип ее работы построен на своевременном оповещении. Во время непосредственной росписи поездов граффити сенсор передает сигнал в офис службы безопасности железной дороги, а сами действия вандалов начинают записываться на камеру.</p><p><br>После диспетчер определяет на каком именно участке железной дороги орудует банда райтеров и подключает к их задержанию полицию.</p><p><br>По словам главы Sydney Trains Говарда Коллинза, за время тестирования новой системы 50 вандалам уже предъявлены обвинения в совершении преступления.</p>', '3/9/9/58306cd750984.jpg', '2016-11-19 13:16:39', 0, 1479568340, 14, 1, 2),
(95, 'На Андреевском спуске в Киеве появилось масштабное граффити', 'na-andreevskom-spuske-v-kieve-poyavilosi-masshtabnoe-graffiti', 2, 14, 'На Андреевском спуске в Киеве появилось масштабное граффити', 'В рамках Французской весны художник-муралист Жюльен Маллан, известный под именем Seth, создает на Андреевском спуске новое граффити', 'В рамках Французской весны художник-муралист Жюльен Маллан, известный под именем Seth, создает на Андреевском спуске новое граффити', '<h2>Это совместная работа знаменитого французкого граффитчика Seth и севастопольского художника Кислова.</h2><p>\r\n	<br>\r\n		В Киеве в рамках Французской весны художник-муралист Жюльен Маллан, известный под именем Seth, создает на Андреевском спуске новое граффити совместно с художником из Севастополя Алексеем Кисловым.\r\n</p><p>\r\n	<br>\r\n</p><p align="center">\r\n	<iframe allowtransparency="true" scrolling="no" src="//instagram.com/p/mdX9CrEehA/embed/" height="710" frameborder="0" width="612">\r\n	</iframe>\r\n</p><p>\r\n	<br>\r\n</p><p>\r\n	<br>\r\n		Помимо Киева, проекты в области мурализма появятся и во Львове.\r\n</p><p>\r\n		В прошлом году во время своего пребывания в Киеве на Французской весне Жюльен Маллан и известный украинский стрит-художник Waone (Interesni Kazki) вместе <a href="http://korrespondent.net/lifestyle/afisha/1547810-segodnya-v-kieve-otkryvaetsya-vystavka-znamenitogo-francuzskogo-strit-art-hudozhnika" target="_self">создали рисунок</a> на одном из фасадов Киево-Могилянской Академии.\r\n</p>', '9/3/5/58306e66d4969.jpg', '2016-11-19 13:23:18', 0, 1479568778, 14, 1, 3),
(96, 'В Украине появился свой Бэнкси', 'v-ukraine-poyavilsya-svoj-byenksi', 2, 14, 'В Украине появился свой Бэнкси', 'Его работы зачастую полны патриотизма и несут в себе антишовинистический настрой.', 'Его работы зачастую полны патриотизма и несут в себе антишовинистический настрой.', '<p>Крымский стрит-арт художник, который подписывается ником Шарик, рисует на стенах, фасадах и заборах, изобличая общественные недостатки. Его работы зачастую полны патриотизма и несут в себе антишовинистический настрой.</p><p>Шарика сравнивают с величайшим уличным художником мира и называют украинским Бэнкси. </p><p><img src="/images/news/583071722019f.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p><p><img src="/images/news/583071c8ae85a.jpg" alt="" style="display: block; margin: auto;"></p><p>Его имени и лица практически никто не знает. Публичный только его никнейм. Анонимность - не составляющая часть его имиджа, а необходимость. Чтобы правоохранители не знали, кого искать.</p>', '7/9/9/58307201d1d23.jpg', '2016-11-19 13:38:41', 0, 1479569588, 14, 1, 3),
(97, 'В Москве художники нарисуют граффити по заявкам горожан', 'v-moskve-hudozhniki-narisuyut-graffiti-po-zayavkam-gorozhan', 2, 14, 'В Москве художники нарисуют граффити по заявкам горожан', '​В Москве на сайте фестиваля Лучший город Земли появился онлайн сервис Граффити-Помощь.', '​В Москве на сайте фестиваля Лучший город Земли появился онлайн сервис Граффити-Помощь.', '<p>В Москве на сайте фестиваля Лучший город Земли появился онлайн сервис Граффити-Помощь.</p><p>Суть <a href="http://lgz-moscow.ru/graffiti/" target="_blank">сервиса</a> в том, что художники присылают идеи граффити, а жители Москвы оставляют заявки-адреса, где граффити были бы наиболее уместны.<br>После этого власти решат, что и где будет нарисовано. Авторами граффити станут известные российские и зарубежные художники.</p><p><img src="/images/news/58307291e898c.jpg" alt="" style="display: block; margin: auto;"></p><p><br></p>', '2/7/8/58307302e6d1f.jpg', '2016-11-19 13:42:58', 0, 1479569937, 14, 1, 3),
(98, 'Украинский Бэнкси нарисовал политиков курящими травку', 'ukrainskij-byenksi-narisoval-politikov-kuryashhimi-travku', 2, 14, 'Украинский Бэнкси нарисовал политиков курящими травку', 'На новом граффити Шарика Янукович, Путин и Лукашенко в костюмах курят через бонг', 'На новом граффити Шарика Янукович, Путин и Лукашенко в костюмах курят через бонг', '<p>Граффитчик из Крыма по прозвищу Шарик, которого называют "украинским Бэнкси", изобразил на своем новом рисунке президентов Украины, России и Беларуси.</p><p>Так, на новом граффити Шарика Янукович, Путин и Лукашенко в костюмах курят через бонг (устройство для курения марихуаны).<br>Издание Fresh news не уточняет, где именно оставлен этот рисунок.Граффитчик из Крыма, который подписываетcя ником Шарик, скрывает свое свое лицо и настоящее имя, чтобы правоохранители не знали, кого искать.</p><p><br></p>', '7/1/3/5830742795db5.jpg', '2016-11-19 13:47:51', 0, 1479570374, 14, 1, 1),
(99, 'Индонезия: искусству помогает дополненная реальность', 'indoneziya-iskusstvu-pomogaet-dopolnennaya-realinosti', 2, 14, 'Индонезия: искусству помогает дополненная реальность', 'Сообщество уличных художников индонезийского города Бандунг продвигает свои творения при помощи современных технологий.', 'Сообщество уличных художников индонезийского города Бандунг продвигает свои творения при помощи современных технологий.', '<p>\r\n	<em>Сообщество уличных художников индонезийского города Бандунг продвигает свои творения при помощи современных технологий. Оно привлекает туристов в район с многочисленными граффити на стенах, надеясь, что это поможет местной экономике.</em>\r\n</p><p>\r\n	Используют технологию дополненной реальности. Это уже стало своеобразной местной достопримечательностью.\r\n</p><p>\r\n	Большинство настенных рисунков можно отсканировать при помощи приложения «Индонезия у вас в руке». Оно позволяет туристам понять, как создавались работы.\r\n</p><p align="center">\r\n	<iframe width="560" height="315" src="https://www.youtube.com/embed/lEjWLLetDdw" frameborder="0" allowfullscreen=""></iframe>\r\n</p><p>\r\n	<strong>[Эфрайм Тан, турист из Джакарты]:</strong><br>\r\n	«Я здесь с экскурсией. Узнал об этом месте через Интернет. Удивительно, что здесь есть технология дополненной реальности. Она очень помогает иностранным туристам, особенно тем, которые не знают этого города».\r\n</p><p>\r\n	Технология дополненной реальности не нова. Она начала активно развиваться ещё в 2010 году. Но в Индонезии она используется впервые. Здесь её начали применять в ноябре этого года.\r\n</p><p>\r\n	<strong>[Амиранто Вибово, глава Indonesia In Your Hand]:</strong><br>\r\n	«Граффити – это то, при помощи чего местные жители выражают свои идеи. Поэтому мы решили применить технологию дополненной реальности. Это, наверное, первая деревня в мире с подобной технологией. С другой стороны, мы надеемся, что поток туристов, включая иностранных, возрастёт. А с ним увеличится и прибыль для местных кафе и сувенирных лавок».\r\n</p><p>\r\n	Теперь компания начала сотрудничество с индонезийским Управлением по туризму. Она надеется создать общенациональную услугу, которая бы продвигала путешествия по стране.\r\n</p><p>\r\n	Что касается Бандунга, то подобную технологию хотят внедрить во всех его районах уже в ближайшие три года.\r\n</p><p>\r\n	<strong>[Нананг Содикин, представитель Управления по туризму Бандунга]:</strong><br>\r\n	«В 2018 году в каждом районе города будет своя зона для творчества».\r\n</p><p>\r\n	Ранее в этом месяце ЮНЕСКО включило Бандунг в свой список претендентов на звание «Креативный город дизайна». Как ожидается, он пополнит его вместе с Будапештом и Сингапуром.\r\n</p>', '9/7/5/58307687ef21c.jpg', '2016-11-19 13:57:59', 0, 1479570635, 14, 1, 2),
(100, 'Показ фильма Girl Power', 'pokaz-filima-girl-power', 2, 14, 'Показ фильма Girl Power', 'В эту субботу в Москве состоится показ чешского документального фильма, посвященного девушкам граффити-райтерам из разных стран.', 'В эту субботу в Москве состоится показ чешского документального фильма, посвященного девушкам граффити-райтерам из разных стран.', '<p align="center">\r\n	<iframe src="https://www.youtube.com/embed/fFiU2NBlfSQ" allowfullscreen="" width="700" height="394" frameborder="0">\r\n	</iframe>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n		В рамках биеннале уличного искусства «\r\n	<a href="http://2016.artmossphere.ru" target="_blank">Артмоссфера</a>» в ДК «Трехгорка» состоится показ документальной ленты, посвященный девушкам граффити-райтерам и женскому взгляду на граффити.\r\n</p>\r\n<p>\r\n		В фильме принимают участие райтеры из Праги, Москвы, Кейптауна, Сиднея, Мадрида, Берлина, Барселоны, Сан-Паулу, Тулузы и Нью-Йорка. Лента \r\n	<a href="http://www.girlpowermovie.com" target="_blank">Girl Power</a> построена на повествовании, которое ведется от лица чешской граффити-художницы Сани (Sany).\r\n</p>\r\n<p>\r\n		Она рисует с пятнадцати лет, участвует в женских граффити-командах Girl Power Crew и PUFF и занимается организацией граффити-джемов, фестивалей и выставок в Праге. После просмотра состоится дискуссия с участием режиссера и художниц, рисующих на улице, а затем вечеринка с участием бибоев и музыкальным сопровождением от Flammable Beats.\r\n</p>', '1/1/6/583077f2af5e6.jpg', '2016-11-19 21:28:48', 0, 1479598088, 14, 1, 1),
(101, 'Cкончался легендарный хип-хоп диджей — Big Kap ', 'ckonchalsya-legendarnyj-hip-hop-didzhej-big-kap', 4, 14, 'Cкончался легендарный хип-хоп диджей — Big Kap ', 'ig Kap, по словам родных и близких, не жаловался на свое здоровье, а на сегодня, 3 февраля, планировал очередное выступление.', 'ig Kap, по словам родных и близких, не жаловался на свое здоровье, а на сегодня, 3 февраля, планировал очередное выступление.', '<p>\r\n	Нью-Йорк — место, где родился хип-хоп, потому он имеет большую долю  рэпперов и диджеев, которых мы считаем легендарными. Сегодня хип-хоп потерял еще одну легенду — скончался DJ Big Kap. По словам его менеджера, Ab Traxx, Kap скончался от сердечного приступа прошлой ночью. Ab Traxx также сказал, что не знал о его проблемах с сердцем, но упомянул о прошлых проблемах Big Kap с диабетом. Ему было 45 лет.<br>\r\n	<br>\r\n	 Big Kap, по словам родных и близких, не жаловался на свое здоровье, а на сегодня, 3 февраля, планировал очередное выступление. Анонс этой вечеринки стал его последним постом в инстаграм.\r\n</p><hr><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-0" src="https://www.instagram.com/p/BBSqB0Nu0cD/embed/?v=6" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-0" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 658px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="713" frameborder="0"></iframe><hr><p>Немного фактов из биографии <strong>DJ Big Kap</strong>:</p><p><strong>DJ Big Kap</strong> делал историю вместе с <strong>Funkmaster Flex</strong>, когда они выпустили альбом <strong>«The Tunnel»</strong>, в 1999 году. В этом альбоме собраны эксклюзивные треки от <strong>Biggie</strong>,<strong> Tupac</strong>, <strong>Eminem</strong>, <strong>Jay Z</strong>,<strong> Dr. Dre</strong>, <strong>Snoop Dogg</strong>, <strong>Nas</strong> и других. <strong>«The Tunnel»</strong> был продан в количестве 100.000 копий в первую неделю и занял 35 позицию в чарте Billboard. <strong>«The Tunnel»</strong> доступен в <strong><a href="https://itunes.apple.com/ru/album/the-tunnel/id13492638?ign-mpt=uo%3D4" target="_blank" sl-processed="1">Itunes</a></strong>. </p><hr><hr><p>В начале своей карьеры, <strong>Big Kap</strong> был участником объединения диджеев Нью-Йорка —  <strong>The Flip Squad</strong>, куда помимо него входили <strong>Funxmaster Flex</strong>, <strong>Frankie Cutglass,</strong> <strong>Mark Ronson, Lovebug Starski </strong>и <strong>Biz Markie.</strong> </p><hr><hr><p>На YouTube есть видео, где <strong>Big Kap</strong> выступал в роли диджея для <strong>Notorious B.I.G.</strong> на Summer Jam 1995. <strong>Kap</strong> немного запорол выступление, из-за чего <strong>Biggie</strong> кинул в него бутылкой. Позже в интервью, <strong>Big Kap</strong> сказал, что несмотря на это, они с <strong>B.I.G.</strong> всегда были хорошими друзьями, а тем поступком рэппер всего лишь подтвердил свой образ жесткого парня. <strong>Big Kap</strong>. какое-то время, был диджеем <strong>Nas</strong>, но о каких-то курьезных моментах, связанных с ним неизвестно. </p><hr><hr><p>Множество выразили сегодня свои соболезнования семье и близким легендарного диджея, приведем в пример лишь некоторые из них:</p><p><strong>Funkmaster Flex</strong> </p><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-1" src="https://www.instagram.com/p/BBVBqdvwQ7u/embed/captioned/?v=6" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-1" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 658px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="738" frameborder="0"></iframe><p><strong>Pete Rock</strong></p><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-2" src="https://www.instagram.com/p/BBU9NcgmLbf/embed/captioned/?v=6" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-2" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 658px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="772" frameborder="0"></iframe><p><strong>Questlove</strong> (<strong>The Roots</strong>) </p><iframe class="instagram-media instagram-media-rendered" id="instagram-embed-3" src="https://www.instagram.com/p/BBU96dgQa18/embed/captioned/?v=6" allowtransparency="true" data-instgrm-payload-id="instagram-media-payload-3" scrolling="no" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; margin: 1px; max-width: 658px; width: calc(100% - 2px); border-radius: 4px; box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.5), 0px 1px 10px 0px rgba(0, 0, 0, 0.15); display: block; padding: 0px;" height="892" frameborder="0"></iframe><p><strong><br></strong></p>', '5/9/2/583187aec696f.jpg', '2016-11-20 09:27:03', 0, 1479641198, 14, 1, 2),
(102, 'DJ Shadow представил клип на трек «The Sideshow» ', 'dj-shadow-predstavil-klip-na-trek-the-sideshow', 4, 14, 'DJ Shadow представил клип на трек «The Sideshow» ', 'DJ Shadow выпускает видео на трек «The Sideshow»', 'DJ Shadow выпускает видео на трек «The Sideshow»', '<p>Вслед за новым альбомом «The Mountain Will Fall» <strong>DJ Shadow</strong> выпускает видео на трек<strong> «The Sideshow»</strong>. В нем легендарный диджей показывает свое мастерство на деле. Простенько и со вкусом.</p><hr><p align="center"><iframe src="https://www.youtube.com/embed/A1VqYac-i0Y?feature=oembed" allowfullscreen="" width="500" height="281" frameborder="0"></iframe></p>', '7/1/6/5831898953cff.jpg', '2016-11-20 09:32:23', 0, 1479641537, 14, 1, 3),
(103, 'Новое видео: DJ Paul — «These Haters Broke» ', 'novoe-video-dj-paul-these-haters-broke', 4, 14, 'Новое видео: DJ Paul — «These Haters Broke» ', 'Пока Juicy J уверенно занимает свою нишу в мейнстриме, его коллега по Three 6 Mafia, DJ Paul, продолжает дело легендарной группы из Мемфиса', 'Пока Juicy J уверенно занимает свою нишу в мейнстриме, его коллега по Three 6 Mafia, DJ Paul, продолжает дело легендарной группы из Мемфиса', '<p>Пока <strong>Juicy J</strong> уверенно занимает свою нишу в мейнстриме, его коллега по <strong>Three 6 Mafia, DJ Paul</strong>, продолжает дело легендарной группы из Мемфиса. Очень злой продакшн и суровая читка от <strong>DJ Paul</strong> — прилагаются. В самом же видео артист напоминает нам, что он же в первую очередь диджей и продюсер, так что мы увидим его за вертушками и синтезатором.</p><p>Послезавтра, 15-го августа, у <strong>DJ Paul</strong> выйдет новый микстейп <strong>«Mafia 4 Life»</strong>, в записи которого приняли участие: <strong>Dave East, Yelawolf, Jon Connor, O.G. Maco, Compton Menace, Kokoe Chapo</strong> и <strong>Dope D.O.D.</strong>. Все это будет прелюдией к его полноценному сольному альбому <strong>«Year of the Six»</strong>, который должен выйти до конца этого года.</p><hr><p align="center"><iframe src="https://www.youtube.com/embed/kxwzmJhIZCo?feature=oembed" allowfullscreen="" width="500" height="281" frameborder="0"></iframe></p>', '0/6/0/58318a6f3ca07.jpg', '2016-11-20 09:35:11', 0, 1479641579, 14, 1, 3),
(104, 'DJ LORD представляет новое видео и альбом', 'dj-lord-predstavlyaet-novoe-video-i-alibom', 4, 14, 'DJ LORD представляет новое видео и альбом', 'DJ Lord — 2MP World Citizen [OFFICIAL]', 'DJ Lord — 2MP World Citizen [OFFICIAL]', '<p><img src="/images/news/58318b5c3262f.jpg" style="display: block; margin: auto;" alt=""></p><p>СКАЧАТЬ АЛЬБОМ: <a href="http://www.rcsmusic.com/3580777131021/eat-the-rat.html" target="_blank" sl-processed="1"><strong>DJ Lord «Eat The Rat» </strong></a></p>', '2/5/1/58318bcfd4a4e.jpg', '2016-11-20 09:42:03', 0, 1479642117, 14, 1, 3),
(105, 'Душевное видео из Швеции от ди-джея Avicii', 'dushevnoe-video-iz-shvecii-ot-di-dzheya-avicii', 4, 14, 'Душевное видео из Швеции от ди-джея Avicii', ' По данным журнала Forbes, в 2013 году он входил в десятку самых высокооплачиваемых ди-джеев мира с годовым доходом в 20 млн долларов. ', ' По данным журнала Forbes, в 2013 году он входил в десятку самых высокооплачиваемых ди-джеев мира с годовым доходом в 20 млн долларов. ', '<p>\r\n	<strong><span xml:lang="sv" data-redactor-tag="span" lang="sv">Tim Bergling</span> </strong>— шведский диджей и музыкальный продюсер, известный под сценическим именем <strong>Avicii (</strong>читается как<strong> «Авичи»)</strong>. Прославился в 2010 году благодаря синглам <strong>«My Feelings for You», «Seek Bromance», «Blessed» </strong>и<strong> «Levels». </strong>По данным журнала <strong>Forbes</strong>, в 2013 году он входил в десятку самых высокооплачиваемых ди-джеев мира с годовым доходом в 20 млн долларов.<strong><br>\r\n	</strong>\r\n</p><p>\r\n	<span id="result_box" class="" lang="ru"><span class="hps"><strong>Avicii</strong> не скрывает, что его новый трек и видео</span></span> <span id="result_box" class="" lang="ru"><span class="hps">это коллаборация с</span> <strong><span class="hps" data-redactor-tag="span">Volvo</span></strong>.<br>\r\n	<span class="hps">Летом</span> <span class="hps">2014 года,</span> <strong><span class="hps" data-redactor-tag="span">Avicii</span> </strong><span class="hps">оглянулся на свою</span> <span class="hps">на</span> <span class="hps">впечатляющую карьеру</span>. <span class="hps">Он был одним</span> <span class="hps">из самых</span> <span class="hps">успешных</span> <span class="hps">исполнителей в</span> <span class="hps">мире, с более чем</span> <span class="hps">10 миллионами</span> <span class="hps">проданных альбомов</span>. <span class="hps">Его песни</span> <span class="hps">возглавляли чарты</span> <span class="hps">по всему миру</span>. <span class="hps">Но</span> <span class="hps">320</span> <span class="hps">концертов</span> <span class="hps">в год</span> <span class="hps">и</span> <span class="hps">постоянное давление</span>, заставило его пересмотреть свой подход к своей жизни.<br>\r\n	<span class="hps">Так</span>, 8 сентября <span class="hps">2014 года,</span> <strong><span class="hps" data-redactor-tag="span">Avicii</span></strong> <span class="hps">решил прекратить</span> <span class="hps">все</span> <span class="hps">гастроли и</span> <span class="hps">рекламные мероприятия</span> <span class="hps">и</span> <span class="hps">взять некоторое время</span> на перезагрузку, в том числе для <span class="hps">вдохновения</span>. <span class="hps">8</span> <span class="hps">месяцев спустя</span> <span class="hps">он вернулся</span><span class="">, полный сил, с желанием начать всё заново</span>.</span>\r\n</p><p align="center">\r\n	<iframe src="https://www.youtube.com/embed/S565hk5T7SA?feature=oembed" allowfullscreen="" width="500" height="281" frameborder="0">\r\n	</iframe>\r\n</p><p>\r\n	Этот трек также уже можно приобрести на <a href="https://itunes.apple.com/ru/album/feeling-good-single/id991852456?ign-mpt=uo%3D4" target="_blank" sl-processed="1"><strong>iTunes</strong></a>\r\n</p>', '3/7/8/58318d5364abb.jpg', '2016-11-20 09:47:31', 0, 1479642323, 14, 1, 2),
(106, 'Аффект Соло «Посыл» (scratches Dj N-Tone) ', 'affekt-solo-posyl-scratches-dj-n-tone', 4, 14, 'Аффект Соло «Посыл» (scratches Dj N-Tone) ', 'Сегодня вашему вниманию первый сингл из нового материала.', 'Сегодня вашему вниманию первый сингл из нового материала.', '<p><strong>Аффект Соло </strong>a.k.a<strong> Dj A.Soul</strong> он же Виталий Стырков — Хип Хоп исполнитель, музыкант, аранжировщик, диджей и битмэйкер. Поклонник классического хип хопа, фанка и соула. Как Dj отыграл множество фестивалей и контестов, как МС участвовал во многих фестивалях, таких как <strong>Урбания, Кофемолка </strong>и<strong> Rap Music</strong> (проходил в 20-ку в 2008 году), выпустил несколько синглов и EP альбом в 2012<strong> «Цветной Слух»</strong> новый материал в процессе написания. Как аранжировщик и битмэйкер написал кавера и спродюсировал весь альбом <strong>Слиму (Centr)</strong> в 2014 году релиз <strong>Слим и Аффект Соло «Симфония номер 5».</strong></p><p>Сегодня вашему вниманию первый сингл из нового материала.<br>\r\nМузыка — <strong>Аффект Соло</strong><br>\r\nСкрейтчи — <strong>Dj N-Tone</strong></p><hr><iframe scrolling="no" src="https://w.soundcloud.com/player?url=https%3A%2F%2Fsoundcloud.com%2Faffect-solo%2Fscratches-dj-n-tone" width="100%" height="166" frameborder="no"></iframe><div class="postmeta">\r\n                            <!--p>Category: <a href="http://hiphop4real.com/c/audio/" rel="category tag">Аудио</a>, <a href="http://hiphop4real.com/c/news/" rel="category tag">Новости</a>   |   Tags: <a href="http://hiphop4real.com/t/dj-a-soul/" rel="tag">Dj A.Soul</a>, <a href="http://hiphop4real.com/t/affekt-solo/" rel="tag">Аффект Соло</a></p-->\r\n                            <div class="social">\r\n                                <span class="social-text"></span><br></div></div>', '3/9/4/58318e3b7a6cc.jpg', '2016-11-20 09:52:23', 0, 1479642737, 14, 1, 3),
(107, 'DJ U-Neek: интервью', 'dj-u-neek-interviyu', 4, 14, 'DJ U-Neek: интервью', 'Бывший диджей и музыкальный продюсер группы Bone Thugs-N-Harmony дал интервью сайту HipHodDX', 'Бывший диджей и музыкальный продюсер группы Bone Thugs-N-Harmony дал интервью сайту HipHodDX', '<p>\r\n	<strong>DJ U-Neek</strong> (бывший диджей и музыкальный продюсер группы <strong>Bone Thugs-N-Harmony</strong>) дал интервью сайту <strong><a href="https://hiphopdx.com/" target="_blank" sl-processed="1">HipHodDX</a></strong>, в котором рассказал о том, как впервые встретил знаменитого хип-хопа менеджера <strong>Chris Lighty</strong>, который скончался в 2012 году, по официальной версии от совершенного самоубийства. <strong>U-Neek</strong> и <strong>Lighty</strong> встретились на <strong>Ruthless Records</strong>, в то время, когда вся команда лейбла пыталась оправиться после смерти<strong> Eazy-E</strong>:\r\n</p><blockquote>\r\n	«<strong>Chris Lighty</strong> пришел тогда, когда умер <strong>Eazy</strong>, а <strong>Ruthless Records</strong> превратился в руины. Ни кто ничего не делал. Мой адвокат был всегда на связи с <strong>Крисом</strong>, что помогало нам оставаться на плаву. Он пришел в студию, во время записи <strong>Bone Thugs</strong>. Я не мог поверить, что познакомился с самим <strong>Chris Lighty</strong>, который помогал еще группе <strong>The Jungle Brothers</strong>. Он пришел к нам с хорошими намерениями, а я договорился с ним о записи нескольких проектов на его лейбле <strong>Violator</strong>. После этого мы были постоянно на связи».</blockquote><hr><p align="center"><iframe src="https://www.youtube.com/embed/pVW5oe7-5hc" allowfullscreen="" width="634" height="400" frameborder="0"></iframe></p><hr><p>\r\n	<strong>DJ U-Neek</strong> спродюссировал большую часть классических материалов <strong>Bone Thugs-N-Harmony</strong>, включая такие хиты, как «<strong>Thuggish Ruggish Bone»</strong>, <strong>«No Surrender»</strong>и <strong>«Dayz Of Our Lives»</strong>. Альбомы <strong>«E. 1999/Eternal»</strong> и двойной <strong>«Art Of War»</strong> тоже его заслуга. В интервью <strong>U-Neek</strong> рассказал, как впервые начал работать с <strong>Eazy-E</strong> и <strong>Ruthless Records</strong>:\r\n</p><blockquote>\r\n	«<strong>Eazy-E</strong> был моим наставником. До этого я часто встречал его на всяких мероприятиях, но он никогда не разговаривал на них о делах, так как неподходящее место и слишком много людей вокруг. Пришлось принести свое демо сразу на <strong>Ruthless</strong>, но вместо <strong>Eazy</strong> я встретил там <strong>Jerry Heller</strong>. Он сказал, что передаст демо <strong>Эрику</strong>. Затем мне позвонил сам <strong>Eazy</strong>: «Это<strong> Eazy</strong>, я послушал запись с твоими битами. Мужик, где ты был? Почему я не знаю тебя?» Он пригласил меня стать частью <strong>Ruthless Records</strong>. <strong>Dr. Dre</strong> как раз только покинул лейбл, а мы начали творить уже свою историю».</blockquote><hr><p align="center"><iframe src="https://www.youtube.com/embed/mlugG0NydTw" allowfullscreen="" width="634" height="400" frameborder="0"></iframe></p><hr><p>\r\n	<strong>U-Neek</strong> еще поделился воспоминаниями о первой реакции <strong>Krayzie Bone</strong> на его биты, после первой же прослушки он предложил <strong>U-Neek</strong> стать официальном членом <strong>Bone Thugs-N-Harmony</strong>:\r\n</p><blockquote>\r\n	«<strong>Krayzie Bone</strong> был тем, кто дал мне направление. <strong>Bone Thugs</strong> были подписаны благодаря <strong>DJ Yella</strong>, а я начал делать биты для них. Они хотели чего-то медленного и спокойного, так как считали, что это их вайб. Помню момент, как они о чем-то общались с <strong>Eazy</strong>, пока я делал биты, но когда все было сделано, то я позвал всех, нажал на PLAY и они просто очумели. Я включил им <strong>«Creepin On Uh Come Up»</strong>, включил<strong> «Thuggish Ruggish Bone»</strong>, затем <strong>«Surrender»</strong>. Все были счастливы. Тогда мы поняли, что это была настоящая магия».</blockquote>', '9/3/1/583190840196b.jpg', '2016-11-20 10:01:07', 0, 1479642885, 14, 1, 2),
(108, 'DJ Shadow выгнали из-за пульта', 'dj-shadow-vygnali-iz-za-pulita', 4, 14, 'DJ Shadow выгнали из-за пульта', 'Известный и уважаемый в мире электронной музыки DJ Shadow в минувший уикенд был выгнан из-за пульта в клубе Mansion ', 'Известный и уважаемый в мире электронной музыки DJ Shadow в минувший уикенд был выгнан из-за пульта в клубе Mansion ', '<p class="imaged_right">\r\n<img src="http://cdn.maases.com/post-attachments/00/00/84/96/55/1.jpg" alt="" border="0" align="right">Скандальная новость, которая потрясла сообщества фейсбука и твиттера, а затем уже и остальное интернет-пространство!</p><p>Известный и уважаемый в мире электронной музыки DJ Shadow в минувший уикенд был выгнан из-за пульта в клубе Mansion (Майами, США). Причина проста и до боли банальна — его сет не понравился публике. Shadow успел отыграть всего 20 минут своего сета, после чего к нему подошел промоутер клуба и попросил закончить «неформатное выступление».</p><p>Взяв микрофон в руки, диджей обратился к публике со словами: «I\'ve waited a long time to play here, but they said this shit is too confusing for all y\'all. Too future» (Я долго ждал, чтобы сыграть здесь, но они говорят — это дерьмо слишком сбивает вас всех с толку. Слишком футуристично). </p><p>Позже DJ Shadow сделал пост в своем Twitter: «Мне наплевать, если меня турнут из всех клубов для богатых детишек на планете. Я никогда не принесу в жертву свою честь диджея!».</p><p>Для справки, Джош Дэвис — один из родоначальников стиля трип-хоп и выдающийся тернтейблист. Многим он стал известен как продюсер, выпустивший первый полностью семплированный двойной альбом «Endtroducing.....» в 1996 году. После чего был занесен в Книгу рекордов Гиннесса. Также DJ Shadow был участником первого состава британского проекта UNKLE.</p><p>P.S. Данный случай, оказывается, уже норма в этом заведении. Как стало известно из одного зарубежного блога, на позапрошлых выходных в этом же клубе «указали на дверь» известному диджею и продюсеру Дэннису Ферреру.</p>', '2/3/9/583193637d5a7.jpg', '2016-11-20 10:13:23', 0, 1479643847, 14, 1, 3),
(109, 'Dj Shadow приехал в Киев, чтобы снять клип', 'dj-shadow-priehal-v-kiev-chtoby-snyati-klip', 4, 14, 'Dj Shadow приехал в Киев, чтобы снять клип', 'Клип рассказывает о встрече политиков и лидеров стран, которая быстро перерастает в хаос и массовую драку.', 'Клип рассказывает о встрече политиков и лидеров стран, которая быстро перерастает в хаос и массовую драку.', '<p>\r\n	Музыкант DJ Shadow, участник первого состава проекта UNKLE, совместно с группой Run The Jewels представили клип на песню Nobody Speak, который сняла украинская продакшн-студия Radioaktive Film.\r\n</p>\r\n<p>\r\n	Клип рассказывает о встрече политиков и лидеров стран, которая быстро перерастает в хаос и массовую драку.\r\n</p>\r\n<p>\r\n	Видео было снято в Лондоне, Нью-Йорке и Киеве, в частности, в столичном Украинском доме, —  передает "Вести".\r\n</p>\r\n<p>\r\n	Примечательно, что в одной из сцен ролика политик эмоционально ломает в руках карандаш, точно так, как когда-то бывший президент Украины Виктор Янукович сломал ручку.\r\n</p>\r\n<p>\r\n	"Мы хотели сделать позитивное, жизнеутверждающее видео, которое запечатлело бы политиков в их лучшем виде в год выборов", —  прокомментировал новый клип DJ Shadow.\r\n</p>\r\n<p align="center">\r\n	<iframe src="https://www.youtube.com/embed/NUC2EQvdzmY" allowfullscreen="" width="854" height="480" frameborder="0">\r\n	<br>\r\n	</iframe>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>', '3/4/8/583194cd23617.jpg', '2016-11-20 10:19:25', 0, 1479644091, 14, 1, 1),
(110, 'MGK представил публике новый ремикс', 'mgk-predstavil-publike-novyj-remiks', 3, 14, '', '', 'Machine Gun Kelly записал ремикс на трек коллектива Sublime', '<p>Рэпер MGK (Ричард Колсон Бэйкер) продолжает радовать публику новыми композициями. Вот и сейчас артист решил продемонстрировать свое видение на творение группы Sublime — «Doin Time», которое впервые увидело свет в 1997 году. Сам же 26-летний исполнитель в прошлом уже заявлял, что является поклонником музыки подобного стиля, поэтому вышедший ремикс не должен вызывать большого удивления, не смотря на его нестандартность.  </p><p>В данной работе Machine Gun Kelly сотрудничал с другим рэпером Дереком Смитом, более известным как Mod Sun. Приятного просмотра!</p><p><iframe width="500" height="281" src="//www.youtube.com/embed/r1S-JgXAvQU" frameborder="0" allowfullscreen=""></iframe></p><p><br></p>', '9/5/4/583340a19ca6f.jpg', '2016-11-21 17:30:29', 0, 1479756566, 14, 1, 2),
(111, 'Рэп-коллектив Грот выпустил новый клип', 'ryep-kollektiv-grot-vypustil-novyj-klip', 3, 14, '', '', 'На этот раз рэп-коллектив Грот представил клип на композицию “Природа права”', '<p style="text-align: justify;">Команда из Омска опубликовала свою новую работу - клип на песню "Природа права". Основой данного видео стало выступление парней в Москве, которое проходило в поддержку их третьего студийного альбома "Земляне". Напомним, что альбом был опубликован в середине ноября 2015 года. Видео оказалось весьма успешным, так как уже успело собрать более ста тысяч просмотров с подавляющим большинством положительных отзывов и комментариев.</p><p style="text-align: justify;"><iframe src="https://www.youtube.com/embed/M10jSwLLHp4" allowfullscreen="" width="560" height="315" frameborder="0"></iframe><br></p>', '8/2/3/58334157e0890.jpg', '2016-11-28 09:46:04', 0, 1480333559, 14, 1, 1);
INSERT INTO `z_news` (`id`, `name`, `url`, `category`, `user`, `title`, `description`, `small`, `text`, `img`, `created`, `article`, `date_redact`, `redactor_id`, `status`, `img_block_size`) VALUES
(112, 'Новая догадка относительно личности Бенкси', 'novaya-dogadka-otnositelino-lichnosti-benksi', 2, 14, 'Новая догадка относительно личности Бенкси', '', 'Журналист поведал о результатах личного расследования касательно личности загадочного художника', '<p>Журналист Крейг Уилльямс высказал предположение, что под именем известного анонимного уличного художника Бэнкси возможно прячется один из основателей и участник музыкального коллектива Massive Attack Роберт Дель Ная.</p><p><img src="/images/news/585661fb5a845.jpg"></p><p>В своих предположения Уилльямс исходит из найденной им связью между концертами группы и появлением граффити. Журналист обнаружил, что за прошедшее десятилетие по меньшей мере в шести городах новые работы Бэнкси были обнаружены перед или сразу после концерта. К тому же, Роберт Дель Ная стал известным не только благодаря музыкальной деятельности, а и благодаря своим граффити. Помимо этого, автор данного заявления утверждает, что кроме Роберта, под псевдонимом Бэнкси могут работать и другие уличные художники, поскольку одному человеку было бы весьма сложно обеспечить столь высокую продуктивность.</p><p>Стоит заметить, что это отнюдь не первая попытка разоблачить личность Бэнкси, однако до сих пор подлинность всех предположение скрывается за пеленой неизвестности.</p>', '0/0/0/585662dbd14f4.jpg', '2016-12-18 08:20:11', 0, 1482056397, 14, 1, 3),
(113, 'Самый высокий в Европе мурал создан в Киеве', 'samyj-vysokij-v-evrope-mural-sozdan-v-kieve', 2, 14, 'Самый высокий в Европе мурал создан в Киеве', '', 'Творение нанесено на стену 26-этажного здания', '<p>В одном из районов Киева на проспекте Маяковского на стене 26-этажного здания было создано самое высокое граффити в Европе. Как заявил вдохновитель идеи создания серии настенных рисунков в Киеве Гео Лерос, данная работа была выполнена итальянским художником с псевдонимом "2501". Так же, по его словам, автор граффити заложил в рисунок слово "Воля", а источником вдохновения был герб Украины.</p><p>Теперь каждый житель Киева может насладиться видами оригинального настенного творчества.</p><p><img src="/images/news/585663b9aeee8.jpg"></p>', '1/1/7/58334611eb381.jpg', '2016-12-18 08:24:00', 0, 1482056585, 14, 1, 2),
(114, 'Альбому Eminem «Infinite» исполнилось 20 лет', 'alibomu-eminem-infinite-ispolnilosi-20-let', 3, 14, '', '', 'Не пропустите мини документальный фильм в честь 20-летия альбома Eminem «Infinite»', '<p>12 ноября исполнилось ровно 20 лет со дня выхода дебютного, забытого большинством поклонников культового рэпера альбома «Infinite». В честь этого детройтский продюсерский дуэт The Bass Brothers, работавший с Эмом с самого начала его непростой рэп-карьеры, выпустил документалку «Partners In Rhyme: The True Story of Infinite».<br>В фильм вошли архивные и, можно сказать, эксклюзивные кадры Эминема во время записи и продвижения альбома «Infinite». Видео длится всего 9 минут, поэтому не стоит жалеть на него времени, тем более что для тех, кто не очень хорош в английском, предусмотрены субтитры.</p><iframe width="560" height="315" src="https://www.youtube.com/embed/dGIy1Y2CfCo" frameborder="0" allowfullscreen=""></iframe><p style="text-align: center;"><br></p>', NULL, '2016-12-18 11:06:53', 0, 1482066401, 14, 1, 3),
(115, 'Депутат Верховной Рады хочет запретить LOne въезд в Украину', 'deputat-verhovnoj-rady-hochet-zapretiti-l-one-viezd-v-ukrainu', 3, 14, 'Депутат Верховной Рады хочет запретить LOne въезд в Украину', '', 'Похоже, что артисту припомнят его конфликт с Романом Зозулей', '<p><img src="/images/news/58568b03b073e.jpg" style="letter-spacing: 0.1px;">Депутат Верховной Рады Украины Владимир Парасюк обратился с запросом к главе Службы безопасности Украины с просьбой о запрете въезда в Украину российскому артисту Горозии Левану Эмзаровичу, известному нашим читателям как LOne.<br></p><p>Эта просьба, судя по всему, продолжение конфликта Левана с футболистом Романом Зозулей, который дружен с Парасюком. </p><p>Аргументация для запрета проста - выступления в Крыму.</p>', '6/7/7/5833501bdda7a.jpg', '2016-12-18 11:11:38', 0, 1482066625, 14, 1, 2),
(116, 'Подписанная Тупаком тюремная библия продается за $54 000', 'podpisannaya-tupakom-tyuremnaya-bibliya-prodaetsya-za-54-000', 3, 14, 'Подписанная Тупаком тюремная библия продается за $54 000', '', 'Еще один сумасшедший лот для поклонников легендарного рэпера\r\n.', '<p>В 1995 году Тупак отбывал срок по обвинению в изнасиловании в тюрьме Clinton Correctional Facility, где часто читал Библию.</p><p><br>Теперь экземпляр этой книги, содержащий личную подпись и тюремный номер рэпера, выставлен на продажу за $54 000 (это, к слову, чуть меньше 3 500 000 рублей или 1 500 000 гривен). Лот выставлен на аукционе Moments In Time.</p><p>Как пишет портал TMZ, кто-то из родственников Тупака анонимно отправил экземпляр Библии на продажу. Соответсвтенно, они получат внушительный процент со сделки.</p><p>Напомним, что помимо Библии, на продажу в разное время выставлялись такие личные предметы рэпера, как Hummer, написанное от руки любовное письмо, черновики текстов и тюремные письма.</p>', '5/1/1/583351cfadfd1.png', '2016-11-21 17:58:28', 0, 1479758304, 14, 1, 1),
(117, 'Басманный суд не хочет рассматривать иск Децла к Басте', 'basmannyj-sud-ne-hochet-rassmatrivati-isk-decla-k-baste', 3, 14, '', '', 'Продолжение судебной Санта-Барбары', '<p><img src="/images/news/585689b502575.jpg" style="letter-spacing: 0.1px;">Басманный районный суд Москвы отклонил иск рэпера Децла к рэперу Басте на миллион рублей с рекомендацией обратиться в суд по месту жительства ответчика — в Ростов-на-Дону.<br></p><p>Напомним, 4 октября стало известно, что Децл подал на Басту в суд за оскорбление, нанесенное в твиттере. Адвокат Децла утверждал, что деньги от Басты им не нужны – и что они просто хотят привлечь внимание к подобной несправедливости и получить извинения.</p><p>Баста же на следующий день рассказал, что Децл являлся постоянным посетителем клуба Gazgolder (из-за шума в котором якобы и начался сыр-бор), однако несколько раз ему делали замечание за то, что тот находился в состоянии «измененного сознания». После этого, по словам Басты, Децл в клубе не появлялся, но зато пообещал «поливать грязью» обидчиков.<br></p>', '7/1/1/58335311a05cf.jpg', '2016-12-18 11:06:03', 0, 1482066337, 14, 1, 3),
(118, 'В сети появился треклист альбома Jah Khaliba', 'v-seti-poyavilsya-treklist-aliboma-jah-khalib-a', 3, 14, 'В сети появился треклист альбома Jah Khaliba', '', 'А завтра появится и сам альбом', '<p>Сегодня в сети появился треклист альбома Jah Khaliba «Если чё, я Баха», который должен выйти в свет уже завтра. Среди гостей присутствуют LOne и Роман Bestseller.</p><p style="text-align: center;"><img src="/images/news/58335504103e8.jpg"><br></p>Треклист:<p><br></p>\r\n<ol><li>Intro (Новый День) (Музыка Teejay)</li><li>Будь Со Мной (Музыка Teejay х Jah Khalib)</li><li>Если Чё Я Баха (Музыка Jah Khalib)</li><li>ПОРваНо Платье (Музыка Teejay)</li><li>Семь Дней (Музыка Jah Khalib)</li><li>Лейла (при уч. Маквин) (Музыка Jah Khalib)</li><li>Ханговер (Музыка Teejay)</li><li>До Луны (при уч. Roma Bestseller) (Музыка Roma Bestseller)</li><li>Каблук (Музыка Teejay)</li><li>Тату на твоем теле (Музыка Jah Khalib х Teejay)</li><li>Созвездие Ангела (Музыка Jah Khalib)</li><li>Беги за мечтой (Музыка Teejay)</li><li>Джунгли (при уч. LOne) (Музыка Teejay)</li><li>Кружимся в Танце (Музыка Jah Khalib)</li><li>С ТобоYOU ( Музыка Jah Khalib)</li><li>Созвездие ангела (Версия с Клипа) (Музыка Jah Khalib)</li></ol><p>А еще сегодня вышедший 10 дней назад клип Jah Khaliba на песню «Созвездие ангела» достиг отметки в один миллион просмотров. Отличный повод чтобы пересмотреть.</p>', '2/3/1/5833554c13f49.jpg', '2016-12-18 11:09:27', 0, 1482066542, 14, 1, 2),
(119, 'Премьера клипа: Paul Wall – «Why Is That»', 'premiera-klipa-paul-wall-why-is-that', 3, 14, 'Премьера клипа: Paul Wall – «Why Is That»', '', 'Оцените и Вы!', '<p>Когда-то большая фигура Хьюстона недавно выпустила альбом «The Houston Oiler», а теперь представляет клип на один из треков с нового релиза. Он полон визуальных эффектов и гриллзов. В общем, рэпер вернулся со своей эстетикой, но более осовремененной.</p><p style="text-align: center;"><iframe src="//www.youtube.com/embed/QsI5cgsCZ78" allowfullscreen="" height="281" frameborder="0" width="500"></iframe></p><p style="text-align: center;"><br></p>', '2/1/3/5834970364b92.png', '2016-12-18 09:54:03', 0, 1482062004, 14, 1, 3),
(120, 'Boom-Bap "Предпосылки" от фундаментальных австралийцев', 'boom-bap-predposylki-ot-fundamentalinyh-avstralijcev', 3, 14, 'Boom-Bap "Предпосылки" от фундаментальных австралийцев', '', 'Новый релиз от австралийской команды', '<p>Fundamental Elements - это представители Австралии (город Brisbane), в составе двух MC Species и Pleura, а также DJ Johnny Love. Парни являются приверженцами классического boom-bap звучания и выпустили пару ЕР релизов. В данный момент они работают над новым ЕР «The Prerequisite» («Предпосылка»), который совсем скоро увидит свет, одноимённый трек и видео являются вторым синглом с этого релиза. Первый сингл и видео был «The Sickness», который также можно увидеть ниже:</p><p style="text-align: center;"><iframe width="500" height="281" src="//www.youtube.com/embed/TAzdXo81zgs" frameborder="0" allowfullscreen=""></iframe></p><p style="text-align: center;"><br></p><p style="text-align: center;"><iframe width="500" height="281" src="//www.youtube.com/embed/LsbCqdnuHQQ" frameborder="0" allowfullscreen=""></iframe><br></p>', '5/3/4/58349aed82700.jpg', '2016-12-18 11:08:10', 0, 1482066466, 14, 1, 2),
(121, 'Новый релиз от Statik Selektah при участии J.Bada$$, F.Gibbs', 'novyj-reliz-ot-statik-selektah-pri-uchastii-j-bada-f-gibbs', 3, 14, 'Новый релиз от Statik Selektah при участии J.Bada$$, F.Gibbs', '', 'Трое исполнителей представили клип на композицию «Carry On»', '<p>Statik Selektah выпустил в 2014 году отличнейший релиз «What Goes Around», на котором приняло участие огромное количество чтецов: B-Real (Cypress Hill); Black Thought (The Roots); Crooked I (Slaughterhouse); Dilated Peoples Heltah Skeltah; Lil Fame (of M.O.P.); Noreaga (aka N.O.R.E.); Pharoahe Monch; Posdnous (De La Soul); Reks; Royce Da 59″; D-Block; Snoop Dogg; Talib Kweli; Termanology,… а также Joey Bada$, Freddie Gibbs, вот двое последних и приняли участие в треке «Carry On», который и был экранизирован:</p><p style="text-align: center;"><iframe src="//www.youtube.com/embed/NEGp5XRl8v0" allowfullscreen="" height="281" frameborder="0" width="500"></iframe></p><p style="text-align: center;"><br></p>', '3/0/0/58349d1673fce.jpg', '2016-12-18 09:55:49', 0, 1482062126, 14, 1, 1),
(122, 'Сольный альбом от Diamond D под названием «The Diam Piece»', 'solinyj-alibom-ot-diamond-d-pod-nazvaniem-the-diam-piece', 3, 14, 'Сольный альбом от Diamond D под названием «The Diam Piece»', '', 'В создании альбома также приняли участие и другие исполнители', '<p>Diamond D входит в список лучших хип-хоп продюсеров всех времён !!! Dilated Peoples, KRS-One, Sadat X, Pharoahe Monch, Torae, J-Live, Fat Joe, Pharoahe Monch, Sean Price, Edo G, Busta Rhymes, Mos Def, Too Short &amp; Jay-Z, Raekwon &amp; Ghostface Killah, Fugees, The Pharcyde, Outkast, Fu-Schnickens,… кажется этот список можно продолжать бесконечно, ну и естественно треки D.I.T.C., куда также входил Big L.</p><p>На этот раз он презентовал сольный альбом «The Diam Piece» при участии как ветеранов, так и представителей нового поколения, среди которых A.G. (D.I.T.C.); Black Rob; Chino XL; Elzhi; Fat Joe; Freddie Foxxx; Grand Daddy I.U.; Guilty Simpson; Hi-Tek; Kev Brown; Kurupt (Dogg Pound); Masta Ace; Nottz; Pete Rock; Pharoahe; Rapsody; Ras Kass; Scram Jones; Skyzoo; Stacy Epps; Step Brothers (Alchemist + Evidenc); Talib Kweli; Tha Alkaholiks; The Pharcyde,…<br>Diamond D: «Я хотел сделать классический проект, со звучанием моих любимых много лет иновых MC и групп. Я называю это Brand New Retro. Рецепт прост: MPC 3000, The Yamaha Motif ES8, интересные сэмплы и мастера у микрофона».</p><p>Видео в поддержку релиза:</p><p style="text-align: center;"><iframe src="//www.youtube.com/embed/3G1vZTwIRkc" allowfullscreen="" height="281" frameborder="0" width="500"></iframe></p><p><br></p>', '2/5/1/58349e50013ae.jpg', '2016-12-18 11:04:17', 0, 1482066239, 14, 1, 3),
(123, 'M.O.P. выпустили новый клип о Бруклине', 'm-o-p-vypustili-novyj-klip-o-brukline', 3, 14, 'M.O.P. выпустили новый клип о Бруклине', '', 'Клип был записан при участии Maino', '<p>Видео на трек из последнего ЕР-альбома от M.O.P. -Street Certified-, вышедшего в ноябре прошлого года.<br>Старый, добрый качественный хип-хоп от людей, знающих в этом толк. Не даром на этом альбоме M.O.P. поддержали куплетами такие имена как Busta Rhymes, Mobb Deep, Maino. Исполнительный продюсер альбома —  DJ Premier, а за продакшн отвечают ChuckHeat, I Fresh, Beat Butcha, Jazi Moto, DJ Skizz, Fizzy Womack, Phatboy, Free Smith.</p><p style="text-align: center;"><iframe width="500" height="281" src="//www.youtube.com/embed/pMv9_S7fNgc" frameborder="0" allowfullscreen=""></iframe><br></p>', '0/9/7/58349fdc94fe3.jpg', '2016-12-18 08:30:34', 0, 1482056985, 14, 1, 2),
(124, 'D-MAN 55 с новым видео «Корни» ', 'd-man-55-s-novym-video-korni', 3, 14, 'D-MAN 55 с новым видео «Корни» ', '', 'Клип выпущен в поддержку релиза «Подобру-Поздорову»', '<p>D-MAN 55 в конце года выпустил отличнейший релиз «Подобру-Поздорову», в поддержку релиза вышло новое видео «Корни» !! Поделитесь в комментариях своими мыслями относительно этого произведения.</p><p style="text-align: center;"><br></p><p style="text-align: center;"><iframe src="//www.youtube.com/embed/kBroFWqW9jo" allowfullscreen="" height="281" frameborder="0" width="500"></iframe></p>', '9/5/4/5834a0f52dede.jpg', '2016-12-18 08:37:09', 0, 1482057411, 14, 1, 3),
(125, 'Tech N9ne: Бездомность - это не игра', 'tech-n9ne-bezdomnosti-yeto-ne-igra', 3, 14, 'Tech N9ne: Бездомность - это не игра', '', 'Tech N9ne поделился впечатления от работы над клипом, в котором он сыграл бездомного', '<p><img src="/images/news/585667fab63bc.jpg"></p><p>18 февраля Tech N9ne принимал участие в съёмках клипа на одну из песен Krizz Kaliko, в этом видео Tech N9ne играл бездомного. В течение дня съёмочная группа ездила на автобусе по Канзас-Сити, Tech N9ne снимали как автобусе, так и на разных остановках.<br></p><p>«Когда я играл бездомного в грязной поношенной одежде, то многие люде не узнавали меня как Tech N9ne, но те, кто видел меня вблизи ликовали, потому что увидели как я играюбездомного в центре города.» — сказал Tech N9ne</p><p>«Я был на автобусной остановке на пересечении 39 улицы и Бродвея, ждал команды режиссёра. Ко мне подошла пожилая дама в потрёпанной одежде и со старой сумкой в руках. Она присела рядом со мной и стала ждать автобус. На вид ей было далеко за 60, бледное лицо, коричневые волосы. И сидя рядом с ней я понял одну вещь… В отличие от меня она сейчас не играет несложившуюся жизнь, это её реальность!</p><p>В то время как я играл роль несчастного человека, я видел что она не играет… Я увидел боль в её красивых светло-карих глазах, после съёмок видео я собирался в свой особняк. После того как режиссёр снял сцену он вежливо спросил у неё: «Вы в порядке?» Потому что она попала в кадр. Она кивнула и он продолжил работу.» — сказал Tech N9ne.</p><p>«Когда мы закончили съёмки и сели в наш автобус, эта дама осталась на остановке — ждать свой настоящий автобус. Её взгляд запал мне в душу… Меня мучили вопросы: что она подумала обо всём этом? Куда она собиралась? Почему она одна, ведь видно что ей тяжело ходить? К концу дня мы были на нашей последней остановке, прямо перед Crown Center, я сидел на остановке и погрузившись в свои мысли думал о произошедшем.</p><p>Внезапно рядом появилась другая пожилая дама, ей было, вероятно, около 50, она села рядом со мной и бросила мне в чашку 50 центов. Через секунду я не выдержал и сказал: «Нет, я играю бездомного в этом видео. Послушайте, я не являюсь бездомным на самом деле». Я достал из кармана 100 долларов, дал ей и сказал: «Спасибо Вам большое»! Она заплакала и спросила: «Это правда?». Я ответил: «Да, я не играю! Эта часть настоящая! Пожалуйста, возьмите эти деньги.» Это я всё к тому что… В реальной жизни действительно есть такие люди и для них это не игра, но реальная жизнь» — закончил Tech N9ne свой рассказ о съёмках видео.</p>', '5/4/9/5834a711b52fa.jpg', '2016-12-18 08:42:08', 0, 1482057701, 14, 1, 3),
(126, 'Заклятые враги', 'zaklyatye-vragi', 1, 14, 'Заклятые враги', '', 'Основные враги современного танцора', '<p><br>На этапах своего танцевального саморазвития, будь ты поппером или би-боем, ты обязательно встретишься с врагами. Я считаю, что важно выложить об этих врагах всю правду и сплотиться в своеобразном протесте, как это делают зеленые. Если использовать эту аналогию, то мы положим на асфальт вместо наших тел символы неправильных соревнований, искалеченных репутаций и ворованных побед; многие из нас могут вспомнить бэттл, который выиграли, но вместе с тем не выиграли по некой непостижимой причине, или же вспомнить судейское решение, основанное на предубеждении или фаворитизме. Вся эта дрянь оставляет неизбывную горечь во рту - до поры, пока победа не заставляет нас о ней забыть.<br><br><strong>Хейтеры (ненавистники)</strong><br><br>Без хейтеров мир не был бы таким же. Я использую слово «хейтеры» в качестве слэнга, но некоторые из них действительно в своей безграничной зависти, которая пожирает их уверенность в себе, как коррозия, опускаются до ненависти. Эти люди  живут мыслями о том, как тебя превзойти. Они говорят мусор, чтобы поднять тебя на смех и создать всеобщее ощущение превосходства их и их сообщников над тобой. Но когда ты появляешься рядом, они смотрят украдкой, смотрят грязными взглядами, и пока толпа аплодирует твоим мувам, ограничиваются тем, что покачивают головами.</p><p><br>Определенные личности обладают уникальной способностью вмещать в себя неизмеримые количества зависти и злобы, и следует научиться их распознавать. Они могут быть серьезными соперниками, но что-то в твоем танце выводит их из себя. Непомерные эго, которые они выставляют напоказ, скрывают неуверенность в себе и страх неприятия, проистекающие из их личностного развития. Худшая разновидность хейтера – это человек, скрывающий истинные побуждения. Я встречаюсь с множеством людей, которые в моем присутствии кажутся весьма милыми и дружелюбными, но как только я ухожу, первыми начинают втаптывать мое имя в грязь.</p><p><img src="/images/news/5848019dcacc6.png" alt="" style="display: block; margin: auto; height: 333px; width: 298px;"></p><p><br>Как поступать с этими людьми? Никак, зависть – высшая форма лести, и это утверждение работает идеальным противодействием их секретным атакам. Что бы ты ни узнал о человеке, который мешает твое имя с грязью, не позволяй ему в твоем присутствии выражаться, держи его в напряге. Но не уделяй ему чересчур много внимания. Невзирая на ярость, покажи ему, что ты находишься на другом уровне как навыков танца, так и отношения к людям – будь спокоен и любезен, общайся формально и кратко. Прояви зрелость и чистоту действий. Помни, что твой статус в бибоинге растет, а количество людей, которые воспринимают тебя как пример для подражания, пропорционально статусу. Будь хорошим примером.</p><p><br><strong>Байтеры (воры)</strong><br><br>Байтер – это термин, который используется со времен Бит Стрит. Все мы знаем об этом классическом жаргонизме, частом спутнике бэттлов и соревнований. В общем и целом слово «байтер» означает человека, который копирует чужие идеи из-за невозможности выступить с собственными. Но мне кажется, здесь нужны пояснения, так как этого определения недостаточно. Необходимо вникнуть в вопрос, чтобы понять, как избежать столкновений с байтерами и как не заполучить это обидное словечко в свой адрес.</p><p><img src="/images/news/584802c0a5d6a.jpg" alt="" style="display: block; margin: auto; height: 285px; width: 309px;"></p><p>"Ничто не ново под солнцем."Это цитата из китайской философии. Она относится ко всем аспектам жизни. Эта фраза мудрости проливает столько света на тему байтинга просто потому, что истина, заключающаяся в ней, имеет отношение даже к танцору, который из-за нежелания копировать чужие движения тренируется в полнейшем одиночестве. Если принять во внимание количество би-боев по всему миру, в прошлом и настоящем, то можно с легкостью заявлять, что кто-то где-то когда-то уже обязательно сделал движение, которое ты считаешь только своим. Таким образом, ничего полностью оригинального не существует. Чтобы разобраться в теме еще лучше, давай посмотрим, чем руководствуется человек, копирующий движения другого танцора.<br><br><strong><em data-redactor-tag="em">Воровать, Чтобы Стать Лучше</em></strong></p><p><br>Обычно люди копируют движения, чтобы преуспеть в собственных навыках, в своем умении танцевать. Они видят переход, он им нравится, и они тренируют его до тех пор, пока он естественным образом не вливается в репертуар движений. А некоторые даже говорят, что украли движение по ошибке. Когда ты изучаешь танцора довольно долго, его стиль программируется в твою голову. И однажды совсем случайно ты начинаешь его повторять. Это доказывает огромную роль визуализации в обучении. Если в голове у тебя сидит твой любимый танцор, исполняющий твои любимые мувы, ты можешь обнаружить, что копируешь их, сам того не сознавая. Это преступление? Возможно, если автор движения застукает тебя во время его исполнения. Но настоящие авторы движений пускают их в будущее, и движения эти рано или поздно становятся универсальными.<br><br><em>Универсальное Движение</em><br><br>Как только достаточное количество танцоров исполняет движение, оно становится универсальным. Идеальный недавний пример – это когда би-бои впервые обратили взор на эйр-флейры. Движение стало популярным только недавно, а теперь оно – цель почти каждого известного мне танцора. Всех этих людей надо считать байтерами? Я думаю, нет. Почему? Да потому что все делают эйр-флейры или стремятся научиться их делать. Перехват движений у создателей – это в действительности часть процесса развития. Как, по-вашему, у танца рождается формат? Каждое универсальное движение когда-то было чьим-то фирменным движением. Неужели мы - байтеры, если приспосабливаем его под наш стиль?</p><p><br><em><strong data-redactor-tag="strong">Фирменное Движение</strong></em></p><p><br>В сообществе би-боев с ростом навыков танцор начинает создавать фирменные движения. Когда ты танцуешь, тебя как индивидуальность определяют именно по ним. Эти движения принадлежат тебе, потому что формировались на основании твоего личного опыта. Но за двадцать лет брейкинг вырос. Поппингу же вообще более тридцати лет. И активным брейкерам и попперам по всему миру нет числа. Так что не удивляйся, если однажды увидишь, как какой-то танцор из Суринама исполняет твое движение или переход. Это случается.</p><p><br><strong><em data-redactor-tag="em">Решение Проблемы – Оригинальность</em></strong></p><p><br>При том, что ты наследуешь переданное тебе старшими поколениями, существует способ быть оригинальным. Со временем ты научишься совмещать движения в манере, не похожей на увиденное у других. Поставь себе цель: превратить все, что ты выучил, в конгломерат, который позволит тебе чувствовать себя на максимум. Popin Pete однажды исторг из себя частичку мудрости, которая как раз вписывается в эту ситуацию. Она полезна танцорам вообще любого стиля: "Танец должен быть ощущаем. Вот почему я часто тренируюсь не у зеркала. Зеркало делает тебя танцором двух измерений, ты все время следишь за собой и таким образом можешь совершать все движения под прямым углом. Но учись рассредоточивать взгляд и двигаться туда, куда ведет тебя тело."</p><p><br>И главное, танцуй по чутью. Пусть твое тело делает в точности то, что чувствует. Старайся быть оригинальным, но не ограничивай свой стиль из-за сплетен и пересудов. Учись совмещать различные элементы. Забудь о тех, кто тебя критикует, даже если ты под прямым обстрелом. Очень часто люди называют тебя байтером просто потому, что не могут раскритиковать твои способности. <br></p><p><br><strong>Региональный фаворитизм (предвзятость судей)</strong></p><p><br>Этот последний враг – самый злой и могущественный. Лично я являюсь его постоянной жертвой. Судьи на самом деле ничего против меня не имеют. Некоторые даже подходят ко мне после соревнования, чтобы поздравить и сказать, что я отлично продемонстрировал свое мастерство. Но поскольку некоторые судьи взяли на себя обязательство представлять свое место жительства во всем, что они делают, у «аутсайдеров» из других городов совершенно пропала возможность завоевать победу. Со мной такое бывало много раз. Победа, которая была уже у меня в руках, выскакивала прямо из-под носа. Знаю, что многие би-бои попадали и попадают в похожие ситуации. Эти обстоятельства портят все отношение к соревнованиям. Я знаю многих сильнейших танцоров, которые не соревнуются только по этой причине. Если они не дома или если они не знают судей, они не соревнуются.</p><p><img src="/images/news/584804c7d8be3.jpg" alt="" style="display: block; margin: auto;"></p><p style="text-align: right;"><em>Автор неизвестен</em><br></p>', '3/5/7/59046c32a9a52.jpg', '2016-12-07 10:56:19', 1, 1481115346, 14, 1, 2),
(127, 'Инерция', 'inerciya', 1, 14, 'Инерция', 'Может быть, самая распространенная брейкерская проблема', 'Может быть, самая распространенная брейкерская проблема', '<p><br></p><p>Может быть, самая распространенная би-бойская проблема. Ты читаешь десятки статей о том, как делать flare и windmillы, а потом говоришь сам себе: «О! Ха-ха! Я могу это, я врубаюсь, о чем они все пишут». Затем доходишь до той части статьи, в которой написано: «не беспокойтесь о прокачке рук, потому что инерция будет поддерживать вас в воздухе, и это снимет с них основную нагрузку» и запинаешься. «Чего этот парень гонит? Окей, я понимаю, что все это правда, но какая нахрен инерция? Это что, маленькая фея, которая пихает меня в зад, пока я делаю flare? Э-э-э-эх!». Ты уже готов взять монитор и грохнуть его об стену, потому что чувствуешь себя тупее, чем перед тем, как прочитал эту статью. Спокойно! Sparkz с вами. Я попытаюсь коротко объяснить, что такое инерция, как она работает, как можно ее использовать и с каким типом мувов она связана. Сделаю это так просто, как смогу, без технических заморочек – ненавижу, когда би-бои катают километровые статьи о мувах, и статьи эти оказываются дерьмо -дерьмом. Конечно, писать статьи это хорошо, но из-за технических терминов их не могут читать новички. Ну ладно, давайте начнем.</p><p><br><strong>Что такое инерция?</strong><br><br>Это невидимая сила, которая поддерживает движение объекта. Инерция – очень важный элемент брейкинга, но ей часто не придают значения. Выражение «движущийся объект стремится к движению» как раз об инерции – именно она не позволяет остановиться. Давайте возьмем мяч и ударим по нему. На летящий мяч действуют две основные силы: инерция и гравитация. Когда ты бьешь по мячу, его поднимает инерция. Когда инерция слабеет и потом умирает, гравитация опускает мяч на землю. Ударишь мяч еще раз – история повторится. Инерция – это сила, которая в течение короткого времени может контратаковать гравитацию. Здорово, не правда ли?</p><p><br>Существуют два типа инерции. Линейная и круговая. Оба названия говорят сами за себя. Линейная – это удар вперед, назад, в сторону – это сила, которая движет объект в одном направлении. В каком угодно направлении, но обязательно по прямой. Для одних движений это хорошо, для других – плохо. Один из основных мувов, использующих линейную инерцию – flip. Front flip, handspringи, roundoffы, cartwheelы. Ты буквально «вбрасываешь свое тело в инерцию», а она поддерживает его движение, пока не иссякнет. Когда ты делаешь cartwheel, все, что тебе нужно – это начать. Твои ноги будут работать автоматически. Скажи спасибо инерции.</p><p><br>Круговая инерция используется не менее часто. Это вид силы, которая может быстро изменять направление. Круговая инерция заставляет объект двигаться по кругу. Хороший пример – windmill, flare и headspin. Вызвать к жизни этот тип инерции можно, раскручивая ноги или раскручивая вообще что-нибудь, например, тот же мяч.</p><p><br><strong>Handspring:</strong><br><br>Там и сям встречаешь людей, которые говорят, что у тебя проблемы с front handspringами, flareами и тому подобным. Мол, в handspringах у тебя слишком сильная вертикальная инерция, а должна быть только горизонтальная. Сейчас ты уже немного знаешь о двух типах инерционной силы – попытайся понять, как разобраться с проблемой. Тут нужен один лишь здравый смысл. Ты знаешь, что тебе нужна горизонтальная инерция, и знаешь, что горизонталь – это параллель с землей, а вертикаль – прямо вверх и вниз. Не нужна вертикаль, так возьми и избавься от нее. Чтобы получить вертикальную инерцию, надо или ударить мяч, или подпрыгнуть, или как-то заставить тело двигаться вверх. В этом суть твоей проблемы. Сейчас ты почти знаешь, как ее решить. Так что надо сделать? Да не прыгать! Вместо того чтобы заныривать, направь свое тело горизонтально вперед. Так ты добьешься горизонтальной инерции и сократишь вертикальную. Это проще простого. Только надо врубаться в инерцию и то, о чем тебе говорят. Еще одна полезная штука – умение определять, какую инерцию ты используешь. В handspringах действует линейная, потому что ты двигаешься по прямой и не можешь это изменить. Хочешь почувствовать инерцию? Попытайся сделать roundoff – если сможешь, то ощутишь, как что-то толкает тебя назад, когда ты приземляешься. Как тебе кажется, что это? Правильно, твоя старая добрая подружка.</p><p><img src="/images/news/58480e02d5e58.jpg" style="height: 383px; width: 383px; display: block; margin: auto;" alt=""></p><p><br>Общие проблемы:<br><br>Например, возьмем flare. Люди обламываются с ним потому, что подключают оба типа инерции, а так flare не работает. Тут задействована только круговая. Народ падает и падает на задницы из-за того, что нельзя использовать на полную сразу оба типа. Надо выбрать один из них. Первая проблема с flareом – это старт. Flare – движение раскачки. Большинство би-боев начинают, раскачивая левую ногу и делая толчок правой. Упс! Вот и первая ошибка. Би-бой начинает мув, используя круговую инерцию; когда же он выбрасывает вверх правую ногу, то поднимается высоко, но инерция исчезает и все заканчивается. Инерцию надо поддерживать. Помнишь, что нельзя изменить направление линейной инерции? Во flareе она бесполезна. Круговая инерция позволяет тебе сохранять энергию движения и менять направление.<br>Наверное, я сбил вас с толку. Потерпите немного. Чтобы все было нормально, надо просто поменять линейную инерцию на круговую. При раскачке левой ноги, не выбрасывайте правую прямо вверх, попробуйте раскачать и ее: пока сохраняется инерция правой ноги, вы не остановитесь, когда снова будете поднимать левую. Если не поняли, что я тут написал, посмотрите на видео, как кто-нибудь делает flare. Следите за каждой ногой. Вы увидите, что, когда кажется, будто ноги на какой-то момент замирают в воздухе, на самом деле они описывают маленькие окружности - перед тем, как нога пойдет вниз. Это делается для того, чтобы сохранить инерцию при поднятой ноге.</p><p><br><strong>Как мне это использовать?</strong><br><br>Перед тем, как приступить к новому муву, или если у вас есть проблемы, посидите и подумайте об инерции. В большинстве случаев причина проблем кроется в физике. Постарайтесь понять, что вы делаете неправильно. Подумайте о том, что хотите сделать. Если надо двигаться вперед, очевидно, не стоит делать так, чтобы инерция отталкивала вас назад. Тут все основано на здравом рассуждении. Надеюсь, моя статья вам немного помогла. Желаю всем удачи и надеюсь, что инерцию вы теперь понимаете лучше.</p><p style="text-align: right;">B-boy Sparkz</p>', '3/2/7/59046b8225be2.jpg', '2016-12-07 11:27:26', 1, 1481117237, 14, 1, 2),
(128, 'Если тебя критикуют', 'esli-tebya-kritikuyut', 1, 14, 'Если тебя критикуют', 'Сейчас за мувы критикуют каждого би-боя и би-гел, это неизбежно.', 'Сейчас за мувы критикуют каждого би-боя и би-гел, это неизбежно.', '<p>Сейчас за мувы критикуют каждого би-боя и би-гел, это неизбежно. Некоторые на критику не обращают никакого внимания, и прекрасно, но у многих из нас это вызывает неприятные чувства, потому что мы так много работаем, а в ответ – «что это за непонятные движения..." Обычно такие вещи говорят те, кого я называю «нетанцорами». Они би-боями не являются и не могут оценить ту тяжелую работу и ту самоотдачу, с которой мы совершенствуем наши навыки. Не все нетанцоры относятся к нам неуважительно – на самом деле в большинстве случаев они говорят: «о, ты в этом хорош» или что-то типа того, но я говорю о тех, кого можно пробить только пауэрмувами и которые думают: если ты танцуешь стайл, ты – ничто. Если не умеешь делать виндмилл или хэдспин, ты – ничто". Это реально грустно, потому что такое поведение лишает силы духа многих увлеченных танцоров, да так, что они вообще с танцем завязывают.</p><p>Пауэрмувы очень сильно популяризованы СМИ, и вряд ли в музыкальном видео можно будет увидеть би-боя с офигенным футворк-стайлом, как это бывает на настоящих би-бойских видеолентах. Особенно на пауэрмувах помешаны в Корее, в Европе, кажется, больше ценят стайлы. Сужу по Германии, где я выступал. Меня просто поразило, что зрители неистово аплодировали футворку. </p><p><img src="/images/news/5848127c395a3.jpg" style="display: block; margin: auto;" alt=""></p><p>\r\n	 Думаю, всем нам следует просто взять и начать игнорировать людей, которые направо и налево критикуют, но сами не обладают навыками, способными защитить их мнение. Мне нравятся пауэрмувы, они клевые и я хочу научиться их делать, и учусь время от времени. Но однажды я танцевал быстрый футворк, делал это под музыку, оставался в ритме и все такое, но аплодисментов почти не было, потому что никто не увидел, чтобы я сделал виндмилл или хэдспин. А за мной пошел другой парнишка, он сделал бэкфлип, один L-kick и ушел, а в ответ ему – овации одобрения. Такие ситуации реально причиняют боль, потому что народ не понимает, что флипы – не все, на чем держится танец. В тот вечер я увидел от того парнишки еще минимум десять бэкфлипов, и аж напился от обиды. Со всеми бывает.</p><p> Но постепенно я стал привыкать к таким вещам, и негативные комментарии: «А где же виндмиллы? Да ты не брейкер!» волновали меня все меньше и меньше. Если кто-то задает тебе такие вопросы и говорит, что ты ни черта не умеешь, попроси его сделать что-нибудь в кругу. Если хочешь делать какой-то конкретный мув, делай, делай все, что нравится, правил не существует, границ у круга нет. У тебя над собой полный контроль. Собери все негативные отклики и сделай из них топливо для своего творческого движка. Вот и все. Давай, не теряйся.\r\n</p><p>Автор неизвестен<br></p>', '3/0/0/59046aa400aef.jpg', '2016-12-07 11:47:18', 1, 1481118419, 14, 1, 2),
(129, 'Би-боинг как форма искусства', 'bi-boing-kak-forma-iskusstva', 1, 14, 'Би-боинг как форма искусства', 'Би-боинг как форма искусства', 'Би-боинг как форма искусства', '<p>"Би-боинг – это форма искусства, и неважно, как долго мы будем это отрицать" - Kujo<br>                                                                                                                                      <br>Ключ к искусству - это самовыражение. То, о чем каждый действительно должен спорить – это насколько самого себя надо выразить, и насколько – кого-то еще, и как найти баланс между двумя этими вещами. Этот «кто-то еще» может быть любым старым первопроходцем из Бронкса семидесятых. В самом ли деле мы хотим выглядеть как кто-то еще? По-моему, те пионеры выражали только себя и никого больше. Им всем случалось делать похожие движения, потому что эти движения тогда считались «клевыми». Их делал каждый. Если не хочешь, чтобы над тобой ржали  - делай то же, что и все, и делай хорошо. Но перед тем, как начать клево выглядеть, те самые первые би-бои, которые смешивали Goodfoot с кунг-фу и hoofin а-ля Nicholas Brothers, занимались самовыражением. Делали прикольные вещи и пропускали их через определенный творческий канал. И, если это хорошо выглядело, тогда, черт возьми, ты мог презентовать это в клубе девчонкам.</p><p><br>Одна интересная вещь, которую я замечаю в би-боинге (и в хип-хопе, отдельно от его предшественников) - это то, что люди под действием каких-либо влияний любят расширять основы, с которых они начинали, какими бы эти основы ни были. Би-бои любят брать отдельное влияние и «фанковать» его, немножко искажать и вбрасывать в свой footwork или куда-то еще. Если вдобавок к брейкингу ты изучаешь боевые искусства, рано или поздно ты обязательно используешь несколько ударов ногой или флипов в footworke, toprocke или powere, но тебе придется их отфильтровать. Не получится сделать их так, как тебя научил сенсей, они будут «зафанкованы», искажены твоим больным рассудком и превращены в законный би-бойский мув. Это все происходит с давних пор и только усиливается непрерывным раскрытием других средств самовыражения, других форм искусства. Влияет и капоэйра, и кунг-фу, а также джаз, современный танец, гимнастика: вы даете названия, мы их фанкуем.</p><p><img src="/images/news/584816fc0cbe4.jpg" style="display: block; margin: auto;" alt=""></p><p><br>Вернемся к самовыражению. По существу, ключевой момент би-боинга заключается в том, что в первой половине семидесятых делали Nigga Twins. Зафанкованная смесь увиденного у James Brown, Bruce Lee и Nicholas Brothers. Их цели, сформированные предпочтениями и современными им музыкальными формами. Они делали toprock-drop-footwork-freeze в песне Apache, потому что это было здорово. В сущности, все это была реакция на воздействие среды, превращенная их личностями и интересами в форму самовыражения, за которую они довольно быстро ухватились, ведь оно классно выглядело, классно воспринималось и нравилась. Они и знать не знали, что их дело однажды перевернет мир. Они просто получали удовольствие. Но вот что произошло... слушай внимательно! годы спустя тысячи тысяч молодых людей по всему миру увлеклись тем, что было начато ими (обезьяна видит и делает, потому что обезьяна хочет обезьяну). Это выглядит здорово, это вообще здорово, и это весело.</p><p><br>Но так много людей забывают, что существует фанк. Так же, как большинство би-боев не включают движения боевых искусств в танец без того, чтобы их немного не пообтесать, многие забывают, что не нужно танцевать В ТОЧНОСТИ как Nigga Twins (но, конечно, если очень хочется, то можно). И вот какой получается образец, ординар: смотри на подлинный стиль би-боинга и модифицируй его при помощи самого себя и своих предпочтений, основываясь на том, что тебе нужно, а конечный результат будет твоим собственным творением.</p><p style="text-align: right;"><em>B-boy Kujo</em><br></p>', '9/2/9/590469166007c.jpg', '2016-12-07 12:04:57', 1, 1481118915, 14, 1, 2),
(130, 'Их надо помнить', 'ih-nado-pomniti', 3, 14, 'Их надо помнить', 'Немного про историю музыки', 'Немного про историю музыки', '<p>\r\n	Как известно, Хип-Хоп родился в преступной среде Южного Бронкса. Уличная жизнь в бедных районах мегаполиса была сложной и непредсказуемой. Но даже в нелегких условиях талантливым людям хочется творить. Так, смешивая старые треки и подбирая под них незатейливые рифмы, обитатели черных кварталов основали одну из самых популярных культур нашего времени.\r\n</p><p>\r\n	Существует огромное число версий о том, кто сделал самый большой вклад в ее создание и развитие. На самом деле, имён очень много. Трудно оценить значимость каждого из них по отдельности, но ясно одно - без этих людей не было бы Хопа. Знать и помнить их имена - это приятный долг для каждого кто в теме.\r\n</p><p>\r\n	<br>\r\n	В список самых известных пионеров входят Pete DJ Jones, Kool DJ Herc, DJ Hollywood, Eddie Cheeba, "Love Bug" Starski, Grand Master Flash, Afrika Bambaataa, Kurtis Blow, the Sugarhill Gang, Run DMC и многие другие.\r\n</p><p>\r\n	<br>\r\n	70-е были ярким и очень смелым началом, и неудивительно, что в наших наушниках до сих пор играют очень родные биты олдскула. В то время на улицах Южного Брокнса звучали фанковые треки в исполнении James Brown, George Clinton, Marvin Gaye, Sly Stone и др. Они и послужили почвой для создания нового стиля. Интересно, что вскоре после зарождения, Хип-Хоп культура разделилась на 2 группы – любителей диско и бибоев. У каждой из них были свои любимчики и отличительный стиль. Пока первые танцевали под ритмы Pete Dj Jones и DJ Hollywood, второе течение обожало игру DJ Kool Herk. Очень разные, эти именитые диджеи заслуживают уважения за одну только преданность своей идее и любимому Хопу. Поэтому, кратко о них…\r\n</p><p>\r\n	<br>\r\n	DJ Kool Herk (диджей Кул Герк) часто называют крестным отцом Хип-Хопа. Родом с Ямайки, этот парень в 1967 году переезжает в Бронкс и становится любимчиком у местной публики. Его любили за оригинальный гетто-стиль, который не оставлял равнодушным ни одного уличного танцора. Именно он помог сформироваться понятию бибой- брейк бой, бит бой, Бронкс бой…\r\n</p><p>\r\n	<br>\r\n	Герк был известен тем, что умел собирать крутые тусы с разных районов и заряжать людей сумасшедшей атмосферой и прокачем. Треки, которые он играл, были лучшими в свое время. Это Baby Huey- "Listen To Me", Michael Viners Incredible Bongo Band- "Apache" и др. К примеру, "Give It Up Or Turnit A Loose (In The Jungle Groove Remix)" от James Brown, стал своеобразным гимном Хип-Хопа. Каждый бибой, эмси и райтер знал этот трек. Когда Брауна включали на дискотеке, все знали, что пришло время выступать самым крытым танцорам…\r\n</p><p>\r\n	<br>\r\n	Огромным новаторством диджея стала его система Геркулоиды, вместе с которой ему не было равных ни в одном баттле.\r\n</p><p>\r\n	<img src="/images/news/59090183499b8.gif" alt="" style="display: block; margin: auto;">\r\n</p><p style="text-align: center;">\r\n	DJ Kool Herk за работой\r\n</p><p>\r\n	<br>\r\n	Pete DJ Jones и DJ Hollywood были диджеями номер один для темнокожих любителей диско в Нью-Йорке. Это были люди другого сорта - далекие от грязи улиц и гетто, но не менее гениальные. К примеру, Hollywood стал первым диско-рэпером. В отличие от предыдущих диджеев и емси, которые анонсировали и завлекали толпу, он начал подбирать простые рифмы под бит и приобщать к процесу зрителей.\r\n</p><p>\r\n	<br>\r\n	Отдельных слов заслуживает живая легенда Хип-Хопа Afrika Bambaataa (Африка Бамабата). Бывший лидер уличной группировки, Бам организовал команду Zulu Nation, ценностями которой стали Мир, Любовь и Единство. Среди самых известных треков стоит отметить "Planet Rock", "Cosmic Force", "Zulu Nation Throwdown" и др.</p><p><img src="/images/news/5909025d35273.jpg" alt="" style="display: block; margin: auto;"></p><p style="text-align: center;">Afrika Bambaataa</p><p>\r\n	\r\n	Мы благодарны Бамбате также за рождение современного бибоя и создание електро-фанкового направления в Хип-Хопе.</p><p><br>\r\n	Не стоит забывать об еще одном гениальном диджее начала 70-х- Grandmaster Flash (настоящее имя Joseph Saddler). Именно он усовершенствовал и дополнил технику Кула Геркa и украсил диджеинг элементами шоу и стиля. Еще одним достижением парня стало то, что он выделил ударные и внедрил их в микс. Изучая техники диджея Кула Герка, Grandmaster Flowers, Maboya, Plummer, и Pete DJ Jones, он продвигал «антидиско» стиль и изобретал различные трюки с переворачиванием пластинок.<br>\r\n	В 1976 году Flash знакомится с рэппером Keith Wiggins, известным нам как Cowboy. Позже к ним присоединяются Melle Mel (Melvin Glover), Kidd Creole (Nathaniel Glover), Mr. Ness- aka Scorpio (Eddie Morris) и Rahiem (Guy Williams). Так возник легендарный союз Grand Master Flash &amp; The Furious 5 - самая успешная рэп группа начала 80-х.\r\n</p><p><img src="/images/news/590902da6f783.jpg" alt="" style="display: block; margin: auto;"></p><p>\r\n	<br>\r\n	Известным учеником Flash в будущем будет Grand Wizard Theodore, один из самых ярких диджеев своего времени, которому приписывают изобретение скретча.\r\n</p><p>\r\n	<br>\r\n	Существует еще очень много имен тех, кто создавал олдскульную эпоху. Стоит выразить отдельную благодарность Paul Winley, Bobby Robinson, Sylvia Robinson, Joe Robinson, Joey Robinson Jr., Russell Simmons и другим, которые своим творчеством сумели вдохновить будущие поколения Хопа.\r\n</p><p style="text-align: right;">\r\n	<br>\r\n	<br>\r\n	<em>Автор статьи: Кира Ярист</em>\r\n</p>', '7/5/9/590903c940ea1.jpg', '2017-05-02 22:10:17', 1, 0, 0, 1, 2);
INSERT INTO `z_news` (`id`, `name`, `url`, `category`, `user`, `title`, `description`, `small`, `text`, `img`, `created`, `article`, `date_redact`, `redactor_id`, `status`, `img_block_size`) VALUES
(131, 'Интервью с Африкой Бамбаатой (1996 год)', 'interviyu-s-afrikoj-bambaatoj-1996-god', 3, 14, 'Интервью с Африкой Бамбаатой (1996 год)', 'Несколько недель назад мне выпала честь пообщаться с живой легендой Африкой Бамбаатой, чья любовь к хип-хопу cильно повлияла на поп-культуру.', 'Несколько недель назад мне выпала честь пообщаться с живой легендой Африкой Бамбаатой, чья любовь к хип-хопу cильно повлияла на поп-культуру.', '<p>В течении годов мне приходилось брать интервью у Африки Бамбааты в связи с несколькими событиями. Это всегда было познавательно и интересно. В конце-то концов, именно он - ключевая персона, на чьей совести висит промышленность, приносящая 9 миллионов в год. И очень грустно, что как раз-то он ни копейки не получает из этого. А вспомним семидесятые... Бам был человеком. Его боялись, уважали, потому что он был Master of Records. Он создавал биты дня, он был инновационным фрэшем, он первым создал форум для бибоев. Также, проповедуя за черных, стал первым человеком, который положил речь Малькольма Икса на хип-хоп биты. Именно Бамбаата принёс в мир хип-хоп культуру.</p><p style="text-align: center;"><img src="/images/news/590907173a92d.jpg"></p><p><em>Малькольм Икс — американский борец за права темнокожих, идеолог движения Нация Ислама</em></p><p>Сейчас Бам крутится на радио Hot 97 (<a href="http://www.hot97.com">www.hot97.com</a>) в Нью-Йорке и собирается выпустить новый проект. Предположительно это будет римейк его классической рок радиостанции Planet Rock (<a href="http://www.planetrock.com">www.planetrock.com</a>).</p><p>Хотелось бы обратить ваше внимание на интервью, взятое в декабре 91-го года, в котором Бамбаата дает определение понятия хип-хоп.</p><p><img src="/images/news/59090ac8a8ca0.jpg" alt="" style="display: block; margin: auto;"></p><p><br>Мне выпала честь пообщаться с живой легендой Африкой Бамбаатой, чья любовь к хип-хопу cильно повлияла на поп-культуру. В течении нашей глубокой двухчасовой беседы Бам основательно просветил меня в вопросе рэп-музыки. Он дал детальную информацию о формировании его организации Зулу Нейшн. Он рассказал, как вначале они были членами банды, а потом изменились и направили свою энергию на брейк-данс. Он рассказал, как появление хип-хоп культуры помогло сократить насилие со стороны банд Нью-Йорка, так как молодым людям был предложен новый, альтернативный, подвижный вид деятельности. Они стали решать проблемы с помощью танца, а не кулаков.</p><p><br><br>Бам также говорил про политику свойственную хип-хопу. Он рассказал, как Нация Ислама повлияла на него и на других во времена «олд скула» (1975-1980). </p><p><em>Nation of Islam — исламская афроамериканская религиозная организация в США. В организации доминирует националистический и расистский компонент, основаный на противоставлении белым и американскому государству. Вероучение Нации Ислама сильно отличается от традиционного ислама.</em></p><p>Он также говорил про свою социальную активность. Бам был одним из лидеров в движении «За освобождение Джеймса Брауна». Он был первым хип-хоппером, который создал песню с Джеймсом Брауном «Peace, Love &amp; Unity», и таким образом известил про Отца Соула - Джеймса Брауна. Также Бам был серьёзно вовлечен в борьбу против расовой изоляции. В эти годы он написал много песен и сделал много концертов, чтобы помочь собрать деньги и оказать свою поддержку тем, кто потерпел от этой проблемы.</p><p><br>На сегодняшний день Бам путешествует по всему миру, распространяя позитивный взгляд на хип-хоп и пытаясь научить молодых людей правильно смотреть и интерпретировать данную музыку и культуру. Вот некоторые основные моменты из нашего недавнего разговора.</p><p><br><strong><em data-redactor-tag="em">Чем Бамбаата занимался последнее время?</em></strong></p><p><br>Мы вот только выпустили альбом «The Decade of Darkness 1990-2000». Мы выпустили трек из альбома под названием «Get up and Dance»-это хип-хаус-очень энергичная запись...Многие годы я путешествовал по миру. В прошлом году сделал запись «Hip Hop Artists Against Apartheid» («Хип-хоп артисты против расовой изоляции), чтобы помочь АНК (Африканский Национальный Конгресс) собрать деньги. Мы провели большой концерт в Англии и я пригласил Вилли Манделла и других членов АНК на сцену перед многочисленными хип-хоп зрителями в Лондоне. Я также сделал запись «Return To Planet Rock», чтобы собрать деньги для общества Ансар (*исламская секта). Я путешествовал и открывал новый фундамент для хип-хопа и фанка в других странах.</p><p><br><strong><em data-redactor-tag="em">С выпуском джема в стиле хип-хауса «Get Up and Dance», многие поспорили бы, что то, что вы сделали, на самом деле не хип-хоп. Как Отец этого жанра музыки, что Вы понимаете под словом хип-хоп?</em></strong></p><p><br><br>Ну, хип-хоп в принципе - вся культура в целом. Есть рэп, который является элементом хип-хоп культуры. Это может быть и брейкданс, фристайл или любой другой тип танца, которые есть в черном, латиноамериканском и белом обществе. Это также диджеи, и рэперы, и дрескод. Хип-хоп как раз подразумевает всю культуру. И если вы говорите про рэп музыку, то в рэпе музыка сама по себе бесцветная. Вы можете брать музыку из любой области, например соул, фанк, тяжелый метал, джаз, каллипсо и регги, пока это фанк и имеет тяжелые биты. Вы можете взять всё что угодно, чтобы сделать хип-хоп. В хип-хопе может быть и прошлое, и современное, и даже будущее. От рэпера зависит, что он положит поверх всего этого: будет ли это в черном, белом стиле или универсальном. Сама музыка исходит от всех видов звуков. Когда люди начинают искать какой-то бит, то черпают со всех областей музыки. Говорят, что хип-хоп произошел только от соула и рока. Он произошел от всех видов музыки, но основной фундамент взят из элементов регги. Вот как появился рэп.</p><p><br><strong><em data-redactor-tag="em">Ты много ездил по миру как представитель хип-хопа. Как воспринимают хип-хоп в других местах?</em></strong></p><p><br>Хип-хоп есть везде...во Франции, Англии, Германии, в южной и западной части Африки. Хип-хоп также существует и в северной Африке. Недавно был в Марокко, где слышал хип-хоп. Складывается впечатление, что по всему миру есть какой-то заговор его уничтожить. Поэтому они пытаются протолкнуть хаус музыку во многие клубы и создать ощущение, что хип-хоп не продаётся для массового прослушивания. Эта музыка направлена на аудиторию с сильным внутренним стержнем и она говорит что-то. Главное, что это пугает всех. Многие рэперы - самые голосистые люди, которые скажут всё, что у них на уме, скажут со всех уголков и культур то, что они хотят сказать. Люди с других стран это слышат, и хотя они могут и не знать английского, находят время его выучить. Вы бы были шокированы, если бы знали сколько людей научилось говорить на английском только слушая рэп-записи. Они начинают повторять слова, а потом чувствовать, про что вы говорите. Они начинают понимать, кто как живет в какой стране, проблемы, через которые они проходят. Это музыка для маленьких, взрослых и молодёжи. Она касается тем правительства, общества, белых и черных. Хип-хоп может подымать разные вопросы: про мир, либо про единство или на тему «люблю тебя детка, хочу тебя сегодня ночью». Это факт, что послание в рэпе говорит всё, как оно есть, и именно это привлекает молодёжь во всём мире больше всего.</p><p><br><strong><em data-redactor-tag="em">Во времена моей молодости в Бронксе я впервые заметил появление хип-хоп культуры в 1975 году. Какая же атмосфера тогда там царила, что так вдохновила людей двигаться в этом направлении?</em></strong></p><p><br>Мотивирующая. Это было что-то новое, а люди устали от диско тогда. Хип-хоп занимал сильные позиции на то время, потому что музыкальная индустрия постоянно совала нам в глотки одно только диско. Первые год или два всем нравилось, а потом устали от этого. В Нью-Йорке фанк также сдавал позиции. Вначале 70-х существовали тяжелые звуки фанка. По нью-йоркских радио-станциях не крутили больше ни Слая, ни Джеймса. Уже не было слышно этих тяжелых битов в записях на радиостанциях. Не было слышно соула Джеймса Брауна. Всё что можно было услышать, это диско и опять-таки диско. Хип-хоп стал ответным ударом на диско.</p><p><br>Также в то время вместе с рок-музыкой и тяжелым металлом пришел панк-рок и новая волна, которая стала ответной реакцией на то, что должно было бы стать поп-музыкой. Они играли значительную роль вместе с новыми стилями. Вот так много белых появились в хип-хопе. Все думают, что Vanilla Ice и Beastie Boys это что-то новое. А как раз панки и почитатели новой волны стали первыми белыми людьми, которые приняли эту музыку, Они тащили меня в панковые клубы, чтобы миксовать. Часто можно было увидеть панков на джемах в центре среди черных и латиноамериканцев.</p>', '9/7/3/59090b284628c.jpg', '2017-05-02 22:41:44', 1, 0, 0, 1, 3),
(132, 'Хип-Хоп в Германии', 'hip-hop-v-germanii', 3, 14, 'Хип-Хоп в Германии', '', 'В Германии движение Хип-Хоп начиналось аналогично Штатам. И хотя в Германии ощущалось мощное влияние заокеанских записей и фильмов наподобие Wild Style, благодаря иной атмосфере Хип-Хоп поплыл своей дорогой.', '<p>Когда я впервые попал в Штаты в 1986 году, то, если честно, вёл себя как настоящее европейское дитя. Пока был там, я посетил музыкальный магазин и накупил себе немного рекламных записей Sugarhill вместе с Грендмастер Флешем. Я перед этим кое-что почитывал про хип-хоп, но до этого про Меле-Мела никогда не слыхал. Потом посетил концерт Whodini и угадайте, кто был особым гостем в тот вечер — сам Run DMC!</p><p><img src="/images/news/5909122409952.jpg" alt="" style="display: block; margin: auto;"></p><p>В Германии движение Хип-Хоп начиналось аналогично Штатам. И хотя в Германии ощущалось мощное влияние заокеанских записей и фильмов наподобие Wild Style, благодаря иной атмосфере Хип-Хоп поплыл своей дорогой. Граффити и брейкданс вырвались вперёд, но это длилось только одно лето. Хип-хоп царил в андеграунде, народ продолжал разрисовывать поезда и устраивать рэп-баттлы в специальных клубах. </p><p><br>100% хип-хоп в отдельных клубах - крайняя редкость. В Гамбурге можно отыскать клубы в районе Ред Лайт около Реепербан — очень прославленная улица не только благодаря проституткам, но и благодаря изобилию баров, музыкальных клубов и дискотек. Из-за высокого уровня криминала это далеко не самый благополучный район. Но тут есть и свой плюс, отличающий её от остальной Европы: неограниченное время работы общественных заведений. Известные клубы - это Mojo (больше направленый на джаз), Molotow (хардкор) и Powerhouse, который делится на две части — одна для музыки джангл и вторая для хип-хопа. Американские рэперы во время турне обожают потусить в Powerhouse после своих шоу. Прошлым летом, например, я там встретил Ice T с его Body Count Crew, или тех же House of Pain. По всему городу проходит множество джемов, на которых немецкие диджеи играют в основном местную музыку, сопровождаемую живым выступлением. Брейкинг не очень распостранён в клубах за исключением разве что Powerhouse, и, если честно, я не знаю ни одного бибоя, так как большинство из них проходимцы из окрестностей города.</p><p> Живые выступления всегда зависят от времени года — начиная с весны заканчивая осенью. Прошлым летом у нас проходил концерт под открытым небом с такими звёздами как Ice Cube и Gang Starr. К сожалению, концерт тура Amerikkkas Most Wanted с Ice T, Ice Cube и Public Enemy отменили. Надо сказать, по организационным причинам, то же самое произошло и с концертом Warren G. Посмотрим, что будет в этом году.</p><p><br>Как и в ситуации с клубами, у нас нет чисто хип-хоп радиостанций, но определённые часы для игры рэп-музыки хип-хоп диджеям предоставляют почти каждый день. Хорошо то, что нет цензуры. Например, в любой день можно услышать по радио песню «Short Dick Man» в исполнении 20 Fingers.</p><p><br>Как и в Штатах, рынок американской рэп-музыки обширный, и в музыкальных лавках в больших супермаркетах можно всё найти, даже местные релизы немецких независимых студий. Но в таких магазинах как Zardoz в городе Альтона новейшие релизы обычно появляются первее. Именно там я нашел компакт-диск «Bomb Hip-Hop Compilation». Соотношение импорта к местной продукции на данный момент составляет 70% импорта к 30% местного выпуска, но количество национального продукта постоянно увеличивается. Рынок практически заполнен одними CD-дисками, а кассеты используются только как запасной вариант. Я думаю, они еще придерживают немного винилок для скрэтчинга и сэмплирования диджеев.</p><p> Вообще не очень-то легко описать всю атмосферу в деталях, так как даже в таком маленьком городишке как Гамбург существует множество разных стилей из-за этнического и музыкального колорита. В Германии полным-полно иммигрантов из Турции, бывшей Югославии и, конечно же, Африки. Соответственно, каждый выбирает для рэпа любой язык, который ему по душе. Из-за развившегося хардкор общества, влияние рока на хип-хоп в Германии значительно ощутимей, чем в Штатах.</p><p><br><br>Художники граффити вроде Hesh и Daim достаточно зарабатывают, чтобы жить только за счёт исскуства, а другие группы как Fantastische Vier (*с немецкого «Фантастическая Четвёрка») стали мегазвёздами. Если вы повстречаете Miro ( по кликухе граффитчик Mesh или рэппер Masquerade), у вас может сложиться впечатление, что вы только что повстречали большого слюнтяя (хотя в этом скорее всего виновата югославская атмосфера), но как только он начинает работать творчески над музыкой или граффити, то точно превращаеться в настоящего мастера своего дела округа Альтона.</p><p><br></p><p style="text-align: right;">автор статьи: Борис Гаймберег</p>', '1/6/1/5909126900230.jpg', '2017-05-02 23:12:40', 1, 0, 0, 1, 3),
(133, 'Слово Шторма: Моя История', 'slovo-shtorma-moya-istoriya', 1, 14, 'Слово Шторма: Моя История', 'Сколько себя помню, я всегда интересовался танцами. И лишь в 1983 году, впервые увидев Электрик Бугалу и Бибоинг, начал заниматься всерьёз.', 'Сколько себя помню, я всегда интересовался танцами. И лишь в 1983 году, впервые увидев Электрик Бугалу и Бибоинг, начал заниматься всерьёз.', '<p>\r\n	Сколько себя помню, я всегда интересовался танцами. И лишь в 1983 году, впервые увидев Электрик Бугалу и Бибоинг, начал заниматься всерьёз. Не имея никакого понятия про разные стили и вокабуляры, мы пытались подражать роботам и кое-каким персонажам из анимационных фильмов или крутиться на спине и голове. Потом по телеку увидел анонс фильма «Flashdance» («Танец-вспышка» 1983 года), видео вроде «Buffalo Gals». С того момента меня так затянуло, что моя жизнь полностью поменялась.\r\n</p>\r\n<p>\r\n	<img src="/images/news/5909ff0e8323f.jpg" alt="" style="display: block; margin: auto;">\r\n</p>\r\n<p>\r\n	К 1984 году про нашу группу раструбило СМИ. Поэтому одно агенство подписало с нами контракт, после чего мы ездили в тур по всей северной Германии вместе с крупнейшим попжурналом «Браво».\r\n</p>\r\n<p>\r\n	<br>\r\n	Вскоре «мода на брейкданс» утихла. И только пару настойчивых энтузиастов, которые хотели развивать бибоинг и дальше, не останавливались и начали поиски оставшихся танцоров.\r\n</p>\r\n<p>\r\n	<br>\r\n	Начиная с 1985 года с Соединённых Штатов не поступало никакой информации, поэтому вместе с танцорами из Франции, Италии, Англии и Скандинавии мы начали формировать своё виденье и свой стиль. К счастью, мой младший брат «Speedy» тайно тренировался с 1985 года и позже стал моим партнёром по тренировкам. Однажды я побил мировой рекорд по количеству оборотов гелика, что вошло в Книгу Рекордов Гиннеса. Тогда же я впервые познакомился со «Swiftrock». Позже он начал ставить шоу с участием моего партнёра по поппингу Nick и меня под кличкой Unique Rockers. Потом настал час, когда я сосредоточился полностью на бибоинге.\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	 С 1987 года группа бибоев - я в том числе - покупали ежемесячные железнодорожные проездные, которые назывались «Trampertickets» («Трампертикетс») и ездили по всей стране, чтоб наладить больше контактов с другими хипхоперами. С такими проездными можно было сесть на любой поезд в любое время в границах Германии. Мы жили в поездах. По всей стране начались появляться хип-хоп джемы, так как организаторы имели возможность приглашать мастеров со всей округи и городов.\r\n	<br>\r\n	Конечно же мы не остановились на одной Германии, а потихоньку исследовали всё дальше. В 1991 году в Европе существовало сильное «общество бибоев».\r\n</p>\r\n<p>\r\n	<br>\r\n	Наша крю «Battle Squad» была многонациональной группой. Мы вместе с Emilio и Maurizio (несомненно самые известные на то время бибои Италии) и моим партнёром Swiftrock выиграли в Ганновере, Германия, Battle Of The Year — на сегодня крупнейшее соревнование среди бибоев.\r\n</p>\r\n<p style="text-align:center">\r\n	<iframe width="854" height="480" src="https://www.youtube.com/embed/NKoBXzPuhEM?ecver=1" frameborder="0" allowfullscreen></iframe>\r\n</p>\r\n<p>\r\n	<br>\r\n	Среди других известных на то время команд и имён можно назвать «Second to none» и «Awayz rocin tuf» из Британии в бибоинге и «Danny Francis» и «Bebop» в поппинге. Лучшими локерами Европы без каких-либо сомнений были «Anthony», «Mark and Pat» и «Warren» из Лондона, которые учили «Out of control» из Дании. Оттуда они распространили свой стиль по всей Европе. «Damon Frost», больше известный как «Rubberbandman» переехал из Калифорнии в Стокгольм и оказал наибольшее влияние на европейские поппинг и вейвинг!\r\n</p>\r\n<p>\r\n	<br>\r\n	Самыми известными бибойкрю в Скандинавии были «Throwdown Breakers» из Швеции. В Швейцарии была комманда «Jazzy Rockers». В Бельгии - «Dynamic Rockers». Самой популярной командой во Франции была «Aktuel Force».\r\n</p>\r\n<p>\r\n	<br>\r\n	Эти команды поддерживали бибоинг, в то время как для остальных он просто вышел из моды. После открытия железного занавеса в восточной Европе была только одна команда, которая действительно занималась бибоингом - «Enemy Squad» из Венгрии.\r\n</p>\r\n<p>\r\n	<br>\r\n	В Германии были еще такие известные комманды как «TDB», «Rockin Force», «Fresh Force». И конечно же было еще пару сольников как «Sonny Tee» из Гамбурга или Steve из Беншайма. Список очень длинный, но упомянутые мной люди до сих пор представляют брейкданс и могут быть консультантами в этой области.\r\n</p>\r\n<p>\r\n	<br>\r\n	После победы на Battle Of The Year в 1991 году мы отправились в Нью-Йорк, чтобы встретиться и познакомиться с людьми за Атлантическим океаном. В один из первых дней в Нью-Йорке мы натолкнулись на «Klown» и его «United streer artists» вместе с «Kwikstep» - единственный бибой, оставшийся в деле тогда. «Kwikstep» представил меня многим известным на то время людям из мира танца, поэтому я с радостью могу сказать, что возможно мы сыграли значительную роль в возрождении бибойкой культуры по всему миру, потому что после знакомства с ними, большинство из них начали тренироваться опять.\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	Год спустя «Swiftrock» и я снова отправились в Нью-Йорк и Mr Wiggles попросил меня остаться в Нью-Йорке еще на пару месяцев для работы над шоу с «Ghettoriginal Productions», позже более известного как «Jam on the groove». Вот тогда я заново увлёкся поппингом и локингом. Вообщем я тренировался в Бронксе вместе с «Wiggles» либо же отрабатывал рутины с «Adesola». Я ездил по турам с этим шоу с 1993 по 1995-го.\r\n	<br>\r\n</p>\r\n<p>\r\n	<iframe width="100%" height="480" src="//www.youtube.com/embed/ajmzF6IOWQQ" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	Пока мы репетировали в «большом яблоке» ( неофициальное название Нью-Йорка), основной мой заработок был от танцев вместе с «Klown», «R.O.B.» и «Breeze Team»на улицах. Моя финансовая ситуация изменилась к 1994 году, так как я еще начал работать на телевидении ведущим. Появился музыкальный канал «Viva» и им нужно было какое-то «Хип-Хоп шоу». Мы разработали передачу «Фристайл», которая пробыла в эфире 2 года. Иногда я давал уроки брейкинга и поппинга или демо и приглашал разные танцевальные команды, которые выступали в студии. Впервые в своей жизни мне не надо было думать про деньги и я мог полностью сосредоточиться на том, чем я действительно хотел заниматься: развивать свой собственный стиль и внедрять его.\r\n</p>\r\n<p>\r\n	<br>\r\n	Побывав на театральной сцене с «Ghettoriginal», я понял, что театр наилучший способ полностью и искренне выразить себя. Те, кто действительно хотят увидеть настоящее сценичное искусство, идут в театр. Все остальные шоу - больше демонстрация эффектных движений и наиболее впечатляющих трюков (я не тренировался так упорно столько лет только ради этого).\r\n</p>\r\n<p>\r\n	<br>\r\n	Мне пришлось отказаться от тура с «Ghettoriginal» обнаружив выбитый диск из верхней части позвоночника. К счастью, обошлось без операции. Я вроде как вылечил сам себя с помощью поппинга и упражнений по изоляции. В любом случае, если бы не все те мои травмы, я бы не узнал столько много про анатомию и то, как человеческое тело не должно двигаться. Так как я жить не могу без танцев и хочу нормально двигаться до старости лет, я решил ограничить себя на акробатике и заняться больше эстетическими, ритмическими и концептуальными аспектами танца.\r\n</p>\r\n<p>\r\n	<br>\r\n	К 1996 году я вместе со своей бывшей женой «Jazzy» и «Vartan» и «Amigo» из команды Flying Steps создали проэкт «Storm and Jazzy Project». Одной из моих главных целей была поддержка подрастающего поколения, а также сохранить данный вид искусства, найдя посредников, которые с радостью распространяли бы этот танец и его истинную философию.\r\n</p>\r\n<p>\r\n	<br>\r\n	Поэтому я начал тренировать самых талантливых людей Берлина. С гордостью сообщаю, что команда «Flying Steps» и ее представители стали одним из самых успешнейших результатов моей работы на то время.\r\n</p>\r\n<p>\r\n	<br>\r\n	В 1997 году началась настоящая работа Хип-Хоп Театра во Франции и мы много раз показывали на сцене наши постановки «Funky town» и «Dynomite» в течении следующих пару лет. На фестивале в Лионе января 1997 года я встретил Дирка Корелла и Ясин Дамбларда из ассоциации «Moov N Aktion». С начала они просто помогали нам, исправляя наши французские контракты, но мы сотрудничали всё больше и больше, пока они не взяли на себя всю административную работу нашего Проекта. В 1999-м году мы впервые работали совместно над «Men at work». Дуэт я с «Kane» Карлом Либанусом.\r\n</p>\r\n<p>\r\n	<br>\r\n	Год 2000-ый был для меня немаловажным. В январе я выпустил книгу под названием «От свайпа к Шторму» про историю бибоинга в Германии, которую я писал 4 года. Еще одно значительное событие этого года был Expo 2000, который проходил в Ганновере, Германии. Я ставил танцевальное шоу для открытия под названием «Xpose yoself».\r\n</p>\r\n<p>\r\n	<br>\r\n	<br>\r\n	Еще я сделал свой первый сольный номер «Соло для двоих» после завершения проэкта «Storm and Jazzy Project» в конце года. С этим танцевальным номером, посвященный моему родному городу Берлину, я обьездил весь мир. Это еще был мой первый эксперимент с видео-фоном. Большая часть идеи состоит в том, чтобы танцевать и играть паралельно со всем, что происходит на экране, где каждый кадр отснят в Берлине.\r\n</p>\r\n<p>\r\n	<br>\r\n	<br>\r\n	Фильм был выпущен «Leshstyle productions». Глава этой компании был Герман Гааг, бывший участник комманды Flying Steps. Германн также руководил видеопроэктами: 1. «Slippin and Sliding» созданый в 2003 и 2. «Art of urban dance» в 2004-2007 годах.\r\n</p>\r\n<p>\r\n	<br>\r\n	<br>\r\n	Реализация этих проэктов показывает, что я вышел на мировой уровень в обучении и освещении урбанистического искуства на конгрессах и театральных встречах.\r\n	<br>\r\n	Сейчас 2010 год, а я до сих пор влюблён в свою работу! Поэтому я еще создал парочку работ. Некоторые из них до сих пор разьезжают по турне: 1 «Соло для двоих» 2 «Geometronomics» с участием бразильской компании «Dispulos do ritmo» и 3 «Storm in classical context». Также всё чаще я показываю кусочки из моих первых работ для небольших презентаций.\r\n</p>\r\n<p>\r\n	<br>\r\n	<br>\r\n	Теперь я чаще отхожу за кулисы, мне нравиться ставить и организовывать. И пока я могу платить за квартиру, у меня полный холодильник и могу обеспечить хорошее образование своему сыну Шэну (ну и конечно пока у меня нет травм), до тех пор я счастлив.....\r\n</p>', '5/7/8/590a00482684f.jpg', '2017-05-03 16:07:36', 1, 0, 0, 1, 1),
(134, 'Интервью со Штормом', 'interviyu-so-shtormom', 1, 14, 'Интервью со Штормом', '«Шторм» (Ниелс Робитский) - немецкая звезда танцевальной сцены. Он танцует и преподаёт бибоинг, поппинг и локинг в Париже и Берлине.', '«Шторм» (Ниелс Робитский) - немецкая звезда танцевальной сцены. Он танцует и преподаёт бибоинг, поппинг и локинг в Париже и Берлине.', '<p>\r\n	«Шторм» (Ниелс Робитский) - немецкая звезда танцевальной сцены. Он танцует и преподаёт бибоинг, поппинг и локинг в Париже и Берлине.\r\n</p><p>\r\n	<br>\r\n	<strong>Первые шаги к миру танца</strong>\r\n</p><p>\r\n	Первый мой шаг к диско привила мне моя сестра — Baccaras «Sorry, I`m a Lady». Мой отец играл на кларнете, моя мама тоже была очень музыкальная. Когда я сидел на кухне и делал домашнее задание, она включала радио на полную и показывала шаги из бальных танцев. Иногда мы не включали телевизор, а играли свою домашнюю музыку. Осенью после дождливого лета вышел фильм «Танец-искра», иногда попадал по радио на Малькольма МакКларена, менеджера «Sex Pistols». Он как раз вернулся из Нью-Йорка. Я тогда не имел никакого представления о Хип-Хопе, но когда он рассказывал, как люди кувыркались на полу и крутились, как они двигались, будто они зависли в воздухе, то я думал: «Минуточку! Что-то очень знакомо. Тогда мне всё стало ясно, что речь идёт о танце, а не только о трюках, которые каждый делает.\r\n</p><p style="text-align:center">\r\n	<iframe width="100%" height="480" src="//www.youtube.com/embed/m9CYcR3sQ90" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n</p><p>\r\n	<br>\r\n</p><p>\r\n	<br>\r\n	<strong>Нетренированный далеко в Хип-Хопе не зайдёт</strong>\r\n</p><p>\r\n	Даже когда танцуешь самбу, без этого не обойтись. А тут надо еще по полу двигаться! Танцевать всё время на своих четырёх намного сложнее. Одно соло бибоя длится не больше 40 секунд, максимум минута, а потом он уже готов. Надо учиться экономить. Про особенности своего тела в положении «четырёх» больше всего познаётся, когда человек начинает экономить свои силы во разных жизненных ситуациях — то ли во время переезда, то ли при обычном течении жизни. Для меня Хип-Хоп это анализ и развитие движений.\r\n</p><p>\r\n	<br>\r\n	<strong>Кто же тогда такой Хип-Хоп танцор?</strong>\r\n</p><p>\r\n	С помощью математики можно в мире всё объяснить. Но то, что исходит изнутри, что возникает в самом себе, ценность текущего мгновения в танце — вот это означает для меня быть танцором.\r\n</p><p>\r\n	<br>\r\n	<strong>Сколько часов в день надо тренироваться?</strong>\r\n</p><p>\r\n	Сложно сказать. В Хип-Хопе не идёт речь о знании шагов, а про развитие своего собственного стиля и перехода движений. Только таким способом можно добиться, чтоб признали твоё имя. Это типичный вопрос своего Хип-Хоп Эго. Каждый признанный хип-хопер имеет проблему со своим Эго.\r\n</p><p>\r\n	<strong>Все?</strong>\r\n</p><p>\r\n	Ну конечно. Иначе он не был бы таким сложным.\r\n</p><p>\r\n	<br>\r\n	<strong>Тогда у тебя тоже есть проблема своего Эго?</strong>\r\n</p><p>\r\n	Да, будьте уверены (смеется)\r\n</p><p>\r\n	<br>\r\n	<strong>Ты всегда зарабатывал Хип-Хопом?</strong>\r\n</p><p>\r\n	Вначале мы были такими бедными, что даже туалетную бумагу с поездка тащили. У нас не было квартиры, а только проездные билеты на железную дорогу, поэтому ездили по всех возможных Хип-Хоп джемах.\r\n</p><p>\r\n	<strong>Ключевое слово "виртуозность"</strong>\r\n</p><p>\r\n	Да, но мы работали над своими шоу, над самовыражением. Мы ни о чём другом кроме танцев не думали, 24 часа в сутки.\r\n</p><p>\r\n	<strong>Из-за своей травмы со спинным диском ты не крутишься больше на голове.</strong>\r\n</p><p>\r\n	Я разработал себе план В и С на тот случай, если я травмируюсь. И я совсем не боюсь старости. Танцевать можно и в 80.\r\n</p>', '4/9/0/590a2032e17eb.jpg', '2017-05-03 18:23:46', 1, 0, 0, 1, 3),
(136, 'Граффити — дело не из лёгких...', 'graffiti-delo-ne-iz-lyogkih', 2, 14, 'Граффити — дело не из лёгких...', 'Кто сказал, что зарабатывать себе на жизнь Хип-Хоп искусством не возможно?', 'Кто сказал, что зарабатывать себе на жизнь Хип-Хоп искусством не возможно? Немецкие граффитчики Hesh & Daim начиная с 1993 года доказывают совершенно обратное.', '<p>\r\n	Кто сказал, что зарабатывать себе на жизнь Хип-Хоп искусством не возможно? Немецкие граффитчики Hesh &amp; Daim начиная с 1993 года доказывают совершенно обратное. Сейчас, к сожалению, эта креативная парочка вместе не работает (Hesh больше ушел в спорт), но у каждого есть работы в таких странах как Франция, Италия, Англия, Чехословакия, Югославия, Швейцария и много других. А всё начиналось в Германии в далёкие 80-ые...\r\n</p><p><img src="/images/news/590b74010e063.jpg"></p><p><br></p><p>\r\n	По словам Hesh, с граффити он познакомился случайно в 85-м, когда в соседней округе двое парнишек рисовали тэги. Под впечатлением от их граффити, юный немец захотел сам этим заняться и уже неделю спустя все стены района были усеяны его надписями. Ответ долго не заставил себя ждать. На стенке позже он увидел сообщение от тех же парней про желание встретиться — вот так они и собрались вместе в одну крю, а карьера Hesh начала отсчет.\r\n</p><p>\r\n	<br>\r\n	У Daim всё немного иначе — старт его творчества начался в 89-м году. Тогда он впервые фотографировал граффити, а потом, следуя изображениям на сделаных фотографиях, решил вместе с двумя друзьями и самому себе попробовать. В начале 1990-го они основали свою комманду Trash Can Design и сделали свой первый заказ.\r\n</p><p>\r\n	<br>\r\n	И хотя Hesh и Daim начали заниматься искусством граффити в разное время, одно у них было общее — источники вдохновения. Оба называют книги «Subway Art» и «Spraycan Art» (* «Искусство в подземке» и «Аэрозольное искусство») - любимые среди американской молодёжи - своей библией. Кроме книг, их наставниками по граффити стали американские документальные фильмы «Wild Style» (первый фильм 1983 года, где вместе соединились все элементы Хип-Хопа)\r\n	<iframe width="100%" height="480" src="//www.youtube.com/embed/Hee38-NV11E" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n	и «Star Warz», которые показали им безграничные возможности аэрозолей. Сейчас они нашли и развили свой собственный стиль.\r\n</p><p>\r\n	<br>\r\n	Комментируя своё искусство, Hesh определяет свои работы в JD Boogie Style, а Daim в Realistic Style. Но, как говорится, лучше один раз увидеть, чем сто раз прочитать — так что смотрите и оцените галерею Hesh &amp; Daim сами <a href="http://bombhiphop.com/heshdaim.htm">http://bombhiphop.com/heshdaim.htm</a><a href="http://pin.it/EZ5RaYA"></a>\r\n</p><p>\r\n	<br>\r\n</p><p>\r\n	<br>\r\n</p>', '7/7/0/590b741147c8a.jpg', '2017-05-04 18:33:53', 1, 0, 0, 1, 3),
(137, 'Уличный танец Дона Кэмпбелла', 'ulichnyj-tanec-dona-kyempbella', 1, 14, 'Уличный танец Дона Кэмпбелла', 'Человек, который добился высот в стритдэнсинге и заслужил уважение всех', 'Человек, который добился высот в стритдэнсинге и заслужил уважение всех', '<p>\r\n	Уличный танец за 30 лет своего существования так и остается нерегламентированным, а страницы его истории либо затерлись, либо их никто не создавал. Если балет, джаз, танго или вальс имеют имена своих героев, место происхождения, то за новаторство в том или ином стиле уличного танца до сих пор точится борьба между хореографами. Но даже в этой столь запутанной ситуации есть неоспоримые факты. Первое – это то, что родина уличных танцоров – Америка, а второе - Дон Кэмпбелл – человек, который добился высот в стритдэнсинге и заслужил уважение всех.\r\n</p><p>\r\n	<img src="/images/news/590b7deeac436.jpg" alt="" style="display: block; margin: auto;">\r\n</p><p>\r\n	Дон Кэмпбелл начал свой жизненный путь в Сент-Луисе, вырос в южной части Лос-Анжелеса. С детства парень проявил интерес к рисованию, чем очень выделялся из всеобщей картины его семьи, которая, как не удивительно, считала его немного странным.\r\n</p><p>\r\n	<br>\r\n	Вскоре его интерес к хобби не угас, а перешел на новый уровень – как последствие Дон Кэмпбелл становится студентом технического колледжа в своем городе, изучая коммерческое искусство.\r\n	<br>\r\n	После занятий Дон сидел в кафе и иногда зарабатывал, рисуя портреты людей. В колледже его также интересовал спорт, он занимался легкой атлетикой. Элрой Скиффер, старый друг Кэмбелла, вспоминает, что он мог сидеть с кистью в руке и в то же время смотреть на детей, танцующих в углу. Именно Элрой показал Дону самые простые и очень модные на те времена движения из Аллигатор, Ча-ча-ча. Друг признается, что  Кэмпбелл его очень вымотал, но был старательным учеником. «Я говорил ему, что пока ты можешь шагать, считать про себя и попадать в такт – ты танцуешь»,- говорит Элрой.\r\n	<br>\r\n	Соaбравшись с духом, Дон решил представить на осуждение публике все, что он сумел выучить.\r\n</p><p>\r\n	Кэмпбелл сам поставил танец из выученных им элементов. Представление он решил сделать в том же кафетерии. Стараясь не сбиться, Дон иногда делал паузы между элементами.  Это не могло остаться незамеченным.  Танцевальная звезда колледжа, Сэм Вильямс, присвоил Дону кличку «lock».  Но Вильямс все же пригласил новичка принять участия в соревновании в Даунтауне, где Дон занял пятую позицию из пятнадцати. «Признаюсь, если бы я тогда был последним, я бы никогда больше не танцевал»,- говорит Кэмпбелл.\r\n</p><p>\r\n	<br>\r\n	Теперь звездой стал сам Дон. Он успешно принимал участия в разных соревнованиях, организованными клубами с целью привлечь людей. Награду сложно было назвать высокой (всего 50 долларов), но Дона это вполне устраивало, и вскоре он собрал достаточное количество денег. Иногда с ним просто не хотели соперничать, и приз отдавался автоматически.  Кэмбелла знали, обсуждали. Он относился к этому ровно, но одна деталь его раздражала – Дон не любил, когда его стиль копировали. Мама успокаивала сына, ведь таким образом он обретёт больше признания.\r\n</p><div style="text-align:center" <p="">\r\n	<iframe width="500" height="281" src="//www.youtube.com/embed/uAIHco09KWY" frameborder="0" allowfullscreen="">\r\n	</iframe>\r\n\r\n</div><p>\r\n	<br>\r\n</p><p>\r\n	Мэверикс Флэт в Калвер Сити стало местом, где Дон проводил больше всего времени в местном клубе. Именно там он встретил Фреда Берри, будущего героя комедийного сериала «What is happening?». Актер попросил Кэмпбелла научить его движений локинга. Парень не отказал.  «Меня поразило то, насколько самоотверженно танцует этот парень. Он не просто махал рукой в направлении определенной точки, он делал целую петлю с помощью кисти. А это очень непросто. Неподвижность и движение – вот что движет локингом. Вы должны уметь резко остановится, фиксируя мышцы и суставы», - говорил Берри.\r\n	<br>\r\n	Все движения Дона Кэмпебелла были импровизацией. Теперь фристайл стал его другом. Как вспоминает сам танцор: « Что б я не делал, людям это нравилось, и они хлопали мне. Однажды я упал и не смог провертеться так, как планировал. Но люди начали аплодировать. Теперь я понимаю, что важно то, что ты делаешь правильно, а зацикливаться на ошибках нет смысла». </p><p>	<br>\r\n	Неизвестно какой была бы судьба локинга, и получил бы он популярность, или так и остался одним из стихийных стилей Западной Америки, если бы не телепередача «Соул Трэйн». Но для начала нужно немного углубиться в историю, чтобы понять всю роль этого шоу для развития танцевального искусства в США. </p><p>	<br>\r\n	70 годы прошлого века нельзя назвать благополучными, особенно для цветных американцев.  Смерть Мартина Лютера Кинга, война во Вьетнаме, гетто, где условия проживания мало чем отличались от жизни на зоне.  Стив Клементе (член двух популярных команд уличного танца), вспоминает свое детство в Нью-Йорке с малым восторгом: постоянные перестрелки между местными бандами, беспредел и ужас на улицах. Утешением для простых слоев населения стала телепередача на местном, а вскоре центральном телевидении страны «Soul Train». В основе передачи – уличные танцоры, ведь именно они становились героями выпусков. Если уличный стиль из самого отдаленного уголка страны стоил хоть чуть-чуть внимания, он непременно появлялся на телеэкране. </p><p>	<br>\r\n	Дон Кэмпбелл заслуженно получил свое место на ТВ, выиграв одно из соревнований. Основатель программы, Дон Корнеллиус, спросил в начинающей звезды, знал ли он еще хороших танцоров. Все это произошло в 1973г. Именно этот год стал точкой отсчета для молодого уличного коллектива The Lockers.  В него вошли: уже известный нам Фред Бэрри, Silm the Robot (его изюминка – костюм с лампочками), Fluky Luke, Greg "Campbellock Jr." Pope, Toni Basil, а впоследствии и Adolfo "Shabba-Doo" Quinones.\r\n	<br>\r\n	Эти ребята превратили локинг в нечто большее, нежели просто танец. С их легкой руки (в данном случаи уместней сказать – ноги), локинг стал стилем жизни и выражался во всем: поведении, одежде, манере общаться…. </p><p>	<br>\r\n	Локера было легко узнать по его полосатым носкам, огромной шляпе и подтяжкам.  Группа даже выступала на разогреве у Фрэнка Синатры.  Все вело парней к огромной популярности и славе, но жизнь каверзная вещь. После больших полетов бывают и падения. </p><p>	<br>\r\n	Как-то Дон призадумался и понял, что их просто используют и платят копейки. Пока что ребята были просто рады выступать и получать удовольствие, но этот период миновал, и пришло время рассуждать более глубоко. После просьбы группы увеличить им зарплату танцоры оказались на улице. </p><p>	<br>\r\n	Под конец 70 х группа распалась из-за внутренних противоречий. На сцене начали появляться новые знаменитости: Сэм Соломон вместе с братом Тимати. Вместе они стали основателями группы "The Electronic Boogaloo Lockers", впоследствии  - "The Electric Boogaloos". </p><p>	<br>\r\n	Пути частников «The Lockers» разошлись. Тони Бэзил стал музыкантом и даже выпустил успешный сингл, Фред Бэрри получил роль в популярном комедийном сериале, остальные больше времени уделяли саморазвитию и присоединились к свидетелям Иеговы. </p><p>	<br>\r\n	Несмотря на печальный конец существования группы, многие таланты увидели, что танцами тоже можно заработать на жизнь. </p><p>	<br>\r\n	Тимоти Солон очень уважает Дона Кэмпбелла, говоря, что он сумел запустить весь процесс оформления уличных танцев в популярное и серьезное движение. Также считает и Бруно Фалькон, известный испанский хореограф, работавший с Джанет Джексон, Майклом Джесоном и  Ла Тойей. «Без него (Дона Кэмбелла) ничего бы не началось»,- подытоживает Фалькон. </p><p>	<br>\r\n	Сейчас герою 50 лет и Дон Кэмпбелл не собирается пасти задних. Да, после него появилось много хороших танцоров, но он был первопроходцем, начертавшим маршрут движения всем остальным. И все, что теперь связанно с локингом – заслуга Дона.\r\n</p>', '5/4/9/590b80f0d68d0.jpg', '2017-05-04 19:28:48', 1, 0, 0, 1, 3),
(138, 'Свободный джаз и брейкинг - Kujo', 'svobodnyj-dzhaz-i-brejking-kujo', 1, 14, 'Свободный джаз и брейкинг - Kujo', 'Как танец меняется вместе с музыкой', 'Как танец меняется вместе с музыкой', '<p>В школе я постигал особенности джаза и моторику его движений. Некоторые его элементы пригодились мне в моем танце, особенно в области офф и он бит. Самым важным я считал изменение аккорда, которое появилось в этом стиле еще со времен свинга. Смена аккордов предавала песне красочности, мелодичности. Кроме того, ритм, инструменты – все можно было менять на вкус артиста, но база и фундамент оставались неизменными.  Серия нот (минимум 3) составляла аккорд, и музыканту ничего не оставалось, как удовольствоваться комбинацией этих трех нот для создания своей ритмики и темпа.  Сколько фантазии хватало, столько он мог играться с перестановкой этих нот, но выходить за рамки он не имел права.  Это характерно для 30 х годов. В 40 х на олимп выходят Charlie Parker, Dizzy Gillespie и совершают некий переворот и увеличивают количество нот. Как результат темп становится быстрее, и технически вся система переходит на уровень выше.</p><p><img src="/images/news/590b865978a8e.jpg" alt="" style="display: block; margin: auto;"></p><p>Шли времена и появлялись новые группы с другим ведением всего этого. Ornette Coleman и John Coltrane решили не ограничивать себя определенными рамками и становятся приверженцами безаккордной музыки. Как «заправку» вместо аккордов они используют мелодию и настроение самой песни.  Свое творение они окрестили «свободным джазом», тем самым создавая место для новых идей и форм. Вскоре ритм и темп также утратили власть. Получилось именно так: участники группы одновременно занимаются импровизацией, причем каждый своей, таким образом, получался некий «художественный шум».<br>Сейчас вполне очевидны сходства в эволюции джаза и брейкинга. Раньше в брейкинге можно было наблюдать своеобразный аккорд, состоящий из трех нот: toprock, footwork, and freezeы. Танец не стоял на месте и в нем появился новый элемент, новая нотка – пауэр мув. И наконец, посмотрим на современное состояние брейкинга: теперь в нем можно найти новые подходы и способы передачи мыслей.  Пауэр мув, фризы стали намного усложненными с технической точки зрения, и появляется офф бит, который служит инструментом для полного выражения души.  Все эти изменения можно назвать реакцией на упрощения, который склонил брейкинг к тому, что он стал напоминать тот самый «шум».<br>Как можно увидеть, исследовав историю - это нормальный эволюционный процесс, присущий всему живому, а танец – не что иное, как жизнь. Попытки завязать артисту руки приводят к реакции, и запускается необратимый процесс борьбы, при котором рождаются новые открытия. Немыслимо ограничивать в развитии даже самую маленькую идею, ведь она служит связывающим звеном между гораздо большими частицами. Разорвать цепь – значит уничтожить целую систему.</p>', '7/6/2/590b869517fba.jpg', '2017-05-04 19:52:53', 1, 0, 0, 1, 3),
(139, 'PowerMove vs. FootWork', 'powermove-vs-footwork', 1, 14, 'PowerMove vs. FootWork', 'Из-сплошных доказываний друг другу своей правоты, би-бои очень часто зря теряют шанс привнести в искусство каплю свежести и креатива. ', 'Из-сплошных доказываний друг другу своей правоты, би-бои очень часто зря теряют шанс привнести в искусство каплю свежести и креатива. Лишь немногие умудряются успешно соединять лучшие качества обоих направлений.', '<p>Человек, просвещённый в брейкинге или би-боинге наверняка сталкивался или даже учувствовал в дискуссиях, которые точатся вокруг стилей пауэрмув  и футворк.  Первые утверждают, что их подход намного сложнее технически, нежели футворк, повторить который не составит труда. В ответ им футворкеры закидают, что в оппонентов вообще не развита фантазия и даже идут далее, говоря, что паверщики никто другие, как обыкновенные гимнасты, называющие себя танцорами.</p><p><img src="/images/news/590b89dd4d780.jpg" alt="" style="height: 603px; width: 603px; display: block; margin: auto;"></p><p><br><br>Из-сплошных доказываний друг другу своей правоты, би-бои очень часто зря теряют шанс привнести в искусство каплю свежести и креатива. Лишь немногие умудряются успешно соединять лучшие качества обоих направлений.</p><p><br>Не секрет, что стайл важен. Без него танцор теряет свое лицо, становится безликим, неузнаваемым, сливается с серой толпой. Стал не просто набор особых движений, стайл это еще и характер, личность танцора, эго внутренние «я».  Узнаваемым можно стать только при наличии индивидуальности, а это, как известно, уже половина успеха.</p><p><br>Пауэр – это все, что имеет отношение к переводу тела вверх, иными словами - отсутствие физики и законов гравитации, или же магнит, который тянет не вниз, а в обратную сторону. Чтобы отточить одно движение, нужны не дни и недели тренировок, а месяцы. Кроме того, танцор сталкивается с жуткими несвойственными для человеческого тела вещами. Би-бои в таком случае не выдумывают новое, а просто передают опыт и технику другим.</p><p><br>Стайл – это выражение, поиски новых форм, пауэр – это техника, но очень высокого мастерства.  Учитывая, что ребят, занимающихся би-боингом становится все больше, то на вечеринках и в клубах можно наблюдать одни и те же мувы, комбо.  Стиля не видно, всякие рамки между индивидуальностью и общепринятыми нормами стираются.</p><p><br>Решился ли кто-то из би-боев попробовать новое?  Хотели ли танцоры при помощи  футворка и пауэрмува расширить свои возможности?  Считают ли они, что пауэрмув – это путь к индивидуальности? Пауэр – это высокое мастерство, но как много людей занималось часами и месяцами, чтобы совершенствоваться?  Многие ли пробовали придумать что-нибудь свое?</p><p><br>Как традиционный стиль би-боинг  приблизился к своим пределам.  Уже растиражированы сотни<br>стайлов, которыми мастерски пользуются любители танца.  Новички учатся наблюдая. В этом плане они молодцы, ведь усваивают все налету в прямом смысле: на вечеринках, по видеоурокам….   Но у них не было хороших преподавателей, способных объяснить теорию танца.</p><p><br>Совет новичкам – создавайте свое: новое и неповторимое. Заучивайте только основы, а все<br>остальное пусть делает за вас фантазия.</p><p><br>К несчастью, многие профессиональные би-бои слишком увлечены собственным продвижением, чтобы помогать начинающим. Они от всего ищут прибыль. Таким образом, учителей нет, и желающие постичь основ танца оказываются наедине.</p><p><br>С приходом нового поколения би-боев дифференциация будет все более ощутимой.  Появится видимый кордон между стильными танцами и простым подражанием. Талантливые би-бои получат шанс по-настоящему выделится среди мрачных танцоров-копировщиков.</p>', '4/4/0/590b8afd03602.jpg', '2017-05-04 20:11:41', 1, 0, 0, 1, 3),
(140, 'Что такое "foundation" по-настоящему? - Kujo', 'chto-takoe-foundation-po-nastoyashhemu-kujo', 1, 14, 'Что такое "foundation" по-настоящему? - Kujo', '«Труевый би-бой» имеет свою сущность, а это именно футворк, кроме того именно владение его навыками отличает би-боев от других танцоров.', '«Труевый би-бой» имеет свою сущность, а это именно футворк, кроме того именно владение его навыками отличает би-боев от других танцоров.', '<p>Как считает большинство би-боев, особенно старой закалки, основа (foundation), состоит из footwork`a, а точнее six step footwork`a. «Труевый би-бой» имеет свою сущность, а это именно футворк, кроме того именно владение его навыками отличает би-боев от других танцоров. Они считают, что именно с него и нужно начинать свои занятия.</p><p>Но, многие би-бои становились мастерами вовсе не на футворке, а на «черепашке», windmill`е, других пауэрмувах и вовсе не на фризах. Иногда первым опытом становилась импровизация от «сердца»: что оно подскажет, так и двигаюсь.</p><p><img src="/images/news/590b8ee0ae834.jpg" alt="" style="display: block; margin: auto; height: 340px; width: 340px;"></p><p>Если брейкер начинает с six step`a, то он станет копией миллионов уже существующих копий.  Сложно сказать плохо это или хорошо.</p><p><br>С одной стороны, все станут би-боями на противовес  бальникам. С другой стороны, будет казаться, что мы просто копируем друг друга. Конечно, у каждого свои особенности движений и каждый видит танец с его, неповторимой точки зрения, но что если начинающие будут делать все по-своему и заново изобретать велосипед? Если они вместо уже давно исследованного вдоль и поперек футворка будут учить фризы? Или пауэрмув? Или еще что-то абсолютно самобытное? Можно ли в таком случае называть его би-боем?</p><p><br>Базовый футворк вселяет понимание танца под названием rocking. Причем чем больше занятий, тем более заметна индивидуальность танцора. В конечном итоге вырабатывается индивидуальное понимание движений и их специфика. Не нужно останавливаться. Зашел в тупик? Учи другие техники. Тот же футворк, пауэрмув. Но только истина останется не отрицаемой: что бы ты не танцевал и как бы ты это не делал, ты все равно будешь похожим на людей, которые разделяют твое увлечение.  Это нельзя назвать плохим качеством. Все зависит от желаний, того, чего ты стремишься.</p><p><br>Например, некоторые ребята не хотят постигать вершин футворка и больше работают с пауэрмувом и комбинациями. За это их часто критикуют, называя городскими гимнастами.  Как бы не относились к ним другие, но они хотят расширения человеческих возможностей, эти парни приносят новизну и не дают стилю стать неинтересным. Они так хотят, это их чувство и посягать на право самовыражения не может никто.</p><p><br>Еще один пример. Некоторые не считают футворк достойным внимания, сравнивая его с движениями киборга. В арсенале этого человека больше грации, фризов. И это тоже хорошо. Он считает так. И его мнение также под охраной неприкосновенности.</p><p><br>Если человечество хочет искать новые формы, то оно будет это делать. И ничто не может этому помешать.</p><p><br>Со временем детали танца rocking изменились, они умножились. Если ты нарушаешь эти правила – ты одиночка. Мы будет меняться и постоянно выдумывать новое до тех пор, пока между Изобретателями и Основателями не будет никаких сходств.</p><p><br>Давайте представим, что было бы, если Дону Кэмпбеллу сказали: Funky Chicken танцуй по-другому, и навязали свою идею? Он разрушал законы, но его заслуженно уважают как основателя стритдэнса и делают это заслуженно, потому что Дон не боялся идти против течения и создавал свои правила.</p>', '7/7/4/590b8efcb619c.jpg', '2017-05-04 20:28:44', 1, 0, 0, 1, 3);
INSERT INTO `z_news` (`id`, `name`, `url`, `category`, `user`, `title`, `description`, `small`, `text`, `img`, `created`, `article`, `date_redact`, `redactor_id`, `status`, `img_block_size`) VALUES
(141, 'Test news', 'test-news', 1, 14, '', '', 'Date redact test', '<p>Label</p>\r\n\r\n<blockquote class="twitter-tweet" data-lang="ru"><p lang="ru" dir="ltr">Знакомец Игоря Коротченко, глядя на него в тв - &quot;Да пошел он в жопу... хотя нет, может воспринять как приглашение...&quot; </p>&mdash; Алексей Венедиктов (@aavst) <a href="https://twitter.com/aavst/status/893059220836241408">3 августа 2017 г.</a></blockquote>\r\n<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>\r\n\r\n<p><img alt="" src="/images/news/59205e80cafe5.jpg" /></p>\r\n\r\n<p>Full text<br />\r\nDate redact test</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Full text</p>\r\n\r\n<p><img alt="" src="/images/news/591ebcbf07774.jpg" /></p>\r\n\r\n<p>Date redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test<br />\r\nFull text<br />\r\nDate redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test<br />\r\nFull text<br />\r\nDate redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test<br />\r\nFull text<br />\r\nDate redact test<br />\r\nFull text<br />\r\nDate redact test</p>\r\n\r\n<p>Full text<br />\r\nDate redact test</p>\r\n', NULL, '2017-05-19 06:34:52', 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `z_newsfeed`
--

CREATE TABLE `z_newsfeed` (
  `id` int(11) NOT NULL,
  `elem_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elem_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_newsfeed`
--

INSERT INTO `z_newsfeed` (`id`, `elem_type`, `elem_id`, `user_id`) VALUES
(6, 'board', 107, 30),
(440, 'board', 585, 38),
(56, 'board', 165, 35),
(9, 'board', 110, 31),
(10, 'board', 111, 31),
(11, 'board', 112, 31),
(12, 'board', 113, 31),
(13, 'board', 114, 31),
(14, 'board', 115, 31),
(15, 'board', 116, 32),
(16, 'board', 117, 32),
(17, 'board', 118, 32),
(18, 'board', 119, 32),
(19, 'board', 120, 32),
(20, 'board', 121, 32),
(71, 'board', 181, 14),
(22, 'board', 125, 32),
(23, 'board', 126, 31),
(24, 'board', 127, 31),
(25, 'board', 128, 31),
(442, 'board', 587, 38),
(441, 'board', 586, 38),
(439, 'board', 584, 38),
(54, 'board', 162, 13),
(105, 'board', 217, 13),
(379, 'board', 512, 14),
(395, 'board', 530, 33),
(58, 'board', 167, 14),
(59, 'board', 169, 14),
(60, 'board', 170, 14),
(61, 'board', 171, 34),
(62, 'board', 172, 34),
(63, 'board', 173, 36),
(64, 'board', 174, 36),
(65, 'board', 175, 36),
(66, 'board', 176, 14),
(67, 'board', 177, 14),
(68, 'board', 178, 14),
(142, 'board', 257, 33),
(448, 'board', 594, 14),
(72, 'board', 182, 33),
(73, 'board', 183, 33),
(75, 'board', 185, 33),
(76, 'board', 186, 33),
(113, 'board', 225, 33),
(85, 'board', 197, 33),
(86, 'board', 198, 33),
(87, 'board', 199, 32),
(90, 'board', 202, 14),
(91, 'board', 203, 35),
(92, 'board', 204, 35),
(443, 'board', 588, 38),
(95, 'board', 207, 33),
(143, 'board', 258, 33),
(97, 'board', 209, 13),
(106, 'board', 218, 13),
(99, 'board', 211, 34),
(100, 'board', 212, 34),
(101, 'board', 213, 34),
(102, 'board', 214, 34),
(103, 'board', 215, 31),
(107, 'board', 219, 31),
(112, 'board', 224, 39),
(145, 'board', 260, 33),
(121, 'board', 233, 33),
(417, 'board', 561, 93),
(125, 'board', 237, 33),
(123, 'board', 235, 33),
(124, 'board', 236, 33),
(126, 'board', 238, 33),
(127, 'board', 239, 33),
(144, 'board', 259, 33),
(133, 'board', 245, 33),
(444, 'board', 589, 14),
(422, 'board', 566, 33),
(416, 'board', 560, 93),
(141, 'board', 256, 13),
(146, 'board', 261, 33),
(147, 'board', 262, 33),
(148, 'board', 263, 33),
(149, 'board', 264, 33),
(447, 'board', 593, 79),
(374, 'board', 507, 14),
(396, 'board', 531, 38),
(157, 'board', 275, 48),
(172, 'board', 292, 33),
(173, 'board', 293, 33),
(174, 'board', 294, 33),
(175, 'board', 295, 33),
(176, 'board', 297, 33),
(177, 'board', 298, 33),
(179, 'board', 299, 33),
(180, 'board', 300, 14),
(181, 'board', 301, 33),
(418, 'board', 562, 14),
(425, 'board', 569, 14),
(427, 'board', 571, 14),
(434, 'board', 579, 79),
(188, 'board', 308, 33),
(189, 'board', 309, 33),
(190, 'board', 312, 33),
(437, 'board', 582, 38),
(202, 'board', 326, 14),
(196, 'board', 320, 33),
(199, 'board', 323, 33),
(219, 'board', 343, 33),
(403, 'board', 546, 14),
(238, 'board', 362, 33),
(237, 'board', 361, 33),
(241, 'board', 365, 33),
(254, 'board', 378, 33),
(255, 'board', 379, 33),
(257, 'board', 381, 14),
(258, 'board', 382, 14),
(259, 'board', 383, 14),
(263, 'board', 388, 33),
(264, 'board', 389, 33),
(266, 'board', 392, 33),
(267, 'board', 393, 33),
(435, 'board', 580, 38),
(446, 'board', 591, 14),
(367, 'board', 499, 14),
(288, 'board', 416, 33),
(289, 'board', 417, 33),
(292, 'board', 421, 33),
(297, 'board', 426, 33),
(298, 'board', 427, 33),
(302, 'board', 432, 33),
(438, 'board', 583, 38),
(385, 'board', 519, 14),
(307, 'board', 437, 33),
(308, 'board', 438, 33),
(309, 'board', 439, 33),
(310, 'board', 440, 33),
(311, 'board', 441, 33),
(312, 'board', 442, 33),
(313, 'board', 443, 33),
(314, 'board', 444, 33),
(436, 'board', 581, 38),
(393, 'board', 528, 14),
(318, 'board', 448, 33),
(319, 'board', 449, 33),
(320, 'board', 450, 33),
(321, 'board', 451, 33),
(420, 'board', 564, 14),
(323, 'board', 453, 33),
(328, 'board', 458, 33),
(349, 'board', 481, 35),
(424, 'board', 568, 33),
(334, 'board', 464, 75),
(394, 'board', 529, 14),
(423, 'board', 567, 14),
(397, 'board', 534, 33),
(386, 'board', 520, 14),
(368, 'board', 500, 33),
(352, 'board', 484, 33),
(433, 'board', 578, 79),
(449, 'board', 595, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `z_notice`
--

CREATE TABLE `z_notice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `importance` tinyint(1) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_notice`
--

INSERT INTO `z_notice` (`id`, `user`, `name`, `text`, `importance`, `created`) VALUES
(1, 1, 'test', 'test', 2, '2015-05-13 13:25:34'),
(2, 5, 'первая ', 'привет тест', 2, '2015-05-13 13:28:18'),
(3, 8, 'тест', 'вфвфывв', 1, '2015-05-13 14:03:45'),
(5, 9, 'Поездка на BOTY 2016', 'test', 1, '2015-05-17 14:48:46'),
(6, 13, 'ыявы', 'ывмаФ11111111', 1, '2015-08-12 07:11:23');

-- --------------------------------------------------------

--
-- Структура таблицы `z_photo`
--

CREATE TABLE `z_photo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `album` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_photo`
--

INSERT INTO `z_photo` (`id`, `user`, `album`, `name`, `img`, `created`) VALUES
(1, 1, 1, 'первая', 'ea272cbd6ddb9388be8c912c75db6488', '2015-05-12 05:40:47'),
(2, 1, 1, '', '821c569cd84d0db348372f69349f4961', '2015-05-12 05:42:33'),
(3, 5, 3, '1', '17da6af10159e6383cf0b9a3e36b475b', '2015-05-12 05:48:19'),
(4, 5, 3, '2', '37d5a086e0a115dc2f00baaf6686ccc1', '2015-05-12 05:48:34'),
(5, 5, 3, '3', '584c9c4c236693bbd67b16258f416f63', '2015-05-12 05:48:46'),
(6, 8, 4, '', 'e9464e61557bf1103dcdc3c4a4415403', '2015-05-13 14:03:33'),
(7, 5, 5, 'авто', '4b39c097639890425a7d9c86925259db', '2015-05-15 16:28:36'),
(8, 9, 6, '', 'd2aae7e889649ba291de8b2b266c631c', '2015-05-17 14:47:07'),
(9, 9, 6, '', '73497da5cd8fd887864fadf848625257', '2015-05-17 14:47:27'),
(10, 10, 7, '', '60fffae4720203d048bf7f005728ddcf', '2015-05-17 18:52:50'),
(11, 10, 8, '', '603f353caa169cf344419c7b248234b9', '2015-05-17 18:54:46'),
(12, 13, 10, 'лафает', 'f1fff07faa350a0c35858e6ca6245eae', '2015-08-13 09:37:16'),
(13, 15, 9, 'love', '5d3bbf9ea1cd190e92ef6c91ccd88628', '2015-08-16 18:06:50'),
(14, 14, 11, 'Ричи', '3b4fbe143c9fbcff44d03592b44fe2a7.jpg', '2015-11-13 13:57:38'),
(15, 14, 11, '', '27316b665882373d83241c4f56240f5f.jpg', '2015-11-16 09:00:13'),
(16, 14, 14, 'кот', '4bb88b18bfc1433398fc25a0842bc7ad.jpg', '2015-11-16 09:28:53'),
(18, 14, 15, 'фывф', '4bb88b18bfc1433398fc25a0842bc7ad.jpg', '2015-11-16 09:41:46'),
(19, 14, 16, 'фыв', '4bb88b18bfc1433398fc25a0842bc7ad.jpg', '2015-11-16 09:43:48'),
(20, 14, 20, 'Сеня', '511c25368975587ca8dda2fc7db137f8.jpg', '2015-11-17 09:56:19'),
(21, 14, 21, 'ваер', '1529cb49358f120c3ac378e7fd0b7ed9.jpg', '2015-11-17 10:22:46'),
(22, 14, 22, 'пр', '92364be30f6a0497d6b164bc19731295.jpg', '2015-11-17 10:24:10'),
(23, 14, 24, 'кепи', '9431f8c2d71587bff864f318b851b2ac.jpg', '2015-11-17 10:54:29'),
(24, 14, 25, 'авпк', '1529cb49358f120c3ac378e7fd0b7ed9.jpg', '2015-11-17 10:57:44'),
(25, 14, 26, 'ноерн', '1fc8aa8af0a6c25abc3926260ca515a4.jpg', '2015-11-17 11:11:51'),
(28, 24, 30, 'совенок', '18ed4e5284a35a4bff5f09e6e13e20af.jpg', '2015-12-09 12:48:13'),
(29, 6, 31, '', '2bb4d0dabb0714f8ff6427e0e310aa0e.jpg', '2015-12-10 09:07:53'),
(30, 6, 31, '12', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2015-12-10 09:08:17'),
(31, 6, 31, '12ee', '2bb4d0dabb0714f8ff6427e0e310aa0e.jpg', '2015-12-10 09:08:30'),
(34, 13, 43, '3fRx30q1kbc', '8c36ca2397449b135a4a8e9f621b95b3.jpg', '2015-12-16 13:08:30'),
(35, 13, 43, '4b264f115605яч8', 'c9f96150fca67ef16e92b89d6b62fbc4.jpg', '2015-12-16 13:08:31'),
(36, 13, 43, 'dNAHCyL_B8s', '6cd8d722a2b35f05e218f0259a797687.jpg', '2015-12-16 13:08:31'),
(37, 13, 43, 'q-3f_fMJe8M', '375ac9f285722fecf85a982dbfa67c30.jpg', '2015-12-16 13:08:31'),
(38, 13, 45, '3fRx30q1kbc', '8c36ca2397449b135a4a8e9f621b95b3.jpg', '2015-12-18 18:35:42'),
(39, 13, 45, '4b264f115605яч8', 'c9f96150fca67ef16e92b89d6b62fbc4.jpg', '2015-12-18 18:35:42'),
(40, 13, 45, 'dNAHCyL_B8s', '6cd8d722a2b35f05e218f0259a797687.jpg', '2015-12-18 18:35:43'),
(41, 13, 45, 'q-3f_fMJe8M', '375ac9f285722fecf85a982dbfa67c30.jpg', '2015-12-18 18:35:43'),
(42, 13, 46, '3fRx30q1kbc', '8c36ca2397449b135a4a8e9f621b95b3.jpg', '2015-12-21 16:26:17'),
(43, 13, 46, '4b264f115605яч8', 'c9f96150fca67ef16e92b89d6b62fbc4.jpg', '2015-12-21 16:26:18'),
(44, 13, 46, 'dNAHCyL_B8s', '6cd8d722a2b35f05e218f0259a797687.jpg', '2015-12-21 16:26:18'),
(45, 13, 46, 'q-3f_fMJe8M', '375ac9f285722fecf85a982dbfa67c30.jpg', '2015-12-21 16:26:18'),
(46, 13, 47, 'dNAHCyL_B8s', '6cd8d722a2b35f05e218f0259a797687.jpg', '2015-12-21 16:29:57'),
(47, 13, 47, 'q-3f_fMJe8M', '375ac9f285722fecf85a982dbfa67c30.jpg', '2015-12-21 16:29:57'),
(48, 14, 48, '4b264f115605яч8', 'c9f96150fca67ef16e92b89d6b62fbc4.jpg', '2015-12-22 13:20:22'),
(49, 14, 48, 'dNAHCyL_B8s', '6cd8d722a2b35f05e218f0259a797687.jpg', '2015-12-22 13:20:23'),
(50, 14, 48, 'q-3f_fMJe8M', '375ac9f285722fecf85a982dbfa67c30.jpg', '2015-12-22 13:20:23'),
(52, 25, 49, '123', '857ef4ad184034fe66a620be7ba7513e.jpg', '2015-12-24 18:11:10'),
(53, 14, 52, '4030e8b2fbe0b2f2c26a97aedc532757', '0431cd82fad23509368ae49f428e10ec.jpg', '2016-01-11 11:53:16'),
(54, 14, 52, '236996716', 'ddd114f74cf4df1408028e337d1d713a.jpg', '2016-01-11 11:53:16'),
(55, 14, 52, 'images', '59b514174bffe4ae402b3d63aad79fe0.jpg', '2016-01-11 11:53:16'),
(56, 14, 52, 'podruge-3', 'dfcf104b0f8c82a20d058c50f68b5ae8.jpg', '2016-01-11 11:53:16'),
(57, 14, 53, '236996716', 'ddd114f74cf4df1408028e337d1d713a.jpg', '2016-01-11 12:59:28'),
(58, 14, 53, 'images', '59b514174bffe4ae402b3d63aad79fe0.jpg', '2016-01-11 12:59:28'),
(59, 14, 53, 'olmYDLw2cNQ', '3bd5e6ce5c36a4edeabda53802bd4a6a.jpg', '2016-01-11 12:59:28'),
(60, 14, 53, 'podruge-3', 'dfcf104b0f8c82a20d058c50f68b5ae8.jpg', '2016-01-11 12:59:28'),
(67, 31, 56, 'Забор', '7b16cb48acd6415293771bf8fde26e9a.jpg', '2016-01-12 08:31:59'),
(68, 31, 56, 'Семерочка', '80aa9dd9dfe686d6f182e563a4b7df54.jpg', '2016-01-12 08:32:25'),
(69, 31, 56, 'Ливерпуль', '5417d86887a460b0036c122cb2dfb560.jpg', '2016-01-12 08:33:39'),
(70, 31, 56, 'Кот', '279c8fa90d173f4a5941d57cb9b599e6.jpg', '2016-01-12 08:34:12'),
(71, 31, 56, 'Город', '228ffdf2f7e5ccc880d741e3a5969567.jpg', '2016-01-12 08:34:39'),
(72, 32, 57, 'Мельница', '2826b112b28da777fce21b3c88b0c493.jpg', '2016-01-12 08:53:42'),
(73, 32, 57, 'Дерево', '85dc2177634bc83e347ae08d1389c099.jpg', '2016-01-12 08:54:11'),
(74, 32, 57, 'Дорога', '540958b0548ae42c2247538626c7a60c.jpg', '2016-01-12 08:54:49'),
(75, 32, 57, 'Поле', 'c4e0eeddebb88991324c6bf7ae863bd0.jpg', '2016-01-12 08:55:10'),
(76, 32, 57, 'Горы', '59949d5b2911cf082e34c852c16d148c.jpg', '2016-01-12 08:55:41'),
(77, 32, 57, 'Земля', 'ff5420aad26b268eeeb968cc7ceae9eb.jpg', '2016-01-12 08:56:39'),
(78, 32, 57, 'Неведомая фигня', '30606561bc2f3e2c3866b6a8f47b8e21.jpg', '2016-01-12 08:57:59'),
(79, 32, 57, 'Космос', '94cb6648f78f21e990ed6ddd9d8c09e0.jpg', '2016-01-12 08:58:20'),
(80, 32, 57, 'У моря', 'e9c7b758f91096c3fdfed3479b270145.jpg', '2016-01-12 08:58:46'),
(81, 32, 57, 'Дом', 'e6547ec279df68cd877498691e5aaba9.jpg', '2016-01-12 08:59:06'),
(82, 32, 57, 'Красиво', '677533e29ca7e19aab9ad58afe093853.jpg', '2016-01-12 08:59:46'),
(83, 14, 58, 'Chrysanthemum', '10665de14261e416423e82f725bf6689.jpg', '2016-01-12 10:32:23'),
(84, 14, 58, 'Desert', '000c016d34ff41e245b69c67f22c83ff.jpg', '2016-01-12 10:32:23'),
(85, 14, 58, 'Koala', 'c4cf192ff255dddf4cc2018dc622f834.jpg', '2016-01-12 10:32:23'),
(86, 14, 58, 'Lighthouse', 'bcb3798d312ed46335afe6b1c0ebd398.jpg', '2016-01-12 10:32:23'),
(87, 14, 58, 'Penguins', '5aeb1f62f6cd496dc81c07d58b82f143.jpg', '2016-01-12 10:32:23'),
(88, 31, 56, '1', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2016-01-12 11:41:05'),
(89, 32, 59, 'первая', '453859528b76397a5a12a9d2f36ba702.jpg', '2016-01-12 12:11:42'),
(90, 32, 59, 'вторая', '87d07f90f10c40ed8075f45c042fe6f6.jpg', '2016-01-12 12:11:59'),
(91, 32, 59, 'третья', 'a49fe8914df0eada4d4b7d530d7fa5ba.jpg', '2016-01-12 12:12:10'),
(92, 32, 59, 'четвертая', 'bd6661231506e0fe52c15a3a77ecc1e7.jpg', '2016-01-12 12:12:25'),
(93, 32, 59, 'коала', '06d3bc740e8ba0c8f64427649f537269.jpg', '2016-01-12 12:12:36'),
(94, 32, 59, 'пятая', '4f6a306c94af679657ced7273b5ad4ea.jpg', '2016-01-12 12:12:48'),
(95, 32, 59, 'пингвины', '571e32a9497bc9ce85a05dda04543fd6.jpg', '2016-01-12 12:13:02'),
(96, 32, 59, 'последняя', '538dcf9d8b98ac9a193a01f25d975ad2.jpg', '2016-01-12 12:13:16'),
(97, 32, 60, '1', '481ee9b51d0f582ab380140c2c415fb6.jpg', '2016-01-12 12:14:35'),
(98, 32, 60, '1', '4c557ec5be387670852576b49425d1e8.jpg', '2016-01-12 12:14:45'),
(99, 32, 60, '1', 'b6856d4aad876ebebbd9e1b5e53ea412.jpg', '2016-01-12 12:14:56'),
(100, 32, 60, '1', '3a2bcd3d87d7eed31d3526642914f2ba.jpg', '2016-01-12 12:15:06'),
(101, 32, 60, '1', '6e67dfc265cf140ea0661aedc73ad0ac.jpg', '2016-01-12 12:15:16'),
(102, 32, 60, '1', '3430da759dd41128e033bf146f084be5.jpg', '2016-01-12 12:15:28'),
(103, 32, 60, '1', '1af7f82bf1b545835efea0edfc0af6af.jpg', '2016-01-12 12:15:38'),
(104, 32, 60, '1', 'dec33b1ac71964eaa0a407b23f78e7fa.jpg', '2016-01-12 12:15:49'),
(105, 32, 60, '1', '30606561bc2f3e2c3866b6a8f47b8e21.jpg', '2016-01-12 12:15:59'),
(106, 32, 60, '1', '01ef1da83fa196c449295df6709647ab.jpg', '2016-01-12 12:16:09'),
(107, 32, 60, '1', '37468ba3ae04200ea4e07b62cb746d5c.jpg', '2016-01-12 12:16:19'),
(108, 32, 60, '1', 'd261ffe1fd38776ff8faee70ecf0c6ca.jpg', '2016-01-12 12:16:28'),
(109, 32, 60, '1', 'e9c7b758f91096c3fdfed3479b270145.jpg', '2016-01-12 12:16:40'),
(110, 32, 60, '1', '2d52ae1a1fe671324132a63faf4b6d9b.jpg', '2016-01-12 12:16:53'),
(111, 32, 60, '1', '96718b90a10aeee9815f6b6fa5f88402.jpg', '2016-01-12 12:17:09'),
(112, 32, 60, '1', '122a32a707e7f59afbdb3b6463a80b13.jpg', '2016-01-12 12:17:20'),
(113, 32, 60, '1', '313d1c4c4b0a088d6ce8a3121c37d12b.jpg', '2016-01-12 12:17:34'),
(114, 32, 60, '1', '7eac163af92f3b7ab77bc9efc30a6b9c.jpg', '2016-01-12 12:17:49'),
(115, 32, 60, '1', '366ac3b3dc43ea89076540b1106ea2db.jpg', '2016-01-12 12:18:00'),
(116, 32, 60, '1', '43177ba55ee59200c391ac06e2272120.jpg', '2016-01-12 12:18:10'),
(117, 32, 60, '1', 'f462f5d096ecbc7920fc522907f77108.jpg', '2016-01-12 12:18:22'),
(118, 32, 60, '1', '10872eefdaef6ca2c24b5ee88bbb7398.jpg', '2016-01-12 12:18:42'),
(119, 32, 60, '1', '190551ef06fd32c9b6a8ab5b0a8d0124.jpg', '2016-01-12 12:18:56'),
(120, 32, 60, '1', 'b2ba9da84ad975818095d132cef7bfe2.jpg', '2016-01-12 12:19:03'),
(121, 32, 60, '1', 'e1c92e786e82b555586fcd46ab75e78f.jpg', '2016-01-12 12:19:13'),
(122, 32, 60, '1', '73d6f7533a6197d4c66c43698a3f3a70.jpg', '2016-01-12 12:19:27'),
(123, 32, 60, '1', '5f3015ec9990fe9e3c8a1ac7408387f2.jpg', '2016-01-12 12:19:48'),
(124, 32, 61, '12', '4df700c4ae2d05f8429f02605385c019.jpg', '2016-01-12 12:26:15'),
(125, 32, 61, '', '4c00133448ee8141b1351a3468eec9e6.jpg', '2016-01-12 12:26:34'),
(126, 32, 61, '', '4c00133448ee8141b1351a3468eec9e6.jpg', '2016-01-12 12:26:35'),
(127, 32, 61, '', '4c00133448ee8141b1351a3468eec9e6.jpg', '2016-01-12 12:26:42'),
(128, 32, 61, '', '4c00133448ee8141b1351a3468eec9e6.jpg', '2016-01-12 12:26:43'),
(129, 32, 61, '', '2fee9c5324ade60214ecffafc9c9d420.jpg', '2016-01-12 12:27:31'),
(130, 32, 61, '', '2fee9c5324ade60214ecffafc9c9d420.jpg', '2016-01-12 12:27:32'),
(131, 32, 61, '', '10872eefdaef6ca2c24b5ee88bbb7398.jpg', '2016-01-12 12:27:52'),
(132, 32, 61, '', '10872eefdaef6ca2c24b5ee88bbb7398.jpg', '2016-01-12 12:27:52'),
(133, 32, 61, '', '2d52ae1a1fe671324132a63faf4b6d9b.jpg', '2016-01-12 12:28:11'),
(134, 32, 61, '', '2d52ae1a1fe671324132a63faf4b6d9b.jpg', '2016-01-12 12:28:11'),
(135, 32, 61, '', '2d52ae1a1fe671324132a63faf4b6d9b.jpg', '2016-01-12 12:28:16'),
(136, 32, 61, '', '2d52ae1a1fe671324132a63faf4b6d9b.jpg', '2016-01-12 12:28:17'),
(137, 32, 61, '', '4812c20b0e24ef9c2e5d2881b0452626.jpg', '2016-01-12 12:28:37'),
(138, 32, 61, '', '4812c20b0e24ef9c2e5d2881b0452626.jpg', '2016-01-12 12:28:37'),
(139, 32, 62, '', 'eec6d651439e6d7fe16917ed00e20301.jpg', '2016-01-12 12:30:18'),
(140, 32, 62, '', '1825252f7379d7fcd17759b9f7494fd3.jpg', '2016-01-12 12:30:29'),
(141, 32, 62, '', '50974e162c409820a3bf2d4267dad31f.jpg', '2016-01-12 12:30:53'),
(142, 32, 62, '', 'e84f8d283b7b555659eb6f4e08a5b8be.jpg', '2016-01-12 12:31:13'),
(143, 32, 62, '', '850250c93c1fa39d2167060263aeea02.jpg', '2016-01-12 12:31:26'),
(144, 32, 62, '', '1a75b9f43f96d0bd6ddffcb817c3ebd1.jpg', '2016-01-12 12:31:42'),
(145, 32, 62, '', 'c03a7cbc7d2b9c83316900c1f8688c41.jpg', '2016-01-12 12:31:55'),
(146, 32, 62, '', '6ff0c1164c4d12198993d3091fcd155b.jpg', '2016-01-12 12:32:08'),
(147, 32, 63, '', '07627c8aabb34d071069c27f61cf9896.jpg', '2016-01-12 12:34:01'),
(148, 32, 63, '', 'd261ffe1fd38776ff8faee70ecf0c6ca.jpg', '2016-01-12 12:34:12'),
(149, 32, 63, '', '1efdc3df8887f28ef94cc85297b503d8.jpg', '2016-01-12 12:34:22'),
(150, 32, 63, '', '2826b112b28da777fce21b3c88b0c493.jpg', '2016-01-12 12:34:32'),
(151, 32, 63, '', '8bbf8cc2c76595822a2cae575e2fa6ba.jpg', '2016-01-12 12:34:40'),
(152, 32, 63, '', 'e9c7b758f91096c3fdfed3479b270145.jpg', '2016-01-12 12:34:49'),
(153, 32, 63, '', 'dec33b1ac71964eaa0a407b23f78e7fa.jpg', '2016-01-12 12:35:00'),
(154, 32, 63, '', '74ad0239059107561c25732d7a31d1b2.jpg', '2016-01-12 12:35:08'),
(155, 32, 63, '', '30606561bc2f3e2c3866b6a8f47b8e21.jpg', '2016-01-12 12:35:20'),
(156, 32, 64, '', '7b16cb48acd6415293771bf8fde26e9a.jpg', '2016-01-12 12:36:13'),
(157, 32, 64, '', '313d1c4c4b0a088d6ce8a3121c37d12b.jpg', '2016-01-12 12:36:24'),
(158, 32, 64, '', '7f461d9d8b017ae098dec99add075c63.jpg', '2016-01-12 12:36:34'),
(159, 32, 64, '', 'b9251b7c7d4de34acf28dbe32435749d.jpg', '2016-01-12 12:36:47'),
(160, 32, 64, '', '42aa0713802e5b31cbc98a34054ef9a4.jpg', '2016-01-12 12:36:58'),
(161, 32, 64, '', '8a40a89e61977bd00e92bdb7825ca716.jpg', '2016-01-12 12:37:09'),
(162, 32, 64, '', '6fb3036346536fda79759277574bea8e.jpg', '2016-01-12 12:37:38'),
(163, 32, 61, '', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2016-01-12 20:42:30'),
(164, 32, 61, '', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2016-01-12 20:42:37'),
(165, 32, 61, '', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2016-01-12 20:42:39'),
(166, 32, 61, '', '95267a7651a107e6f76eb0be4ca0c501.jpg', '2016-01-12 20:42:41'),
(167, 13, 67, 'NewsOfTheDay', '7060d3bbbef0a28e7631508c3d25f45f.jpg', '2016-01-13 05:42:30'),
(168, 13, 67, 'Small-Block', 'e0cf7b9b75449cfd952f385ce3529f18.jpg', '2016-01-13 05:42:30'),
(169, 13, 67, 'Small-Block1', '2496c21f89a30417d4ff907028a4cc7f.jpg', '2016-01-13 05:42:31'),
(170, 13, 67, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 05:42:31'),
(171, 13, 67, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 05:42:31'),
(172, 13, 68, '01373914', '0877d4e9cc6940745886841b5bfbb6bd.jpg', '2016-01-13 05:49:26'),
(173, 13, 68, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 05:49:26'),
(174, 13, 68, '1404485426_kak-nauchitsya-breyk-dansu', 'caa5b53a70b180eafca18caee902e5c3.jpg', '2016-01-13 05:49:26'),
(175, 13, 68, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 05:49:26'),
(176, 13, 68, 'brake_dance', '83da2c5ed445e5190705dd4d1121b033.jpg', '2016-01-13 05:49:26'),
(177, 13, 69, 'brake_dance - копия', '24c2ad9798c61da898d369af64179120.jpg', '2016-01-13 05:59:37'),
(178, 13, 69, 'brake_dance', '83da2c5ed445e5190705dd4d1121b033.jpg', '2016-01-13 05:59:37'),
(179, 13, 69, 'Break-Dance', '058acf9808f776a6d89bbd8ba288293b.jpg', '2016-01-13 05:59:37'),
(180, 13, 69, 'images - копия', '7f82b4e2d9e8cef5db00d44fd4d147b7.jpg', '2016-01-13 05:59:37'),
(181, 13, 69, 'Layer-70 - копия', 'd2bd154fdbef744d4a9665095bc0dfd1.jpg', '2016-01-13 05:59:37'),
(182, 13, 69, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 05:59:37'),
(183, 13, 69, '- копия', '82115342dbf3892cfb4856d40c5a8300.jpg', '2016-01-13 05:59:37'),
(184, 13, 70, '01373914', '0877d4e9cc6940745886841b5bfbb6bd.jpg', '2016-01-13 06:09:17'),
(185, 13, 70, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:09:17'),
(186, 13, 70, '1404485426_kak-nauchitsya-breyk-dansu', 'caa5b53a70b180eafca18caee902e5c3.jpg', '2016-01-13 06:09:17'),
(187, 13, 70, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:09:17'),
(188, 13, 70, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:09:17'),
(189, 13, 70, 'images', '59b514174bffe4ae402b3d63aad79fe0.jpg', '2016-01-13 06:09:17'),
(190, 13, 70, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:09:17'),
(191, 13, 71, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:16:14'),
(192, 13, 71, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:16:14'),
(193, 13, 71, 'Group-4', '0f9c877287e60f57628a31351f1525b0.jpg', '2016-01-13 06:16:14'),
(194, 13, 71, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:16:14'),
(195, 13, 71, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 06:16:15'),
(196, 13, 71, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 06:16:15'),
(197, 13, 72, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:19:58'),
(198, 13, 72, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:19:58'),
(199, 13, 72, 'Break-Dance', '058acf9808f776a6d89bbd8ba288293b.jpg', '2016-01-13 06:19:58'),
(200, 13, 72, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:19:58'),
(201, 13, 72, 'Layer-70 - копия', 'd2bd154fdbef744d4a9665095bc0dfd1.jpg', '2016-01-13 06:19:59'),
(202, 13, 72, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:19:59'),
(203, 13, 73, 'Break-Dance', '058acf9808f776a6d89bbd8ba288293b.jpg', '2016-01-13 06:24:59'),
(204, 13, 73, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:24:59'),
(205, 13, 73, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 06:24:59'),
(206, 13, 73, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 06:24:59'),
(207, 13, 74, 'Break-Dance', '058acf9808f776a6d89bbd8ba288293b.jpg', '2016-01-13 06:28:31'),
(208, 13, 74, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:28:31'),
(209, 13, 74, 'Group-4', '0f9c877287e60f57628a31351f1525b0.jpg', '2016-01-13 06:28:32'),
(210, 13, 74, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:28:32'),
(211, 13, 74, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 06:28:32'),
(212, 13, 75, 'Layer-66', 'ac7ef8ee28b378038ef597a5a297b560.jpg', '2016-01-13 06:31:09'),
(213, 13, 75, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 06:31:09'),
(214, 13, 75, '- копия', '82115342dbf3892cfb4856d40c5a8300.jpg', '2016-01-13 06:31:09'),
(215, 13, 76, '1404485426_kak-nauchitsya-breyk-dansu', 'caa5b53a70b180eafca18caee902e5c3.jpg', '2016-01-13 06:34:32'),
(216, 13, 76, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:34:32'),
(217, 13, 76, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:34:32'),
(218, 13, 76, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 06:34:33'),
(219, 13, 76, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 06:34:33'),
(220, 13, 77, '01373914', '0877d4e9cc6940745886841b5bfbb6bd.jpg', '2016-01-13 06:37:08'),
(221, 13, 77, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:37:08'),
(222, 13, 77, 'Layer-66', 'ac7ef8ee28b378038ef597a5a297b560.jpg', '2016-01-13 06:37:08'),
(223, 13, 77, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 06:37:08'),
(224, 13, 77, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 06:37:08'),
(225, 13, 78, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:40:15'),
(226, 13, 78, 'Group-4', '0f9c877287e60f57628a31351f1525b0.jpg', '2016-01-13 06:40:16'),
(227, 13, 78, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 06:40:16'),
(228, 13, 78, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 06:40:16'),
(229, 13, 78, '', 'd41d8cd98f00b204e9800998ecf8427e.jpg', '2016-01-13 06:40:16'),
(230, 13, 79, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:46:21'),
(231, 13, 79, 'images - копия', '7f82b4e2d9e8cef5db00d44fd4d147b7.jpg', '2016-01-13 06:46:21'),
(232, 13, 79, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:46:21'),
(233, 13, 80, '01373914', '0877d4e9cc6940745886841b5bfbb6bd.jpg', '2016-01-13 06:48:47'),
(234, 13, 80, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:48:47'),
(235, 13, 80, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:48:47'),
(236, 13, 80, 'Layer-70', '7b3dfa696a9892d9168ba15fa4eacabe.jpg', '2016-01-13 06:48:48'),
(237, 13, 80, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:48:48'),
(238, 13, 81, '1404485426_kak-nauchitsya-breyk-dansu', 'caa5b53a70b180eafca18caee902e5c3.jpg', '2016-01-13 06:51:21'),
(239, 13, 81, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:51:21'),
(240, 13, 81, 'm900fa72c05f7re21e43g', '7bc30465e18bec345523c7d84fe665c9.jpg', '2016-01-13 06:51:21'),
(241, 13, 81, 'tancfgrht2', '6a93616617d8c08ce1becadd0c12e95c.jpg', '2016-01-13 06:51:21'),
(242, 13, 81, '- копия', '82115342dbf3892cfb4856d40c5a8300.jpg', '2016-01-13 06:51:22'),
(243, 13, 82, '1356614322', 'b0a1b7d2622355050b08c51c072600d4.jpg', '2016-01-13 06:54:00'),
(244, 13, 82, '1404485426_kak-nauchitsya-breyk-dansu', 'caa5b53a70b180eafca18caee902e5c3.jpg', '2016-01-13 06:54:00'),
(245, 13, 82, 'a_99431ff7', 'a44c6504bca53b211d5ffcd9986d110e.jpg', '2016-01-13 06:54:00'),
(246, 13, 82, 'images - копия', '7f82b4e2d9e8cef5db00d44fd4d147b7.jpg', '2016-01-13 06:54:00'),
(247, 13, 83, 'brake_dance', '83da2c5ed445e5190705dd4d1121b033.jpg', '2016-01-13 06:57:06'),
(248, 13, 83, 'Break-Dance', '058acf9808f776a6d89bbd8ba288293b.jpg', '2016-01-13 06:57:06'),
(249, 13, 83, 'fotografii-breyk-dans_18', '9aa42dc0de19d5aa284ac9bad24a9f14.jpg', '2016-01-13 06:57:06'),
(250, 13, 83, 'Layer-64', '6cfd5d6de69b505eaa763bc518147282.jpg', '2016-01-13 06:57:07'),
(251, 13, 83, 'tancfgrht2 - копия', '3612776ac9728e2d0ae006bfccc146ce.jpg', '2016-01-13 06:57:07'),
(252, 13, 84, 'maxresdefault', 'a43683d33b40f413228d54e3c6ed4a2f.jpg', '2016-01-13 07:56:42'),
(253, 13, 85, 'P-20131130-00133_HiRes-JPEG-24bit-RGB-News', 'e6af4cd8147a980b9fee67276c510335.jpg', '2016-01-13 08:05:10'),
(254, 25, 86, '1', '6a3e5eb3cf8edc172da997bd2c36f5b7.jpg', '2016-01-14 05:03:10'),
(255, 13, 87, 'werw', 'b9ce1d52baba8af8876ef6a6d0c5a0cb.jpg', '2016-01-14 05:41:14'),
(256, 13, 87, 'werwwrw', 'e8fd43826cb0ce2133853e9fc940df4f.jpg', '2016-01-14 05:41:21'),
(257, 13, 87, 'werwwrw', 'bb79a567ed36f004a4223bb8a4634f52.jpg', '2016-01-14 05:41:31'),
(278, 25, 86, '111', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-15 09:14:47'),
(279, 25, 86, '111', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-15 09:14:50'),
(280, 25, 86, '111', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-15 09:14:53'),
(281, 25, 86, '111', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-15 09:14:55'),
(282, 25, 86, '111', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-15 09:14:57'),
(285, 14, 32, '', '0848d9f763cab88f724364a839165b05.jpg', '2016-01-17 10:59:21'),
(294, 36, 92, 'ЛЕХУС', '7703ff60158c5693160b1cfa3b0dcd1d.jpg', '2016-01-17 22:51:28'),
(295, 36, 92, '', '22707d72e14892e88ac614520b7baedf.jpg', '2016-01-17 22:57:48'),
(296, 36, 92, '', '1fd49542a8a32840f9919a01a101ff37.jpg', '2016-01-17 22:57:55'),
(297, 36, 92, '', '48963b129e18b1e0e646482e5b4fc685.jpg', '2016-01-17 22:58:19'),
(299, 34, 93, '', '1747a8a2825b4d420a9a150dad1d43e8.jpg', '2016-01-18 12:14:26'),
(301, 33, 102, '', '56f953582638732859e76d53d48da543.jpg', '2016-01-19 12:39:29'),
(302, 33, 103, '1-12-730x481', 'f43521b469e886918db1687812885737.jpg', '2016-01-20 08:29:29'),
(304, 34, 93, '', 'd443daeb7d84e1fdeeab419b664ad274.jpg', '2016-01-21 04:04:51'),
(305, 34, 108, '', '97a10a48ba2449c14346c83db4e37a3c.jpg', '2016-01-21 04:08:07'),
(306, 34, 107, '', '428442f7f0186bb35eb8b4c0ad192f09.jpg', '2016-01-21 04:08:16'),
(307, 34, 106, '', '2a421ca58f8f0dc7a5f0590b2d42823f.jpg', '2016-01-21 04:08:26'),
(308, 34, 105, '', 'c343938b13ea5235a380a92ba3b4aad2.jpg', '2016-01-21 04:08:36'),
(309, 34, 104, '', 'e4b0790b0159d5ba883b237aad1834f0.jpg', '2016-01-21 04:08:47'),
(310, 34, 108, '', '0567484ee507f79e65bc950663b23646.jpg', '2016-01-21 04:08:59'),
(311, 34, 108, '', '40092e576fd02237314b9d30f015c31b.jpg', '2016-01-21 04:09:17'),
(313, 33, 102, '', 'c42fdd48cc304ffee5febd86ce7b5897.jpg', '2016-01-21 13:01:20'),
(315, 33, 102, '', '8ba8c5f7175b1ec3c8e5e08806377f24.jpg', '2016-01-21 13:02:27'),
(319, 33, 102, '', 'd77cb3fa870572e80c9dc86e70336144.jpg', '2016-01-21 13:02:54'),
(337, 14, 111, '1', 'e742d2df8d8c03e43669615b242db183.jpg', '2016-01-27 04:55:00'),
(338, 14, 111, '2', 'cf3434ec109a81f625ac377ede088e1c.jpg', '2016-01-27 04:55:00'),
(339, 14, 111, '2_z', 'bc42ca8157479a4b52d2514d00a37bbd.jpg', '2016-01-27 04:55:00'),
(340, 14, 111, '4_okna_1', '7262a88183f84214c5b8d4d6c54b9b7b.jpg', '2016-01-27 04:55:00'),
(341, 14, 111, '5', '2a624d22db66bc6be24428f49b4ce93f.jpg', '2016-01-27 04:55:01'),
(342, 14, 111, '5-1010x400', '2fb2ca140cdfdec9324818486a2f8689.jpg', '2016-01-27 04:55:01'),
(343, 14, 111, '006-vostorg-zala-ot-vyistupleniya', 'def5bff72991499a00c9c00fc89421ef.jpg', '2016-01-27 04:55:01'),
(344, 14, 112, '2', '46af1ad4d2f60a6ceb2974fb76198638.jpg', '2016-01-27 05:00:22'),
(345, 14, 112, '2_z', 'e76cf94ee62a1de4bed1846a3270b4db.jpg', '2016-01-27 05:00:22'),
(346, 14, 112, '4_okna_1', '04285113ca88c9ab19e235f0b929b8e8.jpg', '2016-01-27 05:00:23'),
(347, 14, 112, '5', '100d4154de4f0d6733b8aee13721997b.jpg', '2016-01-27 05:00:23'),
(348, 14, 112, '5-1010x400', '00f3b786f8aa6e1cfe7edd3fe845a0e8.jpg', '2016-01-27 05:00:23'),
(349, 14, 112, '006-vostorg-zala-ot-vyistupleniya', '42a778aec972558660f6586cf7866544.jpg', '2016-01-27 05:00:23'),
(350, 14, 113, '2_z', '7fc205c83e6888ae179696467dd3c505.jpg', '2016-01-27 05:04:41'),
(351, 14, 113, '4_okna_1', '09baaa2a0a9a532cab6424c2bc33fd9c.jpg', '2016-01-27 05:04:42'),
(352, 14, 113, '5', '9c008d772224ce2409456e63d82150e4.jpg', '2016-01-27 05:04:42'),
(353, 14, 113, '5-1010x400', '1a327cc12514cb9ae7983613ae159a88.jpg', '2016-01-27 05:04:42'),
(354, 14, 113, '006-vostorg-zala-ot-vyistupleniya', '96108d3a246b0276311ae9b5392d98fc.jpg', '2016-01-27 05:04:42'),
(355, 14, 113, '69437-i13336-1010x400', 'bbdca2e5ae50e7958bfbc63666c30dfc.jpg', '2016-01-27 05:04:42'),
(356, 14, 114, '1', '520e2aabffb1172c94d5073c87986a89.jpg', '2016-01-27 05:09:20'),
(357, 14, 114, '2', '0ade35230c89880b8b5efa327d366b7e.jpg', '2016-01-27 05:09:20'),
(358, 14, 114, '2_z', '3ccb2676211df16c6327cd14a4c052b2.jpg', '2016-01-27 05:09:20'),
(359, 14, 114, '4_okna_1', '7741143089808d735d092970eb3313f0.jpg', '2016-01-27 05:09:20'),
(360, 14, 114, '5', '72149a505efd5761dd22788d6f891c00.jpg', '2016-01-27 05:09:20'),
(361, 14, 114, '5-1010x400', '9a8b942ee8de6e756344c2c26e50dc35.jpg', '2016-01-27 05:09:20'),
(362, 14, 115, 'Roamer_slider3_web', '7a55f7397b9c598d257758ecd5e403a9.jpg', '2016-01-27 05:11:52'),
(363, 14, 115, 'slide2-1010x400', '44ae883cfcc328890ff7adc7a5f5b1b8.jpg', '2016-01-27 05:11:52'),
(364, 14, 115, 'slide3 (1)', 'd26ac56a49a47cac391f03d1a781f3f7.jpg', '2016-01-27 05:11:52'),
(365, 14, 115, 'slide3', '2e244aa36e408fa82cc3ea25cf30bce3.jpg', '2016-01-27 05:11:52'),
(366, 14, 115, 'slide3-1010x400', '0abdd3abac3a86fccfd5ef2c0d59e47f.jpg', '2016-01-27 05:11:53'),
(367, 14, 115, 'slide31', 'a8b335de7dc8817cf23f38849d74b3e0.jpg', '2016-01-27 05:11:53'),
(368, 14, 116, 'slide3 (1)', '0e2dcd9c60f2f02dfd9e09b7da58dba9.jpg', '2016-01-27 05:13:22'),
(369, 14, 116, 'slide3', 'a9248f49463f5a5f9e6c9400d9875072.jpg', '2016-01-27 05:13:22'),
(370, 14, 116, 'slide3-1010x400', '6221c06be02b0d7571f69715bd9bf106.jpg', '2016-01-27 05:13:22'),
(371, 14, 116, 'slide31', 'a77cd2d6f2e9e51db32c620e5ca5ae4b.jpg', '2016-01-27 05:13:22'),
(372, 14, 116, 'venicesyndrome-1010x400-13934988821', 'ffb01bcb20ccfe1765cad4370e4f354e.jpg', '2016-01-27 05:13:22'),
(373, 14, 116, 'xalo_1-1010x400', 'b2e4ac5d164fe9a85f0c659dfc4ed524.jpg', '2016-01-27 05:13:23'),
(374, 14, 117, 'Hydrangeas', '958faaa6d32c4c54ee6068f8e8681ac6.jpg', '2016-02-01 08:01:44'),
(375, 14, 118, '5ydf6c-x2b', '1aeba8fb8df8773f97a7d407e5dbc970.jpg', '2016-02-01 08:03:42'),
(376, 14, 118, '49436230f02b95ce11f903fc8f683936', 'adaaeffbb75ffd03efd04b0c428421f2.jpg', '2016-02-01 08:03:42'),
(377, 14, 118, 'Chrysanthemum', '2061c9f063def890e4622ff7adec5905.jpg', '2016-02-01 08:03:43'),
(378, 14, 118, 'Desert', 'ac5e421c168c8c865a233c1cb725c1cb.jpg', '2016-02-01 08:03:43'),
(379, 14, 118, 'Hydrangeas', '710c4c79e0735c1a8a3e67c870caf6d3.jpg', '2016-02-01 08:03:43'),
(380, 14, 119, 'Chrysanthemum', '41f26d4648a0e3add3eecff2e5ff6330.jpg', '2016-02-01 08:06:14'),
(381, 14, 120, '111', 'e90a5ee4d28c31cb807f34f2db2bd355.jpg', '2016-02-01 08:10:16'),
(382, 14, 120, '112', '40c123e763149e5c424c6f4aab39dc22.jpg', '2016-02-01 08:10:16'),
(383, 14, 120, '1200', '29d061da3dace8679a21764262097c94.jpg', '2016-02-01 08:10:16'),
(384, 14, 120, 'barca', '989b64c20d482dd11025502bcff05419.jpg', '2016-02-01 08:10:16'),
(385, 14, 120, 'barca1', '7cb84b4449e7b39bc65f0dac5d1adff1.jpg', '2016-02-01 08:10:16'),
(386, 14, 121, '111', 'c5b4acdfb37c01006d25961f20ec77ae.jpg', '2016-02-01 08:11:33'),
(387, 14, 121, '112', 'ce8c3ab618c19a64f36d19d6d3be06de.jpg', '2016-02-01 08:11:33'),
(388, 14, 121, '1200', '7e3cbca3ead3578f4ec4858e0d319dc1.jpg', '2016-02-01 08:11:33'),
(389, 14, 121, 'barca', '62bdc416e95537050656e36e78acfabf.jpg', '2016-02-01 08:11:33'),
(390, 14, 121, 'barca1', 'c1c3730f91286776da7a80783db0c383.jpg', '2016-02-01 08:11:34'),
(391, 14, 122, '6cd8d722a2b35f05e218f0259a797687', '6f871e62c342b87bef59507d32237171.jpg', '2016-02-01 08:22:52'),
(392, 14, 122, '8c36ca2397449b135a4a8e9f621b95b3', '7fc4f62d59f6048067184da5467126f5.jpg', '2016-02-01 08:22:52'),
(393, 14, 122, '375ac9f285722fecf85a982dbfa67c30', '744c6e9c4b51c1b4f0edfe79c61b3b7b.jpg', '2016-02-01 08:22:52'),
(394, 14, 123, '1452013361_kartinki-12', '7f56a42bded1c194d25de8f5b9e9e1c4.jpg', '2016-02-01 08:26:33'),
(395, 14, 123, 'av-492040', 'cacbd08cfec58fa1c06388bab7d1f84d.jpg', '2016-02-01 08:26:33'),
(396, 14, 123, 'cvadr1', '4af54c8e20623ad25e408fe5b706c4df.jpg', '2016-02-01 08:26:33'),
(397, 14, 123, 'fqXq_LgbVC0', '5de559018014f89b8ef52ce08a0a6496.jpg', '2016-02-01 08:26:34'),
(398, 14, 123, 'img', '05783482f746ac88a60268093843f73f.jpg', '2016-02-01 08:26:34'),
(399, 14, 123, 'файлы', 'e96fe53556fbd1a54b4c33e0fc5d4355.jpg', '2016-02-01 08:26:34'),
(403, 33, 125, '', '45063ae9b3ed92b16548c73bca7c0064.jpg', '2016-02-02 19:47:11'),
(407, 14, 127, '111', 'dd14749d7c7dcaef04b8cfa8ab557942.jpg', '2016-02-08 11:32:27'),
(408, 14, 127, '112', '194118444db6da3a74b0756682b8a9a0.jpg', '2016-02-08 11:32:27'),
(409, 14, 127, '1200', 'bdb569357d9d0f210f3fef56ed563312.jpg', '2016-02-08 11:32:27'),
(410, 14, 127, 'barca', '8f4211d3b22c28b26c08d94175497ee1.jpg', '2016-02-08 11:32:27'),
(411, 14, 127, 'barca1', 'e6b8755883206398b38ffabfa3f8dfdc.jpg', '2016-02-08 11:32:27'),
(412, 14, 127, '', '6266e8eda000a93e023185a3d837c164.jpg', '2016-02-08 11:32:27'),
(413, 14, 127, '1', '5a9fa8c3be28afb4e6d1c4940a9a5afa.jpg', '2016-02-08 11:32:28'),
(414, 14, 127, '2', '758c13098d0ddc77ccb66616b2d8da37.jpg', '2016-02-08 11:32:28'),
(415, 14, 128, '111', '61a6ba47c945310e2920f6dd296cecbd.jpg', '2016-02-08 11:35:09'),
(416, 14, 128, '112', '264ba7f59360afdc124fc46cb79d3b04.jpg', '2016-02-08 11:35:09'),
(417, 14, 128, '1200', 'a0d256c399431b31d08b528b9073ea24.jpg', '2016-02-08 11:35:09'),
(418, 14, 128, 'barca', 'ef150572eed254ec32c14d5909e418a0.jpg', '2016-02-08 11:35:09'),
(419, 14, 128, 'barca1', '99e057f7255437f41e409ad8fd0cc607.jpg', '2016-02-08 11:35:09'),
(420, 14, 128, '', '9f05b19646625125730abaf6bd4bd5cf.jpg', '2016-02-08 11:35:09'),
(421, 14, 128, '1', 'bf103765193322f27bb5c3b33ac242b5.jpg', '2016-02-08 11:35:10'),
(422, 14, 128, '2', '3f939f9cbff0ea816aa7b4bfaf7b6c15.jpg', '2016-02-08 11:35:10'),
(424, 14, 32, '', '079c7c9717235cfc4cc2525d114af6ed.jpg', '2016-02-09 07:20:31'),
(425, 14, 32, '', '65610c575cd74b1261a74be57207c4e7.jpg', '2016-02-09 07:20:39'),
(426, 14, 32, '', '7b7e64b83e7988215e8d534253745f7b.jpg', '2016-02-09 07:20:46'),
(427, 14, 32, '', '5e66ab7c3a674f8ed8c6a5c23508c204.jpg', '2016-02-09 12:30:03'),
(428, 14, 32, '', '80dc2104995c655d579ae532dde1bc92.jpg', '2016-02-09 12:30:07'),
(429, 14, 32, '', '1b0f8e2f0a57c553635a49e59cadffbb.jpg', '2016-02-09 12:30:08'),
(430, 14, 32, '', '34a202eb6abedc96475d3044134844b8.jpg', '2016-02-09 12:34:15'),
(431, 14, 129, '', '2cea5ee8917b44ef8a4be038977c7ef3.jpg', '2016-02-09 12:34:49'),
(445, 38, 110, 'лаба', 'aab050fe6920cfd787791e0010d550f3.jpg', '2016-02-22 16:34:11'),
(446, 38, 110, 'оно', '739fc164a3e1f23578808e48e94a5878.jpg', '2016-02-22 16:35:20'),
(447, 38, 110, 'оно', '739fc164a3e1f23578808e48e94a5878.jpg', '2016-02-22 16:35:20'),
(451, 33, 132, '', 'ef68a66550bbd1d51226dad4941d3d7f.jpg', '2016-03-02 17:05:44'),
(453, 33, 137, '', 'f02928db796d7315b8347a5ba3a1abdf.jpg', '2016-03-18 12:09:46'),
(463, 38, 140, '', '7386cf49f7ce6539893fdfef74501edb.jpg', '2016-03-27 09:51:33'),
(469, 83, 156, '', '48e23ee26731d18ddb41d2a4ea959bb6.jpg', '2016-04-04 17:03:06'),
(473, 84, 161, '', 'd25a70f26ca22a483038beed2f6b1a8f.jpg', '2016-04-06 16:58:05'),
(474, 33, 165, 'avengers', '23cb3d8639aeba411b383bf5b991c895.jpg', '2016-04-13 15:28:36'),
(475, 33, 166, 'cinema-player2', 'bfc10f023c4c09a97c1ffa3b020c247e.jpg', '2016-04-13 15:50:14'),
(486, 14, 171, '', 'dceed970539857ce7c93f4b2a41dce07.jpg', '2016-04-21 04:47:33'),
(515, 14, 174, '', '19c27aa84b95947e9123e9ff649b313d.jpg', '2016-04-21 17:56:29'),
(516, 14, 174, '', '19c27aa84b95947e9123e9ff649b313d.jpg', '2016-04-21 17:56:30'),
(517, 14, 174, '', '600145e39c20b17e5316d1759ea3ff20.jpg', '2016-04-21 17:56:30'),
(518, 14, 174, '', '600145e39c20b17e5316d1759ea3ff20.jpg', '2016-04-21 17:56:31'),
(519, 14, 174, '', '2fa398aacb161bedd6d529e8e93dbf85.jpg', '2016-04-21 17:56:31'),
(521, 33, 175, '', '07bc169101178bd4a047f80547b80162.jpg', '2016-04-21 19:28:54'),
(522, 33, 175, '', 'fa67e746b1747d171f4901512673d4d0.jpg', '2016-04-21 19:29:20'),
(523, 33, 175, '', 'fa67e746b1747d171f4901512673d4d0.jpg', '2016-04-21 19:29:21'),
(524, 33, 175, '', '39b19a3628f09b16f16514a7460a8485.jpg', '2016-04-21 19:29:21'),
(525, 33, 175, '', '39b19a3628f09b16f16514a7460a8485.jpg', '2016-04-21 19:29:22'),
(526, 33, 175, '', '6169a542cb9e8e3f65267a7687215997.jpg', '2016-04-21 19:29:32'),
(527, 33, 175, '', '6169a542cb9e8e3f65267a7687215997.jpg', '2016-04-21 19:29:33'),
(528, 33, 175, '', 'ec2df47ee62adfabca2aa1cecab0750c.jpg', '2016-04-21 19:29:33'),
(529, 33, 175, '', 'ec2df47ee62adfabca2aa1cecab0750c.jpg', '2016-04-21 19:29:33'),
(530, 14, 129, '', '1e4b93e1ae31ec69045581c647ac0100.jpg', '2016-04-21 19:31:01'),
(534, 33, 175, '', '8bff08468afc14870dfb0562b13c22cf.jpg', '2016-04-21 19:33:54'),
(535, 33, 175, '', '83a251fc281eb04f35b967c453e16c0d.jpg', '2016-04-21 19:34:08'),
(536, 33, 175, '', '510fddcdf943533d355008be94ec6942.jpg', '2016-04-21 19:34:15'),
(537, 33, 175, '', '7a164635ed061f3fd51bfe5fae95490c.jpg', '2016-04-21 19:34:19'),
(538, 33, 175, '', '86fe99ad52f53b63ebbbd166b27aa2f2.jpg', '2016-04-21 19:34:27'),
(539, 33, 176, '', '8cc5520db0ed71efa1727889efbbb201.jpg', '2016-04-21 19:35:29'),
(540, 33, 176, '', '73b4bd4137337546f7f901a81ef1cc7e.jpg', '2016-04-21 19:35:36'),
(541, 33, 176, '', '01049fc481140a3f498a40a1245d79eb.jpg', '2016-04-21 19:35:43'),
(542, 33, 176, '', '97dcb01a0626fede9389b246de2dd38a.jpg', '2016-04-21 19:35:52'),
(543, 33, 176, '', '94b0fa958c207bb77dd37992f5263fcf.jpg', '2016-04-21 19:36:00'),
(544, 33, 176, '', '0725b486b353871fecf6956b2711a8a8.jpg', '2016-04-21 19:36:22'),
(546, 33, 176, '', '0e5ce77b1a3729d18c4bf66b054ae6bd.jpg', '2016-04-21 19:37:16'),
(558, 93, 170, '', '2ff79447016ee73ef76f1624d71d38a7.jpg', '2016-04-22 16:38:15'),
(559, 93, 170, '', 'f5470b4dff3f6ce07f6a15611ad78862.jpg', '2016-04-22 16:38:44'),
(564, 38, 177, '', '432cce31cdfe5284fc775634ed3f6e91.jpg', '2016-04-23 16:55:40'),
(565, 33, 176, '', '0b593c2c65d99358f039dd42d4f38db8.jpg', '2016-04-24 20:23:15'),
(566, 38, 186, '', 'e76dec19cd100e819814d498f5793d53.jpg', '2016-04-27 12:50:25'),
(567, 14, 188, '64555', 'b962a4bc239e2b3385f712314c78f5c4.jpg', '2016-04-27 21:28:32'),
(568, 14, 189, 'jK5bPHX7OZk', '04864c631717f8f579ac6d37bdf653d6.jpg', '2016-04-27 21:44:39'),
(569, 95, 190, '', 'bd3aab27e2e2cf4d9a12f6e3959b4d1c.jpg', '2016-04-27 22:10:56'),
(570, 14, 192, 'auto-cars-chevrolet', '87fcbdc66499ed3881cc1aa44baaf605.jpg', '2016-04-28 15:27:37'),
(571, 14, 193, 'marvel_ar_large_verge_medium_landscape', 'f6b476bedef36232806922b1f3dca99a.jpg', '2016-04-28 15:35:23'),
(572, 14, 194, 'auto-cars-chevrolet', 'e1dd3956310f622c4c03e5d6f694e4aa.jpg', '2016-05-03 18:59:09'),
(573, 14, 195, '-авто-Челенджер-олдскул-455832', '5ad9e0822f4285f8224e98bbca70e6c9.jpg', '2016-05-03 19:01:13'),
(574, 33, 196, 'slide4', '2aab1641dda50e4e8df3f1c463514aa7.jpg', '2016-05-03 19:04:21'),
(575, 33, 197, 'SpKL_J9WltxvIh1GIRbpWA', '88362fea853bf6c49e96a65fcd844b47.jpg', '2016-05-03 19:06:35'),
(576, 14, 198, 'SpKL_J9WltxvIh1GIRbpWA', 'cfd0b7c9371ee325e6576cac24fc8edd.jpg', '2016-05-03 20:08:42'),
(577, 14, 199, 'Penguins', '723858a6d332a210998a35c59c3a0762.jpg', '2016-05-03 20:38:04'),
(578, 14, 200, 'Hydrangeas', '5122e2b96f11141de3f3e71d39f81f40.jpg', '2016-05-03 20:58:54'),
(579, 33, 201, 'slide4', 'b05f7fcca0a248d1e8b79572da313a59.jpg', '2016-05-04 21:31:28'),
(580, 33, 202, '64555', '0ffc15bf50534dd57a5e8449c68cb919.jpg', '2016-05-04 21:35:46'),
(581, 33, 202, '-авто-Челенджер-олдскул-455832', '8fefcda55a119a336ab2154de6d6c3e3.jpg', '2016-05-04 21:35:46'),
(582, 33, 202, 'jK5bPHX7OZk', '169938ed9c38d19304744ab34159a15f.jpg', '2016-05-04 21:35:46'),
(583, 33, 202, 'marvel_ar_large_verge_medium_landscape', 'c0bc6cffb8bd104b49e7070bb3e9a1e9.jpg', '2016-05-04 21:35:47'),
(584, 33, 202, 'slide4', '06372f59ba0d4771167b46a8c4d980af.jpg', '2016-05-04 21:35:47'),
(585, 33, 202, 'SpKL_J9WltxvIh1GIRbpWA', '9f0462b82325746b4eb9a1d14f98010f.jpg', '2016-05-04 21:35:47'),
(587, 33, 191, '', '04a6f60ea8a77aa100e1b6ed8e1b20de.jpg', '2016-05-05 20:02:41'),
(588, 33, 176, '', 'aa55f785db7e4c0c9aa8e3a234846878.jpg', '2016-05-05 20:03:26'),
(589, 33, 176, '', '9096ad29ff109355b48898af10ae9baf.jpg', '2016-05-05 20:04:12'),
(592, 14, 205, '', '08b0de2948d02636cbb98aeccb40257f.jpg', '2016-05-06 08:43:45'),
(594, 14, 163, '', '5f3fb0dd542da9b815b02a1d23715fa6.jpg', '2016-05-06 12:09:56'),
(595, 33, 176, '', '18877dd0f60ff5e29000770d878dbea5.jpg', '2016-05-06 14:31:55'),
(596, 33, 176, '', '517f7e70c5eb3bd245c42cf7d104e2ca.jpg', '2016-05-06 14:32:03'),
(599, 33, 176, '', 'c6d34e2a6e629ca8ef5049c9644af542.jpg', '2016-05-06 19:38:31'),
(600, 14, 235, NULL, '1/6/7/590c8d3428910.jpg', '2017-05-05 14:33:24'),
(601, 14, 235, NULL, '4/3/7/590c8d342eaef.jpg', '2017-05-05 14:33:24');

-- --------------------------------------------------------

--
-- Структура таблицы `z_photoalbum`
--

CREATE TABLE `z_photoalbum` (
  `id` int(11) UNSIGNED NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privacy` int(11) NOT NULL DEFAULT '0',
  `cover` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_photoalbum`
--

INSERT INTO `z_photoalbum` (`id`, `user`, `name`, `url`, `text`, `created`, `privacy`, `cover`) VALUES
(1, 1, 'первый', 'pervyj', '', '2015-05-11 10:28:26', 0, NULL),
(2, 6, '1', '1', '1', '2015-05-11 16:54:51', 0, NULL),
(3, 5, '1', '1', 'поехали', '2015-05-12 04:46:23', 0, NULL),
(4, 8, 'тест', 'test', 'субару', '2015-05-13 14:03:20', 0, NULL),
(5, 5, 'еще альбом', 'eshhe-alibom', 'фото', '2015-05-15 16:28:18', 0, NULL),
(6, 9, 'test', 'test', 'test', '2015-05-17 14:46:33', 0, NULL),
(7, 10, 'asd', 'asd', 'asd', '2015-05-17 18:52:31', 0, NULL),
(8, 10, 'test', 'test', '23123', '2015-05-17 18:54:26', 0, NULL),
(9, 15, 'KULT', 'kult', 'Хипсы', '2015-08-12 06:59:38', 0, NULL),
(29, 24, 'Сова', 'sova', 'Совенок', '2015-12-09 12:35:46', 0, NULL),
(30, 24, 'Куку', 'kuku', 'ёта', '2015-12-09 12:42:22', 0, NULL),
(31, 6, 'первый тест', 'pervyj-test', 'первый тест первый тестпервый тест', '2015-12-10 09:07:42', 0, NULL),
(32, 14, 'Новый альбом', 'novyj-alibom', '', '2015-12-10 18:41:38', 1, 285),
(33, 20, 'первый альбом', 'pervyj-alibom', 'все', '2015-12-11 19:30:46', 0, NULL),
(34, 20, 'первый альбом', 'pervyj-alibom', 'все', '2015-12-11 19:30:48', 0, NULL),
(35, 20, 'первый альбом', 'pervyj-alibom', 'все', '2015-12-11 19:30:49', 0, NULL),
(38, 20, 'первый альбом', 'pervyj-alibom', 'все', '2015-12-11 19:30:50', 0, NULL),
(40, 20, 'jhkl', 'jhkl', 'hjk', '2015-12-14 09:48:17', 0, NULL),
(49, 25, 'мой альбом', 'moj-alibom', 'тестим', '2015-12-24 18:10:56', 0, NULL),
(50, 14, 'Танцы', 'tancy', 'Мы научим Вас двигать бедрами', '2016-01-11 11:34:02', 0, NULL),
(51, 14, 'Танцы', 'tancy', 'Мы научим Вас двигать бедрами', '2016-01-11 11:35:24', 0, NULL),
(52, 14, 'Танцы', 'tancy', 'Мы научим Вас двигать бедрами', '2016-01-11 11:53:16', 0, NULL),
(53, 14, 'Вечеринка Денса', 'vecherinka-densa', 'ВСЯ АФИША КИЕВА\r\nГде и когда\r\nКомментарии\r\nНовогодний ПентХаус Новогодний ПентХаус\r\nАФИША КИЕВА - КЛУБЫ\r\n13Комментировать  Напечатать читать позже\r\nFacebook Twitter Вконтакте Одноклассники\r\nDj Jaggy\r\n\r\nDj Leo\r\n\r\nMc Ujeen\r\n\r\nВход: до 00:00 Д.бесплатно, М: 20 грн,\r\n\r\nпосле 00:00 Д: 20 грн, М:30 грн.,\r\n\r\nПосле 04:00 вход свободный\r\n\r\nБесплатный вход (Club Money)\r\nЭто депозит, который можно потратить в баре)!', '2016-01-11 12:59:27', 0, NULL),
(54, 18, 'test', 'test', 'kdgaskjdasdasdas', '2016-01-11 13:04:17', 1, NULL),
(56, 31, 'Тлен', 'tlen', 'Места', '2016-01-12 08:31:36', 0, NULL),
(57, 32, 'Places', 'places', 'Where i wont to live', '2016-01-12 08:53:07', 0, NULL),
(58, 14, 'asdfsafd', 'asdfsafd', 'asdfasdfffffLorem Ipsum - це текст-"риба", що використовується в друкарстві та дизайні. Lorem Ipsum є, фактично, стандартною "рибою" аж з XVI сторіччя, коли невідомий друкар взяв шрифтову гранку та склав на ній підбірку зразків шрифтів. "Риба" не тільки успішно пережила пять століть, але й прижилася в електронному верстуванні, залишаючись по суті незмінною. Вона популяризувалась в 60-их роках минулого сторіччя завдяки виданню зразків шрифтів Letraset, які містили уривки з Lorem Ipsum, і вдруге - нещодавно завдяки програмам компютерного верстування на кшталт Aldus Pagemaker, які використовували різні версії Lorem Ipsum.', '2016-01-12 10:32:22', 0, NULL),
(59, 32, 'Новый альбом', 'novyj-alibom', 'новые фотки', '2016-01-12 12:11:03', 0, NULL),
(60, 32, 'еще один альбом', 'eshhe-odin-alibom', 'что-о новенькое', '2016-01-12 12:13:46', 0, NULL),
(61, 32, 'очередной', 'ocherednoj', 'сразу после', '2016-01-12 12:20:11', 0, NULL),
(62, 32, 'люблю фотки', 'ljublju-fotki', 'фоткаю все подрят', '2016-01-12 12:29:49', 0, NULL),
(63, 32, 'картинки', 'kartinki', 'веселые картинки', '2016-01-12 12:32:40', 0, NULL),
(64, 32, 'еще немножко', 'eshhe-nemnozhko', 'что еще', '2016-01-12 12:35:49', 0, NULL),
(65, 32, 'еще альбом', 'eshhe-alibom', '', '2016-01-12 20:15:38', 0, NULL),
(66, 32, 'и еще для теста', 'i-eshhe-dlja-testa', '', '2016-01-12 20:16:35', 0, NULL),
(67, 13, 'Лилу Скул', 'lilu-skul', 'Крутая школа в центре, но не слишком', '2016-01-13 05:42:30', 0, NULL),
(68, 13, 'Мега скул', 'mega-skul', 'Репетиции на лужайке', '2016-01-13 05:49:26', 0, NULL),
(69, 13, 'Батл Граунд', 'batl-graund', 'Рисуем деревья возле дуба', '2016-01-13 05:59:37', 0, NULL),
(70, 13, 'Студия танцулек', 'studija-tanculek', 'Это рыба, рыбы текст, рыба-рыб-ребешечка', '2016-01-13 06:09:17', 0, NULL),
(71, 13, 'Фристал скул', 'fristal-skul', 'Поем народные песни под балалайку в стиле бит-бокс', '2016-01-13 06:16:14', 0, NULL),
(72, 13, 'С боку стайл', 's-boku-stajl', 'пляски и песно-пение с озорными трубодурами', '2016-01-13 06:19:58', 0, NULL),
(73, 13, 'Наварро', 'navarro', 'Немного о нашей школе вы узнаете если прийдете на платную встречу с Серегой', '2016-01-13 06:24:59', 0, NULL),
(74, 13, 'детская школа ', 'detskaja-shkola', 'Учите детей МСить с самого детства', '2016-01-13 06:28:31', 0, NULL),
(75, 13, 'Вафелька', 'vafelika', 'Моя любимая тема, в том числе набирающая', '2016-01-13 06:31:08', 0, NULL),
(76, 13, 'Печеньки', 'pecheniki', 'сли вы являетесь поклонником плоского дизайна', '2016-01-13 06:34:32', 0, NULL),
(77, 13, 'Концерт Пугачевой', 'koncert-pugachevoj', 'Моя любимая тема, в том числе набирающая популярность', '2016-01-13 06:37:07', 0, NULL),
(78, 13, 'Танцы на природе', 'tancy-na-prirode', 'Самая гибкая персонализация в Sublime Text возможна с помощью тем и цветовых схем.', '2016-01-13 06:40:15', 0, NULL),
(79, 13, 'Темы и цветовые схемы', 'temy-i-cvetovye-shemy', ' стала самой популярной темой и самым лучшим примером кастомизации ', '2016-01-13 06:46:21', 0, NULL),
(80, 13, 'Тема: Soda', 'tema-soda', 'События сериала происходят в далёком будущем. Войны разделили Северную Америку на 4 части. ', '2016-01-13 06:48:47', 0, NULL),
(81, 13, 'Package Control', 'package-control', 'Git Gutter\r\nОдин из моих любимых плагинов. Git gutter это простой плагин, который ', '2016-01-13 06:51:21', 0, NULL),
(82, 13, 'Устанавливаем ее', 'ustanavlivaem-ee', 'SublimeLinter\r\nЭтот плагин добавляет проверку орфографии налету. Используя исчерпывающую документацию и огромный список правил SublimeLinter, вы убедитесь, что ваш код не содержит ошибок.', '2016-01-13 06:54:00', 0, NULL),
(83, 13, 'Сегодня мы поговорим', 'segodnja-my-pogovorim', 'Темы и цветовые схемы\r\n\r\nСамая гибкая персонализация в Sublime Text возможна с помощью тем и цветовых схем. На данный момент существуют сотни различных вариантов и каждую неделю появляются новые. Вот несколько стоящих.', '2016-01-13 06:57:06', 0, NULL),
(84, 13, 'Панда кунг-фу школа', 'panda-kung-fu-shkola', 'Самая гибкая персонализация в Sublime Text возможна с помощью тем и цветовых схем. На данный момент существуют сотни различных вариантов и каждую неделю появляются новые. Вот несколько стоящих.', '2016-01-13 07:56:42', 0, NULL),
(85, 13, 'Тортик', 'tortik', 'Цветовая схема: Solarized\r\nДовольно-таки известный проект Solarized доступен и для Sublime Text. Этот проект позиционируется как "аккуратные и точные цвета для машин и ', '2016-01-13 08:05:09', 0, NULL),
(86, 25, 'тест', 'test', '', '2016-01-14 05:02:33', 0, NULL),
(87, 13, 'rs', 'rs', 'fsdfdsgsd', '2016-01-14 05:40:48', 1, NULL),
(88, 20, 'Проба', 'proba', '1', '2016-01-14 05:43:18', 0, NULL),
(89, 20, 'пнор', 'pnor', 'про', '2016-01-14 05:43:34', 0, NULL),
(92, 36, 'Моя жизнь! ', 'moja-zhizni', 'Жизнь – моя', '2016-01-17 22:50:58', 0, NULL),
(93, 34, 'цйуцуц', 'cjucuc', '', '2016-01-18 12:14:13', 0, NULL),
(102, 33, 'шгроил', 'shgroil', '', '2016-01-19 12:38:21', 0, NULL),
(103, 33, 'Привет', 'privet', 'Описание событие, которое будет очень крутым. Описание событие, которое будет очень крутымОписание событие, которое будет очень крутымОписание событие, которое будет очень крутымОписание событие, которое будет очень крутымОписание событие, которое будет очень крутым', '2016-01-20 08:29:28', 0, NULL),
(104, 34, 'qwe', 'qwe', '', '2016-01-21 04:07:29', 0, NULL),
(105, 34, 'asd', 'asd', '', '2016-01-21 04:07:35', 0, NULL),
(106, 34, 'zxc', 'zxc', '', '2016-01-21 04:07:40', 0, NULL),
(107, 34, 'asdf', 'asdf', '', '2016-01-21 04:07:45', 0, NULL),
(108, 34, 'qqqw', 'qqqw', '', '2016-01-21 04:07:50', 0, NULL),
(111, 14, 'SOHO Fitness & Spa', 'soho-fitness-spa', 'Жизнь в ритме SOHO - это гармония души и тела!\r\nСовременный комплекс SOHO Fitness & SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.\r\nКомплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.\r\nПосле активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.\r\nОпределяйте для себя правильное направление вместе с SOHO - в ритме будущего!', '2016-01-27 04:55:00', 0, NULL),
(112, 14, 'Студия Танца «ART DREAM»', 'studija-tanca-art-dream', 'Почувствуй как ты изящна от природы, Не надо сомневаться! Просто начните. Приходите в танцевальный зал и начните работу над собой… Прислушайтесь к себе, будьте внимательны к своему телу…. Вы окажетесь в одном ряду с трудолюбивыми грациозными красотками, Вы — уже одна из них. Сегодня Вы в самом центре прекрасного, разгоряченая кровь бежит по венам, расцветает румянец на щеках, руки, ноги, шея будто стала длиннее, плечи раскрыты, музыка пронзает насквозь, наполняя душу вдохновением…. Это то, без чего больше уже не сможешь… 6 уютных и теплых зала в самом центре города Днепропетровска. Ждём новых людей в нашей танцевальной семье! Тренера Студии Танца Арт-Дрим найдут подход к каждому, кто действительно хочет танцевать и развиваться. Ждём новых людей в нашей танцевальной семье!', '2016-01-27 05:00:22', 0, NULL),
(113, 14, 'SOHO Fitness & Spa', 'soho-fitness-spa', 'Жизнь в ритме SOHO - это гармония души и тела!\r\nСовременный комплекс SOHO Fitness & SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.\r\nКомплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.\r\nПосле активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.\r\nОпределяйте для себя правильное направление вместе с SOHO - в ритме будущего!', '2016-01-27 05:04:41', 0, NULL),
(114, 14, 'Студия Танца «ART DREAM»', 'studija-tanca-art-dream', 'Жизнь в ритме SOHO - это гармония души и тела!\r\nСовременный комплекс SOHO Fitness & SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.\r\nКомплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.\r\nПосле активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.\r\nОпределяйте для себя правильное направление вместе с SOHO - в ритме будущего!', '2016-01-27 05:09:20', 0, NULL),
(115, 14, 'Студия Танца «ART DREAM»', 'studija-tanca-art-dream', 'Жизнь в ритме SOHO - это гармония души и тела!\r\nСовременный комплекс SOHO Fitness & SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.\r\nКомплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.\r\nПосле активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.\r\nОпределяйте для себя правильное направление вместе с SOHO - в ритме будущего!', '2016-01-27 05:11:52', 0, NULL),
(116, 14, 'SOHO Fitness & Spa', 'soho-fitness-spa', 'Жизнь в ритме SOHO - это гармония души и тела!\r\nСовременный комплекс SOHO Fitness & SPA - это место с неповторимой атмосферой, расположен в деловом сердце ТРЦ CASCADE PLAZA, на одном из самых красивых бульваров Днепропетровска.\r\nКомплекс создан по эксклюзивному архитектурному проекту и имеет уникальный дизайн, с выдержанным стилем и нотками роскоши. SOHO является заслуженным лидером в фитнес-индустрии сегмента "люкс" и "премиум", а оснащение клуба не имеет аналогов. Просторный тренажерный зал, который оборудован новейшими тренажерами от мирового лидера Technogym, студия для занятий популярными фитнес-программами и танцевальными направлениями. Каждая зона отдыха продумана до мелочей, от роскошной аквазоны с банным комплексом до профессионального SPA-центра, массажных кабинетов, солярия и центра красоты.\r\nПосле активных тренировок и тяжелых рабочих будней приглашаем Вас прекрасно провести время в уютном Roof-bar под открытым небом, с изысканными комплиментами от шеф-повара и дружеской атмосферой. Здесь Вас ждет совершенство во всех деталях с высочайшим качеством сервиса и комфорта.\r\nОпределяйте для себя правильное направление вместе с SOHO - в ритме будущего!', '2016-01-27 05:13:22', 0, NULL),
(117, 14, '"asfasf" \'fafasfd\'', 'asfasf-fafasfd', '"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'', '2016-02-01 08:01:44', 0, NULL),
(118, 14, '"asfasf" \'fafasfd\'', 'asfasf-fafasfd', '"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'"asfasf" \'fafasfd\'', '2016-02-01 08:03:42', 0, NULL),
(119, 14, '"asdfasf" \'asfasf\'', 'asdfasf-asfasf', '"asdfasf" \'asfasf\'"asdfasf" \'asfasf\'"asdfasf" \'asfasf\'"asdfasf" \'asfasf\'"asdfasf" \'asfasf\'"asdfasf" \'asfasf\'', '2016-02-01 08:06:13', 0, NULL),
(120, 14, 'alsfdhgblsdhfgblsdfg', 'alsfdhgblsdhfgblsdfg', 'suaudfgioseughoieuwartgouaewrtawert', '2016-02-01 08:10:15', 0, NULL),
(121, 14, 'alsfdhgblsdhfgblsdfg', 'alsfdhgblsdhfgblsdfg', 'suaudfgioseughoieuwartgouaewrtawert', '2016-02-01 08:11:33', 0, NULL),
(122, 14, 'RRRRR', 'rrrrr', 'Ð¤Ð«ÐÐ¤Ð«ÐÐ¤', '2016-02-01 08:22:52', 0, NULL),
(123, 14, 'Tru-lala', 'tru-lala', 'фывфыв фввйцйауцуацу цувй', '2016-02-01 08:26:33', 0, NULL),
(125, 33, 'Привет', 'privet', '', '2016-02-02 19:46:25', 0, NULL),
(126, 13, 'впаыывапфвфыа', 'vpayyvapfvfya', 'ФЫВАФЫВАФЫВАФЫВА', '2016-02-04 19:25:20', 0, NULL),
(127, 14, 'CoolSchool', 'coolschool', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mollis nulla nec sapien eleifend commodo. Donec lacus est, pellentesque a fermentum nec, rhoncus vitae erat. Vivamus pharetra, purus ut facilisis congue, nisl leo dictum nunc, in malesuada metus purus id lacus. In sollicitudin quam eu dolor ultrices, id finibus ligula vulputate. Vivamus feugiat varius sapien, vel condimentum libero ultrices sed. In sed orci turpis. Morbi cursus placerat ante, nec venenatis odio convallis tempus. Nullam gravida volutpat dui, nec accumsan velit posuere ut. Donec ut tellus nec eros venenatis egestas. Etiam eu dictum leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean sit amet nibh nec leo accumsan tristique.\r\n\r\nEtiam pellentesque odio et sapien tincidunt varius. Vestibulum ex ex, condimentum vel odio vel, faucibus ultrices ante. Maecenas a magna at turpis pretium interdum. Morbi risus velit, dapibus hendrerit molestie eget, sollicitudin ut arcu. Cras in dolor aliquam, interdum sem sed, ultricies nulla. Vestibulum nunc augue, mattis sodales erat vel, suscipit mattis velit. Phasellus et feugiat est.\r\n\r\nUt venenatis quam sit amet nulla mattis, et congue justo placerat. Ut sagittis mi libero, vel molestie sem placerat et. Suspendisse egestas tellus lacus, id vehicula libero efficitur ac. Duis placerat arcu nunc, vitae efficitur justo pharetra sed. Proin non fringilla diam. Nunc finibus tellus nec magna iaculis, nec interdum massa mollis. Maecenas gravida malesuada arcu accumsan vehicula. Aliquam auctor nisi in risus imperdiet luctus. Etiam lectus purus, dictum at sem et, ullamcorper sodales ante. Etiam in mauris finibus, commodo mauris a, finibus diam. Suspendisse et quam fermentum, suscipit ligula ut, gravida massa. Nulla in laoreet est, in vehicula libero. Sed eget massa sed nisi suscipit sollicitudin nec a lectus. Donec tincidunt quam vel pulvinar bibendum. Vestibulum volutpat eros sit amet ipsum sodales, sed ornare enim dignissim. Duis ac vulputate justo, vel eleifend felis.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean id dignissim mauris. Duis in nisi posuere odio gravida pharetra ac eu nulla. Ut tempor venenatis quam vitae eleifend. Pellentesque aliquet scelerisque sem at feugiat. Nam lobortis nunc vitae feugiat accumsan. Donec faucibus dolor non ligula volutpat facilisis. Vivamus at iaculis elit. Sed metus leo, tempus vel turpis eget, imperdiet varius ante. Pellentesque odio leo, convallis et placerat quis, ullamcorper quis nibh. Nunc lectus nulla, consequat hendrerit est tincidunt, semper imperdiet felis. Maecenas lobortis, dolor nec gravida molestie, turpis sapien malesuada turpis, id vehicula arcu arcu eget ex.\r\n\r\nInteger eu nunc mauris. Proin vitae dignissim turpis. In et placerat dui, in rhoncus lacus. Vestibulum in nunc vitae magna fringilla eleifend id convallis ex. In tristique sit amet nunc quis venenatis. Pellentesque pellentesque odio vel dolor fermentum, sit amet porta libero ultricies. Fusce a dolor et ligula accumsan cursus sed non urna. Mauris at velit in mi eleifend consectetur sit amet quis neque. Nullam consequat sodales luctus. Suspendisse potenti. Sed tristique eros at lacus dignissim tempus. Aliquam hendrerit erat est, non commodo ligula accumsan dictum. Donec gravida turpis metus, ut rhoncus neque pellentesque non. Curabitur porta diam semper neque porttitor suscipit lobortis quis mi.', '2016-02-08 11:32:26', 0, NULL),
(128, 14, 'BestEavent', 'besteavent', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mollis nulla nec sapien eleifend commodo. Donec lacus est, pellentesque a fermentum nec, rhoncus vitae erat. Vivamus pharetra, purus ut facilisis congue, nisl leo dictum nunc, in malesuada metus purus id lacus. In sollicitudin quam eu dolor ultrices, id finibus ligula vulputate. Vivamus feugiat varius sapien, vel condimentum libero ultrices sed. In sed orci turpis. Morbi cursus placerat ante, nec venenatis odio convallis tempus. Nullam gravida volutpat dui, nec accumsan velit posuere ut. Donec ut tellus nec eros venenatis egestas. Etiam eu dictum leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean sit amet nibh nec leo accumsan tristique.\r\n\r\nEtiam pellentesque odio et sapien tincidunt varius. Vestibulum ex ex, condimentum vel odio vel, faucibus ultrices ante. Maecenas a magna at turpis pretium interdum. Morbi risus velit, dapibus hendrerit molestie eget, sollicitudin ut arcu. Cras in dolor aliquam, interdum sem sed, ultricies nulla. Vestibulum nunc augue, mattis sodales erat vel, suscipit mattis velit. Phasellus et feugiat est.\r\n\r\nUt venenatis quam sit amet nulla mattis, et congue justo placerat. Ut sagittis mi libero, vel molestie sem placerat et. Suspendisse egestas tellus lacus, id vehicula libero efficitur ac. Duis placerat arcu nunc, vitae efficitur justo pharetra sed. Proin non fringilla diam. Nunc finibus tellus nec magna iaculis, nec interdum massa mollis. Maecenas gravida malesuada arcu accumsan vehicula. Aliquam auctor nisi in risus imperdiet luctus. Etiam lectus purus, dictum at sem et, ullamcorper sodales ante. Etiam in mauris finibus, commodo mauris a, finibus diam. Suspendisse et quam fermentum, suscipit ligula ut, gravida massa. Nulla in laoreet est, in vehicula libero. Sed eget massa sed nisi suscipit sollicitudin nec a lectus. Donec tincidunt quam vel pulvinar bibendum. Vestibulum volutpat eros sit amet ipsum sodales, sed ornare enim dignissim. Duis ac vulputate justo, vel eleifend felis.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean id dignissim mauris. Duis in nisi posuere odio gravida pharetra ac eu nulla. Ut tempor venenatis quam vitae eleifend. Pellentesque aliquet scelerisque sem at feugiat. Nam lobortis nunc vitae feugiat accumsan. Donec faucibus dolor non ligula volutpat facilisis. Vivamus at iaculis elit. Sed metus leo, tempus vel turpis eget, imperdiet varius ante. Pellentesque odio leo, convallis et placerat quis, ullamcorper quis nibh. Nunc lectus nulla, consequat hendrerit est tincidunt, semper imperdiet felis. Maecenas lobortis, dolor nec gravida molestie, turpis sapien malesuada turpis, id vehicula arcu arcu eget ex.\r\n\r\nInteger eu nunc mauris. Proin vitae dignissim turpis. In et placerat dui, in rhoncus lacus. Vestibulum in nunc vitae magna fringilla eleifend id convallis ex. In tristique sit amet nunc quis venenatis. Pellentesque pellentesque odio vel dolor fermentum, sit amet porta libero ultricies. Fusce a dolor et ligula accumsan cursus sed non urna. Mauris at velit in mi eleifend consectetur sit amet quis neque. Nullam consequat sodales luctus. Suspendisse potenti. Sed tristique eros at lacus dignissim tempus. Aliquam hendrerit erat est, non commodo ligula accumsan dictum. Donec gravida turpis metus, ut rhoncus neque pellentesque non. Curabitur porta diam semper neque porttitor suscipit lobortis quis mi.', '2016-02-08 11:35:08', 0, NULL),
(129, 14, 'asfasfafaf', 'asfasfafaf', 'dddddddddddddddddd!!!', '2016-02-09 12:34:35', 1, 431),
(132, 33, 'тест', 'test', 'тест', '2016-03-02 17:04:04', 0, 451),
(137, 33, 'привет', 'privet', '', '2016-03-18 12:09:00', 0, 452),
(156, 83, 'фото ', 'foto', 'оп раз два', '2016-04-04 06:57:32', 0, 467),
(160, 83, 'фото ', 'foto', 'оп раз два', '2016-04-05 09:03:40', 0, NULL),
(161, 84, '1', '1', '', '2016-04-06 16:57:07', 0, 473),
(163, 14, 'Дашка промокашка', 'dashka-promokashka', 'fh dffd f hf hfg fg', '2016-04-07 07:35:46', 1, 591),
(165, 33, 'sssss', 'sssss', 'asdfssasdfsgsdfg', '2016-04-13 15:28:36', 0, NULL),
(166, 33, 'sadfasdas ', 'sadfasdas', 'sd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gjsd sdg dfh s fgdj gj gdjg gj', '2016-04-13 15:50:13', 0, NULL),
(167, 82, 'еуые', 'euye', 'ваа', '2016-04-14 12:04:29', 0, NULL),
(170, 93, 'eee', 'eee', 'eeeee', '2016-04-20 19:16:18', 0, 558),
(175, 33, '121212', '121212', 'проверка описания', '2016-04-21 19:28:32', 0, 523),
(176, 33, 'новый альбом', 'novyj-alibom', 'вот это альбом', '2016-04-21 19:35:20', 0, 542),
(186, 38, 'azea', 'azea', '&&&&&', '2016-04-23 18:28:41', 0, 566),
(187, 93, '222', '222', '22222222222222222222222222222', '2016-04-26 21:15:31', 0, NULL),
(188, 14, 'тестовая афиша, на проверку символов в заголовке и карту', 'testovaja-afisha-na-proverku-simvolov-v-zagolovke-i-kartu', 'это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все это будет не забываемо , приходим все ', '2016-04-27 21:28:31', 0, NULL),
(189, 14, 'школа теста заголовков и карт', 'shkola-testa-zagolovkov-i-kart', 'много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. много текста, описание какая это классная школа и как много там полезного. ', '2016-04-27 21:44:39', 0, NULL),
(190, 95, '12', '12', '', '2016-04-27 22:10:45', 0, 569),
(191, 33, 'тест описания', 'test-opisanija', 'описание это дело такое ', '2016-04-28 15:22:53', 0, NULL),
(192, 14, 'тест карты', 'test-karty', '43шполуа984егршаулт8г49шал', '2016-04-28 15:27:36', 0, NULL),
(193, 14, 'тест карты', 'test-karty', 'куплортмуловтм', '2016-04-28 15:35:23', 0, NULL),
(194, 14, '123 тест карты ', '123-test-karty', '8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn8geurijvkndf54yghuirekjnvdmghuirkjn 8geurijvkndf54yghuirekjnvdmghuirkjn', '2016-05-03 18:59:08', 0, NULL),
(195, 14, '123 тест карты', '123-test-karty', 'вот так описание', '2016-05-03 19:01:13', 0, NULL),
(196, 33, 'тест карт через фронтенд', 'test-kart-cherez-frontend', 'немного описания чтобы было красиво', '2016-05-03 19:04:21', 0, NULL),
(197, 33, 'Привет', 'privet', 'много текста ', '2016-05-03 19:06:35', 0, NULL),
(198, 14, '123321', '123321', 'Вот немного доп информации, которая вам обязательно поможет ', '2016-05-03 20:08:41', 0, NULL),
(199, 14, '2222222222222222222222', '2222222222222222222222', 'xfgxfxfghfxgncfgjcghjcg', '2016-05-03 20:38:03', 0, NULL),
(200, 14, 'ццц', 'ccc', 'ываываываывава', '2016-05-03 20:58:54', 0, NULL),
(201, 33, 'Интересно , все ли работает? ', 'interesno-vse-li-rabotaet', 'это будет чумовое событие это будет чумовое событие это будет чумовое событие это будет чумовое событие это будет чумовое событие ', '2016-05-04 21:31:28', 0, NULL),
(202, 33, 'проверка этой дивной школы про', 'proverka-jetoj-divnoj-shkoly-pro', 'проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы проверка этой дивной школы ', '2016-05-04 21:35:46', 0, NULL),
(203, 79, 'wwww', 'wwww', 'qqqq', '2016-05-05 13:49:49', 0, 586),
(204, 38, 'проба 5го мая', 'proba-5go-maja', 'Описание пробы\n', '2016-05-05 13:57:23', 0, NULL),
(205, 14, 'фывафыавфыва', 'fyvafyavfyva', '', '2016-05-06 08:43:36', 0, NULL),
(206, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 22:34:36', 0, NULL),
(207, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 22:54:15', 0, NULL),
(209, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 22:58:38', 0, NULL),
(210, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 22:58:40', 0, NULL),
(211, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 23:43:42', 0, NULL),
(212, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-12 23:57:08', 0, NULL),
(213, 14, 'Первая Черниговская школа "Breakazoid"', 'pervaya-chernigovskaya-shkola-breakazoid', '', '2017-03-13 00:19:41', 0, NULL),
(214, 14, 'Some other test school', 'some-other-test-school', '', '2017-03-13 01:36:15', 0, NULL),
(215, 14, '46564567', '46564567', '', '2017-03-13 01:37:13', 0, NULL),
(224, 14, '46564567', '46564567', '', '2017-03-13 02:04:43', 0, NULL),
(225, 14, '46564567', '46564567', '', '2017-03-13 02:09:47', 0, NULL),
(231, 14, '2342345', '2342345', '', '2017-03-13 15:18:37', 0, NULL),
(233, 14, '234234', '234234', '', '2017-03-13 23:06:04', 1, NULL),
(234, 14, 'Dj школа в Минске №1', 'dj-shkola-v-minske-1', '', '2017-04-29 14:16:37', 0, NULL),
(235, 14, 'TopDJ School Minsk', 'topdj-school-minsk', '', '2017-05-05 14:32:34', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `z_rating_events`
--

CREATE TABLE `z_rating_events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_limit` int(11) UNSIGNED NOT NULL,
  `limit_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_price` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `z_rating_log`
--

CREATE TABLE `z_rating_log` (
  `id` int(11) NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) UNSIGNED NOT NULL,
  `event_count` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `z_school`
--

CREATE TABLE `z_school` (
  `id` int(11) NOT NULL,
  `user` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` int(11) UNSIGNED NOT NULL,
  `geolocation_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `price_currency` varchar(3) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `additional` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `album` int(11) UNSIGNED NOT NULL,
  `date_redact` int(11) NOT NULL,
  `redactor_id` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `img_block_size` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_school`
--

INSERT INTO `z_school` (`id`, `user`, `title`, `category`, `geolocation_id`, `price`, `price_currency`, `phone`, `site`, `description`, `additional`, `created`, `album`, `date_redact`, `redactor_id`, `status`, `img`, `img_block_size`) VALUES
(46, 14, 'Современная школа диджеев', 3, 82, '50', 'USD', '(063)858-50-29', 'http://dm-records.com/', 'Студия звукозаписи, пожалуй, лучшее на сегодня сочетание цены и качества. Благодаря современному техническому оснащению нам с легкостью удается добиться качественного и модного звучания, поражающего даже самого искушенного профессионала. Мы предоставляем полный цикл услуг на европейском уровне по привлекательным ценам!\r\n\r\nК вашим услугам всегда профессиональное оборудование, штат высококвалифицированных музыкантов и звукорежиссеров с огромным опытом студийной работы. Воспользуйтесь их помощью и советами, чтобы сделать вашу запись еще лучше!', '{"trainingTime":"24\\/7","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-05-07 12:47:09', 0, 1494161228, 14, 0, '5/1/5/590f174d64f88.png', 1),
(45, 14, 'Music Academy', 4, 81, '240', 'USD', '(499)408-50-67', 'http://musacademy.ru/', 'Многолетний опыт работы, сотрудничество с известными диджеями и партнерство с компанией «Своя атмосфера», занимающейся строительством клубов и их управлением, позволяет нам радовать своих учеников приятными бонусами.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"Deny Roxtaz, DJ \\u041b\\u044c\\u0432\\u043e\\u0432, Marty Fame, DJ Infekto, Relanium, \\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0421\\u0430\\u0432\\u0430\\u0440\\u0438","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-05-07 12:28:25', 0, 1494160203, 14, 1, '3/5/4/590f12fb70fa1.jpg', 1),
(44, 14, 'NuTone', 4, 93, '100', 'USD', '', 'https://vk.com/club31136264', ' Занятия в школе ведут профессионалы с многолетним опытом работы в области ди-джеинга и написания музыки, они имеют хорошую подготовку, успешны в своей среде и имеют за своими плечами три необходимых для преподавания навыка: опыт, опыт и еще раз опыт. В школе имеется уникальная возможность проведения мастер-классов с известными музыкантами и ди-джеями как города Владивостока, так и России и не только. \r\n\r\nШкола находиться в самом центре города. Здесь место найдется каждому: и новичку, желающему получить базовые знания в области ди-джеинга музыки, и профессионалу, желающему расширить свои творческие возможности. Школа не имеет строгой музыкальной направленности и обучает работе со всеми существующими музыкальными стилями и направлениями. Школа предоставляет возможности поэтапного гибкого графика обучения, учитывая при этом индивидуальные особенности каждого ученика. Теоретические занятия плотно совмещены с практикой. Без лишней скромности заявляем – мы единственные, кто поможет ученикам освоить базовые и продвинутые навыки «scratch» техники.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"Dj Anton, Dj Pavlik Morozoff, Dj Kash","equipment":"","trains":"","materials":"1","soundSoft":"0"}', '2017-05-07 12:21:35', 0, 1496388598, 14, 1, '5/3/3/590f114fd3528.png', 1),
(36, 14, 'Dj школа в Минске №1', 4, 69, '90', 'USD', '(029)330-20-30', 'https://djschool.by', 'Школа предоставляет VIP-обучение для каждого клиента в индивидуальном порядке!\r\nДля клиентов разработаны 2 VIP курса — Диджеинг и Ableton Live (создание музыки).\r\nОбучение проходит в студии звукозаписи современной танцевальной музыки.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"DjSweet OFF \\/ Dj Yuliy Metelsky","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-04-29 14:12:02', 234, 1493545136, 14, 1, '0/3/9/59049f32044f0.png', 1),
(37, 14, 'TopDJ School Minsk', 4, 70, '1', 'USD', '(029)742-92-22', '', 'Пройдя обучение в данной школе диджеев Вы с легкостью приобретете необходимые навыки, получите бесценный опыт, значительно расширите свой музыкальный кругозор, узнаете различные секреты и техники, получите возможность пообщаться в живую с профессиональными артистами.', '{"trainingTime":"\\u0412 \\u0443\\u0434\\u043e\\u0431\\u043d\\u043e\\u0435 \\u0434\\u043b\\u044f \\u0412\\u0430\\u0441 \\u0432\\u0440\\u0435\\u043c\\u044f (\\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e, \\u0431\\u0435\\u0437 \\u0432\\u044b\\u0445\\u043e\\u0434\\u043d\\u044b\\u0445)","square":"","floor":"","mirrors":"0","traininer":"\\u041b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u0434\\u0438\\u0434\\u0436\\u0435\\u0438 \\u0411\\u0435\\u043b\\u0430\\u0440\\u0443\\u0441\\u0438","equipment":"\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u0432 \\u043c\\u0438\\u0440\\u0435 \\u043e\\u0431\\u043e\\u0440\\u0443\\u0434\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043f\\u0440\\u0435\\u043c\\u0438\\u0443\\u043c-\\u043a\\u043b\\u0430\\u0441\\u0441\\u0430 \\u0432 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e \\u043e\\u0431\\u043e\\u0440\\u0443\\u0434\\u043e\\u0432\\u0430\\u043d\\u043d\\u043e\\u0439 \\u0441\\u0442\\u0443\\u0434\\u0438\\u0438","trains":"","materials":"1","soundSoft":"0"}', '2017-04-30 10:09:28', 235, 1493561893, 14, 1, '1/3/4/5905b7d841c5c.png', 1),
(38, 14, 'MY MUSIC', 4, 0, '1000', 'UAH', '(066)841-45-30', 'https://m.vk.com/my_music_team', 'Обучение индивидуальное или в группе по 2 человека.\r\nВ рамках обучения Вам предлагаются:\r\n- Программы обучения для людей с разным уровнем музыкальной подготовки\r\n- обучение на профессиональном оборудовании компании Pioneer\r\n- практика в ночных клубах города', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"\\u041f\\u0440\\u0435\\u043f\\u043e\\u0434\\u0430\\u0432\\u0430\\u0442\\u0435\\u043b\\u0438 \\u0438\\u043c\\u0435\\u044e\\u0442 \\u0441\\u0442\\u0430\\u0436 \\u043e\\u0442 5 \\u043b\\u0435\\u0442 \\u0438 \\u0431\\u043e\\u043b\\u0435\\u0435, \\u0440\\u0435\\u0433\\u0443\\u043b\\u044f\\u0440\\u043d\\u043e \\u0432\\u044b\\u0441\\u0442\\u0443\\u043f\\u0430\\u044e\\u0442 \\u0432 \\u043a\\u043b\\u0443\\u0431\\u0430\\u0445.","materials":"1","soundSoft":"1"}', '2017-05-06 18:25:44', 0, 1494095173, 14, 0, '5/9/8/590e15282b446.jpg', 1),
(39, 14, 'DJ.FACTORY', 4, 0, '1', 'UAH', '(814)228-48-38', 'http://vk.com/djfactory', 'Новая уникальная программа\r\n5 шагов. 10 часов. Ты - DJ!\r\nНаши выпускники становятся резидентами многих клубов Петрозаводска и гостями клубов Карелии, Москвы и Санкт-Петербурга.\r\n', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"1","soundSoft":"0"}', '2017-05-06 19:22:12', 0, 1494098532, 14, 0, '5/7/2/590e22649cbf6.jpg', 1),
(40, 14, 'DJ STUDIO', 4, 0, '1500', 'UAH', '(066)666-42-48', 'https://vk.com/dj_studio_zp', 'Наши выпускники выступают в Китае, Турции, Египте, Германии и Швейцарии. \r\n\r\nК нам непрерывно поступают предложения от клубов, кафе, баз отдыха и т.д. о трудоустройстве ди-джеев и организации вечеринок. ', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-05-06 19:27:43', 0, 1494098863, 14, 0, '4/0/3/590e23af78b04.jpg', 1),
(41, 14, 'DJ ROOM ZP', 4, 0, '250', 'UAH', '(067)612-43-81', 'https://vk.com/djroomzp', 'Это cтудия ди-джеинга, для воплощения ваших творческих замыслов, будь то запись сетов или промо видео материала , обучение диджеингу с нуля , индивидуальные занятия или самостоятельные тренировки. Диджей школа с индивидуальным подходом к каждому и домашним комфортом.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"\\u041f\\u0440\\u043e\\u0444\\u0435\\u0441\\u0441\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043e\\u0431\\u043e\\u0440\\u0443\\u0434\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0439 Pioneer, Technics, Native Instruments, Stanton ....","trains":"","materials":"1","soundSoft":"1"}', '2017-05-06 19:51:03', 0, 1494100263, 14, 0, '0/1/2/590e2927c8648.jpg', 1),
(42, 14, 'STAY TRUE', 4, 79, '70', 'EUR', '(777)022-67-32', 'https://staytruedj.wordpress.com/', 'Концепт школы заключается в  том что-бы обучать искусству ди-джеинга начиная от основ, то есть как оно было создано изначально(пластинки ,вертушки, иглы, скретчинг и тд.и тп. ) до современных технологий c использованием (CD/ Digital  DJ-ing/Traktor/Serato/ Контроллеры). Мы  учим использовать и знать все оборудование, которое может использовать DJ и обучаем как настраивать  и подключать любой  из деваисов.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"Svyatoslav Usevich aka Light Monday \\u0438 Timur Paltuev aka Steppa-T","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-05-06 19:59:09', 0, 1494100771, 14, 1, '7/1/7/590e2b1ad7050.png', 1),
(43, 14, 'My Way', 4, 80, '30', 'USD', '(717)256-34-80', 'http://fitcom.kz/my-way-dance/', 'Индивидуальный подход!', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"1","soundSoft":"0"}', '2017-05-07 12:12:43', 0, 1494159213, 14, 1, '5/1/3/590f0f3bb4e05.jpg', 1),
(35, 14, 'Первая Черниговская школа "Breakazoid"', 3, 61, '250', 'USD', '(324)324-24-24', '', 'Тестовая дополнительная информация', '{"trainingTime":"Test time long string etc","square":"This must be a numeric value?","floor":"This must be a dropdown?","mirrors":"1","traininer":"Just a bunch of trainer names","equipment":"No clue what must be in here","trains":"Who teaches you the basics?","materials":"1","soundSoft":"1"}', '2017-02-21 17:13:11', 213, 1490175409, 14, 1, '3/6/8/58d245b1aa7be.jpg', 1),
(47, 14, 'СВОИ ЛЮДИ', 1, 83, '25', 'USD', '(494)250-05-38', 'https://vk.com/svoiludikostroma', 'Более 10 лет опыта!\r\n\r\nНАБОР КРУГЛЫЙ ГОД!!!\r\nПервое занятие БЕСПЛАТНО!\r\n', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u0425\\u0435\\u0440\\u0443\\u0432\\u0438\\u043c\\u043e\\u0432 \\u0418\\u043b\\u044c\\u044f - Break-Dance, \\u0429\\u0435\\u0447\\u043a\\u0438\\u043d \\u0410\\u043b\\u0435\\u043a\\u0441\\u0435\\u0439 - Break-Dance, \\u0412\\u043b\\u0430\\u0434\\u0438\\u043c\\u0438\\u0440 \\u0411\\u0435\\u043b\\u043e\\u0432 - Break-Dance","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 12:54:24', 0, 1494161718, 14, 1, '5/1/0/590f1900f090e.jpg', 1),
(48, 14, 'Max Dance', 1, 84, '55', 'USD', '(926)224-13-09', 'http://www.mdance4u.ru/', 'На занятиях по брейк-дансу ребятам никогда не бывает скучно: освоив базовые элементы, юные би-бои с удовольствием импровизируют и не стесняются быть в центре внимания!\r\nПреподаватели нашей школы приглашают в захватывающий мир брейк-данса юношей и девушек, которые хотят продемонстрировать миру свою независимость, силу и креативность.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u0410\\u0440\\u0441\\u0435\\u043d \\u0410\\u0440\\u0430\\u043a\\u0435\\u043b\\u044f\\u043d - BREAK-DANCE, \\u041c\\u0438\\u0445\\u0430\\u0438\\u043b \\u0422\\u0435\\u0440\\u0435\\u043d\\u0442\\u044c\\u0435\\u0432 - HIP-HOP","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 13:12:41', 0, 1494162940, 14, 1, '2/5/9/590f1dfc65dab.png', 1),
(49, 14, 'Uni-Dance', 1, 85, '1', 'UAH', '(842)224-23-00', 'http://udance73.ru/dance', 'UNI-DANCE - крупнейшая танцевальная школа в Ульяновске. Мы предоставляем самый большой выбор танцевальных направлений. Самые профессиональные тренера из Ульяновска, Москвы, Лондона, Киева. Самые комфортные условия и удобное расписание для занятий танцами. У всех наших клиентов есть возможность участвовать в различных танцевальных шоу и мероприятиях, а также мастер-классах хореографов со всего мира. Возраст обучения в школе танцев от 4-х до 60-ти.\r\nУ всех наших учеников есть возможность выступить на одном из наших концертов, которые проходят на разных площадках города. Кто-то еще только готовится к своему первому в жизни концерту, а кто-то уже успел побывать на 6-7-ми. Каждый концерт - это абсолютно новая программа, и новые яркие эмоции как для выступающих, так и для их друзей и родных.', '{"trainingTime":"","square":"","floor":"","mirrors":"1","traininer":"","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 13:26:14', 0, 1494163574, 14, 1, '6/3/2/590f20768f73c.jpg', 1),
(50, 14, 'STREET MASTERS', 4, 86, '50', 'USD', '(111)111-11-11', 'https://vk.com/club1875927', 'Нашей первоочередной задачей стоит обучения мастерству ди-джеинга, а не обещания в дальнейшем трудоустройства в лучшие клубы столицы.\r\nМы даем возможность начинающим продвинутым талантам перенять опыт от профессионалов в области звукорежиссуры и ди-джеинга. Уникальные знания преподавательского состава нашей школы откроют для вас новые горизонты в создании собственной музыки и совершенствовании себя как ди-джея.\r\nОсновная задача школы — совершенствование общего уровня музыкантов и ди-джеев по всей Беларуси. Научиться сводить пластинки — это лишь малая часть того, с чем вам придется столкнуться.', '{"trainingTime":"19:00 -22:00","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"1","soundSoft":"1"}', '2017-05-07 13:36:15', 0, 1494164417, 14, 0, '5/4/5/590f23c19658e.png', 1),
(51, 14, ' Академия танца Татьяны Мартыновой', 1, 87, '1', 'UAH', '(903)974-09-74', 'http://www.dancex.ru/service/ms/break.html', '', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u0415\\u0432\\u0433\\u0435\\u043d\\u0438\\u0439 \\u0427\\u0435\\u0440\\u0431\\u0430\\u0435\\u0432 aka \\u041c\\u0430\\u0440\\u0438\\u043e","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 13:46:13', 0, 1494164773, 14, 0, '7/7/0/590f25258cc42.jpg', 1),
(52, 14, 'ВИНТ-КЛАБ', 1, 88, '25', 'USD', '(017)213-00-79', 'http://vint-club.com/index.php', 'В нашей школе множество танцевальных направлений. Мы постоянно совершенствуемся, учитывая пожелания наших клиентов. Приходите и убедитесь сами!', '{"trainingTime":"","square":"","floor":"","mirrors":"1","traininer":"","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 13:52:01', 0, 1494165228, 14, 1, '7/2/2/590f26d7d6def.jpg', 1),
(53, 14, 'FATALITY DANCE STUDIO', 1, 89, '1', 'UAH', '(029)340-99-44', 'http://fatalitydance.by', 'Fatality Dance Studio - школа — студия танца специализируется не только на обучении современной хореографии, но и на организации танцевальных мероприятий, выступлений, фестивалей, концертов, флеш-мобов, постановке танцевальных номеров, организации мастер-классов и семинарских занятий и т.д.\r\n\r\nОб обучающем процессе:\r\n\r\nКлиенты студии получают только качественное обучение танцевальным дисциплинам. Мы уделяем огромное внимание физической подготовке и стараемся дать наиболее полную хореографическую базу изучаемого стиля. \r\n\r\n\r\nШкола современного танца в Минске Fatality Dance Studio изменит вашу жизнь в лучшую сторону и принесет в нее яркие краски, которых так не хватает в обыденной жизни. Наша студия танца – это уникальный шанс познать многогранный и красочный мир танца, пластики и жестов. Танец способен раскрепостить вас, изменить самооценку и расширить круг ваших интересов, и наша школа танца создана специально для того, чтобы помочь вам достигнуть совершенства', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 20:41:53', 0, 1494189713, 14, 1, '6/2/0/590f8691dd520.jpg', 1),
(54, 14, 'CONQUISTADOR CREW', 1, 90, '1', 'UAH', '(544)588-12-02', 'http://conquistador-crew.com/', 'Наши преподаватели танцуют брейк данс уже более 15 лет. Являются победителями многих чемпионатов и имеют большой опыт преподавания.\r\nМы уделяем внимание каждому ученику. Наша задача помочь развиться каждому в танце и достичь поставленных целей.\r\nУ нас очень удобное расписание занятий. Есть как дневные, так и вечерние группы.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u0412\\u043b\\u0430\\u0434\\u0438\\u043c\\u0438\\u0440 \\u042f\\u043d\\u0443\\u0448\\u043a\\u0435\\u0432\\u0438\\u0447 (bboy Volodya)  \\u042e\\u0440\\u0438\\u0439 \\u041a\\u043e\\u0439\\u043f\\u0438\\u0448 (bboy Fury)","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 20:47:18', 0, 1494190038, 14, 0, '4/3/1/590f87d654f2a.jpg', 1),
(55, 14, 'Life4dance', 1, 91, '13', 'USD', '(753)366-62-92', 'http://life4dance.by/', 'Хотели бы вы попробовать что-то новое? Получить заряд положительных эмоций? Иногда действительно хочется получать от жизни удовольствие вне зависимости от того, который сейчас день, спастись от серых будней и завести новых друзей. Значит, пора шевелиться и придать жизни неожиданный поворот!\r\nНестандартным способом, который может удовлетворить практически все жизненные потребности, является танец. Стоит лишь только попробовать. Эту возможность предоставляет одна из лучших школ танца Минска «Life 4 Dance».', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u041b\\u044f\\u0445\\u043e\\u0432\\u0435\\u0446 \\u0415\\u0432\\u0433\\u0435\\u043d\\u0438\\u0439, \\u042f\\u0440\\u043e\\u0448\\u0435\\u0432 \\u0410\\u043d\\u0442\\u043e\\u043d, \\u042f\\u0440\\u043e\\u0448\\u0435\\u0432 \\u041d\\u0438\\u043a\\u043e\\u043b\\u0430\\u0439 ","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 20:53:27', 0, 1494190415, 14, 1, '9/6/8/590f8947151b8.jpg', 1),
(56, 14, 'WILD STYLE', 1, 92, '70', 'USD', '(968)846-81-39', 'http://www.wild-style.ru/', 'ШКОЛА БРЕЙК ДАНСА в Москве (школа брейк-данса) "WILD STYLE" является одной из сильнейших школ брейк-данса в Москве по обучению брейк дансу! Преподавателями являются именитые танцоры, хореографы, «бибои», которые обучают брейк дансу «с нуля», а также тех, у кого есть опыт!\r\nНа протяжении всего года наша школа БРЕЙК-ДАНСА в Москве проводит МАСТЕР-КЛАССЫ с сильнейшими педагогами МИРА! За все это время к нам приезжали такие знаменитости, как BBOY MACHINE (США)- признан сильнейшим бибом 2008 года, BBOY KAREEM “Rock Force” (США), BBOY CRAZY LEGS и BBOY YNOT из легендарной команды “ROCK STEADY CREW” (США), BBOY LILOU “Pokemon” (ФРАНЦИЯ)- признан сильнейшим бибоем 2009 г. (BOTY), двукратный победитель чемпионата мира по бибоингу “BC ONE”, BBOY MENNO, XISCO “Def Dogz” (ГОЛЛАНДИЯ) - одни из сильнейших бибоев Европы.', '{"trainingTime":"","square":"","floor":"","mirrors":"0","traininer":"\\u041a\\u043e\\u0441\\u0442\\u044f \\u041b\\u044b\\u0441\\u0438\\u043a\\u043e\\u0432 - \\u043f\\u0440\\u0438\\u0437\\u0435\\u0440 \\u0447\\u0435\\u043c\\u043f\\u0438\\u043e\\u043d\\u0430\\u0442\\u0430 \\u0420\\u043e\\u0441\\u0441\\u0438\\u0438 \\u043f\\u043e \\u0431\\u0440\\u0435\\u0439\\u043a \\u0434\\u0430\\u043d\\u0441\\u0443","equipment":"","trains":"","materials":"0","soundSoft":"0"}', '2017-05-07 21:02:53', 0, 1494191002, 14, 1, '5/7/0/590f8b7dcc1cd.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `z_user`
--

CREATE TABLE `z_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `lastvisit` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_user`
--

INSERT INTO `z_user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `lastvisit`) VALUES
(13, 'serg', 'AFK9h_I-dWroEJiD_WwPfQ-cFQbOBslY', '$2y$13$X4c6fU3eTq6weglQd4dxpul4J7Fv9SHzCuPQQrkZmcYN41oO5I4ni', '0j1cULnkuqomK-U3VcsDyRABx7zLj2Qk_1456947836', 'radchenko87@gmail.com', 10, 1438860188, 1456947836, 1456947764),
(14, 'jambo', 'jP5qVDgmmdw472evPCZ4LiLtsELrf1a6', '$2y$13$i3QVSf6jKsZD1jr6Lr7VIOkSztl6vy3XVa.SGDHmAdQwOnlLFuyb.', '', 'sc@sc.sc', 10, 1439141552, 1513709596, 1513709596),
(15, 'Serega', 'jP5qVDgmmdw472evPCZ4LiLtsELrf1a6', '$2y$13$i3QVSf6jKsZD1jr6Lr7VIOkSztl6vy3XVa.SGDHmAdQwOnlLFuyb.', '', 'sergrega@gmail.com', 0, 1439210707, 1496085296, 1495749669),
(27, 'Kanter', 'YM3uuNHIP1R-Sc9kT7_W0Jsm5GGS2e1r', '$2y$13$3uKpd/Mg2DX/3oxZRybMMeNAHzy9/xdE/UwO0j7ZJKugKbqjVHfX2', '', 'iluh-s@yandex.ru', 0, 1450016463, 1495743852, 1450017077),
(29, 'superilyapuzo', 'hVlzy0HuP4YCTzZSCFQqUwCqyIT67rVS', '$2y$13$kxP4VIU/waDwEGfhgwjm8eI2WkOAUOPuaaiJYeYDUKCkAl1.JQ8tm', '', 'ilyapodanev@gmail.com', 10, 1452081354, 1452081354, 1452082986),
(30, 'Kuba', 'eFKf1cYZbTNDtsotLMywzDCon6iYwbpa', '$2y$13$7qQ43isBvs1J759W6f4Uo.eRurF/OyhyTCfXgvKYlaWgCfIn/5pRm', '', 'chestr@inbox.ru', 10, 1452340637, 1452340637, 1452343972),
(31, 'Smithyara', 'Ak4iIdIa-tpTxpa6hv9c23jHBkGQYsvK', '$2y$13$CzSY1YCRKniPVepDR0zPy.o9mDzdIb9snZLiWCx2KcAGUyjaWd2uW', '', 'roman.j.zharko@gmail.com', 10, 1452597729, 1452597729, 1454625040),
(32, 'Filya', '9v6ok8_apTCS8ol0sOzCghL5FAk-xaE8', '$2y$13$Qrbttx1SO.JRA8g4nuuZx.RAhU0OwvGw.X8o7YGjfgzV4hikhDjyS', '', 'ramaja12@i.ua', 10, 1452599518, 1452599518, 1452676321),
(33, 'Danil', 'SiFfjolCCef9_ALyl3DdVFfdOwpazqEV', '$2y$13$O0tMsKyuTjedKcJFh9jwHeO4MXpPNorgarild.Ume7xLd8cvVt9vW', '', 'danilpasko@gmail.com', 10, 1452637064, 1460237669, 1462564103),
(34, 'S1mple', '2LIUFjMyKdfnBREjtnA_vP_8yTbTF6Ir', '$2y$13$E0FXyQ99wxNnetUkfzoqKuoWZZzcgOve7SzJwOeyz88a0roJYqW3e', '', 'alexvold@mail.ru', 10, 1452932146, 1452932146, 1453472081),
(35, 'dehisok', 'UNl1yn3o-kYF0wi_9NzEuZzySV1JPRev', '$2y$13$/aTnuAsHaHJ1Jicnh15tC.pdUVG.k7a2GZC/nhcu4oQygn55cjNfG', '', 'dehisok@gmail.com', 10, 1453037043, 1453037043, 1453058916),
(36, 'BabenkoARH', 'I9GtoSTmvYhXILOzsePr4tu3FHOCmEr8', '$2y$13$ztShzwniVlKaSUpTtKUoIexejzAgR.ejscOjonbhDdlm2KVeZrVvG', '', '7yr1k.dp@gmail.com', 10, 1453079855, 1453079855, 1453084086),
(37, 'ASPSDM', 'ROBYyZCeIf4AKSIdaNKNwVGLm__nRfMf', '$2y$13$6fIMDauply4DaeUMsKjSnOdN72TbweA6KL0tBE.nrbqnNBROSQdYq', '', 'Dev_dev@appshop.com.ua', 10, 1453085127, 1453085127, 1453111036),
(38, 'Dimon', '967Dih556wvM8tVnbrye5uoo736G8Yf6', '$2y$13$7o34lkfMj.4izabKBDk1Q.hfQJStTAcJmD191k0H9d6Jgix.aTjv2', '', 'dmitriy-kma@mail.ru', 10, 1453384646, 1458151249, 1462547771),
(40, 'jambo1', 'e8o525hsLegCqjFRyG_oq5OQrBzZgyyS', '$2y$13$jXq5Ns1q1.qFwOQ1e3ZSzO5.8LHzOZtHl8eSmOXHroWQQ5OWCCFlm', '', 'asdfsadf@asdfasf.com', 10, 1453989256, 1453989256, 1453989578),
(41, 'jambo2', 'ysJMuYmfqHokAstadn3xCOXRaYqJAdws', '$2y$13$WXOeQGq9tQj3nFJdLLhe.OmGLJJ/CEu1U.Ek/rDPWvB9SItrlGs8S', '', 'jambo@asfasf.ru', 10, 1453989297, 1453989297, 1454514056),
(42, 'jambo3', '8X1O0Q1psSssyoAJ9zp_H13ete-tZMxf', '$2y$13$ZedJ1mOeb6bMRJVhpmn4vOOG6G698tdfVQgridnIefznDKbhqk1te', '', 'asfasdf@asfasdf.com', 10, 1453989349, 1453989349, 1453989625),
(43, 'jambo4', 'DDzPRcYT_9fRrMjuvq1wXmgc4yRjXEwI', '$2y$13$2dI7bGTBwZRoqFL0bLEAKu5hdJGrSJw1EdmoEfIIFB/mjjH8RvKPm', '', 'asfasf@asfasf.ua', 10, 1453989387, 1453989387, 1453989658),
(44, 'jambo5', '6xxtG1vC_O7Q9S_J4uH_J4X0gJ92ks_v', '$2y$13$Qhkos1Bxnl1d/vD6YCyc7OSF7xWrxMYWXg3s6iKvaJr7TbehJsZpy', '', 'asfsf@sfas.com', 10, 1453989423, 1453989423, 1453989684),
(45, 'jambo6', 'K35ALwjA5nIots6h9YIIAMgamkCT7M40', '$2y$13$EE3rNd.sbiqcZS.mi6baNulYsF7AnmM36Lntojw8odbFL6Vq7sPcu', '', 'jambo@asfasf.com', 10, 1453989478, 1453989478, 1453989512),
(46, 'jambo7', '6mTogyBgjv_UQ6LOsId3nmV2b8XVfhW0', '$2y$13$s6YIl90Jvzbs4CK4LNUXoeE3M50inEhcb5W6DJzEZjyGYtVL5bjrm', '', 'assdf@asdfaf.com', 10, 1453989717, 1453989717, 1453989736),
(47, 'jambo8', 'OKq4Cg9U56J6Y5RIuwEtxE5KWbabbz_6', '$2y$13$DHEAU56T41mb2UhjjTHyqeKHmnQDfughRCEgtEwtARwqKuISyeJY6', '', 'sfsadf@asfasf.com', 10, 1453989771, 1495743266, 1453989790),
(48, 'jambo9', 'c4JkmvAdGsiVHZusvLTz6Q1-uE56w4fh', '$2y$13$fd8LmBjKmvx4SKfzzFBAB.2A7C35YDAz8YkNEpXsDRfDDU0GE9XRG', '', 'sfasf@asfasf.ua', 10, 1453989822, 1453989822, 1453989837),
(49, 'jambo10', 'r1QoXcLJg1ErnkXoDbmGL1DfaaqfHwz_', '$2y$13$i8YfdRsqweVkMFaz2Y95RuVTUU4TopfgbZ7HlTv.ZOU90laT/2BFq', '', 'asfaf@asfas.com', 10, 1453989865, 1453989865, 1453989881),
(50, 'jambo11', 'lWz9DV0E2vhvWNxazIDcnXZjPLqlq5in', '$2y$13$lfGhJwxDMXzLid5oFVCUTuIlaaRcR2Ao5q69wbhuNHjYWYZAbXFQS', '', 'asdfsaf@asfas.com', 10, 1453989909, 1453989909, 1453989923),
(51, 'jambo12', 'rSwAzux0-cdN2ijfTFSPx-T1HhA_Lq9p', '$2y$13$m3LJxWa6rrlBAxgbAY.CxeHpFYdX4dylU4SCbZE/6zV3Z.hfrslDu', '', 'asfasf@asdfasdf.com', 10, 1453989952, 1453989952, 1453989974),
(52, 'jambo13', 'E4dYiUCneFvuNkouzxM_e_mxO1tpYdqo', '$2y$13$jzec9pmCRo8PVc00tbuJPO9DkgKy4DWhzsN24jrpV8jfKOlCxxJ5i', '', 'asfsf@asfas.com', 10, 1453990006, 1453990006, 1453990018),
(53, 'jambo14', 'dLWW6nbx6f4PaVKQQvUHrbl8NjMczSZs', '$2y$13$CjT0HB7erVVNIPQZ.f46EemHbdgnXBLW3EdJfEZ.TcQc24bC9HVSW', '', 'asfd@asdf.com', 10, 1453990049, 1453990049, 1453990065),
(54, 'jambo15', '5a6YopR4ibPBakSznFJT8tWzShbBas7A', '$2y$13$/E9U79zA9ljLhv5eXHF9DOiR4gH43VMEWlDGMQbSAP.NxC9fDEsSC', '', 'asfsaf@asfaf.com', 10, 1453990097, 1453990097, 1453990109),
(78, 'dimon4ik', '9o8zTq_X3ZmOO7pSDymSW7OlGFZBcKLL', '$2y$13$c9eeO7mOg4BrFVg.9lv93eEjCvq4ACdTJRcPF8jxYQ4w9kBJcEVXC', 'nQP3bhLVHLoTFu5Sw0oECcoyRgBIPVRX_1461429390', 'dmitriy.kma@gmail.com', 10, 1459449027, 1461429390, 1459529735),
(79, 'dimon4ik2', 'oCcgAyj3JDzZnsn3gtx1XIsyGaiGbDHP', '$2y$13$mVIMsstSowMlJo1w6k.u9.ROJn9eClksloLOmIUJ9zRxSBcdHj1pa', '', 'dxfire@ukr.net', 10, 1459449418, 1461831087, 1462595999),
(80, 'dimon4ik3', 'qE3458OXu7S-mHtGUHdoUPwdmWDauBxz', '$2y$13$.NxQKlU3rQS.SirB1/lNd.Ifl/ADmNs0Mg.KqeL/wIEdH/x7oVuj2', '', 'dxfire5@ukr.net', 10, 1459449560, 1459449560, 1459449631),
(81, 'natik', 'DfbF3FfatrTGNrbsgTIb3U_1VMl4ancM', '$2y$13$kjGShocImitMGpWYuxtjlu8EXLAgBSLC1scPmW7JU2Y7h74ixEMjm', '', 'nataliamanzhos@gmail.com', 10, 1459449632, 1459449632, 1459449702),
(82, 'omar', 'uJVSYGJpvcGN_YHWHTnCYCg5qyZxhr5x', '$2y$13$mwQZNiv/W34bYz2GRbV8D.QQzZhhIcJyID00Wx2VwyodBDZi8XOGy', '', '007sonic007@gmail.com', 10, 1459600072, 1460633561, 1461015522),
(83, 'DanilPasko', 'q6V6zcRhBkZOXuZOl_gLrArCTgp5tnBD', '$2y$13$aTj6mL3KXcdFzA5h.iGZt.Sws12K9tk69lBB4.ehOtIb5bSFVji/.', '', 'eurodanil@rambler.ru', 10, 1459751111, 1462398859, 1462399693),
(84, 'Robot', 'RAwNJKnQn6G7Khr-mLFHDbLdUdqxQdAI', '$2y$13$2OudYXXSwHYXhp7Yezkgs.cNxDtG8wo.tmOaSU6aZ9hz2loWciK/G', '', 'dmitriy.kma@ukr.net', 10, 1459960711, 1459961196, 1459962889),
(93, 'webempiric', 'EF7MPUtcZ0EYYpzEvQ1OnPDXYgiPlE44', '$2y$13$ZwC6GjZsLlB6E8hkruHgbe9Vz021jEWy8/JvhQk197QearxJaRnue', '', 'rlopatkin@gmail.com', 10, 1460117146, 1461074070, 1462507917),
(94, 'Bolt', 'tJI0D6to8N7Z5QIz-UTG8w6EecITyNgc', '$2y$13$CvibZJAdYzcXoSTr2nPp8O9DM8dFPlsL.8uUdoXRgOwT12y87y3Mu', 'rHaVGDgjjlx_LvHz3aWWbxUzPhjXStrC_1461419369', 'battery.ukraine@gmail.com', 10, 1461419322, 1461419369, 1461419344),
(95, 'DANILTEST_Test', 'K6lf8dtuU4BMk09srunQZGQp_zMwvjt0', '$2y$13$djXAKBgdEYpmvxlhN8fkl.DgypiqoTdqWWRt1khSxmx5C4iABGZ..', '', 'eurodanil@yandex.ru', 10, 1461529719, 1461741246, 1462482003),
(96, 'qqqq', 'ErvzDH9-M4WD9B6XwlZlmGwOZh_hMf0i', '$2y$13$apUEbFR.nj3V9pc/09REpuv00TBzXppd9wchy41CMNuQ3tivGT8lq', '', 'l_rom@mail.ru', 10, 1462509155, 1462509155, 1462510390),
(97, 'omar1', '7qXjiRUMPYhTqmzG1pSLLuOLBoJdO92X', '$2y$13$9EmkpUL0EXeqCEQuCzqnPezwrFty.LzJ4NV59PEYlEq09iXd6niSS', NULL, 'omarcheek@yandex.ua', 10, 1462541288, 1462541288, 0),
(98, 'sdfsdf', 'cNNqRk5Muc9Vm3YiZTW4GMZMpFMZRKkE', '$2y$13$pYicieSs190glZerJ//Hs.LOGlA2k1/aNaJgiNSZqZlFrZHJEifwe', NULL, 'dmitriy@gmail.com', 10, 1462541527, 1462541527, 0),
(99, 'SCSmash3r', 'F_J1jtBbCEhqws7wIYsHOrLUTbsznDRM', '$2y$13$MO/R6nzIaHqR6o394Hb6qeJ2qwPrOYbnyNVeoqU15UGf5VijGjAmO', NULL, 'scsmash3r@gmail.com', 10, 1462541884, 1462541884, 0),
(100, 'Danil1', 'DdNkFcRhv-gitVEmrrKtZ05DeN_2R6YF', '$2y$13$StmoKXdDJ8O7lDe4J19s9uvdiyJRs8ZjoCX4FHArlTz0M62EHnunS', NULL, 'danil@gmail.com', 10, 1462562447, 1462562447, 0),
(101, 'dxfire', 'Vaq5cAxvOaEVKW4mcr_G_8ObQLJEi2Gx', '$2y$13$Vr8Vps3VSjj35BdQDrNINuMX0cj3/Q2LNY5kowmone5AH3miA5eJa', '', 'snisarenko.dmytro@gmail.com', 10, 1493117222, 1493136099, 1493136099),
(102, 'bboyxray', 'Z7DK6ag4p5rbxpT1PBwGdTBBzMqVjUoQ', '$2y$13$ajjWRqGnXsUZYrqp/LO.XeJ3oDaMrzUL6lGFVdxyqTucQ8KaKTsD.', '', 'x-ray1826@mail.ru', 10, 1493894280, 1494154444, 1494154444),
(103, 'NatalyZhemchugova', 'GZ7ikamtx_fb_eQRGWWxlEtuAsVMnaD1', '$2y$13$GsyGK/WovvUwXqjS2bQteO9covJqRKYHkSETPtY6HDsUZiL8upNoO', '', 'natasha@zhemchugovs.org.ua', 10, 1493918781, 1493992402, 1493992402),
(104, 'prikolyan', 'LqZwdZVXDx7YbKKwf8i2_fpnTqnOo4m-', '$2y$13$TG/pENCcpQBETEU5M/W8huvLy8xhw0P7tOgq2xSHIps2rI4.FYGSK', '', 'prykolyan@gmail.com', 10, 1493992663, 1493994335, 1493994335),
(112, 'andrij200390', 'FCs0GySFAQTDls81LPGNgUAYA-ya_dom', '$2y$13$ke55yah8d6LU3gKRDovSq.4wCUH/4YA6PlySkcRFRN2IKQ0J9tpR6', '', 'andrij200390@gmail.com', 10, 1500717459, 1512676230, 1512676230);

-- --------------------------------------------------------

--
-- Структура таблицы `z_user_description`
--

CREATE TABLE `z_user_description` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci,
  `family` tinyint(2) NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `birthday_show` int(11) NOT NULL DEFAULT '0',
  `country` int(11) UNSIGNED NOT NULL,
  `city` int(11) UNSIGNED DEFAULT NULL,
  `culture` int(11) UNSIGNED DEFAULT NULL,
  `team` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `music` text CHARACTER SET utf8,
  `film` text CHARACTER SET utf8,
  `shows` text CHARACTER SET utf8,
  `books` text CHARACTER SET utf8,
  `game` text CHARACTER SET utf8,
  `citation` text CHARACTER SET utf8,
  `about` text COLLATE utf8_unicode_ci,
  `politics` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `world_view` text CHARACTER SET utf8,
  `worth_life` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `worth_people` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `inspiration` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sex` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `avatar` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `avatar_small` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_user_description`
--

INSERT INTO `z_user_description` (`id`, `name`, `last_name`, `nickname`, `status`, `family`, `birthday`, `birthday_show`, `country`, `city`, `culture`, `team`, `phone`, `site`, `skype`, `music`, `film`, `shows`, `books`, `game`, `citation`, `about`, `politics`, `world_view`, `worth_life`, `worth_people`, `inspiration`, `language`, `sex`, `rating`, `avatar`, `avatar_small`) VALUES
(44, 'jambo5', 'jambo5', 'jambo5', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '44.jpg', '44_small.jpg'),
(29, 'Илья', 'Поданев', 'superilyapuzo', NULL, 0, NULL, 0, 9908, 9977, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '', ''),
(30, 'Виталий', 'Кулиба', 'Kuba', '', 8, '1990-06-27', 0, 9908, 9977, 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'male', NULL, '30.jpg', '30_small.jpg'),
(31, 'John', 'Smith', 'Smithyara', 'Все сложно', 6, '1986-11-16', 0, 9908, 9977, 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'female', NULL, '31.jpg', '31_small.jpg'),
(34, 'Алексей', 'Дьяченко', 'S1mple', NULL, 0, NULL, 0, 9908, 9977, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 7, '34.jpg', '34_small.jpg'),
(35, '', 'Chernyavskyi', 'dehisok', NULL, 0, NULL, 0, 9908, 9977, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '35.jpg', '35_small.jpg'),
(36, 'Артур', 'Бабенко', 'BabenkoARH', '', 2, '1993-07-07', 0, 9908, 9977, 3, 'HQS', '99111', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'male', NULL, '36.jpg', '36_small.jpg'),
(37, 'APP', 'D<F', 'ASPSDM', NULL, 0, NULL, 0, 9908, 9977, 3, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '37.jpg', '37_small.jpg'),
(13, 'Сергей', 'Радченко', 'Pirat', 'оп па па', 4, '1987-02-12', 1, 9908, 9977, 5, 'Шайка "Пикачу"', '36-36-36', 'http://georgiaN.shvilly', 'bender', '', '', '', '', '', '', 'Горы, книги, спайсы', '', '', '', '', '', 1, 'male', 15, '', ''),
(14, 'Администратор', 'Портала', 'Outstyle Team', 'Железный ветер, как белый привкус', 7, '1999-06-06', 1, 9908, 9977, 2, '', '44-56-88', 'http://kisloty.net', 'vovachuma', '', '', '', '', '', '', 'weaewf', '', '', '', '', '', 0, 'male', 15, '14.jpg', '14_small.jpg'),
(15, 'Валентин', 'Минога', 'Jora', 'Куда уходит детство...', 8, '1951-04-21', 1, 9908, 9977, 2, '', '4545-4545', 'http://saita.net', 'para-param-pam', '', '', '', '', '', '', 'жила была', '', '', '', '', '', 1, 'male', 15, '15.jpg', '15_small.jpg'),
(43, 'jambo4', 'jambo4', 'jambo4', NULL, 0, NULL, 0, 0, NULL, 3, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '43.jpg', '43_small.jpg'),
(42, 'jambo3', 'jambo3', 'jambo3', NULL, 0, NULL, 0, 0, NULL, 4, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '42.jpg', '42_small.jpg'),
(41, 'jambo2', 'jambo2', 'jambo2', NULL, 0, NULL, 0, 0, NULL, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(40, 'jambo1', 'jambo1', 'jambo1', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(33, 'Данил', 'Пасько', 'Danil', 'Крут', 2, '1992-09-11', 0, 9908, 9977, 2, '', '', '', '', 'Репчик Реплик вот это тема клевая ', 'Репчик Реплик вот это тема клевая ', 'РепчикРеплик вот это тема клевая Реплик вот это тема клевая ', 'РепчикРеплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая ', 'Репчик Репчик', 'Репчик - это Реплик и еще много текста очень много круто ', 'Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая ', 'Реплик вот это тема клевая Реплик вот это тема клевая', 'Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая ', 'Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая Реплик вот это тема клевая', 'Реплик вот это тема клевая Реплик вот это тема клевая', 'Реплик вот это тема клевая Реплик вот это тема клевая', 0, 'male', 23, '33.jpg', '33_small.jpg'),
(39, 'Vasya', 'XXX', 'VAsya', NULL, 0, NULL, 0, 0, NULL, 4, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '39.jpg', '39_small.jpg'),
(38, 'Дмитрий', 'Снисаренко', 'Dxfire', 'dfg', 2, '1997-03-03', 0, 9701, 9703, 1, 'Мамонт', '+33411', '', 'dxfire', 'скорпы ', 'джей', '', '', '', '', '', '', '', '', '', '', 0, 'male', 16, '38.jpg', '38_small.jpg'),
(27, 'Илья', '', 'Kanter', NULL, 0, NULL, 0, 9908, 9977, 4, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '', ''),
(32, 'Fil', 'Filipov', 'Filya', NULL, 0, NULL, 0, 9908, 9977, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '32.jpg', '32_small.jpg'),
(45, 'jambo6', 'jambo6', 'jambo6', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '45.jpg', '45_small.jpg'),
(46, 'jambo7', 'jambo7', 'jambo7', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '46.jpg', '46_small.jpg'),
(47, 'jambo8', 'jambo8', 'jambo8', NULL, 0, NULL, 0, 0, NULL, 3, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '47.jpg', '47_small.jpg'),
(48, 'jambo9', 'jambo9', 'jambo9', NULL, 0, NULL, 0, 0, NULL, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '48.jpg', '48_small.jpg'),
(49, 'jambo10', 'jambo10', 'jambo10', NULL, 0, NULL, 0, 0, NULL, 3, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 5, '49.jpg', '49_small.jpg'),
(50, 'jambo11', 'jambo11', 'jambo11', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(51, 'jambo12', 'jambo12', 'jambo12', NULL, 0, NULL, 0, 0, NULL, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(52, 'jambo13', 'jambo13', 'jambo13', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(53, 'jambo14', 'jambo14', 'jambo14', NULL, 0, NULL, 0, 0, NULL, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(54, 'jambo15', 'jambo15', 'jambo15', NULL, 0, NULL, 0, 0, NULL, 2, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(81, 'qw', 'qw', 'natik', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 3, '', ''),
(80, 'qw', 'qw', 'dimon4ik3', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '', ''),
(95, 'ТЕст', 'теСТ', 'DANILTEST_Test', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 3, '', ''),
(78, 'Дмитрий', 'qw', 'dimon4ik', '', 0, NULL, 0, 0, NULL, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', 4, '78.jpg', '78_small.jpg'),
(79, 'Дмитрий', 'sdffsdfdsf', 'dimon4ik2', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 3, '', ''),
(82, 'tester', 'tester', 'omar', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 4, '', ''),
(83, 'Данил', 'Пасько', 'DanilPasko', '', 0, NULL, 0, 0, NULL, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', 5, '83.jpg', '83_small.jpg'),
(84, 'Дмитрий', 'sdffsdfdsf', 'Robot', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, 3, '', ''),
(94, 'Дмитрий', 'qw', 'Bolt', NULL, 0, NULL, 0, 0, NULL, 0, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, NULL, NULL, '94.jpg', '94_small.jpg'),
(93, 'Роман', 'Лопаткин', 'webempiric', 'ыВ ывфп ыфвп ва ', 2, '1991-02-03', 0, 924, 929, 1, 'фыфы аыа', '444444444', 'http://google.com', 'rwerer', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'male', 15, '93.jpg', '93_small.jpg'),
(96, 'qqqqq', 'qqqq', 'qqqq', NULL, 0, NULL, 0, 0, NULL, 3, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, 'male', 5, '', ''),
(97, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(98, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(99, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(100, 'Danil', 'Pasko', 'Danil1', NULL, 0, NULL, 0, 0, NULL, 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', '', 0, 'male', NULL, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `z_user_privacy`
--

CREATE TABLE `z_user_privacy` (
  `id` int(11) UNSIGNED NOT NULL,
  `birthday` tinyint(1) NOT NULL DEFAULT '0',
  `city` tinyint(1) NOT NULL DEFAULT '0',
  `phone` tinyint(1) NOT NULL DEFAULT '0',
  `site` tinyint(1) NOT NULL DEFAULT '0',
  `skype` tinyint(1) NOT NULL DEFAULT '0',
  `board_comment` tinyint(1) NOT NULL DEFAULT '0',
  `private_messages` tinyint(1) NOT NULL DEFAULT '0',
  `invite_group` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_user_privacy`
--

INSERT INTO `z_user_privacy` (`id`, `birthday`, `city`, `phone`, `site`, `skype`, `board_comment`, `private_messages`, `invite_group`) VALUES
(13, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 1, 0, 0, 0, 0, 0, 0, 0),
(15, 1, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 2, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 3, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 0, 0, 0, 0, 0, 0, 0, 0),
(83, 0, 0, 0, 0, 0, 0, 0, 0),
(84, 0, 0, 0, 0, 0, 0, 0, 0),
(93, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 0, 0, 0, 0, 0, 0, 0, 0),
(95, 0, 0, 0, 0, 0, 0, 0, 0),
(96, 0, 0, 0, 0, 0, 0, 0, 0),
(97, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `z_user_search`
--

CREATE TABLE `z_user_search` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `z_user_search`
--

INSERT INTO `z_user_search` (`id`, `username`, `email`, `name`) VALUES
(48, 'jambo9', 'sfasf@asfasf.ua', NULL),
(47, 'jambo8', 'sfsadf@asfasf.com', NULL),
(33, 'Danil', 'danilpasko@gmail.com', NULL),
(49, 'jambo10', 'asfaf@asfas.com', NULL),
(29, 'superilyapuzo', 'ilyapodanev@gmail.com', NULL),
(34, 'S1mple', 'alexvold@mail.ru', NULL),
(35, 'dehisok', 'dehisok@gmail.com', NULL),
(36, 'BabenkoARH', '7yr1k.dp@gmail.com', NULL),
(37, 'ASPSDM', 'Dev_dev@appshop.com.ua', NULL),
(46, 'jambo7', 'assdf@asdfaf.com', NULL),
(13, 'serg', 'radchenko87@gmail.com', 'Геннадич'),
(14, 'jambo', 'radchenko87@gmail.com', 'zsdrgser'),
(15, 'Serega', 'sergrega@gmail.com', 'Радченко Сергей'),
(45, 'jambo6', 'jambo@asfasf.com', NULL),
(44, 'jambo5', 'asfsf@sfas.com', NULL),
(43, 'jambo4', 'asfasf@asfasf.ua', NULL),
(42, 'jambo3', 'asfasdf@asfasdf.com', NULL),
(41, 'jambo2', 'jambo@asfasf.ru', NULL),
(40, 'jambo1', 'asdfsadf@asdfasf.com', NULL),
(39, 'VAsya', 'jsaghdj@jhsgad.sed', NULL),
(38, 'Dimon', 'dmitriy-kma@mail.ru', NULL),
(27, 'Kanter', 'iluh-s@yandex.ru', NULL),
(30, 'Kuba', 'chestr@inbox.ru', NULL),
(31, 'Smithyara', 'roman.j.zharko@gmail.com', NULL),
(32, 'Filya', 'ramaja12@i.ua', NULL),
(50, 'jambo11', 'asdfsaf@asfas.com', NULL),
(51, 'jambo12', 'asfasf@asdfasdf.com', NULL),
(52, 'jambo13', 'asfsf@asfas.com', NULL),
(53, 'jambo14', 'asfd@asdf.com', NULL),
(54, 'jambo15', 'asfsaf@asfaf.com', NULL),
(94, 'Bolt', 'battery.ukraine@gmail.com', NULL),
(79, 'dimon4ik2', 'dxfire@ukr.net', NULL),
(78, 'dimon4ik', 'dmitriy.kma@gmail.com', NULL),
(80, 'dimon4ik3', 'dxfire5@ukr.net', NULL),
(81, 'natik', 'nataliamanzhos@gmail.com', NULL),
(82, 'omar', '007sonic007@gmail.com', NULL),
(83, 'DanilPasko', 'eurodanil@rambler.ru', NULL),
(84, 'Robot', 'dmitriy.kma@ukr.net', NULL),
(93, 'webempiric', 'rlopatkin@gmail.com', NULL),
(95, 'DANILTEST_Test', 'eurodanil@yandex.ru', NULL),
(96, 'qqqq', 'l_rom@mail.ru', NULL),
(97, 'omar1', 'omarcheek@yandex.ua', NULL),
(98, 'sdfsdf', 'dmitriy@gmail.com', NULL),
(99, 'SCSmash3r', 'scsmash3r@gmail.com', NULL),
(100, 'Danil1', 'danil@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `z_video`
--

CREATE TABLE `z_video` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_desc` varchar(255) NOT NULL,
  `video_img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `z_video`
--

INSERT INTO `z_video` (`id`, `user`, `service_id`, `video_id`, `video_title`, `video_desc`, `video_img`, `created_at`) VALUES
(2, 14, 4, '0081a91b6a80c85239647f62e0299749/', 'Полицейский отжигает на мотоцикле', '', 'http://pic.rutube.ru/video/6a/88/6a88cb9823b4920b935d04344237b0cb.jpg?size=l', '2017-07-05 14:27:22'),
(3, 14, 2, '145366920', 'HyperZooming through Hallstatt', '', 'http://i.vimeocdn.com/video/543475124_640.jpg', '2017-07-05 14:29:44'),
(4, 14, 1, 'TBKN7_vx2xo', 'Enjoykin — Nyash Myash', '', 'https://i.ytimg.com/vi/TBKN7_vx2xo/mqdefault.jpg', '2017-07-05 14:31:27'),
(5, 24, 1, '-U6L28KTPkM', 'Ride With Terminator', '', 'https://i.ytimg.com/vi/-U6L28KTPkM/mqdefault.jpg', '2017-07-05 11:53:27'),
(6, 24, 1, '-U6L28KTPkM', 'Ride With Terminator', '', 'https://i.ytimg.com/vi/-U6L28KTPkM/mqdefault.jpg', '2017-07-05 11:53:35'),
(12, 6, 1, 'JFNlOLc8ySE', 'МЮ', '', 'https://i.ytimg.com/vi/JFNlOLc8ySE/mqdefault.jpg', '2017-07-05 10:50:26'),
(18, 31, 1, 'FuG-7ePEIls', 'ЦСС', '', 'https://i.ytimg.com/vi/FuG-7ePEIls/mqdefault.jpg', '2017-07-05 07:38:27'),
(19, 31, 1, 'ewb_kNnMZZI', 'Фреймворки', '', 'https://i.ytimg.com/vi/ewb_kNnMZZI/mqdefault.jpg', '2017-07-05 07:39:28'),
(20, 31, 1, 'F2YptTuVM6A', 'Первые шаги', '', 'https://i.ytimg.com/vi/F2YptTuVM6A/mqdefault.jpg', '2017-07-05 07:39:57'),
(21, 31, 1, 'gTV0B_p9jTo', 'Программисты...', '', 'https://i.ytimg.com/vi/gTV0B_p9jTo/mqdefault.jpg', '2017-07-05 07:41:07'),
(22, 31, 1, 'X6D1HVUU71s', 'То, чему не научат Вас в школе', '', 'https://i.ytimg.com/vi/X6D1HVUU71s/mqdefault.jpg', '2017-07-05 07:42:22'),
(23, 32, 1, '9AHSvQjWjJ0', 'Стетхем у Вани', '', 'https://i.ytimg.com/vi/9AHSvQjWjJ0/mqdefault.jpg', '2017-07-05 08:00:59'),
(24, 32, 1, '57KLmxJ0LoY', 'Джеки у Вани', '', 'https://i.ytimg.com/vi/57KLmxJ0LoY/mqdefault.jpg', '2017-07-05 08:01:31'),
(25, 32, 1, 'mtN7-gaHlt4', 'Шварц у Вани', '', 'https://i.ytimg.com/vi/mtN7-gaHlt4/mqdefault.jpg', '2017-07-05 08:02:16'),
(26, 32, 1, 'w-3OwEuNEcE', 'Мила у вани', '', 'https://i.ytimg.com/vi/w-3OwEuNEcE/mqdefault.jpg', '2017-07-05 08:02:45'),
(27, 32, 1, 'IDbj3rVDMOc', 'Смит у Вани', '', 'https://i.ytimg.com/vi/IDbj3rVDMOc/mqdefault.jpg', '2017-07-05 08:03:31'),
(28, 32, 1, 'ELtnee6kCjw', 'Питт у Вани', '', 'https://i.ytimg.com/vi/ELtnee6kCjw/mqdefault.jpg', '2017-07-05 08:03:56'),
(31, 25, 1, 'Rk2bczaGcaU', 'Украина мае талант 5 - Максим Чечнев. Финал 25.05.13', '', 'https://i.ytimg.com/vi/Rk2bczaGcaU/mqdefault.jpg', '2017-07-05 05:36:00'),
(33, 14, 1, 'NGZ7ibCrjOQ', 'Подборка! Смешные кошки и коты. Ржака до слёз.', '', 'https://i.ytimg.com/vi/NGZ7ibCrjOQ/mqdefault.jpg', '2017-07-05 05:49:28'),
(34, 13, 1, 'Qz-At-ufpds', 'Темы и цветовые схемы', 'Темы и цветовые схемы', 'https://i.ytimg.com/vi/Qz-At-ufpds/mqdefault.jpg', '2017-07-05 06:02:27'),
(37, 14, 1, 'H37U4A2O9dw', 'bvfd', 'grvververv', 'https://i.ytimg.com/vi/H37U4A2O9dw/mqdefault.jpg', '2017-07-05 20:09:07'),
(38, 25, 1, 'z812vm2CPrs', 'КВН Максимум - Встреча выпускников 2015 (полное выступление команды)', '', 'https://i.ytimg.com/vi/z812vm2CPrs/mqdefault.jpg', '2017-07-05 05:46:32'),
(40, 20, 1, 'iB4XwHvHzXQ', 'Турция - Украина 0:3. Отбор ЧМ-2006 (подробный обзор).', '', 'https://i.ytimg.com/vi/iB4XwHvHzXQ/mqdefault.jpg', '2017-07-05 06:34:12'),
(42, 25, 1, 'ZmbDYxoKlCY', 'СУЩЕСТВА КОТОРЫЕ МОГУТ ТЕБЯ СЪЕСТЬ! ч.1', '', 'https://i.ytimg.com/vi/ZmbDYxoKlCY/mqdefault.jpg', '2017-07-05 08:17:40'),
(43, 34, 1, '9oPx9V2HIpo', 'Красивый постановочный бой !', '', 'https://i.ytimg.com/vi/9oPx9V2HIpo/mqdefault.jpg', '2017-07-05 19:47:04'),
(44, 36, 1, 'et281UHNoOU', 'Ленинград — Экспонат', '', 'https://i.ytimg.com/vi/et281UHNoOU/mqdefault.jpg', '2017-07-04 21:29:01'),
(46, 33, 1, 'kTissSC34eY', 'купщшкоелп', 'екумкеи', 'https://i.ytimg.com/vi/kTissSC34eY/mqdefault.jpg', '2017-07-05 11:45:12'),
(47, 38, 1, 'PDylgzybWAw', 'Оливер жжёт', 'Еженедельный выпуск актуальных новостей', 'https://i.ytimg.com/vi/PDylgzybWAw/mqdefault.jpg', '2017-07-05 10:48:14'),
(48, 33, 1, '4vPrTC5qMh0', 'Привет', 'оп оп', 'https://i.ytimg.com/vi/4vPrTC5qMh0/mqdefault.jpg', '2017-07-05 18:58:08'),
(49, 33, 1, 'CPGFfVLdQ9w', 'привте', 'привет привет', 'https://i.ytimg.com/vi/CPGFfVLdQ9w/mqdefault.jpg', '2017-07-05 20:39:37'),
(50, 14, 1, 'zPx5AUx0zhg', 'ghbdtn', 'irgjepignerwvwuepirnjkvwejgnv', 'https://i.ytimg.com/vi/zPx5AUx0zhg/mqdefault.jpg', '2017-07-05 07:40:07'),
(51, 38, 1, 'WQnAxOQxQIU', 'норм слова', 'зацените', 'https://i.ytimg.com/vi/WQnAxOQxQIU/mqdefault.jpg', '2017-07-05 15:47:42'),
(52, 38, 1, 'C3lWwBslWqg', 'Sting - Desert Rose', '', 'https://i.ytimg.com/vi/C3lWwBslWqg/mqdefault.jpg', '2017-07-05 15:48:25'),
(53, 38, 1, 'hT_nvWreIhg', 'OneRepublic - Counting Stars', '', 'https://i.ytimg.com/vi/hT_nvWreIhg/mqdefault.jpg', '2017-07-05 15:48:42'),
(54, 33, 1, '2yAk6HPPS6g', 'тест', '', 'https://i.ytimg.com/vi/2yAk6HPPS6g/mqdefault.jpg', '2017-07-05 15:05:10'),
(55, 33, 1, '5dqcqlLPrKI', 'Видео', 'Описание видео видео описание', 'https://i.ytimg.com/vi/5dqcqlLPrKI/mqdefault.jpg', '2017-07-05 18:12:25'),
(56, 14, 1, 'pem728HoZ5Y', 'Футбол', 'Привет', 'https://i.ytimg.com/vi/pem728HoZ5Y/mqdefault.jpg', '2017-07-05 12:13:55');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `z_attachments`
--
ALTER TABLE `z_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_auth_assignment`
--
ALTER TABLE `z_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `z_auth_item`
--
ALTER TABLE `z_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `z_auth_item_child`
--
ALTER TABLE `z_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `z_auth_misstep`
--
ALTER TABLE `z_auth_misstep`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_auth_rule`
--
ALTER TABLE `z_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `z_blacklist`
--
ALTER TABLE `z_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_board`
--
ALTER TABLE `z_board`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `owner` (`owner`);

--
-- Индексы таблицы `z_category`
--
ALTER TABLE `z_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_comments`
--
ALTER TABLE `z_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_confirm_email`
--
ALTER TABLE `z_confirm_email`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_dialog`
--
ALTER TABLE `z_dialog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_dialog_members`
--
ALTER TABLE `z_dialog_members`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_events`
--
ALTER TABLE `z_events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_friend`
--
ALTER TABLE `z_friend`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_geolocation`
--
ALTER TABLE `z_geolocation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_geolocation_cities`
--
ALTER TABLE `z_geolocation_cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vk_city_id` (`vk_city_id`);

--
-- Индексы таблицы `z_geolocation_countries`
--
ALTER TABLE `z_geolocation_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso_code` (`iso_code`);

--
-- Индексы таблицы `z_language`
--
ALTER TABLE `z_language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abb` (`code`);

--
-- Индексы таблицы `z_likes`
--
ALTER TABLE `z_likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_message`
--
ALTER TABLE `z_message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_migration`
--
ALTER TABLE `z_migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `z_news`
--
ALTER TABLE `z_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `user` (`user`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `z_newsfeed`
--
ALTER TABLE `z_newsfeed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_notice`
--
ALTER TABLE `z_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `z_photo`
--
ALTER TABLE `z_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `album` (`album`);

--
-- Индексы таблицы `z_photoalbum`
--
ALTER TABLE `z_photoalbum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `z_rating_events`
--
ALTER TABLE `z_rating_events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_rating_log`
--
ALTER TABLE `z_rating_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_school`
--
ALTER TABLE `z_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FULLTEXT` (`title`);

--
-- Индексы таблицы `z_user`
--
ALTER TABLE `z_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `z_user_description`
--
ALTER TABLE `z_user_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country`),
  ADD KEY `language` (`language`),
  ADD KEY `name` (`name`),
  ADD KEY `FULLTEXT` (`name`);

--
-- Индексы таблицы `z_user_privacy`
--
ALTER TABLE `z_user_privacy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_user_search`
--
ALTER TABLE `z_user_search`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `z_video`
--
ALTER TABLE `z_video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `z_attachments`
--
ALTER TABLE `z_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT для таблицы `z_auth_misstep`
--
ALTER TABLE `z_auth_misstep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT для таблицы `z_blacklist`
--
ALTER TABLE `z_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `z_board`
--
ALTER TABLE `z_board`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;
--
-- AUTO_INCREMENT для таблицы `z_category`
--
ALTER TABLE `z_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `z_comments`
--
ALTER TABLE `z_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1244;
--
-- AUTO_INCREMENT для таблицы `z_confirm_email`
--
ALTER TABLE `z_confirm_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT для таблицы `z_dialog`
--
ALTER TABLE `z_dialog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `z_dialog_members`
--
ALTER TABLE `z_dialog_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `z_events`
--
ALTER TABLE `z_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT для таблицы `z_friend`
--
ALTER TABLE `z_friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT для таблицы `z_geolocation`
--
ALTER TABLE `z_geolocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT для таблицы `z_geolocation_cities`
--
ALTER TABLE `z_geolocation_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `z_geolocation_countries`
--
ALTER TABLE `z_geolocation_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `z_language`
--
ALTER TABLE `z_language`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `z_likes`
--
ALTER TABLE `z_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1667;
--
-- AUTO_INCREMENT для таблицы `z_message`
--
ALTER TABLE `z_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT для таблицы `z_news`
--
ALTER TABLE `z_news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT для таблицы `z_newsfeed`
--
ALTER TABLE `z_newsfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;
--
-- AUTO_INCREMENT для таблицы `z_notice`
--
ALTER TABLE `z_notice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `z_photo`
--
ALTER TABLE `z_photo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;
--
-- AUTO_INCREMENT для таблицы `z_photoalbum`
--
ALTER TABLE `z_photoalbum`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;
--
-- AUTO_INCREMENT для таблицы `z_rating_events`
--
ALTER TABLE `z_rating_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `z_rating_log`
--
ALTER TABLE `z_rating_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `z_school`
--
ALTER TABLE `z_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT для таблицы `z_user`
--
ALTER TABLE `z_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT для таблицы `z_video`
--
ALTER TABLE `z_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `z_auth_assignment`
--
ALTER TABLE `z_auth_assignment`
  ADD CONSTRAINT `z_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `z_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `z_auth_item`
--
ALTER TABLE `z_auth_item`
  ADD CONSTRAINT `z_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `z_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `z_auth_item_child`
--
ALTER TABLE `z_auth_item_child`
  ADD CONSTRAINT `z_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `z_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `z_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `z_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
