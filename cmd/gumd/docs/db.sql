
CREATE TABLE IF NOT EXISTS `bookmark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `private` bool NOT NULL DEFAULT false,
  `pin` bool NOT NULL DEFAULT false,
  `comment_cnt` int NOT NULL DEFAULT 0,
  `hit_cnt` int NOT NULL DEFAULT 0,
  `ctime` datetime NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userIdx` (`user`)
);

CREATE TABLE IF NOT EXISTS `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookmark_id` bigint(20) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagIdx` (`tag`)
);

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookmark_id` bigint(20) NOT NULL,
  `body` text NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `feed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) NOT NULL,
  `bookmark_id` bigint(20) NOT NULL,
  `body` text NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
