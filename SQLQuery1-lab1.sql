CREATE DATABASE papetarie;
USE papetarie;

IF OBJECT_ID(N'Produs', N'U') IS NULL
CREATE TABLE Produs(
	id_produs int NOT NULL PRIMARY KEY,
	nume text,
	pret decimal(10,2),
	stoc int
);

CREATE TABLE Comanda(
	id_comnanda int NOT NULL PRIMARY KEY
);

CREATE TABLE produse_in_comanda(
	id_produs int NOT NULL,
	id_comnanda int NOT NULL,
	tip_produs nvarchar(50),
	CONSTRAINT PK_produse_in_comanda PRIMARY KEY(id_produs,id_comnanda),
	FOREIGN KEY (id_produs) REFERENCES Produs(id_produs),
    FOREIGN KEY (id_comnanda) REFERENCES Comanda(id_comnanda)
);

DROP TABLE produse_in_comanda


CREATE TABLE Client(
	id_client int PRIMARY KEY NOT NULL,
	nume text,
	adresa VARCHAR(50),
	numar_tel VARCHAR(10)
);

CREATE TABLE Furnizor(
	id_produs int NOT NULL,
	nume text,
	zi DATE,
	CONSTRAINT PK_Furnizor PRIMARY KEY(id_produs),
	FOREIGN KEY (id_produs) REFERENCES Produs(id_produs),
);

ALTER TABLE Comanda
ADD id_client int


DROP TABLE Client

INSERT INTO Produs VALUES (1, 'pix_cu_sclipici', 5.98, 100);
INSERT INTO Produs VALUES (2, 'stilou', 25.87, 42);
INSERT INTO Produs VALUES (3, 'foaie_alba', 0.5, 569);
INSERT INTO Produs VALUES (4, 'caiet_dictando', 7.99, 79);

INSERT INTO Comanda VALUES (1);
INSERT INTO Comanda VALUES (2);
INSERT INTO Comanda VALUES (3);
INSERT INTO Comanda VALUES (4);

INSERT INTO Client VALUES (15, 'Cornel', 'Str_Bizusa', '0743789432');
INSERT INTO Client VALUES (3, 'Mirela', 'Str_Tulcea', '0745723145');
INSERT INTO Client VALUES (14, 'Cristina', 'Str_Faget', '0747785180');
INSERT INTO Client VALUES (6, 'Carla', 'Str_Muresului', '0746960001');
INSERT INTO Client VALUES (1, 'Alex', 'Str_Azuga', '0752318258');
INSERT INTO Client VALUES (5, 'Miruna', 'Str_Ramurele', '0712378900');

SELECT *FROM Client

ALTER TABLE Comanda
ADD CONSTRAINT fk_client FOREIGN KEY(id_client) REFERENCES Client(id_client)

ALTER TABLE Comanda
ADD zi DATE

INSERT INTO Comanda VALUES (1, 15, '2023-11-01');
INSERT INTO Comanda VALUES (2, 5, '2023-11-07');
INSERT INTO Comanda VALUES (3, 1, '2023-10-21');
INSERT INTO Comanda VALUES (4, 6, '2023-09-04');
INSERT INTO Comanda VALUES (5, 3, '2023-08-15');
INSERT INTO Comanda VALUES (6, 14, '2023-11-07');
INSERT INTO Comanda VALUES (7, 5, '2023-11-07');
INSERT INTO Comanda VALUES (8, 5, '2023-10-21');
INSERT INTO Comanda VALUES (9, 3, '2023-10-21');
INSERT INTO Comanda VALUES (10, 1, '2023-11-07');

SELECT *FROM Comanda
UPDATE Comanda 
SET id_client=15
where id_comnanda=1

UPDATE Comanda 
SET id_client=5
where id_comnanda=2

UPDATE Comanda 
SET id_client=1
where id_comnanda=3

UPDATE Comanda 
SET id_client=6
where id_comnanda=4

UPDATE Comanda 
SET zi='2023-11-01'
where id_comnanda=1

UPDATE Comanda 
SET zi='2023-11-07'
where id_comnanda=2

UPDATE Comanda 
SET zi='2023-10-21'
where id_comnanda=3

UPDATE Comanda 
SET zi='2023-09-04'
where id_comnanda=4

SELECT *FROM Client
SELECT *FROM Produs

INSERT INTO produse_in_comanda VALUES (1,4);
INSERT INTO produse_in_comanda VALUES (1,10);
INSERT INTO produse_in_comanda VALUES (1,3);
INSERT INTO produse_in_comanda VALUES (1,5);
INSERT INTO produse_in_comanda VALUES (1,7);
INSERT INTO produse_in_comanda VALUES (2,10);
INSERT INTO produse_in_comanda VALUES (2,9);
INSERT INTO produse_in_comanda VALUES (2,7);
INSERT INTO produse_in_comanda VALUES (3,4);
INSERT INTO produse_in_comanda VALUES (3,2);
INSERT INTO produse_in_comanda VALUES (4,2);
INSERT INTO produse_in_comanda VALUES (4,1);

SELECT *FROM produse_in_comanda

INSERT INTO Furnizor VALUES (1, 'Mondi_Paper' , '2023-11-07');
INSERT INTO Furnizor VALUES (2, 'Faber_Castell' , '2023-11-02');
INSERT INTO Furnizor VALUES (3, '3M' , '2023-11-01');
INSERT INTO Furnizor VALUES (4, 'Pilot_Corporation' , '2023-11-05');

SELECT *FROM Furnizor

UPDATE Produs
SET pret = pret * 2
WHERE pret < 10

SELECT *FROM Produs


UPDATE Produs
SET stoc = '50'
WHERE id_produs % 2 = 1;

SELECT *FROM Produs

DELETE FROM Comanda 
WHERE id_client = 1 AND zi = '2023-10-21';

SELECT *FROM produse_in_comanda

SELECT *FROM Client

DELETE FROM produse_in_comanda 
WHERE id_produs = 4 OR id_comnanda % 2 = 0;

SELECT *FROM Comanda

ALTER TABLE produse_in_comanda
ADD tip_produs nvarchar(50)

UPDATE produse_in_comanda 
SET tip_produs='pix_cu_sclipici'
where id_comnanda=3

UPDATE produse_in_comanda 
SET tip_produs='pix_cu_sclipici'
where id_comnanda=5

UPDATE produse_in_comanda 
SET tip_produs='pix_cu_sclipici'
where id_comnanda=7

UPDATE produse_in_comanda 
SET tip_produs='stilou'
where id_produs=2

UPDATE produse_in_comanda 
SET tip_produs='stilou'
where id_produs=2

SELECT *FROM produse_in_comanda



ALTER TABLE Furnizor
ADD tip_produs nvarchar(50)

UPDATE Furnizor 
SET tip_produs='stilou'
where id_produs=2

UPDATE Furnizor 
SET tip_produs='pix_cu_sclipici'
where id_produs=1

UPDATE Furnizor 
SET tip_produs='foaie_alba'
where id_produs=3

UPDATE Furnizor 
SET tip_produs='caiet_dictando'
where id_produs=4

SELECT *FROM Furnizor




CREATE TABLE Delivery(
	id_livrator int PRIMARY KEY NOT NULL,
	nume text,
	numar_tel VARCHAR(10)
);

ALTER TABLE Comanda
ADD id_livrator int

ALTER TABLE Comanda
ADD CONSTRAINT PK_livrator FOREIGN KEY(id_livrator) REFERENCES Delivery(id_livrator)

SELECT *FROM Comanda

INSERT INTO Delivery VALUES (1, 'FAN_Courier', '0346489198');
INSERT INTO Delivery VALUES (2, 'Cargus', '0365197365');
INSERT INTO Delivery VALUES (3, 'Sameday', '0293176001');
INSERT INTO Delivery VALUES (4, 'DPD', '0719008506');
INSERT INTO Delivery VALUES (5, 'GLS', '0469100200');
INSERT INTO Delivery VALUES (6, 'DHL', '0720578162');

SELECT *FROM Delivery

UPDATE	Comanda
SET id_livrator='1'
where id_comnanda=1

UPDATE	Comanda
SET id_livrator='5'
where id_comnanda=2

UPDATE	Comanda
SET id_livrator='3'
where id_comnanda=4

UPDATE	Comanda
SET id_livrator='6'
where id_comnanda=5

UPDATE	Comanda
SET id_livrator='2'
where id_comnanda=6

UPDATE	Comanda
SET id_livrator='4'
where id_comnanda=7

UPDATE	Comanda
SET id_livrator='4'
where id_comnanda=8

UPDATE	Comanda
SET id_livrator='3'
where id_comnanda=9

UPDATE	Comanda
SET id_livrator='6'
where id_comnanda=10

select *from Comanda




SELECT tip_produs FROM Furnizor
UNION
SELECT tip_produs FROM produse_in_comanda
ORDER BY tip_produs

select Comanda.id_comnanda, Client.nume, Delivery.nume
from ((Comanda
INNER JOIN Client ON Comanda.id_client = Client.id_client)
INNER JOIN Delivery ON Comanda.id_livrator = Delivery.id_livrator)

select produse_in_comanda.tip_produs, Produs.nume, Comanda.zi
from ((produse_in_comanda
INNER JOIN Produs ON produse_in_comanda.id_produs = Produs.id_produs)
INNER JOIN Comanda ON produse_in_comanda.id_comnanda = Comanda.id_comnanda)

select Comanda.id_comnanda, Client.nume, Client.numar_tel, Delivery.nume, Delivery.numar_tel
from ((Comanda
RIGHT JOIN Client ON Comanda.id_client = Client.id_client)
RIGHT JOIN Delivery ON Comanda.id_livrator = Delivery.id_livrator)

select produse_in_comanda.tip_produs, Produs.nume, Comanda.zi
from ((produse_in_comanda
RIGHT JOIN Produs ON produse_in_comanda.id_produs = Produs.id_produs)
RIGHT JOIN Comanda ON produse_in_comanda.id_comnanda = Comanda.id_comnanda)

select count(id_client), zi
from Comanda
group by zi
having count(id_client)>3

select SUM(pret), id_produs
from Produs
group by id_produs
having SUM(pret)>15

select AVG(stoc), id_produs
from Produs
group by id_produs

select *from Produs
select *from Furnizor

SELECT *
FROM Produs
WHERE id_produs IN (
    SELECT id_produs
    FROM Furnizor
    WHERE CHARINDEX('a', nume) > 0
);

SELECT *
FROM Client c
WHERE EXISTS (
    SELECT 1
    FROM Comanda co
    JOIN produse_in_comanda pc ON co.id_comnanda = pc.id_comnanda
    JOIN Produs p ON pc.id_produs = p.id_produs
    WHERE c.id_client = co.id_client AND p.stoc > 2
);



DROP TABLE Distributions;
DROP TABLE Movie;
DROP TABLE Actor;

select *from Produs

INSERT INTO produse_in_comanda VALUES (1,4, 'foaie_alba');
INSERT INTO produse_in_comanda VALUES (1,10, 'caiet_dictando');
INSERT INTO produse_in_comanda VALUES (1,5, 'pix_cu_sclipici');
INSERT INTO produse_in_comanda VALUES (1,7, 'pix_cu_sclipici');
INSERT INTO produse_in_comanda VALUES (2,10, 'stilou');
INSERT INTO produse_in_comanda VALUES (2,9, 'stilou');
INSERT INTO produse_in_comanda VALUES (2,7, 'stilou');
INSERT INTO produse_in_comanda VALUES (3,4, 'foaie_alba');
INSERT INTO produse_in_comanda VALUES (3,2, 'foaie alba');
INSERT INTO produse_in_comanda VALUES (4,2, 'caiet_dictando');
INSERT INTO produse_in_comanda VALUES (4,1, 'caiet_dictando');

select *from produse_in_comanda


CREATE OR ALTER FUNCTION dbo.ValidateClientData(@nume TEXT, @adresa VARCHAR(50), @numar_tel VARCHAR(10))
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT = 1;

    IF @nume IS NULL OR @adresa IS NULL OR @numar_tel IS NULL
        SET @isValid = 0;

    RETURN @isValid;
END;

CREATE OR ALTER PROCEDURE dbo.InsertClientData
    @nume TEXT,
    @adresa VARCHAR(50),
    @numar_tel VARCHAR(10)
AS
BEGIN
    IF dbo.ValidateClientData(@nume, @adresa, @numar_tel) = 1
    BEGIN
        INSERT INTO Client (nume, adresa, numar_tel)
        VALUES (@nume, @adresa, @numar_tel);
    END
END;



CREATE OR ALTER FUNCTION dbo.ValidateOrderData(@id_client INT, @zi DATE)
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT = 1;

    IF NOT EXISTS (SELECT 1 FROM Client WHERE id_client = @id_client)
        SET @isValid = 0;

    RETURN @isValid;
END;

CREATE OR ALTER PROCEDURE dbo.InsertOrderData
    @id_client INT,
    @zi DATE
AS
BEGIN
    IF dbo.ValidateOrderData(@id_client, @zi) = 1
    BEGIN
        INSERT INTO Comanda (id_client, zi)
        VALUES (@id_client, @zi);
    END
END;



CREATE OR ALTER FUNCTION dbo.ValidateProductData(@nume TEXT, @pret DECIMAL(10, 2), @stoc INT)
RETURNS BIT
AS
BEGIN
    DECLARE @isValid BIT = 1;

    IF @pret <= 0
        SET @isValid = 0;

    RETURN @isValid;
END;

CREATE OR ALTER PROCEDURE dbo.InsertProductData
    @nume TEXT,
    @pret DECIMAL(10, 2),
    @stoc INT
AS
BEGIN
    IF dbo.ValidateProductData(@nume, @pret, @stoc) = 1
    BEGIN
        INSERT INTO Produs (nume, pret, stoc)
        VALUES (@nume, @pret, @stoc);
    END
END;


CREATE OR ALTER VIEW ComandaClientView AS
SELECT
    Comanda.id_comnanda,
    Comanda.zi,
    Client.nume AS client_nume,
    Client.adresa AS client_adresa,
    Client.numar_tel AS client_numar_tel
FROM
    Comanda 
INNER JOIN
    Client ON Comanda.id_client = Client.id_client


CREATE OR ALTER TRIGGER tr_Produs_Insert
ON Produs
AFTER INSERT
AS
BEGIN
    DECLARE @tipOperatie NVARCHAR(10) = 'INSERT';
    DECLARE @numeTabel NVARCHAR(50) = 'Produs';
    DECLARE @dataOraCurenta DATETIME = GETDATE();


    -- Afișarea unui mesaj
    PRINT 'Operație: ' + @tipOperatie + ', Tabel: ' + @numeTabel + ', Data si Ora: ' + CONVERT(NVARCHAR, @dataOraCurenta);

END;

INSERT INTO Produs VALUES (5, 'carioci', 78, 257);
SELECT *FROM Produs

CREATE OR ALTER TRIGGER tr_Produs_Delete
ON Produs
AFTER DELETE
AS
BEGIN
    DECLARE @tipOperatie NVARCHAR(10) = 'DELETE';
    DECLARE @numeTabel NVARCHAR(50) = 'Produs';

    -- Obținerea datei și orei curente
    DECLARE @dataOraCurenta DATETIME = GETDATE();

    -- Afișarea unui mesaj
    PRINT 'Operație: ' + @tipOperatie + ', Tabel: ' + @numeTabel + ', Data si Ora: ' + CONVERT(NVARCHAR, @dataOraCurenta);
END;

DELETE FROM Produs WHERE id_produs = 11;
SELECT *FROM Produs

CREATE OR ALTER TRIGGER tr_Produs_Update
ON Produs
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @tipOperatie NVARCHAR(10) = 'UPDATE';
    DECLARE @numeTabel NVARCHAR(50) = 'Produs';
    DECLARE @dataOraCurenta DATETIME = GETDATE();

    PRINT 'Operație: ' + @tipOperatie + ', Tabel: ' + @numeTabel + ', Data si Ora: ' + CONVERT(NVARCHAR, @dataOraCurenta);
END;

UPDATE Produs 
SET pret = 49.69 
WHERE id_produs = 5;

SELECT *FROM Produs


CREATE OR ALTER TRIGGER tr_CheckPrice
ON Produs
INSTEAD OF INSERT
AS
BEGIN
    
    DECLARE @tipOperatie NVARCHAR(20) = 'INSERT';
    DECLARE @numeTabel NVARCHAR(50) = 'Produs';
    DECLARE @dataOraCurenta DATETIME = GETDATE();

    -- Afișarea unui mesaj
    PRINT 'Operație: ' + @tipOperatie + ', Tabel: ' + @numeTabel + ', Data si Ora: ' + CONVERT(NVARCHAR, @dataOraCurenta);

    -- Verificarea prețului înainte de inserare
    IF EXISTS (SELECT 1 FROM inserted WHERE pret > 9)
    BEGIN
        PRINT 'Nu se poate efectua inserarea. Pretul trebuie sa fie <= 9.';
    END
    ELSE
    BEGIN
        -- Inserarea efectivă în tabelul Produs
        INSERT INTO Produs (id_produs, nume, pret, stoc)
        SELECT id_produs, nume, pret, stoc
        FROM inserted;
    END
END;

INSERT INTO Produs VALUES (7, 'creioane_cerate', 8.5, 39)
select *from Produs