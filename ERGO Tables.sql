-- Script was generated by Devart dbForge Studio for MySQL, Version 5.0.97.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2013-06-23 17:55:15
-- Server version: 5.1.68-cll
-- Client version: 4.1

USE setine5_ERGO;

CREATE TABLE events(
  event_ID INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Event ID Automaically created when event arrives (required)',
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'UTC Date/Time of event arrival in database (ISO 8601) 2013-06-08T08:02Z',
  pixel_ID SMALLINT(6) UNSIGNED NOT NULL COMMENT 'ID of reporting pixel',
  latitude DECIMAL(10, 4) NOT NULL COMMENT 'Pixel reported latitude (decimal xx.xxxx) required',
  longitude DECIMAL(10, 4) NOT NULL COMMENT 'Pixel reported longitude (decimal xx.xxxx) required',
  analog DECIMAL(5, 2) DEFAULT NULL COMMENT 'Analog value read from pixel A-to-D (not required)',
  wnR SMALLINT(6) NOT NULL COMMENT 'Unsigned short (-32768..32767)',
  towMsR INT(11) UNSIGNED NOT NULL COMMENT 'Time of Week rising edge in msec. Unsigned Long (0.. 4,294,967,295)',
  towSubMsR INT(11) UNSIGNED NOT NULL COMMENT 'Millisecond fraction of tow of rising edge in nsec (0..4,294,967,295)',
  PRIMARY KEY (event_ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 88
AVG_ROW_LENGTH = 585
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE organizations(
  Org_ID SMALLINT(6) NOT NULL AUTO_INCREMENT COMMENT 'Automatically created when new org is entered',
  name VARCHAR(255) NOT NULL COMMENT 'Org name (required)',
  contact_person VARCHAR(255) NOT NULL COMMENT 'Contact Name (Required)',
  contact_email VARCHAR(255) DEFAULT NULL,
  website VARCHAR(255) DEFAULT NULL,
  address1 VARCHAR(255) NOT NULL,
  address2 VARCHAR(255) DEFAULT NULL,
  city VARCHAR(255) NOT NULL COMMENT 'Org City (Required)',
  state VARCHAR(255) NOT NULL,
  postal_code VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  phone VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (Org_ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE pixels(
  Pixel_ID SMALLINT(6) NOT NULL AUTO_INCREMENT COMMENT 'Automatic entry when new Pixel created ',
  Org_ID SMALLINT(6) NOT NULL COMMENT 'Which organization has this pixel',
  name VARCHAR(255) DEFAULT NULL COMMENT 'Name of Pixel (not required)',
  birthday DATETIME NOT NULL COMMENT 'Date/Time when production test complete (Required)',
  first_light DATETIME DEFAULT NULL COMMENT 'Date/Time pixel first noticed in system',
  last_seen DATETIME DEFAULT NULL COMMENT 'Last reported event from this pixel',
  PRIMARY KEY (Pixel_ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;