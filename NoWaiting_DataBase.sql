CREATE DATABASE nowaiting;
USE nowaiting;

CREATE TABLE store(
  num_store INT NOT NULL,
  managerID VARCHAR(20) NOT NULL,
  store_name VARCHAR(10) NOT NULL,
  location VARCHAR(30) NOT NULL,
  phone VARCHAR(11) NULL,
  manager_name VARCHAR(10) NULL,
  PRIMARY KEY (num_store, managerID)
  );

CREATE TABLE member_information(
  ID VARCHAR(20) NOT NULL UNIQUE,
  Tag_number INT NOT NULL UNIQUE,
  `password` VARCHAR(16) NOT NULL,
  User_name VARCHAR(10) NOT NULL,
  gender BINARY(1) NOT NULL,
  Phone_number VARCHAR(11) NULL,
  birth_date DATE NULL,
  num_store INT NOT NULL,
  PRIMARY KEY (ID, Tag_number),
  INDEX `fk_storeM_idx` (num_store ASC),
  CONSTRAINT `fk_storeM` FOREIGN KEY (num_store)
    REFERENCES store (num_store)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE washer(
  num_store INT NOT NULL,
  managerID VARCHAR(20) NOT NULL,
  washer_num INT NOT NULL UNIQUE,
  model_name VARCHAR(20) NULL,
  washer_kg DOUBLE NOT NULL,
  washer_W DOUBLE NOT NULL,
  PRIMARY KEY (num_store, managerID),
  INDEX `fk_which_storeWasher_idx` (num_store ASC, managerID ASC),
  CONSTRAINT `fk_which_storeWasher` FOREIGN KEY (num_store, managerID)
    REFERENCES store (num_store, managerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE washer_status(
  washer_num INT NOT NULL,
  `status` BINARY(1) NOT NULL,
  course VARCHAR(10) NOT NULL,
  Use_id VARCHAR(20) NOT NULL,
  Tag_number INT NOT NULL UNIQUE,
  PRIMARY KEY (washer_num),
  INDEX `fk_WasherIDUseRandom_idx` (Use_id ASC, Tag_number ASC),
  INDEX `fk_which_Washer_idx` (washer_num ASC),
  CONSTRAINT `fk_WasherIDUseRandom` FOREIGN KEY (Use_id, Tag_number)
    REFERENCES member_information (ID, Tag_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_which_Washer` FOREIGN KEY (washer_num)
    REFERENCES washer (washer_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE washer_Time(
  washer_num INT NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  PRIMARY KEY (washer_num),
  CONSTRAINT `fk_washernum_Time` FOREIGN KEY (washer_num)
    REFERENCES washer_status (washer_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE commuite_info(
  No_Com_writing INT NOT NULL AUTO_INCREMENT UNIQUE,
  title VARCHAR(45) NOT NULL,
  letter VARCHAR(1025) NULL,
  missing_article_processing BINARY(1) NOT NULL,
  writer VARCHAR(20) NOT NULL UNIQUE,
  store_info INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (No_Com_writing),
  INDEX `fk_Whoiswriter_idx` (writer ASC),
  INDEX `fk_WhichStore_idx` (store_info ASC),
  CONSTRAINT `fk_Whoiswriter` FOREIGN KEY (writer)
    REFERENCES member_information (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_WhichStore` FOREIGN KEY (store_info)
    REFERENCES store (num_store)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE manager(
  managerID VARCHAR(20) NOT NULL UNIQUE,
  managerRandomNum INT NOT NULL UNIQUE,
  `password` VARCHAR(16) NOT NULL,
  store_num_store INT NOT NULL,
  PRIMARY KEY (managerID, managerRandomNum),
  INDEX `fk_managerS_idx` (store_num_store ASC, managerID ASC),
  CONSTRAINT `fk_manager_store` FOREIGN KEY (store_num_store, managerID)
    REFERENCES store (num_store, managerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE dryer(
  num_store INT NOT NULL,
  managerID VARCHAR(20) NOT NULL,
  dryer_num INT NOT NULL UNIQUE,
  model_name VARCHAR(20) NULL,
  dryer_kg DOUBLE NOT NULL,
  dryer_W DOUBLE NOT NULL,
  PRIMARY KEY (num_store, managerID),
  CONSTRAINT `fk_which_storeDryer` FOREIGN KEY (num_store, managerID)
    REFERENCES store (num_store, managerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE dryer_status(
  dryer_num INT NOT NULL UNIQUE,
  `status` BINARY(1) NOT NULL,
  course VARCHAR(10) NOT NULL,
  Use_id VARCHAR(20) NOT NULL,
  Tag_number INT NOT NULL UNIQUE,
  INDEX `fk_DryerIDUseRandom_idx` (Use_id ASC, Tag_number ASC),
  PRIMARY KEY (dryer_num),
  CONSTRAINT `fk_DryerIDUseRandom` FOREIGN KEY (Use_id, Tag_number)
    REFERENCES member_information (ID, Tag_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_which_Dryer` FOREIGN KEY (dryer_num)
    REFERENCES dryer (dryer_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE dryer_Time(
  dryer_num INT NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  PRIMARY KEY (dryer_num),
  CONSTRAINT `fk_dryernum_Time` FOREIGN KEY (dryer_num)
    REFERENCES dryer_status (dryer_num)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);