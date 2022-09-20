-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3308
-- Время создания: Ноя 20 2019 г., 22:30
-- Версия сервера: 5.6.41
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
-- База данных: `cinema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `cinemaname` varchar(128) NOT NULL,
  `cinemaaddres` varchar(128) NOT NULL,
  `cinemaphone` varchar(20) NOT NULL,
  `imagepath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cinemas`
--

INSERT INTO `cinemas` (`id`, `cinemaname`, `cinemaaddres`, `cinemaphone`, `imagepath`) VALUES
(1, 'Кинотеатр \"Кино+Фильм\"', 'г. Новосибирск, ул. Фрунзе, д. 67', '+7(951)571-4250', 'cinemaM.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `pass` varchar(128) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `imagepath` varchar(225) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id`, `login`, `pass`, `roleid`, `discount`, `total`, `imagepath`, `balance`) VALUES
(1, 'Admin', 'Admin', 3, 0, 0, '', NULL),
(2, 'Customer', 'Customer', 2, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `genid` int(11) DEFAULT NULL,
  `filmname` varchar(128) NOT NULL,
  `genre` varchar(128) NOT NULL,
  `ticketprice` int(11) NOT NULL,
  `info` varchar(256) NOT NULL,
  `rate` double DEFAULT NULL,
  `imagepath` varchar(256) NOT NULL,
  `action` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`id`, `genid`, `filmname`, `genre`, `ticketprice`, `info`, `rate`, `imagepath`, `action`) VALUES
(1, 1, 'Малефисента: Владычица тьмы', '', 200, 'Действие происходит через несколько лет после того, как Малефисента наложила злые чары на принцессу Аврору. Фильм рассказывает про сложную взаимосвязь между тёмной феей и будущей королевой, о новых союзниках и противниках в деле защиты волшебного леса и ма', 6, 'images/Mal.jpg', 0),
(3, 2, 'Путешествие Доктора Дулиттла', '', 200, 'Семь лет назад доктор Дулиттл, прославленный врач-ветеринар, живущий в викторианской Англии, потерял свою жену. Теперь он ведет затворнический образ жизни, скрывшись за высокими стенами своего поместья. Экзотические животные из его коллекции — его единстве', 6, 'images/Doolittle.jpg', 0),
(11, 5, 'Перевозчик', '', 150, 'Бывший десантник Фрэнк Мартин имеет неплохой бизнес — перевозит любые грузы по французскому Средиземноморью и делает свою работу быстро и качественно. Недостатка в клиентах нет, ведь, он всегда неукоснительно соблюдает три правила: не меняет условий сделки', 16, 'images/Perevoz.jpg', 0),
(12, 1, 'Мстители: Финал', '', 200, 'Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса. После наиболее масштабной и трагической битвы в истории они не могут допустить оши', 16, 'images/EndGame.jpg', 0),
(13, 1, 'Семейка Аддамс', '', 200, 'Папа любит долгие прогулки в ненастную погоду. Мама считает, что черный цвет самый яркий. У детей кладбище — любимая площадка для игр. Бабушка выпивает пару капель яда перед сном. Вы все еще думаете, что ваши родственники странные? Знакомьтесь — семейка Ад', 12, 'images/Addams.jpg', 0),
(14, 1, 'Доктор Сон', '', 250, 'Прошло много лет с тех пор, как мальчик-ясновидец Дэнни Торранс пережил кошмарный сезон в отеле «Оверлук», где стал свидетелем безумия и гибели своего отца. Повзрослев, но не оправившись от детской травмы, Дэнни ведёт жизнь маргинала-алкоголика. С ним уста', 18, 'images/DrSleep.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `genre`) VALUES
(3, 'Боевик'),
(2, 'Комедия'),
(6, 'Научная фантастика в кинематографе'),
(5, 'Триллер'),
(7, 'Ужасы'),
(1, 'Фэнтези');

-- --------------------------------------------------------

--
-- Структура таблицы `genresfilms`
--

CREATE TABLE `genresfilms` (
  `id` int(11) NOT NULL,
  `filmid` int(11) DEFAULT NULL,
  `genid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genresfilms`
--

INSERT INTO `genresfilms` (`id`, `filmid`, `genid`) VALUES
(1, 1, 3),
(10, 3, 1),
(12, 11, 3),
(14, 12, 6),
(16, 13, 7),
(18, 14, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `filmid` int(11) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(3, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Структура таблицы `selebrations`
--

CREATE TABLE `selebrations` (
  `id` int(11) NOT NULL,
  `namesel` varchar(128) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` varchar(2048) NOT NULL,
  `imagepath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `selebrations`
--

INSERT INTO `selebrations` (`id`, `namesel`, `date`, `time`, `description`, `imagepath`) VALUES
(1, 'Новый Год', '2019-12-25', '18:00:00', 'Новый год — главный календарный праздник, наступающий в момент перехода с последнего дня года в первый день следующего года. Отмечается многими народами в соответствии с принятым календарём.\r\n\r\nНачало года с 1 января было установлено римским правителем Юлием Цезарем в 46 году до нашей эры. В Древнем Риме этот день был посвящён Янусу — богу выбора, дверей и всех начал. Месяц январь получил своё название в честь бога Януса, которого изображали с двумя лицами: одно смотрело вперёд, а другое — назад.', 'NewYear.jpg'),
(2, 'Защита диплома', '2019-11-26', '18:30:00', 'Защита диплома – это выступление студента перед Государственной аттестационной комиссией с текстом (выдержкой) из своей дипломной работы. Как правило, студенту дается 10–15 минут для краткого изложения диплома.', 'Dip.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `filmid` int(11) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `time` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `filmid`, `date`, `time`) VALUES
(5, 1, '21.11.2019', '10:10'),
(6, 1, '21.11.2019', '17:25'),
(7, 1, '21.11.2019', '18:00'),
(8, 1, '22.11.2019', '18:00'),
(9, 1, '23.11.2019', '10:10'),
(10, 1, '23.11.2019', '21:05'),
(11, 3, '21.11.2019', '12:15'),
(12, 3, '22.11.2019', '08:20'),
(13, 3, '22.11.2019', '19:40'),
(14, 12, '25.12.2019', '22:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cinemaname` (`cinemaname`),
  ADD UNIQUE KEY `cinemaaddres` (`cinemaaddres`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `roleid` (`roleid`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filmname` (`filmname`),
  ADD KEY `genid` (`genid`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genre` (`genre`);

--
-- Индексы таблицы `genresfilms`
--
ALTER TABLE `genresfilms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid` (`filmid`),
  ADD KEY `genid` (`genid`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid` (`filmid`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Индексы таблицы `selebrations`
--
ALTER TABLE `selebrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namesel` (`namesel`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid` (`filmid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `genresfilms`
--
ALTER TABLE `genresfilms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `selebrations`
--
ALTER TABLE `selebrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`genid`) REFERENCES `genre` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `genresfilms`
--
ALTER TABLE `genresfilms`
  ADD CONSTRAINT `genresfilms_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genresfilms_ibfk_2` FOREIGN KEY (`genid`) REFERENCES `genre` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `films` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `films` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
