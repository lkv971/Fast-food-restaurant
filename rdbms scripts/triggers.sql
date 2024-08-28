USE FastFoodDB;
GO

CREATE TRIGGER TrgAfterChangeIngredients
ON Ingredients
AFTER INSERT, DELETE
AS
BEGIN
	INSERT INTO IngredientsAudit (
	IngredientID,
	IngredientName,
	IngredientShortDescription,
	PortionUOMTypeID,
	ChangeType,
	ChangeDate
	)
	SELECT COALESCE(i.IngredientID, d.IngredientID) AS IngredientID,
		COALESCE(i.IngredientName, d.IngredientName) AS IngredientName,
		COALESCE(i.IngredientShortDescription, d.IngredientShortDescription) AS IngredientShortDescription,
		COALESCE(i.PortionUOMTypeID, d.PortionUOMTypeID) AS PortionUOMTypeID,
		CASE
			WHEN i.IngredientID IS NOT NULL AND d.IngredientID IS NULL THEN 'INSERT'
			WHEN i.IngredientID IS NULL AND d.IngredientID IS NOT NULL THEN 'DELETE'
		END AS ChangeType,
		GETDATE() AS ChangeDate
	FROM inserted i
	FULL OUTER JOIN deleted d 
	ON i.IngredientID = d.IngredientID;
END;
GO

CREATE TRIGGER TrgAfterChangeMenuItems
ON MenuItems
AFTER INSERT, DELETE
AS
BEGIN
	INSERT INTO MenuItemsAudit (
	MenuItemID,
	MenuItemName,
	MenuItemDescription,
	PLU,
	RecipeID,
	ChangeType,
	ChangeDate
	)
	SELECT COALESCE (i.MenuItemID, d.MenuItemID) AS MenuItemID,
		COALESCE (i.MenuItemName, d.MenuItemName) AS MenuItemName,
		COALESCE (i.MenuItemDescription, d.MenuItemDescription) AS MenuItemDescription,
		COALESCE (i.PLU, d.PLU) AS PLU,
		COALESCE (i.RecipeID, d.RecipeID) AS RecipeID,
		CASE
			WHEN i.MenuItemID IS NOT NULL AND d.MenuItemID IS NULL THEN 'INSERT'
			WHEN i.MenuItemID IS NULL AND d.MenuItemID IS NOT NULL THEN 'DELETE'
		END AS ChangeType,
		GETDATE() AS ChangeDate
	FROM inserted i 
	FULL OUTER JOIN deleted d
	ON i.MenuItemID = d.MenuItemID;
END;
GO



