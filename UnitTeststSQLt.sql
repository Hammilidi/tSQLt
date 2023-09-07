-----Vérification de l'installation de tSQLt
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'tSQLt';
-----Liste des objects contenus dans tSQLt
SELECT *
FROM tSQLt.TestClasses;

SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_NAME = 'GetTestResult';

--Exécution de tous les tests
--EXEC tSQLt.RunAll;


--------------------------------------------------------------------------------------------------------------------------------
--Création d'une procédure
CREATE PROCEDURE SelectAllCompanies AS
SELECT company_name FROM Company;
--Création d'une procédure à paramètres
CREATE PROCEDURE proc_Facilities @facility NVARCHAR(30) AS
SELECT * FROM Facility WHERE facility=@facility;
SELECT * FROM Facility ;

--Execution des procédures créées
EXEC SelectAllCompanies;
EXEC proc_Facilities @facility="Flex hours";

--------------------------------------------------------------------------------------------------------------------------
--Utilisation de tSQLt

--Création d'une classe (schéma nommé)
EXEC tSQLt.NewTestClass 'FacilityTests';

--Création d'un test dans le schéma 
-- Créez un test 
CREATE PROCEDURE FacilityTests.[test Facility table exists]
AS
BEGIN
    -- Arrange (Préparation) : Aucune préparation nécessaire ici

    -- Act (Action) : Vérifier si la table existe
    EXEC tSQLt.AssertObjectExists 'dbo.Facility';

    -- Assert (Vérification) : Aucune vérification supplémentaire nécessaire ici
END;

--Exécuter le test
EXEC tSQLt.Run 'FacilityTests.[test Facility table exists]';

--Vérification des résultats
EXEC tSQLt.GetTestResult;


--Ajout d'un nouveau test au schéma (sans la logique)
tSQLt.NewTestProcedure 'SCHEMA_NAME', 'TEST_NAME';

--Ensuite on la logique avec une procédure de la meme façon que précédemment

---------------------------------------------------------------------------------------------------------------------------------
USE projet;

--Schéma
EXEC tSQLt.NewTestClass 'StudentTests';

--Test
CREATE PROCEDURE StudentTests.[test All Quantities Are Positive]
AS
BEGIN
    -- Arrange (Préparation) : Aucune préparation nécessaire ici

    -- Act (Action) : Vérifiez si toutes les valeurs de la colonne "Age" sont positives
    DECLARE @NegativeAges INT;
    
    SELECT @NegativeAges = COUNT(*)
    FROM ventes
    WHERE Quantity <= 0;

    -- Assert (Vérification) : Vérifiez que le nombre de valeurs négatives est égal à zéro
    EXEC tSQLt.AssertEquals 0, @NegativeAges;
END;


--Exécution du test
EXEC tSQLt.Run 'StudentTests.[test All Quantities Are Positive]';

--Résultat
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
