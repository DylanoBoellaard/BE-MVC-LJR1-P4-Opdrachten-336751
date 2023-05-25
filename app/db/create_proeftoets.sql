-- Step: 01
-- Goal: Create a new database mvc-2209b-P4-Ljr1
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Dylano Boellaard            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `mvc-2209b-P4-Ljr1`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `mvc-2209b-P4-Ljr1`;

-- Use database mvc-2209b-P4-Ljr1
Use `mvc-2209b-P4-Ljr1`;

-- Step: 02
-- Goal: Create a new table LesPakket
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Dylano Boellaard            New
-- **********************************************************************************/

-- Drop table LesPakket
DROP TABLE IF EXISTS LesPakket;

CREATE TABLE IF NOT EXISTS LesPakket
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,PakketNaam          VARCHAR(50)                     NOT NULL
   ,AantalLessen        INT(5)                          NOT NULL
   ,Rijbewijscategorie  VARCHAR(50)                     NOT NULL
   ,Prijs               INT(5)                          NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_LesPakket_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table LesPakket with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Dylano Boellaard            New
-- **********************************************************************************/

INSERT INTO LesPakket
(
     PakketNaam
    ,AantalLessen
    ,Rijbewijscategorie
    ,Prijs
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Personenauto Extra', 40, 'B', 2700, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Vrachtwagen Subliem', 60, 'C', 5400 , 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bus Extraordinaire', 80, 'D', 7300 , 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bromfiets Deluxe', 10, 'AM', 230 , 1, NULL, SYSDATE(6), SYSDATE(6));


-- Stap 04, Create Leerling table
CREATE TABLE IF NOT EXISTS Leerling
(
    Id                      TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam                VARCHAR(50)                     NOT NULL
   ,Tussenvoegsel           VARCHAR(25)                     NULL
   ,Achternaam              VARCHAR(50)                     NOT NULL
   ,Mobiel                  VARCHAR(15)                     NOT NULL
   ,IsActief                BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen             VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt         DateTime(6)                     NOT NULL
   ,DatumGewijzigd          DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Leerling_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Stap 05, Fill Leerling table with data
INSERT INTO Leerling
(
    Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
('Bas', 'De', 'Bakker', '06-28493827', 1, NULL, SYSDATE(6), SYSDATE(6))
,('Terence', '', 'Draaijer', '06-39398734', 1, NULL, SYSDATE(6), SYSDATE(6))
,('Samuel', '', 'Werchter', '06-24383291', 1, NULL, SYSDATE(6), SYSDATE(6))
,('Sharida', '', 'Tetehuka', '06-48393823', 1, NULL, SYSDATE(6), SYSDATE(6))
,('Fatma', '', 'Yilmax', '06-34291234', 1, NULL, SYSDATE(6), SYSDATE(6));


-- Stap 06, Create LeerlingPerLesPakket table
CREATE TABLE IF NOT EXISTS LeerlingPerLesPakket
(
    Id                      TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,LesPakketId             TINYINT         UNSIGNED        NOT NULL
   ,LeerlingId              TINYINT         UNSIGNED        NOT NULL
   ,StartDatumRijlessen     DATE                            NOT NULL
   ,DatumRijbewijsBehaald   DATE                            NULL
   ,IsActief                BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen             VARCHAR(250)                    NULL        DEFAULT NULL
   ,DatumAangemaakt         DateTime(6)                     NOT NULL
   ,DatumGewijzigd          DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_LeerlingPerLesPakket_Id      PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_LeerlingPerLesPakket_LesPakketId_LesPakket_Id   FOREIGN KEY (LesPakketId) REFERENCES LesPakket(Id)
   ,CONSTRAINT      FK_LeerlingPerLesPakket_LeerlingId_Leerling_Id   FOREIGN KEY (LeerlingId) REFERENCES Leerling(Id)
) ENGINE=InnoDB;


-- Stap 07, Fill LeerlingPerLesPakket table with data
INSERT INTO LeerlingPerLesPakket
(
    LesPakketId
    ,LeerlingId
    ,StartDatumRijlessen
    ,DatumRijbewijsBehaald
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
(1, 5, '2023-05-23', NULL, 1, NULL, SYSDATE(6), SYSDATE(6))
,(4, 1, '2022-06-03', '2022-08-05', 1, NULL, SYSDATE(6), SYSDATE(6))
,(1, 1, '2023-06-02', NULL, 1, NULL, SYSDATE(6), SYSDATE(6))
,(3, 4, '2023-01-01', NULL, 1, NULL, SYSDATE(6), SYSDATE(6))
,(1, 2, '2022-11-30', '2023-05-23', 1, NULL, SYSDATE(6), SYSDATE(6))
,(2, 3, '2022-06-06', '2023-06-06', 1, NULL, SYSDATE(6), SYSDATE(6));