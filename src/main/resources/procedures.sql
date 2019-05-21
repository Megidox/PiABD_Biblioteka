DROP PROCEDURE IF EXISTS dbo.getCountOfBookByTitle
GO
CREATE PROCEDURE getCountOfBookByTitle @Title varchar(255) = NULL, @Quantity int OUT
AS
SELECT @Quantity = SUM(QUANTITY)
FROM dbo.Book
WHERE TITLE = @Title
GO

DECLARE @Quantity INT
EXEC dbo.getCountOfBookByTitle @Title='Many Waters', @Quantity=@Quantity OUTPUT
SELECT @Quantity as Quantity
GO

DROP PROCEDURE IF EXISTS dbo.setBorrowAsReturned
GO
CREATE PROCEDURE setBorrowAsReturned @Borrow_Id int = NULL
AS
UPDATE dbo.Borrow
SET DATE_OF_RETURN=GETDATE()
WHERE BORROW_ID=@Borrow_Id
GO

EXEC dbo.setBorrowAsReturned @Borrow_id=3
GO

DROP PROCEDURE IF EXISTS dbo.getOpinionsForBookWithId
GO
CREATE PROCEDURE getOpinionsForBookWithId @Book_Id int = NULL
AS
SELECT opinion.ID as 'OPINION_ID', opinion.DESCRIPTION as 'Description', opinion.RATE as 'Rate per 10', book.TITLE as 'Title of book' 
FROM dbo.Opinion opinion
INNER JOIN dbo.Book book ON book.BOOK_ID = opinion.BOOK_ID
WHERE opinion.BOOK_ID = @Book_Id
GO

EXEC dbo.getOpinionsForBookWithId @Book_Id=51
GO

DROP PROCEDURE IF EXISTS dbo.getAllBooksFromPublisherWithName
GO
CREATE PROCEDURE getAllBooksFromPublisherWithName @Publisher_Name VARCHAR(255) = NULL
AS
SELECT book.TITLE, book.ISBN, book.QUANTITY, book.EDITION, publisher.NAME as "PUBLISHER_NAME" 
FROM dbo.Publisher publisher
INNER JOIN dbo.Book book ON book.PUBLISHER_ID = publisher.PUBLISHER_ID
WHERE publisher.NAME = @Publisher_Name
GO

EXEC dbo.getAllBooksFromPublisherWithName @Publisher_Name='Canongate Books'
GO

DROP PROCEDURE IF EXISTS dbo.dismissEmployeWithID
GO
CREATE PROCEDURE dismissEmployeWithID @Employee_Id INT = NULL
AS
UPDATE dbo.Employee
SET ACTIVE=0
WHERE EMPLOYEE_ID=@Employee_Id
GO

EXEC dbo.dismissEmployeWithID @Employee_Id=2
GO