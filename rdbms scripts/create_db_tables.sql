CREATE DATABASE FastFoodDB
;
GO

Use FastFoodDB;
GO

CREATE TABLE Ingredients (
IngredientName VARCHAR(100),
IngredientShortDescription VARCHAR(200),
IngredientId INT,
PortionUOMTypeID INT
)
; 
GO 

CREATE TABLE MenuItems (
MenuItemName VARCHAR(100),
MenuItemDescription VARCHAR(200),
PLU INT,
MenuItemID INT,
RecipeID INT,
)
;
GO


CREATE TABLE SalesDetails (
MD5KEY_MENUITEM VARCHAR(100),
MD5KEY_ORDERSALE VARCHAR(100),
CategoryDescription VARCHAR(200),
DepartmentDescription VARCHAR(200),
Description VARCHAR(200),
StoreNumber INT,
TaxInclusiveAmount INT,
TaxAmount DECIMAL(10,2),
AdjustedPrice DECIMAL(10,2),
DiscountAmount DECIMAL(10,2),
Price DECIMAL(10,2),
Quantity INT,
PLU INT,
Id INT,
date DATE
)
;
GO

CREATE TABLE PortionTypes (
PortionTypeDescription VARCHAR(20),
PortionUOMTypeId INT
)
;
GO

CREATE TABLE OrderTransactions (
MD5KEY_ORDERSALE VARCHAR(100),
ChangeReceived DECIMAL(10,2),
OrderNumber INT,
TaxInclusiveAmount DECIMAL(10,2),
TaxAmount DECIMAL(10,2),
MealLocation INT,
TransactionId INT,
StoreNumber INT,
date DATE
)
;
GO

CREATE TABLE Recipes (
RecipeName VARCHAR(100),
RecipeDescription VARCHAR(200),
RecipeId INT
)
;
GO

CREATE TABLE Stores (
STORE_ADDRESS1 VARCHAR(50),
STORE_ADDRESS2 VARCHAR(10),
DISTRIBUTION_REGION VARCHAR(20),
STORE_STATE VARCHAR(50),
STORE_CITY VARCHAR(50),
STORE_ZIP INT,
STORE_TYPE VARCHAR(50),
STORE_LOYALTY_FLAG CHAR(1),
STORE_NUMBER INT
)
;
GO

CREATE TABLE SubRecipeIngredientAssignments (
SubRecipeId INT,
IngredientId INT,
Quantity INT
)
;
GO

CREATE TABLE SubRecipe (
SubRecipeName VARCHAR(100),
SubRecipeDescription VARCHAR(200),
SubRecipeId INT
)
;
GO

