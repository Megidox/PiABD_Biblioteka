DROP VIEW IF EXISTS dbo.BOOKS_WITH_OPINIONS;
GO
CREATE VIEW BOOKS_WITH_OPINIONS AS
SELECT book.title, opinion.rate, opinion.description, person.login
from dbo.Book book
inner join dbo.Opinion opinion on opinion.BOOK_ID = book.BOOK_ID
inner join dbo.Person person on opinion.PERSON_ID = person.PERSON_ID;