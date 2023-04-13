-- Step: 01
-- Goal: Create a new database mvc-2209b-P4-Ljr1
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `mvc-2209b-P4-Ljr1`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `mvc-2209b-P4-Ljr1`;

-- Use database mvc-2209b-P4-Ljr1
Use `mvc-2209b-P4-Ljr1`;

-- Step: 02
-- Goal: Create a new table Persoon
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Drop table Persoon
DROP TABLE IF EXISTS Persoon;

CREATE TABLE IF NOT EXISTS Persoon
(
    Id              TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam        VARCHAR(50)                     NOT NULL
   ,Tussenvoegsel   VARCHAR(10)                     NOT NULL
   ,Achternaam      VARCHAR(50)                     NOT NULL
   ,Mobiel          VARCHAR(12)                     NOT NULL
   ,DatumInDienst   DATE                            NOT NULL
   ,AantalSterren   VARCHAR(6)                      NOT NULL
   ,IsActief        BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen     VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt DateTime(6)                     NOT NULL
   ,DatumGewijzigd  DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Persoon_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Persoon with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

INSERT INTO Persoon
(
     Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,DatumInDienst
    ,AantalSterren
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Yoeri', 'van', 'Veen', '06-24383291', '2010-05-12', '***', 1, NULL, SYSDATE(6), SYSDATE(6));