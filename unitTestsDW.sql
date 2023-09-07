------------------------Testing
--Age >13
--Price >0
--Weight >0
--Email non missingValues

--Capacity >0
--QualityScore non missingValues
--TotalAmount >0
--StockeLevel >0
--RestockThreshold >0




-----Vérification de l'installation de tSQLt
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'tSQLt';
-----Liste des objects (tests) contenus dans tSQLt
SELECT *
FROM tSQLt.TestClasses;


USE Sales_Olap_Loading_DW;

----Création du schéma
EXEC tSQLt.NewTestClass 'Sales_Olap_Loading_DW_Tests';

----Création des tests

--TestAgesOver13
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[testAgesOver13] 
AS
BEGIN
    -- Act (Action) : Vérifiez si toutes les valeurs de la colonne "Age" sont positives
    DECLARE @AgesUnder13 INT;
    
    SELECT @AgesUnder13 = COUNT(*)
    FROM DimCustomer
    WHERE Age < 13;

    -- Assert (Vérification) : Vérifiez que le nombre de valeurs négatives est égal à zéro
    EXEC tSQLt.AssertEquals 0, @AgesUnder13;
END;


--TestPrice
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestPrice] 
AS
BEGIN
    -- Act (Action) : Vérifiez si toutes les valeurs de la colonne "Price" sont positives
    DECLARE @NegativePrices INT;
	
    SELECT @NegativePrices = COUNT(*)
    FROM DimProduct
    WHERE Price < 0;

    -- Assert (Vérification) : Vérifiez que le nombre de valeurs négatives est égal à zéro
    EXEC tSQLt.AssertEquals 0, @NegativePrices;
END;



--TestWeight
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestWeight] 
AS
BEGIN
    -- Act (Action) : Vérifiez si toutes les valeurs de la colonne "Weight" sont positives
    DECLARE @NegativeWeights INT;
	
    SELECT @NegativeWeights = COUNT(*)
    FROM DimProduct
    WHERE Weight < 0;

    -- Assert (Vérification) : Vérifiez que le nombre de valeurs négatives est égal à zéro
    EXEC tSQLt.AssertEquals 0, @NegativeWeights;
END;



--TestMissingEmails
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestWeight] 
AS
BEGIN
    -- Act (Action) : Vérifiez si toutes les valeurs de la colonne "Weight" sont positives
    DECLARE @NegativeWeights INT;
	
    SELECT @NegativeWeights = COUNT(*)
    FROM DimProduct
    WHERE Weight < 0;

    -- Assert (Vérification) : Vérifiez que le nombre de valeurs négatives est égal à zéro
    EXEC tSQLt.AssertEquals 0, @NegativeWeights;
END;




