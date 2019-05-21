DROP VIEW IF EXISTS dbo.BOOK_AND_AUTHOR;
GO
CREATE VIEW BOOK_AND_AUTHOR AS
SELECT book.title, author.first_name, author.last_name
FROM dbo.Book book
INNER JOIN dbo.BookAuthorRelation bar on book.BOOK_ID = bar.BOOK_ID
INNER JOIN dbo.Author author on bar.AUTHOR_ID = author.AUTHOR_ID;