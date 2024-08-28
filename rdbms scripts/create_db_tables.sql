CREATE DATABASE FastFoodDB
;
GO

Use FastFoodDB;
GO

CREATE TABLE Ingredients (
IngredientName VARCHAR(100),
IngredientShortDescription VARCHAR(200),
IngredientID INT PRIMARY KEY,
PortionUOMTypeID INT
)
; 
GO 

CREATE TABLE IngredientsAudit (
 AuditID INT PRIMARY KEY IDENTITY(1,1),
 IngredientID INT,
 IngredientName VARCHAR(100),
 IngredientShortDescription VARCHAR(200),
 PortionUOMTypeID INT,
 ChangeType VARCHAR(10),   
 ChangeDate DATETIME
)
;
GO


CREATE TABLE MenuItems (
MenuItemName VARCHAR(100),
MenuItemDescription VARCHAR(200),
PLU INT,
MenuItemID INT PRIMARY KEY,
RecipeID INT,
)
;
GO

CREATE TABLE MenuItemsAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
MenuItemID INT,
MenuItemName VARCHAR(100),
MenuItemDescription VARCHAR(200),
PLU INT,
RecipeID INT,
ChangeType VARCHAR(10),
ChangeDate DATETIME
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
MenuItemsID INT,
date VARCHAR(15)
)
;
GO

CREATE TABLE SalesDetailsAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
MD5KEY_ORDERSALE VARCHAR(100),
MD5KEY_MENUITEM VARCHAR(100),
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
MenuItemsID INT,
date VARCHAR(15),
ChangeType VARCHAR(10),
ChangeDate DATETIME
)
;
GO

CREATE TABLE PortionTypes (
PortionTypeDescription VARCHAR(20),
PortionUOMTypeID INT PRIMARY KEY,
)
;
GO

CREATE TABLE PortionTypesAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
PortionUOMTypeID INT,
PortionTypeDescription VARCHAR(20),
ChangeType VARCHAR(10),
ChangeDate DATETIME
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
TransactionID INT,
StoreNumber INT,
date VARCHAR(15)
)
;
GO

CREATE TABLE OrderTransactionsAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
TransactionID INT,
MD5KEY_ORDERSALE VARCHAR(100),
ChangeReceived DECIMAL(10,2),
OrderNumber INT,
TaxInclusiveAmount DECIMAL(10,2),
TaxAmount DECIMAL(10,2),
MealLocation INT,
StoreNumber INT,
date VARCHAR(15),
ChangeType VARCHAR(10),
ChangeDate DATETIME
)
;
GO

CREATE TABLE Recipes (
RecipeName VARCHAR(100),
RecipeDescription VARCHAR(200),
RecipeID INT PRIMARY KEY
)
;
GO

CREATE TABLE RecipesAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
RecipeID INT,
RecipeName VARCHAR(100),
RecipeDescription VARCHAR(200),
ChangeType VARCHAR(10),
ChangeDate DATETIME
)
;
GO

CREATE TABLE Stores (
StoreAddress VARCHAR(50),
DistributionRegion VARCHAR(20),
StoreState VARCHAR(50),
StoreCity VARCHAR(50),
StoreZip INT,
StoreType VARCHAR(50),
StoreLoyaltyFlag CHAR(1),
StoreNumber INT PRIMARY KEY 
)
;
GO

CREATE TABLE StoresAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
StoreNumber INT,
StoreAddress VARCHAR(50),
DistributionRegion VARCHAR(20),
StoreState VARCHAR(50),
StoreCity VARCHAR(50),
StoreZip INT,
StoreType VARCHAR(50),
StoreLoyaltyFlag CHAR(1),
ChangeType VARCHAR(10),
ChangeDate DATETIME 
)
;
GO

CREATE TABLE SubRecipeIngredientAssignments (
SubRecipeID INT,
IngredientID INT,
Quantity INT
)
;
GO

CREATE TABLE SubRecipeIngredientAssignmentsAudit (
AuditID INT PRIMARY KEY IDENTITY(1,1),
SubRecipeID INT,
IngredientID INT,
Quantity INT,
ChangeType VARCHAR(10),
ChangeDate DATETIME
)
;
GO

CREATE TABLE SubRecipes (
SubRecipeName VARCHAR(100),
SubRecipeDescription VARCHAR(200),
SubRecipeID INT PRIMARY KEY 
)
;
GO

CREATE TABLE SubRecipeAudit (
AuditID INT PRIMARY KEY IDENTITY (1,1),
SubRecipeID INT,
SubRecipeName VARCHAR(100),
SubRecipeDescription VARCHAR(200),
ChangeType VARCHAR(10),
ChangeDate DATETIME
)
;
GO

