DROP FUNCTION IF EXISTS dbo.getSumOfBooks
GO
CREATE FUNCTION getSumOfBooks ()
RETURNS INT
AS
BEGIN
	RETURN (SELECT SUM(QUANTITY) FROM dbo.Book)
END
GO

SELECT dbo.getSumOfBooks() as 'Sum of books';
GO

DROP FUNCTION IF EXISTS dbo.getTableOfBooksByCategory
GO
CREATE FUNCTION getTableOfBooksByCategory (@category VARCHAR(255))
RETURNS TABLE 
AS
RETURN (
SELECT book.BOOK_ID, book.TITLE, book.DESCRIPTION, book.QUANTITY
from dbo.Category category
inner join dbo.BookCategoryRelation relation on category.CATEGORY_ID = relation.CATEGORY_ID
inner join dbo.Book book on relation.BOOK_ID = book.BOOK_ID
WHERE category.NAME = @category)
GO

SELECT * FROM dbo.getTableOfBooksByCategory('Mythology');
GO

DROP FUNCTION IF EXISTS dbo.getBorrowTimeInMonthsByBorrowID
GO
CREATE FUNCTION getBorrowTimeInMonthsByBorrowID(@id INT)
RETURNS INT
AS
BEGIN
RETURN (
SELECT DATEDIFF(MONTH, DATE_OF_BORROW, DATE_OF_RETURN)
from dbo.Borrow
where BORROW_ID = @id
)
END
GO

SELECT dbo.getBorrowTimeInMonthsByBorrowID(2)
GO

DROP FUNCTION IF EXISTS dbo.getTableOfOpinionsByPersonID
GO
CREATE FUNCTION getTableOfOpinionsByPersonID(@id INT)
RETURNS TABLE
AS
RETURN (
SELECT book.BOOK_ID, book.TITLE, opinion.ID as 'OPINION_ID', opinion.DESCRIPTION, opinion.RATE
FROM dbo.Opinion opinion
INNER JOIN dbo.Book book on opinion.BOOK_ID = book.BOOK_ID
INNER JOIN dbo.Person person on opinion.PERSON_ID = person.PERSON_ID
WHERE opinion.PERSON_ID = @id
)
GO

SELECT * FROM dbo.getTableOfOpinionsByPersonID(44)
GO

DROP FUNCTION IF EXISTS dbo.getTableOfBooksByAuthor
GO
CREATE FUNCTION getTableOfBooksByAuthor (@first_name VARCHAR(255), @last_name VARCHAR(255))
RETURNS TABLE 
AS
RETURN (
SELECT book.BOOK_ID, book.TITLE, book.DESCRIPTION, book.QUANTITY
from dbo.Author author
inner join dbo.BookAuthorRelation relation on author.AUTHOR_ID = relation.AUTHOR_ID
inner join dbo.Book book on relation.BOOK_ID = book.BOOK_ID
WHERE author.FIRST_NAME = @first_name AND author.LAST_NAME = @last_name)
GO

SELECT * FROM dbo.getTableOfBooksByAuthor('Miron', 'Kita');
GO