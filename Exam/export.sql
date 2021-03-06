# moje da iziskva promqna:

 create database softuni_library;

 use softuni_library;

CREATE TABLE `users` (
                       `id` INT(11) NOT NULL AUTO_INCREMENT,
                       `username` VARCHAR(255) NOT NULL,
                       `password` VARCHAR(255) NOT NULL,
                       `full_name` VARCHAR(255) NOT NULL,
                       `born_on` DATETIME NOT NULL,
                       PRIMARY KEY (`id`),
                       UNIQUE INDEX `username` (`username`)
)
  ENGINE=InnoDB
;

CREATE TABLE `genres` (
                        `id` INT(11) NOT NULL AUTO_INCREMENT,
                        `name` VARCHAR(50) NOT NULL,
                        PRIMARY KEY (`id`)
)
  ENGINE=InnoDB
;

CREATE TABLE `books` (
                       `id` INT(11) NOT NULL AUTO_INCREMENT,
                       `title` VARCHAR(50) NOT NULL,
                       `author` VARCHAR(50) NOT NULL,
                       `description` TEXT NOT NULL,
                       `image` VARCHAR(255) NOT NULL,
                       `genre_id` INT(11) NOT NULL,
                       `user_id` INT(11) NOT NULL,
                       `added_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       PRIMARY KEY (`id`),
                       INDEX `FK_books_genres` (`genre_id`),
                       INDEX `FK_books_users` (`user_id`),
                       CONSTRAINT `FK_books_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
                       CONSTRAINT `FK_books_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)
  COLLATE='utf8_general_ci'
  ENGINE=InnoDB
;


INSERT INTO genres (name)
VALUES ('Drama');
INSERT INTO genres (name)
VALUES ('Educational');
INSERT INTO genres (name)
VALUES ('Adventure');
