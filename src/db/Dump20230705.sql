CREATE DATABASE IF NOT EXISTS DSI_sensibilisation;
USE dsi_sensibilisation;
-- jjjj
CREATE TABLE IF NOT EXISTS Themes (
  `id_theme` INT NOT NULL AUTO_INCREMENT,
  `name_theme` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_theme`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Sensis(
  `id_sensi` INT NOT NULL AUTO_INCREMENT,
  `price_sensi`  DECIMAL(5, 2) NOT NULL,
  `name_sensi` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_sensi`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Status (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `name_status` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_status`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Enterprises(
  `id_enterprise` INT NOT NULL AUTO_INCREMENT,
  `siren_enterprise`  INT NOT NULL,
  `adress_enterprise` VARCHAR(150) NOT NULL,
  `referent_handicap_enterprise` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_enterprise`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS User_contacts(
  `id_user_contact` INT NOT NULL AUTO_INCREMENT,
  `first_name_user_contact` VARCHAR(70) NOT NULL,
  `last_name_user_contact` VARCHAR(70) NOT NULL,
  `phone_number_user_contact` VARCHAR(70) NOT NULL,
  `email_user_contact` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_user_contact`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Users(
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `role_user` VARCHAR(70) NOT NULL,
  `password_user` VARCHAR(250) NOT NULL,
  `id_user_contact` INT NOT NULL,
  PRIMARY KEY (`id_user`),
KEY `fk_id_user_contact`(`id_user_contact`),
CONSTRAINT `fk_user_contact` FOREIGN KEY (`id_user_contact`) REFERENCES `User_contacts` (`id_user_contact`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Blogs(
  `id_blog` INT NOT NULL AUTO_INCREMENT,
  `title_blog` VARCHAR(70) NOT NULL,
  `picture_path_blog` VARCHAR(255) NOT NULL,
  `content_blog` VARCHAR(70) NOT NULL,
  `date_blog` DATE NOT NULL,
  `id_user`INT NOT NULL,
  PRIMARY KEY (`id_blog`),
  KEY `fk_id_user`(`id_user`),
CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Comments(
  `id_coment` INT NOT NULL AUTO_INCREMENT,
  `content_coment` VARCHAR(70) NOT NULL,
  `alert_coment` VARCHAR(50) NOT NULL,
  `date_coment` DATE NOT NULL,
  `id_blog`INT NOT NULL,
  PRIMARY KEY (`id_coment`),
  KEY `fk_id_blog`(`id_blog`),
    CONSTRAINT `fk_blog` FOREIGN KEY (`id_blog`) REFERENCES `Blogs` (`id_blog`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Answers(
  `id_answer` INT NOT NULL AUTO_INCREMENT,
  `contact_answer` VARCHAR(70) NOT NULL,
  `date_answer` DATE NOT NULL,
  `alert_answer` VARCHAR (50) NOT NULL,
  `id_comment` INT NOT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `fk_id_comment`(`id_comment`),
  CONSTRAINT `fk_comment` FOREIGN KEY (`id_comment`) REFERENCES `Comments` (`id_comment`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Sensi_themes(
  `id_sensi_theme` INT NOT NULL AUTO_INCREMENT,
  `id_sensi` INT NOT NULL,
  `id_theme` INT NOT NULL,
  `id_status` INT NOT NULL,
  PRIMARY KEY (`id_sensi_theme`),
  KEY `fk_id_sensi`(`id_sensi`),
  KEY `fk_id_theme`(`id_theme`),
  KEY `fk_id_status`(`id_status`),
  CONSTRAINT `fk_sensi_theme_sensi` FOREIGN KEY (`id_sensi`) REFERENCES `Sensis` (`id_sensi`) ON DELETE CASCADE ON UPDATE CASCADE,
      CONSTRAINT `fk_sensi_theme_theme` FOREIGN KEY (`id_theme`) REFERENCES `Themes` (`id_theme`) ON DELETE CASCADE ON UPDATE CASCADE,
              CONSTRAINT `fk_sensi_theme_status` FOREIGN KEY (`id_status`) REFERENCES `Status` (`id_status`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Contacts(
  `id_contact` INT NOT NULL AUTO_INCREMENT,
  `function_contact` VARCHAR(70) NOT NULL,
  `number_people_contact` INT NOT NULL,
   `team_contact`  VARCHAR(100)NOT NULL,
  `id_user_contact` INT NOT NULL,
  `id_enterprise` INT NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `fk_id_user_contact`(`id_user_contact`),
  KEY `fk_id_enterprise`(`id_enterprise`),
CONSTRAINT `fk_contact_user_contact` FOREIGN KEY (`id_user_contact`) REFERENCES `User_contacts` (`id_user_contact`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contact_enterprise` FOREIGN KEY (`id_enterprise`) REFERENCES `Enterprises` (`id_enterprise`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE IF NOT EXISTS Commands(
  `id_command` INT NOT NULL AUTO_INCREMENT,
  `modality_command` VARCHAR(70) NOT NULL,
  `date_start_command` DATE NOT NULL,
  `date_end_command` DATE NOT NULL,
  `id_sensi_theme`INT NOT NULL,
  `id_contact`INT NOT NULL,
  PRIMARY KEY (`id_command`),
  KEY `fk_id_sensi_theme`(`id_sensi_theme`),
  KEY `fk_id_contact`(`id_contact`),
CONSTRAINT `fk_command_sensi_theme` FOREIGN KEY (`id_sensi_theme`) REFERENCES `Sensi_themes` (`id_sensi_theme`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_command_contact` FOREIGN KEY (`id_contact`) REFERENCES `Contacts` (`id_contact`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_tests` (
  `id_user` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL
);
INSERT INTO user_tests VALUES (0, 'dhjh', 'njhj');