
CREATE TABLE IF NOT EXISTS `bookmark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `private` bool DEFAULT false,
  `pin` bool DEFAULT false,
  `comment_cnt` int DEFAULT 0,
  `hit_cnt` int DEFAULT 0,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userIdx` (`user`)
);

CREATE TABLE IF NOT EXISTS `tag` (
  `bookmark_id` bigint(20) NOT NULL,
  `tag` varchar(255) NOT NULL,
  KEY `bookmarkIdIdx` (`bookmark_id`),
  KEY `tagIdx` (`tag`)
);
