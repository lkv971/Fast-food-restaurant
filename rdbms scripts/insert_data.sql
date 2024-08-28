Use FastFoodDB;
GO

BULK INSERT Ingredients 
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\ingredients.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT MenuItems
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\menu_items.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT SalesDetails
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\menuitem.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT = 'CSV',
MAXERRORS = 1000
)
;
GO

BULK INSERT PortionTypes
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\portion_uom_types.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT OrderTransactions
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\pos_ordersale.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Recipes
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\recipes.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT Stores
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\store_restaurant.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV',
CODEPAGE = '65001'
)
;
GO


BULK INSERT SubRecipeIngredientAssignments
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\sub_recipe_ingr_assignments.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO

BULK INSERT SubRecipes
FROM "C:\Users\ACER\Documents\GitHub\Fast-food-restaurant\raw data\sub_recipes.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT = 'CSV'
)
;
GO