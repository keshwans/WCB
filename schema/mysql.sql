CREATE DATABASE wcb;
use wcb;

CREATE TABLE `team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fbid` VARCHAR(255) NOT NULL UNIQUE,
  `team` INT,
  `event_id` INT,
  `datasource` INT,
  `preferred_cause` INT,
  PRIMARY KEY (`id`)
);

CREATE TABLE `achievements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `team` INT NOT NULL,
  `achievement` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `achievement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `distance` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `donors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `donor` INT NOT NULL,
  `participant` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `donor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `luminate_id` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `records` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `participant` INT NOT NULL,
  `date` DATE NOT NULL,
  `distance` INT NOT NULL,
  `source` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `source` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `locality` INT NOT NULL,
  `team_limit` INT NOT NULL,
  `team_building_start` DATE NOT NULL,
  `team_building_end` DATE NOT NULL,
  `cause` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `locality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sponsors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sponsor` INT NOT NULL,
  `participant` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `sponsor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  `luminate_id` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `cause` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);

ALTER TABLE `participant` ADD CONSTRAINT `participant_fk0` FOREIGN KEY (`team`) REFERENCES `team`(`id`);

ALTER TABLE `participant` ADD CONSTRAINT `participant_fk1` FOREIGN KEY (`event_id`) REFERENCES `events`(`id`);

ALTER TABLE `participant` ADD CONSTRAINT `participant_fk2` FOREIGN KEY (`datasource`) REFERENCES `source`(`id`);

ALTER TABLE `participant` ADD CONSTRAINT `participant_fk3` FOREIGN KEY (`preferred_cause`) REFERENCES `cause`(`id`);

ALTER TABLE `achievements` ADD CONSTRAINT `achievements_fk0` FOREIGN KEY (`team`) REFERENCES `team`(`id`);

ALTER TABLE `achievements` ADD CONSTRAINT `achievements_fk1` FOREIGN KEY (`achievement`) REFERENCES `achievement`(`id`);

ALTER TABLE `donors` ADD CONSTRAINT `donors_fk0` FOREIGN KEY (`donor`) REFERENCES `donor`(`id`);

ALTER TABLE `donors` ADD CONSTRAINT `donors_fk1` FOREIGN KEY (`participant`) REFERENCES `participant`(`id`);

ALTER TABLE `records` ADD CONSTRAINT `records_fk0` FOREIGN KEY (`participant`) REFERENCES `participant`(`id`);

ALTER TABLE `records` ADD CONSTRAINT `records_fk1` FOREIGN KEY (`source`) REFERENCES `source`(`id`);

ALTER TABLE `events` ADD CONSTRAINT `events_fk0` FOREIGN KEY (`locality`) REFERENCES `locality`(`id`);

ALTER TABLE `events` ADD CONSTRAINT `events_fk1` FOREIGN KEY (`cause`) REFERENCES `cause`(`id`);

ALTER TABLE `sponsors` ADD CONSTRAINT `sponsors_fk0` FOREIGN KEY (`sponsor`) REFERENCES `sponsor`(`id`);

ALTER TABLE `sponsors` ADD CONSTRAINT `sponsors_fk1` FOREIGN KEY (`participant`) REFERENCES `participant`(`id`);

CREATE UNIQUE INDEX `achievementsIndex` ON `achievements` (`team`, `achievement`);
