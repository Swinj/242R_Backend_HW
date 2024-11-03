CREATE TABLE `users`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(32) NOT NULL,
  `profile_image` VARCHAR(128) NOT NULL,
  `profile_message` VARCHAR(128) NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `sign_up_since` DATETIME NOT NULL,
  PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `channels`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `channel_name` VARCHAR(32) NOT NULL,
  `created_by` INT NOT NULL,
  `channel_link` VARCHAR(128) NOT NULL,
  `capacity` INT NOT NULL,
  `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `since` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created_by`) REFERENCES `users`(`id`)ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `chats`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NOT NULL,
  `created_by` INT NOT NULL,
  `channel` INT NOT NULL,
  `since` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `follows`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `follower` INT NOT NULL,
  `followee` INT NOT NULL,
  `follow_since` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`follower`) REFERENCES `users`(`id`)ON DELETE CASCADE,
  FOREIGN KEY(`followee`) REFERENCES `users`(`id`)ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `blocks`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `blocker` INT NOT NULL,
  `blocked_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`blocker`) REFERENCES `users`(`id`)ON DELETE CASCADE,
  FOREIGN KEY (`blocked_by`) REFERENCES `users`(`id`)ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;