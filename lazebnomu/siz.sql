-- MySQL dump 8.22
--
-- Host: 10.60.60.60    Database: siz
---------------------------------------------------------
-- Server version	3.23.54-max-debug

--
-- Table structure for table 'beep'
--

DROP TABLE IF EXISTS beep;
CREATE TABLE beep (
  id bigint(20) unsigned NOT NULL auto_increment,
  freq int(11) NOT NULL default '0',
  duration int(11) NOT NULL default '0',
  sleep int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

/*!40000 ALTER TABLE beep DISABLE KEYS */;

--
-- Dumping data for table 'beep'
--


LOCK TABLES beep WRITE;
INSERT INTO beep VALUES (1,500,500,500),(2,500,500,500),(3,500,500,500),(4,500,500,500),(5,500,500,500),(6,500,500,500),(7,500,500,500),(8,500,500,500);

/*!40000 ALTER TABLE beep ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'elektroinstrument'
--

DROP TABLE IF EXISTS elektroinstrument;
CREATE TABLE elektroinstrument (
  id bigint(20) unsigned NOT NULL auto_increment,
  id_uch bigint(20) unsigned NOT NULL default '0',
  inv_number varchar(50) default NULL,
  name varchar(255) default NULL,
  reserv varchar(100) default NULL,
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE elektroinstrument DISABLE KEYS */;

--
-- Dumping data for table 'elektroinstrument'
--


LOCK TABLES elektroinstrument WRITE;
INSERT INTO elektroinstrument VALUES (10,3,'25.40.5/2','���������������',NULL,'2007-05-29','2007-11-28','�������',NULL),(11,3,'25.40.5/7','���������������',NULL,'2007-05-29','2007-11-28','�������� ��-1',NULL),(9,3,'25.40.5/1','���������������',NULL,'2007-05-29','2007-11-28','�����',NULL),(7,2,'1605090','���������',NULL,'2007-10-07','2008-04-01','�������� �����������',NULL),(12,3,'25.40.5/6','���������������',NULL,'2007-05-29','2007-11-28','���������',NULL),(13,3,'25.40.5/3','���������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(14,3,'25.40.5/4','���������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(15,3,'25.40.5/5','���������������',NULL,'2007-09-11','2008-03-11','����������',NULL),(16,3,'25.40.5/14','���������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(17,3,'25.40.5/8','���������������',NULL,'2007-09-11','2008-03-11','��������',NULL),(18,3,'25.40.5/9','���������������',NULL,'2007-09-11','2008-03-11','��������',NULL),(19,3,'25.40.5/12','���������������',NULL,'2007-09-11','2008-03-11','��������',NULL),(20,3,'25.40.5/20','���������������',NULL,'2007-09-11','2008-03-11','�����',NULL),(21,3,'25.40.5/21','���������������',NULL,'2007-09-11','2008-03-11','��������',NULL),(22,3,'25.40.5/25','���������������',NULL,'2007-09-11','2008-03-11','��������',NULL),(23,3,'1602428','������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(24,3,'25.40.5/33','�����������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(25,3,'25.40.5/19','�����������������',NULL,'2007-09-11','2008-03-11','�������',NULL),(26,3,'25.40.5/24','�����������������',NULL,'2007-09-11','2008-03-11','�������',NULL);

/*!40000 ALTER TABLE elektroinstrument ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'kniga_otzivov'
--

DROP TABLE IF EXISTS kniga_otzivov;
CREATE TABLE kniga_otzivov (
  id bigint(20) unsigned NOT NULL auto_increment,
  otziv text,
  name varchar(50) default NULL,
  date_time datetime default NULL,
  ip_address varchar(15) default NULL,
  mac_address varchar(25) default NULL,
  PRIMARY KEY  (id),
  KEY date_time (date_time)
) TYPE=MyISAM;

/*!40000 ALTER TABLE kniga_otzivov DISABLE KEYS */;

--
-- Dumping data for table 'kniga_otzivov'
--


LOCK TABLES kniga_otzivov WRITE;
INSERT INTO kniga_otzivov VALUES (4,'������, ���� ��������� - ��� ��-����� ��������� � ���������� ���������. ���� � �������� ���. ����������������� � ����������� - ��� ���� ���� ���, �� �������� � ��������� �������.','�������� �.�.','2007-10-28 10:26:43','10.1.1.54','00-50-BF-79-11-F8'),(3,'�� ��� �, ������ ������ ������ � ����� � - ����������� ���������. ���� �����-�� ����������� ���������� - ������ ����. �����, ���� ��������, ����������, ��������� ����� - ���� ����. ��������� ������� �� �� ����������� ����������, � �� ���������� ����������, ��� ��� ��� ��������� - ����.','�������� �. �.','2007-10-28 10:15:49','10.1.1.5','00-16-76-59-E5-F1');

/*!40000 ALTER TABLE kniga_otzivov ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'siz'
--

DROP TABLE IF EXISTS siz;
CREATE TABLE siz (
  id bigint(20) unsigned NOT NULL auto_increment,
  id_uch bigint(20) unsigned NOT NULL default '0',
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE siz DISABLE KEYS */;

--
-- Dumping data for table 'siz'
--


LOCK TABLES siz WRITE;
INSERT INTO siz VALUES (1,3,'6715/6716','�������� ���������������',NULL,'2007-09-18','2008-03-18','���������� ��-1',NULL),(2,3,'6713/6714','�������� ���������������',NULL,'2007-09-18','2008-03-18','��������',NULL),(3,3,'6717/6718','�������� ���������������',NULL,'2007-09-18','2008-03-18','�������',NULL),(4,3,'6721/6722','�������� ���������������',NULL,'2007-09-18','2008-03-18','�������',NULL),(5,3,'6723/6724','�������� ���������������',NULL,'2007-09-18','2008-03-18','�����',NULL),(6,3,'6719/6720','�������� ���������������',NULL,'2007-09-18','2008-03-18','����������',NULL),(7,3,'7890/7891','�������� ���������������',NULL,'2007-10-18','2008-04-18','���������� ���',NULL),(8,3,'7892/7893','�������� ���������������',NULL,'2007-10-18','2008-04-18','�����',NULL),(9,3,'7910/7911','�������� ���������������',NULL,'2007-10-18','2008-04-18','��������',NULL),(10,3,'7912/7913','�������� ���������������',NULL,'2007-10-18','2008-04-18','������',NULL),(11,3,'1220','��������� ����������',NULL,'2006-12-14','2007-12-14','�������',NULL),(12,3,'1212','��������� ����������',NULL,'2006-12-14','2007-12-14','�������',NULL),(13,3,'1215','��������� ����������',NULL,'2006-12-14','2007-12-14','��������',NULL),(14,3,'1222','��������� ����������',NULL,'2006-12-14','2007-12-14','��������',NULL),(15,3,'1219','��������� ����������',NULL,'2006-12-14','2007-12-14','�����',NULL),(16,3,'1218','��������� ����������',NULL,'2006-12-14','2007-12-14','�������',NULL),(17,3,'1213','��������� ����������',NULL,'2006-12-14','2007-12-14','���������',NULL),(18,3,'1223','��������� ����������',NULL,'2006-12-14','2007-12-14','��������',NULL),(19,3,'1214','��������� ����������',NULL,'2006-12-14','2007-12-14','�����',NULL),(20,3,'1216','��������� ����������',NULL,'2006-12-14','2007-12-14','����������',NULL),(21,3,'1217','��������� ����������',NULL,'2006-12-14','2007-12-14','������',NULL),(22,3,'250','��������� ����������',NULL,'2007-03-06','2008-03-06','���������� ��-1',NULL),(23,3,'251','��������� ����������',NULL,'2007-03-06','2008-03-06','���������� ���',NULL);

/*!40000 ALTER TABLE siz ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_familiya'
--

DROP TABLE IF EXISTS sl_familiya;
CREATE TABLE sl_familiya (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_familiya DISABLE KEYS */;

--
-- Dumping data for table 'sl_familiya'
--


LOCK TABLES sl_familiya WRITE;
INSERT INTO sl_familiya VALUES ('������'),('��������'),('����˨�'),('�������'),('��������'),('��������'),('������'),('���������'),('���������'),('�������'),('�����'),('�������'),('�����'),('�������'),('������������'),('���������'),('���������'),('������'),('�������'),('������'),('��������'),('�����'),('��������'),('�������'),('�����'),('�������'),('���������'),('�������'),('���������'),('�������'),('������'),('���������'),('������'),('��������'),('��������'),('�����'),('�������'),('�������'),('���������'),('�������'),('�������'),('�������'),('�������'),('��������'),('����������'),('�������'),('��������'),('���������'),('��������'),('��������'),('�������'),('�������'),('���������'),('�����'),('����������'),('��������'),('������'),('��������'),('�������'),('�������'),('������'),('��������'),('�������'),('��������'),('��������'),('�����������'),('���������'),('��������'),('�����'),('��������'),('�������'),('�������'),('��������'),('�������'),('�������'),('������'),('�������'),('������'),('���������'),('���������'),('����������'),('������'),('�������'),('��������'),('������'),('�����'),('������'),('�������'),('�����������'),('������'),('�������');

/*!40000 ALTER TABLE sl_familiya ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_imya'
--

DROP TABLE IF EXISTS sl_imya;
CREATE TABLE sl_imya (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_imya DISABLE KEYS */;

--
-- Dumping data for table 'sl_imya'
--


LOCK TABLES sl_imya WRITE;
INSERT INTO sl_imya VALUES ('����'),('������'),('���������'),('�������'),('������'),('�������'),('����'),('�������'),('��������'),('����'),('�������'),('�����'),('������'),('�����'),('���������'),('����������'),('�����'),('�������'),('������'),('�����'),('�������'),('������'),('�����'),('�������'),('��������'),('�������'),('��������'),('�������'),('������'),('�������'),('��������'),('�����'),('������'),('������'),('�����'),('����'),('��������'),('�����'),('�����'),('������');

/*!40000 ALTER TABLE sl_imya ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_inv_number'
--

DROP TABLE IF EXISTS sl_inv_number;
CREATE TABLE sl_inv_number (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_inv_number DISABLE KEYS */;

--
-- Dumping data for table 'sl_inv_number'
--


LOCK TABLES sl_inv_number WRITE;
INSERT INTO sl_inv_number VALUES ('1605090'),('1605091'),('25.40.5/1'),('25.40.5/2'),('25.40.5/7'),('25.40.5/6'),('25.40.5/3'),('25.40.5/4'),('25.40.5/5'),('25.40.5/14'),('25.40.5/8'),('25.40.5/9'),('2208244'),('25.40.5/12'),('25.40.5/20'),('25.40.5/21'),('25.40.5/23 (49213)'),('25008'),('25.40.5/22'),('25.40.5/25'),('25.40.5/35'),('25.40.5/35 (31334)'),('1602428'),('25.40.5/33'),('25.40.5/19'),('25.40.5/24'),('6715/6716'),('6713/6714'),('6717/6718'),('6721/6722'),('6723/6724'),('6719/6720'),('7890/7891'),('7892/7893'),('7910/7911'),('7912/7913'),('1220'),('1212'),('1215'),('1222'),('1219'),('1218'),('1213'),('1223'),('1214'),('1216'),('1217'),('250'),('251'),('1'),('3');

/*!40000 ALTER TABLE sl_inv_number ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_name'
--

DROP TABLE IF EXISTS sl_name;
CREATE TABLE sl_name (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_name DISABLE KEYS */;

--
-- Dumping data for table 'sl_name'
--


LOCK TABLES sl_name WRITE;
INSERT INTO sl_name VALUES ('���������������'),('���������'),('1'),('���� ���������'),('���������'),('��������� ���2.3'),('��������'),('�������� ��������������'),('������������'),('�����������������'),('�������� ���������������'),('��������� ����������'),('������'),('���������� ����������');

/*!40000 ALTER TABLE sl_name ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_num_prot'
--

DROP TABLE IF EXISTS sl_num_prot;
CREATE TABLE sl_num_prot (
  sl varchar(50) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_num_prot DISABLE KEYS */;

--
-- Dumping data for table 'sl_num_prot'
--


LOCK TABLES sl_num_prot WRITE;
INSERT INTO sl_num_prot VALUES ('14'),('2-�'),('13'),('20'),('13-�'),('37'),('5-�'),('39'),('23'),('1'),('4-�'),('15'),('75'),('368'),('22'),('372'),('29'),('32'),('2'),('9'),('27'),('12'),('38'),('360'),('28'),('370'),('18'),('10'),('31'),('361'),('19'),('5'),('369'),('364'),('33'),('362'),('24'),('17'),('62'),('363'),('371'),('25'),('374'),('41'),('46'),('36'),('30'),('3'),('7'),('373'),('21'),('367'),('4'),('11'),('16'),('192'),('26'),('42'),('43'),('64'),('73'),('26-0'),('01'),('5-0/2'),('19-0'),('45');

/*!40000 ALTER TABLE sl_num_prot ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_otchestvo'
--

DROP TABLE IF EXISTS sl_otchestvo;
CREATE TABLE sl_otchestvo (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_otchestvo DISABLE KEYS */;

--
-- Dumping data for table 'sl_otchestvo'
--


LOCK TABLES sl_otchestvo WRITE;
INSERT INTO sl_otchestvo VALUES ('Ԩ�������'),('��������'),('����������'),('����������'),('����������'),('�����������'),('���������'),('������������'),('��������'),('���������'),('����������'),('��������'),('����������'),('�������������'),('�������'),('����������'),('����������'),('��������'),('�����������'),('����������'),('���������'),('����������'),('��������'),('����������'),('���������'),('��������'),('���������'),('����������'),('���������'),('����������'),('��������'),('������������'),('�������'),('����������'),('��������'),('����������');

/*!40000 ALTER TABLE sl_otchestvo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_place'
--

DROP TABLE IF EXISTS sl_place;
CREATE TABLE sl_place (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_place DISABLE KEYS */;

--
-- Dumping data for table 'sl_place'
--


LOCK TABLES sl_place WRITE;
INSERT INTO sl_place VALUES ('�������� �����������'),('���. 204'),('�����'),('�������'),('�������� ��-1'),('���������'),('�������'),('����������'),('��������'),('�����'),('��������'),('���������� ���'),('���������� ��-1'),('�������'),('�������'),('��������'),('������'),('������'),('���������� ��� ��-1');

/*!40000 ALTER TABLE sl_place ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_prof_dolgnost'
--

DROP TABLE IF EXISTS sl_prof_dolgnost;
CREATE TABLE sl_prof_dolgnost (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_prof_dolgnost DISABLE KEYS */;

--
-- Dumping data for table 'sl_prof_dolgnost'
--


LOCK TABLES sl_prof_dolgnost WRITE;
INSERT INTO sl_prof_dolgnost VALUES ('��.���Ҩ� �����'),('��������������'),('��.���Ҩ� ���'),('������'),('��������� �������'),('��.���Ҩ� ����'),('����������'),('���������-�������'),('������������������'),('������� ������'),('�������'),('����������'),('��������');

/*!40000 ALTER TABLE sl_prof_dolgnost ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_sec_prof'
--

DROP TABLE IF EXISTS sl_sec_prof;
CREATE TABLE sl_sec_prof (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_sec_prof DISABLE KEYS */;

--
-- Dumping data for table 'sl_sec_prof'
--


LOCK TABLES sl_sec_prof WRITE;
INSERT INTO sl_sec_prof VALUES ('����� �������������'),('���������� �������������'),('������� ������');

/*!40000 ALTER TABLE sl_sec_prof ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'sl_tab_number'
--

DROP TABLE IF EXISTS sl_tab_number;
CREATE TABLE sl_tab_number (
  sl varchar(255) default NULL
) TYPE=MyISAM;

/*!40000 ALTER TABLE sl_tab_number DISABLE KEYS */;

--
-- Dumping data for table 'sl_tab_number'
--


LOCK TABLES sl_tab_number WRITE;
INSERT INTO sl_tab_number VALUES ('65073'),('65130'),('65105'),('65124'),('79102'),('65125'),('65021'),('1066'),('65068'),('25010'),('77931'),('65047'),('65119'),('65050'),('77774'),('88504'),('93747'),('65019'),('65162'),('65140'),('77771'),('88143'),('65143'),('65134'),('65005'),('65018'),('65069'),('1299'),('97143'),('16934'),('65080'),('65126'),('65117'),('65025'),('65109'),('68148'),('65160'),('65200'),('65141'),('65083'),('65104'),('65007'),('65031'),('65027'),('65123'),('68455'),('65016'),('65094'),('65034'),('65072'),('65015'),('65129'),('65138'),('62354'),('65065'),('65030'),('65060'),('65032'),('65035'),('65166'),('65096'),('65148'),('65122'),('27027'),('65089'),('65142'),('65156'),('88174'),('65061'),('65137'),('65057'),('68073'),('65088'),('88108'),('65100'),('65133'),('65107'),('65178'),('65075'),('65116'),('65097'),('65026'),('65151'),('79222'),('65158'),('65043'),('65132'),('65165'),('25014'),('25008'),('65067'),('68066'),('65062'),('70964');

/*!40000 ALTER TABLE sl_tab_number ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'takelag'
--

DROP TABLE IF EXISTS takelag;
CREATE TABLE takelag (
  id bigint(20) unsigned NOT NULL auto_increment,
  id_uch bigint(20) unsigned NOT NULL default '0',
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE takelag DISABLE KEYS */;

--
-- Dumping data for table 'takelag'
--


LOCK TABLES takelag WRITE;
INSERT INTO takelag VALUES (1,4,NULL,'���� ���������',NULL,'2007-10-07','2007-12-07',NULL,NULL),(2,3,'2208244','���������',NULL,'2007-08-14','2008-02-14','���������� ���',NULL),(3,3,'25.40.5/23 (49213)','��������� ���2.3',NULL,'2007-08-01','2008-02-01','���������� ���',NULL),(4,3,'25008','��������',NULL,'2007-08-14','2008-02-14','���������� ��-1',NULL),(5,3,'25.40.5/22','��������',NULL,'2007-08-14','2008-02-14','���������� ��-1',NULL),(6,3,'25.40.5/35 (31334)','�������� ��������������',NULL,'2007-09-20','2008-03-20','���������� ��-1',NULL),(7,3,'3','���� ���������',NULL,'2007-06-06','2008-01-06','���������� ��-1',NULL),(8,3,'1','���� ���������',NULL,'2007-09-19','2008-03-19','���������� ���',NULL);

/*!40000 ALTER TABLE takelag ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'uchastok'
--

DROP TABLE IF EXISTS uchastok;
CREATE TABLE uchastok (
  id bigint(20) unsigned NOT NULL auto_increment,
  name varchar(100) default NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;

/*!40000 ALTER TABLE uchastok DISABLE KEYS */;

--
-- Dumping data for table 'uchastok'
--


LOCK TABLES uchastok WRITE;
INSERT INTO uchastok VALUES (1,'������� ��� � ��'),(2,'���'),(3,'��� ��'),(4,'��� ���'),(5,'��� ��');

/*!40000 ALTER TABLE uchastok ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'zazeml'
--

DROP TABLE IF EXISTS zazeml;
CREATE TABLE zazeml (
  id bigint(20) unsigned NOT NULL auto_increment,
  id_uch bigint(20) unsigned NOT NULL default '0',
  inv_number varchar(50) default NULL,
  name varchar(255) NOT NULL default '',
  reserv varchar(100) default NULL,
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  place_install varchar(255) default NULL,
  prim varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE zazeml DISABLE KEYS */;

--
-- Dumping data for table 'zazeml'
--


LOCK TABLES zazeml WRITE;
INSERT INTO zazeml VALUES (1,3,NULL,'������',NULL,'2006-11-15','2007-11-15','���������� ��-1',NULL),(2,3,NULL,'������',NULL,'2006-11-15','2007-11-15','���������� ���',NULL),(3,3,NULL,'���������� ����������',NULL,'2006-11-15','2007-11-15','���������� ��-1',NULL),(4,3,NULL,'���������� ����������',NULL,'2006-11-15','2007-11-15','���������� ���',NULL),(5,3,NULL,'���������� ����������',NULL,'2006-11-15','2007-11-15','���������� ��� ��-1',NULL);

/*!40000 ALTER TABLE zazeml ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'znaniya_el_bez'
--

DROP TABLE IF EXISTS znaniya_el_bez;
CREATE TABLE znaniya_el_bez (
  id bigint(20) unsigned NOT NULL auto_increment,
  tab_num bigint(20) unsigned NOT NULL default '0',
  id_uch bigint(20) unsigned NOT NULL default '0',
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  gruppa_el tinyint(4) unsigned NOT NULL default '0',
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint(4) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE znaniya_el_bez DISABLE KEYS */;

--
-- Dumping data for table 'znaniya_el_bez'
--


LOCK TABLES znaniya_el_bez WRITE;
INSERT INTO znaniya_el_bez VALUES (1,65073,2,'������','����','Ԩ�������','��.���Ҩ� �����',3,'2007-07-08','2008-07-08','15',NULL,NULL),(2,65130,2,'��������','������','��������','��������������',4,'2006-11-29','2007-11-29','37',NULL,NULL),(3,65105,2,'����˨�','������','����������','��.���Ҩ� �����',3,'2007-06-06','2008-06-06','13',NULL,NULL),(4,65124,2,'�������','���������','����������','��.���Ҩ� �����',3,'2007-06-29','2008-06-29','23',NULL,NULL),(5,79102,2,'��������','�������','����������','��������������',4,'2007-09-19','2008-09-19','75',NULL,NULL),(6,65125,2,'��������','������','����������','��.���Ҩ� ���',3,'2007-08-16','2008-08-16','368',NULL,NULL),(7,65021,2,'��������','���������','�����������','��������������',4,'2007-06-28','2008-06-28','22',NULL,NULL),(8,1066,2,'������','�������','���������','��.���Ҩ� ���',3,'2007-08-31','2008-08-31','372',NULL,NULL),(9,65068,2,'���������','�������','������������','������',4,'2007-07-12','2008-07-12','29',NULL,NULL),(10,25010,2,'���������','����','��������','��.���Ҩ� ���',3,'2007-10-18','2008-10-18','32',NULL,NULL),(11,77931,2,'�������','������','���������','��.���Ҩ� �����',3,'2007-01-12','2008-01-12','2',NULL,NULL),(12,65047,2,'�����','������','���������','��������� �������',4,'2007-04-13','2008-04-13','9',NULL,NULL),(13,65119,1,'�������','�������','����������','��.���Ҩ� ����',3,'2007-06-29','2008-06-29','23',NULL,NULL),(14,65050,3,'�����','��������','��������','��.���Ҩ� �����',3,'2007-07-05','2008-07-05','27',NULL,NULL),(15,77774,1,'�������','����','��������','��.���Ҩ� �����',3,'2007-05-31','2008-05-31','12',NULL,NULL),(16,88504,1,'������������','�������','��������','����������',2,'2006-12-05','2007-12-05','38',NULL,NULL),(17,93747,5,'���������','�����','����������','��.���Ҩ� �����',3,'2007-08-02','2008-08-02','360',NULL,NULL),(18,65019,1,'���������','����','����������','��������������',3,'2007-07-06','2008-07-06','28',NULL,NULL),(19,65162,3,'������','������','�������������','��.���Ҩ� �����',2,'2007-08-23','2008-08-23','370',NULL,NULL),(20,65140,1,'�������','�����','�������','��������������',4,'2007-06-07','2008-06-07','14',NULL,NULL),(21,77771,3,'������','������','����������','������',4,'2007-06-21','2008-06-21','18',NULL,NULL),(22,88143,5,'��������','���������','����������','����������',2,'2006-12-05','2007-12-05','38',NULL,NULL),(23,65143,5,'�����','����������','�������','��.���Ҩ� �����',3,'2007-05-04','2008-05-04','10',NULL,NULL),(24,65134,5,'��������','�������','������������','��.���Ҩ� �����',3,'2007-07-19','2008-07-19','31',NULL,NULL),(25,65005,3,'�������','�����','����������','��.���Ҩ� �����',3,'2006-12-13','2007-12-13','39',NULL,NULL),(26,65018,4,'�����','�������','����������','���������-�������',3,'2007-06-28','2008-06-28','22',NULL,NULL),(27,65069,5,'�������','��������','�����������','��.���Ҩ� �����',3,'2007-08-02','2008-08-02','361',NULL,NULL),(28,1299,5,'���������','������','��������','��.���Ҩ� ����',3,'2007-06-21','2008-06-21','19',NULL,NULL),(29,97143,1,'�������','�������','�����������','��.���Ҩ� ����',3,'2007-01-22','2008-01-22','5',NULL,NULL),(30,16934,1,'���������','���������','����������','��.���Ҩ� ����',3,'2007-07-26','2008-07-26','32',NULL,NULL),(31,65080,5,'�������','������','����������','��.���Ҩ� �����',3,'2007-08-16','2008-08-16','369',NULL,NULL),(32,65126,5,'������','���������','���������','��������� �������',4,'2007-08-06','2008-08-06','364',NULL,NULL),(33,65117,5,'���������','�����','����������','��.���Ҩ� ����',3,'2006-10-26','2007-10-26','33',NULL,NULL),(34,65025,4,'������','�������','��������','��.���Ҩ� �����',3,'2007-07-12','2008-07-12','29',NULL,NULL),(35,65109,5,'��������','�����','��������','��.���Ҩ� ����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(36,68148,1,'��������','�������','�����������','��.���Ҩ� ����',3,'2007-06-29','2008-06-29','23',NULL,NULL),(37,65160,4,'�����','�������','����������','��.���Ҩ� �����',3,'2007-06-29','2008-06-29','23',NULL,NULL),(38,65200,4,'�������','���������','����������','������������������',3,'2007-08-02','2008-08-02','362',NULL,NULL),(39,65141,3,'�������','�������','��������','��.���Ҩ� �����',4,'2007-07-02','2008-07-02','24',NULL,NULL),(40,65083,1,'���������','������','����������','��.���Ҩ� �����',3,'2007-06-26','2008-06-26','20',NULL,NULL),(41,65104,4,'�������','�����','��������','��������� �������',4,'2007-06-21','2008-06-21','17',NULL,NULL),(42,65007,1,'�������','�������','�������������','��������� �������',4,'2007-01-31','2008-01-31','62',NULL,NULL),(43,65031,5,'�������','������','����������','��.���Ҩ� �����',3,'2007-07-06','2008-07-06','28',NULL,NULL),(44,65027,4,'�������','�������','����������','��.���Ҩ� �����',3,'2007-08-06','2008-08-06','363',NULL,NULL),(45,65123,1,'��������','�������','������������','��.���Ҩ� �����',3,'2007-08-23','2008-08-23','371',NULL,NULL),(46,68455,1,'����������','�������','���������','��.���Ҩ� ����',3,'2007-07-12','2008-07-12','29',NULL,NULL),(47,65016,3,'�������','��������','��������','��.���Ҩ� �����',3,'2007-07-03','2008-07-03','25',NULL,NULL),(48,65094,4,'��������','������','��������','���������-�������',3,'2007-07-19','2008-07-19','31',NULL,NULL),(49,65034,3,'���������','�������','��������','��.���Ҩ� �����',3,'2007-09-10','2008-09-10','374',NULL,NULL),(50,65072,4,'��������','���������','����������','���������-�������',3,'2006-12-19','2007-12-19','41',NULL,NULL),(51,65015,1,'��������','�������','�����������','������� ������',4,'2007-07-26','2008-07-26','32',NULL,NULL),(52,65129,2,'�������','�������','���������','��.���Ҩ� �����',3,'2006-11-14','2007-11-14','36',NULL,NULL),(53,65138,4,'�������','��������','����������','���������-�������',3,'2007-07-26','2008-07-26','32',NULL,NULL),(54,62354,1,'���������','�������','���������','��.���Ҩ� �����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(55,65065,3,'�����','������','����������','��.���Ҩ� �����',3,'2007-07-12','2008-07-12','29',NULL,NULL),(56,65030,1,'����������','������','����������','��������������',4,'2007-07-06','2008-07-06','28',NULL,NULL),(57,65060,3,'��������','������','��������','��.���Ҩ� �����',4,'2007-07-13','2008-07-13','30',NULL,NULL),(58,65032,3,'������','���������','���������','��������� �������',4,'2007-01-16','2008-01-16','3',NULL,NULL),(59,65035,3,'��������','��������','����������','��.���Ҩ� �����',3,'2007-03-05','2008-03-05','7',NULL,NULL),(60,65166,5,'�������','�������','����������','��.���Ҩ� �����',2,'2007-09-06','2008-09-06','373',NULL,NULL),(61,65096,1,'�������','��������','����������','��.���Ҩ� ����',3,'2007-06-27','2008-06-27','21',NULL,NULL),(62,65148,1,'������','��������','����������','��.���Ҩ� �����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(63,65122,5,'��������','�������','����������','��.���Ҩ� ����',3,'2007-06-27','2008-06-27','21',NULL,NULL),(64,27027,4,'�������','�������','������������','�������',4,'2006-11-29','2007-11-29','37',NULL,NULL),(65,65089,1,'��������','�����','����������','��.���Ҩ� ����',3,'2007-06-27','2008-06-27','21',NULL,NULL),(66,65142,4,'��������','������','��������','���������-�������',3,'2007-06-28','2008-06-28','22',NULL,NULL),(67,65156,4,'�����������','������','�������','��.���Ҩ� �����',3,'2007-08-13','2008-08-13','367',NULL,NULL),(68,88174,1,'���������','������','����������','����������',2,'2006-12-05','2007-12-05','38',NULL,NULL),(69,65061,5,'��������','����','����������','������',4,'2007-01-19','2008-01-19','4',NULL,NULL),(70,65137,1,'�����','�����','��������','��.���Ҩ� ����',3,'2007-05-25','2008-05-25','11',NULL,NULL),(71,65057,3,'��������','����','����������','��.���Ҩ� �����',3,'2007-07-05','2008-07-05','27',NULL,NULL),(72,68073,1,'�������','������','����������','��.���Ҩ� ����',2,'2007-06-15','2008-06-15','16',NULL,NULL),(73,65088,1,'�������','�����','������������','��.���Ҩ� ����',3,'2006-01-12','2007-01-12','192',NULL,NULL),(74,88108,5,'��������','������','����������','����������',2,'2006-12-05','2007-12-05','38',NULL,NULL),(75,65100,4,'�������','����','�������������','���������-�������',3,'2007-06-28','2008-06-28','22',NULL,NULL),(76,65133,1,'�������','���������','�������','��.���Ҩ� �����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(77,65107,1,'������','��������','����������','��.���Ҩ� ����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(78,65178,5,'�������','�������','�������������','��.���Ҩ� �����',3,'2007-07-06','2008-07-06','28',NULL,NULL),(79,65075,5,'������','���������','����������','��.���Ҩ� �����',3,'2007-07-06','2008-07-06','28',NULL,NULL),(80,65116,1,'���������','�������','����������','��.���Ҩ� ����',3,'2007-06-26','2008-06-26','20',NULL,NULL),(81,65097,1,'���������','�����','��������','��.���Ҩ� ����',3,'2007-06-28','2008-06-28','22',NULL,NULL),(82,65026,3,'����������','������','���������','��.���Ҩ� �����',3,'2007-07-04','2008-07-04','26',NULL,NULL),(83,70964,3,'�������','�������','����������','��.���Ҩ� �����',2,'2007-11-09','2007-11-09',NULL,NULL,NULL);

/*!40000 ALTER TABLE znaniya_el_bez ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'znaniya_gpm'
--

DROP TABLE IF EXISTS znaniya_gpm;
CREATE TABLE znaniya_gpm (
  id bigint(20) unsigned NOT NULL auto_increment,
  tab_num bigint(20) unsigned NOT NULL default '0',
  id_uch bigint(20) unsigned NOT NULL default '0',
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  professiya varchar(255) NOT NULL default '',
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint(4) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE znaniya_gpm DISABLE KEYS */;

--
-- Dumping data for table 'znaniya_gpm'
--


LOCK TABLES znaniya_gpm WRITE;
INSERT INTO znaniya_gpm VALUES (1,65032,3,'������','���������','���������','��������� �������','����� �������������','2007-04-12','2010-04-12','64',NULL,NULL),(2,65032,3,'������','���������','���������','��������� �������','���������� �������������','2007-05-24','2010-05-24','73',NULL,NULL),(3,65032,3,'������','���������','���������','��������� �������','������� ������','2007-03-16','2008-03-16','01',NULL,NULL),(4,77771,3,'������','������','����������','������','������� ������','2007-03-16','2008-03-16','01',NULL,NULL),(5,65005,3,'�������','�����','����������','��.���Ҩ� �����','������� ������','2007-03-16','2008-03-16','01',NULL,NULL);

/*!40000 ALTER TABLE znaniya_gpm ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'znaniya_met_stanki'
--

DROP TABLE IF EXISTS znaniya_met_stanki;
CREATE TABLE znaniya_met_stanki (
  id bigint(20) unsigned NOT NULL auto_increment,
  tab_num bigint(20) unsigned NOT NULL default '0',
  id_uch bigint(20) unsigned NOT NULL default '0',
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint(4) default NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY tab_num (tab_num),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE znaniya_met_stanki DISABLE KEYS */;

--
-- Dumping data for table 'znaniya_met_stanki'
--


LOCK TABLES znaniya_met_stanki WRITE;
INSERT INTO znaniya_met_stanki VALUES (1,65005,3,'�������','�����','����������','��.���Ҩ� �����','2007-08-14','2008-08-14',NULL,NULL,NULL),(2,65141,3,'�������','�������','��������','��.���Ҩ� �����','2007-08-15','2008-08-15',NULL,NULL,NULL),(3,65016,3,'�������','��������','��������','��.���Ҩ� �����','2007-08-16','2008-08-16',NULL,NULL,NULL),(4,65026,3,'����������','������','���������','��.���Ҩ� �����','2007-08-17','2008-08-17',NULL,NULL,NULL),(5,65050,3,'�����','��������','��������','��.���Ҩ� �����','2007-10-17','2008-10-17',NULL,NULL,NULL),(6,65060,3,'��������','������','��������','��.���Ҩ� �����','2007-10-17','2008-10-17',NULL,NULL,NULL);

/*!40000 ALTER TABLE znaniya_met_stanki ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table 'znaniya_otipb'
--

DROP TABLE IF EXISTS znaniya_otipb;
CREATE TABLE znaniya_otipb (
  id bigint(20) unsigned NOT NULL auto_increment,
  tab_num bigint(20) unsigned NOT NULL default '0',
  id_uch bigint(20) unsigned NOT NULL default '0',
  fam varchar(100) NOT NULL default '',
  name varchar(100) NOT NULL default '',
  sec_name varchar(100) NOT NULL default '',
  dolgnost varchar(100) NOT NULL default '',
  date_first date NOT NULL default '0000-00-00',
  date_next date NOT NULL default '0000-00-00',
  num_protokol varchar(30) default NULL,
  prim varchar(255) default NULL,
  reserv tinyint(4) default NULL,
  PRIMARY KEY  (id),
  KEY date_next (date_next)
) TYPE=MyISAM;

/*!40000 ALTER TABLE znaniya_otipb DISABLE KEYS */;

--
-- Dumping data for table 'znaniya_otipb'
--


LOCK TABLES znaniya_otipb WRITE;
INSERT INTO znaniya_otipb VALUES (1,65073,2,'������','����','Ԩ�������','��.���Ҩ� �����','2007-06-08','2008-06-08','14',NULL,NULL),(2,65130,2,'��������','������','��������','��������������','2006-03-13','2009-03-13','2-�',NULL,NULL),(3,65105,2,'����˨�','������','����������','��.���Ҩ� �����','2007-06-06','2008-06-06','13',NULL,NULL),(4,65124,2,'�������','���������','����������','��.���Ҩ� �����','2007-06-29','2008-06-29','20',NULL,NULL),(5,79102,2,'��������','�������','����������','��������������','2006-07-12','2009-06-29','13-�',NULL,NULL),(6,65125,2,'��������','������','����������','��.���Ҩ� ���','2007-08-16','2008-08-16','37',NULL,NULL),(7,65021,2,'��������','���������','�����������','��������������','2006-03-15','2009-03-15','5-�',NULL,NULL),(8,1066,2,'������','�������','���������','��.���Ҩ� ���','2007-08-31','2008-08-31','39',NULL,NULL),(9,65068,2,'���������','�������','������������','������','2006-03-15','2009-03-15','5-�',NULL,NULL),(10,25010,2,'���������','����','��������','��.���Ҩ� ���','2007-10-18','2008-10-18','23',NULL,NULL),(11,77931,2,'�������','������','���������','��.���Ҩ� �����','2007-01-12','2008-01-12','1',NULL,NULL),(12,65047,2,'�����','������','���������','��������� �������','2006-03-15','2009-06-15','5-�',NULL,NULL),(13,65021,2,'��������','���������','�����������','��������������','2006-03-15','2009-03-15','4-�',NULL,NULL),(14,65151,4,'������','�����','�������','����������','2007-05-05','2008-05-05','10',NULL,NULL),(15,79222,4,'������','�������','��������','��������','2007-09-13','2008-09-13','42',NULL,NULL),(16,65158,4,'�������','�������','���������','��������','2007-09-24','2008-09-24','43',NULL,NULL),(17,65043,4,'��������','��������','��������','��������','2007-01-23','2008-01-23','3',NULL,NULL),(18,65132,4,'������','������','����������','��������','2007-03-07','2008-03-07','7',NULL,NULL),(19,65165,4,'�����','�������','��������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(20,25014,4,'������','������','����������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(21,25008,4,'�������','�����','�������������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(22,65067,4,'�����������','������','����������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(23,68066,4,'������','�������','����������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(24,65062,4,'������','������','���������','��������','2007-01-22','2008-01-22','2',NULL,NULL),(25,77771,3,'������','������','����������','������','2006-03-15','2009-03-15','5-0/2',NULL,NULL),(26,65050,3,'�����','��������','��������','��.���Ҩ� �����','2007-07-05','2008-07-05','24',NULL,NULL),(27,65162,3,'������','������','�������������','��.���Ҩ� �����','2007-08-23','2008-08-23','28',NULL,NULL),(28,70964,3,'�������','�������','����������','��.���Ҩ� �����','2007-10-23','2008-10-23','45',NULL,NULL),(29,65005,3,'�������','�����','����������','��.���Ҩ� �����','2006-12-13','2007-12-13','28',NULL,NULL),(30,65141,3,'�������','�������','��������','��.���Ҩ� �����','2007-07-02','2008-07-02','21',NULL,NULL),(31,65016,3,'�������','��������','��������','��.���Ҩ� �����','2007-07-23','2008-07-23','22',NULL,NULL),(32,65034,3,'���������','�������','��������','��.���Ҩ� �����','2007-09-10','2008-09-10','41',NULL,NULL),(33,65065,3,'�����','������','����������','��.���Ҩ� �����','2007-07-12','2008-07-12','26',NULL,NULL),(34,65060,3,'��������','������','��������','��.���Ҩ� �����','2007-07-13','2008-07-13','30',NULL,NULL),(35,65032,3,'������','���������','���������','��������� �������','2007-01-30','2010-01-30','19-0',NULL,NULL),(36,65035,3,'��������','��������','����������','��.���Ҩ� �����','2007-03-05','2008-03-05','5',NULL,NULL),(37,65057,3,'��������','����','����������','��.���Ҩ� �����','2007-07-05','2008-07-05','24',NULL,NULL),(38,65026,3,'����������','������','���������','��.���Ҩ� �����','2007-07-04','2008-07-04','23',NULL,NULL);

/*!40000 ALTER TABLE znaniya_otipb ENABLE KEYS */;
UNLOCK TABLES;

