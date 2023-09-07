-----V�rification de l'installation de tSQLt
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'tSQLt';
-----Liste des objects contenus dans tSQLt
SELECT *
FROM tSQLt.TestClasses;

SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_NAME = 'GetTestResult';

--Ex�cution de tous les tests
--EXEC tSQLt.RunAll;


--------------------------------------------------------------------------------------------------------------------------------
--Cr�ation d'une proc�dure
CREATE PROCEDURE SelectAllCompanies AS
SELECT company_name FROM Company;
--Cr�ation d'une proc�dure � param�tres
CREATE PROCEDURE proc_Facilities @facility NVARCHAR(30) AS
SELECT * FROM Facility WHERE facility=@facility;
SELECT * FROM Facility ;

--Execution des proc�dures cr��es
EXEC SelectAllCompanies;
EXEC proc_Facilities @facility="Flex hours";

--------------------------------------------------------------------------------------------------------------------------
--Utilisation de tSQLt

--Cr�ation d'une classe (sch�ma nomm�)
EXEC tSQLt.NewTestClass 'FacilityTests';

--Cr�ation d'un test dans le sch�ma 
-- Cr�ez un test 
CREATE PROCEDURE FacilityTests.[test Facility table exists]
AS
BEGIN
    -- Arrange (Pr�paration) : Aucune pr�paration n�cessaire ici

    -- Act (Action) : V�rifier si la table existe
    EXEC tSQLt.AssertObjectExists 'dbo.Facility';

    -- Assert (V�rification) : Aucune v�rification suppl�mentaire n�cessaire ici
END;

--Ex�cuter le test
EXEC tSQLt.Run 'FacilityTests.[test Facility table exists]';

--V�rification des r�sultats
EXEC tSQLt.GetTestResult;


--Ajout d'un nouveau test au sch�ma (sans la logique)
tSQLt.NewTestProcedure 'SCHEMA_NAME', 'TEST_NAME';

--Ensuite on la logique avec une proc�dure de la meme fa�on que pr�c�demment

---------------------------------------------------------------------------------------------------------------------------------
USE projet;

--Sch�ma
EXEC tSQLt.NewTestClass 'StudentTests';

--Test
CREATE PROCEDURE StudentTests.[test All Quantities Are Positive]
AS
BEGIN
    -- Arrange (Pr�paration) : Aucune pr�paration n�cessaire ici

    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Age" sont positives
    DECLARE @NegativeAges INT;
    
    SELECT @NegativeAges = COUNT(*)
    FROM ventes
    WHERE Quantity <= 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeAges;
END;


--Ex�cution du test
EXEC tSQLt.Run 'StudentTests.[test All Quantities Are Positive]';

--R�sultat
EXEC tSQLt.GetTestResult; --GetTestResult n'est pas disponible 

SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_NAME = 'GetTestResult';


--Testing
--Age >13
--Price >0
--Weight >0
--TotalAmount >0
--StockeLevel >0
--RestockThreshold >0
--Capacity >0
--QualityScore non missingValues
--Email non missingValues

SELECT @@SERVERNAME;
