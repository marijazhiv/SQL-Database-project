CREATE TABLE Ponuda (
  idponud INT PRIMARY KEY,
  godponud INT,
  nazponud VARCHAR(255),
  mbr INT
);


ALTER TABLE Ponuda
ADD CONSTRAINT FK_Ponuda_Menadzer FOREIGN KEY (mbr) REFERENCES Menadzer(mbr);


-- Kreiranje tabele Aranžman
CREATE TABLE Aranzman (
  idaranz INT PRIMARY KEY,
  datpoc DATE,
  datzav DATE,
  tipar VARCHAR(255)
);

-- Kreiranje tabele Nudi (Agencija_Aranzman)
CREATE TABLE Nudi (
  idponud INT,
  idaranz INT,
  FOREIGN KEY (idponud) REFERENCES Ponuda(idponud),
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  PRIMARY KEY (idponud,idaranz)
);

CREATE TABLE Destinacija (
  iddest INT PRIMARY KEY,
  nazdest VARCHAR(255),
  nazdrz VARCHAR(255),
  ocena INT
);


-- Kreiranje tabele Obuhvata (Aranzman_Destinacija)
CREATE TABLE Obuhvata (
  idaranz INT,
  iddest INT,
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  PRIMARY KEY (idaranz,iddest)
);


-- Kreiranje tabele Smeštajni_Objekat
CREATE TABLE Smestajni_Objekat (
  iddest INT,
  idsmes INT,
  nazsmest VARCHAR(255),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  PRIMARY KEY (iddest,idsmes)
);

-- Kreiranje tabele Aranzman koji obuhvata Destinaciju ima u ponudi Smestajni objekat (Aranzman_Destinacija_Smestaj)

CREATE TABLE Ima_U_Ponudi (
  idaranz INT,
  iddest INT,
  idsmes INT,
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  FOREIGN KEY (iddest, idsmes) REFERENCES Smestajni_Objekat(iddest, idsmes),
  PRIMARY KEY (idaranz,iddest, idsmes)
);


-- Kreiranje tabele Aktivnost 
CREATE TABLE Aktivnost (
  iddest INT,
  idakt INT,
  nazakt VARCHAR(255),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  PRIMARY KEY (iddest,idakt)
);

-- Kreiranje tabele Pruza  (Destinacija_Aktivnost)

CREATE TABLE Pruza (
  idaranz INT,
  iddest INT,
  idakt INT,
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  FOREIGN KEY (iddest, idakt) REFERENCES Aktivnost(iddest,idakt),
  PRIMARY KEY (idaranz,iddest, idakt)
);

-- Kreiranje tabele Vozilo (Prevozno_Vozilo)
CREATE TABLE Vozilo (
  voziloID INT PRIMARY KEY,
  brsed INT,
  tip VARCHAR(255), 
  tipGoriva VARCHAR(255),
  kapacPrtlj INT,
  nazvozilo VARCHAR(255)
);

-- Aranzman_Vozilo
CREATE TABLE Ima_Obezbedjeno (
  idaranz INT,
  iddest INT,
  voziloID INT,
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  FOREIGN KEY (iddest) REFERENCES Destinacija(iddest),
  FOREIGN KEY (voziloID) REFERENCES Vozilo(voziloID),
  PRIMARY KEY (idaranz, iddest, voziloID)
);

-- Kreiranje tabele Klijent
CREATE TABLE Klijent (
  klijentID INT PRIMARY KEY,
  ime VARCHAR(255),
  prezime VARCHAR(255),
  adresa VARCHAR(255),
  brTel INT,
  datumRodj DATE
);

-- Kreiranje tabele Rezerviše
CREATE TABLE Rezervise (
  idponud INT,
  idaranz INT,
  klijentID INT,
  FOREIGN KEY (idponud) REFERENCES Ponuda(idponud),
  FOREIGN KEY (idaranz) REFERENCES Aranzman(idaranz),
  FOREIGN KEY (klijentID) REFERENCES Klijent(klijentID),
  PRIMARY KEY (idponud, idaranz, klijentID)
);


CREATE TABLE Menadzer (
  mbr INT PRIMARY KEY,
  ime VARCHAR(255),
  prezime VARCHAR(255),
  adresa VARCHAR(255),
  brtel INT
);

CREATE TABLE Kreira (
  idponud INT,
  mbr INT,
  FOREIGN KEY (idponud) REFERENCES Ponuda(idponud),
  FOREIGN KEY (mbr) REFERENCES Menadzer(mbr),
  PRIMARY KEY (idponud, mbr)
);


CREATE TABLE Cena (
  idcena INT PRIMARY KEY,
  iznos INT
);


-- AranzmanCena
CREATE TABLE Ima_Cenu (
  idaranz INT,
  idcena INT,
  FOREIGN KEY (idaranz) REFERENCES Aranzman (idaranz),
  FOREIGN KEY (idcena) REFERENCES Cena (idcena)
);



----------------------------------------------------------
-- Popunjvanje tabela

insert into Ponuda values (1, 2023,  'Agencijska ponuda sezone 2023', 111);
insert into Ponuda values (2, 2022,  'Agencijska ponuda sezone 2022',333);
insert into Ponuda values (3, 2021,  'Agencijska ponuda sezone 2021',222);
insert into Ponuda values (4, 2020,  'Agencijska ponuda sezone 2020',222);
insert into Ponuda values (5, 2019,  'Agencijska ponuda sezone 2019',444);
insert into Ponuda values (6, 2018,  'Agencijska ponuda sezone 2018',999);
insert into Ponuda values (7, 2017,  'Agencijska ponuda sezone 2017',555);
insert into Ponuda values (8, 2016,  'Agencijska ponuda sezone 2016',666);
insert into Ponuda values (9, 2015,  'Agencijska ponuda sezone 2015',888);
insert into Ponuda values (10, 2014,  'Agencijska ponuda sezone 2014',777);
insert into Ponuda values (11, 2023,  'Agencijska ponuda sezone 2023- Letnja',111);
insert into Ponuda values (12, 2023,  'Agencijska ponuda sezone 2023- Zimska',777);
insert into Ponuda values (13, 2022,  'Agencijska ponuda sezone 2022- Letnja',777);
insert into Ponuda values (14, 2022,  'Agencijska ponuda sezone 2022-Zimska',444);
insert into Ponuda values (15, 2023,  'Super ponuda',444);
insert into Ponuda values (16, 2023,  'Super ponuda',0000);

commit;


-- Popunjavanje tabele Aranzman

INSERT INTO Aranzman VALUES
  (1, TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-10', 'YYYY-MM-DD'), 'Zimski');
INSERT INTO Aranzman VALUES
  (2, TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Letnji');
INSERT INTO Aranzman VALUES
  (3, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2023-03-20', 'YYYY-MM-DD'), 'Prolecni');
INSERT INTO Aranzman VALUES
  (4, TO_DATE('2019-04-15', 'YYYY-MM-DD'), TO_DATE('2019-04-25', 'YYYY-MM-DD'), 'Sezonski');
INSERT INTO Aranzman VALUES
  (5, TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'Letnji');
INSERT INTO Aranzman VALUES
  (6, TO_DATE('2023-01-25', 'YYYY-MM-DD'), TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'Zimski');
INSERT INTO Aranzman VALUES
  (7, TO_DATE('2015-01-08', 'YYYY-MM-DD'), TO_DATE('2015-01-10', 'YYYY-MM-DD'), 'Novogodisnji');
INSERT INTO Aranzman VALUES
  (8, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 'Jednodnevni');
INSERT INTO Aranzman VALUES
  (9, TO_DATE('2021-10-10', 'YYYY-MM-DD'), TO_DATE('2021-10-17', 'YYYY-MM-DD'), 'Nedeljni');
INSERT INTO Aranzman VALUES
  (10, TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-25', 'YYYY-MM-DD'), 'Zimski');
commit;

--Popunjavanje tabele Nudi

insert into Nudi values (1, 2);
insert into Nudi values (1, 3);
insert into Nudi values (1, 5);
insert into Nudi values (1, 6);
insert into Nudi values (1, 8);
insert into Nudi values (2, 10);
insert into Nudi values (3, 9);
insert into Nudi values (4, 1);
insert into Nudi values (5, 4);
insert into Nudi values (9, 7);
insert into Nudi values (11, 3);
insert into Nudi values (11, 4);
insert into Nudi values (12, 5);
insert into Nudi values (13, 6);
insert into Nudi values (14, 1);
insert into Nudi values (14, 8);
insert into Nudi values (15, 7);
insert into Nudi values (15, 10);
commit;

--Destinacija

INSERT INTO Destinacija VALUES
  (1, 'Ljubljana', 'Slovenija', 5);
INSERT INTO Destinacija VALUES
  (2, 'Sao Paulo', 'Brazil', 2);
INSERT INTO Destinacija VALUES
  (3, 'Monako Vil', 'Monako', 4 );
INSERT INTO Destinacija VALUES
  (4, 'Lisabon', 'Portugal', 4);
INSERT INTO Destinacija VALUES
  (5, 'Moskva', 'Rusija', 4);
INSERT INTO Destinacija VALUES
  (6, 'Berlin', 'Nemacka', 3);
INSERT INTO Destinacija VALUES
  (7, 'Porto', 'Portugal', 5);
INSERT INTO Destinacija VALUES
  (8, 'Asmara', 'Eritreja', 5);
INSERT INTO Destinacija VALUES
  (9, 'Kairo', 'Egipat', 4);
INSERT INTO Destinacija VALUES
  (10, 'Budimpesta', 'Madjarska', 2);
commit;

--OBUHVATA  (1 ili vise destinacija ?)  + dodati i kad obuhvata vise

insert into Obuhvata values (1, 1);
insert into Obuhvata values (2, 3);
insert into Obuhvata values (3, 2);
insert into Obuhvata values (4, 10);
insert into Obuhvata values (5, 4);
insert into Obuhvata values (6, 9);
insert into Obuhvata values (7, 5);
insert into Obuhvata values (8, 6);
insert into Obuhvata values (9, 8);
insert into Obuhvata values (10, 7);

insert into Obuhvata values (1, 2);
insert into Obuhvata values (1, 3);
insert into Obuhvata values (5, 10);
insert into Obuhvata values (7, 10);
insert into Obuhvata values (6, 4);
commit;


--dodati posle da na jednoj destinaciji moze vise smestaja da bude
-- Smestajni Objekat 

insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (1, 1, 'Hotel Park');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (2, 2, 'Hotel Jaragua');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (3, 3, 'Hotel Ambassador');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (4, 4, 'Hotel Avenija');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (5, 5, 'Hotel Lenjin');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (6, 6, 'Hotel Premier Inn');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (7, 7, 'Hotel Selina');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (8, 8, 'Hotel Asmara Palace');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (9, 9, 'Hotel InterContinental');
insert into Smestajni_Objekat (iddest, idsmes, nazsmest) values (10, 10, 'Hotel Classic');
commit;

--Ima_U_Ponudi

insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (1, 1, 1);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (2, 3, 3);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (3, 2, 2);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (4, 10,10);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (5, 4,4);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (6, 9,9);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (7, 5,5);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (8, 6,6);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (9, 8,8);
insert into Ima_U_Ponudi (idaranz, iddest, idsmes) values (10, 7,7);
commit;


-- --Aktivnost

insert into Aktivnost (iddest, idakt, nazakt) values (1, 1, 'Avanturisticki park');
insert into Aktivnost (iddest, idakt, nazakt) values (2, 2, 'Paraglajding');
insert into Aktivnost (iddest, idakt, nazakt) values (3, 3, 'Poseta modne revije sezona 2022/2023');
insert into Aktivnost (iddest, idakt, nazakt) values (4, 4, 'Obilazak brodogradilista');
insert into Aktivnost (iddest, idakt, nazakt) values (5, 5, 'Plovidba Volgom');
insert into Aktivnost (iddest, idakt, nazakt) values (6, 6, 'Oranizovani nocni izlasci');
insert into Aktivnost (iddest, idakt, nazakt) values (7, 7, 'Vinske ture');
insert into Aktivnost (iddest, idakt, nazakt) values (8, 8, 'Poseta EPC ');
insert into Aktivnost (iddest, idakt, nazakt) values (9, 9, 'Jahanje kamila');
insert into Aktivnost (iddest, idakt, nazakt) values (10, 10, 'Plovidba brodom po Dunavu');
commit;

-- Pruza 

insert into Pruza (idaranz, iddest, idakt) values (1, 1, 1);
insert into Pruza (idaranz, iddest, idakt) values (2, 3, 3);
insert into Pruza (idaranz, iddest, idakt) values (3, 2, 2);
insert into Pruza (idaranz, iddest, idakt) values (4, 10, 10);
insert into Pruza (idaranz, iddest, idakt) values (5, 4, 4);
insert into Pruza (idaranz, iddest, idakt) values (6, 9, 9);
insert into Pruza (idaranz, iddest, idakt) values (7, 5, 5);
insert into Pruza (idaranz, iddest, idakt) values (8, 6, 6);
insert into Pruza (idaranz, iddest, idakt) values (9, 8, 8);
insert into Pruza (idaranz, iddest, idakt) values (10, 7, 7);
commit;


-- Menadzer
insert into Menadzer values (111, 'Marko',  'Markovic', 'Beograd', 064419280);
insert into Menadzer values (222, 'Milan',  'Jovanovic', 'Novi Sad', 069725389);
insert into Menadzer values (333, 'Janko',  'Petrovic', 'Beograd', 065466288);
insert into Menadzer values (444, 'Petar',  'Jovkic', 'Sabac', 063412639);
insert into Menadzer values (555, 'Milica',  'Simeunovic', 'Sombor', 0645384810);
insert into Menadzer values (666, 'Jelena',  'Kojic', 'Beograd', 0656128215);
insert into Menadzer values (777, 'Milena',  'Dragutinovic', 'Apatin', 068793311);
insert into Menadzer values (888, 'Jovan',  'Smiljanic', 'Novi Sad', 0663332339);
insert into Menadzer values (999, 'Dusan',  'Markovic', 'Nis', 065512390);
insert into Menadzer values (0000, 'Veljko',  'Vujkovic', 'Pirot', 0647789025);
commit;

-- Kreira  (neka jednu kreira jedan)

insert into Kreira (idponud, mbr) values (1, 111);
insert into Kreira (idponud, mbr)  values (2, 333);
insert into Kreira (idponud, mbr)  values (3, 222);
insert into Kreira (idponud, mbr) values (4, 0000);
insert into Kreira (idponud, mbr)  values (5, 444);
insert into Kreira (idponud, mbr) values (6, 999);
insert into Kreira (idponud, mbr) values (7, 555);
insert into Kreira (idponud, mbr) values (8, 666);
insert into Kreira (idponud, mbr) values (9, 888);
insert into Kreira (idponud, mbr) values (10, 777);
insert into Kreira (idponud, mbr) values (11, 111);
insert into Kreira (idponud, mbr) values (12, 777);
insert into Kreira (idponud, mbr) values (13, 777);
insert into Kreira (idponud, mbr) values (14, 444);
insert into Kreira (idponud, mbr) values (15, 444);
commit;

-- Klijent

insert into Klijent values (551, 'Marija',  'Petrovic', 'Beograd', 064132462,TO_DATE('2000-01-10', 'YYYY-MM-DD') );
insert into Klijent values (552, 'Kristina',  'Jovanic', 'Novi Sad',0651432529, TO_DATE('1971-11-10', 'YYYY-MM-DD'));
insert into Klijent values (553, 'Sima',  'Simic', 'Beograd', 0672535283, TO_DATE('1966-05-15', 'YYYY-MM-DD'));
insert into Klijent values (554, 'Zika',  'Spasic', 'Sabac', 060183773, TO_DATE('1985-04-17', 'YYYY-MM-DD'));
insert into Klijent values (555, 'Branko',  'Miric', 'Sombor', 0612345390, TO_DATE('2002-06-25', 'YYYY-MM-DD'));
insert into Klijent values (556, 'Darko',  'Micic', 'Beograd',0623438940, TO_DATE('2003-06-20', 'YYYY-MM-DD'));
insert into Klijent values (557, 'Nikola',  'Jovanovic', 'Apatin',0652434940, TO_DATE('1999-12-14', 'YYYY-MM-DD'));
insert into Klijent values (558, 'Alen',  'Grozdic', 'Novi Sad',069283734, TO_DATE('1971-12-06', 'YYYY-MM-DD'));
insert into Klijent values (559, 'Slavko',  'Kojic', 'Nis', 088253739,TO_DATE('2000-11-11', 'YYYY-MM-DD'));
insert into Klijent values (5591, 'Zoran',  'Bulatovic','Pirot', 025348030,TO_DATE('1971-01-25', 'YYYY-MM-DD'));
commit;


-- Rezervise

insert into Rezervise (idponud, idaranz,klijentID) values (1, 2,551);
insert into Rezervise (idponud, idaranz,klijentID)  values (1,3,552);
insert into Rezervise (idponud, idaranz,klijentID)  values (1,5,553);
insert into Rezervise (idponud, idaranz,klijentID) values (1,6,554);
insert into Rezervise (idponud, idaranz,klijentID)  values (1,8, 555);
insert into Rezervise (idponud, idaranz,klijentID) values (2,10, 556);
insert into Rezervise (idponud, idaranz,klijentID) values (3,9,557);
insert into Rezervise (idponud, idaranz,klijentID) values (4,1, 558);
insert into Rezervise (idponud, idaranz,klijentID) values (5,4, 559);
insert into Rezervise (idponud, idaranz,klijentID) values (9,7, 5591);
commit;


--Cena
insert into Cena (idcena, iznos) values (1,20000);
insert into Cena (idcena, iznos) values (2,50000);
insert into Cena (idcena, iznos) values (3,100000);
insert into Cena (idcena, iznos) values (4,500000);
insert into Cena (idcena, iznos) values (5,70456);
insert into Cena (idcena, iznos) values (6,34508);
insert into Cena (idcena, iznos) values (7,65432);
insert into Cena (idcena, iznos) values (8,87632);
insert into Cena (idcena, iznos) values (9,976521);
insert into Cena (idcena, iznos) values (10,69999);
commit;

--Ima_Cenu
insert into Ima_Cenu (idaranz,idcena) values (1,10);
insert into Ima_Cenu (idaranz,idcena) values (2,9);
insert into Ima_Cenu (idaranz,idcena) values (3,7);
insert into Ima_Cenu (idaranz,idcena) values (4,6);
insert into Ima_Cenu (idaranz,idcena) values (5,8);
insert into Ima_Cenu (idaranz,idcena) values (6,5);
insert into Ima_Cenu (idaranz,idcena) values (7,3);
insert into Ima_Cenu (idaranz,idcena) values (8,2);
insert into Ima_Cenu (idaranz,idcena) values (9,4);
insert into Ima_Cenu (idaranz,idcena) values (10,1);
commit;

------------------------------------------------------

--KREIRANJE POGLEDA---


--Prikaz Top 3 Menadzera koji su kreirali najjeftinije aranzmane u Agenciji


CREATE OR REPLACE VIEW TopMenadzeri AS
SELECT *
FROM (
  SELECT m.mbr, m.ime, m.prezime, SUM(c.iznos) AS ukupno_iznos
  FROM Menadzer m
  LEFT OUTER JOIN Ponuda p ON m.mbr = p.mbr
LEFT OUTER JOIN Aranzman a ON p.idponud = a.idaranz
LEFT OUTER JOIN Ima_Cenu ic ON a.idaranz = ic.idaranz
LEFT OUTER JOIN Cena c ON ic.idcena = c.idcena
GROUP BY m.mbr, m.ime, m.prezime
ORDER BY SUM(c.iznos) ASC
) WHERE ROWNUM <= 3;


SELECT * FROM TopMenadzeri;


-----------------------------------------------------

-- Zurnal Tabela
CREATE TABLE Aranzman_Log (
  log_id INT PRIMARY KEY,
  aranzman_id INT,
  datpoc_old DATE,
  datzav_old DATE,
  datpoc_new DATE,
  datzav_new DATE,
  tipar_old VARCHAR(255),
  tipar_new VARCHAR(255),
  action_type VARCHAR(10),
  action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--DROP TABLE Aranzman_Log;

-- Trigeri
CREATE OR REPLACE TRIGGER Aranzman_Trigger
AFTER INSERT OR UPDATE OR DELETE ON Aranzman
FOR EACH ROW
DECLARE
  action_type VARCHAR(10);
  next_id INT;
BEGIN
  IF INSERTING THEN
    action_type := 'INSERT';
  ELSIF UPDATING THEN
    action_type := 'UPDATE';
  ELSIF DELETING THEN
    action_type := 'DELETE';
  END IF;

  SELECT COALESCE(MAX(log_id), 0) + 1 INTO next_id FROM Aranzman_Log;

  INSERT INTO Aranzman_Log (log_id, aranzman_id, datpoc_old, datzav_old, datpoc_new, datzav_new, tipar_old, tipar_new, action_type)
  VALUES (
    next_id,
    :OLD.idaranz,
    :OLD.datpoc,
    :OLD.datzav,
    :NEW.datpoc,
    :NEW.datzav,
    :OLD.tipar,
    :NEW.tipar,
    action_type
  );
END;
/


--- Testiranje Trigera


UPDATE Aranzman SET datpoc = TO_DATE('2023-06-30', 'YYYY-MM-DD') WHERE idaranz = 1;

INSERT INTO Aranzman (idaranz, datpoc, datzav, tipar)
VALUES (11, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'Zimski');

SELECT * FROM Aranzman_Log;

--INSERT INTO Aranzman (idaranz, datpoc, datzav)
--VALUES (12, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'));


SELECT * FROM Aranzman_Log;

DELETE FROM Aranzman WHERE idaranz = 11;

SELECT * FROM Aranzman_Log;

UPDATE Aranzman SET tipar = 'Godisnji' WHERE idaranz = 1;
SELECT * FROM Aranzman_Log;

INSERT INTO Aranzman (idaranz, datpoc, datzav,tipar)
VALUES (16, TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), 'Sezonski');
SELECT * FROM Aranzman_Log;

--UPDATE Aranzman SET tipar = 'Godisnji' WHERE idaranz = 4;
--SELECT * FROM Aranzman_Log;

--DELETE FROM Aranzman WHERE idaranz = 5;
--SELECT * FROM Aranzman_Log;

--INSERT INTO Aranzman (idaranz, datpoc, datzav,tipar)
--VALUES (16, TO_DATE('2026-09-01', 'YYYY-MM-DD'), TO_DATE('2026-09-10', 'YYYY-MM-DD'), 'Jesenji');
--SELECT * FROM Aranzman_Log;

-------------------------------------

-- IZVESTAJ

-- definise se kursor c_destinacije koji ce se koristiti za preuzimanje podataka o Destinacijama
-- ugnježdeni kursor c_aranzmani se koristi za preuzimanje podataka o svim aranžmanima koji obuhvataju tu odreðenu destinaciju
-- ulazni parametar p_iddest se koristi za filtriranje aranzmana za odreðenu destinaciju
-- prva for petlja prolazi kroz sve destinacije iz kursora c_destinacije i ispisuje podatke o njima
-- druga prolazi kroz sve aranzmane iz drugog ugnjezdenog kursora i ipisuje ih (tu su vec filtirani oni za odredjenu destinaciju)
CREATE OR REPLACE PROCEDURE Izvestaj_Dest_Aranz AS
  CURSOR c_destinacije IS
    SELECT d.iddest, d.nazdest, d.nazdrz
    FROM Destinacija d;
  
  v_destinacija Destinacija%ROWTYPE;
  v_aranzman Aranzman%ROWTYPE;
  
  CURSOR c_aranzmani (p_iddest IN NUMBER) IS
    SELECT a.idaranz, a.datpoc, a.datzav, a.tipar
    FROM Aranzman a
    LEFT OUTER JOIN Obuhvata o ON a.idaranz = o.idaranz
    WHERE o.iddest = p_iddest;
BEGIN
  FOR v_destinacija IN c_destinacije LOOP
    DBMS_OUTPUT.PUT_LINE('Destinacija: ' || v_destinacija.nazdest);
    DBMS_OUTPUT.PUT_LINE('ID Destinacije: ' || v_destinacija.iddest);
    DBMS_OUTPUT.PUT_LINE('Država: ' || v_destinacija.nazdrz);
    DBMS_OUTPUT.PUT_LINE('-------------------------');
    
    FOR v_aranzman IN c_aranzmani(v_destinacija.iddest) LOOP
      DBMS_OUTPUT.PUT_LINE('    IdAranžmana: ' || v_aranzman.idaranz);
      DBMS_OUTPUT.PUT_LINE('    Datum poèetka: ' || TO_CHAR(v_aranzman.datpoc, 'DD-MON-YY'));
      DBMS_OUTPUT.PUT_LINE('    Datum završetka: ' || TO_CHAR(v_aranzman.datzav, 'DD-MON-YY'));
      DBMS_OUTPUT.PUT_LINE('    Tip aranžmana: ' || v_aranzman.tipar);
      DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
  END LOOP;
END;
/

BEGIN
  Izvestaj_Dest_Aranz;
END;
/

