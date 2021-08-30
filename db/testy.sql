/* INSERT INTO afe(id, date_from) 
SELECT 1, date_from FROM device WHERE id = 1 AND date_to IS NULL; */

SELECT d.serial_number FROM device d JOIN afe a ON (d.id = a.id AND d.date_from = a.date_from) WHERE /*d.id = 1 AND*/ d.date_to IS NULL 

INSERT INTO device(id, date_from, serial_number) 
SELECT max(id) + 1, CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER), "2104160PW0006A0101" FROM device;

SELECT * FROM device;

INSERT INTO "main"."device" ("id", "date_from", "date_to", "serial_number", "production_date", "purchase_date", "type", "status", "comments") VALUES ('1', '1629984975382', '', '2104160PW0020A0101', '', '', '', '', '');
INSERT INTO "main"."device" ("id", "date_from", "date_to", "serial_number", "production_date", "purchase_date", "type", "status", "comments") VALUES ('2', '1630056777961', '', '2104160PW0006A0101', '', '', '', '', '');

CREATE TABLE "hub" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	"ip_address"	TEXT UNIQUE,
	"software_version"	TEXT,
	"module_location"	INTEGER,
	"section_location"	TEXT,
	PRIMARY KEY("id","date_from")
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

CREATE TABLE "scintillator" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	PRIMARY KEY("id","date_from"),
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

CREATE TABLE "afe" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	"can_number"	INTEGER UNIQUE,
	"software_version"	TEXT,
	"sipm_id"	INTEGER,
	"sipm_date_from"	INTEGER,
	"afe_ext_id"	INTEGER,
	"afe_ext_date_from"	INTEGER,
	PRIMARY KEY("id","date_from"),
	FOREIGN KEY("sipm_id","sipm_date_from") REFERENCES sipm("id","date_from"),
	FOREIGN KEY("afe_ext_id","afe_ext_date_from") REFERENCES afe_ext("id","date_from")
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

SELECT * FROM afe

INSERT INTO "main"."afe" ("id", "date_from", "can_number", "software_version") VALUES ('1', '1629984975382', '', '');

CREATE TABLE "afe_ext" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	"sipm_id"	INTEGER,
	"sipm_date_from"	INTEGER,
	PRIMARY KEY("id","date_from"),
	FOREIGN KEY("sipm_id","sipm_date_from") REFERENCES sipm("id","date_from"),
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

PRAGMA table_info('afe');
PRAGMA foreign_key_list('sipm');

CREATE TABLE "sipm" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	"v_br"	REAL,
	"v_op"	REAL,
	"dark_current"	REAL,
	FOREIGN KEY("id","date_from") REFERENCES "device"("id","date_from"),
	PRIMARY KEY("id","date_from"),
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

INSERT INTO afe_main(id, date_from) 
SELECT id, date_from FROM device WHERE id = 4 AND date_to IS NULL;

SELECT id, date_from FROM device WHERE id = 1 AND date_to IS NULL;

SELECT datetime(date_from/1000, 'unixepoch', 'localtime'), serial_number FROM device;

SELECT date_from, serial_number FROM device;

INSERT INTO device(id, date_from, serial_number) 
SELECT max(id) + 1, CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER), "2104160PW0020A0104" FROM device;

INSERT INTO device(id, date_from, serial_number) 
SELECT max(id) + 1, CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER), "2021-D1958" FROM device;

INSERT INTO scintillator(id, date_from) 
SELECT id, date_from FROM device WHERE id = 5 AND date_to IS NULL;

SELECT id, date_from FROM afe_main

CREATE TABLE "afe_main" (
	"id"	INTEGER,
	"date_from"	INTEGER,
	"can_number"	INTEGER UNIQUE,
	"software_version"	TEXT,
	"sipm_id"	INTEGER,
	"sipm_date_from"	INTEGER,
	PRIMARY KEY("id","date_from"),
	FOREIGN KEY("sipm_id","sipm_date_from") REFERENCES sipm("id","date_from"),
	FOREIGN KEY("id","date_from") REFERENCES device("id","date_from")
)

INSERT INTO "main"."afe_main" ("id", "date_from") VALUES ('1', '1629984975382');
INSERT INTO "main"."afe_main" ("id", "date_from") VALUES ('4', '1630068365413');

CREATE TABLE "bar" (
	"id"	INTEGER,
	"number"	TEXT UNIQUE,
	"position_in_section"	INTEGER,
	"orientation"	TEXT,
	"afe_main_id"	INTEGER,
	"afe_main_date_from"	INTEGER,
	"scintillator_id"	INTEGER,
	"scintillator_date_from"	INTEGER,
	"hub_id"	INTEGER,
	"hub_date_from"	INTEGER,
	"afe_ext_id"	INTEGER,
	"afe_ext_date_from"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("afe_main_id","afe_main_date_from") REFERENCES "afe_main"("id","date_from"),
	FOREIGN KEY("afe_ext_id","afe_ext_date_from") REFERENCES "afe_ext"("id","date_from"),
	FOREIGN KEY("scintillator_id","scintillator_date_from") REFERENCES "scintillator"("id","date_from"),
	FOREIGN KEY("hub_id","hub_date_from") REFERENCES "hub"("id","date_from")
)

INSERT INTO device(id, date_from, serial_number) 
SELECT max(id) + 1, CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER), "SN4690" FROM device;

INSERT INTO sipm(id, date_from) 
SELECT id, date_from FROM device WHERE id = 5 AND date_to IS NULL;