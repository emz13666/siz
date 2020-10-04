CREATE TABLE elektroinstrument (
  id int IDENTITY,
  id_uch int NOT NULL default 0,
  inv_number varchar(50),
  name varchar(255) NOT NULL default '',
  reserv varchar(100),
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id)
);


CREATE TABLE siz (
  id int IDENTITY,
  id_uch int NOT NULL default 0,
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE takelag (
  id int IDENTITY,
  id_uch int NOT NULL default 0,
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE uchastok (
  id int NOT NULL IDENTITY,
  name varchar(100) default NULL,
  PRIMARY KEY  (id)
);

INSERT INTO uchastok(name) VALUES ('������� ��� � ��');
INSERT INTO uchastok(name) VALUES ('���');
INSERT INTO uchastok(name) VALUES ('��� ��');
INSERT INTO uchastok(name) VALUES ('��� ���');
INSERT INTO uchastok(name) VALUES ('��� ��');

CREATE TABLE zazeml (
  id int IDENTITY,
  id_uch int NOT NULL default 0,
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE znaniya_el_bez (
  id int IDENTITY,
  tab_num varchar(6) NOT NULL default '000000',
  id_uch int NOT NULL default 0,
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  gruppa_el tinyint NOT NULL default 1,
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint default NULL,
  PRIMARY KEY  (id)
);

-- 
-- ���� ������ ������� `znaniya_el_bez`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `znaniya_gpm`
-- 

CREATE TABLE znaniya_gpm (
  id int IDENTITY,
  tab_num varchar(6) NOT NULL default '000000',
  id_uch int NOT NULL default 0,
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  professiya varchar(255) NOT NULL default '',
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint default NULL,
  PRIMARY KEY  (id)
);

-- 
-- ���� ������ ������� `znaniya_gpm`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `znaniya_met_stanki`
-- 

CREATE TABLE znaniya_met_stanki (
  id int IDENTITY,
  tab_num varchar(6) NOT NULL default '000000',
  id_uch int NOT NULL default 0,
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint default NULL,
  PRIMARY KEY  (id)
);

-- 
-- ���� ������ ������� `znaniya_met_stanki`
-- 


-- --------------------------------------------------------

-- 
-- ��������� ������� `znaniya_otipb`
-- 

CREATE TABLE znaniya_otipb (
  id int IDENTITY,
  tab_num varchar(6) NOT NULL default '000000',
  id_uch int NOT NULL default 0,
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  date_first datetime NOT NULL default '1981-10-25 00:00:00',
  date_next datetime NOT NULL default '1981-10-25 00:00:00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint default NULL,
  PRIMARY KEY  (id)
);

-- 
-- ���� ������ ������� `znaniya_otipb`
-- 

        