DROP VIEW IF EXISTS dbo.BORROW_WITH_BOOK_AND_PERSON;
GO
CREATE VIEW BORROW_WITH_BOOK_AND_PERSON AS
SELECT book.title, borrow.DATE_OF_BORROW, borrow.DATE_OF_RETURN, person.EMAIL, address.FIRST_NAME, address.LAST_NAME 
from dbo.Borrow borrow
inner join dbo.Book book on borrow.BOOK_ID = book.BOOK_ID
inner join dbo.Person person on borrow.PERSON_ID = person.PERSON_ID
inner join dbo.Address address on person.PERSON_ID = address.PERSON_ID;