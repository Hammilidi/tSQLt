------------------------Testing
--Age >13
--Price >0
--Weight >0
--Email non missingValues
--TotalAmount >0


--Capacity >0
--QualityScore non missingValues
--StockeLevel >0
--RestockThreshold >0






-----V�rification de l'installation de tSQLt
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME = 'tSQLt';
-----Nombre d'objets (tests) contenus dans tSQLt
SELECT *
FROM tSQLt.TestClasses;






USE Sales_Olap_Loading_DW;

----Cr�ation du sch�ma
EXEC tSQLt.NewTestClass 'Sales_Olap_Loading_DW_Tests';




---------Cr�ation des tests

--TestAgesOver13
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[testAgesOver13] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Age" sont positives
    DECLARE @AgesUnder13 INT;
    
    SELECT @AgesUnder13 = COUNT(*)
    FROM DimCustomer
    WHERE Age < 13;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @AgesUnder13;
END;




--TestPrice
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestPrice] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Price" sont positives
    DECLARE @NegativePrices INT;
	
    SELECT @NegativePrices = COUNT(*)
    FROM DimProduct
    WHERE Price < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativePrices;
END;




--TestWeight
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestWeight] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Weight" sont positives
    DECLARE @NegativeWeights INT;
	
    SELECT @NegativeWeights = COUNT(*)
    FROM DimProduct
    WHERE Weight < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeWeights;
END;




-- TestMissingEmails
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestMissingEmails] 
AS
BEGIN
    -- Act (Action) : S�lectionnez toutes les valeurs de la colonne "Email" o� le champ est NULL
    DECLARE @MissingEmails INT;

    SELECT @MissingEmails = COUNT(*)
    FROM DimCustomer
    WHERE Email IS NULL;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs manquantes est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @MissingEmails;
END;




--TestTotalAmount 
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestTotalAmount] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "TotalAmount" sont positives
    DECLARE @NegativeTotalAmount INT;
	
    SELECT @NegativeTotalAmount = COUNT(*)
    FROM FactOrder
    WHERE TotalAmount < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeTotalAmount;
END;




--TestCapacity
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestCapacity] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Capacity" sont positives
    DECLARE @NegativeCapacities INT;
	
    SELECT @NegativeCapacities = COUNT(*)
    FROM DimWarehouse
    WHERE Capacity < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeCapacities;
END;



--TestMissingQualityScore
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestMissingQualityScore] 
AS
BEGIN
    -- Act (Action) : S�lectionnez toutes les valeurs de la colonne "QualityScore" o� le champ est NULL
    DECLARE @MissingQualityScore INT;

    SELECT @MissingQualityScore = COUNT(*)
    FROM DimSupplier
    WHERE QualityScore IS NULL;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs manquantes est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @MissingQualityScore;
END;




--TestStockLevel
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestStockLevel] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Capacity" sont positives
    DECLARE @NegativeStockLevel INT;
	
    SELECT @NegativeStockLevel = COUNT(*)
    FROM FactInventory
    WHERE StockLevel < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeStockLevel;
END;



--TestRestockThreshold
CREATE PROCEDURE Sales_Olap_Loading_DW_Tests.[TestRestockThreshold] 
AS
BEGIN
    -- Act (Action) : V�rifiez si toutes les valeurs de la colonne "Capacity" sont positives
    DECLARE @NegativeRestockThreshold INT;
	
    SELECT @NegativeRestockThreshold = COUNT(*)
    FROM DimRestockThreshold
    WHERE RestockThreshold < 0;

    -- Assert (V�rification) : V�rifiez que le nombre de valeurs n�gatives est �gal � z�ro
    EXEC tSQLt.AssertEquals 0, @NegativeRestockThreshold;
END;




--Ex�cution de de chaque test
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestAgesOver13]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestPrice]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestWeight]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestMissingEmails]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestTotalAmountTestTotalAmount]' ;

EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestCapacity]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestMissingQualityScore]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestRestockThreshold]' ;
EXEC tSQLt.Run 'Sales_Olap_Loading_DW_Tests.[TestStockLevel]' ;






--Ex�cution de tous les tests
EXEC tSQLt.RunAll;
EXEC tSQLt.Private_OutputTestResults;
