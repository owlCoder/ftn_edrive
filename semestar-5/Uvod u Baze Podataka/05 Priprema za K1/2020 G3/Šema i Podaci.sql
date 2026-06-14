CREATE TABLE DRZAVA (
  IDD INTEGER NOT NULL,
  NAZIVD VARCHAR2(128) NOT NULL,
  CONSTRAINT PK_DRZAVA PRIMARY KEY (IDD)
);

CREATE TABLE VOZAC (
  IDV INTEGER NOT NULL,
  IMEV VARCHAR2(128) NOT NULL,
  PREZV VARCHAR2(128) NOT NULL,
  GODRODJ INTEGER NOT NULL,
  BROJTIT INTEGER,
  DRZV INTEGER,
  CONSTRAINT PK_VOZAC PRIMARY KEY (IDV),
  CONSTRAINT FK_VOZAC_DRZAVA FOREIGN KEY (DRZV) REFERENCES DRZAVA (IDD)
);

CREATE TABLE STAZA (
  IDS INTEGER NOT NULL,
  NAZIVS VARCHAR2(128) NOT NULL,
  BROJKRUG INTEGER NOT NULL,
  DUZKRUG DECIMAL(5,2),
  DRZS INTEGER,
  CONSTRAINT PK_STAZA PRIMARY KEY (IDS),
  CONSTRAINT FK_STAZA_DRZAVA FOREIGN KEY (DRZS) REFERENCES DRZAVA (IDD)
);

CREATE TABLE REZULTAT (
  VOZACR INTEGER NOT NULL,
  STAZAR INTEGER NOT NULL,
  SEZONA INTEGER NOT NULL,
  PLASMAN INTEGER,
  BODOVI INTEGER,
  MAKSBRZINA DECIMAL(5,2) NOT NULL,
  ZAVRSIO CHAR(1) NOT NULL,
  CONSTRAINT PK_REZULTAT PRIMARY KEY (VOZACR, STAZAR, SEZONA),
  CONSTRAINT FK_REZULTAT_VOZAC FOREIGN KEY (VOZACR) REFERENCES VOZAC (IDV),
  CONSTRAINT FK_REZULTAT_STAZA FOREIGN KEY (STAZAR) REFERENCES STAZA (IDS),
  CONSTRAINT CH_SEZONA CHECK (SEZONA > 1949 AND SEZONA < 2020 ),
  CONSTRAINT CH_ZAVRSIO CHECK (ZAVRSIO = 'Y' OR ZAVRSIO = 'N' )
);

insert into drzava(idd, nazivd) values(1, 'Finland');
insert into drzava(idd, nazivd) values(2, 'Spain');
insert into drzava(idd, nazivd) values(3, 'Germany');
insert into drzava(idd, nazivd) values(4, 'Brazil');
insert into drzava(idd, nazivd) values(5, 'Great Britain');
insert into drzava(idd, nazivd) values(6, 'Italy');
insert into drzava(idd, nazivd) values(7, 'France');

insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (1, 'Kimmi', 'Raikkonen', '1979', 1, 1);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (2, 'Lewis', 'Hamilton', '1985', 6, 5);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (3, 'Sebastian', 'Vettel', '1987', 4, 3);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (4, 'Michael', 'Schumacher', '1969', 7, 3);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (5, 'Ayrton', 'Senna', '1960', 3, 4);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (6, 'Alain', 'Prost', '1950', 4, 7);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (7, 'Nico', 'Hulkenberg', '1987', 0, 3);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (8, 'Rubens', 'Barrichelo', '1972', 0, 4);
insert into vozac(idv, imev, prezv, godrodj, brojtit, drzv) values (9, 'Nikki', 'Lauda', '1949', 3, NULL);

INSERT INTO STAZA(IDS, NAZIVS, BROJKRUG, DUZKRUG, DRZS) VALUES (1, 'Interlagos', 54, 5.91, 4);
INSERT INTO STAZA(IDS, NAZIVS, BROJKRUG, DUZKRUG, DRZS) VALUES (2, 'Silverstone', 56, 6.4, 5);
INSERT INTO STAZA(IDS, NAZIVS, BROJKRUG, DUZKRUG, DRZS) VALUES (3, 'Monza', 60, 5.99, 6);
INSERT INTO STAZA(IDS, NAZIVS, BROJKRUG, DUZKRUG, DRZS) VALUES (4, 'Paul Ricard', 65, 5.51, 7);
INSERT INTO STAZA(IDS, NAZIVS, BROJKRUG, DUZKRUG, DRZS) VALUES (5, 'Hocnenheimring', 52, 6.22, 3);

insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (3,5,2019, 1, 25, 350.67, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (2,5,2019, 2, 18, 340.6, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (1,5,2019, 3, 15, 361.55, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (7,5,2019, null, null, 370.32, 'N');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (4,1,1994, 1, 25, 340.5, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (5,1,1994, 2, 18, 332.4, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (6,1,1994, 3, 15, 333.7, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (8,1,1994, null, null, 347.6, 'N');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (3,3,2018, 1, 25, 351.67, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (2,2,2019, 1, 25, 360.54, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (1,2,2019, 2, 18, 367.56, 'Y');
insert into rezultat(vozacr, stazar, sezona, plasman, bodovi, maksbrzina, zavrsio) 
values (3,5,2005, 1, 24, 340.5, 'Y');