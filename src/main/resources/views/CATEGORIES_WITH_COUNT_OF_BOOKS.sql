DROP VIEW IF EXISTS dbo.CATEGORIES_WITH_COUNT_OF_BOOKS;
GO
CREATE VIEW CATEGORIES_WITH_COUNT_OF_BOOKS AS
SELECT category.[NAME], count(*) AS "NUMBERS_OF_BOOKS"
FROM dbo.Category category
LEFT JOIN dbo.BookCategoryRelation relation on category.CATEGORY_ID = relation.CATEGORY_ID
JOIN dbo.Book book on relation.BOOK_ID = book.BOOK_ID
GROUP BY category.CATEGORY_ID, category.[NAME];