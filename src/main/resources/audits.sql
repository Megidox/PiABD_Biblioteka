DROP TABLE IF EXISTS Audits
GO
CREATE TABLE Audits (
	AUDIT_ID INTEGER IDENTITY(1,1) PRIMARY KEY,
	RECORD_ID INTEGER,
	TABLE_NAME VARCHAR(255),	
	TYPE_OF_CHANGE VARCHAR(255),
	UPDATED_BY_USERNAME VARCHAR(255),
	UPDATE_TIME DATETIME
)
GO


DROP TRIGGER IF EXISTS dbo.triggerInsertAddress
GO
CREATE TRIGGER triggerInsertAddress ON dbo.Address
AFTER INSERT 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = ADDRESS_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Address', 'INSERT', SUSER_SNAME(), GETDATE())
	END
GO

INSERT INTO Address(CITY,COUNTRY,ZIP_CODE,PERSON_ID,STREET,LAST_NAME,TEL_NUMBER,FIRST_NAME) VALUES ('Nowe Miasto Lubawskie','Samoa','65-790',12,'ul. Dubiel 8573','Paw�owski','5994125','Wawrzyniec');

DROP TRIGGER IF EXISTS dbo.triggerUpdateAddress
GO
CREATE TRIGGER triggerUpdateAddress ON dbo.Address
AFTER UPDATE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = ADDRESS_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Address', 'UPDATE', SUSER_SNAME(), GETDATE())
	END
GO

UPDATE dbo.Address SET CITY='Terespol' WHERE ADDRESS_ID=(SELECT MAX(ADDRESS_ID) FROM dbo.Address);

DROP TRIGGER IF EXISTS dbo.triggerDeleteAddress
GO
CREATE TRIGGER triggerDeleteAddress ON dbo.Address
FOR DELETE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = ADDRESS_ID FROM deleted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Address', 'DELETE', SUSER_SNAME(), GETDATE())
	END
GO

DELETE FROM dbo.Address WHERE ADDRESS_ID=(SELECT MAX(ADDRESS_ID) FROM dbo.Address);

DROP TRIGGER IF EXISTS dbo.triggerInsertCategory
GO
CREATE TRIGGER triggerInsertCategory ON dbo.Category
AFTER INSERT 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = CATEGORY_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Category', 'INSERT', SUSER_SNAME(), GETDATE())
	END
GO

INSERT INTO Category(NAME) VALUES ('For UPDATE');

DROP TRIGGER IF EXISTS dbo.triggerUpdateCategory
GO
CREATE TRIGGER triggerUpdateCategory ON dbo.Category
AFTER UPDATE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = CATEGORY_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Category', 'UPDATE', SUSER_SNAME(), GETDATE())
	END
GO

UPDATE dbo.Category SET NAME='For DELETE' WHERE CATEGORY_ID=(SELECT MAX(CATEGORY_ID) FROM dbo.Category);

DROP TRIGGER IF EXISTS dbo.triggerDeleteCategory
GO
CREATE TRIGGER triggerDeleteCategory ON dbo.Category
FOR DELETE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = CATEGORY_ID FROM deleted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Category', 'DELETE', SUSER_SNAME(), GETDATE())
	END
GO

DELETE FROM dbo.Category WHERE CATEGORY_ID=(SELECT MAX(CATEGORY_ID) FROM dbo.Category);

DROP TRIGGER IF EXISTS dbo.triggerInsertBook
GO
CREATE TRIGGER triggerInsertBook ON dbo.Book
AFTER INSERT 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BOOK_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Book', 'INSERT', SUSER_SNAME(), GETDATE())
	END
GO

DROP TRIGGER IF EXISTS dbo.triggerUpdateBook
GO
CREATE TRIGGER triggerUpdateBook ON dbo.Book
AFTER UPDATE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BOOK_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Book', 'UPDATE', SUSER_SNAME(), GETDATE())
	END
GO

DROP TRIGGER IF EXISTS dbo.triggerDeleteBook
GO
CREATE TRIGGER triggerDeleteBook ON dbo.Book
FOR DELETE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BOOK_ID FROM deleted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Book', 'DELETE', SUSER_SNAME(), GETDATE())
	END
GO

DROP TRIGGER IF EXISTS dbo.triggerInsertBorrow
GO
CREATE TRIGGER triggerInsertBorrow ON dbo.Borrow
AFTER INSERT 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BORROW_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Borrow', 'INSERT', SUSER_SNAME(), GETDATE())
	END
GO

DROP TRIGGER IF EXISTS dbo.triggerUpdateBorrow
GO
CREATE TRIGGER triggerUpdateBorrow ON dbo.Borrow
AFTER UPDATE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BORROW_ID FROM inserted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Borrow', 'UPDATE', SUSER_SNAME(), GETDATE())
	END
GO

DROP TRIGGER IF EXISTS dbo.triggerDeleteBorrow
GO
CREATE TRIGGER triggerDeleteBorrow ON dbo.Borrow
FOR DELETE 
AS
BEGIN
	DECLARE @ID INTEGER;
SELECT @ID = BORROW_ID FROM deleted
	INSERT INTO Audits
		(RECORD_ID, TABLE_NAME, TYPE_OF_CHANGE, UPDATED_BY_USERNAME, UPDATE_TIME)
			VALUES(@ID,'Borrow', 'DELETE', SUSER_SNAME(), GETDATE())
	END
GO